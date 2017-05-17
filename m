Return-Path: <chunrong.guo@nxp.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0137.outbound.protection.outlook.com [104.47.34.137])
	by mail.openembedded.org (Postfix) with ESMTP id EDE2A65CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 04:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2cc+HGZIr6ummT2HgWtH6w4+DU8yddSDV68XF0D2p/0=;
	b=KROpm8m9dyBO1py0a/FiMu7KH+IyUzDp8ah7jvFaGtfeMAyT9wDvtxiLChX9f++dbluBqgSa3H1ViuFItq8YCJUomFNrfsHycnMC05wotTaFWJ06KU6jgUdaa3mGlysmcGqP1IEGJsV34HVHuspNLaVtPK9DtOqjsNApbwTcTHE=
Received: from BN6PR03CA0066.namprd03.prod.outlook.com (10.173.137.28) by
	BY1PR03MB1433.namprd03.prod.outlook.com (10.162.127.151) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Wed, 17 May 2017 04:10:59 +0000
Received: from BL2FFO11OLC012.protection.gbl (2a01:111:f400:7c09::128) by
	BN6PR03CA0066.outlook.office365.com (2603:10b6:404:4c::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14 via
	Frontend Transport; Wed, 17 May 2017 04:10:58 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC012.mail.protection.outlook.com (10.173.160.159) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Wed, 17 May 2017 04:10:59 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4H4ArFo012079; Tue, 16 May 2017 21:10:56 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 May 2017 12:10:43 +0800
Message-ID: <1494994244-10488-2-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1494994244-10488-1-git-send-email-B40290@freescale.com>
References: <1494994244-10488-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39410400002)(39400400002)(39850400002)(39840400002)(39450400003)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(4326008)(50226002)(50986999)(305945005)(50466002)(76176999)(105606002)(2351001)(5003940100001)(106466001)(81166006)(8676002)(8936002)(356003)(2950100002)(189998001)(47776003)(2906002)(8656002)(53936002)(54906002)(36756003)(508600001)(5660300001)(77096006)(104016004)(85426001)(107886003)(110136004)(6666003)(6916009)(38730400002)(42882006)(48376002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1433;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC012;
	1:t5wx3YQ/B3vFpxb/srj2dsJ3psoU9upRfSWkWcKJ8u/99HdUt4CrghUvqcZMlz1bYQTWmJe972UYV5BRkot2tG4Ckvfh2iFzZMxOdo/RP3BVEyhrlua+rqnptsSJYUiUB0COxFN6s6oygJAfxFLy5hL8CM6TZBHZQ6en0GxPIZ9i063TShVBL7VaVarmhtdAjjxRpFj8TFXc37RNXDxcgvv3Bb2iZFPKiGP9uEwrJtMsshdMuM2f1BITcmPzLBvmn8ixBMkBykTxRMBSYPzDmNytwCO9wVL7R845S24tkmkRqyAxYDLcvEQlwiE0b3WpU31s9ApP8Il1XIaaHRihn+46llNf8lG6verLWIwAQ/dseJXe2ufZ1OvYc/K5RG/S1E34UcV6VpRdV00NyKDaLKLuArOlhdfmhUFNan3MIZTxZexLnwEjVFwctJylcdWDGHNYbOa6JSx21DQDCVlwnwOdEkUHt5niDqZ1TdNmVH9q38+2FLTDZN4WxFxxRL3iD+HUR0GZHQEk1Ya6qa7xLf2YyNynur8QbiKwf4cnfqDNQ17dMujDhhj6K7MxuEhS+K1Nl346ZlOT9gWzUPu40g==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14afe191-ae53-4bfd-0f1a-08d49cdab9b0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BY1PR03MB1433; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1433;
	3:lhC5k6LER/EWQJC6Y21k0/oZ9GFxB4NySzDZH+FytUWjR1Sg+iwJjeZGmddnpqqkkUcgRq/DIV4yas5cJG3u2U4HUX2VOG/cH6hO1QWSEIKBCxvC3zRiT2jiuy9/tQmNF+MIrKK4BYnhUMboz1kGYtduDWJ56axMge8nUKxXO0z/ad/T6S2hki/DipN0NU0TRh/L4BXETbUGxDawcNKgIu/bRZ0OvXx3Bpi0OzoocwqawdhhnSFtTg1eRfaQpIYmsqrhYrZJvEjWH/hVDAlJQ9m4Gv5wwUjFjbBwl/6JSIeIusqtGKLACfZHoS+4YV3i7O3EpxGIFV6L5u4CqdFM1+Xo1EwDjCXCKX4SpeMy4GSsksJEae2A7+EhSgODBxVRaorDECZE+sYHSaZxr7/yNNw4SByOC0jImOQyDtt4pCPGzrvSHPJqhu8Exg6p/rfRJd+IxG6Ok7BFZROk7ry5Y5QrlMtds0HCxi3UK2lJQdIsI1jvpSTgmdGY4v7nGlEb
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1433;
	25:iaocgeTpRkB3mT2BdFn8HtBUVjIFrMfOs/kej0khqhgY4DCU9jsEc9HRHuSa0BJRqlbHjMRlQjln8IlhuuiXAzM1de3Im6z+RYAFTCNb7m+FLKGAqmX+so/2Og77ivgMZ0crD9OkdajWO652BfKHxrN0FjdehDzef7VmkIevzyefL49gP+lTwabXiSW5qwe5IB6QFil4Bs3y6qeg2lx4Tcmb+wV7V+uBhj2Wzi67xPoSzj+eZJyE83a/Z75g5yvQOHpXqlVoxzCPc0gR+nQwI9VxwW7eYXNzDb8QM5LHzBf9rhlmlqB1hWCdiUD3c5Vu+x486R8T9+9NYAPzfCuDGCZO08XvxWEdWgYfxo+m/4Xo3Vx7BSFrZMS0iUURSnTz9rX9kYDfADRoP7NqiCqcbV6BOcjHF1FFa/loZAg568HEqtYZHmxYwzJSpBoVSCPsRX4FnTxWAo7xV7gfTBCpHg==;
	31:A++bprHYbXacgFnFgB/Tjfokod4xayjvRvrZTGXZFuljfTJMh5PvffE6lwmG6IqtevZsiQWd2SdG9fdUETMEkW35Ns6GH0p2SyRs8QumXaZ284qs95cyzB/uiiCaET+YPbxF26wueD41BTQA+e7XSjrUkqbBttDYojFrx8be2oG4G90k79Eow+SDuFUe0wHfzseSvIQKKA+ZiJ3ftvQAbkGBBcN9vsFy+vEZ7nMP2LO8y8kmHayXbNcG9ai5P7ddAgh8oNVlY3shh2P8HKR5qA==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1433;
	20:sgRtBVVLwwVwGEco5T9MHXYOOiliySCDDWbPySM/GjCjM+3ihu68XAkrjS8mtqPe72OurRVthHifVuZ/X9kQmDLYThkhDskt6c17CUWXkrJBjTOZFQ3CUb0rGwc4krG6a/147u7iugqxsxiDGitZnKySCnYzy01zSuIfSvdx4jbPn24Y4u9vJZwWRDSBmyBpdMehs+rW6Y3flNFbTsQB/3zQ8KcXd06WbDQQrNmzZLZHr3k+NnA+RtGjn2ev7qJPTwvi4caOUBoAmsm+5qiOIFbtY1b6Z+QoPQIjIiK0mKG+laYwRK7yLITsPswruRQ0P5Znbd/o3MskpHX/YTYMTPi1qRiVqroDyfNtFaAubPdD4Ecc1T6s3Vk8G+ALDwjnxyN4d8HRRuWHiVO+oMr+/XNyOnqiADFnkvVLQ1N/GGB6CjS3JrcRgqbLk7MktE5sml6wUYGmWejomviislF+DZNlXLD3c+Hl6ZFPCi5stIak0a/OfI7nxTCQGL7vrU/mxbhHl+V04hK/uyT3vOdlNCwsDEdzZuswQizEdMU4EfbKAINOXB9vqOhRbuRmK3u3ez+rGpjFuUFmQzQJ9i8taky6swWQtmc+TLsNg5T86M0=
X-Microsoft-Antispam-PRVS: <BY1PR03MB1433222E96BF564305940CB684E70@BY1PR03MB1433.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(13023025)(13018025)(13024025)(8121501046)(13015025)(13017025)(3002001)(93006095)(10201501046)(6055026)(6041248)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123562025)(20161123564025)(20161123560025)(20161123555025)(20161123558100)(6072148);
	SRVR:BY1PR03MB1433; BCL:0; PCL:0; RULEID:; SRVR:BY1PR03MB1433; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1433;
	4:7OAlOjbp0xCCESLLYcwJ9+/TWE+saUj1+AUT7b02L4?=
	=?us-ascii?Q?FdvIJ92jPckBM/gJQ+jGTbyBwFPL/TRTbn9C8GWkfaEIyc3fIFWTofRNSXuO?=
	=?us-ascii?Q?oCqvuq/fIqK88nIAFfVtkWNHdR4Glq6fTYRdz9rkGTvz6PobEtQa2w2JQjeO?=
	=?us-ascii?Q?WVWeK1Mvxl78NtHTlYJzFCqEyCJuX2BCHgObJo5fyaaoL9acmzVTGNKZxzWx?=
	=?us-ascii?Q?hkUpd3jGIfoEqHElK0IWYX2khbq1ZXgmOZEZ0a7TAdc7bJ2iABHqI3k4uelx?=
	=?us-ascii?Q?iStoWO1BtrDqUprXyhlrb/+rrEdICTh+rNg67lBHed9d9uyxlL6p55xaj4L7?=
	=?us-ascii?Q?QSYk/g8UQtm/ZsYOhAdE5CFPB0EjsG0j0gF15WlbJi1c9GZg9zXIepqxOMET?=
	=?us-ascii?Q?okzh6ZrLneY9hhUlQ/BcyJWxqVkyKcUVIeYi61UmMaJ+mvSu28jZ8xhqxe9r?=
	=?us-ascii?Q?dAc5RdtZxPLa/sfVBMqwlvW/9Q8b8V13R5NWgzxGW+jB1bbGjqAlV6CBN4Ph?=
	=?us-ascii?Q?hnwpgmQPm30R5LGMdb1q2+UjEVUD6taayxbkWZ47wfnXJ+c5A/8a1Anu6Piv?=
	=?us-ascii?Q?WcLg+RVCw2ID2/N8O4KJqaS5i0Ke7ROP4u4VCB2ungAHKYfCEEcwBvMDMtlb?=
	=?us-ascii?Q?b5LUTuI7ryZr2+yAOuVtXJ1hxF8SNRZy+8JsXo2877d5HR+vAeza9wwsBh5c?=
	=?us-ascii?Q?Nbc22LTfPb8YcUr6kwN88xmg6+4IetcnlY+X4jqa3FiW1pj2Qkk8haWBSS/B?=
	=?us-ascii?Q?DoeBtpblWHYJsGrkY1es3dVU40tkD4dRKnPleOH5UpQTh7bQzEi+QJh7HiTP?=
	=?us-ascii?Q?mIOvZudOK9tEBbCoFWVnHgjScQIvOdPcDEPzkHurADqGCMGQMNT+rp+tB5DM?=
	=?us-ascii?Q?pAyWHMcr1KM691oB3iWfVBjRuF/5iQSndVdzA8X01ytP25Oqz8KdztlCHKLA?=
	=?us-ascii?Q?vxjkvZs5kW6yBpDbuRFWeDnVbCzwm2+cM2dM9tIw=3D=3D?=
