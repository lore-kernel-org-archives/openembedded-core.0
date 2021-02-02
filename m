Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.73])
 by mx.groups.io with SMTP id smtpd.web12.195.1612289392038084279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 10:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=hM7GS+TO;
 spf=pass (domain: kpit.com, ip: 40.107.138.73, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGr7phcEwCbsWLqCtMH82v93BZerQ6B7Wx3LVunh7Og1FoPywqLesycJaUhF+HAEGJTtd4GC5slQZDeOHVpG4iBWMyE5Pcyh2SNjLk2+D5JVQ4nC2K3byH0yY6TWTpq8FNVunNak3BlnpnRA77/GTOj/K0xVYxaeU8Gz0lfNBMCkgz4X5/s6iX9xXbgOPnDNMbhAkGNOkh1v9J0aJ46/BBUnxbQD1qjrYGMjMRQiwX2Lcnz4x0tle2CzcXyUS/N7vfnN4xDrcFI/K/CvI/4hrow0OwP6NtEdzPqABlfDlVLAFf4LO9wGupSOFdbgWfDjPB7+qxZU2pyUip8/Ba/pXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e+Zwec7FsHqlFCiv91ZZfztjmApIO5wyKn+2X1sZOI=;
 b=KC7IUFO/l/48Ar4AmJlKuvhML9gBibV4vPL+C1XoU54qJaZpnDapFFBAPAM/dBLJj7OpKWquGKBJOzMer6WDUIAXVZHDpOlQ2zEYZrSs3ILOVYpI3XNdjOof4FUG3bzrQP/1YB5ZiilTLDEh4Wd4f5HUE9Znhe1To0padwlN26bJb/M+EJN1t0O+IqJtLOqpnSc/Z4DGv84dnX/fNlUY1MInL2m0z1kGfp0ItYC5tmeqQU0wQU8/qIe0lHXrPWXc3pf8ukYJNyTrVYo/gd1So9rbSJjPpo6YxM/sZR1yJ9lJ3swSr5LcZYy2cOCAExBechaTbMuPiN8ACtETehKhaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e+Zwec7FsHqlFCiv91ZZfztjmApIO5wyKn+2X1sZOI=;
 b=hM7GS+TOipxJLGWSyfBJDnWbAyM2EsUapUxESmMnJ+JDQs5DYH0Gch9NrT8SzCmWBHGj/frT9qoxVg8rK5bQA1MfhqrgTzpTDYGb/03oF7CpCmHrBWe/Fz9b9ONSQ6RahLwacMD7uoc0AZAkMPPx6QJWTcNzQ9B87Kdy6N0I4N4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR0101MB1138.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:21::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 18:09:38 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 18:09:38 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com
Subject: [poky][dunfell][PATCH] libgcrypt: Whitelisted CVEs
Date: Tue,  2 Feb 2021 23:39:27 +0530
Message-Id: <1612289367-10977-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2e10:1952:a917:7870:68cb:9a11]
X-ClientProxiedBy: MAXPR0101CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::16) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2e10:1952:a917:7870:68cb:9a11) by MAXPR0101CA0006.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3805.16 via Frontend Transport; Tue, 2 Feb 2021 18:09:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc21d839-bc86-479a-ee2c-08d8c7a5b3f6
X-MS-TrafficTypeDiagnostic: BM1PR0101MB1138:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR0101MB1138D41CD6AE3D4C564C232B87B59@BM1PR0101MB1138.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CgAbUcU68WW7GbXMNDogi1Ob+hcUFsKg37uzsNWiGfXnLMz+FJf0vkZf6kKzCCe2LQ9zgr2AcwSKIGyq43rIxYYwazbFjiBPEPyZbaBeDS2EkakCrLiHMJ/zsH0hBM8Sgem3fgq7kH4My+q7x9k5JAXXy6TITWYk0hKy5qxVFTGwPMUP2MnmhJHlvmzhA5QgDVwmfsPi2ZsPnuMQKHb1NX34JPN9zdgz80YWKtPQ8tzVOuJFXaFvEASjZK0/je2uHTIKr87D/BPV2BnGEfH9jnRKAFTJzga+M0YomghR3TVYKikOlHOQoe5cHpziysXExnzsih8sYD008chwvvola7elWu1xEQq1vXt/FtFEx/hzJM0oxH5YKpfiIYNs6P8qMZ9qNonp6tzhlTwJ7b7BQZ6jnGk0GrOJJ9LkjaejpSKqV52GZTfS1KN4XDbHY7gWEfU1NieNPnpyXZiI16X1Ptv0mCF5IrGDGZ2UHwT1C865jyxtyqZTAHT6eJ90bt7iWtvFXAJrw1POJLKGmQT4qecXeMSn59Ec39uoGXt3uduZsMQkxqAMfm4F39dC/E9Put4MUtPn8EUZAKciHrUQC+aY292SfzDhlwdw1qqosTHcGaZF/KCtNFDhrPJsGdb3wq2Yc1mAuUPjdizbJf54hglvyqFheCLCVFK2K02qPXc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(107886003)(52116002)(83380400001)(6666004)(966005)(8936002)(36756003)(5660300002)(4326008)(2616005)(66476007)(8676002)(66556008)(478600001)(6506007)(69590400011)(16526019)(6486002)(6512007)(316002)(186003)(66574015)(2906002)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?eWdhKrQfrOlngOaFiwSOldVAdaYN0rWPVp6cxjyl/U7BQ0hpI39jYQMLzHaL?=
 =?us-ascii?Q?ELMFwhlsLd8UTFc2ZkMF8TKLIlEACh0N/wjUccyfJiGWVAic6/5Jq65CydVb?=
 =?us-ascii?Q?GttfU5AXY4Z/lUucBQfTsLdWFAIRmJOCpGJz08SfO/lX4AesoR5wN4Rrz6Ao?=
 =?us-ascii?Q?rZRyqcZgcaBFmABSwkNn9uckU4eAp5phuOCmnNKLahBSFskwvBVN+OEWG50I?=
 =?us-ascii?Q?dzDN9lV840Nai0lLkg8YflBDTUww7E85m+mhSa38fTeywk4NXesqYRiZXpxk?=
 =?us-ascii?Q?Ae6HjBr/wmIo8OZfzKJduzEA5mc9+U5lL0pmxZh1VYk7pqtuIYaxkJIzlciR?=
 =?us-ascii?Q?B00d0owl7Wo8wJFlIjmzm9oxPTRIPsA+9kdiHRSt5CLKNjwJh6GiPEryTP8D?=
 =?us-ascii?Q?690OSJToUI3IciLl1npbN76ewmwVtlqQjMeKaKaT7V2Jv2ZuWLJ8Pti7INn5?=
 =?us-ascii?Q?wryfMV9nGdoABEnKWJXqX0z1za7HhpdoSTtQjsw0CoPbPOtPpN9Bnxa2AfBI?=
 =?us-ascii?Q?UtIBJV5cCOA5m/ZNJkVLZaJayFuYmu7X5txs/o6JyJr+Pm+A6hsxZvE8Pw62?=
 =?us-ascii?Q?ghfHi/O6qvczqyrm6jrDVS69/8yEraRAtGW4S4N+uu7aOcDG45nc3dFaXnOq?=
 =?us-ascii?Q?jB4Wwy8jkikcVZr9xsQOSm2jNtbCLo4Tkc4TqU3NBhPIzGgVSYl7A2lXwgsu?=
 =?us-ascii?Q?L/EezUBvzvqioMV3arDDIuA5Gs4Wowu2z6qmObPjax/Sq2uMePwVyE4We/t9?=
 =?us-ascii?Q?y1oVRDni/ivlkhfIxO6K/OzBJ3fmELdHFYRdNdVGolvpz22F3pU0FPwvGRwP?=
 =?us-ascii?Q?j8cwZtnd7Uc4ZkTmBO+VxcqCf5NaLc7j2KxrhcOKw1wMbv7qd7q75IWmAuZA?=
 =?us-ascii?Q?lrC7uVTjqzYVa46sni8u97U3teFZXRf2hSz6diSgonJeGGLLfPluRUuFFCTv?=
 =?us-ascii?Q?UALi4obgTFMEA1sweGJ1C/cUDA3/P4Vp1jMkCLhwQ0ttwlDHTiSM6QWHuNyb?=
 =?us-ascii?Q?q1/8h3ibMfjumgibVuuJ/oXwe8jjSX9FRD09THYPofc4anQ40MGha5kGRy86?=
 =?us-ascii?Q?m5pYl1qqfIOKOrsLQU/z7QNRwU80iFG+G16FklJnnki0kl97/Tahdwbr0+GE?=
 =?us-ascii?Q?ZEEG3nTsIGaI?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc21d839-bc86-479a-ee2c-08d8c7a5b3f6
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 18:09:37.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCWiBDo7zcGxp9y/eGaaCiTCX973MS5M26hyeAgOhnOgDZi9ySwn9GDHbMWGzvUitvI7n4xezG0eygYmJGYoAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1138
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Whitelisted below CVEs as their status is disputed
and ignored and not affecting the Ubuntu and Debian
environments. Hence, marked them whitelisted.

1. CVE-2018-12433
Link: https://security-tracker.debian.org/tracker/CVE-2018-12433

2. CVE-2018-12438
Link: https://security-tracker.debian.org/tracker/CVE-2018-12438

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/recip=
es-support/libgcrypt/libgcrypt_1.8.5.bb
index 4e0eb0a..ba3666f 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -29,6 +29,9 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.ta=
r.bz2 \
 SRC_URI[md5sum] =3D "348cc4601ca34307fc6cd6c945467743"
 SRC_URI[sha256sum] =3D "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339=
cdada0eb577ac3"

+# Below whitelisted CVEs are disputed and not affecting Ubuntu and Debian =
environments.
+CVE_CHECK_WHITELIST +=3D "CVE-2018-12433 CVE-2018-12438"
+
 BINCONFIG =3D "${bindir}/libgcrypt-config"

 inherit autotools texinfo binconfig-disabled pkgconfig
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
