Return-Path: <alejandro.delcastillo@ni.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0136.outbound.protection.outlook.com [157.56.110.136])
	by mail.openembedded.org (Postfix) with ESMTP id 21DEC605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BDTlHrpsWTMrvxVjYkpmgRMzgjC0RAEwyHeCXf/66lA=;
	b=Az50HEiRlB+uStIXxUNgUoKAQ5R0dYatFZgCTMpxyud35FkOuuU0F/eQpX0BDtZCnbqyd3SX+D9D9MsGOCw4IHrYJ+URba3uK3YaiMgLJ9b+CxOP+yCo3SOlKi73CptXQg8mRoAXjITvt26IBo//9vvU30J85MRtcy1mqfkT6jw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=ni.com;
Received: from [10.2.33.36] (130.164.62.82) by
	BL2PR04MB836.namprd04.prod.outlook.com (10.242.196.26) with Microsoft
	SMTP Server (TLS) id 15.1.485.9; Tue, 3 May 2016 15:26:21 +0000
Message-ID: <5728C312.9020902@ni.com>
Date: Tue, 3 May 2016 10:26:10 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1461333082.31320.121.camel@linuxfoundation.org>	
	<1462196370.30857.70.camel@intel.com> <57277D25.2080309@ni.com>
	<1462261759.23261.18.camel@intel.com>
In-Reply-To: <1462261759.23261.18.camel@intel.com>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: CY1PR08CA0031.namprd08.prod.outlook.com (10.163.94.169) To
	BL2PR04MB836.namprd04.prod.outlook.com (10.242.196.26)
X-MS-Office365-Filtering-Correlation-Id: b9f18eb3-4a30-4dc3-ca4c-08d3736747f4
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB836;
	2:14XNQFN2/Dj8vd16TwwQrEIKAvFWQS6vshcp6W+o2p+qGDPjODb2y82lFW04AJ7a1bjGfNY/dM5C7JuyiKnm2RtgWZmsP1g7wz1sGN9Rj2VL98JbZeldxNbQebvFUTDAtE/k7UaDx45OcZCgDDG69lrUZ5ceirc/tUi4WlJ2DIxICoDn4fy+8gvP8Ta7UKM2;
	3:VNW1CVsUkb+dMGKcFlNI/7E3j45Io9xLarKGvrEDeoEuJCmbo2Iqj0m7T+UFLFCELY/+Silff6lwU5EKgOeQlUqX08edeDwyLBZXoNjodqhhZYMbDGXbbX0uOisol1k3;
	25:wC7IPTtc8aDg6C1YnGbfb9nCbKG0JMJhm9KJLH8Cb/F72IrOAl7j1r/1ZCn2Eo/7/nk1xwECrnDgHV990y5Ey5/CrdheZzGvVudVPCyYEwIbxZouPjAgMzrpY1h1Plnllk62lWp82Xf4WW1B+5sjQVLk/OY9BWX6hS9JFR1urkuseLL5u2ma5+8HeUElFeCS9q2YP478PayxJ1WcZ6XmWNCkonHvnQY10m0/pdX3VUHqyb5AfQvX2esXe+KPLWKAWh/4EIDKp4k1T0v5997BhpWgiRRVlKSkEpZK71MXnza03g741I8oPD3hx9oGDlgRgsAQF12w/s3iqPih+2Q5hQv1yfxIhmvL3vSp8A2RLrzy2GrnfCHmo1enwrX9jZDkklaZroHOaLT1Uz3tMh4RKMFI2qwFpEuggPes4+7dxGfIpxiVID0yT/BOrqUb+C8b
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR04MB836;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB836;
	20:hiF3iit+ZsnLzIvHy5Zev+o2+yI5IVPtT02ZRDlroBYxFMiMxq8dG/MbiZ3NeOmH0fG9vuidMvHdCueJtd4suQlv2YZk+WJfJRruGTVOAUgSdeQIGhA9ovg75mj3IwkEJ/Mc/lwkM66nbQ4qSPC2toB6xAaP/VjNwoRU8D/kEWjgHiTJUjZdHeHG5yOkmZkROwEkqBvLy+/3CT6Hp6vR2k9AtxnmrMFzTHcIIHp02sFrRxObVXS6xIAVhhZa76dZt20m7fRosbUKL7Dz/y3QUNzlwTUaBiyZEpytSgEKPidIuARIP+kht0UXHZIYYvgimH8x5cX9EcFON3sfleDwjQ5L6aTYYzBxbmF4ESKJeo3MkM8cMWoovY4kk6LzvWkwDVltMUrdgurG5WJHMIH4Qk/Cuse9Bm8ibNXNVAiKaWMYC/Q7aiaOXLQWcIpVOn/MYRDo3rO7IR3H8eHLBDcOIcIwHYd1aciQqO6zbnkd04x1Cbcf0Q6NI9I8NBeVfxgsc9dFAps39csASu5AkeiHlh9f3vmrbWQ4XM6zULrW6RnD3CHNJERUOPUw8cSlHczRnG8hF1gMv0FcDaMcu7R9T32LF0GxUE5o/pDEM8ENPgs=
