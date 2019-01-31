Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 18120 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Feb 2019 03:54:58 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780085.outbound.protection.outlook.com [40.107.78.85])
	by mail.openembedded.org (Postfix) with ESMTP id BD1267BFF5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 03:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5D0iKbLZqykkqvZ8exv7ZDJtnePH2I+vrbIQkqDuPz8=;
	b=C9IIFyHHYXwe04nIrPezz1h3YSTcEayhVRci6PR5ZHyMb4Zuj0YPgvkzx1Oc6670RS4VU0hgVdE+kClw8jL4l5TFs/ev7TgqLW8mxvirGJl7UIaHVydeg+TiX9pzHQAfPgMRAI+3SQsiqwu/V+CtXNFyxNNqsxFqmuGkfIFO988=
Received: from SN4PR0201CA0069.namprd02.prod.outlook.com
	(2603:10b6:803:20::31) by BL2PR02MB2145.namprd02.prod.outlook.com
	(2a01:111:e400:c74b::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.21;
	Thu, 31 Jan 2019 22:21:43 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by SN4PR0201CA0069.outlook.office365.com
	(2603:10b6:803:20::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1580.17 via
	Frontend Transport; Thu, 31 Jan 2019 22:21:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Thu, 31 Jan 2019 22:21:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gpKiM-0000ge-9a for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2019 14:21:42 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gpKiH-0000S3-5z for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2019 14:21:37 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x0VMLTCR022080; Thu, 31 Jan 2019 14:21:29 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gpKi9-0000Np-GE; Thu, 31 Jan 2019 14:21:29 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Jan 2019 14:21:26 -0800
Message-ID: <1548973286-30620-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(199004)(189003)(72206003)(36386004)(7696005)(6306002)(9786002)(2906002)(478600001)(51416003)(81156014)(47776003)(2351001)(36756003)(316002)(8676002)(106466001)(16586007)(6916009)(81166006)(305945005)(8936002)(63266004)(4326008)(126002)(356004)(6666004)(336012)(50226002)(106002)(486006)(476003)(2616005)(14444005)(77096007)(186003)(107886003)(26005)(48376002)(426003)(50466002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB2145; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT063;
	1:xturCowHPuJgT2DxoVVHPhqwKYfNIoAwS6CndNCuC6SoPtPVp4bDZjWy/Wic9QBkEgkeC/WbWD8tqBwxLFxwcI28rnk39EcXNJEPCRwv0fcDX5DS2ngg+Q57AlWyYScVV9XAXa+T6GSGmtwD+BkfyGwVxZfyIYV8WGykbJyGcpM=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6622ee81-9347-499d-7b57-08d687ca7a90
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BL2PR02MB2145; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2145;
	3:qNlVqD4knorZLltcTTz0vY9vZ8zvtvGgqHYTrqB4XEBlm0kHka4iAVFMZf3fFgQJMm59DX5pQo0vesiRwk1EsI2Otk6AG1AjX/fr+MKqeGE2Y8gvi9vyRGsMNvS6PihRVlmv8hN/Hqxgs7pDZ0hGhfB7rI0aU1j6LEGqBihpNMl2Nf6j5hqnB2ibY2Dhjzz7HMVl2jVh7hZyv0Viro56yzJnTf4jXN81hlv4HV3J4Wx+Rben0tMS62GZNloQstj18ZWNbA++DOMZG7ao64okVPnOQtCrJuzjOMN2vCs83z9lLEaKNEAbBKlcR+1Lwn3JF2dy2EnlZOiMOkAsvOZDUA6sc1AAwkde/XOso9dhXf4AX1NUzP5DllWvuCn5bKYc;
	25:as1JteKe2T7GFEz0irQuoc0HKqfmg9xepkmlgsdyh5PcYawitJjuve+rLGjG4SOkoobtlpfwc3g+/8PiioruZFU2tzZHzvIp4Iph4eSxfwtcgcVL5dVMrmctbpLoidbk3i/iYHLEy0hxB8Qjcbd2fkVHB1Fwlex59nWc3ppukjkkxlCsaDlE5hrEGsnH0WR4TNr9rqzZWGMOaGeG5xn2gJ2uaFXqvYE+zgZTc5r/dI+AlchEHVesdb7e0LTFP+81fC0m1sF/goNedG2NTTxUPvHLJaIAPXOkee6Jt/Z0WdT0dSleUnIYKXHgk6OFakEf/8MQ5RhsPIZ4VFAGEdUOehrXBfMwhMNaS0OPKCyp0zU=
X-MS-TrafficTypeDiagnostic: BL2PR02MB2145:
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2145;
	31:uY6ARaa/q2RsDc3/o8efYPFIvWml/69fUk952XnnYypDvwZamlIgOf5hEh9CAX98M0MuiEUKCVf0C8IekPT5HcNUxSuGiJ/P1tOHV4iUXPmlYySjK6CjdSCEBXMgH/FCbB7uyRdjBo+Qisdv8kuSIrcvKX0J//wPXeMkZHrBuyXgN2BrPKDXiD9EIrqZlAYxIQasfHAFrz9/XYWwKlOpq/pBuEbrEY6LcL39b6EMrVE=;
	20:OxccwXX6aNeQnxMPS1iT6/uvZIJ2RaGMWrqRL7MPrKFZ7VLxbnvyUpI88OxqVqL+eB/zgK8VNDQbOTS4akBAKhg9alCXBMz06F/UQXoQpn4PQCS7KJ6EM0gnbnjAAfNwlpPF23kp9qtuGDg+t81Zb9kCnRYUltOlrmJC6fagBN2sWRAcYly1Z5EMQK917csvqLwj77f6Ur1xAij6bNa8vWlAQqHtWXvA+mItTtMw7OaDLlpTMsnojlJQIRS9cwcMNS5g/PQkvAXsjbnNtdS7WlSamUOb2tmeBqgN3mHGH2idxdEav3MLhKvvB5ysLmS7YbV3i5BKcR2w2wBEKTbEuCJg7kiaNyXQf3urXOVYMes0OWa6RZvBgXNgjjSZCqKo0p091AAu0lmQ2BUtzOaDw4pBRYWcx+g1RMu/KguN3JB+3quh8pGANwS4XP4BEf7oaFczpL3NY7LQFTdThKNqx1TnbMeFfK40jRdCCDlsHk+kNb9VLzGy/BdR1y+MkZYb
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL2PR02MB21459CB7C925CB1B5F4D2C1AB9910@BL2PR02MB2145.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2145;
	4:ITZCfdBFdcPO/8Q/8Oaay+DMRjAnW7JudU4mEsOdvSkpYUCsZRlWF1vA4dRs/JDrdR8wH+j3axUg3jbIO5m3uL7fsrxial9ManjXyINFgcK66hhWv8kNNd0Ysz06OS1ygw5VW5/mE0vszGXGuYq/qNXJHKik4BBaR2EIpichmvVAp3bwxW30opq4+MvxBp0+UyG/1MRWL6p0Kt0IJjvGK/ywvkGiPLDMj1NOF0qz1GLkIyIGCp1+TF3OMrs/ZsbgoQEo7zQtaLTmxJdXij8Yo+lrfc1J7HsiQlYUgVqOicnjXphhOVm0jkdfQ5M5U03T
X-Forefront-PRVS: 09347618C4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR02MB2145;
	23:CtZ9ZWhMtfCeFUW2NEaTU3J8fg6pxsxU0PA/0BjF3?=
	=?us-ascii?Q?I7LIIP7/HHGlZzHyBmfGv3RPouICAt1aMPYxQt/SVSnFW2ojmR8ByAqnOOfQ?=
	=?us-ascii?Q?s4G7eUC/To8IbllHO3hzPZbi3oXLTlA0xAgZP7Fb8z0zlm7rtgQ2qDvZzcnO?=
	=?us-ascii?Q?1OU3ZypFeifVMhUGfRptQruydcZWnfP5ylH724yQnEy7A0pCLTlrFjGfHaf+?=
	=?us-ascii?Q?9N84Nw3wWBLKkLkLbYvnpozGYhgHkItynDBhFUUZvboFhl188IFSMue31vxZ?=
	=?us-ascii?Q?9RIWQEoxrbiRZmcXVG8akwYwph5zLKVSQC4euEM4W0EOfnkecNVBTGc0eACg?=
	=?us-ascii?Q?76bfTCq6OGucuIBBNfaxmWHplGCjg0Qy8XML5pAtsz2zAab6dqUqqa0BFtbG?=
	=?us-ascii?Q?1sWzJMwDyY7m7GH3wsTaSMjXS8K23+YODqAM5aFJDqL6PFgLv+QZM7IsL4gW?=
	=?us-ascii?Q?I+0AnKOzxtev2cS/C5OHasSomvqg2wcurr6OHSiG34rAmToWGaOpy9xTkkGr?=
	=?us-ascii?Q?7Xvbrs90SPCriBQYFcgYeOGvO3UELXd4ptrpllg6kVyDMcLdMo1zE7lVHtiD?=
	=?us-ascii?Q?viWARMSwUnlkAA4EvFTEb2MXcDfhf5UverfwzXKZOEB1Rn2F2fDcaGP0uaFB?=
	=?us-ascii?Q?Umtwg18MFI5gKw+aL/Ztb4lUCC36hgTT0EJeJ152NrYcpUIPbcp/8XNd83V3?=
	=?us-ascii?Q?QmehwIObW3OLMsUKHxMfMohGbpCBNhewEPoOeR3vOTsk9K55bCMJYKpF6cSV?=
	=?us-ascii?Q?fONYJ329+QVIIBun+Mf84WoBJ3f2h9Z8peaXB7vWRNZcfBJlNPLwymQQ2vir?=
	=?us-ascii?Q?8ldv2bNPFjMePcw8K5/3TB5PppG1lWz/i0QFk5VFhE44t/wX0xRl5ifm/6OA?=
	=?us-ascii?Q?ki2lISWSEbWR3BRTsRsGl15BQdHAXjJHji/hOcZEwmrQM3THSkNFBdkuAh8n?=
	=?us-ascii?Q?y/JQxz/T2vjm82S4Sp2GSJaGoNctLJbp4qezYmPiwPBaAIdrPkKebr+uvS6V?=
	=?us-ascii?Q?I2Lb1AeAR5jVo7oHrbR/+j3ar+m/6jO1DcdaIlr+k6WP4IUK0hteL7rfa3nm?=
	=?us-ascii?Q?4kH42Y=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 3IJVO8VaJtf2UlAEwJi2QiGHvhs0wUyB59tSbpArV6TNRvlULyflZHvFpIxfiVJaRhPcqQ0wDwdmnkUninnjRFKlnDa/NFA1bsdQbd1q5TtSfnhQ6eNUMf9wmjqc4wJ7071yeuPzDiv7n1bQs3bkr1OOJ9HfkzPjBLGlaJj0KllNcfqjywmoLQvJankvgmKFOA1USclmJf5hDa2U4aSXPNjO1svKPW1wbKirGOX0+v/l4sE7rQXILVkiBgB8cXDwU7QZtoYtZfwdZlaqg6PhfiBgfPsFveNOSlP0OC9RF3QDALb7eln+Mh9v0eyyEpEGuymOqUOC+BXBViHCQ73G0nYLAeoylfZ/VyZ1XIJA0XZ9BTamlyQf7R+7WVdSqrVrptRBztr6CKnMTFYw5cqt4uUfLekurKn+oP28wzHCtZQ=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2145;
	6:PehVlw0R2ilfdyl6hZPLIRJKnUwMM31s37d9RmdvIj8+552mNjuF/B+hiiFBjTw2jCtJwy2+xcBoIe5ZMpQvsDQdICqnrZlOq29mMyyq6wAnTncA1kNbpbDXoYGEeOmC56FL27BLDvagNY95w2TMlyVKSNxim02bk31fbkVgjuxslg5VrxMvlDbyEcM4fUPtHC25VAAzo95FJMzaLpr8Sbit6x2QnRkmuLo45PXzSSb0YrdXSEElqBmmR7nYLvKbyXma+YshlQMYmp8QHYGfDECv5QcS6vcIllPW1T2bRZ2NyHInSWgLDYS9XnbPA0w/mq7ZiUGmkrO+ssdfBvULSvoV/OjvpK6y6PKU/f+pCTNt6xhLWzNlfK9sovlnEeQcrtKcQuZNUrpCykpOVJOI3579xLeoSZFkDG8vQP0+bGUASRCV186SGOuNmomwZN2CXe4bWG/MuoxUsZm4NXQE0g==;
	5:Zdea+9Jkfvbl1Kx6Tzl+YJeE7prmdmthnqvb6lQuAA5EDnQpa/Hbnp4VgBVO0itu5GSZrQkwCRmICJlzx0xs5VgQO3K8JEcW8vP1gKAClu6dTMq/XYtBMbk6Kx/gj0I4yd9KM+/RPA0dYg/NTc241vLdajsStOOAwl2BXpABGwxT4bcouYgaU4WiPzzwsty0+KNUXUUgkxLDGS0wDxJJbQ==;
	7:297TZDnWIrhYLPOGZN+tCIAEltAjHoYpOhby60Qv47s5LBfND+cbByi84ASl9uZR5GSQLIOwq8W1zTK/BKoRjKCEXCLMBlWoi3LCPCwfzs3Z79/wJPqg6ykEAsuSyEMY0bPTSipurR4vCC2XFa2O0Q==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2019 22:21:42.7630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6622ee81-9347-499d-7b57-08d687ca7a90
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2145
Subject: [PATCH] ruby.inc: Add dependency on readline-native
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
X-List-Received-Date: Fri, 01 Feb 2019 03:54:59 -0000
Content-Type: text/plain

Add dependency on readline-native to fix the following issue

uninitialized constant Logfile
|       Check ext/fiddle/mkmf.log for more details.
| readline:
|       Could not be configured. It will not be installed.
|
build/tmp/work/x86_64-linux/ruby-native/2.5.1-r0/ruby-2.5.1/ext/readline/extconf.rb:62:
Neither readline nor libedit was found
|       Check ext/readline/mkmf.log for more details.
| *** Fix the problems, then remove these directories and try again if
you want.

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 5a5bef2..eaf5d13 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline"
-DEPENDS_class-native = "openssl-native libyaml-native"
+DEPENDS_class-native = "openssl-native libyaml-native readline-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-- 
2.7.4