X-Forefront-PRVS: 0310C78181
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1433;
	23:lZoM9gfqWLrCO6ckajdMrbSM7OcngBUnNCKGIjEPC?=
	=?us-ascii?Q?t16aN8Wt7kgfNcJtM0KyKHuIF5/jYpmB0TrDtTkEyz8shr86gNp3eMlXdg1u?=
	=?us-ascii?Q?5vC+h7l3QXAej02um8s1VaEEWPvu7Czeqd/vxZzL8ZJonQfYr2TDN7s9d5EB?=
	=?us-ascii?Q?CkPgBno3qD8T5soDA9jdiNBFwitfXYfzFeZUm00LF9URMLg8eJ7suzRMYwcy?=
	=?us-ascii?Q?VZhfYuolIGuthyIMXRG/ggJmgaM0wkFIdJQbgZ0gV+c2FTBWAczSSpYsA+gT?=
	=?us-ascii?Q?zJCFqSnMOrag/fJXlJP2+Z2gocg4ExOXx03RXjjOofidiipvFTyjOfRCeFZa?=
	=?us-ascii?Q?dpXGO99vzQ16cpDDiEAi9gn203eHPdzZp2D394t0vvKuIAiMn2oSv0KvNRsJ?=
	=?us-ascii?Q?Z+c0sjR46tXr/qByFC4E/RYumf30zJ+PBppY8VbdEJEv+zFIbuuS36tsII92?=
	=?us-ascii?Q?NuOtM3QdcZTRqafKVWrtnHl/0R5EYJL0oJJjqCfR6nejMC7NC90GfmCNdcBc?=
	=?us-ascii?Q?SPW4oPAw2E9xIhiPKszGbn9iMCSbt3GrUXNmve0kcZnIGNyGj29KsJ6Aw9C6?=
	=?us-ascii?Q?mtPKK3BRE8zJwxoGkY412FB48I41NBn9xEUxruXt4ffTgBianT7I3DAJr9bj?=
	=?us-ascii?Q?zgGse/LHhITwhUar8Hg7EbY3T6gfAVMgzZdBasWP9CRbIlbLTtfqbKYk9Yrs?=
	=?us-ascii?Q?S+CnTyALfHTmgPuZIaiM6mLAhNFGUO81sUEC71+PdiFqqJ0/y/1CR1H6X0Vp?=
	=?us-ascii?Q?VeOk7FrbeIsK9+iXzcwTsCRV9rH6Xt4xLRYuz2RDFu3slnLFdqf8KN4+hR7K?=
	=?us-ascii?Q?y2jr8E6YZKE8sRhPulMZzsYMiVTQFitdvxpXJJFOmbGjrgl+pgAzOW7aIGdL?=
	=?us-ascii?Q?XSnCCZoCfUSHFa0GiB+cbEkp+jBGYOmWX18SFc4MMbYcUiBj+MHfxmb5GhlQ?=
	=?us-ascii?Q?yT+FXaErtKA6PivcpE6Eqnd5sHn/Ullp/F4aVy3uEBVkcY0sTt3UzbJqghuK?=
	=?us-ascii?Q?opze0mo2Gh2d0mOyA6F3sH0tSe3CVdhFHvbtwF9/FgUUwjZcAym+C2rCYxSW?=
	=?us-ascii?Q?WjoI4DSmA87eqzbSXu/VJd0XwKNaK7DL86onByS2KfHRp1KAe66KC0bqw3+Z?=
	=?us-ascii?Q?nIp1F/AaI6+fY5h7OliwW7ex44HU5HJMalJao6mo7z2Q0CQgagay9/Ah5gLb?=
	=?us-ascii?Q?ARLCjzkT7wXixshQc8QZMtcAFKvUgNQhyD5?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1433;
	6:g23zkz+sZ0RdINL35ZtyFMXop8xbs7zECCJLFWdM+Bh3rNMOXL1474PL2EXNRbfutUD2ct3t0DG/Y2Sq/uoMU/+0TCsWZ/aPCUSZQ1MF5UJ8YKNDc8/Z3bH893lzEKARdkAjFtyGnZYIXa1JQqmX8FgeEP2L7SMDW72H9cgGqOBcfRnQzWpFtCqlnsKh7roHT/iPHpeSHCzAWEATibzeEG75F/cQJrac314lDw2vLbfHKyjxdu48tmfG0D7XPhfyI6rRIZZp59SCUTBf52GsmmWqzZURZuVqnlpeauIt8QvCxBcaF2WOS+PuWHITKYFZpsXvlUGuXOLkKUz/Z2aZOOmFpMQ3wWhwsqfCQw7sUVvzTIMK7TRhZKwbX5Z2fQoE97Z4Zrcp+g6Cu9Y5yCsCTCOWfBDffdRu6WeCPHVFPELCtkcXKs6IBEuOICNcME/g5mHiztfUsR7nxCjXIrYmXdihF3UVOpNsf3tV3rBLcAMV0b3poT3qE1+W2zqgjD7mw4C9/CI5qQiDFmQF2gjgPwDULvGW0919QcJ9i7oFVpM=;
	5:QVcYBDJsLEKA55VEEKKx81JIiykenxK70Edj+xLVQemmJhvG1gFxmmCCuHnFo6a/oXrffFhVI55j1QIr3n3NXbEw/GcbYKsSKhwQO2fjQD/Mx+Wo5HIKKc9eCbjCn5Csac0RT8356q5EKj0OnMUq/g==;
	24:SWEiOS9pyv1CnthDi+PaabHjVkPSSRghc0HfyrZOJvOjt1Cq1sQqL8x+YjGnZh98hcP4HPpCj2hdk046IdG1Fn43QDrlSCzcWHDQpxNebrQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1433;
	7:ZCRptNvukhpkYdfkYwmxCtkToOWcySXgxf6v0lgXiXkAuQkKz+aPTwxmJ9F+sSET4cSnU0+smTUDmoTusPbS3X3PoYHzmbozK/nw4VXEBTtddpASh+CnX5tgH1rTEFbFwE8ik118z42SFr0y4UpSb5qDZoYyyyJZ1KhtW/7M3FsCpl8XLCc4nyNTwd4rnw5TKQOAX6O6z6KVlcAq+BR+ytZTX2X3fKA/EPqSMhaBA9ak0UT1X4/LjFWnlAAIGgmXLyGyBIwx8Z+VUz2f0X37JIljU3wjQeWV/YyuliQp3jScnhIlkbgongzEdPUwl5zA+1CLNiH/jk7+4q88Sk+wrQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2017 04:10:59.6649 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1433
Cc: chunrong.guo@nxp.com
Subject: [[PATCH v2 2/3] kernel-fitimage: set replacementtype to vmlinux
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
X-List-Received-Date: Wed, 17 May 2017 04:11:00 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f40fbf3..9fa836f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -10,7 +10,7 @@ python __anonymous () {
         if d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
-            replacementtype = "zImage"
+            replacementtype = "vmlinux"
 
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
-- 
1.9.0


