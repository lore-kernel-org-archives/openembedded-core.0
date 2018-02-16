Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0089.outbound.protection.outlook.com [104.47.42.89])
	by mail.openembedded.org (Postfix) with ESMTP id B320077E66
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 03:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hNrEl2sjWprQ/NKr5wFz80Lit+bqM2Ac6xkTvC6aSV4=;
	b=UMb2nwQ1wYVAMOhrG3bCmHzqx6N0VikOek+nNLGiMW72Ej8cidI3ELa/4k/U2lwfhWViv0edwKIZ8tb71DRv8XHDamHr6ZmcC1Nk+Khz7vaYCjVutBW7lcBqXDmxp62KD2yzp+3D+RBZuWc2+4jLl0a5Sii5eZsdo6l+krd0SVc=
Received: from SN4PR0201CA0014.namprd02.prod.outlook.com
	(2603:10b6:803:2b::24) by CY4PR02MB3383.namprd02.prod.outlook.com
	(2603:10b6:910:7f::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.485.10;
	Fri, 16 Feb 2018 03:26:52 +0000
Received: from CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by SN4PR0201CA0014.outlook.office365.com
	(2603:10b6:803:2b::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.506.18 via
	Frontend Transport; Fri, 16 Feb 2018 03:26:52 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT058.mail.protection.outlook.com (10.152.74.149) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.464.11
	via Frontend Transport; Fri, 16 Feb 2018 03:26:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:48349
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1emWfj-0005Y2-L8 for openembedded-core@lists.openembedded.org;
	Thu, 15 Feb 2018 19:26:51 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1emWfj-0000XH-IA for openembedded-core@lists.openembedded.org;
	Thu, 15 Feb 2018 19:26:51 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w1G3Qkrk031913; Thu, 15 Feb 2018 19:26:47 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1emWfe-0000X3-ON; Thu, 15 Feb 2018 19:26:46 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <git-dev@xilinx.com>, <cyrilc@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Feb 2018 19:26:30 -0800
Message-ID: <1518751590-27123-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(346002)(39380400002)(376002)(2980300002)(438002)(189003)(199004)(377424004)(305945005)(8746002)(8936002)(6666003)(2201001)(107886003)(1857600001)(106466001)(356003)(4326008)(5660300001)(575784001)(63266004)(36386004)(7696005)(51416003)(6306002)(110136005)(316002)(9786002)(50466002)(48376002)(26005)(50226002)(106002)(186003)(2906002)(72206003)(478600001)(59450400001)(77096007)(81156014)(81166006)(8676002)(36756003)(336011)(5890100001)(47776003)(107986001)(5001870100001)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3383; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT058;
	1:6uPUD5Zj5HRTCM22mCfxOG105KCGlNITbYJrvJp8bQ0drL2dyI1Qj0TBxLwzleZ6zCfDDgRkJZYxVRA3seQH4KY0KFPJUzpeRNaW99KyYMD772VxxLiZTYwwS6I4qwrO
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 287f67cc-f247-494e-64a1-08d574ed1f57
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	3:U/l3ro5h8vcfWjy4qC7P13OPnHT/6mPCPpTBVt4PTR767sAlYialZwgw4vn+5F3Pn/PhU8bDtWtZ0D/gmW/mTjTdDdHNlwA7EjMDDHK2SabuCcGHcpOE431QgxBxZATrb+fCm8C+kGvTXHO0Ykk81xfakF5ilcR3uTV7vGnLMY1iSYhPHANM9kJOt27RxbI8dYY0skeD6oBACkxu56o9nObnF626FMI6bpNv3lhJsxRfICs2mdcxHRC4dDgwX2DnhU8t2FU9SYpDEnpsQmM1rGvbdmw6K4oqUZ6/CbPu2FdyONUVkz7ALaGJPAhqKS8JDmZ9i31jSiZxsz/pOIxCOoKWUcxWfVmaNUmgF97ux6g=;
	25:GtZVT7lJm94uqzFK0mzqNtCK+naTHMUAJPyhEiTIBEPqRaZh0LATbYTmmWuk7fJtHdBhvYzsoxAfQ2sU5vv/5Qvh8aFe2tnNzOLIXIvRoIQYWTg3/Mdede4/sPFOllFYyQaAy9plVIMY+57bfQbsaRa1L4h1IL2QBvVxGwMFk3VJQmG6s7/qk3EiUWYcFq0QILw+XGT7YOT+4sxIeCXutwmCarf47uNmP+oMBFhzgjm0UQ91FT4qvyG8ILldmGYY6PXytKcQQPe5bO92BIHSyRp6BoN2jlMNQUF0L1afXJF2dDPQYnWcuPerefKR/j9voXDvAOAdTbak4WaOR7Gi+g==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3383:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	31:f43rxZyyalqmR0JBLrWc4Y919hWwlWtf8pzxWLtU8XLPfgUKyM5tVAECJTSsucK9sVpl92DOX8XgOlYBsOGm06rm5r00RqDyCYpn6/zlcd9nXKKmTny/+8kW0tN2q+FGNJLVyjFeg1lvWI6Yf5M1zFELnsWt24CPO4Clz8P6D8WXlymH53Or7QZ0bOHuPB0DoK4KLkzeWOnuHE75Qr4O6hDZSjm6pOCYLAJv+f0/7nQ=;
	20:7cf+x/OxhcJJivdr7AbpBAJXAfeuAa3u3lQIP/5kRE8WN7qpzbI4W0mXGvrpIA2mhw+3zSnq8dGh762qT3AMy7WduAZSUY/a7ZaqvfbR4baVP4NJ+3YbK22w5UQRrWyLS9NmgpcjKEgT3y2neqvLqJyQOG7klXKS7m4H5SIai8B0V+6yVivn/FkzgkmwIpdC+2eAcXiNFOxQS4lwuoPSrIy6vZmf59ogTSzW7iQfj9UW3kA7leuggpkogS999+NIXcsZoe2KBByma7fR9UoKBpsTfycLnPPj6Ds8gMDIIxmze5ry2xMWSKd4S4w71wwF3xe7+MxjHmkL0mJIEOlriJDVOcrjYe9CO5LsTyZRUOnkZjDPbN/I6AyfSQ0sc08AfgMOEIe45nHXYxAOmvKBvZncQfXI/pYCd8v8fJfEjHsL5IErNiPGilyCa4OKwbFt12DfJy9S9xONrn4N/g88O2GNdJjn8mCBQMnOT1ElvFLlDrVTd1/KgaBNovfiiplW
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB3383334597652AAF927468A6B9CB0@CY4PR02MB3383.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231101)(944501161)(10201501046)(93006095)(93004095)(3002001)(6055026)(6041288)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(6072148)(201708071742011);
	SRVR:CY4PR02MB3383; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	4:ynjHqKXAPlTEoOPw6mlmq3KL0jH5QnPxTkH2Yeq4igeA19f6Epsha59+Xdv1uBPHzGozQJq8C9U2uJlYhFXK1IzIhyjDskTF9L3o8NIPv8d5hn4Px5kXxW4Cp2Bk4EblGdMMBRwvSoA6KqMz+/4VfnnexyAZ2Z82Jb24oeg3dZfn6HrVbr9S7LeJlsJIODQ9meVSnRmUMCinh5V4vuu9vnVJbCO9V+u+BICGEC0VZTTy/3mnhrO+B/DPTWST39CBJvpxmxC6yG/ijntixiWAPGyv4fGYdFWJ1TRSiuwYFiejpzGMEX3TJkattpX9kKmY
X-Forefront-PRVS: 0585417D7B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3383;
	23:0izJ8x+8H2uYOdl0e/HgB6T0iDZnCp0LJhfiKMCXL?=
	=?us-ascii?Q?GQPzrKiOoeCOG87cloiDmoT359eHPYe5Hb0Kq0rltC9WNMmfjV98yau+tzb5?=
	=?us-ascii?Q?+a91Be7yxkCqtovzLki+YxuI3d3ooAq30E2CDPAzbbeqa3xjcZqZg07pgda6?=
	=?us-ascii?Q?VpIft6zuMKMAaZh3rV8LOUryf7JcJuy5EfR6ZStiPqtGimqkadBf+1irnSlv?=
	=?us-ascii?Q?CULOmLu9D/ez+wvL9agfX2PdWdf8BOMvfcnmJGaxc7N6UnsxUfSZ2m4iwH80?=
	=?us-ascii?Q?/tSB0nAWoTfIZ+qut5pbvrpCcvlKl0u0Ql2lQgyCD558duCq4bqKoUz5cqEe?=
	=?us-ascii?Q?Hx8vcLWsqWag9BzytrjEwopUM84ehSfbyrwVWTGUFn7VkkdBOQCyVgvp9863?=
	=?us-ascii?Q?h8GFaEwZUg6OmNiWSRI+cvItbb5ijCFHudawXRrDGBK0Xh5P0eOgIkHGgug8?=
	=?us-ascii?Q?rwM1FvgDLE/q5tq8888WRVoh6jCEBCq26wKmdug2liVkRNBeRpjp8zAFvGQ+?=
	=?us-ascii?Q?1TcQSl9v4MfqGYR0E2yYhOohzdCX3SxYFS0umHYW0FKuhLqKtLAWTNCbuhGv?=
	=?us-ascii?Q?YwiTVXThMkytmE5++mptLyuGBhxyvThWW2HibMAE+iz1oW5XzWtTsvAF+9Te?=
	=?us-ascii?Q?wfM3gBm8Vp6eaqr/6J7746koJMxMLBhf7ER/GPNSHtrmF8L3eLya4isVvIvM?=
	=?us-ascii?Q?CV26acPtX7FVFDshLUf7ygAFRofPv3Yh2NR+4vDKgTmyNrz4GfTgLq2RKB6e?=
	=?us-ascii?Q?ZufljBHLjZauBkZlF8XejzhaC/LkrrCGJ7XfIo+N6f2XO21k5jmue9kK1f5k?=
	=?us-ascii?Q?OPOKTNQxN2l/R3aNdprfE2P9Zgc0vx9PQhgA7MkBlPA+eqznp0i7L+osEX7n?=
	=?us-ascii?Q?zVp6uau46Wz5uzaPrYCTkL7Nw546Urm8sR5684U5vq7HDhRfm8YcgtxLj3HP?=
	=?us-ascii?Q?N7CQMuqhWUY/comTmtJmzfTcYWGnK7WZUIRGYa3sisPnyRg1lPMd9cawarLO?=
	=?us-ascii?Q?i50+AA5zfVpDzDe0y++9yLLhSjHwPM33KOys7MOLB4xKmhTg92H9rLr+aStw?=
	=?us-ascii?Q?/jquKLIjcJUZdADjjToW2MzCQRvtayAF3fAS0UfXIbBtBhAsa30lHBVr9jwA?=
	=?us-ascii?Q?X7Xopx2AXFDH0ZNF/WDxMoTa+vhhX8MOSp1pZQ01e66B5efFPf3GMQgodiCv?=
	=?us-ascii?Q?lmYMkBr+hfghfOyhfQxmsTAgrP2k/y66W0Z?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	6:tLlNNdXsYdGha9cZSAE5oqYgA2e9TxYEpBfhO+/Xkuz0tT3X7/ZTdfs0O/++jiClALUZBQqd+0Mgky/l0HOAvznElxQCAzxZJpM9O6QPkZJacHq41jANHHqt5NUoM8uVSS3bccUR4p9DkghoD8uHW5J4FTjyH6SJhVnecl1Gi8rlj2y9TGtq5j6JI2JuRxU/Dc5CJBK8ZNcsud1CFTF0JYi7UESnO7l63V4htJOfpB1TYAeaiR48zA3YxBcg33AO5H5VtzDLusducRgJbGrlW1YTc1XANGZFIZJ6ZK+aLopq+KMrwgyRFs3DI+yXs3PpKna97dg/pa7jR1rDzIhlbEzK2SzaCpxd03U3lv3q6As=;
	5:4J9O10MRjDmDSQcucF5W3vJnu/nO9fn8sCFhB4TlN6GcQc1tDe+mY9J2UTZiL+cAWR3TwyTHUwqzV4wxJqTrH2CieFPB298+Hrjp79HVIW4ZCfRPLio+/bl8RsfFjouYmIdFUY6FCUDRtxqJizFk+wwrgVc29gDlNhmk+enLh9w=;
	24:3s09xDOoMpvrxgX/LjE65N+hce6eawY6g6kFpRd4hR5vD5yHZjHh3+CT1LbuEdshLdsm/NULpxLaN1QDHRYupuEC41/a1WDiwIh7lbaWSUc=;
	7:co+WTh0Y/lX2MMqPFdgfFEXhijy5uOpU5a3QNYnfyNwYxwGF2U93k0f/EqLnDeAkoj82OqapESBac9JP7qefHbANRBlqOCaWZIHUADI4oQHjf6NgLmIh1HGlYJlOYYM+cTYAcaFI1QrAf7EYTvxsF7bcpkfWracd/PWJt2QMIofeJh49DuGiiVZz2gm6w1jyWdM6/FxfmVZtMnwD6DBLVqcJ1lDmmdChbj3y64tpH/ZbM6VM41YY9cekOjQPVHIz
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2018 03:26:52.2810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 287f67cc-f247-494e-64a1-08d574ed1f57
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3383
Subject: [PATCH] webkitgtk_2.18.6.bb: Fix configure failure for aarch64 build
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
X-List-Received-Date: Fri, 16 Feb 2018 03:26:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Fix configure failure for aarch64

| -- Performing Test CXX_COMPILER_SUPPORTS_-fcolor-diagnostics - Failed
| -- Performing Test CXX_COMPILER_SUPPORTS_-fdiagnostics-color=3Dalways
| -- Performing Test CXX_COMPILER_SUPPORTS_-fdiagnostics-color=3Dalways -Su=
ccess
| CMake Error at Source/cmake/OptionsCommon.cmake:42 (WEBKIT_PREPEND_GLOBAL=
_COMPILER_FLAG):
|   Unknown CMake command "WEBKIT_PREPEND_GLOBAL_COMPILER_FLAG".
| Call Stack (most recent call first):
|   Source/cmake/WebKitCommon.cmake:58 (include)
|   CMakeLists.txt:166 (include)

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 .../webkitgtk/fix-configure-failure-aarch64.patch  | 29 ++++++++++++++++++=
++++
 meta/recipes-sato/webkit/webkitgtk_2.18.6.bb       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-configure-failur=
e-aarch64.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-configure-failure-aarch=
64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-configure-failure-aarch64=
.patch
new file mode 100644
index 0000000..ea093fa
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-configure-failure-aarch64.patc=
h
@@ -0,0 +1,29 @@
+Fix configure failure for aarch64
+
+| -- Performing Test CXX_COMPILER_SUPPORTS_-fcolor-diagnostics - Failed
+| -- Performing Test CXX_COMPILER_SUPPORTS_-fdiagnostics-color=3Dalways
+| -- Performing Test CXX_COMPILER_SUPPORTS_-fdiagnostics-color=3Dalways - =
Success
+| CMake Error at Source/cmake/OptionsCommon.cmake:42 (WEBKIT_PREPEND_GLOBA=
L_COMPILER_FLAG):
+|   Unknown CMake command "WEBKIT_PREPEND_GLOBAL_COMPILER_FLAG".
+| Call Stack (most recent call first):
+|   Source/cmake/WebKitCommon.cmake:58 (include)
+|   CMakeLists.txt:166 (include)
+|
+
+Upstream-Status: Pending
+
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+
+Index: webkitgtk-2.14.6/Source/cmake/OptionsCommon.cmake
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- webkitgtk-2.14.6.orig/Source/cmake/OptionsCommon.cmake     2018-02-15 =
18:56:29.315238564 -0800
++++ webkitgtk-2.14.6/Source/cmake/OptionsCommon.cmake  2018-02-15 18:54:57=
.469518064 -0800
+@@ -39,7 +39,7 @@
+     if (NOT WTF_CPU_ARM64)
+         message(FATAL_ERROR "WTF_CPU_ARM64_CORTEXA53 set without WTF_CPU_=
ARM64")
+     endif ()
+-    WEBKIT_PREPEND_GLOBAL_COMPILER_FLAG(-mfix-cortex-a53-835769)
++    WEBKIT_PREPEND_GLOBAL_COMPILER_FLAGS(-mfix-cortex-a53-835769)
+ endif ()
+
+ EXPOSE_VARIABLE_TO_BUILD(WTF_CPU_ARM64_CORTEXA53)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.18.6.bb
index ff0ff8f..9fac044 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "http://www.webkitgtk.org/releases/${BPN}-${P=
V}.tar.xz \
            file://detect-atomics-during-configure.patch \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://0001-Fix-build-with-musl.patch \
+           file://fix-configure-failure-aarch64.patch \
            "

 SRC_URI[md5sum] =3D "c1a548595135ee75ad3bf2e18ac83112"
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

