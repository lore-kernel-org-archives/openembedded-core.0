Return-Path: <BSREEKAN@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0065.outbound.protection.outlook.com
	[104.47.37.65])
	by mail.openembedded.org (Postfix) with ESMTP id D38CA78A4A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bSUXTuyTOwotzeLvDsDCa+L9HauyfwMnldW1HGplUww=;
	b=JYbMQ5FVR3BeTnvWVohA4DkMPFmOZO1Gi3585uuSor2tivBzP5ieyA8r67N+6v2/m6QyRDXrrmR7bxB4CfVmuKzn3qQEnwZ4KeE2GionlcEaKu/66M51vXI3WVqS4ZWPP0OHT48539Eu5C4qw/+6WKvT29yHESXm5Q8eWogb0L8=
Received: from BLUPR0201CA0009.namprd02.prod.outlook.com (10.163.116.19) by
	BY2PR02MB1300.namprd02.prod.outlook.com (10.162.79.19) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.548.13; Wed, 7 Mar 2018 00:02:23 +0000
Received: from CY1NAM02FT024.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by BLUPR0201CA0009.outlook.office365.com
	(2a01:111:e400:52e7::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.548.13 via
	Frontend Transport; Wed, 7 Mar 2018 00:02:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT024.mail.protection.outlook.com (10.152.74.210) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Wed, 7 Mar 2018 00:02:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1etMXE-0000z6-8K for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2018 16:02:20 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1etMX9-0004fL-51 for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2018 16:02:15 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w27028al026964; Tue, 6 Mar 2018 16:02:08 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1etMWw-0004aO-Uv; Tue, 06 Mar 2018 16:02:03 -0800
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>
Date: Tue, 6 Mar 2018 16:01:52 -0800
Message-ID: <1520380912-17483-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39830400003)(396003)(376002)(39380400002)(346002)(2980300002)(438002)(189003)(199004)(107886003)(336012)(4326008)(6306002)(48376002)(50466002)(36386004)(72206003)(9786002)(316002)(966005)(5890100001)(106466001)(2906002)(106002)(1857600001)(6636002)(6666003)(8936002)(81156014)(81166006)(8746002)(478600001)(8676002)(50226002)(26005)(77096007)(186003)(110136005)(5660300001)(51416003)(7696005)(54906003)(36756003)(305945005)(59450400001)(47776003)(356003)(63266004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1300; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT024;
	1:VUW6pKTHrt5Ye6fYJemD7ixlB0RhQPPy9Ufx0WlSSlgB0M8zM1KAqZ1e2HKofH9mKIFenRdblXfBTee2QdU6bAFSqY7hPH0Ru2X6VCurt3Oo2dvp/hyhBjsaOw0YJUD9
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 597bdf3a-8d0c-4596-9130-08d583beb323
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BY2PR02MB1300; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1300;
	3:XWWpOwXgb6TsCphoax6Fy2LNr/uxcuNKpshN7OyeJhb5otVDBFcjvuvU363bIzCUofJkZWqWOdmUEf5etJ/MK6mcnZwde8DnJRK38lhCgUZq1qY6/c+7c9iWtLvXdt+YJ4MpPYNxvzb1sUqZbUi/Lz+wt00KraauE8I7pEgif+oS4abrhjDoGCp6BIT7gLvyS7p3X2Lh3abnWiMPcfQrD79tAgiVvYzFgDYpDKYZqHR0VOQNpMLHpJQZRIxnticqpaAd5Z2YsGNt5TGnPok74Y6yepcgLtM5mSa6UTJZEuQykqQjvEDtTwsiaNHZ7HmCn7eJCDDgUlNfuBb+LBO0WvjXPy06TnN1bzmHygcnKZU=;
	25:OYc0whDz9xjO0qagDLUz+9BxI0CsUQ3EfGlhXsDlO1s6AJMvw0rx1JGJqJsKuMl/accoqrfp/jiJ0l24vxn81ruhy5Mai2wySWt/Q2RxxGIutVLVb0j/9uEo+zI/4Xlu6vKhlPjEpFdesmOsMSOGk2bthfkOO1S2uNRlnAjs8+uoLiEO72Zv6yS0xHFyo6jZn+0V5FSRfhBWUft1mRu7JEgVauvVjBg4vlCSKkUFLS5C1Bzx/f6IaVLEOv5ttulkvDvXRIWzgyp7sL+Kq+WFWT97j3s1lv4hpNeZY0YUB78TLIVzbVkFSdvNP9QQk01v/qQJMQoN+HKYrUjT+8/NOw==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1300:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1300;
	31:e98OBot6hzosUQuO2T4ouY7GhYpbrRmY0hZFDgZmojKNv6/EYCVcZhS1XSUB4UzxbBtRWBMcje7b2FSyAQyqiZ8SOC2pfxhjZZTPVa85Tijq1/+AEbwrji08E9MAW6RHlm5BrlPlHhrdPhjDZwtw6SPn86D1dfKcDZv3x0FzYS0NWcS9g2OX1p1asUKTYiztXQ2o5ly0fek+1iMbyRChZGTM/nGGj/IicQFDCm6Pe4Q=;
	20:oXFbypNMXq6qatEYWargyeunVzq3cxfYR6/WNVAbyRyR++Vl9hmzwPrEeO6jI5qyoXqpZ4ABY+lRT8CNkzADKvm1QBrTYVS0LhUdkINe2hIJj5dFK72YgKzVRDwPwAez8ut6KH47JSyaGG+W46a5OdsG/wrZlVeblLfiApIutdlZOBTh/bTN3rvP0lRD+eFJQFI5GxhUdBPhoZnFAZZSNlWUrwuHQZJKEQwifWfhRhK5yQJcZ/UBGMjq6ioOXQ8lXnsvykXmto1mxQ4M/FN1IZWkgBJk8Dxgj8dZJ31n93WB2OH9eeTiIs2WT/SUrbn+t7LQdc9wWLlcuenirliqxk7P5Z+8gYhFRpwmZhkXsbwJO862Jp5PTKi8818vy5zJryEheWuntoBjBeJYNAHSMLAOrD9fcupabxL3P7x3GNwEFUT2fDmcGJ5T8Oa4AgF95kuDGkBsyz39OGxIH+geub03GlIjtSdNLtygmZBHhRM645YWcVzbeoc5NH6bDYIL
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB13002EA2AB8B691B94ED9C3CB0D80@BY2PR02MB1300.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(8121501046)(5005006)(3231220)(944501244)(52105095)(10201501046)(3002001)(93006095)(93004095)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:BY2PR02MB1300; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1300; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1300;
	4:xEJ1TdpOX13mvTF+njFBZ2EzGNvXBX6sa4QBcaxWA44WJe1e6YJvZJnI1DrVylJx4J2cqphGmhu6rLQH6J7jRIxUUFTzI4SOAra8uWnnt8lTTgR3YHfBl7yjRXV0zZT4xGVMkk9pGKFyHp3jiVZbkCNUBlbwfn6m7fexqVuXsqbCEIqc9S9J9a5j0zfqzLyH8q0vKJMnGNU7rBo+khXeN/KXVqBRSuftU+MSRUHq6lJvKK9LRIb8NnOlZm8tAOEoBOttyyucnbPSoF2jVC5aCx6d8Nfn8RXycOlaZ4t6P88ce4bsM7BNrRtMa90jzBpm
X-Forefront-PRVS: 0604AFA86B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1300;
	23:XfAn0rgbEvGkTqAvtlCU0RUW1qlv/CrlwNHMIplui?=
	=?us-ascii?Q?9A+bepuSdEdB5HB+xYPYixgDRGtOVpm0eDYz1xTR3gR4Zt+yRewRYuvCLPGK?=
	=?us-ascii?Q?rzD4KcrClBSwHzYqdUmx2mRA8+mTzYJkbg1KGj4xIgCuuk8+GLLl7LvlhHIX?=
	=?us-ascii?Q?yhIct8wTMELJS6kXVVflnrPzZSzmJNSHUkET2Te+3tjw5NSntALmGUlNayi9?=
	=?us-ascii?Q?tWsUKHSJrs42TE2ICXpIPWMKnGMdXhpOp4JJQJy8gVZKLEvr/bqStLctpklq?=
	=?us-ascii?Q?l90QY7tfkw6gwsOCZi6S6hA4/MS6Pyao1eLvuYTwNhFUe1zYvyuYIxUS5XyT?=
	=?us-ascii?Q?Jlnk+IQXWA5dahOYn4GnfdRHX3C6dgJk2lGtHbqpOy9HPmwDkXUtp3P8GcI5?=
	=?us-ascii?Q?4KAX3SR73sKfeEr+HZvtHDUXmdQqPCzeSUTVA3dDm1d/79z4Hja04vCEWhp1?=
	=?us-ascii?Q?D55VScRB87pJrkfpG8TiXLhbKe4TjlQ5FpenSeSCGkBONexCIaYr6qkN3tdt?=
	=?us-ascii?Q?7ELHjbwIXqzZCYKOkQLGttNujkVQSu6yYWC4qTE0NinuEZrxVR5b7O1PtCK9?=
	=?us-ascii?Q?rO/HCcVCtwPWTKzfmooqoKmch/b1/Lh2rMRw2C0RmZOVuOPNkDcS0Kh/bEUV?=
	=?us-ascii?Q?8PF2+mJk8igZmSQuUrmMu5tpdio9oRC5FuTC2++zzarnUJZidF+QkLER/JlI?=
	=?us-ascii?Q?RRQhGPNI4k6A7EC9rZnaZlQCNg5Zs5OQuvXvv+61hIgPptOchIH9544EsfsB?=
	=?us-ascii?Q?MXYUxcYYWrtoELhy8bPzvS/53TC3HEU5zjKDAov9rywG5RcF2i2YhEstVwwC?=
	=?us-ascii?Q?quTtPpO90sgJPZd27KQESdMUyIzycIHCmwSaoOCR+DvuIPU5xi29RzvDa8gN?=
	=?us-ascii?Q?/gCJRE2Vgscg04C0MZ7B7j99y+QQ6YsHGVoDFfMcoiL52hh0MGmECD/4Qh6N?=
	=?us-ascii?Q?Ql8QcdexHxvDwu59t4zCYH1rd89A7FPrNCZdWY3h027UM5hrJ8t69E2I0Qfl?=
	=?us-ascii?Q?VXSTlcWN2tTUYLKZf9gVYU2YhckmHlam/PwBwt5sQChuFcunWKT7TVdd8TA1?=
	=?us-ascii?Q?HEdVXcVDRtOhPpzb5HU31FTQF/km0t9VfvbNJSBcGb/WFunGO70HdMNfx8t1?=
	=?us-ascii?Q?neJfOMvpUI=3D?=
X-Microsoft-Antispam-Message-Info: Jhye1OL67UnSI5W6dK9ay4RjPy0iKb7TO0m4MuaMVBg6oRP2IX9e8U5N0eKIRr51m0RNGUJCM22mzevcXJKsh/2obUbqZvjvmbuiXrcGNaL68RhwCUZdVCSYex/1aIKBi3bXOoTFoYfiT3B2aSXVkVidfqWLgCDnLOVqpykEy+w3pu86jN6oDf3VjLeJXeXF
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1300;
	6:z6y7QSIyShAC0J2OzgqQ7ScCBUW+VE6oi0cfUO1o2oKfBVhivYR5TBuubIh92uVQ/7eVjeBu3VgHnmtZYi6/1xHdA6xeNzs3v2QrATgO+gxrA4L+LV2RJ/cz4wuAcKgVRdnU76uIiNSPk/GV1U9BnCzt4shkpJ78Q634wsfcppCuK0/NhRQBmf7Dk7aSJfxxqdFqGprDJAR7tJyEXh+J34wwdgkfTnPjqmooO8I7CgWDMWHpKSSmoA+irxPiRPZBGA4U7ZXJkzYlRNAZ8Fm3CADmHQz6Ecy0CSLtHQUNqUw3SC5aNiP1AEaEM6lOstkzrtKDE+v6uJZlji0P+umNh+GOUhJicrigfqJ3Nup+UMY=;
	5:B8dQZZJKUsERLSo98NRQp3CjK8p09Rcoaw1i4/ivj9i+ICnMltBbAH0f0GgsQHRXUCk4s7WOFD7ASPRojZJldxyxqu/Uts2ZFhjSd+gjv1ZgyfOX0vSTlKAmQ8fvEuZEP3LtY060yRvjocIAVb7tAkxPxel6IcXNFGLBX2Sj1X0=;
	24:C7YlFlzICSD4LGv+Q8h3+Kn3+s9lnkz7mG7bcvkeA/T4PiZTnm+qV/UlE57z10kzhrtweTbEaDmCZlQVamp/XDCZbA+CIp2E2F/g5Lj/a/g=;
	7:/nmi8P1r7kwNZ8OKU1Q4Xzqbk5BVYtc49dgVtf2LMcuPB5nVyv+K+PFyXxZF/9K+o6kcMHdhel8MZKtZ6Yw/98APVc0GMi1Kjn3dIin16jWXIexWVhGpUIo07gW9/0Xnw0gt/XHCzqMrVRdwc2muitufmrWLIspY9EzPF7y6Khrdn/+h8AqGdwu1PqWBQOYmEWwhLBw3sOWvQxgUDQYcsQwyP2qvjI5ClG56Wcy2lYz28p9/9qLVSr0zaQ4JdXNe
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2018 00:02:21.0114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597bdf3a-8d0c-4596-9130-08d583beb323
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1300
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [PATCH][roko] webkitgtk_2.16.6.bb: Remove gl3.h header reference
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
X-List-Received-Date: Wed, 07 Mar 2018 00:17:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

GLES 2 application cannot use gl3.h header files, remove including gl3.h
when OpenGLESv2 is enabled in webkitgtk

Backported from OE-core master.

Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayath=
ri@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 ...01-Fix-gles3-header-when-gles2-is-enabled.patch | 38 ++++++++++++++++++=
++++
 meta/recipes-sato/webkit/webkitgtk_2.16.6.bb       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-heade=
r-when-gles2-is-enabled.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-header-when-=
gles2-is-enabled.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-=
header-when-gles2-is-enabled.patch
new file mode 100644
index 0000000..050a243
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-header-when-gles2-i=
s-enabled.patch
@@ -0,0 +1,38 @@
+From 4db97c245366a33200959d83a7f2f05b7eea694d Mon Sep 17 00:00:00 2001
+From: Bhargava Sreekantappa Gayathri
+ <bhargava.sreekantappa-gayathri@xilinx.com>
+Date: Fri, 23 Feb 2018 16:44:01 -0800
+Subject: [PATCH] Fix gles3 header when gles2 is enabled
+
+A GLES 2 application should not use gl3.h.
+Fix the gles3 header failure while compiling webkitgtk.
+
+FAILED:
+Source/WebCore/CMakeFiles/WebCore.dir/platform/graphics/GLContext.cpp.o
+           ^~~~~~~~~~~~~
+compilation terminated.
+
+Upstream-Status: Backport
+Imported patch from: https://bugs.webkit.org/show_bug.cgi?id=3D183008
+
+Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayat=
hri@xilinx.com>
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+---
+ Source/WebCore/platform/graphics/GLContext.cpp | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/graphics/GLContext.cpp b/Source/WebCo=
re/platform/graphics/GLContext.cpp
+index 67d60ce..45c85fb 100644
+--- a/Source/WebCore/platform/graphics/GLContext.cpp
++++ b/Source/WebCore/platform/graphics/GLContext.cpp
+@@ -28,7 +28,6 @@
+
+ #if USE(OPENGL_ES_2)
+ #include <GLES2/gl2.h>
+-#include <GLES3/gl3.h>
+ #endif
+
+ #if USE(GLX)
+--
+2.7.4
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.16.6.bb
index 0f126cb..7609405 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "http://www.webkitgtk.org/releases/${BPN}-${P=
V}.tar.xz \
            file://gcc7.patch \
            file://detect-atomics-during-configure.patch \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
+           file://0001-Fix-gles3-header-when-gles2-is-enabled.patch \
            "

 SRC_URI[md5sum] =3D "0e2d142a586e4ff79cf0324f4fdbf20c"
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

