Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.84])
 by mx.groups.io with SMTP id smtpd.web11.10669.1603899036066027767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Xok74Vxm;
 spf=pass (domain: kpit.com, ip: 40.107.139.84, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rbxkc2KnNWIMbIQRIso8W4PI8B3vYzh/v/ET+rrgAY87vyzrVBQ8om0iGTEKQvOqrVns0nK6vgbzN72R+EIISDIicv7XYubmcm5SLNpYL9cH0wv/Uw2BbwVUNXRvS4QeTAEDs34lmQmz3axuEQAjCuQtHKhSu1LvlgyO61dtgofatf905WF9wV2Hp/F99Hg2KOsb3eWohzpZqdGiPC9ePqD7OWSvBYgTWpnjXguG9AwIzCYziyOq0B7GecxBU/OpUeyfxGe+DpCr0sM8D7J+eiUBpf/SEUgkcc/UNhPr9nj8QiDcM2inK7iIAvKhGadvr7JSk/gGzMWA/gv5PEhXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G3MBqPmzqCLda9l9lf/PaW4JsTfYtPehOlGH3wsjVw=;
 b=TrgYl8a222dogSlByi4Yz2ekVkAgK9YqrCRXO1PSKmWXBzhWjKcfXmqwXLLLVSAxbuWhHLSHCmD5AXmNVRnqhFJ9JBQs3zJDujyoO53q35/Oga5PVlHC+cV5p5Pk1pb/cstyFO/HTHXlLGFZEq8qBrqqSSTafUcfuPP+QdZdOf2Y4/ddyX1CtHAE+fuz/k1Uai9OQHhf43UnBVSteOFvO5pwBZEs0AX9dum6ic///Xj4IBvZcaiQPPDt0aGgyfX/JxT72La+bA9KMUruWGicgxYWEyrewMJ1CQpvuXGingdIsbqMaA+zaDU056XhL3SkmAcAFhheHzmNbmrIdAYCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G3MBqPmzqCLda9l9lf/PaW4JsTfYtPehOlGH3wsjVw=;
 b=Xok74VxmFpG7v2+XFoF4NNLhrQ/dtKtBS42pL1zc1iGZx9LndeP2PZ08wbjuKuZ/UeX2bbs58gLXzJ5NwxiOrZR3xBcgDu7HvR6UZPpvrot+JIyRvxCoOrlsP9Pku7aq2th/m/a/cKIxQ2u586xI3J+UoXP728Y8/YcYETKykNM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BMXPR01MB3749.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:5d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 28 Oct
 2020 15:30:31 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:30:31 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [poky][dunfell][PATCH] glibc: Added and whitelisted CVE patches
Date: Wed, 28 Oct 2020 21:00:21 +0530
Message-Id: <1603899021-16081-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:215:ea7d:104f:98c0:299:6b11]
X-ClientProxiedBy: BM1PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::32) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:215:ea7d:104f:98c0:299:6b11) by BM1PR01CA0162.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:30:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9e88d7f-23e3-4868-0745-08d87b5667cc
X-MS-TrafficTypeDiagnostic: BMXPR01MB3749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB3749805E41715792013DB80A87170@BMXPR01MB3749.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DTUVrKz3c+pTD8DYumPzEKiHdrQYWMfgv7z503/+HdXeAK871ZU23hX02V5JBLikV+IgUKrT+MTpDDqTnGIrRwmeNVO/DP5sTfrr316bminHzSBHYw5SSNzdbSa8XQKcalSNDl0K5IsZhD0FfYZN9FhUKMTWFKt1BFKDPAP/c/AmJDjdAtyWCn8L2klcIygFmQs7A8tziLH+fPBQhswT759t03bEwHm68JA6ogG/3BdmGWlahkHG0ftt7we38RwiClbz4qnllInD/3ATRohccBBQ2PuEkgB+4nUtGIgEKC63dcJR/7DkXfI0y2SrvA0t5J/IndQEW/zok3bYYEb++Zbj9gRrUhA4aKfywh616UcAtGIeuGWUzZ5dXB4m7dyTXhMYKj0u8uzf84NXb5bWjTeeIK67oxgGyR/Fz/8Bsm/Ke4lXZ9CV6ys2kjlxC7wJ4+xW+DQXazFbDYQnkFohcw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39850400004)(396003)(136003)(6666004)(2616005)(186003)(16526019)(52116002)(2906002)(6506007)(107886003)(66556008)(66476007)(4326008)(66946007)(316002)(6486002)(8676002)(478600001)(966005)(5660300002)(6512007)(8936002)(36756003)(86362001)(69590400008)(83380400001)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GRhSZ5dT0vUcA3R2acMfFWy8cIimCgrkRSOjbooLhx3fJvcmCth4D6oOKaB5s2VnckA0srB2qkdSiV+u3LUptjtMd4/TOKNzNvX0OTs5IiwBIDL6ykxrTYytugsru+RRsrjyMQD9tzKYfu03hcqmvA472EmiTRs1DZ5lLQGcmyqzz8Hvz2yVkgqRbODKXh+y/Y2SY/JRtiM8PYJvTIycCl3rE21dydQjFHoKX5tLLG9wLvTvMKiAe4uJ6yMPebcb6GnXbok6u3RLcdTLZ7zPhCdahAMrB9ptelADZSmdYjbE61O3ESaWSd76o6OYHkDz8nD/MuzG+3bZVYGk9o+lPah2qvsHea59StmWx2ujfhR1/xwOSjGpPO/ucaP31w1cHAtR0VmeuODgZ2ZQ/9WtdPcP4xNWMWIWQfMjJ2GpqCdOddTKMxPG/z87sm6Rz3cWOeVufqEJeINBNxinvfL4HMrMU44SoaEp9XGofDmvTMrceTErCxEzI+G52hm3/FcOEt6D/qqusFY3Jzsh5FBVffOQKo6Wjx7MYK1Ptv/PBV0h6H6alzt5eupPxJUr0LiCE9+FNIEeF3AeLXIvj4t3Sqkr1vJK74DvzhOoppYjL7+unFG9omC0dVsCo5wjnjc835OaTQfdzFJzg0KHMwODMUhRKO51b80I8aVqynqByieeDtpIMdgpm1hymVEoQyH6IxFkoeIktFoPzNDl3P9uQg==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e88d7f-23e3-4868-0745-08d87b5667cc
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:30:31.4811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3HyCZqY9/e7NGfuvwORR9hqVtEGWYvRvECMJrMYne52Su/TV55DQxaNxOfNXNUXFkB9/2lqyV1GnelH2u2U5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3749
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Saloni Jain <Saloni.Jain@kpit.com>

