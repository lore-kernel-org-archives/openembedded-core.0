Return-Path: <alejandr@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0067.outbound.protection.outlook.com [104.47.36.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC067886D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 21:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=CQ8rxRDwtlIEoP/W1txgYcv/8KXuoa0ZI1mQujHP+7M=;
	b=nIgDZrFzyrzD6hPPHT4KTrCl1bzMT0UgnQr4YizXejs4/A7JV0hzSZzWRUXkP9DwEPI4TUKTCeNpdRHUiKA+ctof+rO5XYSUybnnx7iIGlH5UF/XJvl7m3VrTJ2ihruhxP9rKx+bcXWCPH7XDdK5UjqqUoCXVH1oQz99+SUppBo=
Received: from MWHPR0201CA0077.namprd02.prod.outlook.com (10.167.161.18) by
	CY4PR02MB3381.namprd02.prod.outlook.com (10.165.89.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Fri, 2 Feb 2018 21:22:48 +0000
Received: from CY1NAM02FT005.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by MWHPR0201CA0077.outlook.office365.com
	(2603:10b6:301:75::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.464.11 via
	Frontend Transport; Fri, 2 Feb 2018 21:22:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT005.mail.protection.outlook.com (10.152.74.117) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Fri, 2 Feb 2018 21:22:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1ehinG-0001wI-Oa; Fri, 02 Feb 2018 13:22:46 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1ehinG-0003F0-Lm; Fri, 02 Feb 2018 13:22:46 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w12LMjIN011077; Fri, 2 Feb 2018 13:22:45 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1ehinF-0003Ex-Ax; Fri, 02 Feb 2018 13:22:45 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
	<20180201223257.15539.41169@do.openembedded.org>
	<MWHPR0201MB3401497FB2219F33ADADA13FACF90@MWHPR0201MB3401.namprd02.prod.outlook.com>
	<CAJTo0LbLxeJEGu=sTpg0uXWNRue7FcFuHMc+qbb1zzDe2QH_cQ@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <1fa84e7e-1032-906c-c25c-136f0a52d695@xilinx.com>
Date: Fri, 2 Feb 2018 13:22:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbLxeJEGu=sTpg0uXWNRue7FcFuHMc+qbb1zzDe2QH_cQ@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(39860400002)(376002)(396003)(2980300002)(438002)(279900001)(3190300001)(199004)(189003)(28163001)(5660300001)(53386004)(106002)(229853002)(6246003)(606006)(77096007)(84326002)(26005)(186003)(336011)(64126003)(9786002)(31696002)(53546011)(81156014)(81166006)(8936002)(83506002)(270700001)(4326008)(575784001)(65806001)(31686004)(54896002)(2906002)(236005)(106466001)(6306002)(36756003)(93886005)(19625305001)(63266004)(65956001)(65826007)(356003)(33964004)(59450400001)(16586007)(478600001)(76176011)(316002)(2950100002)(37036004)(58126008)(6916009)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3381; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT005;
	1:w/RWRb0DJ6u4VQ2hru5fnQNa8lJ1GIIPV3M6+leA4oOgKJUcMs1c+lSEJulVK0euq8Qj9rmLo/7fbbj6f+5n3cbDypVYYNCvcAqWqOxbguYGst7FXLu0qMFYFhQeDU0W
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24176a04-11be-47a4-a157-08d56a831b5e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	3:7TW5MwX3iPz5zKdemC42zrxuAWaqF7PoroBvqmLaObLQ6UDSM5dPHD94RmsQhNmBNKn/R5oEgZb5BLqHYGDI8OjBmYTBlJDwAPlt3cg5AtX2J2XTqSwxBZW6ZQ1dRSGe9vvVWcp75NOqW7npHFZkid925IA2FBPcpQKPsCb6fJ7tOOTpokniAvmVSPvKkUbYHyloRWkEKCTUHavrozObTKszDq7s/b60Y5AkdC495xRdhqiyWuxx9k3E8f3/ZNthUf8e48gSuvwPWNP+Ko1KWjHASCB9tHsxrZgYqLWbYYQj1/CefTWgzf8NeWQeeXjUxUyIjShlwaEcZ6abJ+KLwVlp86cT2jX3yUbfVxrJou0=;
	25:Zptd12sO1EWZ/fjrng5uC/13bZ72lZbwbtewrkq2Yl/E8W4Z4nsjgxmFmgjaPlL+/j90IpWIjEnqV6filtPlCGASEfIPbi3uRXbQpIZvUAR3xiNfboadIgQOIcueGH7xJmp7gZtOnHlIgy9TYOL79xe2d6J8hPCdhWbwxVu264yjDEFx2Yl1IZG7Xe8Xcotho6xIsejO+BrggIe+YtBfHZ1MB0F1r7Jil0RmqUkMblluRNe8b4g2nGjA9t58LAfEZ575PQbFfmYiChCN5Gm0fwAgdGpNxvNustSdKkDM+MxR7IqAkrhoX/Wg3WeMcfC1nC1hCeKDZEAHOmQCSz8KUA==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3381:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	31:UA5hwHsO+SANYp83gQ/mpoHjOlXSuKWaiCVssJrOxcYbXcO82OVHA8sli3U0B4e8X/jOyFgyqhD7NK+2zjqz0WjTKvB7xZuKIVwsa1B37hFc9OeAo5kI2JI+cENg5wA6BMm279SU2lrGcrWhM4VpRkzi3JRmE58JGsTFTlNp8CwtkJX5kZZkACyvTqQ1Tn3KZzedkciBANb43MPK8lZGVpK/2YUxuoBeLwnWwVzkYCc=;
	20:qUT8uW1SfRC0Y/SrPOIuOvO3H1Ma+6O4oYpvO/vtgKM0TJma+AFV707piEWVLN2sx7C7wbs7oQKBCC9qe+67DJbAWOc6c95zTiWRGb3zxjoUzEjL6+Hkh2cV1MOjxY+hL0Cb23vla+MRu8O7YcdjjRB/Ur+LoXReYUMkv7a3xmLpK+uFxE5EijnW2d3lS8pVdSbMDZkt/3JZ3GNZ8Yjkkjt6X2YEkv0mGUNMelbC5wfjjsWf/PwTD9kOz6MI1LWlSNdmrla3pSZoUcn/CYhWPeEpmSdNP7XvVMlB7XmvxUN78O28G7qZ4e+xqDGZkjjm0HpQbmGqnbV5QARzfNld6x5yQ14tcvNuFWDO+1Wk5dwLtpjd5o06xEXvD6AMuCBSaDdRbK2QWWGRrgqvbjcks6Y+kVZpbYm8svs4RxZhhbQfcz88j+PjnhnQIZZZw6LO4cRomDW9riVh4BC6oBL6hTJ5IF9+REv1hlzb2gFCRiBPVN/+mC5XZZWhSiYyTxtF
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB3381EA0A76587B48CF1D8934ACF90@CY4PR02MB3381.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231101)(2400082)(944501161)(6055026)(6041288)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:CY4PR02MB3381; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	4:f4usd9eV7kMlIPZOSPmn/O9mUqZsTzH8YaZdOLmg/XodYD21E0FDPvqASWo+AwSzv7cnK2HT8IrJEXBiF73IeUQObC9ap0yQpbb2mC6fQrRK2L6RwR/G6nUHGynn2yhyux576zSxCHDZY+pFvb1tfrih2KXLA6scpwo555GBp/oGPcx9YD+kVsbbgFOD2auYxkDW9bPyzCHycwnFBFoDKv3oYXHKoqHAGwzswjfcGunavWJT3wZ/X5ltnPhzn9ObW5Lsc/+lweeBuTvXOpYnPdV1HUJg/usUWpwGkVxM6SGpKeAmPgj3ON+9ktYz8Vg7WBDtQJZ4djFaLLw2dL2eKjsxpoDrCIomdOVNxSIMebs=
X-Forefront-PRVS: 05715BE7FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3381;
	23:CZnnGNKYb7eoXx92QzXNI2rpQbVcbBsJYVxXD2rd+?=
	=?us-ascii?Q?oXhLQ25LZtfZwVcVeKRk2vYmetZ9Sz2PE2EEBwl7o9xkyKIEOu/kGjbq1jS4?=
	=?us-ascii?Q?LjlU5dCi++aEbCOocwD0zua5Vt8c6CESzgE4XLGPQdarVxm2f4uLdg/xZq/H?=
	=?us-ascii?Q?tmV8WpUvjjsrirw3sOEbWkMFZezp7y08LOyBnNUdBcMHDoy5tyjQ/JvDPPwM?=
	=?us-ascii?Q?najliXCMCY7czY5o15srMG0wgkobPTCWFlHlf0zMTrrQ9UtHEgwgAfzmIg1Q?=
	=?us-ascii?Q?eM5dGRlw0Rizu6p3SXpuFqLC8tgr9sim/KeO6jGsiQUEW6inFri4fpzfBOsq?=
	=?us-ascii?Q?+E21KG9JUxhs4zc7xaRRKsGuQOKW2SwQWrQY5/I/qkdzlFBcjbP6lJrobuxN?=
	=?us-ascii?Q?Su7tCCpXeU/gVRBJM9cgdzeo2MWNltBipoDm71hqb/9f/nAML4ULlu/xUgYC?=
	=?us-ascii?Q?Gmn71gbq5SMyO+QtE8BnOeaOBuzoyjV3l4BujKo/T1ufSWveEs7V1KUVCJp/?=
	=?us-ascii?Q?EeRFLz82NRVj6sGrcksZOx1g9ZJlXFj6C5uclSYNiOXrm03AhSEhmrMmIPaQ?=
	=?us-ascii?Q?pRLpLMATmjj7SGDGThJL41/EMk4ANhU/J+lvDcOouogOoz+CXYavG2656JRK?=
	=?us-ascii?Q?7aPHt2m+Oc9oZy4jeBGy2PXxO1670OnxbvbZmXeyPk/+rdSuXFv51/UTc1/V?=
	=?us-ascii?Q?E9qfbhBjwDQoazAR7+VlGtQ49iGDs+r3WXbBgygzY3z37HM5ywsENojVZsPD?=
	=?us-ascii?Q?Da9qSp7YHytfAKiA9xwpUR+ysfkjXjJ/1cDDGCCAMuuWIb3rg7Zm01sj7uo5?=
	=?us-ascii?Q?0PhPfSzL8yqyv/S3f7pRnchIoYkxMQXGjRPBNcOwofo0JqaUeO+624EEUe0v?=
	=?us-ascii?Q?jHbEcstgtfMi9bGnepzEce3FI7o5D+NvkpHHqHLzFyBF86FMICBahTBDvZEV?=
	=?us-ascii?Q?w1n2rInvFxBjyXRWGOfIoi+Kdm4rkYEUcdsZbjFAgTCD3qDmcCewxNm628Rj?=
	=?us-ascii?Q?9Ab0QNaMMulrT1n7SYVpMuwqe3XKHrWA1XOI2SiYDrpJIEBqOwij32JSzx0D?=
	=?us-ascii?Q?7UmwIsAKjtVw7FtZ1QqGvdCX1FEkWi1uE+a+meU4vX04SS1w5kQ79t/gRtaJ?=
	=?us-ascii?Q?N5eGjhvrO6hG1v2x+FbMxLDCMsBG1pC0QLyYe4IyeU4tGPph9q+4ZbT04VAW?=
	=?us-ascii?Q?N5AhcuzNXoftTo8YEHqlKLsQ1+keuzC1xVIPBFvmX4pMi2sIkB7UPCkwz8iM?=
	=?us-ascii?Q?TI4tDQN4LpyW4ahNVZA0a49NqChTZFp3t3LHIxLPF4Lg9I4CjTLuMveFDSq8?=
	=?us-ascii?Q?za8T3l0b/fUSKmJIoXR1ejWCQdSO5STQFL2exLSrE1dq5gOcKzaEynZssqEy?=
	=?us-ascii?Q?QLuJA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	6:Kw6gC9II/P0WuAwj0+As04TERsRPQneNXsrtBX+4L4KXQsYKmqKDVtGaYXNX4bSXw/gCFfa+Ikj+9pScWvkPOoqdyZRNlNRdMj2SWeYwlgfnKBkFQCRF0xd8on5sQhuLunawZ1NIQTRkFrxkvvMvIUkLjdmGy+V6Wnw6OZZ5bpfx51CYWAmPf9pIC8iWMAKL5dXiy27NmSLEVxAJ6qvoiw6CJd7EOHQaCQsuUMNHgg1QwzBDd0aLBWHuOLmlX07/3+16A/BvAZutWaILPQl7g22ekIfC1pIccBAXZ4eqzJVmddkVXRBHUJUGth8fagChsN+aE2Nmwyc4EFDGBexFDXW+XGVaSrG7g51R9daHVDg=;
	5:S/I7ZMoU3RiNp/MTLc0PDRrI3RLOs6oh6yXow4ok1q70MAsgIRTBASgNdQzUDCLpUu6xuwEM1C5dTyqbOimgM5ewWBrbp+92rhZtfFU8SanhULZgxVsqfjsD4yoToTdyh1nbOlIdbvx7Y63cE0JH4qqZYM9skjOwY02EgjEIhak=;
	24:tGHQOYGlRwjX9i6NJLrlRCC+tJRczsn5Alv3VRwjm8eN4r0zj3ruKOqnmgam+eYgzT+NVDeS19/Bj4FZ/t1tp7MWcBWf5Pa3/RHrxh23Iuo=;
	7:D6VlBRf/DdDgXBBCo5cqnqMLZc43X0x4N7EGeUwHRzOirp8kZB8aBiwY1qms4EK8LZdVfpl1MO1oGbZNF2lrB4VgqGL4hcXgOVDTVHiPMewURvN4OC75ZfNIciEGTTReL7JDnJU65h33W4gD1y9cCTxcrVQlbhJtIGDSlFn8RReY/fYXYbKrD2sD2BPMcvMDz39X3qZaty5MVjnPp6o1raOPG+/2bJILcAjbu0ZMVbmarVZJEXC652EAjuRZYU0P
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2018 21:22:47.2895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24176a04-11be-47a4-a157-08d56a831b5e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3381
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG5pbmphOiBVcGdyYWRlIGZyb20gMS43LjIgdG8gbWFqb3IgcmVsZWFzZSAxLjguMiAocmV2Mik=?=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2018 21:37:37 -0000
Content-Type: multipart/alternative;
	boundary="------------3A189D867D34D00161C4E8AF"
Content-Language: en-US

--------------3A189D867D34D00161C4E8AF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This is what I got:


$ git remote show origin
* remote origin
   Fetch URL: git://git.yoctoproject.org/poky
   Push  URL: git://git.yoctoproject.org/poky
   HEAD branch: master

latest commit:

bca260ef4dca87c11fc9d30b2b8a17664dc2d879 ninja: Upgrade from 1.7.2 to 
major release 1.8.2
385944254d0ef88bd6450a221a54cbcb40020b42 tcmode-default.inc: drop 
preferred version of gzip-native



On 02/02/2018 12:58 PM, Burton, Ross wrote:
> On 2 February 2018 at 19:06, Alejandro Enedino Hernandez Samaniego 
> <alejandr@xilinx.com <mailto:alejandr@xilinx.com>> wrote:
>
>     This makes no sense to me, I rebased to master just before sending it.
>
>
> Are you sure that the master you're rebasing is the actual upstream 
> master?
>
> Applying: ninja: Upgrade from 1.7.2 to major release 1.8.2
> Using index info to reconstruct a base tree...
> error: patch failed: meta/recipes-devtools/ninja/ninja_1.7.2.bb:1 
> <http://ninja_1.7.2.bb:1>
> error: meta/recipes-devtools/ninja/ninja_1.7.2.bb 
> <http://ninja_1.7.2.bb>: patch does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.
> Patch failed at 0001 ninja: Upgrade from 1.7.2 to major release 1.8.2
>


--------------3A189D867D34D00161C4E8AF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>This is what I got:</p>
    <p><br>
    </p>
    <p>$ git remote show origin<br>
      * remote origin<br>
        Fetch URL: git://git.yoctoproject.org/poky<br>
        Push  URL: git://git.yoctoproject.org/poky<br>
        HEAD branch: master</p>
    <p>latest commit:</p>
    <p>bca260ef4dca87c11fc9d30b2b8a17664dc2d879 ninja: Upgrade from
      1.7.2 to major release 1.8.2<br>
      385944254d0ef88bd6450a221a54cbcb40020b42 tcmode-default.inc: drop
      preferred version of gzip-native<br>
    </p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 02/02/2018 12:58 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LbLxeJEGu=sTpg0uXWNRue7FcFuHMc+qbb1zzDe2QH_cQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 2 February 2018 at 19:06, Alejandro Enedino
        Hernandez Samaniego <span dir="ltr">&lt;<a
            href="mailto:alejandr@xilinx.com" target="_blank"
            moz-do-not-send="true">alejandr@xilinx.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">This
              makes no sense to me, I rebased to master just before
              sending it.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Are you sure that the master you're rebasing is the
              actual upstream master?</div>
            <div><br>
            </div>
            <div>Applying: ninja: Upgrade from 1.7.2 to major release
              1.8.2</div>
            <div>Using index info to reconstruct a base tree...</div>
            <div>error: patch failed: meta/recipes-devtools/ninja/<a
                href="http://ninja_1.7.2.bb:1" moz-do-not-send="true">ninja_1.7.2.bb:1</a></div>
            <div>error: meta/recipes-devtools/ninja/<a
                href="http://ninja_1.7.2.bb" moz-do-not-send="true">ninja_1.7.2.bb</a>:
              patch does not apply</div>
            <div>error: Did you hand edit your patch?</div>
            <div>It does not apply to blobs recorded in its index.</div>
            <div>Patch failed at 0001 ninja: Upgrade from 1.7.2 to major
              release 1.8.2</div>
            <div><br>
            </div>
            <div> </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------3A189D867D34D00161C4E8AF--
