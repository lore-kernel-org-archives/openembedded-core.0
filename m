Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1276.1631030562971014926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 09:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=c8m7Yhlj;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48849ffe7e=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 187Fus1f025085
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 09:02:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=n2VyZZ00HI0dLqGFecjtPShCfSr832JRcjNJVsyVxVw=;
 b=c8m7Yhlj6tF/J5H05OUJYG4RhyIhEYuoy4MjMLjIWNcopb7Ii1WxhRaHoK+2Vo0G42XL
 6TINh0HdhnFx4BWxvlJ1Y5CXqDXEgLK0yCaZRgaO1Om5lG5nJs6gjZ4AKM3SFgC8xXzp
 aWquy5/T6f2zz4aSuTf2vZvxP6jNH6iAAVteo57ZyDMy+176CF4s9/jloWDGfdURGoAE
 V9kPCM04xSgz7r7Od7VeHJIL+R7iWt6HmkjrtvCo8DejWmMun8UpQiD+znbQWqHTFEOi
 AocW92aglBnoODrsX/crzAASa0aESsAbPrxNPaUxa6vfaosCj46nozF7gRxmj97BLBYy 0A== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ax4nj89u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 09:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWHDz0idkqQmMT+0FbA9ZNK/K1YzolqMojCXJXkfAc6Hf8VR8PRYmQn8s928SfLEyMeuQ8yI9+OkJWs5gYMDSlUx0DuH+C79Y3Q1y3bEnrJgAeem3scZ0q6uwJ95BpHtlBIDXsMseMVPbr9oFZlSyInlMYPcVgCir/Ms6VZFMPF7/M1KQQ1VSgmb2yfKJ7IM9Gh2aA2Nc4KCKjCaEmftkOqSdMMCIfJqLEd+Fh9u+t5ycUDLc3Tx4NVM5OKnwJMm5C6hPqvdBkNNENJfkVDuqCmcoeZ35zt5G8NOY+WD8oGB4udTrsqtrlYAGSs9vUM7o0Ve8s/2/aB6Vf1ho6yU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=n2VyZZ00HI0dLqGFecjtPShCfSr832JRcjNJVsyVxVw=;
 b=I8eSguHSQzRhN1W6qclo/v32xcix9kysZdwSBUZ+uF9ghnqUguRK+pR3dBLsUcu/PJcFh1TJHN3RVQgBkJbN2rxdWRuCuGghCzWH6zUG0ZWwViPuiHdV7SR8EldYcsR4H41lxqOQ/l3CBfpSmQQmvCz8l/sDjWatkAkaTmYLkKFpi9EIu46lS1GlAmAtPrguaOBSH17Y8kE38nJupjQikya0St/cWRnQOCwrx5daJbnjtI5OA60oYp388mJOldeHnfJY5YGbEszT0vrIMLa1GEFPuzyedGF8CZ7FGz0uH+uEi+bG4NTtQZdgayGCdhWhG52IUXsvnveyqR2eLf8g9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 16:02:39 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fde2:338b:6ec:71ea]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fde2:338b:6ec:71ea%7]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 16:02:39 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] create-spdx: remove trailing comma
