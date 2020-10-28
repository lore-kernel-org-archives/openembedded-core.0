Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.52])
 by mx.groups.io with SMTP id smtpd.web10.10668.1603898688830388635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=lJEB6dye;
 spf=pass (domain: kpit.com, ip: 40.107.138.52, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zfb+uiz6838ckjcT6GVpjO8Lmi0TuqGC6Wa/2YGic1xldUHmnELOab1FPMKJLDA+/b2eIvUm9LRaiRKhLMtZikHnXv818gUa2/tMS/vXVZmWvE09cIFc7UyGp+oSP1q3g7tvls+Rxa+8EqM6GjSSbs06BPmXPDxsWp+5u6LKgZIE2MVOLvm3EFzx8H6Pb6GmKqhKr62iOfUlUi0g0JVixc1p93k2pi7nHvq98kYs0O8V1OO37YlxQ2NVEFz1i/ggmCXOuHDr+vxFHCimJ4AlBlVD22T4LnHy6i7jw7YQC3frx1xyaulN+QMyA56XSCW6D32+kFXGSc3CK6IUjCVTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXI0uWYwBFB2WpBNmpidwALM/NewqcFlHsntyaMPKrU=;
 b=kdmqDOq+U/eccZrzBFh4UJi9AkGpVHMXhnEDeVtO1Sbl2YI0p+OQGfmeq/3ztrA6cM9PVF7MvVhV67L1jmbEhfmhH0js50JxO5KdH5wC02ymFWHzWe8ajlNw4pWyhBXQn5Ki/TEqTe3eOvq+joV+xCEiAl/4r+J04nsjE5ksxVnRWdWwJNjphBFyPXYFAzfOQzXsq1sIVVYHBBCag3d6ap0xb1apfd/ZGaLIBPr3aS4mkdx7yDyBbt7nGroLDUfIvcCGxBhj0NIDsJQgdihtasbybQ0dTc63PwO992/brlywyuHubcjxUWQ9ZWM8CeZpNwl1D2ag3eneXziPHkA+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXI0uWYwBFB2WpBNmpidwALM/NewqcFlHsntyaMPKrU=;
 b=lJEB6dye8We5L+iYT9KpeQ8CYjQzYNQJaOvzKozjGoT4HBHcvIsZbbwiRh5YIXgwCw72ohwpRrR2KkKHoh6rhRtOEJPCuTz5kDmgHnJIe/xSYpmj+zXbKZtB0pwGAdEbwM4Y4zgqt8eWm38/hzmNDvRnZ24rc2fbH9fXrt8/GrA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BMXPR01MB3749.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:5d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 28 Oct
 2020 15:24:29 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:24:29 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [poky][master][PATCH] glibc: Added and whitelisted CVE patches
Date: Wed, 28 Oct 2020 20:54:20 +0530
Message-Id: <1603898660-15302-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:215:ea7d:104f:98c0:299:6b11]
X-ClientProxiedBy: BM1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::21) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:215:ea7d:104f:98c0:299:6b11) by BM1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:24:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ddc0b9a8-6101-4382-474a-08d87b55900f
X-MS-TrafficTypeDiagnostic: BMXPR01MB3749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB3749EF85EA7E25C9740DCABF87170@BMXPR01MB3749.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mP/CJ7so62usecjuSOI9LGcn8e8WxHpi88YGnY3NYB6e6oxEZYsQMxq6VuU75lJwge4UlebZ8Nyxtts55mPt9xgGREqvRi5z+hX8JFdv1HI4QCUygEl+8Ui5XWDB1P5dql0nOO+YP0F+KTdl8xHibaOUEToqirBADeR6fYUZvlmu0PgRhbSOtd4M+N7vy3bUeiI8kr+Fw3Sle0pqG3tmmK0i2xALD1L2EvO4IyRiX4hyud2q/7d/wJfh+q+X857VhuGD6pYkv/xwx3VJpIsT5B01Z09oYYk7Thghu05F1ww1QbYt6/qwYInE7Fr/EMpOB4gorbPRtTbBIJTfVvNXZmek3mMlVDRIV5LPMEpz0tFOJZfDF4QI+R9woPhB6ASww2JTuACfifyfi3EruBWX/tm429L1n+n6nZsJCJVXCDhJICwh+JnN+pdL0+0ZDqgQweK7VoToToV8pLHGQWOoBg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(6512007)(8936002)(86362001)(36756003)(966005)(5660300002)(66574015)(83380400001)(69590400008)(2616005)(2906002)(6506007)(107886003)(52116002)(186003)(16526019)(6666004)(316002)(8676002)(478600001)(6486002)(66556008)(66476007)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	n3nnGZPC5cda+EDzDEbBqi7XM+u3yb/rkT72u/5StktHpjue9g5h/6WvSRLrcbmPW3I+ahl+jFOiwYPOVLh5Iq7XsPRdaYle0KQ1RZH3W98vegMyg4VRYLkhG9cVU35+8c4MHydjqJ0uwylK97GKoZ48tnEL2UaI18ABzcc4ElK44CTCR39KwSvmSLlkzLAnYaTpDa+4mE+VpffwLSUxD/Z/P9WqRCqg5l9T6Oena6To5wK4kaG7OFXADLU5JWkL5ScVO0/mtpQg8+Ibz89OW8PlP5Thtg8xLTlQgnQmK91+se92PltomuqjHR8Yj+Jd2Do137wzOjVu2sSEfQ+i/ODUixIp6/POZFtXxj/lCyVQPCrcKRiJltFq+fYQYX5IggchXHDvFQYwSUde16rxJd6zpY2w3lOwAT98R80K4aZemrDOsRmlrrJAIbxUQ5OqUTHdOK0hqhTJB+sgDL2vttRDQ0wqhRr2F0TIS7NWDpNixgmydP4tquIdhFYfz7iswP5SKkvqZuStF5EehWRQPP1CcGi4zbs1tCm0MbfRGe84e+sUCQxOqg+OWp4ADfUfHzgO3ddpHwbarTeEpqz5XBpIHvpKkOWJucJvk96dlBcv4JOgXzg/zPxy176TthoYqqwNI6T/Mrg/3N8xcQDdYoB5qYGDHA3L4uQ8Cgyj6OWXLfIt+JkJdcQmvNnCHK9DN4N59EyOTI9bYJaWL5rlqA==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc0b9a8-6101-4382-474a-08d87b55900f
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:24:29.5470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CLEIbCwvPJmXYrtS2w1mqPVbHZYfy9QidCBVbnLAxmf277/PD4WWUgkwYLtOpgIC0eUf12vJe5ZtDx0NWHzfg==
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
 meta/recipes-core/glibc/glibc_2.32.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glib=
c/glibc_2.32.bb
index 2a0e464..7c56f6b 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -1,7 +1,24 @@
 require glibc.inc
 require glibc-version.inc

-CVE_CHECK_WHITELIST +=3D "CVE-2020-10029"
+#As confirmed by Upstream Community below patches are not considered secur=
ity threats, hence whitelisted.
+CVE_CHECK_WHITELIST +=3D "\
+    CVE-2019-1010022 \
+    CVE-2019-1010023 \
+    CVE-2019-1010024 \
+    CVE-2019-1010025 \
+"
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
