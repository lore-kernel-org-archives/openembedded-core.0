Return-Path: <zhenhua.luo@nxp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0064.outbound.protection.outlook.com [207.46.100.64])
	by mail.openembedded.org (Postfix) with ESMTP id CB55860107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 10:22:35 +0000 (UTC)
Received: from BLUPR0301CA0018.namprd03.prod.outlook.com (10.162.113.156) by
	SN2PR03MB1934.namprd03.prod.outlook.com (10.164.114.158) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Thu, 30 Jun 2016 10:22:34 +0000
Received: from BN1AFFO11FD024.protection.gbl (2a01:111:f400:7c10::154) by
	BLUPR0301CA0018.outlook.office365.com (2a01:111:e400:5259::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Thu, 30 Jun 2016 10:22:34 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD024.mail.protection.outlook.com (10.58.52.84) with Microsoft
	SMTP Server (TLS) id 15.1.523.9 via Frontend Transport;
	Thu, 30 Jun 2016 10:22:34 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.66])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	u5UAMVOD011300; Thu, 30 Jun 2016 03:22:32 -0700
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jun 2016 18:22:29 +0800
Message-ID: <1467282149-7766-1-git-send-email-zhenhua.luo@nxp.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131117557544733538;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(81156014)(8666005)(50986999)(110136002)(19580395003)(2906002)(5003940100001)(8676002)(48376002)(69596002)(50466002)(77096005)(106466001)(105606002)(81166006)(87936001)(8936002)(50226002)(36756003)(47776003)(86362001)(85426001)(229853001)(305945005)(2351001)(11100500001)(586003)(68736007)(19580405001)(7846002)(189998001)(104016004)(6806005)(92566002)(4326007)(356003)(33646002)(97736004)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR03MB1934;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD024;
	1:duT9ZA62ZqPL6fveqDwU/3l1/Q7cD9NYSY02VJ4/9iO12skeiIIDxB1r/bO7peyF8A1H5xub++0RBIdGGgk4BIoyesQeFJEeHwdZrPMW9f2Oq5hMc3TupfDs8Btkci09WPItR0+74l9O5WgRU5KPQPZHsbOcUiTctcL73ZW9ePsC2y6oJFv8oZ/TG71ddDgDhcVJJuZRrTnyFJu+K58DLE+Kcl/ew4ILga421LjVxl3W5XFXJLH7+CyyN5riBw5O3Ccj0IpaUuDiCdjQ+a+lPU5M8+PsyVU5aMoz1mw8rI5YONnV7X3Q2hbdkoZSpYRCruDjUr3fDJ9Al+ASO27/XIk1B1iey1ziI7H/F7IPo/T6bdP+PapwNEB+a9jYUygq6bfj0LYNqz17M3IQLuXPzNGjeSTUqWwiQJqqndDl40TGoYuGCDmp5jN7jyPEKP6OWiRVLQdtFCLaXv5Undq4m8cKnXsCMOi2Rh8bqkB/KTa2ZmmNw5uf+r92xvtT0UMgnwcwmIU1HFEILnkQo4eff3A2r6O9OIxS3iNp2JEiQ/L5h13LrxSMCYiG4qGPqFsAhoxGjZSrQFwwqfQMFWUMqeCZz+d/4T12j0+y8dn4wS1R6/FsFtDTBNNAtxLG+7lIPE6biAZQXIRJICXfMOp+XOzei0KFWf+nD523jOQO6XHHEeD3E9TLUm2lEbZZRb8mp3V9oV/naPXRgNeBTqsoigjPVzZLDSF5hokcUULiJxTh+Uz14brNOgE0iDwWhnbD
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 89444ed4-1eac-4215-ea01-08d3a0d073b9
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB1934;
	2:1TVOwiWJCe57HHD75tdN8clCKmjSLGz1DC6dVehv4rYR5/blbeDaiAglJZg1UlWB5mR427hk26pHyYbyqqeOqkjuGhVDgcDmBK6LZPdsHOJHdEwmE8honftX5prmxad1A/uE6AJFyxFhdwHnsDV9dQ2XRKnwl0D2DYD38O6YpA4vPWehtDAMRUZ0DtnuTZS5;
	3:xqm0ofa8Fv4qN0010P+/SMzkg09tWGB/5A7N+jwWCQyGcfhoM5rfRDh7ubDM0pf2wIY8CRKVP3n5UG7my7PkZ3HpSvhC+2r6owWp8NSvVod2CBiTiESZB9TunR36mV1+rVnaJ5fTHA120OkzB0djLKFZjbo4J2j5wu97/H7rNI9a22Kh9SZYDzoK9MaVBv2mUe1VQolhZUepqSTJvEwqyOHBYYwijZLIZyIMxUbBisc=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN2PR03MB1934;
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB1934;
	25:rbAvTY8RQYqv/oHzCr1+LAkmzZIvxwq6pEKPclGtlOsaxUmng2GJatTQ6Dhy2/slGERShcydO3k8POhfwsTKP70/JqaMoP6KDuNTV/IAer4kcv1Y9mXJQBqH0totuYkyFkDFZF0qrXRnxPJJMebbdBek0KiaalTSlr5zhBqc3qBAIDE8GYrPg4PgVTJn/QBvTLKeSP5OrKkn/xcflavRamDNwNP3UtIDDYUr6WYLwPDedkXkmJk6ZphqXBIpCVhHHHWreH4TS6m24zM7gGrf1VgqLBCOZyvrndok/VNRgmopxvG26fbCZP85G2A8yrl9ES9VJjHR7DCbfIROiIp9IYU9oc4yHfqzGFwJ4/ZUPU/GeZJL3WCQ4iH9D0Jy7pm/UNdA7h/5U4ambBRId/K+gPt73zz2ZaH7Zq+tqVL4141xX1VXwh6Zba25YjBYdMxiZws68BR6W5lfKzTilhWSnPvrFfc0wQow0T2l3zoXopXIn7oGowE7tYVF/fGFY6oVisHwQg3JY3k+h+mbWSitS2xScSFwBle7vFwLYOrWrSVZIcfKms7Btxge9kI3ozUB
