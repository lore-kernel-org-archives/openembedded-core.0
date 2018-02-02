Return-Path: <alejandr@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0043.outbound.protection.outlook.com
	[104.47.37.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2834B787DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 21:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=auar8A/EAPyMkW/HrX3xI2CjsG8ebzfjTIe5Vel2G+c=;
	b=kYCt9O5+lFVzjsDYCrile/0pcAlG+Yrv/gqDI0pi3D3kwSGX2Wd9cC8ZB8of/o0h0DxqXpOKHUGzEaBEQeLUsxs9rOnD4bBtbgOdYFy8FRNFa80YDLlhKcZSUhcOPHyjkz2RqNXZVQ6qWPTclkA7vkG1RHVluBM28ggxRp12JiU=
Received: from MWHPR02CA0006.namprd02.prod.outlook.com (10.168.209.144) by
	CY4PR02MB3382.namprd02.prod.outlook.com (10.165.89.153) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Fri, 2 Feb 2018 21:28:53 +0000
Received: from SN1NAM02FT020.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by MWHPR02CA0006.outlook.office365.com
	(2603:10b6:300:4b::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.464.11 via
	Frontend Transport; Fri, 2 Feb 2018 21:28:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT020.mail.protection.outlook.com (10.152.72.139) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.464.11
	via Frontend Transport; Fri, 2 Feb 2018 21:28:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:33809
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1ehit9-00072C-Ue; Fri, 02 Feb 2018 13:28:51 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1ehit9-00040j-Rf; Fri, 02 Feb 2018 13:28:51 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w12LSoOg016914; Fri, 2 Feb 2018 13:28:50 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1ehit8-00040X-GO; Fri, 02 Feb 2018 13:28:50 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
	<20180201223257.15539.41169@do.openembedded.org>
	<MWHPR0201MB3401497FB2219F33ADADA13FACF90@MWHPR0201MB3401.namprd02.prod.outlook.com>
	<CAJTo0LbLxeJEGu=sTpg0uXWNRue7FcFuHMc+qbb1zzDe2QH_cQ@mail.gmail.com>
	<1fa84e7e-1032-906c-c25c-136f0a52d695@xilinx.com>
Message-ID: <bcc359a5-5ba7-8cd0-d9c9-767f20114d39@xilinx.com>
Date: Fri, 2 Feb 2018 13:28:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1fa84e7e-1032-906c-c25c-136f0a52d695@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(376002)(346002)(39860400002)(396003)(2980300002)(438002)(279900001)(3190300001)(28163001)(199004)(189003)(65806001)(26005)(9786002)(6246003)(77096007)(36756003)(336011)(8936002)(31686004)(81166006)(63266004)(106466001)(4326008)(81156014)(356003)(5660300001)(65826007)(19625305001)(270700001)(6916009)(64126003)(2950100002)(31696002)(53386004)(966005)(2906002)(37036004)(16586007)(316002)(478600001)(58126008)(83506002)(606006)(65956001)(6306002)(236005)(186003)(84326002)(54896002)(59450400001)(106002)(33964004)(93886005)(53546011)(76176011)(575784001)(229853002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3382; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT020;
	1:06h8+dkzjfPPeY8Nu6BH/CRRiRiyqEq9XIhtUPAcBogG52pkXjhQZ5CvUY5/WyI5muocLsbjxmjpTiDPL1dI/xu0GIAgOXBHY+6LcJtmhrdfJDi7Xg/j3eqUOAvTsY3u
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8020485c-fbcd-4466-d934-08d56a83f4fb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	3:8GjR+g1oZGzgu7X67TIuWpZ38hYlMcjRf46Dbs7PZVgUwiykOSfBdNiivlr+AQm+50aiFjm1dhsoO/STOZ8Gr3SZQUNoZ0vr4CidE+XeKtV8J0XUfp9P7XJ6eyI+gWQJG/6M/XAT7SPkIRT+KWTbRbKZY+u58ov+zDNHJr26xvRAiiEt9hve3I0xXQOZQ8hQj/Frev1Ppg+ngW/YXO+0wjOIH511h+3X1SS8GyxnfSH0kPKDhhuPIIN/zA4N97TlXoXPgfAA+EF1UYgj1dcVkyB3uyFVQvIazrDwzBBH+Iv58M8UX57SfxoOGSML8rXH1+jlkV/kX/79IqWgnJNOMc6NECMDLBGqHoqkGEFOlt8=;
	25:pbxCwgmnzBDq9UFGYSagiHCZ+HNEh5wJ31IRXbxiwJgtZrBp4ZJ9fULwsN2h+eUbIyU1Mh3kIeSrnStSoNBYPc0tpcXe+GYYBQUI+Gf4IhkVOKpOYux/DDrI5VqlEn1ErKR4LJVVYahkepIl2HtOUyQmglP9knKz7NBpo+nDsgzb12OSKfI2juZyrM9XhLjWRD/dAyvsTUSn6SkA5ul+VrgH2+QizZG48ePHt6Y1oSal3CI+m/KvwmLt4d+JKk0lst5jtaMSBO5uyIWac6KP2IA/02GK1U+LIKzB37U74IUjcgccRvP3s7DMTuYFlF1jG+iDvFUNEhm2xTRiKmeTHQ==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3382:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	31:le850Xs46tt8OIsqgEt2131LnzqA9Ti4bJHpu1Ats7m6Ph6hjjIkB+FPxOaBTsXTM+yOiMVVSvvqZVtnzu9qf+hOIuogu78Z1xRZi6ijsUUz/BdI7Jwcmi+XVEyCv0ojWLFRvLkVTf5W5U1G453VhIVWbMIhWFiUNTtiN1Wr3XTatcHkxCJNC7YaILOb1fZbuOYU9q7rOiNthAMLgnuUfLbMgS8NzOouA0lXtDqI+O0=;
	20:HjFuAiu75nKp5R4Qxr+5a0SVxSH3JJ5hzWhFv7JCJu/yKyUATgPDG46aeurnLoRXZTS1hv09FgWoV/zzJG0sgFr9trAbkFVBKVyc/6JbuD+Js29ACWIZrCCvMQMEcJNAM904p8b6OTG9f1Fq9x7qx1xEJBiQ4BEhvnuj0jCDT4LJnX6X5frFm93fa4sz244jx2JTUeXnqzbTJZqEJIkXbbZz0V+J+6gfCdaG5a7a/bwprTzJcJY6+L7eIx8K+NJyKwFEpUF/dL4AgxekWl1U/dl9u90hHRbvuLLOiMUyogRHhMJYPi/E5HZF0ZXOY9Y5/bi73l/pULmj1xdIc2iZ4wdli7HYT0pWgyUy518AbbmDTRSiWYl6azuO84gUg3AmWsY+/bx8Qrp2VBJLkrKBIqVCP76yUQ9EWxeldeJVQHmHHnGam003jX2cAYltQJIABKpx5KS6SX8XgJtTiuYkvnFspEHiQoQv2TGTf+WTbvT1Z5kx98qjMHzgNNDC3bPd
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB338255B3DCA596E8602BB6BBACF90@CY4PR02MB3382.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231101)(2400082)(944501161)(6055026)(6041288)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:CY4PR02MB3382; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	4:8vFR5/s2xHWzmlvOHAEQ7x9Mg+a95PF2UxQD1KrcoibqSU7kfvthc3LhIcUyVgDOAvyNp12xlVBNIacWlchC8eWav/Z6ONevv35FJ00J+KB+IteYjmrxbH2KcTIQdnnyjhlD3Y97s1RZKeKm7LHYxib8ju+y0WECOvtm+jlV6l9AIcuVLt81VfgCawiYSk6UrqyfgxwDQcxoFM0CWUpRCvNHTgkUXGr3Y01igPNhGamkENyJ/UjDwJIhML6VoodUbxCsmg7o8j83SouVZrOP5VIJaTKRXb12jLa5t97s9IrMeOuja0KaWqXwUx3vLlGbC3GgRvftgYn0N6uw7HOuiVMX/KWMYyYZ1nBSWth2jCg=
X-Forefront-PRVS: 05715BE7FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3382;
	23:RLSmMeoYHdWrZX41GUUv/EcaqwiS0eqMg75Rhpe5a?=
	=?us-ascii?Q?QlaivrjDCov/C9+5oPye/hyLa5QGX4WEwpgqP17hXrxWWDDTAwcrKrtiJ5L3?=
	=?us-ascii?Q?jIn3h5laz3I1BHYzM29ii0e+EU+yT/Z3jk4HKvaadZ11zwVZDrl1bRMqp9hH?=
	=?us-ascii?Q?UDijUxeJ8x4SDKL1N/0KSrcyyM8H2/rJ8VKuf/RlNvpq6lswdLyfWyJ39nP6?=
	=?us-ascii?Q?TAS2Gygl+Ga6/R1p08j5sZgAhTvR+wEB1IovCeG9DYGrmCLIdTO7rMAaFA1i?=
	=?us-ascii?Q?5mQyyaDc+DjtbIiqP6no50M1IGBZxLbr807XPy2bKMDBXodsHjHe9aMfdIWt?=
	=?us-ascii?Q?z19t86zMOIqvv0JpUjF+qLvYAyttpyjSIfL0Xl/CLChux4/9LRlOCZOqEOo6?=
	=?us-ascii?Q?g6RO9+u+RPkkvdt20ze+X4dJ0vAZf88SmumX0Bk2ytdMLofGC5l884OGGxTO?=
	=?us-ascii?Q?ZWVXUTWNHXjjsIvFY5BsUcj67jX/0vxq9jvt/P1luMK/TlEANHnFfkLYSvFV?=
	=?us-ascii?Q?Y5xSmoAFe4KVBkWO/85omIFbgPQMVjZdSH04HUpUlmiWMNjihHXUx5dgr0YM?=
	=?us-ascii?Q?ht1/hUhDR0TbruOCZccQDKLwYkd98chd7HjKjA8o5jR8FffKvvMrFg6G4pzf?=
	=?us-ascii?Q?eKe9o7BBSRZZkqHYD7a8P8O9dWi1Fp4AeZbkwoXrcxbyyCMXM3poJq9aTmGK?=
	=?us-ascii?Q?AVhsd4BEVK9lwn8OUDWtwZFclXNh3b5JOVxHm7tpz6ibmCxj7vbY45g30lCd?=
	=?us-ascii?Q?R3WZ9SR2QvwWpR1Oc3pstyw08VZCUoiZGdg+KetR73rgZcPfKQPtp0o9fVEo?=
	=?us-ascii?Q?H0vLoNm3OabgsQKZ/WvCe8VFvVJzEkQCrg4FJmdZD48dzLOox0DSfcwLIIcU?=
	=?us-ascii?Q?23FPqnDxwmfXoqhUOg+vsXCk/Et9eL5Rxg9BkelF48OJE4h0BKa65916RdF4?=
	=?us-ascii?Q?upVcrqIpNTNc9eegpRUtf7kHq5J6eb9euR0mF9ms56SeAxsCm38lav1Wo6G6?=
	=?us-ascii?Q?Jq3NTzf7cxrM3NZpLPlmJk5gLB0c02NUZPu1b+S5AhgA4DfOyO29wABWWinZ?=
	=?us-ascii?Q?QYHn2bny9TgWnh+poDymfjjjumbTTIQHeWM5cxM7I11EkI3PSmUEeZ6SN5xQ?=
	=?us-ascii?Q?UCx+YuuXBpVDMdKHGZZMhFkSeqPRkpUOcIg+CCksSG4zfM14O2kefTFspQ5D?=
	=?us-ascii?Q?U3tpPyLscBs0+YSCDMLFnI8egQNqtuEhZD10ad+YMd2GtPwrmBaUnXGm/LgL?=
	=?us-ascii?Q?s0TIYYo7UCbzQT6Giu0HN7QGRkjK7tsr3b9gsCQvaEFxAyh4qA37r07vfzT5?=
	=?us-ascii?Q?K+LNtSCq9l6pOZ540X//6niEY4ejRQHRETP17aPM688AoNM5BvcozHOBd1AH?=
	=?us-ascii?Q?vunbmwp4v7vE91X9fT/o3Ea+LvnW58y0dnRVJeaHnVFsOWH?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	6:5MuoAiLNxkXXrtcLmb8TQuc1Bo0tXA/le8G2OY4GVTrasW7fg9+8Tf7WXGwEjNJCo3pl+mQE13p2ux96j1X8KJq3Nw3VfU/fB/lPY2l8MfUfbQ1sAIAGSRBWaH7D2L3oqAglnDqQ2dx/f/Cc9cShnZH/8jpNLsvWEU9dInhrOKG/vIlQg9czbmSZV3v5lrOADVAuBTZjK4/DX0HG+BZfG/mfUQvsFKYc+a2u3wSKEwKF3VSeDrCr7MgNOZ8z/PbywVfM7lfZPnm/6UqJiJP5+BXygb5ya/i9g8N5bQnDomvpkAiDHNoZ+YrWtSbKxaUq6yBmiV3hpwPkF/DUoGJ0CiMGpdbfkKISOqvf52/w6XA=;
	5:4okot+NQ3M7wtqBNiBA22MSVGB6upIuDnGAjKRm76Ykwz+fpQGoNd7ZybZMJXxxbLaSKUzVSZX5vntRZ3Efg6pTibXkM864n36ZKGqr/TVHTwVUs9EHHXUOIOi0snt1utzWLAxwxZ7e2IZRrZHSzOCkUOeBrK0lodlFsIaZTz7M=;
	24:Xr+iPYpeZUb0DzMoU2yXJ/Y1Bk22RAXaAgTMiRFOFTU7S6MhznA55qDm76TvzNnwobfBZTbdCAOQvR5eLXvREo0sj6P7y9eVzqZ/aH7jgWc=;
	7:6Cll/IzVc6EtIGLTI9qFj3WYXlvw+ItmwepEHkvOpa/eVbLi+dsMjIUNmLZwU21FID96UoVx+oq3tLyenQ3Nwai/cExQZtYyYz8+g3v6OzO84+/91fYvncEMpN29ynHItAMnxplByR3sMn0QzZgTXC8WjZaqQkggUUZwwaf9cfp9pazJadBfAZKy17q2HgJqwK2N1BJPchAtjrmZSDEply+IW8069CByHFD/gyp5vlIPSB2r2rPl6IpPPDuVurX8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2018 21:28:52.4480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8020485c-fbcd-4466-d934-08d56a83f4fb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3382
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
X-List-Received-Date: Fri, 02 Feb 2018 21:44:16 -0000
Content-Type: multipart/alternative;
	boundary="------------535B249575A74F04A2EB2EA0"
Content-Language: en-US

--------------535B249575A74F04A2EB2EA0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I might be wrong but you can check it here as well:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=aehs29/ninja


On 02/02/2018 01:22 PM, Alejandro Enedino Hernandez Samaniego wrote:
>
> This is what I got:
>
>
> $ git remote show origin
> * remote origin
>   Fetch URL: git://git.yoctoproject.org/poky
>   Push  URL: git://git.yoctoproject.org/poky
>   HEAD branch: master
>
> latest commit:
>
> bca260ef4dca87c11fc9d30b2b8a17664dc2d879 ninja: Upgrade from 1.7.2 to 
> major release 1.8.2
> 385944254d0ef88bd6450a221a54cbcb40020b42 tcmode-default.inc: drop 
> preferred version of gzip-native
>
>
>
> On 02/02/2018 12:58 PM, Burton, Ross wrote:
>> On 2 February 2018 at 19:06, Alejandro Enedino Hernandez Samaniego 
>> <alejandr@xilinx.com <mailto:alejandr@xilinx.com>> wrote:
>>
>>     This makes no sense to me, I rebased to master just before
>>     sending it.
>>
>>
>> Are you sure that the master you're rebasing is the actual upstream 
>> master?
>>
>> Applying: ninja: Upgrade from 1.7.2 to major release 1.8.2
>> Using index info to reconstruct a base tree...
>> error: patch failed: meta/recipes-devtools/ninja/ninja_1.7.2.bb:1 
>> <http://ninja_1.7.2.bb:1>
>> error: meta/recipes-devtools/ninja/ninja_1.7.2.bb 
>> <http://ninja_1.7.2.bb>: patch does not apply
>> error: Did you hand edit your patch?
>> It does not apply to blobs recorded in its index.
>> Patch failed at 0001 ninja: Upgrade from 1.7.2 to major release 1.8.2
>>
>


--------------535B249575A74F04A2EB2EA0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I might be wrong but you can check it here as well:<br>
    </p>
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=aehs29/ninja">https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=aehs29/ninja</a><br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 02/02/2018 01:22 PM, Alejandro
      Enedino Hernandez Samaniego wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1fa84e7e-1032-906c-c25c-136f0a52d695@xilinx.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
        385944254d0ef88bd6450a221a54cbcb40020b42 tcmode-default.inc:
        drop preferred version of gzip-native<br>
      </p>
      <p><br>
      </p>
      <br>
      <div class="moz-cite-prefix">On 02/02/2018 12:58 PM, Burton, Ross
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CAJTo0LbLxeJEGu=sTpg0uXWNRue7FcFuHMc+qbb1zzDe2QH_cQ@mail.gmail.com">
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
              <div>Patch failed at 0001 ninja: Upgrade from 1.7.2 to
                major release 1.8.2</div>
              <div><br>
              </div>
              <div> </div>
            </div>
          </div>
        </div>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------535B249575A74F04A2EB2EA0--
