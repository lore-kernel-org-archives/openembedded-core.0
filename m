Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0073.outbound.protection.outlook.com [104.47.2.73])
	by mail.openembedded.org (Postfix) with ESMTP id 8E08B74604
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=J6hT8Rx/3BVy6eNOFzd7zNyG+1v/LjgfiMW5c5GPf6Y=;
	b=Au+YR1JIf2om/cGX9CaNIMbJakc2GL70IR4MiK7nJn5n1JmMqufzN8iw0w8hJKBvLuwxX3RrrlR8a7bZL6J7TLyFKV/COibI3oQo/h5JpzqpagVaX495BU3spT+htGLKuQsNaB29+BfiQFVSC519z94Ct+v8eAw6a00fSSjg7P8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	DB6PR0402MB2822.eurprd04.prod.outlook.com (2603:10a6:4:96::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.631.10;
	Mon, 9 Apr 2018 16:20:57 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 11:20:32 -0500
Message-Id: <1523290832-3477-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: SN4PR0801CA0006.namprd08.prod.outlook.com
	(2603:10b6:803:29::16) To DB6PR0402MB2822.eurprd04.prod.outlook.com
	(2603:10a6:4:96::23)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 24764f4d-7769-49f6-d71f-08d59e35e089
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0402MB2822; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0402MB2822;
	3:WiQDtDFlIoNIkjs/6pFZjWDoJ2vHHE3ofEw0eLlsh9yVRyIH6sENw5MBsZj+7zsg1Ho5CdQk3uq7p5RdYNE1HIm5Fh0/s1MUOHV9FdTLxGMnrcYEWjjpC7WIQ2VWyBzB7/VM7uus+GtV613MdAwNj5r8ex3SVUFefzs5mxWXRxT2BtIaura4nCiQcK2lnZAH8C6F3ISWMYIqwztoWHONBbuZP+ao38hSy8sE2CW4y5TUVNNSBg0XVx6fEHpqMIiE;
	25:tl7c5T9VwQoGbTdtPXKfp0rtAoauoXXI56lmbKvgm0cEeujBMTmfkI2ewjUkI/yPA/dSxyJ2QeTLft/zdDCBEGjhkHvQH/0ki5Ilb5aHmnLKpjj67PbyH9DVN3zwHO9RJWjZ9WbzB0Xzqs8Hs/4mcOe8G2WalOHhkHzBFpDj5TkgfuTiILASRQBYi1vzZgjqRlTi4vlRr9JRmiremebmnQSd2i8mxppudynmxp/n5RNq20dlo6FmaDEi5VR7zotzgZdxntpI2LwShXfAaLF8+mXJcNfiuflXvi6GWXHcSg7lL4bosE7SyYvd56SrG+VV1hLTB2xdFnfSOcUV8DD3Zg==;
	31:dSL2+WRSJZn/cAUu4WovSav7uQe4i+8E4t0Hhg26Mz0aQfHFXuGrwSp0cNrgEnSavuk0gY4UHJFSyYQGnnhi3tP9unzljpLbb3JbpHmCjnRY7KU5q+4NImPn4rbQvSceliegZ3XqJmD+3jH9DCqVxApK/EhQwyyFcf/p6HNx8vYXUbhxQjPv0RQLzVdGF5lfRrvA+a2YIGxvS6V8R9SSTXGr5YyRk2Q0noPsZ1AU088=
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2822:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0402MB2822;
	20:4jSKmNPeHSa349blSKTj4Uc4ylP/F4ELunPtlr799ZZFpJHN7KsatZ7Bt9lBfdfF0En7IgA5wB9qZPhfsduaT+bOkxoUfxpxtEqeRQWg8eBtHXaQFkFn8P6jNAFcDoXvzSfkqHoSjPekJUxoBaIXVoRABaOlJO/nXNIZ10M/lXsKGi/j08LQxA023Fhip8B6O/8p8LOlwGS9EuGoHrYTJ9ccKWjUiBu2VWDvGBf2xPGiI0TUUaKgsbqGyukJN/8lhU5gHM7iv/fLCY1kmuL3Z6Jt+ERbAP2zYloiT2c1eT7C6ZBvrdIRQLgP3ry3TmH1cEwYUy5HVGI8ixn5SKWtfqgqUBJyEfjEA7Y1FU2nbBrmUbFq/ikjZAb7JhGF6d196HeikPld0Ualf/G0w5+aah1nPdfdLgfdRxv9T+PzgZDji1ONaVMDpnNJ5HFdOBy/8q5PZmJebn6VsX1Q1LFX3k6aM4a9lfMZfcR6zUfxfDAtdhWLacKpIbK5g4rjV0H/;
	4:lWNz3TP2aey1TVSWmbO17NaKT7rDpvqsz7KZrI/VRAbdy14TZjy3KUzDeQqqoeOOtInLdC/ftHjw6owTkMkCIswUHPuO+xTu2DROmaS1oLv5DVeNTwvcMBepX82hNoBInGfcruPeLzr5CX6zjN2Pegt9mX7noyLgTCP703Pnu4K+KLbSEevBC6gpLAtUoKc97+wPIVndOnYXz2weOhYLmEwblh2OpA0KegzKe+TldICJfEVNvZIX7kojXUIgJbuhdlMiv6KoEhgY5ArjWfYoe8RKmdTw7taAkgJy0N7C4em9ysf2O9yiX+g/hx3XeRvY
X-Microsoft-Antispam-PRVS: <DB6PR0402MB28225F98D9CBD57CFF47A43BE2BF0@DB6PR0402MB2822.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231221)(944501327)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:DB6PR0402MB2822; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0402MB2822; 
X-Forefront-PRVS: 0637FCE711
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(366004)(376002)(396003)(39380400002)(199004)(189003)(36756003)(25786009)(6512007)(386003)(6116002)(478600001)(476003)(105586002)(956004)(2616005)(7736002)(86362001)(53936002)(68736007)(6666003)(6916009)(305945005)(2906002)(51416003)(97736004)(48376002)(50226002)(81166006)(81156014)(5660300001)(316002)(52116002)(50466002)(66066001)(3846002)(8936002)(486006)(106356001)(6486002)(2361001)(4326008)(47776003)(16586007)(8676002)(6506007)(26005)(16526019)(186003)(2351001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0402MB2822;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0402MB2822;
	23:4T67J4DUVMplpr46L5BLaYtRA/mUaKaEPZ1oybx?=
	=?us-ascii?Q?AqV8LHW+mtHhzADL/Oj08CnSIAPcSpslCM7cOIqZ2cf0i7NF+g70LXAv073i?=
	=?us-ascii?Q?HYDjvZ5okz/NSNlsI9x0Gj5Pr3w1aYhu9ZyqEpYAqjIEVEbi+pA/C3+090Zn?=
	=?us-ascii?Q?bLxATUc3po1E2gFsGsz6W3D9lKfCUWtNokRsYMfaznLlnmHDiFV4eHvMJbZL?=
	=?us-ascii?Q?o6q6rj7p8uOExUNm+721HkZ/hzj9bhTW/b29QP0zcZSNKHzA/23iJC1hkDyt?=
	=?us-ascii?Q?n0e2kiJHSXaP7vyfpmR4kTmHubeb5qCmOftqME2vrbL/Hz4Bei+7A2kactrF?=
	=?us-ascii?Q?hYKh/2iMHUnexTD2RmXq4e7Oz9BQf2x7AUJhldUfrLyCKqu0UoGWYAL3Oimg?=
	=?us-ascii?Q?Q0GwCICYS6HeUfv7ZsWfJLt2BBBKQR3UcjC9AWvdqmGb1CNb/c9jdteVzsjB?=
	=?us-ascii?Q?ymCO/ZmAO2ZXWxl+/t3rihL9uA6ox4w+W/V8TvqOxB47EiXRNm+M7DuWrzNf?=
	=?us-ascii?Q?z/u4VgdQCn6xl4z1CiGzzCsuwbosmz834eXWdMtB4LyTWbSce/YKZKle/o3z?=
	=?us-ascii?Q?Igpydlq3f+WgIvdYGFYX/w/5x/u6MjrZqFOnXT+9mA3v/7KP/OFNjChvjA/Z?=
	=?us-ascii?Q?z4iir5L09UWfevrvTtRlhNzRfdN6ueSA0veI8cfW74cI9SdKwyT1yvkVwYrp?=
	=?us-ascii?Q?0neiMTT7dygM75wxxkhRMnCOIinaE+9UWhNrz8UP2CtKvsUAEXTqb/3dHeGG?=
	=?us-ascii?Q?VV3cSNf8R6r3B2kzzNmst6roc+KuCjnUqrtIfw+ynrF9fYWiarl9Vc03iloI?=
	=?us-ascii?Q?YKSydmottvmOGm9Rtgn6JhPNHlXPj+jALkWJEXwmyip8vUubCzKbyjp+2ke2?=
	=?us-ascii?Q?kXAX5y+RgruwDb7JfP6T+FliroEn5vwtAnByanQV1iKCj+ioDHTKBIOHPa7e?=
	=?us-ascii?Q?6Alzq9JFqlt2wEB9scu1JCT4qSvceM60UpDM6tRmm7zEc3L9QXXUGmULxGoA?=
	=?us-ascii?Q?zXNKnxdW1yFWGGYnlGvDY9EaE137LQKbIfX4hN6gyrwVrGUukCZ2Rr3mnyLE?=
	=?us-ascii?Q?dE5VC4kIa8EDgpGkTc93q7Gbh7FfO4V7pUp5MYshuMeEb1UhuF66riXYCPUC?=
	=?us-ascii?Q?kKstCVNN3wlkZ7wa05brj+z/z5R9ZXKbMRuMQaxAO8gq4VDuEf3eIZg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: nJxNYac9iBYWE2PtEr6iLv2ZZAQEWHhpvbVnT6W3LK592sP1AhpoDteB/IT7lkthFN+P5ZO/keeG+3cHSYbXLyYTI0M7Vd3/EWHqTGbx6uZwXcG3LHXQVjaRyWAD5qTUV51ECK+s7DibJEfmXc/eiMLgnVn6JdlkdgLfh8Xx4VHfv1UiLPAcSkurhfdOKkV4
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0402MB2822;
	6:jBBlfRU/jCFEaYIThiODwotuzERQCbQPHAkeB7ryIY2meB6HZk1I1lgGu9UhIb78uorj9USDoxZA8MhuRrglPG39rnGnrWSCiOCF9jj57fx7wHJgfDI1rl8o/yCMzxWf9QuVMp/8O00hkL0JOuo42Vjieaety0RKC3dAsYmdKDaOiAQiYpPqURzrzpkB6Oav4ligi44YTp/0FU7OZrI11yfFLJWxydpJnIsFgFotXgo1zFDyOm3pDFuTRGfpKKatKtFDBNl0B/wPR6GasSs8lAtm8ZrbhAF3Py2CXdvZaagY4eU1o6PQPV/Ekv/avfm904ffCf4MGmWe+tVXGfP3U9q/HRJPObVtQEWeD/NZRC6CyV/pi95RSYs2eSnlnwUp7NF3JguQuHGdvjgQCq8+Lyx/ZsfUPOGW0gMrjLEXoVvKSHyLTG+W6d9oKw8oGBMrjj9zUyOyBmzkxS57WfG7LA==;
	5:06Y5uDo4bmiGENebII2+BJbxiGq0dW9Q0pW0iiVXLiTbZRciLoX1F1apb2LGV/PednUKKaPZJAbl1m2OB1UCGwtxLmzotQt8kdtaogfVmygHaIS6PYGoPYRuKk/aphV19BCw5oBSsrUocV4hIRa8I9MJBMByknLstSvPXjvWmTU=;
	24:/o99ZeYAQiuGPnC3HEhy6QGblxrrqfn7dL6zQHpAtmh5AcUafDnMhhHrua6/j/kRQGl3znvScbYTdTQWfDv/r9FSJcgwoYk0Q56+0AXSdz0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0402MB2822;
	7:2Q+/2VQq50dKT8ne1MysgpJyfslB6/JrCNq68dIKdeAM1BzW1fYS63MP0/wHVxr1pMVGb/J/nFVNL8dF9klAXBd/HnoroHLEkj7Uz2Qy8uAfiMTPuaUVsQCFvgIxhe3P9hrkIFw+xgw79e2AbbFGUvxGMoSifl93pGO5tCGuAvXP2LQzgPwB3dgYNoSpEfj86sKI3lEZPfdbPVPecRC9fw3VjiL8yrBb4u5yqJywiBh8y59oigspE5k2xxVoamDL
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2018 16:20:57.4909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24764f4d-7769-49f6-d71f-08d59e35e089
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2822
Subject: [PATCH v2] python3: Add recommended modules to nativesdk install
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
X-List-Received-Date: Mon, 09 Apr 2018 17:55:09 -0000
Content-Type: text/plain

The python3 installation in the SDK did not include the minimum set
of modules to be functional, particularly in the case where Python
is brought in through dependencies. Rather than requiring the user
to explicitly add the modules, it's better to pull in the modules
through RRECOMMENDS. Note that the Python 2 recipe already does
this.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-devtools/python/python3_3.5.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index d458d32..f893b84 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -211,6 +211,7 @@ py_package_preprocess () {
 
 # manual dependency additions
 RPROVIDES_${PN}-modules = "${PN}"
+RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
 RRECOMMENDS_${PN}-crypt = "openssl"
 RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
-- 
2.7.4


