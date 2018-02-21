Return-Path: <VINEETHC@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0078.outbound.protection.outlook.com [104.47.32.78])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0197872C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 05:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=qAD8uiolxbqho3v1HJYLB1NnROjB+V2suZ8LXbBhC+I=;
	b=OEhFpw/d4BUeAoMzwJiwha0bx4zPzZBMEAhNV9/8MDTMSnJshSl3q4iGvhUqIeVznQks3B/0lWcPgM6Hy9jkZLDeBi3m22ybkwC/NcQj5d97u8aoyOYeN40roFQWpahgIU65oKiNSPPEGSpcwiKtU3hr+cfDwUl8grG8YC9r/EI=
Received: from MWHPR02CA0041.namprd02.prod.outlook.com (2603:10b6:301:60::30)
	by DM5PR02MB3273.namprd02.prod.outlook.com (2603:10b6:4:65::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.527.15;
	Wed, 21 Feb 2018 03:43:17 +0000
Received: from SN1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by MWHPR02CA0041.outlook.office365.com
	(2603:10b6:301:60::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.506.18 via
	Frontend Transport; Wed, 21 Feb 2018 03:43:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT022.mail.protection.outlook.com (10.152.72.148) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.506.19
	via Frontend Transport; Wed, 21 Feb 2018 03:43:15 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36348
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1eoLJL-0006kE-OC; Tue, 20 Feb 2018 19:43:15 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1eoLJL-0005ml-Lz; Tue, 20 Feb 2018 19:43:15 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w1L3h6x2001044; Tue, 20 Feb 2018 19:43:06 -0800
Received: from [172.23.18.73] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineethc@xilinx.com>)
	id 1eoLJC-0005lZ-8M; Tue, 20 Feb 2018 19:43:06 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Vineeth Chowdary Karumanchi
	<vineethchowz.chowdary@xilinx.com>
References: <1518071376-7716-1-git-send-email-vineethchowz.chowdary@xilinx.com>
	<CAJTo0LaD24Zi+uWc+0o0BsNSeEF0Br3Z3WQy7JJnEaC6Jy6vWg@mail.gmail.com>
From: Vineeth Karumanchi <vineethchowz.chowdary@xilinx.com>
Message-ID: <8fe5e43b-6c30-2ba6-17ca-c77cf8cc7ee0@xilinx.com>
Date: Wed, 21 Feb 2018 09:13:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaD24Zi+uWc+0o0BsNSeEF0Br3Z3WQy7JJnEaC6Jy6vWg@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(396003)(376002)(39380400002)(2980300002)(438002)(3190300001)(199004)(189003)(478600001)(4326008)(229853002)(5660300001)(8676002)(81166006)(81156014)(2906002)(2870700001)(9786002)(8936002)(316002)(110136005)(54906003)(72206003)(356003)(31696002)(58126008)(305945005)(6246003)(107886003)(31686004)(65826007)(36386004)(106002)(106466001)(2950100002)(53546011)(64126003)(76176011)(63266004)(26005)(50466002)(23676004)(67846002)(36756003)(65956001)(47776003)(336011)(2486003)(186003)(65806001)(77096007)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3273; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT022;
	1:1DZrTXdQlMwgj9mNNiYzaypa5bUKaznw0Hn9wbz9Wxj7TtnQOmxYpvqtXCV9dqyJvRvx/wv6WU24gKls3A2Hl+KP4CGs05pefaPM8Xaber5tnQnwm2ciOzF5Yo6O+2+O
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a8bb23f-46a0-4f56-2084-08d578dd3d99
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM5PR02MB3273; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	3:k95Hvr7exEOTr6bClgKuO9WubP4zmj7q/fPZ8klS2y5PmFUut1Va5hxA+lTzc9ta6hwAEm/9M360sliobNhc02zLbHV1tiif8qR7Z/lF0c6AJi5AAcECUtuGi0YNq1+ScpshEvljE7QnTnJqI11SAoPpi7ALUmFBFRaLhSka7dmtRgDuL54Qi+IUzdVhPhy7lXOGfhCfDbirOTdPZHyn/GPcH0SHVJFhAG4AnLW6pZ5b8UReKP9Yh+mr/GTpH1ZmE6t2gN34fuyinu8T3aViXgFPoiaYaFD7h8b1TH6EC/y9TgDWghYYK4ZVYGD46fHjBq5k/hzL15vnxvoK3rTr8g4YgCWaeu4O5QLo0OKX3O8=;
	25:FjD/DkqwbYh9nCrvs/yivDnVrPLHfZLm3ZRf54CTwoyrK5ZS5gY+USpXRRoPNFvMXxgv5mjXSYXSOy54En1N1Rq+GmQ8MCVpNH9/cUKrdRs9mSaDATPkdq74Mg0lQuRepDK9xtcno396Wnt/bDwenIsiEpiOc9l6I+YU54Umy6bnGL4cVlS2W5nJk6NH8oTh2GaJa6OWKJVFoxJOKIGhh0qjozgPJIuRRg8DtBJVrXGpgMB5dIPLJgV5cZdY0za5FYRZmWKreDEtBS2MsGQGXzI9OS46l4AMLvMyBT8/BbNogvLCe0ZHosp+5AaxWy8QSZGNCAwpPnETEN8C7II0pw==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3273:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	31:vLi+dq0DD/QQqCpVwLeju5eZDlrRn5+DAKaYS+IJry/7iXYNSIZ9xrMaZ7kphJoU8of2D1me5mwgPk3a4F+y/HNPMZ26Kd5dyY5DqVUFNKKnOptr3e8Qydm2C2TdCOX8PdzRJ0wKfhf9137qPCd7BwCtH7e/mRf6bj8HRZSTc73CdRWX+R33GSf4SmhHrDPwtW3Z37RP3UAyQQ5NTU5EpYJfq+r9aY/+lnGFI69A2GM=;
	20:e5q8YsA1Vu+mFNWJXD78OeFBbQnsATkXreztU4HBDMJ1q5AL5JkKPeZkdD5NhngmSlkuGBDYUsU4fC39svNsW99Msuvp6mP0NncpxyzfB4gRksHCzC9LTGT5tUCMjRJSdbk9KWVL7o2lzuYn2qySBH7MkLfh4fxDCLsUoZBW5uU4Wnl9U/C8dYHhiMOMXv9/NK+UkEckPkN9GHo+DsN9Wx6n6jLb63PM2jkE+LaDkVyL7DWiVyfK3cxeNT4mgSF208sgcXrmp+MHh8+eKYPpqPVNKUMkLY4oGszkhYRUU1hYezA5Xdx1/6rDu2EIdNJtgZyHvi7gPZiuJmO9dnJDR63LRCQLVn6v8jeH1gUaMQQTu5RvvSLDuL3xuIlD2iOah0cEQdUS6E179mKZoeOMoXb1xvzPUchGSNtU8AYCgdQMHB0zWUhOdYhSYzfH7zpyEBqJHZgynaY80dl40nbM6CjXaCv9bieqYed8hypZwW/TL3YOyxN5kZDj1rlF8FWB
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB327337CF8E8E620E85B408C2B9CE0@DM5PR02MB3273.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3231101)(944501161)(10201501046)(93006095)(93004095)(3002001)(6055026)(6041288)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM5PR02MB3273; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB3273; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	4:18nxaADqsaKAb8A/z6AQ/he6IbxRIVor0JSbKjJ1DsIHjrlARrGZ/BloAhhAWqFJzxw0vHgRJAAiR8u59npjZMgHKnOENmgrkmagmwELS2iQMmJgHTpDUPfprZTFh7iEG8niAHdwaCLXjvrb6uRbC1K26Uj5hDISbCQ24+sG4bGBQzuFGf4IOlDEncuYl/vRWxZo+j00/0bZGcEWlqpgI66M/C67RpzRRBV1PvqZ7E81XJ6LCcKHVN3IgafrXhp5Gcj3UtaekH4Pz6PRLHDsAOaaIZc7iVjYPCQypsKU0SAj0fQ+r2wEW+wn3EaBImFR
X-Forefront-PRVS: 0590BBCCBC
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAyTUIzMjczOzIzOnlIQ216RWtVY1krbk9FSjBybjJlalVZV3JI?=
	=?utf-8?B?Q2F0ZGIrQnZnTXJLNFVHZzdPa1AyeDRGKys2ZUdZSjdoZmhQUWQyNWsrQUFJ?=
	=?utf-8?B?UWgvZUFvUFUzWWl0YnVFT3lEMkxiWWFSOC81YWpvb1RZZk9jUnM1Sjd2c0xI?=
	=?utf-8?B?dG1oUTJZUUpTVU5Pbm9sRXZIYTFEQytBMnZkWGhhVlpZWHZHVDJON3ZWOTZo?=
	=?utf-8?B?dlRPZG5JdU5BYTVSQ1J1VW9jTE9nYXFObUVOeVgrenZLZVFFcUZYOTc5OWhQ?=
	=?utf-8?B?b3A3OTZKdVdpUUVlaDFybEJwRkdHT2VCeFNtemdwbnQvREZDeGFNbWc2N1Qr?=
	=?utf-8?B?OXVhNTNrK3NqZVk0VHYvR2xxaUQxZlZYUVJ0bjhiOWg5T3RQbmJZdUZGRXBY?=
	=?utf-8?B?ai8xUWphYVptSVlNZjU2Z0xiQ1pUSkRkSjdaTGNBZ1FQQXdwNGVSVDlnNk80?=
	=?utf-8?B?bHJSZTQ4Y2lxb2VZOVBNMTExUWhWME53WTNkR1BvVTB2VTB2TXE0WkZQd2JB?=
	=?utf-8?B?Z1h3Tm1CeU5FbVZuZUxVMzI5eVVUUHQ2dGYxc1puckFoc0VPOWMxUlR5bUhY?=
	=?utf-8?B?bUJiVE9Wam9WWE9sNDI4SFk2MTl0SUFrV0tGNlBnSG9DTDJVaUZQSWN4NExQ?=
	=?utf-8?B?Y0drVW5uUmhnb3c1eUk4ajBaSy9rWUY4c2d5eTVnR2RGaTdKWlU5S2RBMWNU?=
	=?utf-8?B?M2pxU0VGdFdOZDZRSXU3cTA1YXB4bE5SeGhEdm01cGRGOUNkR3laSXoxd1Y0?=
	=?utf-8?B?L2lJakFVVm12R1pTNWdvVU1RUlVCeFZTYVNTZmpXb1o0ZTc0U3h2cU9DMDMr?=
	=?utf-8?B?Wi9ueitwOHBBMHVPdHh5NXZuMFFWTlhjamF1RXlwd0JMSEJSVzFUVDgyNFhU?=
	=?utf-8?B?aE94Z3phVUh1Y3ozZHFNY25QZ20xRUd1S01ZM0x4OUZjOWtkdTFnaEpEeS82?=
	=?utf-8?B?UXVrRHloMTRWWDlQeEN3ZjhwbHNnSjRtZCtodnBJZ3g4NDJGNWE3TW1Nd0pX?=
	=?utf-8?B?cDBBeWsvVmxMdFFSNkorSGJzUGdicUNxTjlpajZyY2l2Yzg5N213WkVRRXBq?=
	=?utf-8?B?bXhUQ0g3V1NXVGEyVG5VYlBrRDZESW5JSjZuTjU0NkRrRkM0em04Mkw2ZnlG?=
	=?utf-8?B?QWlySWhoS2tKVGJPbTRHVlJXRWVaa2RFZlZ5MEhMc3R2NXN3VU8ySDdFYU5O?=
	=?utf-8?B?QytwTkF1NUMyRDh3c1pLeXpZKzRITmVZYWs5QkwzNnoySEhJcWVCN2x2VEVx?=
	=?utf-8?B?bTZsR2RDcmxISmVseWU4VnlRcXZHbmx1eUtPalE1UEhJRDliRTFmb0M4RUQ5?=
	=?utf-8?B?NkdxUFd6cUxWVHBKTzJqOU1TazVPV2hRY1BqWnlZcHVwdngwMzhFVXZGT2d0?=
	=?utf-8?B?eTZ6REEzVUNzaGFYMnBGeUdENm5PdDhNbmRjNENzSm1pMVRsbVJJNUQ3MXVH?=
	=?utf-8?B?YjFTK0hYOG1Oc2xlREtrVGFvbTRhWGFpeU5QaitWcEFzdGlZZ2hmbjNIRFI4?=
	=?utf-8?B?T3hBL2pKL21aNmRNS1pKSnRtT3JjSHBMVm02TGZWMGdVYU1yVmtoWFp1RGM0?=
	=?utf-8?B?ckZBNVgrMWh4eS9WQ25OWGpJSTBmTUpCUUZuMUJCeUNEZTRnVno0NnkwQzFv?=
	=?utf-8?B?bTliU2Z5NXRzamhMNTk4WUIxNERNYURucFdkQXpXc09oQmJVdVNPLzF2QjFh?=
	=?utf-8?Q?D6lWBKJzSL1nyV3Q3ra1SAFw6nJXygVa3ymZEKI?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	6:hZshQ0iDoYCPaSRDyHNfVc6ttyvzo3n0YJPFsJPmZncqfBhEBSs16ttFxNDI3h7Y7apCavX83vMtwziS6oaghS+d2/0ptnjOg8djhi5SkYbPdfhnaaQ0o+rcoZgj+i+YcR3OWjWPIspRDmccoj1rMHRS2cQx6kW37SHkOVi2du6/wuQceJsGq23/dasx/Fqlx9T3qHMH8h62eFJ1rZFxmlqmNcVNyCDTCVSKh2gQykw4VCtAmNlFl2sEJzGBB+YHnen5YBhanANAlqgvf4Zk9x4Dinte6aYuK779Xof1Nm0b5hioYPbol1Y5HoOpgOMHD1nhAM9aEpw+v9kytNfxaVHObO15Fl7MdqAVqfEoHKU=;
	5:+yl0MyFH7U8YnYNOP2mOFm4Sk2oqUR9Wl4gE4ijBcFS5Gy6l8gp40uyqNjGPp898dqyuWne5cWB/K+P3ROOS565u1+azc3hduglWJ3SlubTq5A38t/xlCNJDlSbmYO4wvEq7gaPwKA2WaAXuY0w86RveKbFA3KVbL5Nl2XWumOw=;
	24:keD52Y6YnvL5Bqsjgx0cstyIXivbTy5R3E+pAyXWqvWsEhstJkh8d5hGyxI2djcI/kDEmRrbVhOI1heXzwkVSK4J39C+9NIcZhH0DaVzuug=;
	7:+eUEUBBMy5wKUzLf9q0jWxsM5Q0+MgXBaTJvs7zsZxLhCOB0xF63/BmVZhpVpVvl+7flq3Ez9CzPCa9ALgVgJOyjo7MPeCfrf9gbsLerLp9lJ76bo7+F6IgbAsMu2ptuooynr89PY5Ln+UgNYZogy6X4XLvP+cOyy56pLru4uRD5tKdK7RbMrax7XfrH/5YmtEtYaHGNIi/UmB6xYPREwp93QlWp0R3py6sCbYiKdraE2QVleTURzykPAc6ltY4F
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2018 03:43:15.8094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8bb23f-46a0-4f56-2084-08d578dd3d99
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3273
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage.bbclass: Fix 64 bit ENTRYPOINT
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
X-List-Received-Date: Wed, 21 Feb 2018 05:15:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Ross,

On 2/8/2018 3:45 PM, Burton, Ross wrote:
> On 8 February 2018 at 06:29, Vineeth Chowdary Karumanchi 
> <vineethchowz.chowdary@xilinx.com 
> <mailto:vineethchowz.chowdary@xilinx.com>> wrote:
> 
>     64 bit entry point should be passed in 2 literals ( "0x1 0x00008000"
>     ).ENTRYPOINT is assigned with first half only and erroring out as
>     'command not found' for the second half. Adding quotes while
>     assignment fixes the
>     issue.
> 
> 
> Does this mean that this expression below is broken too?
> 
>              if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
>                      ENTRYPOINT=`${HOST_PREFIX}nm vmlinux | \
>                              awk '$3=="${UBOOT_ENTRYSYMBOL}" {print
>     "0x"$1;exit}'`
> 

It will pass here as the return value is full 64 bit,
but fails at mkimage utility.

The return value has to be splitted into 2 literals if it is more than 
32 bit wide.


Thanks
Vineeth


> 
> Ross

