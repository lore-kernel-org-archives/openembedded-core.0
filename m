Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.49])
 by mx.groups.io with SMTP id smtpd.web08.225.1603905450336531395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 10:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=qO2wH7Ih;
 spf=pass (domain: kpit.com, ip: 40.107.139.49, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=al3RoKzEPL1VRnpwqvhqiSEUsHsxpNGQjscdKovfkS4sIjF/2BzyvV1maW5pKJdKEo8j5YHRqGiTTRclCBIOs3+gsNRYkv5d6YhSpSYdYMnsZ7tpFI+x9wCtNYcySFBFabrl/Z4/cBZerY4hjo8Ydt4noyFLZ5cqiAr5RCKpodjjGG1mYulToagKmKqJVpJHApufQaTWozCOTPqx5pdP3UCRTwxZnTjNl0IXb0wjZXh07/H0OooEdQi+swuZJMDAXdV6tuBcN5slBn2TFwTCGE7iUU1IA/HZVGwQ1tXPcYkjH08uPl+w1vB4l5KT4FHxNwdId4snYCk6i6dU4N+rnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QbsIE5LIEwv9xg6eKqf3ecwhLZ84mwGGTG/guEmCjg=;
 b=kPHczdnF+JwFmtJJzw9LixfTMEuCFCgYO4st3VYT71j/OInRzqEnq70jg0Xxwxdl+HLAWH8LV0WVKFUj8u9q9Jc6khRaHcLNVwH4RhWqOodySBGYLNFnqkyBKe2TAjD4SLbl5+sQKsrrn2/c0WaYL2serE9CO7pUvVm+pVt/1CmRJcI+L1MAeouzRakGDtBEfgFq3PmN6EpOhJ3dKFG04eoiKJ/MIc1+IqEd7S9ttO/BokIN/fjpiMpGvcIaeILw93a0Zv2GU2s+2ZS5k7Gl8s3BLz230N7WczlTmRGiPl8ayPVH817HDoTLcNxzkDyODvXs7368wllezjJg+uP4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QbsIE5LIEwv9xg6eKqf3ecwhLZ84mwGGTG/guEmCjg=;
 b=qO2wH7IhPElcpcSjYBuEHUaRyaGuK4evkGbqbYcPD+pRIpRkk1Eczoq/RbAfjCRWDeGWmF0gfB296x0HSemPsQXHFUnxETsjcwDBJOhigl4Y3l6HpWN03M39kjqW+bjD1bPRNV1VV0U4mR8C2qCokIrgdE7dbD7+YhSJ6JNXdH4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BMXPR01MB3797.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:5f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Wed, 28 Oct
 2020 17:17:24 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 17:17:24 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [poky][master][PATCH] gnutls: Whitelisted CVE patches
Date: Wed, 28 Oct 2020 22:47:15 +0530
Message-Id: <1603905435-21094-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:215:ea7d:104f:98c0:299:6b11]
X-ClientProxiedBy: BM1PR0101CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::25) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:215:ea7d:104f:98c0:299:6b11) by BM1PR0101CA0039.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 17:17:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d7628af8-77c3-44d2-2db9-08d87b65561f
X-MS-TrafficTypeDiagnostic: BMXPR01MB3797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB3797745300ADB3B89BE3137387170@BMXPR01MB3797.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:309;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y66IP+i8hebeBc/JugwJsp5WTKdxH6yBYpmLMqhXX8HUBZVa6YUnyAvUBFWohMzPb7q4fryTblMRYT+jNUwf00o/vxBiWzOxGDhMf7qAULeXvWkBzitgkEm3NVXzWsY/wY6tW5g+vGmGHIdgqR5NbPf1FJhYRjrfeqRlHTaTFTiLiepVAMccJMSq9B1FGQOFjq0klY2RsNvKrfN1+5Ah57IUu4xKxn2guEZnQ753MkzZZ7namhl6cC8VXFxylXBBq7eSJaMw/JUIq5Cms8Cca5QGT8JZUm5JB+obpBeOlgcTeQPZrCXSW5/rGubl6T8BJaj1qMPF70a+2v4nev17QCKlG3gjzOWrMS6sVVk8FxGT+Us8A2/7Xipzt5eG7fapkBFgj1YOZrMxE7lFH02T9mGKAoH3LcvnGLRqxi0jDclcaM3Sr/n3oCq9ThZb0MRnc8TBVeHMz80OraBUrCqNiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(107886003)(66556008)(66476007)(4326008)(5660300002)(36756003)(86362001)(8676002)(66574015)(69590400008)(83380400001)(316002)(6506007)(6666004)(2616005)(966005)(16526019)(186003)(6486002)(52116002)(8936002)(2906002)(66946007)(478600001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qzzqEI0xsPKjVC7KLjk/PxzAVqmhIJSkvIn7kEWj7zBLtCQxd2AZF0hbGTIexaq0l+ay5tos1oS4mrbHgDo4DTcfoVC2LZLPEhvQbbf0+zz7dytXF0U5x3W/dDf0WXDcI34agG0mSFFSIEswxS+tjSQNC7JV3+UJyJ7wJjnZNUlaeh0u1S67Qds73InbCZnjCnZqrC619GECZlqMNImhY8UHsBWeA1q0joBGpWc4ilNbkGeu0A7aVgglGWv9vQdKIvjg9hYY/aXXVT1rj7Vb0h9fz/EaKI4wHVokQDBboqrWB7JevWeRLTGgAT6mV0JzFT4c2R9N4oAPw8bhd9N+A2J4l+0Sy8GXgzXsVGv8Gk1Wuc8DWWbYX60hUpaNVGXhW/xvPU4kEsqzkI+m8El+L8ipQsksZSawW/ibF583TO+deNqcAKCQ7mCUPc2b3+M5SX/4e3HXPAIatrf2EGkb5BV/Jppcwbcubq6eASAxtsIjnCUtwYWbC49mxKrZz1T1yjb/8sYTPldPrzJkBZf/cR2XDRpQOnJ75Vv2aDNwVxfC/0EobwO2aJpqy7R/Mo/sRBAPZgYXYV0P+p0CYSUEmFtmF37uQnPqfjt7VdRnuTxVPMVQgfkx2Bo6QN3E+yrM2Wn+DxsAPx/UiHQbo2kS7LAcburl6TPX7sZCEuESS0XdCsExuOQMElgfmiRx7tUDU6y90C7FF6iXxEijFM4gkA==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7628af8-77c3-44d2-2db9-08d87b65561f
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 17:17:24.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLe6yx8ZNiOggou4utzwcJs0KbBo+Y9KpFdimZz+YeGBJzMMutjnVJU3NpV0O8OL3w1zVh0Yjeb0LazC560CnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3797
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Saloni Jain <Saloni.Jain@kpit.com>

Below CVE patches are whitelisted as changes
are already present in source code:
1. CVE-2018-10844
Link: https://security-tracker.debian.org/tracker/CVE-2018-10844
Link: https://gitlab.com/gnutls/gnutls/commit/c32a8690f9f9b05994078fe9d2e7a=
41b18da5b09
2. CVE-2018-10845
Link: https://security-tracker.debian.org/tracker/CVE-2018-10845
Link: https://gitlab.com/gnutls/gnutls/commit/cc14ec5ece856cb083d64e6a5a865=
7323da661cb
3. CVE-2018-10846
Link: https://security-tracker.debian.org/tracker/CVE-2018-10846
Link: https://gitlab.com/gnutls/gnutls/commit/ce671a6db9e47006cff152d485091=
141b1569f39
4. CVE-2018-16868
Link: https://gitlab.com/gnutls/gnutls/-/merge_requests/832
Link: https://gitlab.com/gnutls/gnutls/-/commit/4804febddc2ed958e5ae774de2a=
8f85edeeff538

Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-support/gnutls/gnutls_3.6.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.6.14.bb
index 51578b4..727a12f 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -17,6 +17,9 @@ DEPENDS_append_libc-musl =3D " argp-standalone"

 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.'=
)[1]}"

+#Changes are already present in source-code, hence whitelisted.
+CVE_CHECK_WHITELIST +=3D "CVE-2018-16868 CVE-2018-10844 CVE-2018-10845 CVE=
-2018-10845"
+
 SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-$=
{PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-=
f.patch \
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
