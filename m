Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.41])
 by mx.groups.io with SMTP id smtpd.web08.739.1603907205017802740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 10:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=FKPG9AWc;
 spf=pass (domain: kpit.com, ip: 40.107.138.41, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFMlAo95buC7haQ8mTVFq+IYiYALJ9CPTO8wT3cyRowpFM4ttC2G1j6a5F8foac30eI254Ev6c31JgFR3fuQ7EkWvQXh5FzuzDC5sa581CNQPyYR4jSYzP55U3yKpbtkS+KfYJRPR9+Kmvwq4lbSdlTMZW25fLfifkjNbySh+c2IUaBrn/lD2EAaclCKAJW4mH/aWSQkMY2aCfnHynQpz7slVBswJ94MrC7LLYkTiHClbOiFK42Rpn9p0AGhHtBatptA2L+u4ij+wwAR6cc60kLhacLEknUtPn/UACCxg4C04Bd2CdsG+cgKuBq3Sxz/UsKMWU5uW83hy+psvXRpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1NrCK4dmEtRB0hWNI4/GIahirGFnNvPjNShpeAYK9g=;
 b=QdQ7UTz2LZulprSmwrqGJpHrxzrTMj+ZrI5w8sLo5UzStBE1TDRM00TNOvhyBXAAIuW1aFlz/x7kS7fpVRxGpcC+4Sr2dLbdeCPypKXKZYdYgbECxfCW581awHsdLuBlGzBrEFP2TPeMBKT7HL/B0EDU6cqHzDyCLOVUdHnLC+sxkWmDYzNID+TdzOPm5v0OUo1hAX8vEzWwcnAgesPIFWfijngbVwKz+sle7IYvbe+HzgFmJXvIydjre/FcOE5niO5FBzLLgzwL1GmAPJt9qy0XDOmSQbSWf9YNhtlmwNCK4lVwlMxbkGXYLxBefTQjQ6XPpFircinV2eaHC1BIvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1NrCK4dmEtRB0hWNI4/GIahirGFnNvPjNShpeAYK9g=;
 b=FKPG9AWcmyp2Dcl7JqRSpr9rCWuDXBfGyVij6J9FsLfxmrUu7Bmzu7duv0oKV7sMVTpOfAiQZky951jRAqY+cgKYzMeT2NKK4apqtqxYzzkMOrfs++i37zIOBAd4f2weR+ePL3G+2OGUiYfQnFSx2r8zxgmDo1Hp4uq4y4FoQJw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB2754.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 17:46:40 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 17:46:40 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [poky][master][PATCH] libxml2: Whitelisted CVE patches
Date: Wed, 28 Oct 2020 23:16:31 +0530
Message-Id: <1603907191-23351-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:215:ea7d:104f:98c0:299:6b11]
X-ClientProxiedBy: BM1PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::27) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:215:ea7d:104f:98c0:299:6b11) by BM1PR01CA0157.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Wed, 28 Oct 2020 17:46:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbf2d721-9b96-48d8-2cf5-08d87b696d10
X-MS-TrafficTypeDiagnostic: BM1PR01MB2754:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB27545F343EFB41CDBC4197BC87170@BM1PR01MB2754.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+T+Cujs8Sh4guaL5s3j6jCmtp1WkpVh4a+tUym81YWKdF163QrZLDCSvTlwgldVjEkqnleWoqFVMhPVrDE8AECzpiv1l6xSO/y7PVa+qJbRtA1Cgqhmh7FrrnueJ1OPjN+wgh/dV4524oRSX5NSuVUR6EKUp9MiwDrZ9AjHNUuxctnm9Aba5bPkJVp9bu1YUKyyqSTeJgL6h4PjVgo7wyilLaWQSHSgxb9F5EjhK0EOGL01UOyZtMfw8UhIk8X+GB6kbRTkXK+zTEkuoQpmtK7+pWqRsSwdDpub5w9QeosKFYIE0lLAht9wKOpPuoMveg8/h46xh0Lp9JOLhsYMVg5+pMXX66iKIo20igD1HnfTookA3no7C2jrsxvciiYguuQQI9UlYMmrcU/sBhEDowr1pVH165HKhjtMrLRiRWMTeM6NVp4EFW8vh3lF5iQKqqM3yhx2/7rLwmaxAEZjI0w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(66946007)(66556008)(316002)(86362001)(16526019)(66476007)(2906002)(36756003)(4326008)(69590400008)(5660300002)(966005)(6666004)(186003)(2616005)(6486002)(478600001)(66574015)(6512007)(8676002)(83380400001)(8936002)(6506007)(52116002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	s3sojTF8Ygkedc/YPWoiXFu1uLsoW0Bowk1LX0fsTRH49y0uDyhkcV4/uqnO2lNyhtaOubEJys6yULB5PfmhqhIPMHj7OoF6Q4L6vV4u0bIyn1940CDKj2ybjUo+dPQx6fjDNOy7o/9q1bp9a7YwWwoLUWsCJc6vsnBdqC7aod5QUir01Va0mwGJWe5+TMgIMFumOEgY/gLTHcLeU7YwvLYMFCAll27mzOrzRZh+0Uu3/xt+ltXWhGYKOyfwxhqkkSItnWdgyHZJdfejLJfQnUt0JcNyyS20Qk3CeAiij+zHMAaGSkWP47aNpGLSDqdXfxelJjbAb4hrOXTWzpSpo99+4eRENXE4d7NGG+ynoWIh8IpT3dyVFErlTZmw4RH+c7chAy0OWun55/WD/TNstHcFKvo2F3tWEdncKqCy1ubXvVWR6wywArRkdBPsILFDpmu/PauyQ9noGptw25VjSH3nYlNmX8kyXKs8D2pbFudp7T8BzqLRd6odKWD5taMUz5oDuNNg0w+rQ9+SpyvHr0UlUfwrk6Z7QXMEAaxPD9EC3rXTHROwHfPyRXEf2FMqZAaAR8r6vgW40SdJCg+a69XtXJdDOm5D0Xuj3Q+rYg8OFJYq7Y6FX2luuzbM59EYYwuCZ/NQdm4JQ1DV0OQqHuDoltdXHclOvridK1twkctiVqrRkf3MfukpyN3zKvh+kw+kAdqLm/Jl6CtPmi1PmA==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf2d721-9b96-48d8-2cf5-08d87b696d10
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 17:46:40.6533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DywewybsIGDVyMBt8O142HBXDpuKcBe4Zycf0EeGCBJcxjMPB4sl8cza0NS0q9N4mCDa4aa4BNHzXBN9Eod+qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2754
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Saloni Jain <Saloni.Jain@kpit.com>

Below CVE patches are whitelisted as changes
are already present in source code:
1.CVE-2016-9596 (Duplicate of CVE-2016-3627)
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1408302
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1319829

2.CVE-2016-9598 (Duplicate of CVE-2016-4483)
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1408306
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1332820

Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-core/libxml/libxml2_2.9.10.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core=
/libxml/libxml2_2.9.10.bb
index 4ebfb9e..80b6427 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -25,6 +25,12 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${PV=
}.tar.gz;name=3Dlibtar \
            file://CVE-2020-24977.patch \
            "

+# Changes are already present in source-code, hence whitelisted.
+CVE_CHECK_WHITELIST +=3D "\
+    CVE-2016-9596 \
+    CVE-2016-9598 \
+"
+
 SRC_URI[libtar.md5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
 SRC_URI[libtar.sha256sum] =3D "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea10=
0edc2f262750611b4be1f"
 SRC_URI[testtar.md5sum] =3D "ae3d1ebe000a3972afa104ca7f0e1b4a"
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