Date: Tue,  7 Sep 2021 09:02:25 -0700
Message-Id: <20210907160225.2923977-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MW4PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:303:86::27) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR04CA0202.namprd04.prod.outlook.com (2603:10b6:303:86::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 16:02:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0659f54e-968b-4419-af2e-08d97218ead7
X-MS-TrafficTypeDiagnostic: MW3PR11MB4683:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4683740FBA3724E2A0F22065EED39@MW3PR11MB4683.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	quLk7Q3/5e2Mx5htyOKpM6+KyIGDtylQxMTu3DYx9JGV92+UHgXBNFWAa4oMrJFrV3GgD2oJKoYtQypS5untjwf5YeSVsXASZZCutR4rTGrhq4Vj4NNvvSAVJ1fF2x7jEkr9jhPmpiD1s2+JdP/6gZPLlTDwcvBMK3+WsvvXAWv8azTp9c72FvbM8KTnt8iQiRQt8ne+E0P5/xBGtF03Oa7UgPcI+j2uph425QDnl04xXrhFL/sTW5W+9eAyeutsone62D1VLH8QJbQWDIPBitLLXfMcx+3zzVr1frdAsMa4erhBkIUf+z2FVY+EpIj8yHrhHpwdSCzwAT1wkBH8lXEcNzH4Mk1BpucADCjQFJa4zY5owk6+P14z9l2XM1rpIO0Ali4JeJa5NWCPfCx3pZgZWd3003eB0oA6++l47k4CkccHswTKDzJRtWpmc9F96z5GbeqRtrg/uNjNbwkJOqkZSihvQJhkt25AhQmORSv0GvYzy2BQmp6U+OEbVjOwKMrjzfzvCyWf7qkztnn3P048PJ5UlpPAbaI8hTfx5e48yJnUv+cPiGbCUDEKUWSflCo9GLcru94zSlLwUgioOchUUGHEMB/on0he2vqmA18WroRwT2VfrtrGecEUyU91HTxr/cnrBP15mkxCMzk2BuiHJRQ8VmcNG52UQrIG14Mfx+XMfVaGqcnwvG3ceO6jpUVmfIsgKgmeXg3Z5ZyquA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(366004)(376002)(346002)(86362001)(52116002)(38350700002)(8936002)(6512007)(8676002)(6506007)(38100700002)(5660300002)(26005)(6916009)(1076003)(316002)(44832011)(4744005)(186003)(83380400001)(956004)(2616005)(478600001)(36756003)(66476007)(66946007)(66556008)(6666004)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JchxqZoyVmDahLYCCZdu4zKSoPFlhlNUTnBa892dTgxi5KOvw09bmSth4QS8?=
 =?us-ascii?Q?7qRVuWtoAmhLu0zq/Pf8CbQLcjXyvbbxK2Yn3zA2OX3LLHI6GAWoN4GMx9Mr?=
 =?us-ascii?Q?lk2HSRH5B0LOrr+86fOiPfWOlutfNeOOrlI7TGys9g4Txn7RJ9UxU1Zlnlhx?=
 =?us-ascii?Q?yG2r/o4enp73eRgM5Pg52jeAgNHF9M9EYZMi0es9ja3er8eLJYX8WF0qBvVx?=
 =?us-ascii?Q?cCnaotYqCU01VvDSLNLSGWZ7mNlHouS3onnZAcerbVyj8ESvCru8ZBLytDDz?=
 =?us-ascii?Q?Ff3SwsB+3GQkmPSDumUVusaK3DD7eiwqhmssaHws7BesCM7VGNdnGop2rsjy?=
 =?us-ascii?Q?bedgKH+L5OZcDURvl0OfmHYg3bDHW6VmnAOEBENXdaCc7bTD10uQYaIWSg2e?=
 =?us-ascii?Q?ijsBXJ2KTxTiGwkRXXm81MAKMI5VtTVy0A4I/Oym0HIPMBSBLkaFeyx4sgcE?=
 =?us-ascii?Q?fRsbW2XXW0mnrB34xGSlNTOLVMG0c5CyVOYvZqTeGuiGw3jPsFWkskuOS+BE?=
 =?us-ascii?Q?n4tHHevYrZoKbzO/e6HyBkm3liBJadPB+OcHJwUQ7U5yTUzvnJvl0276OMK3?=
 =?us-ascii?Q?YVQ83gyQZ0hhKfCoRFh7FeMY5UncgQwhlnImWCoqBbgTChQ5hriyJMC4z7Vr?=
 =?us-ascii?Q?lz0eFXLEegAuBVYTL9Ng42ZjskRxbH+pNi84+SJIjKZBcnKNBlejqxA7KbJd?=
 =?us-ascii?Q?ZyELy84ztjf+vwPiN5XrfKjQexyHh/hMVKKlplurWBeeL5wPYhcEsLLmaIVg?=
 =?us-ascii?Q?P/7evAoHSPMKUvEsqFlUqEHq5Ip/7DBht7JVq5xxk2vUllzm6pK1E2YISjNG?=
 =?us-ascii?Q?nkokg9sMkYHDQdug4sov/IOUCm5sk7adZS/YWQhxppT/jJgJz489RsPA/CiE?=
 =?us-ascii?Q?TltLYdos5W4r+41TJIzh4ubyTxt/J4gjstG622lSondbxMp4vskgD17dj8Is?=
 =?us-ascii?Q?80IIT/54mzfyFBKqfyUsEYYamI8502ZBVwjAjttjt5mbjkYLtvIwJI/+s1hr?=
 =?us-ascii?Q?G4spGaocDn96lfeq7VGQqliayroBr6fzUNDBqO0KgPLDQpGjzfSNjhpLSjEZ?=
 =?us-ascii?Q?A+RPyOOdcpdnMVEqAcU+qPUW4andfssOyipEm5L2DiCYBzFGNd00enZ9rHtN?=
 =?us-ascii?Q?vlS9CeEV5DiPUhyJ2W0jS5KCiuzFD9620CpxcXhSD6e2xZus8NkZBo18TkNy?=
 =?us-ascii?Q?RihtGKPytmr3lITzH60/VyJpaIAFcMJLXzcPrV+7LiniBNcFaUm7d4bUD98H?=
 =?us-ascii?Q?bOFrU/1XrA4ufSwbp11TKlnFOdLAtXPtZW4KmbXRW3ltrlg/I+GULx7rbv2C?=
 =?us-ascii?Q?teRqOaxw8tDT7SAFiJT1QfE3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0659f54e-968b-4419-af2e-08d97218ead7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 16:02:39.5705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGcb1duVPxiWHt5WHjmUgGZpEIJlQwRitwqkggdSDwEQvsx6/Vas0Zd/Ku9jp7EM2kQDFiCrjPzcTvV165kJVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
X-Proofpoint-GUID: tWF31OlDpXOkCusAZ6ONNftewOxUKWeh
X-Proofpoint-ORIG-GUID: tWF31OlDpXOkCusAZ6ONNftewOxUKWeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_05,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=633 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070105
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The trailing comma turns ref_id into an object instead of a string
when added to the relationship table.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 1e0b360558..0a2fad5640 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -270,7 +270,7 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
                         doc_ref.checksum.checksumValue = source_file.doc_sha1
                         package_doc.externalDocumentRefs.append(doc_ref)
 
-                    ref_id = "%s:%s" % (doc_ref.externalDocumentId, source_file.file.SPDXID),
+                    ref_id = "%s:%s" % (doc_ref.externalDocumentId, source_file.file.SPDXID)
                 else:
                     bb.debug(1, "Debug source %s with SHA256 %s not found in any dependency" % (str(debugsrc_path), file_sha256))
                 break
-- 
2.25.1

