Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1869.1625106126160456058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jun 2021 19:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=G6EQf3qO;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=281692f184=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1612ItpL011127
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Jul 2021 02:22:05 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g6pkh960-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Jul 2021 02:22:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LK6Jxz8zjDFTwW0n2JpYO5Se2NS4fO9T4gERrTQW2U6yRf59PC1g8VFv9C/H5GbRnytAvMfMMBsP0zBLML/JqpjzPRv/MMy+lUelQKkb94Bg5F+4rSUpJMxDjSEgpUIlxqGy2Kwqf69D5+D1Zr6ey3wJ7hoGAiLOQUNflZvpz+ZZCSsB/9tBIDKdoH0oLFXEkr95GBrkUJ5OUyMIIIPpKqQ8aL6W89n+LLPMXcXUax8i3atb9KUkNM07bCY99iRBjkYdHD9HXoTRdjmsp8DvTO85s+o4QaTSUlX12P6CvAdxFcut3DW4DQFh+3APspb772IwfZ2mD9FwGnwAiU2SjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmwFB2Ef8AFD2Y5hYB5Do3e0WCrovSyKqYZWl/FbxhY=;
 b=hDNkGdB07G8/SnC+GFS+3ecGgDTqy5O55fd0PJPtP8vabUWUy14xbnxcJUq/gpoYMnUAmDuKSL0aFXH/svJF5YwJnA5Kmjhob7wKSVHrc6Z0aE6MkEJv+nx4r53DkIYhEmC2E+NHlJVTiSR5dX5dIgbdIigJe1/i9S9xS1yp65m+M/I9VhFEIgAqMorI6/wbd2U+H2xGzIf+f4dr8qtznsSaudkKX9Jn68DzAju1dSKFC8JYGP1sQKAFxmMgQtWEjCtmggIuCTDW1cJWBFP4PKJSz06ilUCUslsEifbl6Q5KCCf7ZwX4LFJkeddtAWHnA6wQtacAVuuQG7mqQAijGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmwFB2Ef8AFD2Y5hYB5Do3e0WCrovSyKqYZWl/FbxhY=;
 b=G6EQf3qOSAu3FDlnAFg6xMSVgn1jzyusecfQ+Turc/HgjJGyZydgaKhJI0tHzfDjWnu0JWXXdEtYsH5KzqbR31XAHj0905tvrfWTDPVy/F0KoNfT8j8I267UX9473EasD5R/YJkKWCIV5oluJc1+CAtgsa7E7Ms15wlszy5eUmc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5665.namprd11.prod.outlook.com (2603:10b6:5:354::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 02:22:03 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::85f3:7d46:9b5c:ba6c]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::85f3:7d46:9b5c:ba6c%6]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 02:22:03 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libxml2: update CVE_PRODUCT
