Return-Path: <Hugues.Kamba@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0054.outbound.protection.outlook.com [104.47.2.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8D31C74CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 07:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DQjQ7wqUXfGlnGbjGdG33uEX2woDLWot8wa2fDKzD/Y=;
	b=oIM1XGuf6V0Puph3aVA+tOV+g/Y6a9621nbjrxOa+h6M/2pNdNzuFdFQc4WI7XJPIkPveoRAp4aPhtkLjBSxkozoxNJqkyLaZF9fXPovDUwdzWq/d5ygspzlL4/324YHgjMuSwI0tkOMkXP0dvzC1hGquQdqV5NlYOhaPd5YxF0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
Received: from e121095-lin.cambridge.arm.com (217.140.106.49) by
	AM0PR08MB3618.eurprd08.prod.outlook.com (2603:10a6:208:e3::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1250.29; Mon, 22 Oct 2018 14:50:34 +0000
From: Hugues Kamba <hugues.kamba@arm.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:50:25 +0100
Message-Id: <1540219825-12852-1-git-send-email-hugues.kamba@arm.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [217.140.106.49]
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:5c::21) To AM0PR08MB3618.eurprd08.prod.outlook.com
	(2603:10a6:208:e3::27)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d21c5266-5b5e-40d4-29c2-08d6382db8ff
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR08MB3618; 
X-Microsoft-Exchange-Diagnostics: 1; AM0PR08MB3618;
	3:C2DiwhDuSB5W9K8UcoQsTNqD36yh/8ytGzjA0GBs6X6gOW/g+nKncZah/piFkHqUKrVBQknweaBnPmQe9jcwYXqgMEB0XlyXRQmslZnHv3vctXH48rhZg/tmBoYU+XCzHPosbTfrhdozkZyrA37HYZAGM8uuJTIsunK/wj7ls1YqnqpERTrkDwXxyxTVEz8iSIgCifkahxpcRYWCwgL4S0FSKawjlhZWWLRMdu63DF0uanJ7xNuEBjhX7ViYgQRl;
	25:mWx6V4Jtpg3MpCyxpSQpkl0jjjc9QDgoGeMH1Ms0NN59O/PAuR9WyCBI9f5snHctWz9j2RjbjvH3sS1vepYWv3plxROfe4UF3HV5up4KLSA8NvMdZeZQ31X3Dv7WKDDE887WaVaFazKktBNH6V//2Zx3qt2JeFdSxt2JggXpzf2mLjfU5b2KBe40cvOW/Fcy4+hlyT2LbPxdgpBj4xIdivhTFtBm5ROYjR2D+WDRL64jAY0awp4v1qMK/NxHdP3n6r1Jko8aKVtg8QzSUZEZsAdZESygeDkK1Z1BoSJmE1GXECmrpbzMeCxnj/ErrEjFJ9EIBLY6Dp51TAtXeu0TUw==;
	31:CLkbH2hgOWZkyJuGqATjgG7ki91pQNqAwFPr1D1iP8fseHGm2PbR2KhjuHer8VBqGXk012UmXYvlz4F3rRB6CxXaWUrCeRm3mOAnv4zUB9yOCZRGRjuTnpKYmpqZmFmy25wqQ181Oa6ol0/zBW/0C5miqNwMzLz//k+P0HBnvs0IpN1fNq0rwR7knwBT3ouPHl25RddLa/02yZnqDy+AcYbpRZVkT5lMUWkcLkSTc3s=
X-MS-TrafficTypeDiagnostic: AM0PR08MB3618:
X-Microsoft-Exchange-Diagnostics: 1; AM0PR08MB3618;
	20:6wQmCrTeSxOmiC7itmm0fuOlBzvJWuYpGF2XiecnowCWwtSatyTEqSu3Igow8KS0LU8vTr9upgQFt8J6nx4hkJes0CmS1xQ9okFIUiX2rtq83Ux4yh4kItmKuEpSQnKnrClYNkDm5hj4UrTNzB7wghIsikJIKGO/fajB/Mt3/j9lakEGbABaAjinwAW8wUngmkAPYxpBM5iRj2xPNJLlOrM12enbX8HM2M0Eygdc51ykXVf+C+Noxrr23jaBy+64YBUceNHAtyrYFFXmWfXrIT0F3OuhSK/Q543o9PukLfhXrxf6/IHByvh7xa5V0fFXA5Orw+qxBKwLdLcpkZjdcA+/7Wc2SFIGecQUWYoz3pXmLNOFWoOXk40eVmAABshsD7aXVoJOX5tiaBQTxJvYx0od956xKbUvjHHKjHrGPkAgJGQJgD0grOibNaMpD5MNVuYJ5/OjTPLT2q+HtBzjHV7aPmjsL/+cX6eTPfy5QRq542/gvruWsaa6cL44hhFR;
	4:nlrDfbTXl7767WUtuS2j60W9WNB6RSN4w5jEG/i40qZH0hHQfpTfWj8qCgYN3hZLTPuNSFotSgE+2u/BwLFz2tnCVHlDeWCHUAg0tXkFcdNz093R1IW3pMoHr+pn9Sbczl5+HmNSy3KeKvNej4ZHgUnwweogGy+5MeTrSrm4Z4ZD4u0udvgge8YdvduhqeWF0wsHDvhovlfO9DZ2DCCxt/3xC7AfBL/PwMoKcaM1vqJ86wiLvAkytfIOon9sqCmu1ES8rybQnbU4ij4iqlgQsaNa+DNoz0zC0L7l9koF22nv8qW4CgNJVpxfodBmAKE6
X-Microsoft-Antispam-PRVS: <AM0PR08MB361873E847E159E9C9FC1E3A98F40@AM0PR08MB3618.eurprd08.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(180628864354917);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:AM0PR08MB3618; BCL:0; PCL:0; RULEID:; SRVR:AM0PR08MB3618; 
X-Forefront-PRVS: 08331F819E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(376002)(366004)(346002)(396003)(40434004)(189003)(199004)(72206003)(186003)(16526019)(8936002)(1857600001)(66066001)(81156014)(478600001)(105586002)(48376002)(305945005)(81166006)(106356001)(8746002)(8676002)(2351001)(386003)(52116002)(2906002)(2361001)(7696005)(6486002)(36756003)(97736004)(6916009)(5660300001)(6116002)(5024004)(26005)(50226002)(47776003)(68736007)(3846002)(316002)(6666004)(51416003)(486006)(956004)(2616005)(476003)(7736002)(44832011)(25786009)(53936002)(14444005)(50466002)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3618;
	H:e121095-lin.cambridge.arm.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM0PR08MB3618;
	23:JstHZiVp3e5mBlD3fSE2Ub+W4hKBcWPkx2RRq6f/+?=
	=?us-ascii?Q?Nf0OgHVlLsR1dlBDyFtr1J07MGJg4MORkNIPrgqXyM78KyBh4Kw+wfdZwSIU?=
	=?us-ascii?Q?0JmeOmpYMKHNlfN0+PZwy2MdNx6OvmXsK+WoSAGcBUir8woZFylLGzSpzMVo?=
	=?us-ascii?Q?xohsx+HVzjED+jtI5RCppu7DGScwaoyuHGhlVjqA3JMw0NsR8ApdZ8EQf6e1?=
	=?us-ascii?Q?fb9CaF07/DiMWUI1wh1h3Y/SNDMmz2o4gL5nDtyVuxvXW4OKN+SqV6qysWak?=
	=?us-ascii?Q?6m+ZhI2JTm3rEDBtk2B3rd4RcdxXfXwj+8bFOxXlMV59qumEkW8AKx8d/R8W?=
	=?us-ascii?Q?WuGaRJ4uwgpOFBtzzdPbvFy7eKjuqVb7sWeLMXc6n0d9bHBa+D1J1FnRbovb?=
	=?us-ascii?Q?XJMU9neRP8afAp3FlphXthP9U2DkWzAzd35VME/aUGAoxmt3n4HYo0HlTWah?=
	=?us-ascii?Q?bZF6jR+GjwlK/soNF61xpv8ANC8asEYBgBt5H4Y1YLdTmd06dvPlTN0SUDsA?=
	=?us-ascii?Q?lwqVIRmRuz6fSkt6zXPym6bypFDPcqMSz0FBYDZWHwIOPiyul9Sd0dK4uxsX?=
	=?us-ascii?Q?7hdg/9c8stVlDUEP+m+iTg9fY7zX2+L9pOQJ1ULUmPRDZhvsJOoeniXMpKNZ?=
	=?us-ascii?Q?hPCfPu8Qjk7q547uLjY6VwAPu6XCWuv1R0EspE/IZHnwBPZMXeHi7K7lx17M?=
	=?us-ascii?Q?yd+L8LJCYLupxaymUZRj0qatrxo+PEaxCKsitZ3pnK78YsukmV5DfcIUH5Fk?=
	=?us-ascii?Q?jVQL2T5RjRd1FiOjmaKUEPylTZhjtUhp6zTx+2qKWMH/U52lVqcBt1T3qyNj?=
	=?us-ascii?Q?hg4a2A+hi4JMceOY8my+S7XQx8t1J+RC1V7UXvqY7gKPejSVde20FkgmKREb?=
	=?us-ascii?Q?ZatDiWFvCYOI78NEpCsi8VQiDHdiniOMyJEk2RmAfOR+uHTINJMNj2ZFABOW?=
	=?us-ascii?Q?dz3RJPi/OgZB6a/TVzuj9NWzqV8q/Jldwxue3in67wjTXdToqXIJv8eXtKI5?=
	=?us-ascii?Q?SUvz/UsGwiFoiso6BeDo6074NptPlTxwjgVbXlZJAQqICOtXFIkpOuBf2IDd?=
	=?us-ascii?Q?1Z5ejOnv64VK7ygDDqKLmWE4yEnkLmGYC7dkWL7FEe50Bm51o0ZgBFDUTs5Q?=
	=?us-ascii?Q?YgRd6vPEhmQK0AqH4f4PRPBeljBJ1TYK9gdxLoU85r3FtMkMCa2eQbuq0lwF?=
	=?us-ascii?Q?INL8949HgKCuEkwElzWJXS9iDadmG56LqeJT2BtAQuGNzXE1OybhiJlrqKa6?=
	=?us-ascii?Q?LVNFJOfTY/qGg+hV3A=3D?=
X-Microsoft-Antispam-Message-Info: OV0tqGvZbC+1W0IdoxQrIYYkNOENr5rjU0IMOHYGmwnHDOmsk1LI+ucuUVu3fiUfYwRCS4Y1wi49SVamNTviisqh7BA4/pKg67aHOK6m65Y4DUSpt2BljsaZElxoWGie3Ple3sXA7Qd/89nwarnxYsWNf261waHv0R7aGaUZ9pedL8T2EY7UF4yoqsBoOxCW0dAiZj9MC9I8k1KC7GzwIm1OTabXxNN9uF43yocrmsJBdI5rhTT3Ul2MWpCgTCFXQt/H1bACIIY8Lr6FHse3bcGbUOfheLyrQf4AhGXVNN/fXPeJH90QEwaSutO2+1tdaU7pLgQRiab1kjwesN6me4KjE5nxQc02AaQ6GDDwzsw=
X-Microsoft-Exchange-Diagnostics: 1; AM0PR08MB3618;
	6:fakyPPOwKKUF98hohV9ZTyDgEeXbUGlo/Nd0WBaNDlyo9B+8GMYvZyMlOgJo8HIS1CQUTPQseH2WjBt/QbAhuyGq4BHYd8MNMvImW/865Ss4ec4DLLZBXfD4wHmQXqXlXBSTJnTN2fOtoL0TsqRZO9D1EJUCTbmUEAmU30FcdwkPWpoQ6qbRhX9BkB/sXLvrcfezi0sVuoDUX1G9cvX0zs8STjeLBn93ikHP+yBVPCCK4ILr/rolQKGbjz6PDFThpk5tnpJav5a7C4PwtaguHNkKGWIL5U9Bp6t7nXSuQJGd2+H4odYsb37SNaLGupfLyGy7zpMZCMNeu1hQl18U1mpUIGKWJZk79ISeof1+bxIjXi4rpHSOShrvidXluYCuhP5aLFNvY0oFg8ZT74coZyjNdWooQciT27QCnYaBLAL/885WywN75rbGi7KY9y8iiJeacqm6y5hA8Jl5oI/IjQ==;
	5:/dC/PBLnPAuhiHwoiABvwM4KBpRMgqBo2crqodkiZqe+g9fOqHTMHoxJE+D9V6ljAQq1RKQFkZ0TtN7XzAY0Sjw3Zce1xSgcpRpMH+C+OJHhUosMyfytyJmQMxqFJY7Iwx915bt7Dp7+hC4PVF+pBKrZq8sX760+JJqWdKuydAY=;
	7:R6JND2wpv8UzMxLxF1HrS92uNNJPHrvdSjhOmJpUmn9Wot876/Hsy0hENhQrafKXErYK/6mulMiMP8POytzhNGIx+jrX0DSe2kr/LlnRussIqn/wsdkT9cnQrSVbafS51piJjDt7o/3HsjVuAhLAo0FkpHPCiDGi/tpmzd0x8k+erDiEsx3T1k50yCGV324MfYG64MZATadLWVmC7x8H3VAU16A8NvbA2R0PwRb3Gg7Z6Xo+CQeTpfMmtvKHS+0q
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2018 14:50:34.7527 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d21c5266-5b5e-40d4-29c2-08d6382db8ff
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3618
Subject: [PATCH] Create python3-venv package for virtual environments creation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2018 07:25:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

* Add the venv module as a self-contained package since pyvenv as been
  deprecated in Python 3.6.
* Fix the python3-pyvenv package by adding venv as a run-time dependency.

Signed-off-by: Hugues Kamba <hugues.kamba@arm.com>
---
 .../python/python3/python3-manifest.json           | 26 ++++++++++++++++++=
++++
 1 file changed, 26 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index f922561..0b77083 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -915,6 +915,17 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
         ]
     },
+    "pyvenv": {
+        "summary": "Allow creation of virtual environments to isolate proj=
ect dependencies. Deprecated in Python 3.6",
+        "rdepends": [
+            "core",
+            "venv"
+        ],
+        "files": [
+            "${bindir}/pyvenv*"
+        ],
+        "cached": []
+    },
     "resource": {
         "summary": "Python resource control interface",
         "rdepends": [
@@ -1107,6 +1118,21 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
         ]
     },
+    "venv": {
+        "summary": "Provides support for creating lightweight virtual envi=
ronments with their own site directories, optionally isolated from system s=
ite directories",
+        "rdepends": [
+            "compression",
+            "core",
+            "logging",
+            "shell",
+            "stringold",
+            "unixadmin"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/venv"
+        ],
+        "cached": []
+    },
     "xml": {
         "summary": "Python basic XML support",
         "rdepends": [
--
2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

