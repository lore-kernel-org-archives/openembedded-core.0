Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.85])
 by mx.groups.io with SMTP id smtpd.web10.1591.1594233865785469873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 11:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=IC+8Rehk;
 spf=pass (domain: outlook.com, ip: 40.92.64.85, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9STgcQX3x9uwse1+vyJwIth/TSAsNtVjsVofiKr7KY51OHVDMQS/zclMysAiZV15ZXJlixozJ4y9bUj3UqM/NHXl0oe6xpbcIJySc9KjbxPpuc3AGiIneH4C9JXrbTtIMJKeMRPw8ZyF+Q7JR+JJRvuuEmkywSOs8bS5mkSRmY4uKYak77hbMy1AIgzmQP+T4NlFJeGOd0LuD2HNJaoLw0PnWL45vmFpPxztrJqB+4DHMM0eR9l6eJVRZ3NWkeGGdQcLsWN1zvWumLc0hg70LBM/FXQtpTVLOeKciyQOs7i2BZ4yDoU1hUvU330+gy2J98I5QuHebOpTTatFfBF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWQN7bcqEeb+f/x7P38yfUj+9oiMpNEX/Ht3rMzQ1zk=;
 b=NkoBKPnaDCzEFSKJqoeYKoC+fFvPf7azQ3HiKYllGmsBaPdW/Laj4XbPI0H2ljR6xcsTm1f+ps5s84/7ODhaBc8K86FSPnR2qvgvlHsbwLLIE2xRsAAQL94VrMumvcozuUu6Tnra98qCga+oxV6MeOfZmneYmlTvsT9siVxQU5JYM9beDHuMDeEP6n+bp2E8ERgxI7YOrEG/dyD2uqIz92Qqq4ImVMMQFOukXAZIYA8alhB2IwVS3BrtspDgl1u5JkFSQV6mjLcDYeMeunJYEl6M6dB2pDWmh7yiiaEc1lPcs6kAKVwfgcqSGCTWAdVl60y/+MmOy/CRZcbgS6YfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWQN7bcqEeb+f/x7P38yfUj+9oiMpNEX/Ht3rMzQ1zk=;
 b=IC+8Rehk10i0XN2hB5plljt8Z7K3Gfz5t0GQroCxGFh5ZxD7OwgEOqqIgv9iWIXi6vx1ORXfQlK+Td4YFyO29V/NULPi9Tnplnp3wu7nx3oLQNY5Bm0Iih+rEOitYE0CGETNeIHsUiltXKuVhZu6cdgzArlgRsXTp5IWXgosCoHLSB/VyMxTJZkmDsnyXYz2RKBwIRGGbfGwmI8h/FpWKioSlHrJBApnEIfpGPhz006Rc6SW3Fu7mAVszFKXk1sH8W5HT1KKmeetDaxTRoZbP0YUjN+kMg9+YOCKWXyEjIrLvFGHNtOqBBPMxuMtB9nNXLUTAFqwozAHGUM35C7V0Q==
Received: from DB5EUR01FT058.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::53) by
 DB5EUR01HT128.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::501)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 18:44:23 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::48) by DB5EUR01FT058.mail.protection.outlook.com
 (2a01:111:e400:7e1a::302) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 18:44:23 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:9CCD46E33D02DE41B3CBCA2A71581D39FF96C32524435D7AEA5F43E5BE400975;UpperCasedChecksum:90039D086AC2D25A7F6B01F54F3E09EDB43EAB38896F7C98C85DE2EB89EEB3F7;SizeAsReceived:7375;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 18:44:23 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/2] distutils: put tests to ptest package
