Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.35])
 by mx.groups.io with SMTP id smtpd.web12.9527.1631790189505519870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 04:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=KkHDoTR2;
 spf=pass (domain: outlook.com, ip: 40.92.89.35, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMWU0JL+i8tOqEsr7VUNNCEoBz7oJxfdw3eSFkQGNKn/FgLrx2fuhMTMgiT/dDzw2Jyo749rThbPnAkG+5rgyy1q9ATT6AyQy78DhU1Aw7rZJRfLbLQ3I3byw1ZkT/ED91aX+nmeYw+9X8sVo43mlMBjHB/cnNgRe33uy6fKXdo930oT/C7c4z809QaftcKvj2zgrhWGPpsHmxeOnjiNvkYP5eeWespoIaPcVg/lXcs3J5bgz2r5bKBxyKo2UvGUSw8OG3j7fESIW5rJ2mHkjol7sWhNfS4lba/Q+HCGDMMeRAXvo4fUjZ9tDSd+rx12G6zlAi4sYEaOdMlZKkYP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=a7/f0aMCHfo9P5xP88dL33Arjlz6Vi3FKebe/9wDLzw=;
 b=iJkYlyuMv55ZFIsvElxlxw9Ru1622cCJPZvU7TScKq8krSWYA1xOOBbOFGzOJ2rQVF444M8fMq0dBsAkSRs9QylPbPpOEXSrefkDVe/hNRiIi8yBQb66XWKoDNj8ireRNsCZ+s8jE3lZbla36BF6zjCW5scMkH5XUlLYnLBRK9Va90EpE68Y2Jaalc+V/XQWOJMLsM2ifkJ6iP68ZJrk4u7QeIgsA7aQ8aQ9M5sjLRQICz8BRlPpiVVEUdL+PSEGNq2NZM1cZa2wvFdfTT4FLcewNIC+fOBOjMkno+z/9RA+/mu27LaqJYrjCd4M/7iKhtt+SBrmWGM6L0uNEtRR/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7/f0aMCHfo9P5xP88dL33Arjlz6Vi3FKebe/9wDLzw=;
 b=KkHDoTR2zO6shwbD6MNU+68EiTYaOeFLUmAApjG1dSQkz+JYXb9M9hdlY02dWgTUZfzpj2MF4qhrbd/0uggy6d7YEejX1OkEtPr6jWWDwZpLo+IkwySJMjsazCkOXAG+kdGK7Da/zjcxJDU+OFQtp7nqAX55IY7MhEIhhvLkJ0oPOjFE5maADgOMc6b/vz7TJ27t2v/+VBwgASBylJtSjnJC/2obSOzry/F4AHUCB+G/FfbC2HZtVJhS1/xQZMff7Xl4Lryu11rdLt5RZEgeoQ57qZ13+1V7lr3bjmsxnbPQA7Gq+PCEhC0AAdSfhLsW64h9GADNmkQ3w2bB1IumZQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4065.eurprd09.prod.outlook.com (2603:10a6:208:1a1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 11:03:07 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33%3]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 11:03:07 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] expat: pull from github releases
Date: Thu, 16 Sep 2021 13:02:46 +0200
Message-ID: <AM9PR09MB464290480C1904D7AA67B356A8DC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [9zacgtDtaecBr5nk1PMcfjHzkQHtTWhXJmvLC0IPj7XsCSm5T4TUP2UFFxn07yg71h7svCUy/Ao=]
X-ClientProxiedBy: AM0PR06CA0083.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::24) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210916110246.32491-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:8109:9a80:3b94:11df:cd87:699f:18eb) by AM0PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:208:fa::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:03:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0fac189-5d44-48a8-4983-08d97901907f
X-MS-Exchange-SLBlob-MailProps: 
	qY7UPrLqMbYF6kbNr09XJuSJG1GfVX5nRZOIbbgbvqaoSlmIy+cOzcQ8hs0TQih0KGR4UM4vAfPFzAT7ftspjyCTfx1mBSBtJDDizYGGsO6BwzwPYvYMlcCgOmAUCGgoOnnQSMZf/6w2LTd70NekEuMlKWlGafuXFJbMI192bK8wmggoiXx4817cSzLwtGlrWZSrod0E4d3FHuy7LeRowHgMGeWloa+kzcIZ3BSKVLfrdpNL2UrhyKIqrHDL8QmU1oZX2pYdnzIlqZ3aojCvqsqKyZGV0a7fqzSgBoQRHNY1zHcYm5/SfGdiPEHBEk5yTk1cdFMT7x667zWnHBfHCErzERhcW+27YV7MD/KiPDFzipW5aKif/LCQmUgPncvMOIq+jhgIJYgAz0XwPnHpjdmyPN8SwJwSfkrZSTzwXMo7+P1B0CEy+p9TyOkm+ufLz7OxTh97NnAN3HfgWIj9WagiZ/1aj6Bjjqvd4cUuhizRNTVLNA8ILXfjlBA4oxVf5GpcmB0pK7umr6A2oxgIzRqIX8WfZYH2Fxxm5URF7BeLCKap/eBO8vr/Pg/RTRGDJd2nPpipFI+S0sXimKcaB/80LRdE7+y/HWLU8lKo6I1TqhCNEHs8tAiM2071vgjtC/qZVUDFzuumt3I4oz3dzqZAsIzduxLPdaKx0sQWiIf74F53qyg3lXhswsNxuGVtkCPD6Sicn0xGKcYUkkxLBg==
