Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.42])
 by mx.groups.io with SMTP id smtpd.web11.3704.1618955441084067179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 14:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YQR9eo8Y;
 spf=pass (domain: windriver.com, ip: 40.107.68.42, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5HFUjNdjJhbw70NFtiXv9V/76+KMQy/TG2caMwW0liQTvsDNv5H2RyH4Q908IUfqw4amMWSqOAoBh+JovnfZw9ILoK685zps6O3quvhifwsQD5lL3ufEr6O0U5FjlWSMXlJwfIPqEI6uueC8U3/sDC1Fgugt45VHS3Ura/kHNDN+voRFUnophlZxJ+81if3g5TD/RagN2CGyjppboIZ+bciEkF8os6XwEXEX79Zu0uX7RxrN7tM9kZ+s37zf3JJPjzwdxjaStQXJK3U9jTiwLRfdOPwg2V0jv43F/YU94e10BYxnTfTf3/mMerwPf8zIwk8nsYg3uBkYE4wYISNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHQtcgLqjoBHo1pVNP9R2V7LWyYazGwmrdV1NKBSz3g=;
 b=eMPIGG9uOCAwfoMRyBJPq6FdcD9j6JVfP+dvuxdagLJLGivW5cGfDFDKxp16SWOYbyzj5VjiWc9sqmuztpSY07ABhTgWpyhfmszPCfkUOvmXMwnIW3qdyPJE6iZccm4s9J3xC2/fZx01U88FwbxsmFhfAmiKqyo4li74+uEkHD4kpQbBG5ukwVfYsKfBs64fyQwLhIcIDmthHBwJ6CFKUq3UUOuwNKvzZYolFZHvZFis/tgUbaAjWErd6akcbK5sBfiRcI79ZH50pQ3a3/YjLGrp8HxOJp2gzl7Flo4sYo28EYSuves9Kg+sgz0QL2H3xo6ZgGJiJiU1O/dAtMLqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHQtcgLqjoBHo1pVNP9R2V7LWyYazGwmrdV1NKBSz3g=;
 b=YQR9eo8YAjkXGHxnv9EbgHwgntKa/k/qgz3MGWZl4P8sB+MXHOyColXibMoQ/lvAU9W83DUFsat7T9iWwbMpdzz8r1OkeaNHJEAextCPXCUPAjmZLHVpY5iuImuhOcQ02fgPkpS9CN4v+ZrkahPBkl2IpicCLDdJ6+QESfU8DDY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.20; Tue, 20 Apr
 2021 21:50:39 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.4065.021; Tue, 20 Apr 2021
 21:50:39 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] re2c: Upgrade 2.0.3 -> 2.1.1
