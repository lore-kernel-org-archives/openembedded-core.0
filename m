Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23390.1794818198988018627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 00:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qOjBVRsX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5780073afa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fVkc3134207
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xKXlbkK8OYpxB2lf2+1t9bfpfQnLTJT2Lw2OwDqEMZs=; b=
	qOjBVRsXVxrsvteCTIQHiuMX6GXLRtjr1DExl+p2UjSt+3eFZ+rs90kHVaUN5kFD
	fks4Zxa8kCfueKa+Q/hgRBUHBFITvYGC9XiSIA0qBPajBU8gDyZFlFM70LKqyjrh
	R0ewacuGOd1qrBcYE374dDoK4BhHONNSJRPdTFp3twjQ2Lvdzop+LjtTIUIlazr+
	hjbJrFVaoMpj778bTHVMd8EMW54tggpGh52QabyMjHiIIh7RDRH/bFyHZp7z+upv
	zg6M4jNAt7X27BczByj/5JpdWZ8yS3UrdYkJ7yX9pDuLMaBsgisDS2bf7QDiW+KR
	GA4qlcZ4nsWjbHCKUzpKrg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022116.outbound.protection.outlook.com [52.101.53.116])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgwaaaq7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiOBCqw0RLRd2JVV3FzQqbS82MgAZ3TJwC14H8Lx7abZ2aApuwrj/Jatc9074+A9f0dtiF6DXCiNRubItXupMfNy0qUHfWVys+5MPs+nu8T9DJ4m+5xagZnhC7dy769MKN33twIP1pnnOGmqDrN28drni4KZBDLww70JMZb7eT3IP05vSopsdRCHA5TefIfvX5Wf7zrupuXByghTqYcQZZLloIuL7ngeIwNBGxNzWw+52nKgu/izZPP0d6REx8HxFW2K45o7iUM/iT0i19GDvQjDIFLsfEZeXqgUVUcQE32QkN+9SdxakUMMOeIiJMq/fhlNXeuUxXIMJf20B6vNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKXlbkK8OYpxB2lf2+1t9bfpfQnLTJT2Lw2OwDqEMZs=;
 b=Tq0ZJabKjCugBG4B+fhamjMNQ7PoC5yhC7miWixL1QT20PJRC+dS9+FNxA7q3CkfXrOmOfmu5NRTgwO1KydXUm2DU6UNyq4dM9x3Mec0KQUnbjK/g8MamZeSe9XRpU4IxgV15nIagW8HgrgfwMRKdMIVF4xahwcFCSRhKz0hgS0UsxpcTX7TyBWOT+n9wzbJJ2odbUynU0NI2hSDqiVNm+bEuSpK45SFPFkeDvBXG/Od80dIaDLKFcCc5ju0iswzfcmisb5odmARgAru0TGhrGT7kllXgH1AnVHj8F0DyzlsL4eInO8pIWtmy8YUSZe3BMZ/GoH2wLxwP2e3iSzTKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:36:36 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:36:36 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [blacksail][PATCH 4/4] oeqa/sdk/cases/rust.py: Expand test to verify cargo build builds for target