X-MS-TrafficTypeDiagnostic: AM0PR09MB4065:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QeG39bZ/CH1lefVIOMIX0CvoT1JnF3BOF0++ljTENOkMrl6Itk2E6QOBk9V4s8m2crfFrAWlVhtFLmrubTyvhWLxIfdzIOcrVCVdmX6N4zlhpzpeEJMPsWlBApwwDk0QVLNCHJ0EUFZcXE46tvYyLdW1Tx48vjpSc1vWFTEjF5aGkPJ+bnvEPBZfRWv69oPe4+tNsME1YR/XAeL1iHFNeSGgvn8UPKDedY02qe1/0Oh4Ra0jfPRBDhiq5Tseqwef/1CSEJh4Fc0S0rL1Kw+jqO8pnzwztUo+hjND76/uDVzothlmlx5tW2uMwhl6b6Su+yVjANpLGELWbE+JVc1qfrJXYSu+CrXvGS+Lv14OKD5Adm9nx4WoG+ICqSQKXaezyX19wHNoTusNYJIkcvxecZfuB4SmBb1TF5fK0UUCValHLf/w2KtemgYED+MtayK4ZlZnyhZqp4IdvxzZlD1HWjdKco3GO5sWfhfdLGBbXqo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	q9U80eSq3QLo2792F5IAWyxVB8ngkP8ZLPzKB2Ud+Cf54ZvPJiPT7lu6ofb2MQtZJ7kWQTTV4yH9NUbhaYn+GJEoEWjjxvStREWofIJRtvsw2LpQ3Yl4TGplWlvGnUr//bsgVa1jYgM7qqjRNuWugmTYhg7EOk3f3tc3aF4DDq80pHq0pzj+u/nwPtLhIpkXv4waTNfCw55d++18QFzJXQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fac189-5d44-48a8-4983-08d97901907f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:03:07.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4065
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

sometimes we can find release tarballs from sourceforge are not fully
distributed along all download mirrors leading to fetching faiilures,
depending on what download mirror will be chosen by sourceforge
servers.
As the project moved to github anyway, it's better to pull the tarballs
directly from github releases - serving the very same static artifacts.

Add an override UPSTREAM_CHECK_URI to enable devtool upgrade checks

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-core/expat/expat_2.4.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/expat/expat_2.4.1.bb b/meta/recipes-core/exp=
at/expat_2.4.1.bb
index 555dd0d601..14e5aca9e6 100644
--- a/meta/recipes-core/expat/expat_2.4.1.bb
+++ b/meta/recipes-core/expat/expat_2.4.1.bb
@@ -6,11 +6,15 @@ LICENSE =3D "MIT"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9e2ce3b3c4c0f2670883a23bbd7c37a=
9"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
+VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
+
+SRC_URI =3D "https://github.com/libexpat/libexpat/releases/download/R_${VE=
RSION_TAG}/expat-${PV}.tar.bz2  \
            file://libtool-tag.patch \
            file://run-ptest \
            "
=20
+UPSTREAM_CHECK_URI =3D "https://github.com/libexpat/libexpat/releases/"
+
 SRC_URI[sha256sum] =3D "2f9b6a580b94577b150a7d5617ad4643a4301a6616ff459307=
df3e225bcfbf40"
=20
 EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
--=20
2.25.1

