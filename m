Return-Path: <chunrong.guo@nxp.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0106.outbound.protection.outlook.com [104.47.34.106])
	by mail.openembedded.org (Postfix) with ESMTP id B953B71A82
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 04:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gbYqjXfbwu5WTqJi1VnnU2BE5m8Kj24/vf6p5ki0LvY=;
	b=OOXTBGrTTtBRZYDsO8Mxt1IcVLseuE8ZGBMwly6gsEiOFKEWEDJdNGst7fdcCNgey510/rTyYfBl968QOcnyloYwFWURNLF/ZXvMnPAdr/BCzrXIl/EUyjDEhMr971JcBKgYmN30CPhzAH+00UHNT4h65Nn3La7VJIBkpXMhg9g=
Received: from DM2PR03CA0030.namprd03.prod.outlook.com (10.141.96.29) by
	BY2PR03MB379.namprd03.prod.outlook.com (10.242.237.21) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Wed, 17 May 2017 04:11:01 +0000
Received: from BY2FFO11FD026.protection.gbl (2a01:111:f400:7c0c::125) by
	DM2PR03CA0030.outlook.office365.com (2a01:111:e400:2428::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14 via
	Frontend Transport; Wed, 17 May 2017 04:11:01 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD026.mail.protection.outlook.com (10.1.15.215) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Wed, 17 May 2017 04:11:00 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4H4ArFp012079; Tue, 16 May 2017 21:10:58 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 May 2017 12:10:44 +0800
Message-ID: <1494994244-10488-3-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1494994244-10488-1-git-send-email-B40290@freescale.com>
References: <1494994244-10488-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(39850400002)(39450400003)(39840400002)(39400400002)(39410400002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(105606002)(189998001)(54906002)(104016004)(76176999)(107886003)(50986999)(4326008)(106466001)(36756003)(38730400002)(5003940100001)(110136004)(48376002)(6666003)(8656002)(50466002)(42882006)(2950100002)(6916009)(85426001)(53936002)(2351001)(8936002)(5660300001)(305945005)(2906002)(47776003)(356003)(81166006)(8676002)(50226002)(77096006)(508600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB379;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD026;
	1:zKnFljnCYY7kElPXpBsZvVxEVmi29MvuKaDiaFeYsr9I41rrxue1A3L5PMsgfQ0Du8cYgBr9y+PiEHgt4c0FPKkcYiHXtW0qZFvqzdaQU68Pb4axcxkVtlIeyBVwugG7Bbs6lgY6OULGOjueirIqylJLSJg3MT2kEbykgUz4azZ8KWaEieD9JLg+s8PMWHeoVdAQABr6JvnTbc0yveDi71/swNV7R9xPwJAlTXJ5uDifFT8LHECtk6tkGYaZDBl1eMo3JZ2rx5G+X0f92Wa5fyfoWVL/meAdUm8/jcjVJ+NLWKCxAtp9Ln+1T2e5bDpn6RhdLO02OWSlwOylJJ8MswtaAT1lAGN1On+2BkXaupO280v6H/7zCh9uqC1MKHbEhDb1KVa4wTfVb8HWcqCIxioqYoUeORrNPd0SmNx/LuoplC4yS4dLg3ppeJzLPL9teCY3yrtjgFXCpRXyxOHh5XkgqPyA4hRfvUn79eGFtIAetaanotBAzEEj2tV8t5RH+kOiJibs+qG9vcy21v253kIiEtb2GBAAlIuCvbVgS+0S0rDmhXKfKCKNACPf/taj1wDAx79ytc4E7eREEoSyLg==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe1090b-ac82-4752-46aa-08d49cdaba66
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BY2PR03MB379; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	3:eibLXGYG99R7O1XtEI6MGHNeQ+CHpjcdXB7s1hcpGLiBfschgnA6Ohneulj14Xg7QbKAwB6k0MWq0/rjmew7yDMxJnjjx7KXhCzFXbPxiV9SQdSkr+HBjqVUxCOftWIzlVVrvf2bh37EAsdTP7ytB0YDEJPIH8UnUeMAFAJjn2bSaaJFaA4nfP+Ra5I0KJTj2TeAgxp9aFCTgZW0pjhezj/tRmztPtdOvRUgUZaJlCn+ADbopZfVB9bDwQwU0h2K+/12hpJgd6pIIojAPrbaZRcY/gAPz1KzRKDMcXCAdWVKTUOtdH7OBw3mrLzsWnlETIogOV0d6drNe3Hc3uRjTmBM+FKeZ2e5hfBEmE9Y7huIvkWmy2CrRT11LDguaQheqKnBorJd1DV+N9fviYuj/awR9IORHtCmINVndJOPzs9/8PcM3D1effOA4cYW/Dxe7xG7vLOoPzRbhsGTlswgFxnDMC8f199nY2vcEPi9DL9Y7MMzTQpUn0sDr3gkdHOV
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	25:FiE3AIHV1jLEHVjq7qeGePCKPvYa7J2TZp9yHgLLPWw8CvCJpxTL2hicur8xX42wMD94AKDHuOHkW+Lxw8PaJQkSwQCVUYGEwxbleU6zlmtYU5lOQoHrn/Ilq7cio49b7/D5FuHrndgACl4mD5d/8v23YJK6Ci/5NaWVDlcY/Bt+R71prUIP9S2EeySFF63w+TpennRu1wRPGkrj+ta88841K9wVUIh50zTFtF/wOKJk3og8lxM9EOy/nHjcP6QXbSgJ3BfS5k6xjmsVEKZ+dGkDbMJhYEhHIY4nONI+b6CA32Zx1dRZULtxGmBHvMZsX7e3Z6yUSbk01wgYD5kSsmtv59Qjlhb7JQxXYrJoXsnFVyWGU84Wzl9DmwW2a61ghGuVIogfea0NMuDCR6CJty+Mr2gBVUFM4cAIprh5b7w6SkfZmdkkxiCArw8dciZgFmTBU0aZrlFtfFS2djPMyQ==;
	31:JZNy+5yEoL3ra0UgLHHjB9pvxZLAz040Nv46GBBI+Ghgak+CyNKVmBi+MeKCCKmmZFtT/qkmUntxEgwr6n6Zjgzv8UB08zkFFInNbD11Ojh6YNAdTq2VdOZKVm13Ag+EBtOCqwARbe1uHWHBUjaWHzofpK98WZIcBkzP5lx6u41Xy/1ajW1pT7F7onQli8QY2kMfRtY6uj7oLv3rEsP3O/tUrdIaPtdFC0sekmQWiMYh8t7Ldc2GZ1Ov6JaTJor8neVyC+l9YRt6cwTbdGRf1Q==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	20:XTDDHkf4BVxP9A0lvpjutkHraFoyOoqJSVSO2vEx5XANrc11VHuwR0vjKha7pv9UTCMa6ethi2Sci4MX25+Tvn2AtPBzHtfDFSZnlq5lGJlhucZo4mFvKRszZG1AJ/FWpw+aqIqYOjv8PApH1GAsBhZH+AGlmRk/ROX/ARX9+wPPrQzHF+XK5jyTMmAXbiPNpgiOMqEKvKyTNSb9kyYNvLh13FGRf7JHCQP/h9Pl51zTNph8L7O8nfPMDxPgLj5O46wHqNXj80LidborJFBoyn68KXvweRhfrUWzPr3Zylz76PMnnR1JtunWrTl/8r71Pz6lHTcMZdiVlMGRIkUKSWSjfGQ73Bz1XQj6MRLu/cKRK4cPrpj8CQ1idSlNKlkI8xxJBtFz/l/1wk8TDXkBojJekss1bHfbO4wtAKVg/qshVYnpyBFizeJH2ECqoQIlyNLCBEXttUOAU7/sOtlAhFsn+rQhf8uiiWhTiiiLy0QgZ3F3otGSOUueSXkxt/AYbKgaH0ATPwH/3CB6ZquWCiqYXE3umSO9PnjNWhEkAK5eCoxm1ZmiPBGoAqG3MXrFrRe9O8e93a6uB3oVQPjzbjqJP6x+YopJ1uz9H5QNosA=
X-Microsoft-Antispam-PRVS: <BY2PR03MB379E78C32CF1B82CC9BC0F084E70@BY2PR03MB379.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(13024025)(13015025)(13018025)(13023025)(5005006)(13017025)(8121501046)(3002001)(93006095)(10201501046)(6055026)(6041248)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123562025)(20161123564025)(20161123558100)(20161123560025)(20161123555025)(6072148);
	SRVR:BY2PR03MB379; BCL:0; PCL:0; RULEID:; SRVR:BY2PR03MB379; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB379;
	4:bX9zMPQknQW7N3ep8HDe5cAYvi+14gvmNKH/Hc177Al?=
	=?us-ascii?Q?gY1TkaZ2vR2GrmvYtvVeyGmcY0FykZMFsBDzSZEzhZBqfX12k6hXw2a3ubud?=
	=?us-ascii?Q?4mMFYZfWwtXFgldrFbL+0pPTD9x/e77Yg0cUnbJ/n1l+IAWxP62b4TmGK/Lm?=
	=?us-ascii?Q?w4iqInDOuIFR9LgljeR+++z9p2V/kL3NFFZS0pYVGz+d4QFibOnL7NHT+u1z?=
	=?us-ascii?Q?4HTGsS6Cppo6H6uE4JSYCCaV6MyYHaKM0hPkYjobbp2kZE0cWXjvPb3y2msP?=
	=?us-ascii?Q?4LeOshaLN92oPPQDMrDTY0bbYl8KtNMmMrSKctM4JFCvxhduPrAYq/78o+VR?=
	=?us-ascii?Q?2N8qxbAyTW7+hnCqHVOCbhYtlkxihx9FRkl21gLc9Y96KRDAcgEWjdQe2u5V?=
	=?us-ascii?Q?SpV985S1D2JiHzbfkgriryzbmbb3uB2qjVgfb+GCEIZLQ/Ovx/AQxMnApmAa?=
	=?us-ascii?Q?wadrNyZMMDxXPyDPbTQlIuYtyabfxsNy5G6txNin/zJuIOyuUucKKTqSkmti?=
	=?us-ascii?Q?zCo+Yl6PQoXjrSS5t3PJrK8bGcIYhgU60tBjE7HAWjxaf+Pf3iB1wV+UDqIU?=
	=?us-ascii?Q?X4k3GZ0GCTdjnjOce37Xo9K4pe+7Ep9CIns+5cho7vVjGR5t3XQOyZATj/lf?=
	=?us-ascii?Q?uanh+55dq1jegD+cWA9oYmF9aUh1FIoUPH1lStaaslnxSrr8wiczcp/tKACp?=
	=?us-ascii?Q?K4jqY5blc0O73PWNBhHqfzUYy4LZ6j6ir/4ef7Jh+6hUHRStdOqRRXlXM9NN?=
	=?us-ascii?Q?EROabHY0JjqBQB+keTsd1xJ5kKmTraH9iW4RMRiOcXfqLuO3vdSRIiEwHnsb?=
	=?us-ascii?Q?43DDfCcDyJWrSmsKd6vmkzhq4XJOS2DMiWfPE6xA/YZxPMOWied3JANNZIZm?=
	=?us-ascii?Q?xb6ivvdj4iURaD6TsZipWAvufMNNx2glTlGWeoNK5Nw90vVDudOFXrJk51nJ?=
	=?us-ascii?Q?qZiPG3ohpavGCMCwW9kUdz/RH1g6J2giJHaaAIA=3D=3D?=
X-Forefront-PRVS: 0310C78181
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB379;
	23:AvuhCRa7HgxyS533ReyDfskP3yF47x39eDhNlPu8e3?=
	=?us-ascii?Q?LlNIRpjtHeHhfB0ZIw1Lv8Z+ABo7D3RJqKui/pBpET8HSWEdInoRYy5gNhY1?=
	=?us-ascii?Q?kSZLMtZI1tJoq1HZms6k4NBhJp4X54n9578eDmeSYSX6oX869MjYzlZ4TF1f?=
	=?us-ascii?Q?imyr1N0XfUCFiftcwfgwmvzETtymmLcQeT8Q5CCkOx05+MZcu1ZVOy4lQBia?=
	=?us-ascii?Q?uv5WNFtnIiInctil7HokUwfBBiplLFFybEN2V11Z7UBy6s9HSDrC30JOAk47?=
	=?us-ascii?Q?wPKiUiFTGoBoz+4BDOCLxPCtHQ7Q/DGhGvua0XwS2ElQabyOvtBWaxyvGiCS?=
	=?us-ascii?Q?1hfG4v4H49CfBPucwudR37447gyKxBJcx5XjAxkG7mO8kMUIqYq+1uUjwa8Q?=
	=?us-ascii?Q?NQTo3SLK25t7/HxuLZFd69/yLf7mRkj3H7YR3rPNImY8gDCeKzMgaed9t0HM?=
	=?us-ascii?Q?SSEOifhAWIEvXstQFIc4w5Ymt+Y0JgSm0olGgA9Wqtqmwt14oAYm3fr3Ioqj?=
	=?us-ascii?Q?xlmaOYglzCXWX2SQ0pO9ydNgY+O5Hk6aCUAFqoQAchi8MRUEilw+QXUv2Ked?=
	=?us-ascii?Q?I/I0ck12XPKNx3FfKasjE4x2I0SSfbrs4qANPu8UTIX3SK2cR0oLzVs28gHm?=
	=?us-ascii?Q?+jCG9uc031WQGslDcWywfRXzH0jyqK04Cg2bZyBfkyiKbRzFfsIlUOf4SbYV?=
	=?us-ascii?Q?tcJoq2ikxVA1rc/1KB5Fve73tpHkMk6Ko6KYruE8Eo5bueahnipRg7H05TSA?=
	=?us-ascii?Q?Nn+JX8NNrbAfeWPuyA5fo5zaqh2LtYN1YQJ/fXFeVM0GuxNwrvmRVkkuxwWg?=
	=?us-ascii?Q?E0+d0qd63hwDId2IXXtAZO6h4T4pThZkkjp37oKKv9xrc5wWrZaUwiuHhkNv?=
	=?us-ascii?Q?CHAa2iy140bnKWnXdMZcYQKlixoutkCgwy0/1DRdYrnlDjZP7HOallqtuzxu?=
	=?us-ascii?Q?hw8t3Eu8LGhE7UKsfo+jb1v3WRoV1ja5vYcFDQLniJq5hSqa4T4+sudJZN04?=
	=?us-ascii?Q?UaOnRZhbBDMbM8rsLM2zyOR2m5kBnpO7t/OUNKqXGycvA+E+7i/VzIvJDCXw?=
	=?us-ascii?Q?pNBan8ZbT7yNHGNqM4XTY6nt3k54DXD2h8wh4IHsCSVewJsWaZN4Ck/Ix2wA?=
	=?us-ascii?Q?GyLdyIDwhGpJ24PU+o395FZuYTF6JxCsJTYZ5K3jw+3lCtfLrNdkilzxiy3p?=
	=?us-ascii?Q?vak0qugqY8AezARqupXdW87vgzRHJ52bJZ?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	6:u3sL/QaRvZx10Ns1hF/2a45Gxd5pXu3OJb9aTFoReKsm58GwYU7K/WDVWAxte9MJMDyZnznmsOKRHUgEVW+K++biFpIiIDt6NH08LdcSuo9QOC+94ZiH+9SyvKybCC7pJ+rfvgE2utK70JiZrrxwgx/P4wezhiYXVaRDgKziwjJzWUdYq34t4n2dBzXZptzGgSgLsFqJA0hv0hN+03xnbaLHgt2sVfnOFasTvuh0gZONydsaJeOePau4HMTOhteV8EMe+eAVhWn8OKsS2QdtiDjf75/LvbClOCwmGelnFRzV+yHO/DkdTpuSGGOeeK3Z+wpnshid80mNzOy7jm5OTifhEPTY+e6bedos0LDlJjctV1o4t3V1JK+ZHLgK7PbsD2sp/c4c5FZY3w43SdazMYd3ME2uNN7d/Z4Q1htqeqkNUbv+gDWd/1kM/a9bwM2rWKMPi9MZXBoI1YpHt1JY2ITvJDMHL14oaKI+jqmKefQDQuYWa66kl8KhVaXxwnUnvvSfbf+4D176ziGXFUH27y4VqxmCNuDOnYehqAshFwo=;
	5:xUwo4TA/BGdDy2Zi2VawUo3qcw0UD93xQ6k9r1j9hzhf5zq32XFziqoXrbLziEpkTebBtGfOQuPHEQNCRWBuJm6Keqi81bJw+ghDwDwZofQvKcw1TjYvOs+SIa9G3n2IPlr73RhL2BwEWMpkLbGOhA==;
	24:ywCPsXJpEuzZKtJMOH6+Qy3M82b+tqSZ/zIS3TsWX9eJ/MQMBBXNNlvgQp3sYt9fphVLmGUhWneFCvoEAnZLvbuS2/GX+E1ac0L00a5OZNw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	7:5zNUiiZmj4l49yS4HQO6xw81hKLyikM9aqTBIp3aI6RX/09YNI6JgXm5PfX3I+7rPmqrbi38e8ZaDyCkHvT2WNYqC737BUFGaWyR86ibeRKlSawxNDLgN47y0XmrtVnw3B6bbWcn9B4iHMs8HHUsyFek0BdpRfTfRjGNRmm1+h2xuVmjeJUw8wm6Tsuif4oY6utevvrGhpUJbueoHVyxeewPB3TmzpGV8qwzGHr18ojiynpNJEeqwBcK1/BamVjx9/tx7LU4uPZILQ9vwJjDWA7i4ON7+e4XXBUfldBFITsJFuJtH36hh1mA5or9MxSkM00fwPlhUDPwTg+I5jPNCg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2017 04:11:00.8279 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB379
Cc: chunrong.guo@nxp.com
Subject: [[PATCH v2 3/3] kernel-fitimage: fix KERNEL_DEVICETREE includes subdirectory issue
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
X-List-Received-Date: Wed, 17 May 2017 04:11:01 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

  * For example:
      KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"

      ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"

      but only fsl-ls1046a-rdb.dtb  should be used in fit-image.its

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9fa836f..08644ea 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -347,6 +347,7 @@ fitimage_assemble() {
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
 			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
+                        DTB=`basename ${DTB}`
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
-- 
1.9.0