X-Microsoft-Antispam-PRVS: <SN2PR03MB1934CF6081EC947B665E7A85EE240@SN2PR03MB1934.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(13015025)(13018025)(13017025)(13024025)(13023025)(10201501046)(3002001)(6055026);
	SRVR:SN2PR03MB1934; BCL:0; PCL:0; RULEID:(400006);
	SRVR:SN2PR03MB1934; 
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB1934;
	4:3PlfDvlEQ/6TsJme+l7oncyzBwy0AjPs0+iwrbgkp8fMDFmuspfWvL7GmBiQyJ1aiiaK5YP6KE75Fp/Z1XXpxCm137LLOoNa2jRlTi9INdy9RmypXRZS2Dm5SuaEGnUtBJs8cwo4cSA025kGPwxYWqAz2uvqJ19KrwICypr+Q39wPDhjBK3mhy4cGeejx6Rr2bQJ6jRXE+h4d167V3qSmj5xzRaBpP+qWm0v/K5A2SCoIXYZxt9rOydJJVHHW2sZ5wvdZgzQkVRwka26EAiAU99S+IdH+1Q4MfBFEoCXcjbRUZ5OROYzwlHRDwjT7n9BCI8t9EHS3CLL09zSh7wsVJR+7muWtVu/sKbWkXJmGUu9DSZvpUe7Vb6GbNV2ol0pDRT0ub+xW+oD77/keZTlhAaQ17YhDPVau6YuNAxKwNR+3NPV4HG8wpxsPF/BgFlr3R9ZHUgJn7BiyR5cXu1O3CQQBCvu2HRcF4SJvTQBDdAZZG5jOWf1tJc2CTEHzLHWLDG9o+81A0owC7rq05H4fw==
