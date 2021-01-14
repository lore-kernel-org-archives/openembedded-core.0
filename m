Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.66])
 by mx.groups.io with SMTP id smtpd.web10.4262.1610603358901040560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 21:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YH1F1YTg;
 spf=pass (domain: windriver.com, ip: 40.107.223.66, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsVRCi4nq5eGX8QpIFY/3Qp8B62JHwbYsbxONT27Mrsqb/S09mAqNbK2k5I4m5s5Gf7YFiEjr6GiZuJndrNVIK5lwnb3yUF/5p3/tc1W1ZSu9hBQURf2ZdFkB1jqjpd6+CTdmfKyb9tuOdCGUbYapaiK/psIJ8DtjkH9zjJm3vv9lCCsuzyGscqpycrU2XcjvfmAeS98W8wGIt2OW+PJRSVhapoTIUTfoxg2c+h4jJ/8/BSvg6g/JCRexRbIfCFAzfAWZAuCjtfwpdZmzcpVFhUhztC0K8GXS6aQy7noaswk6Z9rE/pQuqivSV/kw6p1EOv9LILQtUUG2jWW8oZiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1W+3PxnEoV01CtbPtp2dCCDuh2urasL48lmSbwEuKo=;
 b=GBAiIbH3TE2pjMrK/cFjNIEmHyYsNccfLoJNsr/Ghd7XE8JRIG5wX1qfEfMkUuFy03UCno379t927jnfhh1fag4cEdFxJdsHHpdLKfrl4J9wrbUTMV+pmK5ITmyMKKcBetPZiZDLh4LbFinsyLjXBblLfA83T4RriUqn0QhnqsLFCBfMzFwU7fw/3v+ZdXwEMgMiXzvtQRPh5livh8lkbb9JqtCklzUR9rd5xSr+uSUKWLT+ATkyGeCyKnF5FOt4g5JPSfMJY1wKDl+zW0kU3BrR7dTpxwN2lENVRMehNF34JUgRF5ryq1T7aLenc2OMslet/iaYRHz4t5vd3Uaopg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1W+3PxnEoV01CtbPtp2dCCDuh2urasL48lmSbwEuKo=;
 b=YH1F1YTgxeww2Q+EZ6tD56pgoyPKBQiv3waJsEbs3UpQ1ngP6S+Z3hXkmGP5EVfLCDNAw474sl/PqoZba5HZG5tuc3Sc2uMW4eJMZ527B/nsDaWK9Kgsxy5Bvpb62oGcVraoMDSo1mUE/DOhO9YeHTmdkYAHH0fjvrZL3QjdVXM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.7; Thu, 14 Jan
 2021 05:49:17 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 05:49:17 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rng-tools: upgrade 6.10 -> 6.11
Date: Thu, 14 Jan 2021 13:49:07 +0800
Message-ID: <20210114054907.1067835-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SJ0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:a03:331::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 05:49:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3891e2e9-d424-4514-4c21-08d8b85021ac
X-MS-TrafficTypeDiagnostic: MWHPR11MB1853:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1853E7E66231B5A3723C68D8F9A80@MWHPR11MB1853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MlUjOU4oqgopA5ic8Jtw0DirMGruo1agDBq5UyYhhKoby198Nusoy/QJH/jT//t1ZMWne0HrTPCdcrdkxrrvoc47FepuIWaFqBWuNZVn8nlc0ISkoI7PDEVuIYxDhPLxQNLQQs0toJ+fbgeEJdCb5uF/VsF6gQXPwJ/u7uDYX3Mp46aXtpOw2RcLvcgc8p9yGKJANzpmW0QlTHiEwuIdwjwg3R7SfdRmoCh6bLPYFFFNo2L46zebXFB9B2Jt+i/JEJnNpNm//sGGv7+MIOg1cgbZAmVJub6i5AS/FAPw9CU9txfx0zu41M6L6R3fRDimEwkuIrrZ43C7KZ2I+BydDdy93XLaomhg4/p250xVd1J8SZrRbBPx5m0Dk5sC8+MtSM+MPx6WO6fQ66phqc0UBd+c85LU4dPejP9MKJu31IFogNKRJeRKaK1m3yAHyxtlj5dPRPaSYKX77EgK/u5sbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39850400004)(376002)(136003)(6512007)(6506007)(66556008)(36756003)(66476007)(478600001)(956004)(2616005)(66946007)(6486002)(8936002)(6916009)(966005)(1076003)(316002)(83380400001)(52116002)(86362001)(186003)(26005)(6666004)(16526019)(44832011)(5660300002)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lTEfV2zcg3N2NubPlZio9rUcSFugsuvrQD5WwyFBqG4nwE2HN88cxvp0ymNz?=
 =?us-ascii?Q?O2g+QbF34G72oXVquP1hdJ8gb25z/hZcjv4lwaIhfSiOldvDOmxsNHiggDTK?=
 =?us-ascii?Q?neLXU3TUmQuMPVRSh4+/dT0sLqksjF30pv/eWtGoEhe3sfP2AB1oak0yik7s?=
 =?us-ascii?Q?UWeWANshHqP9GgOk8xmEO6E8Yl3WTtuXItLj9WWuTdDxgyn1SksdVgbMPAOP?=
 =?us-ascii?Q?I2fzCgY2W7glS9DrFqb1Z1+ubftveZCa0toCPc1SlSvcsvZNBs5EQF9EYvQp?=
 =?us-ascii?Q?5wgNOZv6SbMhCfiSXGxqPSHKh4BUUjRCSRapyd4bV2Zr6+k/JNwcA0Cxuify?=
 =?us-ascii?Q?3Qu2VaPLSxAO692Y6Tb2LjpJs7P6Y+oq+Q8sWFquPeCfmDtocsv3nhRC+3Qa?=
 =?us-ascii?Q?hMSYwGVkvPZm30Onl0RSvvHV3WsqykrdGuwTyPeewNoQpYHOn+k/mSXaLT8D?=
 =?us-ascii?Q?nBxsUb9PxPk4DeDyvVRd9NM0PVuWHSPw43RKgNTINNQ36j1LCIsfcZg+NaU6?=
 =?us-ascii?Q?50bAUbIrKpWkqypclkDyrQEyf7+/10batRfMQSfFY2URs/hN0Qi6EJZQ7IJ0?=
 =?us-ascii?Q?PsBdVX0e28HogSbyDQC5pxRRMeCYhFAuyJ6rNKF/MhCScXX9lcd0S1zV8urS?=
 =?us-ascii?Q?0II3SvqxmUF4bTwsbTaca4+mLgbx7iUvdFlwDVSPHs1yRtFf9uKSRdUGvnTz?=
 =?us-ascii?Q?sMbiqbjxDvHjEylK6yM7vd9zAkuY1ml6WeG1v76ZoflaLS6/YQ/XQWwwDTEy?=
 =?us-ascii?Q?XrGXmz7kQpicG0q5v4zX8IbaGhU+HEXGfoJrJGIUBBlnc+69kIG5wd87IJBN?=
 =?us-ascii?Q?WjaWVZLnYoyXLrgyiVXwlKhaFeFFPwjAwEdTeliuBhi2ckEXxWGvyZEyMnMX?=
 =?us-ascii?Q?AcMPNDoyOfsIjDWjwHHc0Nh2hoGwRo+DMnVv65yXvF52ho7t06DhdraTUTsY?=
 =?us-ascii?Q?wEE8AqvA1MNuL5411frgGOD9r0oVoPTeX94vR6UEl6YmdZXjRPyw9vIWMI+7?=
 =?us-ascii?Q?PZd3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 05:49:17.3415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 3891e2e9-d424-4514-4c21-08d8b85021ac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCSzcsESSjz3Xhmgc4UJFZAsoJg/Tgrlrg+gjzRnTXDAJE27sHT74ppwGrYWYsvxItyfQ0HCBi+x800pHpsdrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Remove backported patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ix-debug-to-also-filter-syslog-calls.patch | 46 -----------------
 ...d9ce64f132e463b9091d0536913ddaf11516.patch | 42 ---------------
 ...6a5fd4efde8ef569b358e19b1fcbc7d0d938.patch | 51 -------------------
 .../{rng-tools_6.10.bb =3D> rng-tools_6.11.bb}  |  5 +-
 4 files changed, 1 insertion(+), 143 deletions(-)
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd-fix-=
debug-to-also-filter-syslog-calls.patch
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/a4b6d9ce64f132=
e463b9091d0536913ddaf11516.patch
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/dab16a5fd4efde=
8ef569b358e19b1fcbc7d0d938.patch
 rename meta/recipes-support/rng-tools/{rng-tools_6.10.bb =3D> rng-tools_6.=
11.bb} (89%)

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-rngd-fix-debug-t=
o-also-filter-syslog-calls.patch b/meta/recipes-support/rng-tools/rng-tools=
/0001-rngd-fix-debug-to-also-filter-syslog-calls.patch
deleted file mode 100644
index 0733378668..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/0001-rngd-fix-debug-to-also-=
filter-syslog-calls.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 213a869e8315ead2c739acfcbde712358a842dee Mon Sep 17 00:00:00 2001
-From: Yann Dirson <yann@blade-group.com>
-Date: Fri, 9 Oct 2020 15:12:26 +0200
-Subject: [PATCH] rngd: fix --debug to also filter syslog() calls
-
-Debug logs were only controlled by --debug flag while in --foreground
-mode.  In --daemon mode /var/log/message got stuffed with details of
-entropy pool refilling, which is useless in production, and hamful
-when log rotation then gets rid of the more useful logs.  This is
-especially true for embedded systems.
-
-This change makes the two modes consistently only produce debug logs when
---debug is specified.
-
-Upstream-Status: Backport [213a869e8315ead2c739acfcbde712358a842dee]
-
-Signed-off-by: Yann Dirson <yann@blade-group.com>
----
- rngd.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/rngd.h b/rngd.h
-index 901b6f1..a79ea0f 100644
---- a/rngd.h
-+++ b/rngd.h
-@@ -166,13 +166,13 @@ extern bool quiet;
- #define message(priority,fmt,args...) do { \
- 	if (quiet) \
- 		break;\
-+	if (arguments->debug =3D=3D false && LOG_PRI(priority) =3D=3D LOG_DEBUG)=
 \
-+		break;\
- 	if (am_daemon) { \
- 		syslog((priority), fmt, ##args); \
- 	} else if (!msg_squash) { \
--		if ((LOG_PRI(priority) !=3D LOG_DEBUG) || (arguments->debug =3D=3D true=
)) {\
--			fprintf(stderr, fmt, ##args); \
--			fflush(stderr); \
--		} \
-+		fprintf(stderr, fmt, ##args); \
-+		fflush(stderr); \
- 	} \
- } while (0)
-=20
---=20
-2.28.0
-
diff --git a/meta/recipes-support/rng-tools/rng-tools/a4b6d9ce64f132e463b90=
91d0536913ddaf11516.patch b/meta/recipes-support/rng-tools/rng-tools/a4b6d9=
ce64f132e463b9091d0536913ddaf11516.patch
deleted file mode 100644
index 96301617b2..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/a4b6d9ce64f132e463b9091d0536=
913ddaf11516.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a4b6d9ce64f132e463b9091d0536913ddaf11516 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@tuxdriver.com>
-Date: Thu, 30 Apr 2020 16:57:35 -0400
-Subject: [PATCH] Remove name conflict with libc encrypt
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Forgot to fixup the funciton name conflict with libcs encrypt() function
-on power systems
-
-Upstream-Status: Backport [https://github.com/nhorman/rng-tools/commit/a4b=
6d9ce64f132e463b9091d0536913ddaf11516]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
-Reported-by: Natanael Copa <ncopa@alpinelinux.org>
-Reported-by: "Milan P. Stani=C4=87" <mps@arvanta.net>
----
- rngd_darn.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/rngd_darn.c b/rngd_darn.c
-index 35df7a1..9345895 100644
---- a/rngd_darn.c
-+++ b/rngd_darn.c
-@@ -109,7 +109,7 @@ static int init_openssl(struct rng *ent_src)
- 	return 0;
- }
-=20
--int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *k=
ey,
-+static int osslencrypt(unsigned char *plaintext, int plaintext_len, unsig=
ned char *key,
-             unsigned char *iv, unsigned char *ciphertext)
- {
-         int len;
-@@ -150,7 +150,7 @@ static inline int openssl_mangle(unsigned char *tmp, s=
truct rng *ent_src)
-         unsigned char ciphertext[CHUNK_SIZE * RDRAND_ROUNDS];
-=20
-         /* Encrypt the plaintext */
--        ciphertext_len =3D encrypt (tmp, strlen(tmp), key, iv_buf,
-+        ciphertext_len =3D osslencrypt (tmp, strlen(tmp), key, iv_buf,
-                               ciphertext);
-         printf("Calling mangle with len %d\n", ciphertext_len);
-         if (!ciphertext_len)
diff --git a/meta/recipes-support/rng-tools/rng-tools/dab16a5fd4efde8ef569b=
358e19b1fcbc7d0d938.patch b/meta/recipes-support/rng-tools/rng-tools/dab16a=
5fd4efde8ef569b358e19b1fcbc7d0d938.patch
deleted file mode 100644
index 93103ef79f..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/dab16a5fd4efde8ef569b358e19b=
1fcbc7d0d938.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From dab16a5fd4efde8ef569b358e19b1fcbc7d0d938 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 30 Mar 2020 00:10:46 +0200
-Subject: [PATCH] rngd_jitter: disambiguate call to encrypt
-
-Commit 0f184ea7e792427fb20afe81d471b565aee96f0b disambiguate the call to
-encrypt in rngd_rdrand.c but did not update rngd_jitter.c.
-
-This raise the following build failure:
-
-rngd_jitter.c:75:12: error: conflicting types for 'encrypt'
- static int encrypt(unsigned char *plaintext, int plaintext_len, unsigned =
char *key,
-            ^~~~~~~
-In file included from rngd_jitter.c:27:
-/home/dawncrow/buildroot-test/scripts/instance-0/output-1/host/powerpc-bui=
ldroot-linux-uclibc/sysroot/usr/include/unistd.h:1132:13: note: previous de=
claration of 'encrypt' was here
- extern void encrypt (char *__block, int __edflag) __THROW __nonnull ((1))=
;
-             ^~~~~~~
-Makefile:770: recipe for target 'rngd-rngd_jitter.o' failed
-
-Fixes:
- - http://autobuild.buildroot.org/results/0ca6bf16e3acbc94065b88c4442d6595=
424b77cb
-
-Upstream-Status: Backport [https://github.com/nhorman/rng-tools/commit/dab=
16a5fd4efde8ef569b358e19b1fcbc7d0d938]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- rngd_jitter.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/rngd_jitter.c b/rngd_jitter.c
-index c1b1aca..49a3825 100644
---- a/rngd_jitter.c
-+++ b/rngd_jitter.c
-@@ -72,7 +72,7 @@ unsigned char *aes_buf;
- char key[AES_BLOCK];
- static unsigned char iv_buf[CHUNK_SIZE] __attribute__((aligned(128)));
-=20
--static int encrypt(unsigned char *plaintext, int plaintext_len, unsigned =
char *key,
-+static int osslencrypt(unsigned char *plaintext, int plaintext_len, unsig=
ned char *key,
-             unsigned char *iv, unsigned char *ciphertext)
- {
-         EVP_CIPHER_CTX *ctx;
-@@ -122,7 +122,7 @@ static inline int openssl_mangle(unsigned char *tmp, s=
truct rng *ent_src)
-         unsigned char ciphertext[CHUNK_SIZE * RDRAND_ROUNDS];
-=20
-         /* Encrypt the plaintext */
--        ciphertext_len =3D encrypt (tmp, strlen(tmp), key, iv_buf,
-+        ciphertext_len =3D osslencrypt (tmp, strlen(tmp), key, iv_buf,
-                               ciphertext);
-         if (!ciphertext_len)
-                 return -1;
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.10.bb b/meta/recipe=
s-support/rng-tools/rng-tools_6.11.bb
similarity index 89%
rename from meta/recipes-support/rng-tools/rng-tools_6.10.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.11.bb
index 40ec5ad671..61a0cef2e0 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.10.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.11.bb
@@ -10,14 +10,11 @@ DEPENDS =3D "sysfsutils openssl"
=20
 SRC_URI =3D "\
     git://github.com/nhorman/rng-tools.git \
-    file://a4b6d9ce64f132e463b9091d0536913ddaf11516.patch \
-    file://dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch \
-    file://0001-rngd-fix-debug-to-also-filter-syslog-calls.patch \
     file://init \
     file://default \
     file://rngd.service \
 "
-SRCREV =3D "0be82200a66d9321451e0a0785bfae350b9cffdc"
+SRCREV =3D "2ea13473fd5bfea3c861dc0e23bd65e2afe8007b"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1

