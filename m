Return-Path: <alejandr@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0046.outbound.protection.outlook.com
	[104.47.37.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2F278423
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 19:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9KCnVyJO21vyuWPkHtBueyK1sotnKrvCXnPk+9NZPe0=;
	b=TrGz2duUDIXc4VZ4JLF3jg1QBDFaZFU1VetxXYVwGwa4XSLIuKgZ2y9twTU8lH5UmJYqEmzf9fWqP1BD+LW0TEES24zzvnb52b5Ub14JWn21v/JT3giPsFt/Ilmvxn1A9KRX+RXp6aon9WHnAosreGYRHkxe5NCxAidEb2/KPk8=
Received: from MWHPR0201CA0087.namprd02.prod.outlook.com (10.167.161.28) by
	SN1PR02MB1344.namprd02.prod.outlook.com (10.162.0.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Wed, 31 Jan 2018 19:01:02 +0000
Received: from CY1NAM02FT043.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by MWHPR0201CA0087.outlook.office365.com
	(2603:10b6:301:75::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.464.11 via
	Frontend Transport; Wed, 31 Jan 2018 19:01:01 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT043.mail.protection.outlook.com (10.152.74.182) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Wed, 31 Jan 2018 19:01:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:51453
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egxcx-0000wF-Vj; Wed, 31 Jan 2018 11:00:59 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egxcx-0007O5-Ru; Wed, 31 Jan 2018 11:00:59 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0VJ0pgW026437; Wed, 31 Jan 2018 11:00:51 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1egxcp-0007Me-DA; Wed, 31 Jan 2018 11:00:51 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Alejandro Enedino Hernandez
	Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com>
References: <1516648119-12528-1-git-send-email-alejandr@xilinx.com>
	<4ccf00a5-1a5f-bc37-bef8-b914823a7eab@xilinx.com>
	<CAJTo0LZkAMSnifEzdyr2LF9J4D2XCHfTDCiP=CyPYS6O20xfGw@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <bfb72164-b1c2-7fe9-39e6-8f5ac1dc7361@xilinx.com>
Date: Wed, 31 Jan 2018 11:00:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZkAMSnifEzdyr2LF9J4D2XCHfTDCiP=CyPYS6O20xfGw@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(39380400002)(396003)(376002)(346002)(2980300002)(438002)(3190300001)(189003)(28163001)(199004)(33964004)(53546011)(575784001)(8676002)(64126003)(81156014)(36756003)(606006)(966005)(5890100001)(59450400001)(84326002)(270700001)(76176011)(81166006)(26005)(356003)(8936002)(77096007)(9786002)(186003)(336011)(110136005)(58126008)(37036004)(478600001)(16586007)(4326008)(106466001)(65956001)(65806001)(316002)(31696002)(236005)(36386004)(83506002)(106002)(6306002)(1720100001)(54896002)(53386004)(53376002)(6246003)(2906002)(65826007)(5660300001)(229853002)(2950100002)(63266004)(31686004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1344; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT043;
	1:wcZzLlWn3rGNchFqC68dHb1a+nv7GfcFbCfdmKAyM5eXFFnEUNQg0kl9pAbJ5vzpzAAWD3NRY3wWVj63uKFokNPHHnsdyhsdEoPIklzD1KdOaUQvCuyGfnW096hiPCPb
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20e3c100-8a0b-4d74-bbe9-08d568dcf80d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:SN1PR02MB1344; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	3:KNGE8/590tZGXMcaPXV/OV3gJcDSqRQk5gmUpgkIUUKobgHfp1Ng7+VYQVwDK3yyuEW2zuWkAZKE6HhMgG9WLbBqq01mTu1bKC9hxdsQ55ozpLKWbJQaTYBf8BXPSJi3An5sh/P4/GR0tPIbv9qQWXvSToU6JASKF14R7GnyfQzqS48csp1BBVMpUlZLjjV9bF94POPcOTrrVjJ1JLJR/SBsrW3bmXx14CvdB9aDBhGNV+9uqSWSxuHATxeIbgeuXu70R+vlYIt/CliKt1ZVyUOxIRVIOlw0m5Sc2xKppB5iBj2rE9m/Je9kfjoKOaQoBuse4GY5/8ygkwizk4TjWuqd9O9n5WaS1QsQgLQ5/4M=;
	25:3fUySIrWyhJXzU6YTsK0x1Xr8/PVHJg2xqx5NbEe8t31OVyd5K1Hpkcflynzvw5WIcAtD3EKGsadFFIezbqPHrVNy/xSyK3Jmn5m6OCYogtBGI3HjcTf+wZZiIpeo3B7I70YiKkwmyiv6wokSuF2FeOOBlpnAgiDwVLgqtW8DYY+QjeBWmglwNUXbQX6oSzjRTaSBWNcaurbSxccaRrelQ9s9Rsxp+tqyDTFDlmVxKCl/zNF/YagsQFvdTs42M0K43a4Fnej+wMa2odSMs6e0XAOisxJveULBQsAK05sEkPMUk8HXJTOGKfr4ZBkY1lq4M7DN33XicxUa/TWXNOEbw==
X-MS-TrafficTypeDiagnostic: SN1PR02MB1344:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	31:MmqTZ7ieMwvoaBmGHBcIgkDBZF2fngpDUYIee3PR9mXrQoSFZkI2idiuXPEzThS1xmQU2uJ3oR8WlYzl44+hjXTwAak4sZiN5bdafNE+8rfLjgicviNr6CRojj97BeQk98gtU5MWz52zXOkvC0LcT3Cwet+0oHTWrBtuGXjTwhcZgTDsyOCFRQI0LFS4c3uZ4anfyvhO2z7wfj/Dts4v9Ns3JkORA8uaipZ7g8KjGbA=;
	20:+nh8PsxZtPl8DogHmGoNOM2QmblHZfMxiFxxJBcS071Akr5fhRvv+U45JJqnt0jqt1n6VG3ShqWky7W6/0/P4L1CmzjK5VnvfznrpRfDKLdIZfHVSppC8C1hxpaGYvtHgNy+YgwTTIdcwiEx6eOiLs0qUudT7OoaL6I/TgxY5zWg5QZG6gts3UOgoBvQVRZgy7QgpNVJzMBX525t8r5X1kO+urqMzRU2fWYLGPdWampV9yfpEIgUyat/OOuzzUi513hJ8DWssqi3JdT8J6GYW18d3mWSLL6/5VF8ze2HcRqJv3Ui5p9cG04qr3y6oBc22zVdpKJU+/t6c7vP/tjgOPSH/NooG9jaxrVvAimP7NjELxSnLbkjwQnt5ApvWhv7zJP5rJQ14Gh3PeDMJmZNmb3tN/WnNXaBlN7xqoymedHVi7MldUID1I5SXyvTyqmAZ/esqY4WPYjK0jlVE6Yx5HNEfghVrAC2nNhjm3STiMO1mqIBu8e8PbkueKJVkayO
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN1PR02MB1344D5AD090E8AC724585112ACFB0@SN1PR02MB1344.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(85827821059158)(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(10201501046)(3231101)(2400082)(944501161)(3002001)(93006095)(93004095)(6055026)(6041288)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:SN1PR02MB1344; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB1344; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	4:vU93YBjVVBt8GsNh5h9OWDEmFUXABbxuEeo/MnKzFoDAHBsGR0fu0eSrysdED+ltbIgzPjpIdFEzpEJu/u12/4L1lut5yDSHDSe3UUaXG/XG+HJ91dc74qTfbndJosY8H2aeVjbKghqSHBQvSEPlvsbDlYW+fJEggAlOgmdr9cBmSVGOhzzMR/TVyQGXVASeFMMtbNCsxc/9PzXBaNCK+PmrEvsbx7hi6NaNfJxw1m6WmRBLq70h2kze3/ceEk6FLmSsRiH7sttodSuVL2WjDmy36SL8iiWdHylMCLFO8HV2nlWJrk3X4gZmrZ46A5AhEoFQG+x8R8jpYsQFLcmytdFMgbkP8uMMVLZwjGoR6wtdafB3615tCpInYs3V3c4Lo1w8UlWtZSXLJqo3retZhtnr3Btdnf3l3PNVS/uIWjM=
X-Forefront-PRVS: 056929CBB8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1344;
	23:JMmNyu/h1784eFCWASXS+/PJUqJvHhRb2BldXOjFO?=
	=?us-ascii?Q?p+hY39+Px+l5QpXrNeoDiQxR8X2XDEV+0rI9SUiVjJZgOWcJjy0vPEKQw0Ps?=
	=?us-ascii?Q?kYZUL5OKHLxyNV+smkHS3+gb/2IbuRd10XFJxfxLXncyyPEHJVfBZSCik6hQ?=
	=?us-ascii?Q?N7+IYgPDyYR1kMSCv1STaVgio7wEyHhVy6SDW/X7DKQ0uDE5Ytv6j1TYx2D7?=
	=?us-ascii?Q?05AcZsapKghClp0cRokCvW/ViKZexis0VC73lrVk+SceuPL0SaneEnnQG7H8?=
	=?us-ascii?Q?UZHCW9XGwlf16ZAMKtM2cK3+V1w73xSQjKB4WYe9p49b7/7AtQZUWdHcBbJJ?=
	=?us-ascii?Q?pMI0O+XGXf34Uw14c2A+YM65G5dur7J3Nm+VWRBHujy6rYMEKY+NrUawOfop?=
	=?us-ascii?Q?c+5xf6vp9LPvN1cGBMh0e3YinsoY0euNgciZ2n0/K/oClgxz0uLTqxjJdH7f?=
	=?us-ascii?Q?v+TiYdUoPrFhoHhBIzYQbWnMi8KzX3Y4gbY/bQqlDQTNC8BLgESgOSO1km6M?=
	=?us-ascii?Q?uQO0WVMdc2usqVNYBJ2gilwbeMYYl7sG0714VYKzm4wLmuaoLGK9wRdJnTwm?=
	=?us-ascii?Q?wuJ8uxe0S3fQa3nzi+DsmlV4mDiiduwVjM2QtfF2Q8TwbwdjeN8GAZ4A06Fm?=
	=?us-ascii?Q?wFXBy2VDliskvjP0W6S9pjtyoTNs3FStnLRvk96yNUxKg5E/iPDmJDel13Vf?=
	=?us-ascii?Q?vy2vR4cuSo1iv74Evubq5lennC3fjFy8JBRjOhMB4GAQivCdLF+N6JMr7JhZ?=
	=?us-ascii?Q?HNQ6vUKUJDReeA/LA4dwRPQi5UxY7xie9M9+QsMD+H2mKjxwkvr8le8ykl84?=
	=?us-ascii?Q?vTnM7D+bknSYKPF0keZBo19pwMHxx4HdIHBkm59rpQrWY2jxcIrBQ9PuNKdV?=
	=?us-ascii?Q?BfajAZOowWCZQEocKv69HeYAKQpCGBjOAkFpMC4zQsE6DFHVJ2fYuV+lX2gq?=
	=?us-ascii?Q?yt+LNE93MgRTzqRYsiEetCir6epO6MBEOeDUKpwAMxn/nyJcvDEwPeBVEVvR?=
	=?us-ascii?Q?g4hsr4HLE7rnI9s8qj+JRSiW1NqZDfisFf1O3DchT9u6E56szy4dhaDxFaGj?=
	=?us-ascii?Q?xEpb7ffy7uTaKXigSaH0yx0Xm5Jd4aRFmrxBsuOyidQaKykt5zv9408SeQfM?=
	=?us-ascii?Q?zVZ3irN68B3AlZwld6UfJCTIf2v96nuip5Aflh0vcG2VU83nbM+nWUco2+22?=
	=?us-ascii?Q?rv6/U4wJCo47z9GqHHH8t3Odah/NmteUda/BTV5ELQlyk5Nsiwatgl5d2LUT?=
	=?us-ascii?Q?yA7eGTARkqysqd4glkjCLl9+xQOh/gYH+vHnstYV4xK+KSpi8wj+zna8j8SM?=
	=?us-ascii?Q?C1w1wRoEnRnCYNGw/3fg2P8S+LO/3N9ILS+LsyGoMVHKo43o9gvy9JzjDORj?=
	=?us-ascii?Q?hq1sigwLe98Ju7ZT6AS4EPQsDPEGzkujU4lQ6o9gQlDFEbU9yyMDlniAMbgf?=
	=?us-ascii?Q?AXghZarAroBHc+Rkcd9WTaeaSonOKw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	6:dONc2VsYr6RABH1il0qvIQkM0FZ94FKwbG6luBGEEgd9/1iOrCOjppb4S2Ay0HkaXjdm4KDkrEB1bNoVuN3rRDMn+MBFNa4Klfc5CtamZT7j5YYYnZojWbbxGQ/Q4S+ISQIYT9rgPYBFAYeZp+bDmcym1F06I4mvr4nyZsq0Ur2A7Y06ILD9oMGm8EhOYCUbwCTXskC2Jo7lBYQbrh1LeOtdhVfY10jOJjO4YwIkcOH3dHkhi+zWme2n5jHzMHF4qlPx2V4i7xLaceEMtK02msJarMGJUcQ3j/8jnSHwb2VtFR3LZmOczSnHs0InF84500t+zqVoysNePGVaa9iSOuappemVWyzVPAubLmHM84w=;
	5:AJ/EqUEB4uYpF0R+kDUFL7VbSB1gQwZoQ2H071YtOudbPesv3uM3Gdf57tgaWMWX480IFxIbs9Dutp3NMb25J8uq4GxWZSM5OM9qGlbNOM+LbgFEK8qmfYgrH1g6re3HDUogOIqeKA6BitQbGMj5xqZufrQi7Qm1SuzgxJcsY9c=;
	24:2sGzUZwpyNtt2yzEB1+cTKBtv9lMaoDSvsnnlN7XBIQglHWKx0MLM7gPNBJQR/4d0+94fksBdO7CaB/0m7Z5uKHoXmAt6dp0joN9oZGj+sw=;
	7:2vnCPLirFwodS+GqgE3d+lbKmn8wAkYUykVCmGiF+671soZWWzfrIyLc9yAb7UXpvfvvlAV/WWbIjf+tSRGKigcrNGl0yP0BhUh+A0bUs7+W6mEXNXjOJW1i+3/DdRj8zvCeF10PxSwIik0Cc61hArLGV8NzCE/9Vr0f/u0GXcsrjVlYQgGDY4NiBGqjICfM9TUiE/OcHuwENv28UpZarmQHFOQ1QMxk0Io6uiOFNVbbSSgaVgYKkmxRYuFAcfsz
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2018 19:01:00.3724 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e3c100-8a0b-4d74-bbe9-08d568dcf80d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1344
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ninja: Upgrade from 1.7.2 to major release 1.8.2
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
X-List-Received-Date: Wed, 31 Jan 2018 19:16:43 -0000
Content-Type: multipart/alternative;
	boundary="------------04644C9DD103454809455123"
Content-Language: en-US

--------------04644C9DD103454809455123
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sure, sorry for some reason I sent it to oe-core-bounce or something 
last week.

Interestingly I just rebased it on master cleanly...



On 01/31/2018 03:57 AM, Burton, Ross wrote:
> Patch doesn't apply, can you rebase and resend please.
>
> Ross
>
> On 30 January 2018 at 21:09, Alejandro Enedino Hernandez Samaniego 
> <alejandro.enedino.hernandez-samaniego@xilinx.com 
> <mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>> wrote:
>
>     Signed-off-by: Alejandro Enedino Hernandez Samaniego
>     <alejandr@xilinx.com <mailto:alejandr@xilinx.com>>
>
>     ---
>      meta/recipes-devtools/ninja/ninja_1.7.2.bb
>     <http://ninja_1.7.2.bb> | 30 ------------------------------
>      meta/recipes-devtools/ninja/ninja_1.8.2.bb
>     <http://ninja_1.8.2.bb> | 30 ++++++++++++++++++++++++++++++
>      2 files changed, 30 insertions(+), 30 deletions(-)
>      delete mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb
>     <http://ninja_1.7.2.bb>
>      create mode 100644 meta/recipes-devtools/ninja/ninja_1.8.2.bb
>     <http://ninja_1.8.2.bb>
>
>     diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb
>     <http://ninja_1.7.2.bb>
>     b/meta/recipes-devtools/ninja/ninja_1.7.2.bb <http://ninja_1.7.2.bb>
>     deleted file mode 100644
>     index 4d3b272..0000000
>     --- a/meta/recipes-devtools/ninja/ninja_1.7.2.bb
>     <http://ninja_1.7.2.bb>
>     +++ /dev/null
>     @@ -1,30 +0,0 @@
>     -SUMMARY = "Ninja is a small build system with a focus on speed."
>     -HOMEPAGE = "http://martine.github.com/ninja/
>     <http://martine.github.com/ninja/>"
>     -LICENSE = "Apache-2.0"
>     -LIC_FILES_CHKSUM =
>     "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
>     -
>     -DEPENDS = "re2c-native ninja-native"
>     -
>     -SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
>     -
>     -SRC_URI = "git://github.com/martine/ninja.git;branch=release
>     <http://github.com/martine/ninja.git;branch=release>"
>     -UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>     -
>     -S = "${WORKDIR}/git"
>     -
>     -do_configure[noexec] = "1"
>     -
>     -do_compile_class-native() {
>     -       ./configure.py --bootstrap
>     -}
>     -
>     -do_compile() {
>     -       ./configure.py
>     -       ninja
>     -}
>     -
>     -do_install() {
>     -       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
>     -}
>     -
>     -BBCLASSEXTEND = "native nativesdk"
>     diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb
>     <http://ninja_1.8.2.bb>
>     b/meta/recipes-devtools/ninja/ninja_1.8.2.bb <http://ninja_1.8.2.bb>
>     new file mode 100644
>     index 0000000..c6fcfef
>     --- /dev/null
>     +++ b/meta/recipes-devtools/ninja/ninja_1.8.2.bb
>     <http://ninja_1.8.2.bb>
>     @@ -0,0 +1,30 @@
>     +SUMMARY = "Ninja is a small build system with a focus on speed."
>     +HOMEPAGE = "http://martine.github.com/ninja/
>     <http://martine.github.com/ninja/>"
>     +LICENSE = "Apache-2.0"
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
>     +
>     +DEPENDS = "re2c-native ninja-native"
>     +
>     +SRCREV = "253e94c1fa511704baeb61cf69995bbf09ba435e"
>     +
>     +SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release
>     <http://github.com/ninja-build/ninja.git;branch=release>"
>     +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +do_configure[noexec] = "1"
>     +
>     +do_compile_class-native() {
>     +       ./configure.py --bootstrap
>     +}
>     +
>     +do_compile() {
>     +       ./configure.py
>     +       ninja
>     +}
>     +
>     +do_install() {
>     +       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
>     +}
>     +
>     +BBCLASSEXTEND = "native nativesdk"
>     --
>     2.7.4
>
>     This email and any attachments are intended for the sole use of
>     the named recipient(s) and contain(s) confidential information
>     that may be proprietary, privileged or copyrighted under
>     applicable law. If you are not the intended recipient, do not
>     read, copy, or forward this email message or any attachments.
>     Delete this email message and any attachments immediately.
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------04644C9DD103454809455123
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Sure, sorry for some reason I sent it to oe-core-bounce or
      something last week.</p>
    <p>Interestingly I just rebased it on master cleanly...<br>
    </p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/31/2018 03:57 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZkAMSnifEzdyr2LF9J4D2XCHfTDCiP=CyPYS6O20xfGw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Patch doesn't apply, can you rebase and resend
        please.
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 30 January 2018 at 21:09, Alejandro
          Enedino Hernandez Samaniego <span dir="ltr">&lt;<a
              href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com"
              target="_blank" moz-do-not-send="true">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by:
            Alejandro Enedino Hernandez Samaniego &lt;<a
              href="mailto:alejandr@xilinx.com" target="_blank"
              moz-do-not-send="true">alejandr@xilinx.com</a>&gt;<br>
            <br>
            ---<br>
             meta/recipes-devtools/ninja/<a href="http://ninja_1.7.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">n<wbr>inja_1.7.2.bb</a>
            | 30 ------------------------------<br>
             meta/recipes-devtools/ninja/<a href="http://ninja_1.8.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">n<wbr>inja_1.8.2.bb</a>
            | 30 ++++++++++++++++++++++++++++++<br>
             2 files changed, 30 insertions(+), 30 deletions(-)<br>
             delete mode 100644 meta/recipes-devtools/ninja/<a
              href="http://ninja_1.7.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ni<wbr>nja_1.7.2.bb</a><br>
             create mode 100644 meta/recipes-devtools/ninja/<a
              href="http://ninja_1.8.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ni<wbr>nja_1.8.2.bb</a><br>
            <br>
            diff --git a/meta/recipes-devtools/ninja/<a
              href="http://ninja_1.7.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>ninja_1.7.2.bb</a>
            b/meta/recipes-devtools/ninja/<a
              href="http://ninja_1.7.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>ninja_1.7.2.bb</a><br>
            deleted file mode 100644<br>
            index 4d3b272..0000000<br>
            --- a/meta/recipes-devtools/ninja/<a
              href="http://ninja_1.7.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>ninja_1.7.2.bb</a><br>
            +++ /dev/null<br>
            @@ -1,30 +0,0 @@<br>
            -SUMMARY = "Ninja is a small build system with a focus on
            speed."<br>
            -HOMEPAGE = "<a href="http://martine.github.com/ninja/"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://martine.github.com/nin<wbr>ja/</a>"<br>
            -LICENSE = "Apache-2.0"<br>
            -LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://COPYING;md5=a81586a64a">file://COPYING;md5=a81586a64a</a><wbr>d4e476c791cda7e2f2c52e"<br>
            -<br>
            -DEPENDS = "re2c-native ninja-native"<br>
            -<br>
            -SRCREV = "717b7b4a31db6027207588c0fb89c<wbr>3ead384747b"<br>
            -<br>
            -SRC_URI = "git://<a
              href="http://github.com/martine/ninja.git;branch=release"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/martine/ninj<wbr>a.git;branch=release</a>"<br>
            -UPSTREAM_CHECK_GITTAGREGEX = "v(?P&lt;pver&gt;.*)"<br>
            -<br>
            -S = "${WORKDIR}/git"<br>
            -<br>
            -do_configure[noexec] = "1"<br>
            -<br>
            -do_compile_class-native() {<br>
            -       ./configure.py --bootstrap<br>
            -}<br>
            -<br>
            -do_compile() {<br>
            -       ./configure.py<br>
            -       ninja<br>
            -}<br>
            -<br>
            -do_install() {<br>
            -       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja<br>
            -}<br>
            -<br>
            -BBCLASSEXTEND = "native nativesdk"<br>
            diff --git a/meta/recipes-devtools/ninja/<a
              href="http://ninja_1.8.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>ninja_1.8.2.bb</a>
            b/meta/recipes-devtools/ninja/<a
              href="http://ninja_1.8.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>ninja_1.8.2.bb</a><br>
            new file mode 100644<br>
            index 0000000..c6fcfef<br>
            --- /dev/null<br>
            +++ b/meta/recipes-devtools/ninja/<a
              href="http://ninja_1.8.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>ninja_1.8.2.bb</a><br>
            @@ -0,0 +1,30 @@<br>
            +SUMMARY = "Ninja is a small build system with a focus on
            speed."<br>
            +HOMEPAGE = "<a href="http://martine.github.com/ninja/"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://martine.github.com/nin<wbr>ja/</a>"<br>
            +LICENSE = "Apache-2.0"<br>
            +LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://COPYING;md5=a81586a64a">file://COPYING;md5=a81586a64a</a><wbr>d4e476c791cda7e2f2c52e"<br>
            +<br>
            +DEPENDS = "re2c-native ninja-native"<br>
            +<br>
            +SRCREV = "253e94c1fa511704baeb61cf69995<wbr>bbf09ba435e"<br>
            +<br>
            +SRC_URI = "git://<a
              href="http://github.com/ninja-build/ninja.git;branch=release"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/ninja-build/<wbr>ninja.git;branch=release</a>"<br>
            +UPSTREAM_CHECK_GITTAGREGEX = "v(?P&lt;pver&gt;.*)"<br>
            +<br>
            +S = "${WORKDIR}/git"<br>
            +<br>
            +do_configure[noexec] = "1"<br>
            +<br>
            +do_compile_class-native() {<br>
            +       ./configure.py --bootstrap<br>
            +}<br>
            +<br>
            +do_compile() {<br>
            +       ./configure.py<br>
            +       ninja<br>
            +}<br>
            +<br>
            +do_install() {<br>
            +       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja<br>
            +}<br>
            +<br>
            +BBCLASSEXTEND = "native nativesdk"<br>
            --<br>
            2.7.4<br>
            <br>
            This email and any attachments are intended for the sole use
            of the named recipient(s) and contain(s) confidential
            information that may be proprietary, privileged or
            copyrighted under applicable law. If you are not the
            intended recipient, do not read, copy, or forward this email
            message or any attachments. Delete this email message and
            any attachments immediately.<span class="HOEnZb"><font
                color="#888888"><br>
                -- <br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  target="_blank" moz-do-not-send="true">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------04644C9DD103454809455123--
