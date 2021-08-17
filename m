Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.34627.1629169904514373560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 20:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E13jocyM;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3863d9f4d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17H35EYL000571
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 03:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=rdb7PEiDN4nLMtFTkCfhRJxFtz2m8jF44k2DKZLWa+Y=;
 b=E13jocyMOEyfVJ3cWckotcCIn9PxC8QnJrrSQd/pqsL9DRHypZ9DjJ7tRgBRZRgnMbSq
 bZjIGA5NmUUkdkw1GV+c18zCEfTeSKpxuW+KaUV7Hdg7rOptl6sppEoA9myfUuOjbRJW
 pKN8yZUOh9dop9CZWbDf8qwdn6wpmXmElZbbLHTEIuzsmmfsZrZhL7+rgxNhH24m4VJl
 5ZSWyn5wIXYAUT2W/Hk8aRKmOPpjN5MaK/drCZNZw8Xa40xJOVBrQwuYMQNPZYOHRf+a
 798l0dnsY58XcPq5z5DxZ6f2wWjoZb9d7IBhPS9pb+mBChTa6FGYxzYzshqftIhoKXIv Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwpu87u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 03:11:42 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17H3BgKG013992
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 03:11:42 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwpu87tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Aug 2021 03:11:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh+yLKK6eYF+gN9IpqbIJegRAP56f77aOjsZHCd6afYNlk6CmccQ+PUJeSEM8447DBsDyJpIkou3+iheDQQ22m0QCvLC7r1lKcfWiUWLNB91yk7BYBZ7NIrmvRm1lzalOjMl3oC4kOZ+FDTqso66+GcqTNiBXwXrqagJwfWWOBVGtj60ztU9Js0MEy43cIegOoJJTR05wTEmVPJyA6EeWCnccB0Tsc94NsG/v4Xu2mY1oamXx9raXf2+iLG5OjN7XANRwBPG4e2yz9YzmmeiNzUuHi4M44cT4GfNa3UFZtnvvo42PvZHflKps3SDNjnU58s6KwaTDvUOmGmVVgtJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdb7PEiDN4nLMtFTkCfhRJxFtz2m8jF44k2DKZLWa+Y=;
 b=GToGDhekNC7uUAKb+hgBf5PPQ8NtYXNE1GPT9nwxVRa1iOOPejIla7gRWhJShiscxFcoj/xvKnbGZhy/WNgjIjd/+CAbJG5n+Buc+sAv7fQt4JGAbFE4kKjeu7lwRGFMvBGExGgvDhIs6WplM+mPyOJgqedBwMNyRPUwhy3jueC6jx8zUHUM3Es7AMRhDWOJ2WOAUq4r3k3IUyUQgccQA7FmmEuEb+BdDVkOvrpS9LVwxshXIrOAVNTJyDXQPhfaxyCgvcCMUJ/766YE+MHsrTt3c6VVaojTpvmIkoRXYFx+8/vE2uMs9IHMlcS9541RSfLgKu9sjdxz5vy9ke1nyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 03:11:40 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 03:11:39 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH] shadow: update default settings for useradd