Date: Tue, 20 Apr 2021 17:50:26 -0400
Message-ID: <20210420215026.15144-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR18CA0029.namprd18.prod.outlook.com
 (2603:10b6:208:23c::34) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR18CA0029.namprd18.prod.outlook.com (2603:10b6:208:23c::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Tue, 20 Apr 2021 21:50:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01740a07-e71f-41b2-5bd3-08d9044655fb
X-MS-TrafficTypeDiagnostic: SA0PR11MB4735:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB47354262E1B5CBF02C602D8280489@SA0PR11MB4735.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TLJIovW9e8eahLMl2lMtc2NRXOnCQgmtjaHOFjxAhRZ6/p0ntTMSOu8IL+ugkZe0V/IZ1dLG/W80bMzMno1cp3aefKFmxC5IcQo8LzHN/KKq/IY1piq8Cr7cmSGrjeAZQocWf/ys/DtlVcIJjsmoH3XZpqcdxn+PzeBrkIETe4R44QZKAm9kMmyrN1jL4rEBBjHGb6Z56GAbhT3O9tYKNOIuWbS6sKoRaJD6xcendDNSu+NfAm7LrMdzQP0JWX6XpdNibPLYi1n+2uvSZvuuiZiNEZD2rv7sXq+URxGTC3uQSs3UkjTgVOVtgc2u7jHd97U8G+g2dheh9wyUgKys/9jxX3Lclv5cyOsmEotwqx21K636aIqL9T1xY84fcaPSjydsxYcLrhYkVlZdnR3NWrykYEniHxyuhOoAQaCRgE75p8yLQGAKb9fnN+sFB9F5CYcE6F6iMZIJtvsJGSjmTeg3oUvjtRyUXMaTFKjwZO3fKFHI04+PjxUPL6V0BvG/cJ5/Lz4+256lJm7ayfxDUUl6shXMCTsasXr1djL6gPEhoDUp4WidCHp8loqmC0VXPXcrMynbSLY9rc7KUCJ0h3YXw3wJgvszmqKHoKJWjJ1PWrF+RvzPCpcDqiqxW/XKk7pNvvkWbFEJs32W9ZDqgFuU+TEaYGkF1L2wa1pp3IDC4PE8P41v5fK+fKKECelewA0p0OvEBm16/clbaNpYZAFgQJOZcZuEK1qbtp3UX0k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(16526019)(6916009)(38100700002)(66556008)(8936002)(38350700002)(83380400001)(186003)(316002)(86362001)(6506007)(66476007)(66946007)(5660300002)(52116002)(956004)(36756003)(26005)(2906002)(6666004)(6486002)(478600001)(1076003)(2616005)(8676002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?AEqv4rH6IvfzFzChr9Tsc4LE1ha7LMmBAAGBEyuH3on0ZzKmPWmoy6zKcoW6?=
 =?us-ascii?Q?RvDomiJvYMmNxKqbFHtcOE3e5RHN5LeJNFVquK4/IAZ8InUgCVnjWAiuIqdK?=
 =?us-ascii?Q?DYkk8PZDTg66gbDsEyXPmpJAHmPThXUJN9BQT5ljOQey7aeRVGK9FDTl2KpB?=
 =?us-ascii?Q?lL4qXgIeRVFJQ7TR1bLLK+qvf35Hm5ehPlEToYfWcQIe9ELmnyuNDuNtSK+Q?=
 =?us-ascii?Q?AKcMx6j/PBPxcXgFGNwpx/V1BL45TZgfTuY5/LAudiuqPmeNDSWb+dn8kXnt?=
 =?us-ascii?Q?oKlKvEdbRUPzkeII5zaoBHNT0Vc5uYhiffKo8QRlSPQMna4/3U/j8lTcwBjU?=
 =?us-ascii?Q?GYZVRBm/8xHzdB2g/qxamzYubk/XJn0NrcB7WlxZUAMVYlTCyszbTh2A2je+?=
 =?us-ascii?Q?nH+wtywQnQb85MzntfVVQ4AOMIu4jDyv0DqDUtjc8rbuoSUgZtDolmfAMZ6b?=
 =?us-ascii?Q?uSFzxprCAGvqySQpSp1JmyJrr0W6eoOwXbF+H3a4SZhNx5KuDfg+YItzFE2n?=
 =?us-ascii?Q?dJivvW6M6cDJtlpEkkx1Kw9rk1azv4sD3wGJlObl/9RCQPmT7sw0w9USVmgd?=
 =?us-ascii?Q?58P8E8TdidCP9rajR0ZnCpCMdqmc6p0NGX93Vr4MvhrDbQwyz03JNEmCVvcg?=
 =?us-ascii?Q?51yvgO3HxadI7AoeVgSY/7W0e97NxJQn3TMnPpEOYuYIWpjYurnVVz46Wrta?=
 =?us-ascii?Q?9BhW2rCCY7QexSZmLviGakiG1aUf6JCfXCqFXcjNhAK45mROXE1uyse6CTY3?=
 =?us-ascii?Q?0A/gqervtEWweRGJ+YxfnPy/c8kjx1PVHg2FAQfEAkzilrZKAfiI2H3pxrFf?=
 =?us-ascii?Q?hIs7rGHxrf6zaWkkuRPydS6UfxaT9Ej+2qJ4XC3xGigH2k5lqeVBG2EV61b+?=
 =?us-ascii?Q?AjAAkIsmpRgOO/K6pcPxtWDSjdt7c0HcFwpYHJH/IDDJjk0hrPQlPbyvcXsh?=
 =?us-ascii?Q?e62Js5phDI9lhxDMtb3UVi3Fm86pTuj0EDFZFxEvZ3zCzR/DUy5bOZjsbvM4?=
 =?us-ascii?Q?JrVYl1yRhFfqIGnApBuWkDY6qd310RCUY9UH+efANM05WJbYkw1kRqce36jP?=
 =?us-ascii?Q?jC5Q493LO+T1Kd1hE5bIW/p7Jk4TQUnP1CvpSty9MNl/Y17sos/lNMuZHXYt?=
 =?us-ascii?Q?UZ+vOqzUKUFTgMaeM+3917ndaq2Gxy+jYxH6Iw5lmMmlPlj2dA/8r6u/TFkQ?=
 =?us-ascii?Q?Faw7w/TQsrs/huHbJkSWWGUCWKZRzkUWDSR35qAglu3uMTJgzmwdg4lNte9/?=
 =?us-ascii?Q?1jWKM8nr2SUHF0FnvdicIMLyQx8NHKbQalPf3S079ifKHTi8qNc/SR7L5nD1?=
 =?us-ascii?Q?AyngJTW+m7GkrgfrCh1VJwt4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01740a07-e71f-41b2-5bd3-08d9044655fb
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 21:50:38.9530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sewXWxHrOaSyGywqg7+Lu6AsS2YkeqDLtjtRdVNulqcC9nn7FQgphmuBc8BWVW9LUsCUkF9sP1ZBBnc8Zbggyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta/recipes-support/re2c/{re2c_2.0.3.bb =3D> re2c_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_2.0.3.bb =3D> re2c_2.1.1.bb} (91%)

diff --git a/meta/recipes-support/re2c/re2c_2.0.3.bb b/meta/recipes-support=
/re2c/re2c_2.1.1.bb
similarity index 91%
rename from meta/recipes-support/re2c/re2c_2.0.3.bb
rename to meta/recipes-support/re2c/re2c_2.1.1.bb
index ce04fd39e0..1da944e901 100644
--- a/meta/recipes-support/re2c/re2c_2.0.3.bb
+++ b/meta/recipes-support/re2c/re2c_2.1.1.bb
@@ -8,7 +8,7 @@ LICENSE =3D "PD"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64eca4d8a3b67f9dc7656094731a2c8=
d"
=20
 SRC_URI =3D "https://github.com/skvadrik/re2c/releases/download/${PV}/${BP=
N}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "b2bc1eb8aaaa21ff2fcd26507b7e6e72c5e3d887e58aa515c2=
155fb17d744278"
+SRC_URI[sha256sum] =3D "036ee264fafd5423141ebd628890775aa9447a4c4068a63073=
85d7366fe711f8"
 UPSTREAM_CHECK_URI =3D "https://github.com/skvadrik/re2c/releases"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.29.2