Date: Wed,  8 Jul 2020 20:44:08 +0200
Message-ID: <AM7PR05MB6881765BB66D07D02E10727EA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0601CA0071.eurprd06.prod.outlook.com
 (2603:10a6:206::36) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200708184409.21292-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.67) by AM5PR0601CA0071.eurprd06.prod.outlook.com (2603:10a6:206::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Wed, 8 Jul 2020 18:44:22 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200708184409.21292-1-kweihmann@outlook.com>
X-TMN: [3QmTBfZ2Q+GC9zRJzilx3or/IsqTpN7x]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 118b5570-3a7d-4c5b-2a06-08d8236eee83
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyJw5UtaifPLpECH0lBUWmaKPJYkMCWMJOF8nLo+jP6afQrTnlw6euytX1ZJK8pJZ7bGegV0ORelwfOh+ZkfcYeLaRjoaBed40OMNe2BIMYHNQOWV+sDmN8A12euMbDjIAQNKMgzAZxLbE54RlBujqTbumw5LkNS4gmiYGkDvzQltGTS5jb8sL40tB3hcxersNwLDZbTvnWwaVW9QKRJhjOdOq0oC71seKhsvw0CpDeLS0scvMGv3yUaxsTH9lt+7tdabBy8brmdDlaCfa9kxcLV+2P3dfR7mNs0kHdITTlBw27w9LpMwt1emXBvkvy5m469MTraspHTw6RFW4i24hCiNkdxrmyu+I6QZVmsWYC5jN+/rwu+aSxT3jxY6zo1900+IxkvIs+RBCETkU3wvsY23dRHc2VcgdbnzHpRfLrYX3QmpN83sP12G7psakeFes30eQ1mg++zEIGUwqU4KXthN4k7yZEWlAZVoFTouG/FqqSsRQXtoQH/E8QVK8byF9I7wyjiUdRSQiGGG0DLR/lLyPB29tMlvQ4vFYzADXZ4h5zsuJ2D5uwHJmX97BlEXpbiwqYbxCxOc3imN9md8+49RaE2eHHtoGiYrCJUlchAX0bmOCAIBM+0vR3Vg9JRh7mX4ztxh9LCV5XWgVN2Qli/Fcqt9lgsmDYcRMz9YRkkpX+u5DUWN0ZyBN9PPJ+6X33XhEbbRcaoiIDvbIJZXT5EE1WkvkWlE6H0lg5QdwVpIGh6b1xxtIUxXk5M1/axrEc=
X-MS-TrafficTypeDiagnostic: DB5EUR01HT128:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JpIZgmHV/6Vf/O+ORfl0o+3oBztC7MFgeg6Jnr5V/RrjoAhqcDYQOrB2Fv9qs5CT61uvwOtF2hDUJeeShpiriI65F9bMHzK37OP+BhKO7eSWCbcbkgoRfk0ikOtU3meGKwE8ss/zsW6pC4MwrahPKfbUjlKB//TjKj06c7t8U91n5ecqS8pIbdorxLJ2Yhv1pEcIHx4v361Aov2nmw/Cww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	Mht6Jhu1uT4a7qHkIrF1mOFdPdTcmj/mX3ZIDSVNJZommDuoRlVZnw7VdAcF8qk7eE0P9AX4TGXSA41/PCB5LFYcH3bOgWPSrYVT2IPDX8CDnLKii8fagi4wI+nYPWoUc8J7b786up8992VLuphZjA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118b5570-3a7d-4c5b-2a06-08d8236eee83
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 18:44:23.0222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT058.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT128
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Put files from installed tests into a ptest package to avoid having
them in an image and to avoid having more runtime dependencies
than necessary.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/distutils-common-base.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/dist=
utils-common-base.bbclass
index 94b5fd426d..e3b36574aa 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -13,8 +13,13 @@ export CCSHARED  =3D "-fPIC -DPIC"
 # the python executable
 export LINKFORSHARED =3D "{SECURITY_CFLAGS} -Xlinker -export-dynamic"
=20
+PACKAGES =3D+ "${@oe.utils.ifelse(bb.data.inherits_class('image', d), '', =
'${PN}-ptest')}"
+
 FILES_${PN} +=3D "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
=20
+FILES_${PN}-ptest +=3D "${PYTHON_SITEPACKAGES_DIR}/**/test/*"
+ALLOW_EMPTY_${PN}-ptest =3D "1"
+
 FILES_${PN}-staticdev +=3D "\
   ${PYTHON_SITEPACKAGES_DIR}/*.a \
 "
--=20
2.20.1

