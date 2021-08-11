Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3744.1628658337917062509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 22:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=R5SjPDoM;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3857d9322a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B50Swg009055
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 22:05:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=pSYc5EBwDyBmMGedpE80MrHpOywzvyeSG2QSPz3NqJg=;
 b=R5SjPDoMPXl9qysDtvJTFZ8GmUSoL+dPwjtNTfBVLGFU+vvq82+Tk7ZRNigI59blJVKs
 rmmStaRN/qBowveVxmNEYjLfvD42DDsrn+4jl381TiIAhsYGhfC90eHVOtkADNOFGHqE
 hP0KUYwC/6VDwM4HUCExxoPZWwHi1Ul4W+3TG9ZcSpI1sl0TjNjtDed4Q1vyCDzhrJeA
 H5v6pAgmdAcQcxo0gkxWBiTuBsG72VSrabolPc7uJjIi5bLOHQfqUEi1LqVJUCuMSKUN
 fCoXPH5rvyGjOx/nIWRhxF6Otoamh4hJkGdguSOPauCNFeK8mGjmeO0v90zSAhA6O5Bc Gg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ac2xf84xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 22:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0f/KA2SRYv7+XDUceH/X7jb2xMc9f68AyMDnV3jec3I/OW8JaFi+gJEV385rj+YvKyY0qYLCVNC4lPaepjicKmgatansne+6YAHLKFRudcfLIG6T37f56n7RSXRdquojawSgspmFZ5iaIxDR5tybGbrct4239dB6Mxha9SvTgdBSHezRYyeuexFwMqVB/jw9MpczfFSd5HM/Rp2bsa1Ho5CYVkblZ6eQVQXBYhXXPJ006hcUr3Uvw71oaP8XOEnrTtBFbHHa+aFA9rWi3Z8clP7LX/9T6nEJc+eJFkSnzUk6EByDrMUBjPr6C6iiHF+9jY5ZsF/iszvi0lDUGGK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSYc5EBwDyBmMGedpE80MrHpOywzvyeSG2QSPz3NqJg=;
 b=etr0AJtRTcqaIkIPuJ18mROpVRgYPwqpL7yui/1WZbuSa7K2T+qwzGW4LuV1bixt6DCF2jdiom8e0mgO3jpadl5QJEJEMKPPFL2a/syTmFsS/on6uRuLayFtyzK7PM2Fd++oAEtKjBTV1F5samIOOlxs/nCRS7dWSRGYmFgiC+vr74/Wdk2y4AKL+fW7A/IVozFE1oVdbHk19aK7G+rvOXUnm8cBbS/d+tsXwMSjx+2NC5iKGV1vrq6YjJMNJZpH3Eemrv5++dmXKtKc9FJ6pJUvvwU0vguL6AkncwROsW3di664wRXSF1T9vGmjoi/d0P58JLI7+ohgWdSXMJjaIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 05:05:35 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Wed, 11 Aug 2021
 05:05:35 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: add PACKAGECONFIG for selinux