Date: Mon, 16 Nov 2026 00:36:04 -0800
Message-ID: <20261116083604.1926029-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261116083604.1926029-1-Harish.Sadineni@windriver.com>
References: <20261116083604.1926029-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f5659d-5258-4c20-4857-08df43bcb9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|18002099003|22082099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|10067099003|261102123227099003|261021121427099003|261021123027099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info: BmPWXD9hGMAviZh5tRg43VzSobDwMsRQEjTnBDqBQWh+MnCOwtzcJJkUrK26NA1wf05dDCgzb9K8qDqia3EBvAADym1mSvurJIEkYoN/83XdndsryQmMfzTycLAucHROBwQNisq0VArJ0mqElWITz2FkZYCftfNRhuIlsMR9oAo0kN8J7UKmWpcY3AIDXuRDhsydTfPTjEUdKpYCbbXxRYJ34rzKzZrREZm8fOkIBmdhMXw4EqvEUvTtMS6yQ5QyAeh+SZ4u+di31AYUIC2YvyOODjnQ7O8UhNoR9y0g3PnA0f7ZGPFNs2oufDyQoDkhBiIRimiVWk4ZoBU3QEam05uypZqrYYAiQnG1HBaBmKDUM4dX8aBrABWVrmZhf6WBUDR3BBMUbJKxxnBPJjfeK1LeUD2LQnKa33wgKXvTGQs/0brcoBZ2wNZ6oOVCuNGCejIZsE1SxB4uqZx8jKjQuZsP5ZBBmRWt0coG1q8xdUoQFtsABn5TfdFzO2vS0kcsdUi+mU/TejI74GT8gHwCNE8BR5G5OpsF5fbq7q7xuYk1EjOFfPJndU+ufN8OgBt/KtjUaTd07qVGqV9r4zq1fu7xZYmfU3j5bu39pkhKS+tq/sD/HBEsbSoMgrNxdBflkJXCa3C5955RWaadQX3mppx96VWVElhN+lhYJBkPW6uTZSnmFe3IhubTppM73BeiQCcFGW27sRbPgnZ2QJrbqs5Fb+4qolTeunwRF1NXshk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(10067099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FL5A8PHlBglG+Jcpi/w6k9RJoDy9qwn6fhbE6LKkm0Z+pdtcEPOooWG8nnW7?=
 =?us-ascii?Q?k/KUMqr2q+dlOCS1wUZjPzmYqX2L34ATSXJSN6VbAoJnZhcrI/vdAOkVD5qa?=
 =?us-ascii?Q?1H1mrkEZZdgbBpres3BMOwMDMshJe8PVgcLJI3WDpMhci/RAhOQKa7axnZPF?=
 =?us-ascii?Q?QhTp2cqZN5SUVNK08/eX6W4PUVzC+vCr4FLGrl/RG2cadXY8umtXo3iN02kk?=
 =?us-ascii?Q?3LM4HR4aUVPmLmkCZhnRKwySU0c7hQpvwVrue8pAlqejcLEPOwicdrnO1EuV?=
 =?us-ascii?Q?xghMaYpWJPmVynqPOP/mntHdLZ7lCpTYFFuXl6YQbTR+DGY2nXrdoHadBGwC?=
 =?us-ascii?Q?tGq7Said2wpc338RSu4mxn5Y72G1Phj0rzO9V7u97ZT5CeVfVvpGJxis6nRj?=
 =?us-ascii?Q?rxOxFIUbsDnOPtVNBAlQBgk9PepKkc10c4PfLL+l0bhxJCFKXIVMD7sWfFTY?=
 =?us-ascii?Q?mtyqmNMEm81N7xxmJv+ydZZx9IZ7horQKNID/rRgjAI4URbzsHMOWtXJDGHM?=
 =?us-ascii?Q?24lbBeUEVM4VOftdzsRs2r5xC6AnqQhwYkKOX/N4psJ7YXBwNllTBbESnm8A?=
 =?us-ascii?Q?ZDq9OMyWXd5YsdGTa8REgMWo+F2IMkXvNXTTcCLCGPPHJZeRUiEZJGhxpBvJ?=
 =?us-ascii?Q?xDJAeIBNpl6p5lAqRh0wz/SxYblpRFaaSBlciyD32e5yQDpsg4EFX/oIsVyN?=
 =?us-ascii?Q?MSwBZTn6ifVQrupAdpzgm+C+2Tr4Fb2c+435TROi3tlhaAnNc1Nr4XYUhI3K?=
 =?us-ascii?Q?dAYZ5WENxiP3tRh2Ex1Nh05lmKMokIjrTm6Fqg8J1zHvBNu8DkNEFJS9MtJe?=
 =?us-ascii?Q?ehVVOEHXzskWdgydgYHTfKg4xcqZTO5I8gJQROD9oIwZRBajjZ4tCYMiMWJB?=
 =?us-ascii?Q?rs33FrA3wDqtUTWTspqCXke7S29U5ZxWeBi8xCJL6IEFr1wLbZnS1obnrHGk?=
 =?us-ascii?Q?uDDsmM5jffjYMSnp2Dyfydvr8pzcjuHCMhfkmXg9TLtasuGbOtH9unrJh+NF?=
 =?us-ascii?Q?swqrDIKBCcwNSKjhhrxXjFo/Jgp+9iFO6WgDVUo1qOEL4AXi55f1tzA10sX4?=
 =?us-ascii?Q?wg2gb4ZjB18jokRgMhdpq/OZxkTHrKP2xeYQqh9nN4f6d+Jauevh27SlMWP4?=
 =?us-ascii?Q?q1JOxfZj0DjPTQ3Lbc4hQ3DZSlTliFWvKWpwNzhQh8HZj/MIdiPTi6F2O37z?=
 =?us-ascii?Q?CXsT5MiGTkPCU40ZTSg3Yct2sNYOnm6fyl08Mw1qkM1z0bJnLAkHGNV9f21o?=
 =?us-ascii?Q?3kDJQ5PVYUBRT4tdA6g2ujGxhpkYKoUFLm8BE52mJCewjuNPBpxhyCBx3oad?=
 =?us-ascii?Q?g/EI/uUTidwcjgne8Z2xrIOdi2eCaN38x+hWYPrFfx491XKj13xOEVeMmHLg?=
 =?us-ascii?Q?hWwjKZYvboI8u+s150iPJwGbYT5m3GcTvsSsw2ttkKDflF00xuNl2OC4Jt4N?=
 =?us-ascii?Q?92mBdJQPiKoflwSQWFkmYK3KxEloX7rKy+7AGGRs9zajB4YLDuh2rSV3pPfd?=
 =?us-ascii?Q?hnpOQbc6GRNyLLpTShfvyZOoNxos1eskM+Em1uOLHOPg6ucfeHP5n/c5+5lA?=
 =?us-ascii?Q?fOnbRTRb0CIaGgZ5a2yxdOExgtEil33BtCopMxN0eMPCb5bd73sW2vZpRCbf?=
 =?us-ascii?Q?c0xupqv6bbp4JZoaealgkgb244T9w8CJcazJLroLjguN3UcXnOy7O8Lx9JWD?=
 =?us-ascii?Q?QQIUjLnBksrWH2JwRXUCca4AAz+lugyo+PlhaTzkbljEkWXT6OAakN+wH37V?=
 =?us-ascii?Q?CE41ZJwV50GnHma7MKcepwrR3fjVrcw=3D?=
X-Exchange-RoutingPolicyChecked: E6tx3qEt8QTpOodmQ6Tq1rzP18a50sa4J4fpX7zi441ufR8K3IcJWIH4JsEcyoyR5ZckNU0bh39UE9S4Ma7hS+MbBY3i9cL6DmZg20+kvq9K2rl9mNouQv3ZsxPgGCNtx2e2gKa1KsXMo2rbbteBnLd/MNAjWowjley0OUbeD+XwCaFt2NOKC3mW1iB+CApO+wiHM4NILg+/RiaAM6F6UtIgacCACB4ifTV+D7PEfsS5PNQujS8at8tHzzJnFjdVvTfczgFptd2/QImf26yUvL2nIXya3/LSVDQtN2+E5lQW0uNLuV/pXAbrz/3IxfpJuBP2QIcbwWNr+GcthF58yA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f5659d-5258-4c20-4857-08df43bcb9f3
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:36:36.2997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uByPdyavFKrD8DOmGm4PZUXtCMm0B3ne6C90QxAnV36JdzlP9vteHB1tnNG1HDBPzWKou1VgA6pXpHnUF8jyF8L7ZNXZLV9iAcQvwrEdEpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
X-Proofpoint-GUID: kF0brjsT8YqNlOQXktrm_AXFoROvBfnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfXwd+aWD7Dvs8a
 ESDHNr4w/H11K4/lUeSLEQu9C4WF7an9s+dGP42BnA1k0Tarpa3VNXkkJVKRITF15nloROirRO2
 REndQ+2fmmyi1fRucd0RhmABpWiW+8ezqX+TRltcm345HgMG4VKIoxME86H1j6FdGLCLf2EJb1s
 WCYvZzBGn0lmPPKqInMA9phDmXjIp/liTydHw+vnUQwq+uEBvCqVcFsiNlPXlG/NHpPZE45q5td
 39cMkbPMZM+EP/Ts+MLP7lVD5PX6ggr6aHaH7kDqtyB+t4DZdEtF/NPVWD2QAjJMMuJ6Vxmij+K
 fMB3CDzVB8pU+0eIvT+1bTElcN+PEtGsJ02zXElqQ3z+t4hOnkT/Cz08xq7DcCiDqb6kQ+lHFZJ
 Niey+Kze//6l113ddsW1eyphgNvhT+FpLn4Nd8EJLAmcfRH9WYrtM+FqxAdAQchYLtsqU7g1YuE
 NrpIE3qLwwtT8J2sENg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX0eDUXUfM/rge
 5EcvmtP7iaKvIgXfbvJR9GJcFOqrd41hr2mo9oe19pAWOJkoTAZGyZvTQ3TxfBcQa8GgFiJrX1U
 yZfivY/ewPzB1FHlnWCbAhNvwmxzyACcmnBELff4DAMZgQOtT0sP
X-Authority-Analysis: v=2.4 cv=OJWyTiaB c=1 sm=1 tr=0 ts=6afac095 cx=c_pps
 a=h/8ALIBrt28BaDiQtk0qcA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=vbqt8YWObaADYMrP3jIA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: kF0brjsT8YqNlOQXktrm_AXFoROvBfnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250319
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

Ensure that cargo build successfully builds the binary for the target by default.
This test validates whether the default build process produces the expected output
for the specified target.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 482cc0ad714e60adf670b07fdd5bd8b0255ab1f3)
---
 meta/lib/oeqa/sdk/cases/rust.py | 37 ++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 4b115bebf5..b4a8a1b671 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -7,6 +7,10 @@
 import os
 import shutil
 import unittest
