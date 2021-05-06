Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.1328.1620316140337326426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 08:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mNxL9oyA;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTTpSw5x0VNZnkyPVEzUZX3D7346tzY+0D1cI3vzb//gpFCc6Z0VKzj6rtaAlXNwvy0jYAsnqzOxa3b3oLf8vYb2HZf1TcJu1O/DwoeKqS/YaS2RqQvJnJHfcmDQXSNnkdtFpw6Gh6N1ruciaUbSqc/geC/RVVfwF7gVQZd1zMX0igDs1GjTS+LPKSZGj8OvQlGLsTELW2rbWOrqYf+ceDOA0bx8eunS8FhVd4Y1UVR/DVmUaL8/qvJWqosnWNxcoYI75lAqhtWNHitsaFCKoZ6fjtaPanJ13bI4a1W02af0pK9oUvjaRG6VVHEOrAHT4zOdRcyYjNI5wgWQUk9Jsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bicY0CdtHX2w29JAiz0sZNKfEUEfmREyupE7iEDIaeI=;
 b=WeeaUhw6Y6h6N1BylBcW5v2Nyjv/6wF1X7ekPdFkLKkGs/PJ0Ou8QgjQqF943VJ6BjLz2IdUryTaY9gcalkeZrTMTAZZzvZP9Qmyk0w7U2su8apU6LKH8m35BpVP29nDzlHp+VcKQlwePzkkQi8UyPA0HaRUhrINJXtXmrjVJ/3zo5geGh7XIAQ0ohlka3FLuyFvMr1EXPvlbe2dMbWBfv2Ms0e3x40jqOMVuIGltlolg4TjpdEjBR0PGNYOVWP7L1X2Vclh6relvtwHFjT/bKkYadkCBTuySyuaK3XOM6I5VzHUT33wMS8QfLfqrD4SjYGHdPIAUZe8kBNNEC74uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bicY0CdtHX2w29JAiz0sZNKfEUEfmREyupE7iEDIaeI=;
 b=mNxL9oyAUuGDiesP+0VDpFZ7wmDrfGMO2Ld/hGVSUWEHr4a9yRRB23SIqHJBzdnpH/LiWXoD+Wf/HVZslhBKzA9ZQRtPEiWruU9pe+815aPwGVgcx/vM/mo6t3rVMtTfmM9HJdQWnRsyNpoJ8DDxt49zA9MQUdwnBbsBkSJHlLg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1903.namprd11.prod.outlook.com (2603:10b6:300:10e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Thu, 6 May
 2021 15:48:58 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 15:48:58 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemurunner: change warning to info
Date: Thu,  6 May 2021 08:48:45 -0700
Message-ID: <20210506154845.1247433-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506154845.1247433-1-saul.wold@windriver.com>
References: <20210506154845.1247433-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR04CA0062.namprd04.prod.outlook.com (2603:10b6:303:6b::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 15:48:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9160ba33-25c7-4ab2-78ac-08d910a67607
X-MS-TrafficTypeDiagnostic: MWHPR11MB1903:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19032D3DAE9DEFC797DAB089EE589@MWHPR11MB1903.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m8HrPgh2EiseCjgIUEX+YZutZfMj5Zuni5f/OBN8lSWboQmP62Oqg/HKQFlOJjYEixKGCI0xMSkcsVpBFxK/lN3lqVUt8qyaIgta7rogiRcFuPrRCEjUR1WouEr4D2tdXNiZmvzeS8sDayPxQ7RkWPQAdNos4Zo8zHsebIbbVTprA8oe2SXnKNV1s+Xj+6cZfXbhHUew+3CCoUTQcfg1dLEhfDX+z6Kg99c3dARwe0UJFNUnJNZlD41ZRhneEBBwI7tkW33DWrZIYLGVhr+h34vpihmI/YPi/fidgLZXTih+QrH6sOtRE7HdDJvnRGntmVbxPxj48IKcwtseNlE0zTly9bheTYxwVOJ1LbY8LsfQNG0iVEB1BC5nXkHqR9gVlewpN8YA0E78yOwfF811RtVRKfyCalpS3Ikm8S5AUtxDS19sTx3w3TUnXVyPgwDPQW4LqqX/XUNv7ep66B5ZClYSYffvBLHPHpo1XQH8PzhB9HWFUGwv3cGCDHtHY5Z07O/64d9jDye9rj1GiAca8d97UiU/Qnfe+LR5syMtTNYZ2EtfPLTtrSc7mzOexoQqi3ekesnt1BGh21RJQq41C66tE5ptPquf03XfZAn4JN5KoFV8avhMn0yrNuW/k6Cq5B82zT9vs1ccwASpgNPsVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(38350700002)(38100700002)(1076003)(478600001)(66946007)(44832011)(16526019)(316002)(83380400001)(2616005)(6666004)(66556008)(4744005)(36756003)(26005)(66476007)(8676002)(956004)(86362001)(6916009)(6512007)(8936002)(5660300002)(186003)(2906002)(6506007)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?mZcWZhoV0MeUcFG9ZNXgPxFRq5GZcSBV13iS2zx3n/PX1I2PLnMe7CtLArao?=
 =?us-ascii?Q?X5J72DYJlhnL+kUrAepCVgn+2UEsXPBuhj9ykMNg2RcoCxb6Lj8cbM5AGCsu?=
 =?us-ascii?Q?bKe+nwWLbrMvPlzFVZg5DzZp9oh2NRexdbaz7he+sUFhFa6IPFJclbzPu5Gv?=
 =?us-ascii?Q?ptPJyVq2rkOofgcw/HHoRBFhVHXywu8HFYgJxrqdTF3MiVRmIGYLidgAkDfC?=
 =?us-ascii?Q?sQdHE5TaWegKtQWRgutBAZzv9HdSrTXupR2m9qNMtGE0ii0Mah91GDIbp6vj?=
 =?us-ascii?Q?gmjZ6+pARb2m2DIKoxrs/i9cnL6anxbZF8ohjJ9wQenCVciaVao1xz5o5ddr?=
 =?us-ascii?Q?usx5J0hogBr4DUa6UbfNHim4E7LZhcp2yES8J4M+AOVFt0Y64e+dDJqxjcef?=
 =?us-ascii?Q?MwFBNF7G4sWGAh9t6bUnFYFIKZFJ8JrBgZfOXqj98xTnHHv6CxU+SKWPUBhb?=
 =?us-ascii?Q?Kk+jB7No96Fg/4AG6H3RoEywa1erJvOS8hu405j6Ew0HQjsVp0ZJ8r8bzciK?=
 =?us-ascii?Q?jGZ3DmNnioCcPyVhvZTQgC7ZOAvkIGM2NJDvb6xQjoQvuIgfKXfpMKJ4vzxt?=
 =?us-ascii?Q?qiZEsrUa4qowNMwxHMcytmZFTgCP7+TUabjDeICCxQHXX9OpRsT33kjzoCB0?=
 =?us-ascii?Q?iZAiIhrN9yTl4151bQgRdlipvsjMyFQFXxkZ0yEFW+PQwhMtoygHn2yfowUD?=
 =?us-ascii?Q?lTFLr4YKjghKADygFMRLUZRo8Scgi40glna1sJBcCV+1f4vOJje1D6PlLhuF?=
 =?us-ascii?Q?M0VjRxn2S9Dl+d7BF3TEts6JC5ft4mBeizV2/qA0QLQOtxwgcjCA7HZ0ApJs?=
 =?us-ascii?Q?1EKgHsXK+agMBvnqjvGnFSfkm77h4a3aT/sjdZL4jKngu+uq207FYXyGESLk?=
 =?us-ascii?Q?Rk8rUt9Yzgj/YdmbqtD4bTFafGyvZBo+YXbREFDmCmwvFRAmf1skXeoMtYLu?=
 =?us-ascii?Q?nyxhAOwMsnBkj0UyBIuk004vkrLI3PCAVG8besocbC/gEa+HMgTBo17Y+x1o?=
 =?us-ascii?Q?rqi6wiKFTe0+3wgik3YYRwE204GMBiL2Yx0zXLoPPaljILmTGNpv6vOigUx3?=
 =?us-ascii?Q?Ktt8Vbj+n5LCKXT6TbTBKPXLPbwmwK4Ls7Y8IFVn8+i+aFzLv62kI2p4N1YF?=
 =?us-ascii?Q?PCzDyj7KWSGIrwG85qNmzA/35mz/pcC8PfPe56i3fdGVq4tm+qdGy2Vq/TZo?=
 =?us-ascii?Q?vyAkOGxB57/gTDf29x4L5EQCbDjPX5ny3X3AJy2N51ZiYTDtuQA2yjJrMA4g?=
 =?us-ascii?Q?dxPX4Rxa7eOf+OH6TsOyTWYUV37wqreXbVomfgobIMbUUPUSkr5UcUCKbH2z?=
 =?us-ascii?Q?T+ge3upCzgorZdoAUVk6ECx7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9160ba33-25c7-4ab2-78ac-08d910a67607
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:48:58.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykEAsPEE8/AbmLxAO5WIvNBnsfFEjJrxSOhnSA27qp019r+Ki9LRq5ZGwalJiQUZ8iXUkSg8mfxvBim57SUUcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1903
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This information is useful, but should not be a warning level.

[YOCTO #14382]

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemuru=
nner.py
index 3d3213d3d31..69fee27511f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -304,7 +304,7 @@ class QemuRunner:
                 self.logger.debug("QMP Port does not exist waiting for it =
to be created")
                 endtime =3D time.time() + self.runqemutime
                 while not os.path.exists(qmp_port) and self.is_alive() and=
 time.time() < endtime:
-                   self.logger.warning("QMP port does not exist yet!")
+                   self.logger.info("QMP port does not exist yet!")
                    time.sleep(0.5)
                 if not os.path.exists(qmp_port) and self.is_alive():
                     self.logger.warning("QMP Port still does not exist but=
 QEMU is alive")
--=20
2.25.1

