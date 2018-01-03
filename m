Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 927 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Jan 2018 20:11:14 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0077.outbound.protection.outlook.com [104.47.38.77])
	by mail.openembedded.org (Postfix) with ESMTP id 680AF62133
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 20:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JzxUSkCqgEWYLsP2M9SUP9A4mbQq/uHMIhhdF/WJch0=;
	b=UXVDkLVBX/G1u/wwUU0FSKhVbMd5Dk6KkdHWhW2V1jnbDkAZM0GHkXqZ6lfgrYqXF/Uk8Fh0MPocC3hcsJElXeN+CR4aHcuXbSi8MwMk3RKv0hyoNkNHnf8wyzQkpsud9hFY3Nyo+mpmhECoVzy7PfRNOv4wonG+ycJg2MIY07o=
Received: from BN6PR02CA0037.namprd02.prod.outlook.com (2603:10b6:404:5f::23)
	by DM2PR02MB1337.namprd02.prod.outlook.com (2a01:111:e400:50c8::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.366.8;
	Wed, 3 Jan 2018 19:55:47 +0000
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by BN6PR02CA0037.outlook.office365.com
	(2603:10b6:404:5f::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.386.5 via
	Frontend Transport; Wed, 3 Jan 2018 19:55:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Wed, 3 Jan 2018 19:55:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46638
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eWp8c-0002ou-5S; Wed, 03 Jan 2018 11:55:46 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eWp8c-0003XG-2r; Wed, 03 Jan 2018 11:55:46 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w03Jtctr014850; Wed, 3 Jan 2018 11:55:38 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eWp8U-0003W9-6Q; Wed, 03 Jan 2018 11:55:38 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jan 2018 11:51:18 -0800
Message-ID: <20180103195118.12125-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23570.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(396003)(39860400002)(39380400002)(2980300002)(438002)(199004)(189003)(5660300001)(1076002)(356003)(6666003)(36386004)(39060400002)(106002)(305945005)(50226002)(2351001)(2906002)(6916009)(48376002)(4326008)(50466002)(51416003)(107886003)(7696005)(47776003)(16586007)(36756003)(9786002)(316002)(478600001)(8936002)(54906003)(77096006)(8676002)(81166006)(63266004)(81156014)(106466001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1337; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT035;
	1:4e+h0phy7PjnRWJSp6X4rp4WPr9HN+5O40cZFnzjmy9CDR0zrdBP1178Jan2JoCvezRtvhfZqxujHYWIHIaUtBA+D0l5qWVbqO+AJG9dLpG8mgE8xH+S4W7d0RulJXhl
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0604bbe4-daea-439a-4fe0-08d552e3fb4d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM2PR02MB1337; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	3:6px9K63hLP95vPWBkg6ZCTx6eWlG2ecDRNkAsHA6guSwgxpWtKax8Zjagx40x7QPRODXMs9KMdyL8+4+shKDsaLVfA33TKMlamBAr9tWVFkVs8O53VbR/Y0LONLdwcJ7R2gpDQDz/areOSehfoC4X2whwGM8AjKP/CntyLkns/ogQhZL4l/54PBhS8mSctJyAs4fNm66d29Y900BK/oZz9FouAtjXeWIXaTiGwYyStT0Q0+WtLARVwDAhjaEZ/m7fHBQQ3yk+o9bBT+rCtJMXCT4dhMnusXDhhBk9sqsuB9B5Lt5zSkmHjXMGRWPzTeoJB6ieJmzAbHQMD6/kmIIKusGRouZ0Jb6tLq+WKF//Tc=;
	25:O2V9lPq9tO47rrN1xl0pndrETf2XbWvKFaIguws9zHXP04LCn8X3jc3xrm3PyCKh/fUnSCaWCxQgF4XidX5JmVADEdzZ71N6m0AgL6wDdT1VjCkM137wx+8wgRwirflX0Sf18RLxPh6Gcd4va9iziBIKkSt5SY23j0oGdH0vlpm4Tm7YvscN9b0H4aCy8r/mMO8Fze4AU6djQDsscE8/G42BbvIH2O5FPNfsZK1ikO0BN2EqxxqIN7QkYJBy8Sd5baeJ7AJJvgFZ+38f0H2j6YlXmVhXwB6I0W6PlEwUrxSVQBG5S4eijIWbblCn6SbuDT+HUEAougVhVGVexgm11w==
X-MS-TrafficTypeDiagnostic: DM2PR02MB1337:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	31:rOahp+Qsf//vTWIYT1LE/96J80c+eUYg0K/Pr15E3h0YLk9l+k95djVVY8fpKKBYAWjbTta+DK6HMMf93CT+lwqMqSW9WIqjWrL+TMOiJ674zVuf+TNdgowSg6Cb8HMDAm9fpRTzchGIgFJUyr5ePUSv+Uy37mcomifiTu2tG/SuBcJBsh9Z9O/mwKEPriPGJTClJcYMyOrhnK5aE627HpshF+WB5VTlyDJNDwfsBrk=;
	20:fdv7LG/kl7DQ+QsRdxsxtBzad+NAnjkcUycQH6eVm7CFoZljUYfvIkoZzsCW900DM7t9m047kgWELa2poj0HRYCMkjeShXegDyFbTBezktjK8ZIaWys/rk2ICRkEnwnvYTQSqKcaM/lwvW4drf/3u3bSeEtFWS2tEifLBfDbxN5RBjc6s7kRl/rEelQV2XI+9Sd9i8//5KmlPdAcbT6j1U4eEOxmeNdyyZCtYpOuWEMopDIBSOmmJEQPlbi6o26vWkp8AVbM+/ut6qKvKqNOPdmazcgNithYZKRpddh2NyU0bwIuaI8iFXW2V+xtC8pAUJ4oWiLRU9LrdGc7OqH6ihFRFCL6Mfyf6niAZirTio+K6qwi9T46qXJp+jM48pMn4QYCZi+4eePGnWuC/ticS6/jli6RSZs9M4km5cG4aMvnHl+vqCFPy/BqRFtx2SPp0DFsKkYX13m0ROz99nfL1nEgB5JYPz9bWzR2ARskY+fZUZC+rRTu+SpFJSYGiaGU
X-Microsoft-Antispam-PRVS: <DM2PR02MB13375877D8D2388B88A3EFE4DC1E0@DM2PR02MB1337.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(3231023)(944501075)(3002001)(6055026)(6041268)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR02MB1337; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR02MB1337; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	4:cdu/VbABreasvg5oGFg2u3DOumqoba7WF6PaBBMNTH68DZAIBBrE+aZAPLtLtvDBJOTh+/beie/IozUIVP/WxD9Hrm6+M/Ec2eRluYdanZbsystsD2MsvCv/5udYS7ubu7awlJTRrniFNpTv5S9v3FBpbYDFazikXjhrptChSkGXtpzM15z35flDTW8lu2V037AjHVBp9bfCQgO1lP9TTFayT3LPlnl1Apcu5KikkGbgMMojoRNzR2tIUic30cWS0PJ/iOaqiYfVJxA+HJ2Z/Ze0BZESsh8xwbjcuPJ8AsGCC9JhA9Am5s+Gg+ilqscc
X-Forefront-PRVS: 0541031FF6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1337;
	23:TBC2/+MW1aAROkBuSDRgLuN5Lps7S73URTr3Pe3K4?=
	=?us-ascii?Q?Rvs1tDv7Adhw8i69oYmQ+dxX05WLB4XiFTa3V/A3cUlRVJA5zpXJlUf4YLsb?=
	=?us-ascii?Q?RPkGv8XNm/v93vD2l1LztEI3YqVdlsFF0ZgvBozXk5Ta9ZNp7famd0OTFSg7?=
	=?us-ascii?Q?SljEyhszlyaT3AFrS8o+R4wGqfTu+LmO8obaq5rYFg0SYsOu3r+D67pgGiAI?=
	=?us-ascii?Q?Yrw2V4+3vB1SR1eNDLe+9bTWD4aDkVLybKMqr0YKSi54Ik7aBkquMWZAyWMq?=
	=?us-ascii?Q?hGPFXoDhAV4hPNw/Snj7JHTnJ41mF2gTD4fZVWxruDfQRPxMUNDRMf6EUWtw?=
	=?us-ascii?Q?InApz4uj72yK5Wq4oLqSGfZrcIYfsoJ4m9WMqHrvaN9DRQMDjX4h742cSZaM?=
	=?us-ascii?Q?A4hlzHhSQQKhQUhJ12QOkBi/zJiievCqh/2+lz8mJE6wlacCOQS79rQe54gC?=
	=?us-ascii?Q?mCvGQc9tWFkQ93/cr7EPcCBfGMmhENXkCNpWnEZzT7bOWXlJ8Edrdu+hMcok?=
	=?us-ascii?Q?OTW58ZrT/gtc0BvEYdJzKn7QXm0KyW8i2kQwcb8NRiT3eHbjl2u2L6KXctX3?=
	=?us-ascii?Q?0OlPpzbklMnNqt+xggGlRqblwMRcedTZlouOaLhPW55P9bk01jz6ekumciUD?=
	=?us-ascii?Q?+vrGd7lyYKidehLhsquElJQA8sq270+HCrUyNOR/oC8L+8p3K5TnkHA6e/kV?=
	=?us-ascii?Q?Fk75N/dDvHR16/lQe2UEyAYmfnsGWAe7FF8VjA+H1inu1tuDc5bKGIULb1K7?=
	=?us-ascii?Q?+KntQgYG3Qe92WSl0qoQuNfG5TJh31iUtSAOAXbRRgfOwSeC5C4tVuGI8hhA?=
	=?us-ascii?Q?4fU2w9F2bq602g3/c5TNMrHNwbAQN//MF4WiUW16yfRw5VBBy4O5GeWNrmXN?=
	=?us-ascii?Q?A9d5XFDIoLSrzwhGU2TxZTEypuo5JNV/oWDUJobz13YKpsHG9JhkgrMa8feh?=
	=?us-ascii?Q?kc88HYdZ9oCGTRGuKyK0sq+yAW6dkZuPtIOAiIDAFzOazKkrf5OPK+6N16/R?=
	=?us-ascii?Q?mc3LFQ3kV8K7Quu1N5Qy7mY/fYFIfPdeyQZZmOyPPBopw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	6:Gxbf6MILJNW1vWaK+OJomMxiGUzqpsyxnHXJ1VkoDOaegoYmO+6JI4XJ+BmwOOs9ii5/F52s6GRjN6VccbZUv5y5G8iHdCY2VixuWr+sEqe37RQSfh2Y/QpijSh+zeV9bFieBRPMbKXCjtc1Ue120pRbTpieGyUQOIt04m0+LoUGy87NF+JWGNF8lW4tdaLu7d24Drd50mg1ir3t+xaFsERwrzbJPl1IpkMA2EiCAkFqyVW7t8QE0FfzgiqTvknmKRkZumjiC4QeNuwrYqLjxhJaDHLc37jiioEDbgQIItT2oqGXyv6rsk2DhtzqQB3T7GqejQgRvXEiexAGZVDepDWCpSz554CjFqlgYjx7FBE=;
	5:5mWulUf1I1LsTdPDznk09ZQBy3BQe0W3LM8Eh69PrTPzCKG+9T5oeHQZ8r3VOpxoUEjhkvt7p93fOFFnP8d5uLbnBoR8XAFT+Xk2A5tTWgrpiSKiDVKZH5ITQvU8IyYyscM9WJ3Ej35z12UETu0De+xq/mNfRFYT9Wfbp8kPlIg=;
	24:DDKX9n1lwhtxNVhL3xkcLlXG3Fk9qaQjfnOP4PkrXv7meUOvkXEuGxlqQaoYHSsuEl33DmKHzNbItbuRe7br//9Ibv2OEEk7Q91sAzZquXE=;
	7:S8YDe4Xm3pDhfMEwX5UQjPMfEa3Sgu813qxc1JpsNPrMXUM9tJ3s2dpv8T3OZfaBH0D5f9sZoBG2d/JHEeN/nWRPUNjszCkkmHmntbnT/3aqeeXPvv7uKRMKs0oGIvvUt2t6y+aPV0oxfv31jiCAUFcsd1JXhWU9hEqjZ7DkWtK4QdulWj+A5flFGoiN7yZMfDz52e8QkGepq4yVl1e2PK/pc6LtBxlQd4wzkuEgXd6EOTGdBpOv/9F9a3ZXJ/vs
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2018 19:55:46.7963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0604bbe4-daea-439a-4fe0-08d552e3fb4d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1337
Subject: [PATCH v2] glib-2.0: Remove python3 modules when building for mingw
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
X-List-Received-Date: Wed, 03 Jan 2018 20:11:14 -0000
Content-Type: text/plain

Commit "glib-2.0: Add python3 modules required by gdbus-codegen"
(26af3b4b33a34d7e53059b07236f9d5aae5e004a) broke the MinGW build of
QEMU. To fix the build remove the python3 RDEPENDS for gdbus-codegen
when targeting mingw.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
v2:
 - Don't duplicate code as reported by Richard

 meta/recipes-core/glib-2.0/glib.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index fbc655a012..cfeb48a536 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -115,11 +115,10 @@ do_install_append_class-target () {
 	fi
 }
 
-RDEPENDS_${PN}-codegen += "\
-            python3 \
-            python3-distutils \
-            python3-xml \
-           "
+CODEGEN_PYTHON_RDEPENDS = "python3 python3-distutils python3-xml"
+CODEGEN_PYTHON_RDEPENDS_mingw32 = ""
+
+RDEPENDS_${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
 RDEPENDS_${PN}-ptest += "\
             dbus \
-- 
2.14.1