X-Microsoft-Antispam-PRVS: <BL2PR04MB8363DC60E7ECB643F7355E3867A0@BL2PR04MB836.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(9101521072)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BL2PR04MB836; BCL:0; PCL:0; RULEID:; SRVR:BL2PR04MB836; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB836;
	4:7lZySyjGAz3gKFs1XSxrDtQvkteXYBeUr6BrJ+pplWgNHVlfjWtzqLW/BWZ35TFnL/xpQ5Dz5vRiqi0/IybUP7yaHiS99H+XqEVobNdVP9wa3kMcpXo1HGpJUSkS3q3mK3G3U27BMElrIAifdJc6le8zXfO6A6a3ystoSIXo++7zGV6pM4ZYb2EuN+W3nBl0nKSY6790qvlZIwUtSmXGUxDy5CzOcJvVZkRqzX6cJBeKfyG0PYIaToMG6UCu3jfuSaY4brifHoUwksTumXDN19ZY3B913sl/hChC6YQVzY+/9nGwkaiUcqlJB9spYTVnjaTL0WchHq+1Yxz4iAuWo4OW6q5RAGMPKYOxEKMKkiLpDgSdjlt0/C8W79qW2pZEG2MLx/JJh4mAICFcdEN4RA==
X-Forefront-PRVS: 0931CB1479
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(377454003)(24454002)(36756003)(42186005)(65816999)(83506001)(54356999)(76176999)(50986999)(65806001)(66066001)(47776003)(65956001)(50466002)(86362001)(92566002)(64126003)(5004730100002)(80316001)(59896002)(586003)(3846002)(6116002)(23676002)(4326007)(81166005)(230700001)(5008740100001)(33656002)(93886004)(110136002)(2950100001)(189998001)(4001350100001)(77096005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR04MB836; H:[10.2.33.36];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDJQUjA0TUI4MzY7MjM6emRnc25xU0JkTDBxaEhSNUdyWEF4MjkwVlRU?=
	=?utf-8?B?VUFqdE02SW5QdDlEdllwbkx1SUF4QkJDSmltVzlyanRWRWo5eS9BZ1RoN1Nv?=
	=?utf-8?B?OVVHVXpDSS9Vb3llTmRPSStxQ1BnVzRlQS9MVnp4RWJpa1lqSzdXaS9IYkpF?=
	=?utf-8?B?N05qYmRUWlVEMXpGSHJRdkxoMlBYV0l5WUhFMmtIMlN0NmFmbHQxYVE1YkJE?=
	=?utf-8?B?QktoaTNRcjc0Z1FxZ21DUmFsQXBjL2tSS2hBL09XNCtqdGtQT2YvSlJDc3Ft?=
	=?utf-8?B?MWFXOXJONG1DaXFURE1IblRPeUJNZXlnMEV3UE55L2o3WENkeXh1YUVkTXQw?=
	=?utf-8?B?bDJob1VtRnVXQmhDbUpoN1VMb2ZaWGZBWjFaZmJrSnlDRXhFREJDQ2cxbXpF?=
	=?utf-8?B?OFhvVVFtekpRdnl6c1RSakZicnNxazZXUVI3QVhxTERybGV5d3pjOTdtMmxD?=
	=?utf-8?B?WG9DSnkxUkRNSUxLTDE4L3laajQ0T0E4YmxhaHRrQjNRbnMwL3EzdkYwamVq?=
	=?utf-8?B?YWVLS3kxNFFaNktpSzVNOStwNWx6STdIVG9GWVdPeVAzbkl5YjVYdWxzb1Vt?=
	=?utf-8?B?alpicVlDZjAwTUpFa29DcnBDckE4QWozSmxCT0FQU1BON01pVDhOV2VFRHd6?=
	=?utf-8?B?QTdURjZTWVF3bjJ1L2IxOVNJUUhxNXpwVVlkazhrY0dhVnZJT240YzlBNUE2?=
	=?utf-8?B?dUxRV0xMWTNZcDR5a3N1eHlQeVd5RHZpbzRMd1lBWUJmY0NZZWhzTGFHVzEr?=
	=?utf-8?B?MjFSRVdRYUFacGsvNnlEWTQ1ZGt3eXNEY1ZFMTN5MU1RdmpqeGZNUzdjUm1X?=
	=?utf-8?B?YXo5R0pab2ZTN2h4b0lJUnNlTFVuT1VPaUJMeTJXTzhHOU8raVkwWFZFY0NC?=
	=?utf-8?B?ZE8zbHU3cDZNeS85VXY3aUZZUXh6UndYWmlkclVGZGxiY2szbVdoNFpEeWNZ?=
	=?utf-8?B?dkp3QzkxVU45bno3bUxtWU95OW4zSjIwSktWWm5VbStLeUhOUVNsekFiZGFP?=
	=?utf-8?B?ZzBlOUl0SkVXbjhkK1BYRFR3S0pNVEhwTkVEL0Q1TU84eDF2Qk50MU9tZDUz?=
	=?utf-8?B?YW44Mko2T2gyZGtkM0NrdHd4alZESzBPZXJOQWlkUytURGtoc2xrRjh1Q2JJ?=
	=?utf-8?B?NEZYK2JjUlRqeVppTkF6bm8yV0Y1NDdTbndORUxDRjZvNGNBZk5ncXRhWUpT?=
	=?utf-8?B?aVhGaDBETnlTQk11S0tkUnliQS92V3p2Y0lUeTYvNkFzd3lkRjdpaGdIeHpQ?=
	=?utf-8?B?UzdqYjlXZGxxSGZNYkw4YVFMMTE5Z3F4SDZUZVM4T0ZXdkRuRS9iR2g5RzAz?=
	=?utf-8?B?aWlBOG1Ha0ZiM2FxRnlwcjZQK3BGY3JYRFlOZFhPRVVSWXJzVHUzUy9lRHl2?=
	=?utf-8?Q?nxvi1V6?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB836;
	5:Pdgbvf2CK2Ke3T7VXNnqyrak4dfhJmDVaPcW9RaC/lbSBMcZjQH7Hx6kCOAgmD6oWOISxlpyMhBo292gcP93TUL2+BzHPH/1Pe+UtnZvC0tVuI8RHp+uAqWKO7OjTwUveeQ54VkkWrI7hEx93/kSGw==;
	24:zpxcc5yYt5+O1obrDyWiCAT4qmmujjjI1C783Q9ofYG+evOPnjd0365/uIaEToFNKFfrZPsvAK0og00fMNITLHEv1ANxMKfmticBsxBwYS0=;
	7:+xM783MVFaR5VNrCo3/MlirGXKVDizH7ycS4kEaMr+CQncz3odwlI0N8NDIRMuegkdSZ4+9zN60q3ysjOIDksXGQ5AI30PhIbu+Rsu4AZvufSwoJqUoO8/x5HYcuhF2P/oVMoeiFj5brVI+gSZ6r3hbq7LPe0wrXcCjaxTHzjUsMD/W8fM6z1c6pZG7eLTKd
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2016 15:26:21.1047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR04MB836
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation when using opkg
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
X-List-Received-Date: Tue, 03 May 2016 15:41:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 05/03/2016 02:49 AM, Patrick Ohly wrote:
> But how does opkg know that "config file not present" is an error? It
> depends on the the semantic of the file and thus the package providing
> the file. It's not declared explicitly, so it is a fairly arbitrary
> judgment call to treat "missing" as error.

I agree. What I meant when I said that "opkg status" output is pretty rough is
that it is making blanket assumptions, and dumping unprocessed metadata. Dpkg -V
analyses the md5sum of each file to determine if it changed, and reports changed
files. While opkg currently only stores the md5sum of conffiles, I think opkg
status should behave similarly to dpkg -V (for conffiles, at least).

Do you mind filing a bug ticket on bugzilla for opkg?

-- 
Cheers,

Alejandro

