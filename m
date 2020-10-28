Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.48])
 by mx.groups.io with SMTP id smtpd.web08.11369.1603901405353775953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 09:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=DfQB6vz2;
 spf=pass (domain: kpit.com, ip: 40.107.139.48, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wk0xRahwzh0uPwGuBrBlbbdy1g9raDGP5hi182dhGxu1g32UqWP1rcuozGvPhtgEglZTAnK67p1mIt7vJMGFS0uOGBk5Fk2v5SkZ6z3hMpZBfWQY4J6flaL1oovGKEPhbry1sm3+1XTJaGY3SkzXahGZDS+JL9zHvvJmgVnbSG7Kzf0RWQjEOOFGNJl4+X0nMOVjjnN3F73ljV0mH8N4F1TGiqdOHx5r60iBrHCT2bk5ZHIwNp/kulhGwxTxvNLfUoJLJWIrgHLubB0E21lDKVjbtAv+ijoElCufS3q1xtMwwSZftx/lFAv5vk6zbfZqKEnS5Rka2BbsTHVrWI5lVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGa/ZwqPDazZ/qbx6HFX0m9pRGFr4qGDxUmDn4ASvss=;
 b=SUt2or+c8VqPJP5Em4zmRQNw4cxgzCJ1x4clMN8dHJIdofgB2Ks5be9Nl92uvU4JD3uBb/5BGwJHE6FNGU0UOrXC6WMmF7kPkF/dG+ixttdDsiPl4xzcduXp+t0FJ4BwfzU0DRHfKPPgnSWjjGsWjkida+l3Ega5sV6QOd0ZtFzl4a17Hl8kV5gZc7Tn2Jt2opLk5wwdyQFVlfEHBp2UCXF5JJWuJDJq/bV8V/x8eMVVeuGHcoB6aMf/9rwCPQxl+tKxxJCH6p+r2yOcHmnB4dYnqrnhNxXLxrSsdWFAefLendOiyK0k/L9H2uYVzTKZkwa7sjev1USlnb9/N82VQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGa/ZwqPDazZ/qbx6HFX0m9pRGFr4qGDxUmDn4ASvss=;
 b=DfQB6vz2CBqgq8G8IOze9Qj0pNzRW5QllbAbF04QWv0lZnvjXUr8jsivBjrvGwWmsd3IMz016R39QGw6EpfPVKQxVNL7hBDXx0NfOwWuEEa5FpFVnvI4y1eC+ZYgfEyH6pFGkoGx0hWWuALh8xO3qpD8+uDRX9XiMhPOejIWI2Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BMXPR01MB2245.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Wed, 28 Oct
 2020 16:09:55 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 16:09:54 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [poky][master][PATCH] glibc: Added and whitelisted CVE patches
Date: Wed, 28 Oct 2020 21:39:41 +0530
Message-Id: <1603901381-17501-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:215:ea7d:104f:98c0:299:6b11]
X-ClientProxiedBy: BMXPR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::35) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:215:ea7d:104f:98c0:299:6b11) by BMXPR01CA0071.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 16:09:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f8b0fdc7-381d-49eb-6def-08d87b5be824
X-MS-TrafficTypeDiagnostic: BMXPR01MB2245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB22452B806FF38DC77E6530A687170@BMXPR01MB2245.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KOSL0upLXN4G32AN6SEEGpqFN0bYNQijZxYorcnLmZdi526WYNX5usen3ej0IQX4jybHtM1B9UNEcnify/M7OLS87wuJNAABycDMZIfz1Fqckr04fegiIlwdYwyXyf0je80NLc5qhYLuA2b/+LcHjDXY92LfTTs78YIz97cL+IKLfdV1liYBzVy7MSEkFYFI81xmrqry4aTMwoD82+YUeh2Q+CF7ctDKhtScaczn8eV/aj4PFzq7RgpyfMWV0OZqqc0QsO2bxxeEgXPcqy4pYV9SKOgp+Yr3noKzbYUwesi6wxTS86wUJvzI1nv5FiWSMeUWA5uMP7CiQp42c8fCde4QThehidzusezhWwYQIUF2UvRv+FHAoSl5yuXY7JrRDJ7Ld6h12fyKhLSR//hp3RZosC1/w2mqTSb3lIdLtKZAvfdFFDDJBNXD5ZUNp/Mx0xDqPLE/klvIgu1aMcGqqA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(136003)(396003)(376002)(66476007)(86362001)(66556008)(478600001)(66946007)(316002)(5660300002)(83380400001)(16526019)(186003)(66574015)(8936002)(4326008)(966005)(6666004)(52116002)(2616005)(107886003)(69590400008)(6486002)(8676002)(6512007)(36756003)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	f92amT5X5MXs7Y4zZrbAZ7A8nv/S94oBvlj7zGGU3gJ1dCefybWUEm12wyvWeTgmxncwk+7xT/dX72LkGcbxLGXbfQdCG13Woo48osaoyUHrDlJ5kk3EtMxz9jy1DUf7mZn63YewXvUJqfZ7TrFWGwJVCqw06F/3ks79ItI2aayQCb4jtfCnlmLOGEFXOIopHCGv+WMc6joOpIoph/00Mk6jajLvE3CuAEN+QrBJ5N2rN976XHUv++vLq85tEvd1VKnETyj/Bvdi9dYqvMInG7AOa+LgMJBhgcqPVU5EyF4A5iXcLYQOlGR0cbk+XMhdyjAHNn/d10DAL36cTamWNFiV2Ss0rPpLJzVKT15jdGcb6ImkxaqwqUCQSk2bvKlifdqwBvPNx35+w7EBrkkn9VjARyIUQj5P/RqXAsTfgmQ44vEEVWvI5FD4QsFdsaqnD5EepTeoFF6FzbY3R8lWDpetX6UWyN3eQjJ4tFc9zoZBEhO3sq/6YUMn/Z6OPzDOHMcc5HnmpwT9B5Xv+3ZhhyX9OwML4DcdlFa0rXwvxt82qMXU9h9RL7nUakJ2zxTdffpQyL0rEN668jqs23XHVFdeHbO7Nvv632jWdwNOt8CPteNQV7DjFn9UvmiYsnuL5C2LPQIIKAwFBX3dyrBcJCAxzARSWxJL7lmKVfQTRfFc4+8HKu/7vr550ffl7d4/TfYExVc7rwfRpjLlShTSDg==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b0fdc7-381d-49eb-6def-08d87b5be824
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 16:09:54.3505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RnJv+JB+hQuP9zQR88v3Z1do3nfUYFPiflb++JvNyRXEDSlKfKF6WQjonEYPpRBwIO93QUPQ9FpdzwRbiHUMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2245
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

Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-core/glibc/glibc_2.32.bb | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glib=
c/glibc_2.32.bb
index 2a0e464..d5c18ce 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -1,7 +1,25 @@
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