Date: Tue, 17 Aug 2021 11:11:24 +0800
Message-Id: <20210817031124.35396-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR04CA0072.apcprd04.prod.outlook.com
 (2603:1096:202:15::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR04CA0072.apcprd04.prod.outlook.com (2603:1096:202:15::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend Transport; Tue, 17 Aug 2021 03:11:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 387b4e54-264f-4c29-2610-08d9612cbace
X-MS-TrafficTypeDiagnostic: CO1PR11MB4961:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4961C2343B0EEF8DBA7EDE6BF9FE9@CO1PR11MB4961.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YxGim6xd8R3liQu/0J0wBkyF5YnvEfqow7asriTOieFMDhNRNn3zmairX4QvQoDDE37EsRepGjNhxH1WSs7kjh/AtHaygoObWi3FH9AZ1Vsooe3ZiKjGt7DC9GC37bUB45e7ZIkWbv2yAmJZm4U+TyzjEGM8DGTx4wyeL8TcNkp0PWurjScP+3yl2zmdvCJKbzjd4byg03w0xzQ4cb+xLVRdNSbiseFlDg7oDNwdDwKtMUgNipb/ZTAJkGz//KImo7yaUdLdPTiq4WW2AN4sgITI2ClXrzQ4T9JeNLMkQP2cFb6n70xh2Sqf4zlReyn7IYyyGPdtiab8MSE5out9DnusHKn8/g6UzIZmiWTLvdHiX5/l+oCBloEm+Jq5brboWx0wk7fPnkaKK8rhYpd01CNThJO2BsBGcRhc3gG8VTLhxGTHUQeOiI3EL1AitRuAYymKERQrR84mIKDUhuNku7G0tKcsvcOdms3mYOenu/x/dvX1EicLB4S47bGtYhVSCTK7T6O5ILZxEvD6fzthtbXdhm77gy4LHebcoq+4UVGkrH8uBDZxiRlsZgN0Zn/rnBYEaLD5W0huSM979OrKkw++uch4Q6/ox74Pu1pDnYFHU1MD79eZDvogsyt02Nd00X1P9KSIDA4aHtPKrJmuobIUJdfcH5q9Q662UM3Jo7w+dxWX9Z996hvwo3RP6xMg0OvaoFbtrWTKb0GWP5JMj1/8ora0PmZL5FSWnAH973PMkoQtVjjj9Nw0FF7NM2tCictbtJK8uPXShAbxA+sRPtSqP0D9ys1XXGc8u1c4iz/NDNAZ7xtXq34/JCJnTEMNwwfXx9Vl5cjQBGNhxklFQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(66946007)(26005)(6486002)(186003)(6512007)(66476007)(1076003)(5660300002)(38350700002)(38100700002)(66556008)(52116002)(6916009)(6506007)(36756003)(316002)(8936002)(8676002)(4326008)(478600001)(44832011)(956004)(2616005)(966005)(86362001)(15650500001)(6666004)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TQMFQ0sZul5kYTXmPhMSd4oFbjFYZZIE1dpKC+2CXJLcJoUjVt7d8qdd6kQQ?=
 =?us-ascii?Q?vWe129HioXR8bSEFPdwDnHP5e4ZnT0BS7Ft73tIdorb2Zaw8X+Fb8qw4Dc3H?=
 =?us-ascii?Q?vrbhtOA4lrdAQj0czeTSWxUgDlKnXW+xskx+/2s8ETXUCvei7IBF9l3OErLn?=
 =?us-ascii?Q?4dRakIHRaXjsKkrmo0w0jzKfzt1wm2tKud0k4vdk5+grBuXBqekh0iLM/qCw?=
 =?us-ascii?Q?Z4mx20Hh78seJfG4bME+n+p+IKeo6vujYM2fJQe3doK4wY/dBaz+KrAIEtjd?=
 =?us-ascii?Q?3l3LF5/FDRzV85KIeN72Yrp9gVbs90c4CPX2jsuxfHdld4N2t9YJMDEwW5Ak?=
 =?us-ascii?Q?YK4HEqqvAqtaLv3ysUjLwCRpJntcJyZcOvJLVItDlcty7sKrsy0Fd6mNFS/Q?=
 =?us-ascii?Q?gr13Kz1yImzcd9TdeqqBxGe6cKCvgYb0GwuXTV4QHohMaCwBw12r4gp8vTzK?=
 =?us-ascii?Q?Cmdyuv2khSasDIOUP7y3ihAKa/W0SeXfL2C5p9QFTajQegh1RTCWVPYMjI2+?=
 =?us-ascii?Q?QGXM8PzGbMD/eq3Kmv6U/yEqErSmAU72+udCf4tBnyxdVTgTQ57TLLbXMe5L?=
 =?us-ascii?Q?ymMSWxC7jSOKqYvzUZfk6dWdf4eTjVEl84T7hV65bcFf5iqmBqHOKPuIB6gh?=
 =?us-ascii?Q?aKTGQfI+VxpXJVj+XcbfOteeHyKu7sp8ludfySCkHSr++iRWseoNywt89lIn?=
 =?us-ascii?Q?rdAQVf+LAKkHFh+9KOXmmS442MLnXkxRzwokkSKYjcGuDBPdeBf26acqSnbN?=
 =?us-ascii?Q?uSaElW0c0i43zrJYeegk7gVFrePiis8N2H73bVhOj1KFfqwHXqJ7bA6FZMJk?=
 =?us-ascii?Q?qNJKtMtTF6n3g2fALeFFFZN3qgntdPXHJDNMOHp16/UEwN4UV13DR4XgifyI?=
 =?us-ascii?Q?b1xAfMBQb/dzcz3RZUKWjRO7GqHh+4i4+yplcuriJbTtbrMaxntxQZfJCVt8?=
 =?us-ascii?Q?EOpO6cxNJBuY4Gboe+e+dR2toUZDixal8wli0WlsckpC9gRvDmGgntt0zAAf?=
 =?us-ascii?Q?Zjgknmjnh6UBdE44ofvQFEBB3XjqXSx8RWNn0QWVsaOHr11Upm78+nsO/luX?=
 =?us-ascii?Q?a5I0jO7kEkv9cLZtFA0SpXE4FZrW/FX918KIdNgk25Pd2NarnVduuPCqwTsv?=
 =?us-ascii?Q?AR3UawhaO/jvrV14QNmuBl0yk8+wOy9BG3nBDLIFJKNvHpvzmkXfepb5ArNA?=
 =?us-ascii?Q?Kb7ktUido7OkLrdTIMfwi40TUPm3Ewo7+SbKWWyUSPpaDcRBjgBGUIgbWI1T?=
 =?us-ascii?Q?+WwMLz62OsSUckh8f5J6CSev/PhBDMN+V3OsV/Q25i+hgEDjkgURMWho/YgD?=
 =?us-ascii?Q?jNpH9yRQZ1Xdgh/hTc110XSm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387b4e54-264f-4c29-2610-08d9612cbace
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 03:11:39.5898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFAAqSHlniPJL0fG6b0yFp1OL9jiOsJFNxMm6+exMdzFsxBiutpUlXdl09LsI68piiESrKnF6w+rOfn8WRBgIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
X-Proofpoint-ORIG-GUID: nJwiLYcsNU2f9imIW54KO5q1idBqCj2T
X-Proofpoint-GUID: CeYk1lkJJfOSIpsXreoJyCa7lmOGDMGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-17_01,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170019
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The shadow 4.9 stops shiping /etc/default/useradd[1] and uses built-in
settings by default. Some settings are not consistent with previous
shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change the default
shell to /bin/sh and stop creating mail spool.

[1] https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...0001-useradd-update-default-settings.patch | 38 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch

diff --git a/meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch b/meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch
new file mode 100644
index 0000000000..1e6702019b
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch
@@ -0,0 +1,38 @@
+From 46106ec16409ea99f73a8a8823e50ac54db8e122 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 17 Aug 2021 10:11:27 +0800
+Subject: [PATCH] useradd: update default settings
+
+The shadow 4.9 stops shiping /etc/default/useradd[1] and uses built-in
+settings by default. Some settings are not consistent with previous
+shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change the default
+shell to /bin/sh and stop creating mail spool.
+
+[1] https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/useradd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/useradd.c b/src/useradd.c
+index 0d3f390d..715351b4 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -104,9 +104,9 @@ FILE *shadow_logfd = NULL;
+ static gid_t def_group = 1000;
+ static const char *def_gname = "other";
+ static const char *def_home = "/home";
+-static const char *def_shell = "/bin/bash";
++static const char *def_shell = "/bin/sh";
+ static const char *def_template = SKEL_DIR;
+-static const char *def_create_mail_spool = "yes";
++static const char *def_create_mail_spool = "no";
+ 
+ static long def_inactive = -1;
+ static const char *def_expire = "";
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 97ffae978a..e2a7a5bac6 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            file://shadow-relaxed-usernames.patch \
            file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
            file://0001-libsubid-link-to-PAM-libraries.patch \
+           file://0001-useradd-update-default-settings.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.25.1