Date: Thu,  1 Jul 2021 10:21:48 +0800
Message-Id: <20210701022148.26219-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 02:22:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5677c51-7a98-4d80-9dc3-08d93c37039d
X-MS-TrafficTypeDiagnostic: CO6PR11MB5665:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB566577C49A8EB626CADA177AED009@CO6PR11MB5665.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/q8YnyRZb2QRy5RMqkUQj45kyvopbIjVoJG7Dlhip8y9fF9Z+vCqpHFUSUvuT6DT515u8ege8zEXEiutwj3Pds2BgVxYMWXkYMY+QE9bH16+VBdRv04mlTieid+xlqNkI3Xji7VYt8pXJXG46j7A/0OFDaiwFgfhRWGZon57pMItaIn9h5BdXOcVeNL0dIULpUvpxGYqDSUID/2AtBJPQIRkMwYsKwA8TrAfHlXGSsRUkScYNIEpb2EW2+2tcagOeEfhI3ZKY/gO8hMB0AXJUCCWDGL59J1jndcHDYMlsxcLGkrwm3X29xI9m+uKgSqYf4aT93FZvHLETDYbXTtVuh7zvqPYoX0G8yS6jMT0gMksYYMM6TP4tCmF6WIy4459QswC2LYT4Wurk5wdfojNEMOEByf7vbjkbhyNr1PLsO2bIrm/qPjwWd2h8+kng+4SNgcy7UtnOgJ2AUAbn3U/DMrwoqkUYPF2Kt1WOBvgJMLI/YfUjqPsChNwL/xBgaXlDmDBZwJ97p3NLLuDLeLH1JqzX7DfadVrTyJQ/++EQmQ1C/hajlkMmM0KamC50GRY4sJA1eUykCKG3Oekkw+mGNYXm+/YxZ0u3bIQuizFJ1P6HDGOezfER51xUYG9+ylZqzvrm/KZmZZ311OZN+UUCVsBo1gypBWw4BGdc+H2ncDzbSJ86vb5zLpg2wQnj/K7LPtUHGfQ3RS6f3bXCDA5wEDQE0owKLAUefV+ZV65qCLOb6bJLj+csanpYBM5MkxXC43+KgCTn3Ld0UMhObnc4uWANjcbmHWL/qXCZHgcdb9U1V1mhw4F++M597xG+aBK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39850400004)(1076003)(6506007)(6916009)(2616005)(956004)(2906002)(36756003)(6486002)(86362001)(26005)(52116002)(16526019)(186003)(66556008)(478600001)(316002)(5660300002)(6512007)(8936002)(66946007)(4744005)(6666004)(66476007)(38350700002)(8676002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E9f3qqr6ksqDcn2r09vu4quNmjt/tpd2pEt+IxY8U5Z5fQMbgUhc0hK6U1gK?=
 =?us-ascii?Q?HzsFTmapUpyLUq28lDQVANYTbj5qya9WsTqyRasmj7tw/x8qQEngk1tWHfX3?=
 =?us-ascii?Q?OCegeroXJKycfHjVZy6Jeolf7ml6ACDvkWGVy6zhQZfeNl7fVTkZdB4byjYK?=
 =?us-ascii?Q?uw41cpqILDpyE5LBlX0PzDXidkir7t4t6V+5WfWei4FAO94IE231y+m66aKu?=
 =?us-ascii?Q?Dou3nBi1/o4wJOS/bPQ6erMTJerToZjdBAmRQ2tLs58eMnTdUyc6U77yJix4?=
 =?us-ascii?Q?B/opTsqCNuNsGEhCAVRP121kBxbpV4kQSImptgKYv0RxeCzSMOZ917Pbc0eO?=
 =?us-ascii?Q?cmaz3jMZbCkv+xTX/RuDk1dY7RjE8jgGJHzF6fzDleOOW+fcsJQrNYHWZW9x?=
 =?us-ascii?Q?mqek23JtIbbi2wOAOMLlFaO87oK8xmrpM+rErkKwky2LfaCm4qTH9CUviNB4?=
 =?us-ascii?Q?wgj8V7HzoUMYF9piNUO++erfytUqk6kcsxy3PXTuXs/ohkbjsTJHpC8OTz5M?=
 =?us-ascii?Q?r5kEPkDrYGfq+Lf3uGqMHJdhntgsk4+kvUmFQKSS+aIHjyI6N0NEC5aJ5clb?=
 =?us-ascii?Q?7q2f2hNdY+C1wssXLbgNfdshtHxp7FLZzDPIkq+j0Iijw0guhnMaar7iN0bE?=
 =?us-ascii?Q?CjeVncitivaqU6yx0KitPYh9sf2NYOh1aDlieTcR20MJ6Tw/S68lSssgFl5+?=
 =?us-ascii?Q?nrB4X4C10DWPFESmBjqc5IolMjOeLVn4cIbe9oEsKLiZ2Lo/XB0sZsIvqSdV?=
 =?us-ascii?Q?NKP/O205wswsvO9XaF4B1JjdM1P7WoDj8bMLWILbWiqf6BA4JASpifJU6hvO?=
 =?us-ascii?Q?5vuOCmlU4hWqxSDVOPLnLSRhTzaBSRmCYjnqEvUUHq4Nhx04OfMPUOWJsra2?=
 =?us-ascii?Q?7/g3B0XPvByTTN6FlrRWvGZu2gscqitA64gEbS0MTMyrEH+LYqULEkozwbJ4?=
 =?us-ascii?Q?tW/wP1bqn47xNnUepfkIKYERzuQLCfgH3rl24klrqSKCRdUO0FQqR2fPfutr?=
 =?us-ascii?Q?PcdFGvZcOA+EIjspn8Qq8FQ5WatByZLhcMo/Idc5/u4RXLUYdqIwLKJYNSWe?=
 =?us-ascii?Q?utgLWlZhokc5QOZr7CJvCNzqwNRwXmSlCxl50/jeNzlSfkdZFDuKsqK4eNK+?=
 =?us-ascii?Q?JH/KFe3B9c1NNjrYSoCc1dVi8/Azz57A1wXM16HuYaIbcyjZne74hJrOGVNb?=
 =?us-ascii?Q?Tz5lw4VjvLKrJf8l7cX7fvfMnPy+iOOm6p8xcZSrlHhwVKUc6p+EjnAD+7q9?=
 =?us-ascii?Q?SW83nObClDJUEwOdOSYZ6Mx2K6SjsWEA5oC/Q1cnikgBNpyBMweevj+d2D/y?=
 =?us-ascii?Q?KXKUAyMPqPrtr4Kd/Od8z9D+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5677c51-7a98-4d80-9dc3-08d93c37039d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 02:22:03.4191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIK+G8+jS8MjfwZnzBMXK+51iVEPsEB28eZJjDYez+gZprEHEZfGE2gHkISE7XqnZxyDwpBZ/yL5JLVq0+ObBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5665
X-Proofpoint-GUID: SASqCdiRgE2P7qfR5kuew9ApPZ4MIYaJ
X-Proofpoint-ORIG-GUID: SASqCdiRgE2P7qfR5kuew9ApPZ4MIYaJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-01_01:2021-06-30,2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxlogscore=736 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107010014
Content-Type: text/plain

xmllint is also a valid CVE_PRODUCT for libxml2, e.g. CVE-2021-3516.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/libxml/libxml2_2.9.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.12.bb b/meta/recipes-core/libxml/libxml2_2.9.12.bb
index 955d934d7d..0f1c457206 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.12.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.12.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
                     file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
                     file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f"
 
+CVE_PRODUCT = "libxml2 xmllint"
+
 DEPENDS = "zlib virtual/libiconv"
 
 SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
-- 
2.17.1