X-Forefront-PRVS: 0989A7979C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN2PR03MB1934;
	23:R2Y5GH+o4XoF6xkCgPWW4SgDyvjvSfo+Nuevo1+tL?=
	=?us-ascii?Q?Ryu92UWDcdFo4mzxaenEhgguzvXuLlvAcHC3McSoUr16ZryvoWCbVkxcAVgD?=
	=?us-ascii?Q?6iG0X4SHGYUorczq/o4NkoqM4HqO6mvBqWQDTcD0XpXgip5a8k9P1BAIxnXZ?=
	=?us-ascii?Q?oq68Ge0QrDByrnB7gZIZAmfwmR7lIidVPsQK6DW5aDSj1iVX4BrrJ9k+xI98?=
	=?us-ascii?Q?7f3hYUmy/+up/Zq1KkCQpkyyBlAiYYqRh+GhV2choYl855hkjwhU7d0sF22p?=
	=?us-ascii?Q?ezkQNGooHGrc8fC3G+UsJ3hX2ROsHQYAUiHegO+S4pRFdcrT8wVLM4Mdus/h?=
	=?us-ascii?Q?NxmI/wv9BcqNDsbXwgpFk+NRziImNZnPhgG9HEtQUYc7vXXDcq7QSdkIBQre?=
	=?us-ascii?Q?pOgJdflyF4hzsoKFmhRxC1+XqTPZnAWpSM/3rmwfF98X5F/4VDBjP5c27V5K?=
	=?us-ascii?Q?kiVN5JkCt1dIZ9NmBS7YO7anDASfO1rbp/Q4lZqbiFn5nhdTBTHwiZq5fO2x?=
	=?us-ascii?Q?5FYvZEYbcErfCKDRkmi6cpbzvYYFAI6g4rp4yAaud8jIU8LrLKXUipBEaK41?=
	=?us-ascii?Q?eT1XJlMZYfuFt9TiHXajljiXScpattqjtz9X46r6GysYcrT9khdRO/+gAvoh?=
	=?us-ascii?Q?0trcRK9cq6fR9vuM04XM8fB8NFVTR3bUreykHX8/8TD8+gKWNAKe5VlE/JTz?=
	=?us-ascii?Q?WQSUd+S8/+zvTKDQrErMl/Ag5jMN+YV2HzbzCjNd9OC8LPZbDlGoXPEJQvJi?=
	=?us-ascii?Q?p7tnF9rzsxrxVPEt8F64h7AhWlP8NJxOt2NjyJ/+ghkA0IIDqHOYciE4PVSf?=
	=?us-ascii?Q?e3vSBcudeIclk6+Rw+kVY9UUd6KKSlDZ+ZQSrnW7ft0gVV1YtQcjefEdCt80?=
	=?us-ascii?Q?rJMcX1a+7xiDJsjvsDSQ13/2R0ovXOMeqilAA1MxIpjg9B3AaEDncp8gq7tt?=
	=?us-ascii?Q?D435VntfZYhGP77v71y3l3WzDyRWEWpe95RW4T5pcNXxtso+JN57N57SWnad?=
	=?us-ascii?Q?6eU1/7ia+lQYIHBbK2JAP+bKymgmq/kBOlB6EMnq9wfaVxKalw4FMwfkLDVd?=
	=?us-ascii?Q?dElDM4Ri1VoAEvDr3BPytVj2MM0G91+Hn9JKVmjk6WL9fPHikAsoRJI85NSR?=
	=?us-ascii?Q?9YVShNP7OcDn51lklfH2qHtssFD1dejYY6gg76I57/LCpn7FacJzw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB1934;
	5:h6vg6jj/v2TKVtJk9K9c9KOHbYJ/30NQ4Uxtb1gAX9RQDoaB93T/vrGH2YnAtixH0RYpQL4mre3jmnuihPm2FXa/yQWXbm2svYFaki9//4YHgSYYsRNF3vaYSoyNEpenvNeUoIHFDaq0qpLJIM6c5VinAaIpmfrDpJO8vXT9PEk=;
	24:ygcXedP4hptjoGDTtCciqPqmQ63WWhpjGPJvNB43s3W+v7fn6NmqVwnY6N2rzOh5APLFWS1FehTfMKN7Ey+wGFkLfVRDvHT316OexJmmZMY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2016 10:22:34.2393 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB1934
Subject: [PATCH] socat: remove the hardcoded shifting offset
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
X-List-Received-Date: Thu, 30 Jun 2016 10:22:37 -0000
Content-Type: text/plain

The hardcoded shifting offset causes the following runtime error:
| socat: xioinitialize.c:41: xioinitialize: Assertion `3 <<
| opt_crdly.arg3 == 00030000' failed.

Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
---
 meta/recipes-connectivity/socat/socat_1.7.3.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
index 6da9a17..4da6d39 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
@@ -25,9 +25,7 @@ inherit autotools
 
 EXTRA_AUTORECONF += "--exclude=autoheader"
 
-EXTRA_OECONF += "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \
-        sc_cv_sys_tabdly_shift=11 sc_cv_sys_csize_shift=4 \
-        ac_cv_ispeed_offset=13 \
+EXTRA_OECONF += "ac_cv_have_z_modifier=yes \
         ac_cv_header_bsd_libutil_h=no \
 "
 
-- 
2.7.4


