Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 13573 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Jan 2018 22:48:26 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0077.outbound.protection.outlook.com
	[104.47.37.77])
	by mail.openembedded.org (Postfix) with ESMTP id 262B3785E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 22:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JBsfCig9hG4R4eWXRcM5O3lbSuStQ02KH4X54k8pvQs=;
	b=I2YzdW9FDO0UbL59aKG3FAG7cazGoGY+8HYffbibyGqQ1xXErlp0ygjvXAjLAG/LfStsGP4mt7c09HAON5M0hYTpRZoYNTVEtlWv+1fB8KTyb+muBTVYnot4+rbRObH3rcYZCtvHmB1plMefrfOzb4lyro1mKqS337de0M8qGsE=
Received: from SN4PR0201CA0067.namprd02.prod.outlook.com (10.171.31.157) by
	BN6PR02MB3377.namprd02.prod.outlook.com (10.161.152.165) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Mon, 22 Jan 2018 22:48:27 +0000
Received: from CY1NAM02FT005.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by SN4PR0201CA0067.outlook.office365.com
	(2603:10b6:803:20::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.428.17 via
	Frontend Transport; Mon, 22 Jan 2018 22:48:26 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT005.mail.protection.outlook.com (10.152.74.117) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.428.12
	via Frontend Transport; Mon, 22 Jan 2018 22:48:26 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1edkt7-0002oQ-VH; Mon, 22 Jan 2018 14:48:25 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1edkt7-0002mQ-T6; Mon, 22 Jan 2018 14:48:25 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1edkt3-0002lQ-3j; Mon, 22 Jan 2018 14:48:21 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Alejandro Enedino Hernandez
	Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com>
References: <151648753376.31338.5162580593839986526@git.openembedded.org>
	<CA+chaQeic6SOL06JEqGOUPsZg2-HPJ9PJmKnTCyLnq7y0eSXdQ@mail.gmail.com>
	<bf7a1c1e-1414-3c2f-e9f6-a4e690a9d8d6@xilinx.com>
	<2335819.HfQnGk64D5@peggleto-mobl.ger.corp.intel.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <b1d6d959-203c-b5b8-8442-12cc1e670a35@xilinx.com>
Date: Mon, 22 Jan 2018 14:48:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <2335819.HfQnGk64D5@peggleto-mobl.ger.corp.intel.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23612.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(346002)(39380400002)(396003)(2980300002)(438002)(43544003)(189003)(199004)(81156014)(53546011)(81166006)(8936002)(106466001)(316002)(8676002)(9786002)(36386004)(36756003)(83506002)(106002)(93886005)(336011)(6246003)(39060400002)(356003)(67846002)(110136005)(54906003)(58126008)(4326008)(31686004)(63266004)(305945005)(2486003)(23676004)(76176011)(229853002)(2906002)(6306002)(65826007)(5660300001)(478600001)(966005)(26005)(230700001)(77096007)(2950100002)(59450400001)(64126003)(50466002)(31696002)(65956001)(65806001)(47776003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3377; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT005;
	1:raXyMHWNnmc+Iknihhcy4We3pF/yzpa/LSrfFkkcepUDEDDcY1Z7d1o3dtVAhV0tzO7dCXgVYAZP9DYI1I0dHGuraVLDtiMyc4Tu1EQLvz0jRxuHEx7LpavOjf43nMhU
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5cda6b4-9898-4945-8a1c-08d561ea400f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	3:FHhoiAgRtpVG9AnXRtuym3/TJnSwfnVMgc2X0KoL5GsbJtoj4CndIYJI1Jp0B+9pfvdVFGW2u/ZuetplD6K8JPSEH3VyC4EPoQAWXmG+Zh04e1CtvYqoC+N1j0CJyqQYMjhSNx7gOBfskdW+7I6MDKNXPFDix3e4AhdbK3EBYVyaq+5Kkab5NJKcCYGd6iMr8ZoXkcoAKgkCfQRUxN/MsTX2CAnq+6Ll0czFWtekTFKyfkopfUBf1qhHIOnpmaaL6EqN7LvyTQEF5GyFlVcwxTdj5ZdID1KFa7h0DzflgbMI87fvWv1UHITZ6+sLoO2ixqI5gEZfYzm0vqWxhKer4lhb8Vr+hqg9uRQhPsWTa7o=;
	25:zFue59h49ghrShOB9/Ids9lvz7dLh8kTkys/XSjadQLdcwj5mLlCMu6TG2utP1QPkUvCLex/0fkM5QfsDayY3dCwby/ooqB3ySKOaIjMXd+tB6t+hYlsG2mS9thMRC7+HNYNRd1Rlbr+qmc53xbbFisQTlgS7xIqL+Sl+92lH47zR4tcTRo+3xi8sohrve/JJF8F9Sc2YyWfv9shnbmudsHsL/ZwT/iuqtSGEKQdZpxwukPL0fddYSxhBRV726X8K9XOsjDGt8HCqR1UN9zxgHdtjnYr5RuqpmmVlzaPKrKU+9xk1b6UwA9t1w2fFbCIGgmWf3Nn/Y/q9TM66Q0+0g==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3377:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	31:FLuKC9qsUoSJm6m+x56eAM8UUWMvzpgYcnpy7gfLOf+pbLv/ac1DBqeGfThuzw8jPeZ5Z3P0WP/gPrSKJFgoNmvuFCQ+av1hdOeYl+vCqvylajVedzV3ekvcYeI74sYNcQgmxT+RP5QiFx6+CRZW8TJ1SGKdfdfctT8h60vlEh7SGQ0Es4XWUsOmxI/j3ugvWXJ5dzaErrSGcg1akUYFOEsRmZmwzRIVAjY+N5I7rck=;
	20:isZq4lcxRnwmjwb+P6M3WBjdQMCS08ydEd1eKqtlTuxbLWGEWgrNeSyR+h2tUT47Nf5cM+dPVD+fsP5dX+y+7Zy49/a60obcPTfgukKLLczAFRzHeAm+zwKePHBaezPKZTsa8tdN9rI3iYL9mzOnicAJ1fl+sH0EXIvduKNf9jJmFwXyEXMrs71pIr6dskfd2XU1XFg1+A3IY1eg0PEiag8Vow2uHuOfX/IErAAD0uDZTiU/kYR7e97wSp8JA9pCAG4PZBdks6FOp/L8tqraHReheFR9CzQorECW27tyAnQ02LT6BlJs9NabIEw5oWTyaxzDwX4Wm/vNZeQRVqnOzGRXJA3PaOKr2nxaNeY0aUFOclPJLknP49oQBxBFCmsGvzYtIbv1/rEw5UlEu4sZAQ6nef3Y4P5+QWrCDQX+zkIkhH60JjggHn9XyWfGoe+0L3vJea8wyEgQH/0dJmepBue48mQR6gSpQ35XYHvKbMNFMmYRnNZscViVa6LrixQk
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB3377CF23E2FCB77466F74C10ACEC0@BN6PR02MB3377.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231023)(2400081)(944501161)(93006095)(93004095)(10201501046)(3002001)(6055026)(6041288)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:BN6PR02MB3377; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	4:oGTAjK0SGHdJXroFkQ3ez/jY099LsO+mmtzGnBESePjqcDQO2brQflJNOUU4HRR2JSu7b/+BjMyDbxp5CZOb/a0+DbzADPSaBAsWGMJSUcQizIUHD0+buewfNW0pb+oHwvWUXAPEpnoSu/ZmaiqmqRSCgbxKF/QDvHF8C6hXo6UShzwNlRXpe5juKwlIsBJGIe09udnXsJXkmaC3oFUJjLnxEPIfdb1FgFnD1s4DjsxjrHDygg05KliQxrryAmsrSbALxS3MTppB03HgoL0dt9ykcMJGUE7zDo8sZEoErP2DD9po9dSnbuzzPBYsitwp
X-Forefront-PRVS: 0560A2214D
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAyTUIzMzc3OzIzOjFkYW5LOFJIeFoxYm93dGhkamliOVJJOVBI?=
	=?utf-8?B?em51T2lkYU4raFNBV2ZjYkVtTVB6dEttdUdoeXJlQnRLeW1lb2lUbzBkbGps?=
	=?utf-8?B?cSszQjAyRUpRSEVQbVBqaGFMRUl6bzg5MTNvNVltc1hRMDV3czRPaGIxS1lt?=
	=?utf-8?B?WEFUVldLNjU4cUw4NWpSOFhpU2lWd3VXeC8wZ1FHUmpEam4vN3c2NWNNR1FN?=
	=?utf-8?B?NDZUSW9jaUZCQzRuSTBHNS9ueWF5cVRZSmN5T2x1M015VXdWUzEzZFlVMlli?=
	=?utf-8?B?WVAyeGM5Z28renp0Ui8rc3BRSE9NeWJHQ0xzYVVzdlFpT0FtYlZ5TS9pL205?=
	=?utf-8?B?eko0K1hlcUh4amMxMlMxbmZhMEpOQTd1UC9qejg3bWMrOHFjOGdlTzZ5QTFD?=
	=?utf-8?B?a0JWd0g3TVAxOHBHMU9mQUFkVlRIRUtpdTIrVTFIQ1RBQm9XSjJOZ3pJNGpz?=
	=?utf-8?B?WkU5c0orazAyRWUxTzUwSTluYUdab1UydzArN0RjcXpWQ0NqTnZreENTYlg2?=
	=?utf-8?B?YS8xd0NFRnhjaUlJcWtqVU1hQm1rdUpGbUxDbDc0RURrMnZLemdlUENmVDFE?=
	=?utf-8?B?bG8xSWV3WVhneVNqS1pWWFNVVGNTdDZLUk1FeEtrVE5ISHdSWDVFSjRzMmsx?=
	=?utf-8?B?Z0o2K2s0MkQ0anVVTlNaTlJCVlZtVXhBaHUyeGJlZGgyTk9KdHJ4UFhrNUpt?=
	=?utf-8?B?NTYzbWI4Nll1cnhoUjduRTdwbEd1VW1WT3FZQUIwbS9ockFwRjN0Q25TN1Z1?=
	=?utf-8?B?UnV2SFBlR0lsVjZSUm9xd3A4c2Z5VTJqOTZxVUpNMk1HaXFmb0JVc1BjUzU2?=
	=?utf-8?B?NXpaQTZpcEt3OUg4WlhPR09HUWRlakhkRjFTU0VMV3d4Z1VESXJNbW5BZWVr?=
	=?utf-8?B?YWg3dGtCTTR2WEFRL1JXOGpjbENJaERWRFNENkdhRjVyMXczNDdrdk1qMkpI?=
	=?utf-8?B?Njd0NkxmeDA4YWxSQ28vMnhGdEYzVG1PR1NBM3JreUpLMFE0VHZ1R3VidUFU?=
	=?utf-8?B?LzhYZUtiTGN5VFZHVG1qQ3pKVHdRK0x0TEFuKytkTFNhd2VINkkyTWVUWXBk?=
	=?utf-8?B?UjBRNjlzV0RnR2tpbFFCWnl1aWFWRmxJanNpZVkyWGFwamgrcG9JKzJINzUv?=
	=?utf-8?B?OVlzaTJZSFN2YWdzNHpHL0lVMjZ2ejJNN3laVHo3NTJqTFR3clJ5bW1ZRlVF?=
	=?utf-8?B?WGZlOVRWWk1aOWFLYndHbzhuUXZrKzVyZHU1aUZ6UUd2TkxaMnBQcVZPZEYw?=
	=?utf-8?B?a0hlTStYd3ozeStneVRjRlB6ZWkvc1FPK0xsM1g3VE04WjdaanZWQml6QTNY?=
	=?utf-8?B?QTF6U29NZWxxYmVIeGRDak5pVkZPWisyNENFL2JQSjRpbE5ERWs5U1lzK2Jt?=
	=?utf-8?B?dkk5VWlzME5yek9Ca0FvdDBvK3pjQTI4WENiZmU3OVhiSmVTUkY3WG5UUTB4?=
	=?utf-8?B?MFFKSy83L0pYL2d4dUdUaEpGOHBpSkxCSWNRSkxwWm9nMDk4bFBabGU0L2FY?=
	=?utf-8?B?cnIvV2c2SWdHYjdjR1JRaWI0alZlOEQxWVNTd3llTUdIYU5Pb29adytheHQx?=
	=?utf-8?B?RGljeHJaVHJIVDlhR3B6bFN5QUtodEZ0Y1l3SGJlaXg1azhRR21YdGFNK0tR?=
	=?utf-8?B?QlN3U3pxYnd6Q21mdHhrQU03Qy8zWkxQSnlzOC9zNmw2akZlb1E0cnE3MnNn?=
	=?utf-8?B?MGlETW1HbGpoMGdBeEpGT0c3bys1VlJMYWlOOWpwdWYzMUVUYjZmQWJMcUx1?=
	=?utf-8?Q?CAb8lfdhJ2q9a6s2C8Aq3zg3VdQ6V+Ce99F4E=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	6:UP2J5cFWyrk5jz9a+Q85v/IyM5LXn1Tk8VA/wemRwZxk7E2P3jFYFBmmMRPKYbRYQjpHcZLtgYZNUdujcjrUbVBDrzC7w6rqmsm9HsgfcESdijCeH7Nw9G1xugVT4zBWmdqgSW0x7wsH+zumDgMZQaKkgbNPAP4WMJ3yklVCqD1rZe/Hhz6cfKtPnrP4aZwT8Utdf4kYOo8Fb8dL+c2jUWdk4IqD1tvM02fpznEU5P5L9GfgsGpy+Yo2J7mxFxDCsKdBT3BNb6jm8ZhH7nvUik7q9Kttoxa7VW0OsbiHYDtPrB9i7NpFLC1N4ureDZrFcjYXb5ik4P8QJOYMrbvz17EXmvIjIhH45w1NwwY+XDY=;
	5:DSZXZjosiHIZZFUVYU6/KzIOOrHfItxr4tzSwDe1SStfU1nJZkHLz2zEXBturZ4iGG09rTnN3SKnFpX89O5itdF96wdIPtzkJAgNqjh6kuZBIQNEeV6hH8xRWqI6cPV4OKh2pw/ztdkaXi0XUKcdAQnzXudGooIZtYIa241H/WQ=;
	24:HpwbKqX1NLeMCooFm5eekVEsYUF/4aqDy0x28kl1gb53Zwv4ysHFUxANzLvWOtT+uQ6bmoST14jVgvaa5WjbMzhF7d3bXcOWuq4hnbczC1U=;
	7:PktJhr+IXfGPNz1S9G4MewxrWvr4barhb3thiedv+qzpChLGdDZln508XXflCSlkqbNk/ooeqYHEPtjaBLYtnS1gEmARDfg6YAhKM6n9vXGMuzyut1d+fOlTp3YPOINwmQ979uL5jVH8bYRUrhp2Ik4w8lUZ0+TkiIt800TpXkUl5gmOBNhlojfWsW7qdrQSItf+7rcSVSjWzvq14+LEpg/tfrJft9e5mjfHxrwgnr+iDnipulbofrpzWBHeVEMU
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2018 22:48:26.5919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cda6b4-9898-4945-8a1c-08d561ea400f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3377
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/06: python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Mon, 22 Jan 2018 22:48:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Paul,


On 01/22/2018 12:28 PM, Paul Eggleton wrote:
> Hi Alejandro,
>
> On Tuesday, 23 January 2018 8:02:07 AM NZDT Alejandro Enedino Hernandez Samaniego wrote:
>> Its backwards compatible, in the way that the usage should be the same,
>> in this case, this sort of failures are expected, since the mentioned
>> packages: enum, readline, textutils no longer exist, and they should
>> never have existed in the first place, they were always required to get
>> a minimal python working, so they are now part of python(3)-core, which
>> means the dependencies are actually met but recipes which RDEPEND on
>> them should be modified , please see
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7aaffbede46ce352b91c7a5c5f825a6f3b5b1c2e
>> regarding some of the RDEPEND fixes on oe-core, I expect there should be
>> several like this for meta-python.
I'd rather go with B) if thats ok, since the actual dependencies are 
being met and basically deleting the dependency for which its 
complaining from RDEPENDS would fix things.
> It seems to me we need to do one of two things:
>
> A) Add explicit RPROVIDES so that the core package provides these things
> for compatibility with existing recipes
>
> or
>
> B) Add something to the migration guide to explain what users need to do in
> order to fix their recipes after this change - the staging area for these is on the wiki
> (doesn't have to be fully fleshed out, just the bare details would be sufficient)
>    https://wiki.yoctoproject.org/wiki/FutureMigrationGuide
>
> Could you please take care of this?
Sure, I can do this!
>
> Thanks,
> Paul
>