+import json
+import subprocess
+import re
+
 
 from oeqa.sdk.case import OESDKTestCase
 
@@ -32,8 +36,39 @@ class RustCompileTest(OESDKTestCase):
 
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
-        self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
+        result_env = self._run("echo $CARGO_BUILD_TARGET")
+        rust_target_sys = result_env.strip()
+        result = self._run(
+            "cd %s/hello; cargo build --message-format=json-render-diagnostics"
+            % self.tc.sdk_dir
+        )
+
+        executable_path = None
+        for line in result.splitlines():
+            try:
+                msg = json.loads(line)
+            except json.JSONDecodeError:
+                continue
+
+            # Cargo emits multiple JSON messages; we want the executable
+            if isinstance(msg, dict) and msg.get("executable"):
+                executable_path = msg["executable"]
+
+        parts = executable_path.split(os.sep)
+        target_index = parts.index("target")
+        path_component = parts[target_index + 1]
+        if path_component in ("debug", "release"):
+            file_output = subprocess.check_output(["file", executable_path]).decode().strip()
+            match = re.search(r"/sysroots/([^/]+)/lib/", file_output)
+            target_triple = match.group(1) if match else None
+        else:
+            target_triple = path_component
 
+        self.assertTrue(
+            rust_target_sys == target_triple,
+            f"Cargo built natively for the nativesdk host instead of '{rust_target_sys}.\n"
+            f"Cargo build needs to build for target by default not nativesdk_host"
+        )
 class RustHostCompileTest(OESDKTestCase):
     td_vars = ['MACHINE', 'SDK_SYS']
 
-- 
2.51.0