Date: Wed, 11 Aug 2021 13:05:25 +0800
Message-Id: <20210811050525.77390-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BYAPR02CA0024.namprd02.prod.outlook.com (2603:10b6:a02:ee::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 05:05:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c61ec763-e749-46da-3f9b-08d95c85a6e4
X-MS-TrafficTypeDiagnostic: MW3PR11MB4763:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4763C4B5F2FC41DF2035D8BBF9F89@MW3PR11MB4763.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UiFae7AAewF5T6PXCdNAxIFmwwkmP4bTu8uW6ZxcnHmt+zlgO+J3Qr3SdKHorgrTMT6dsJDlapExLdh8WXRWb43fnuIsrPYz1t7u5Qig3o9TGwkYQf/TVs5rzTWJt0VJo1NZ3yHpeN505MItu+vQbGUZk3+wD2c2t/iA9Q50LxYUKf6yW0hWzMZaH9NedUpJKyvYSvUOP5ROKoVr/oHFrbLTsPtCs7ADXbb0xIzpyPzLtMani55shp8NLH0cRGanyBrQyTQa7W+VFCTNeHu3SQEN5fGU3KTRHvWKrFu8Vno8UwsNVafdsv64icSEWVWExEvg5pfRUz2bQu9W0ribzKKDPPDCHPj2T+IrSBAkHkITGHler97Gw+VVzPJUFRYDdN8n0cdKHWvgcK23NcIG0KRvQ2G4qkmK+SPRsPsw8q1cfQ9kqXG7KgEx7TYBFaNca3EmSPk7/yFJUUpe80hLbhWVBQKPKw4mdk8JiI20f0Z2U/UhzcODRfABj9TiwoJZhkIN5ImyiZGe/mb1pbWnMGP9BvLX9+HIU6dX2sM772p1EIDoNiwBc/YEhyFGDko6boOQPoTjNYlbiamWK69DR/uOypiwzFu7HFs0RntxE6BZhbig19wJ1AHtynjfj6BlAVW6eMHhMsXy/Zth270F9atk6qIlKA9g8RLMPixisovApbQQOl4u/ZUMNv+FCpYTECya7l2vRFUbPDKx8u4sBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39850400004)(396003)(346002)(136003)(8936002)(6486002)(6666004)(6512007)(186003)(316002)(2906002)(8676002)(6506007)(1076003)(5660300002)(86362001)(52116002)(6916009)(26005)(478600001)(956004)(2616005)(44832011)(38350700002)(38100700002)(66946007)(36756003)(66556008)(66476007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CC1hIkwP1X6rntYnJ4DkwqqKu/wW6nYKwLGYObOi9CNvxk/2ik44n3ezbmgx?=
 =?us-ascii?Q?33klfndU2zYRhmO6AQIdlWIaWDl+iLxSVp05+oveJUtdfru01eYCv9wK8HeQ?=
 =?us-ascii?Q?Qr8ubBn5Zk8IwVUdj8BMgiGaZ4HL7/UnmIMCvppiX51edOJwbxbFn1iB9KEt?=
 =?us-ascii?Q?EMh5bpWNanzNvi6glaZwzFB0OmoU3lcIyqbAptasm5V1O4gavOFd8sQBiasZ?=
 =?us-ascii?Q?3g6u4BuLTBcaiq3hSSNThey+cv/4YNLgTwSaJW42/4CFVpMdnrkBDy1tq+YX?=
 =?us-ascii?Q?23slzCY6BHkKD1o4f6RPGQ1RcLh8jFFKTZ5q5f10d7tGTdpqwnt9baiIe/Ps?=
 =?us-ascii?Q?9Nu+5QDIWc6ceIzDN72zZMmBFOD6dzDNsk06W3izrditoz8s04gtlK8ddgah?=
 =?us-ascii?Q?uygQJXfxBlHQ55gkoSYruOo+7r4jr6Jgi6JQtrKF6vHN1RpMJTvDbB1zp7LJ?=
 =?us-ascii?Q?+OWtfTTyFJ53zgf77VWBHsux4GWOGdc25BejnAkkAYRyQAa17JsB9JIPT9kh?=
 =?us-ascii?Q?pYViPIq+RiYS61laBANf2+iigbZpBxoD3jT1EVe2JvZ9n2HRZIjlMMsJ/Rbb?=
 =?us-ascii?Q?kWCiUMtMPqLUwzUVRna9o9FkiE5GhNxv+SJGqJAHoP4TlMAqSaM7V8JZZlGm?=
 =?us-ascii?Q?XNTVfckkaaBsVbb9RffB5fMR2+LQjM+U+Fhw4FSMNsjHDorpUbMp+R/nMODC?=
 =?us-ascii?Q?CBw11w32AatlPW0E9F3EK5TB6JPn1BMJL1jVtPEbdVW1g7YY/T/hQWHoCTG4?=
 =?us-ascii?Q?iQMx1N4Ol355btvgE15v3vWyoDp3yG560uD2CYM0SZdP1owX9mQ8C0PuRkqK?=
 =?us-ascii?Q?gp3AZ9g12mf/t5OQhQ1tNY2ElCTNGRRuMQr1T/gNVIeODQBxfN0tLvvzfk1h?=
 =?us-ascii?Q?Q54pUYBN3FGE2VZvegxk1wt3dCHVVgN+nwbYT2w/A63lwRw99XkWY7J11pYB?=
 =?us-ascii?Q?VM9Ydvjs3iM8R5n/5v4+UW9Fvxm2Op1erOMFFyC7nUmr9DOXRRc3gcInCXh+?=
 =?us-ascii?Q?fDhRLtT5KJuY4ClFxsV0eoUKbNvk9p2ttshyOHRagrLHuANapev28PN9iWIF?=
 =?us-ascii?Q?b7ASNGq0i4ZSbjlpGjpf3aMaZ45wvhWriIQ8B1Sd+DW/78kK7khgxrj0aZZ9?=
 =?us-ascii?Q?MzLirRT0nzJ0YOpadT0f1ekwCikc3kYr4uCpGFUtAiAkIn53voeOc8vmNUJ2?=
 =?us-ascii?Q?29h+gr7/N0Q0HGYbAFkBaGxuLRnlzUVBHQqp7T1EtgzPwxBiqAXzUXIO85kJ?=
 =?us-ascii?Q?4NtLcZFiUu8DZVqFHEd7QP462+KjxBw/1hc3VCT/Utj49sKMuSYhuPXF5HxJ?=
 =?us-ascii?Q?z9xvrr2uVuyhBEsO8Yk4HU3o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61ec763-e749-46da-3f9b-08d95c85a6e4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 05:05:35.2576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ecfb3Y6aCNgZ6UBP7nvujD8auN4dmWx5O2IfChl5qwzJ43SIi4lsfLoUWkiz9MJjtxuqFcorX/fIUJIIooZJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
X-Proofpoint-ORIG-GUID: OX4KlJURqBbB6QWQgOPMwACZhoHGsv9o
X-Proofpoint-GUID: OX4KlJURqBbB6QWQgOPMwACZhoHGsv9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-11_01,2021-08-10_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=703 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110030
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add PACKAGECONFIG for selinux rather than disable it directly. This is
useful for selinux distro feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 4859d28097..7528337456 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -45,8 +45,9 @@ PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
 # libelf is auto-detected without a configuration option
 PACKAGECONFIG[libelf] = ",,elfutils"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus"
+PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
 
-EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=disabled"
+EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false"
 
 do_configure:prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
2.25.1

