Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 97776 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Feb 2018 22:10:38 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0041.outbound.protection.outlook.com [104.47.36.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1257860F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 22:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=sZWL0hyhYKQaazb+aVVSy7YfBlyGh/fCpjLkr/K63DE=;
	b=RiBt78FxApJeNyLc6jlPvD5t0aR65T95cPItV0mEm9n7cWuMv6/0SAA/W7nqxA7jWvcyszfH2q/Eq+FP+uXgN27goILCIT3wwmkBCkAHWb8JGykr1TmIGdjlZN3tTnjj2PTcFFOZD270R3iz7Vf359oB5/peyv5XSchuU5tdzsw=
Received: from MWHPR0201CA0049.namprd02.prod.outlook.com (10.167.160.26) by
	CY4PR02MB3381.namprd02.prod.outlook.com (10.165.89.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Thu, 1 Feb 2018 22:10:39 +0000
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by MWHPR0201CA0049.outlook.office365.com
	(2603:10b6:301:73::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.464.11 via
	Frontend Transport; Thu, 1 Feb 2018 22:10:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Thu, 1 Feb 2018 22:10:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40533
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1ehN41-0005jp-3u; Thu, 01 Feb 2018 14:10:37 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1ehN40-0001b3-Vd; Thu, 01 Feb 2018 14:10:37 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w11MAUC8000627; Thu, 1 Feb 2018 14:10:30 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1ehN3u-0001a1-FW; Thu, 01 Feb 2018 14:10:30 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Feb 2018 14:10:29 -0800
Message-ID: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(346002)(39860400002)(396003)(376002)(2980300002)(438002)(3190300001)(189003)(199004)(28163001)(8676002)(36756003)(8746002)(77096007)(2351001)(50466002)(6306002)(51416003)(54906003)(48376002)(47776003)(106466001)(59450400001)(316002)(107886003)(26005)(336011)(478600001)(575784001)(5660300001)(305945005)(356003)(9786002)(106002)(36386004)(7696005)(5890100001)(2906002)(186003)(81156014)(8936002)(4326008)(81166006)(50226002)(6916009)(63266004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3381; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT046;
	1:v6+SD7mCBbtv10A924JFXtQwWjl85nf9FrI+giEVskl71yYMdRl6Jg1XqLaJqymEHWs+BY1s0hqLEbUS2LXH12GN/gaL9C8DR5aLF0uE9EmqM9TI4StTKr7asXlgQLOj
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f12f76f-5e1b-4436-8381-08d569c09fd7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	3:+jDHdzk+6ytQf/oz7gcXg1oZoTpG7JlM91BGJhCyYoYElhp7PlG97a8l81GMGpA2CO7r1E+Q1X66402hcBeU11S5UtBtGaANSv9+MRmOlYgvnLB//Y/ZWT1VIIjPyZQIiiJcdOA4hfQKh2Vwegqx5hQjSC/XH2ANVTmfzLPl27Y0MQt8kMdEZX2Z3YNLd8pA9MEXAttulstr7o/Uko0n6AceV7odCM6O1vZsHSRMrOnYSBDE6ixGYcHJtP0yMaA1YvpbpGzYgb6tFAtRXw1t5Vv3Z/hkeQI5KFm6tbtImJ7yr6RXTL83grqR4hA6UQ+nXjn3bs6JLqF1op1f5TCD7fX0ftyjF/MFrgebSIaqAZU=;
	25:a3FiFfC1xU/JNvMsk4DTr3lL1aw+kU+hx1m8lGv8PYRFNy8Z/YUOMTKiGVPXTpo2BBQE1os9kh4cgfQmJULLN6DW7JJJNQ/W9mc0RN1H1Jm64pC/N0UU8uP88o/XIwCRuz8J4E5KJxT7FBqGMJTxitER7yBbZtlVEqO0pEY1W27KBRAlsXA7BjFGKkJGRiBV9WGqXxJwlJohojptNmfAD6YhmpSmlqMW6fSZNKvPGMwf0Ym6Kqkc2rxanSC+pXctjunM0Eu5bnWPoyUa0lTROBgCylxBoCZmJOPZR3dq+q8M3FSR25Qex/jAgsyYzXtn1vp+UKuJm+x06ZMmYD5kZA==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3381:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	31:k/FXvGFMQly+bBjN3Bene333G54VSYuD1E/c7y3Y7sBbEVkIutX6whcl/Fu+Xbj7KzO3HIo26TVxunQ+U029N2pBEXDJ0gkY0rNNz3SE/WRdM5Q8y+sIEAq4p4rgAFPiqIxmbFu7AXDf5QeRo00KNVgxP2ixSaM/OiG0JDRWmUKatzdzrjgb0lKKG46ktvR+A97X1R++1vfTGs0WCcajJ6Rs3BvJQd5nozOMAARNeNc=;
	20:KsB1eWpEx9CfLi9KE4l4h8MeHg7AbewYop4wgSYmwVtLHnTfDqpVwUwOVNLM7op5/iB7OkOxjb/whXSHNIw65nrDiFbbSkufVVJBwqRnu/Gg3iXAzqIlp6llt/y142jcfG8QbeS1co2V3+Ec8I44W70/Nm66eFE/zwYdkcLDcUyeikpOfa+jSax8GeN5VwT+E1ACFS4JFWOcH5WbzqvAJ+hU22wIS590wQiLAVi4ls6XBmd0pgrqT97xSTqS3Vijvu81XVezkbM0bfZSaSXPvpSdjCnf4mLp3JgBLqOjd1WVHJu4xT9NsNYS7YkvvBHv02un5PcHGnWVe/1bRvkcWbLME6w4wegb8lxwPt5BRK0vx0CGoV5Bi76KIUvLiCotyF3ka99GaSA9P7BVh1SFsYQqjXBpAndu4kdjzRVlqt6NWF+scZsbD5a8Z3xid6uD9qg5YNDz1Q/gdVdY7DXHPTywfq2F/EZKbmB06QoG7EfbUCCg/zRkxH5fh7DxKn+E
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB33813821B6C8C3DA184C9FBBACFA0@CY4PR02MB3381.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3231101)(2400082)(944501161)(3002001)(93006095)(93004095)(10201501046)(6055026)(6041288)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011);
	SRVR:CY4PR02MB3381; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	4:gFslUkG2vxcpgSwrTHmR3PcObnwYcM4mRz/lVABsBQPeUFu/s6Kq8iJSN4/F5zPoO+LqHJU8DOwBTGuIP6/lITmlY0ARzX3M+HUe4F/TGTl24VZHbLmGBs2mt75jL2vU7benwXgdGtQQvtiEZjKITQKOHVL3qRVAkc6DnT8V1ihdtqhCP7yKz5dUS0LtbPCsoF+ZaOMI9t4wt+l3He4AIX7QmK8VzjKlyt4H5wVE4VwTsp4clJVFJCqoawU2o39lwS7XfNCA+RhZroT9PTIIJxD94xZotXnCB89vJrmlyXwBYccqqKL9WGuELwz2Ne5FjKS8EOwlCPJNhzxi02TB7gZrwxWLWnTrVaJgoVKJBk0=
X-Forefront-PRVS: 0570F1F193
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3381;
	23:abqfj2bsEUq0d2KGI9WOKmWzsalyd5lSoJ7zFJnJh?=
	=?us-ascii?Q?9kXlfzVzb0BRAajUatUmrGJ5bP3NEqte4h+HIbzB7dZj+MrV7YVhvFPLIi54?=
	=?us-ascii?Q?ro1p8UYpEJVfJVdQCt8posaxYMDJEopAHOf0M0IcY5cT2jKI0T5JUG/bZ0Oy?=
	=?us-ascii?Q?v9FlR63ugYeveo9H2fLcZ6hhHGnaydSjci1M/w5AWfgCpQQykm6jkagvPAsQ?=
	=?us-ascii?Q?uZXv3RW1TfJm9GOz0aLHe9fRnuXEy1ieSWUQyELXO2N9FaZ9UiNffXwHj9cv?=
	=?us-ascii?Q?B2Bfc+9YGDHHCczKY+0/PClgS3YAlgL3qZUKo9A+4AFwhMogn6tPFSnb0XHD?=
	=?us-ascii?Q?hjbgh1+uF9PBofjnKQpF4u4YQxtWHCC9uXJEIaO7sg8jGLF+oDl05T3zP8xm?=
	=?us-ascii?Q?WkQtxzyS6xJmeMHIqcO3CIj8o+Yu5OAkYO48r6u/MNEncj92/WUi3SsnBOy9?=
	=?us-ascii?Q?3ThhUSr4S5E0PfPJtUzC+fQVE87X6n36YZ2asbzjRJYCC2wJmzanik3yh5Xk?=
	=?us-ascii?Q?jUvbOXH0hPrUeekVTMIXPZhMZNt2YWcFzR6113jTjB00Uvy5uHjy6RRNO6Uh?=
	=?us-ascii?Q?LnhqgoK9UtHzl2aKcePZ5It36xLPRqtPaGDyuNT1r2HjTspxyaS4LphbROwY?=
	=?us-ascii?Q?R1kUJBjF2jKt26mNeNxt8uukOKn37LUvyUBl8iWM9epgnKdFfZy101gFEWJX?=
	=?us-ascii?Q?BLjpRoQME8S3cSFgwScR2AXPBMNSFZ+bgoBhV8fkZBu1ce9MsRsN1LTvpg70?=
	=?us-ascii?Q?s2m06x8WK4WHAkv/27zkA53MkiQqb+QSxQ0/LYzlatjFA00zXkWcQGTtmPTE?=
	=?us-ascii?Q?03kDD3ZbZc3qsXs4OdtWia8Zh3E0dPfzuGcKpwkE1YFyBx5dsm4eQ+QlNgpJ?=
	=?us-ascii?Q?mUgrO/sX+zIXFCESZrWjdkFXdhPXvA6Mv9QAli7QZvC2U25hlYIUUNsYutM2?=
	=?us-ascii?Q?DYXXi/xSlDNXJLywCDzMp4Q0J1sujPczM3E2PB9xeHEFO666Vl3ZbJvuys1n?=
	=?us-ascii?Q?sfmVuTDzAjM4lbfyOefiJChuKYHFbPg2Rc/QtKCkJCSBBemTGILX4YDRk7Nv?=
	=?us-ascii?Q?iM4OPfK0PAuYrB/6sRQN3z2/8a7WSlOqghnN12dHdzEb8Gv5ADqqRU28xBUg?=
	=?us-ascii?Q?f6j21OL8/PqaYBa7ZkcbUTS42iIxxDM?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	6:slex+m5Z71MTuYT0nxavlFi7rmt/sWz8ywq8QbHZjZn5xd8w5qjLR1ik23VNsM7OEyV3TZJ4qilv245kCZdcrsC/dH0vnNUQAzrHpaGZCFz3mcSdPGcjuY+GcoSe8W4eYliUbDmPa5vlZUP3eFewpByJqh5aK4SHrpoDuXox0DUfQ5qWKBrPri+RBP8IFdBn1DFKMa+YY2onAQps+ofPDT4azi0V22TGGc+b/+2SIpFd2rijU4a4m+LaO/j9td9TSR9G2EW2AlW6nA+Cs6eQdxbXxo4eXAI/vvwbVpEE1u/xAo1F/GJjjFWQ5xL47/VP2v0xBp6tkFeW2SdaH3aWYqnc54Fq4/y1SUyAHalPhuc=;
	5:Bhs7T5tjM9b59FGZf1/+QdeYUtTnBcxzV8NT5Kvx0PBoVC+t+Ki9U8FHMkZ9+csXSHsI8gS6DsrM/peGrGXUd5pQtBlMAYWEvpa+QaXCBl5bcO+7GWXF9rM9+DPZeoVq0GfHG2xg/wSjvAc5d6dcNNndKf7XNUbgwosmMntIYXI=;
	24:zLvBehwhHYd7epU2sk/ZDy0ZmJ9bJiIdr1NIe+9CIJKHvn3O0ei6RC2Nzt3u19XDim25Av69Wg3Qljc39LGfxMp712mkBZ+J3/m+CYXGMbA=;
	7:cwHPZUts2SlihIjgInu2RvRWJSQdBhwcA9pgDw+fsDBSpzER479M8qqC34iR9Bv/lyJpFEhxKyf5olRu/eGQvCVsldkZYcP4+A/2J63hj9kZNsr2Kmz2FR2SHE6mccIZD0bmnJH+fcb0lQrZvO7Nz3IHyzrw2i+R4Gy0geyqZbOALqDoRRdLukSrzTGIcmGYB4fXkrwAee85UB7KymPHRPPT9DLy+xYl1pTyCTwfEdDV1cfrKnHjeapg37uAnY4z
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2018 22:10:37.7256 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f12f76f-5e1b-4436-8381-08d569c09fd7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3381
Subject: [PATCH v2] ninja: Upgrade from 1.7.2 to major release 1.8.2
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
X-List-Received-Date: Thu, 01 Feb 2018 22:10:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/recipes-devtools/ninja/ninja_1.7.2.bb | 30 --------------------------=
----
 meta/recipes-devtools/ninja/ninja_1.8.2.bb | 30 ++++++++++++++++++++++++++=
++++
 2 files changed, 30 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb
 create mode 100644 meta/recipes-devtools/ninja/ninja_1.8.2.bb

diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb b/meta/recipes-devt=
ools/ninja/ninja_1.7.2.bb
deleted file mode 100644
index 4d3b272..0000000
--- a/meta/recipes-devtools/ninja/ninja_1.7.2.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY =3D "Ninja is a small build system with a focus on speed."
-HOMEPAGE =3D "http://martine.github.com/ninja/"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52=
e"
-
-DEPENDS =3D "re2c-native ninja-native"
-
-SRCREV =3D "717b7b4a31db6027207588c0fb89c3ead384747b"
-
-SRC_URI =3D "git://github.com/martine/ninja.git;branch=3Drelease"
-UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
-
-S =3D "${WORKDIR}/git"
-
-do_configure[noexec] =3D "1"
-
-do_compile_class-native() {
-       ./configure.py --bootstrap
-}
-
-do_compile() {
-       ./configure.py
-       ninja
-}
-
-do_install() {
-       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb b/meta/recipes-devt=
ools/ninja/ninja_1.8.2.bb
new file mode 100644
index 0000000..c6fcfef
--- /dev/null
+++ b/meta/recipes-devtools/ninja/ninja_1.8.2.bb
@@ -0,0 +1,30 @@
+SUMMARY =3D "Ninja is a small build system with a focus on speed."
+HOMEPAGE =3D "http://martine.github.com/ninja/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52=
e"
+
+DEPENDS =3D "re2c-native ninja-native"
+
+SRCREV =3D "253e94c1fa511704baeb61cf69995bbf09ba435e"
+
+SRC_URI =3D "git://github.com/ninja-build/ninja.git;branch=3Drelease"
+UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
+
+S =3D "${WORKDIR}/git"
+
+do_configure[noexec] =3D "1"
+
+do_compile_class-native() {
+       ./configure.py --bootstrap
+}
+
+do_compile() {
+       ./configure.py
+       ninja
+}
+
+do_install() {
+       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

