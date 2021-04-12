Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.61])
 by mx.groups.io with SMTP id smtpd.web10.109.1618247329471902350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 10:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CkFRHC2w;
 spf=pass (domain: windriver.com, ip: 40.107.243.61, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap19C7x0O4359NTB4pntPnBJ5g2aBBAv+eZeNsBeJ8xmECPPOsl5/lQsF/+VTcLoPBJ5TqtgHd+U5S/ZccMm1O/5G12R/TUApOPEaHCt+rkNKmc7a588EFaXPcl8JI5kXacOgiDIjvtCKXKeK3Ua5MlReG8MJvr5bwUe667ouFbMtKjlGwFvPeMUAkMf2HYfYChI0VaHLS8Vf+hLaqDpPszqXwyHIvmlf047zQiNXSWoR3BmBUfaIaScJtk18TwcTuJvyMQqbUhj0OpUs/Ley2WEhKU+iEJhE59HF61JQFse6T+No2nbRn2dtIkBgfPKxwbwzFtmdQRln0Dugy57EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BUMIQ4B15X4KRd/LIexrHY7qLK9QIOSxi+XWi5Oafk=;
 b=EaxgoWmjpABwF0WjHCwtPSqu2TJ8MuRbATchZa/f0o4IGEwDcCFOb9aRF92+ZysmUmggq8txnzvjWybeICBClM5dogFFmw8QQf+ZmPQwczMLuqg1WHCD6DlsUpifCA+YUrsY0p8vT+3k+W/Dwcsp2W0/pFr2qe8cYRhElekRoZsAYEH2JVqGWUjke1i7D14yPAPQgWAuDxV0gc4mkJF4MdBRLf/lRqFTDFXtdcwOElQz16fEllpCvJlI6wVRL1g/pASOf/rFSGDRdQ32nKNxiNAe66ZRczf9tgTnaGLFY1Hc9RNxQOCelkxlhxBpQrUWTv6FG7f8LENCwMOYIp47BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BUMIQ4B15X4KRd/LIexrHY7qLK9QIOSxi+XWi5Oafk=;
 b=CkFRHC2wxWoQs3wuzuXI1RGoYT5nkbB8j0UXLbkKY1Sku8tRPUQxoyiEMdK7xAsTPXIldJlz5sPsBe+0oqUoRJOEc2FwzUcNSy87oeQujfO6WyZRPXXbQYlLAnBH0VIWKP83O5asT4nt0LUQWf59htwFo9e9ZigT0KOxiQdY3Rk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:9c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 17:08:47 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 17:08:47 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pango: re-enable ptest
Date: Mon, 12 Apr 2021 10:08:33 -0700
Message-ID: <20210412170833.1537241-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR10CA0021.namprd10.prod.outlook.com (2603:10b6:301::31)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MWHPR10CA0021.namprd10.prod.outlook.com (2603:10b6:301::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 17:08:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f948e8f4-afb7-4b8d-17c2-08d8fdd5a262
X-MS-TrafficTypeDiagnostic: CO1PR11MB4786:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB47860434C363B97AF5CD9244EE709@CO1PR11MB4786.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qM7BbwLsVGOOIVvronVN2eRbJjmqHIJJagakQ5kT+7T3W1fANDfPhQKwWIf+cRb5TaF89GEmncv8Ah7I3nRE2Jn7Q+9CiBDBRMq5Ml38t9/284DN3NCQpiQUgfeLHUMACMIE4VaoHrQr4IeKDUuOkQz6VN6n2P1VXa+h4ibb1GxuOrUIQShUTtzLd1o58uOyMTBukMl4eTi3JKSSlhbeacCCzwlSsfN68dj8JIAXjoZkaQiJ1Gsa6KenhmM+y0KuI5+9GCUFZqSKefSO0wV6de+ABVIq4JEx2FS+MdHDZeQpUe//wpCESUbQJNUHZvff/DkNQ/oOIcEZ1PsVnHq5aaDEar2renbw2qHV8/YZCy8wPUj7PY7PRJ8In1lPBCZpS+qIhW82/nbmOzQ3/hyUsZ1n7lSFHG06aygz/Uk7WcC97NV3cOPbmo6vg19QmjMh2g5ARc21uP5nAEfz9jsuKahLsQd5rPuV/D+cTZdPcGnPkW5PLClR33xxrcfKS4dj4Idnk9zDGvnKvnexjykdfW/Op0jOToEsQpSmmDCwbVEGHssWOkSTTw90DeoqIPFTWJk/EEf2CJxzO8v0WGbcq/qS8JNumzGX3w43CC6CgRXqSDjk7iLcv48XIs2Cxv094kq+lSP82wc6qscYrUBbjg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39850400004)(366004)(136003)(376002)(1076003)(52116002)(2616005)(956004)(6506007)(186003)(478600001)(6512007)(66556008)(38350700002)(8936002)(44832011)(6666004)(4744005)(66476007)(26005)(6916009)(6486002)(5660300002)(66946007)(86362001)(83380400001)(36756003)(2906002)(16526019)(8676002)(316002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?X8FQxb6juEZOgCoJRr9hEZ2szgxJC1N0dtqn27P8p42v9br9U5YijayrP81p?=
 =?us-ascii?Q?1AUGghfrCAeX1vsRP7XukRHMFzYpKa88zAanIitvmvC95OmJOc+qA6wubqfr?=
 =?us-ascii?Q?xn9jyOBOglvi5MRj232/W0Q1900INLMZIaVuTOZJN+AbQi7p/EtB2FalDua3?=
 =?us-ascii?Q?QTEHI7NqTB7HD+8Mxo3kCZPC1/KSLSv2Mid7QVTALjMNdibFn8yxTGLenC2R?=
 =?us-ascii?Q?oiFI8TLWU2xqkO6+hMQ8Pw51AVNPpNTelyqsSEY1OD172LIWeJiwHYF0A92i?=
 =?us-ascii?Q?CvMtrL+ownT0sisEwP5Q7IYSEcvFXNubFy0K1H7BH7XGnc2uy7tOGtFshYqt?=
 =?us-ascii?Q?p2xEJQoK/JgyieoQoVpLHkKfeb9En4xbf/PJ5V2ccPZMrY32ORNy6uJ7s3ih?=
 =?us-ascii?Q?GXx0x/i4ng+q1wQ0VrPMHuWJ5+qQ4chrIEAk+7O75JfcPsq1aX9jpIwNYWnf?=
 =?us-ascii?Q?WXJbfjAqLTizYdyLfF7xe3QBV9HOi8nlDNwxe+VUvW215yvwBc9y0WbdkI2Q?=
 =?us-ascii?Q?QhN9c/LsvsNoTJlaS+hCOQzg4599xT0BFrIo49gTmZgTcLKJYwr4Lz26BLrd?=
 =?us-ascii?Q?OP5RLV0fSrFhZE0mdm9raHw6BxP3qrF9IhNDpfoMNAsiUAsDmk0x5+0N6MJL?=
 =?us-ascii?Q?djiz+DDJck55NMvEvBVjS2VVM9LLcptWdI09Am1VVIfME27mPhGhjXQvZyba?=
 =?us-ascii?Q?M18ChXMFgTtRIKD6Ltwz+t/onM2IDfZ22++mtI8JCY6gsv4N9R3J/0MfDRHr?=
 =?us-ascii?Q?I6U8XPKN2onVdkTKKTVQ7QDWINJHeD6Ar2nIve2pdz90RoTP/igEFp6pvECG?=
 =?us-ascii?Q?1Qkn9cH0NLkFmz731Vi0qRugs+dj/O3ScDjff63zJuy04I8+4Mwvx6Jatnk+?=
 =?us-ascii?Q?80OLEoOyfr+RO+q22ScEjFVCNm4V/9HUJZ9SmBt81SEP4ZoeKYmx3So/cQaS?=
 =?us-ascii?Q?ew8VGNmSxfnI0D1KMRVn3ArpsVje3tW6mWnpfqzfI/fFe9xfi8DCylEG3ix0?=
 =?us-ascii?Q?ucoEPa9SG/bPP9FE9uNXWuWsGO/lIiEKwKXWH1kyl43E6T7LvsZDS/hhOgyU?=
 =?us-ascii?Q?Ugw/QV3QuDNogEL5g+EAie07WJQFZhvh4J8RNI/WeCgWIDrJzeJTHp4kHSYU?=
 =?us-ascii?Q?+e5vrASR+dVWJUDwF7xXMgK3+uCdph3CgE4x73mE7zeFkakVURJsuXNUPktF?=
 =?us-ascii?Q?jXVV53LhWhb2ODmL4PxIRqMFmebxQizSOwTALoqhqDXAlqnfQdsJzPAgXzOR?=
 =?us-ascii?Q?aq+9BjllhBPRJGQ2gK35ZCjK8HKfTfjYCdrWhh6I4SsNoOu+P1533b8WCCY+?=
 =?us-ascii?Q?a/QJwJJFCZsp11NZ0ABgW459?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f948e8f4-afb7-4b8d-17c2-08d8fdd5a262
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 17:08:47.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xW1YIxF6Jrqa5ZPvIDS3iXWLwNa/FfF/ObJ9JtDL6mwVHtvEHDi/+7WhybBWn80N0Qwp+2mcONOvC0+RbjRJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The run-ptest script got accidently dropped from the SRC_URI during
a past update and ptest patch.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-graphics/pango/pango_1.48.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/pango/pango_1.48.2.bb b/meta/recipes-gra=
phics/pango/pango_1.48.2.bb
index 1dcb43b5e1..aa279bb503 100644
--- a/meta/recipes-graphics/pango/pango_1.48.2.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.2.bb
@@ -18,6 +18,8 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is=
-even gobject-introspec
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
+SRC_URI +=3D "file://run-ptest"
+
 SRC_URI[archive.sha256sum] =3D "d21f8b30dc8abdfc55de25656ecb88dc1105eeeb31=
5e5e2a980dcef8010c2c80"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv=
 cairo harfbuzz fribidi"
--=20
2.25.1