Below CVE patches are whitelisted as not considered
as security threats by Upstream Community:
1. CVE-2019-1010022
Link: https://security-tracker.debian.org/tracker/CVE-2019-1010022
2. CVE-2019-1010023
Link: https://security-tracker.debian.org/tracker/CVE-2019-1010023
3. CVE-2019-1010024
Link: https://security-tracker.debian.org/tracker/CVE-2019-1010024
4. CVE-2019-1010025
Link: https://security-tracker.debian.org/tracker/CVE-2019-1010025

Below CVE patches are whitelisted as the changes are
already present in the source-code:
1. CVE-2020-1751
Link: https://security-tracker.debian.org/tracker/CVE-2020-1751
2. CVE-2020-1752
Link: https://security-tracker.debian.org/tracker/CVE-2020-1752
3. CVE-2020-6096
Link: https://security-tracker.debian.org/tracker/CVE-2020-6096
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1820331
4. CVE-2015-8985
Link: https://security-tracker.debian.org/tracker/CVE-2015-8985
Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Deb04c21373e2a=
2885f3d52ff192b0499afe3c672
5. CVE-2016-10739
Link: https://security-tracker.debian.org/tracker/CVE-2016-10739
Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D108bc4049f8ae=
82710aec26a92ffdb4b439c83fd
6. CVE-2020-10029
Link: https://security-tracker.debian.org/tracker/CVE-2020-10029
Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D9333498794cde=
1d5cca518badf79533a24114b6f
7. CVE-2009-5155
Link: https://security-tracker.debian.org/tracker/CVE-2009-5155
Link: https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3Deb04c21373e2a=
2885f3d52ff192b0499afe3c672

Upstream-Status: Pending
Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-core/glibc/glibc_2.31.bb | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glib=
c/glibc_2.31.bb
index 3d486fb..0233a06 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -1,7 +1,25 @@
 require glibc.inc
 require glibc-version.inc

-CVE_CHECK_WHITELIST +=3D "CVE-2020-10029 CVE-2020-6096 CVE-2016-10228 CVE-=
2020-1751 CVE-2020-1752"
+#As confirmed by Upstream Community below patches are not considered secur=
ity threats, hence whitelisted.
+CVE_CHECK_WHITELIST +=3D "\
+    CVE-2019-1010022 \
+    CVE-2019-1010023 \
+    CVE-2019-1010024 \
+    CVE-2019-1010025 \
+"
+
+#Changes are already present in source-code, hence whitelisted.
+CVE_CHECK_WHITELIST +=3D "\
+    CVE-2009-5155 \
+    CVE-2016-10739 \
+    CVE-2020-10029 \
+    CVE-2015-8985 \
+    CVE-2020-6096 \
+    CVE-2016-10228 \
+    CVE-2020-1751 \
+    CVE-2020-1752 \
+"

 DEPENDS +=3D "gperf-native bison-native make-native"

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
