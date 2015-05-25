Return-Path: <soren.brinkmann@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0096.outbound.protection.outlook.com [157.56.111.96])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6566AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 22:45:29 +0000 (UTC)
Received: from BL2FFO11OLC003.protection.gbl (10.173.160.32) by
	BL2FFO11HUB030.protection.gbl (10.173.161.54) with Microsoft SMTP
	Server (TLS) id 15.1.172.14; Mon, 25 May 2015 22:29:30 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2FFO11OLC003.mail.protection.outlook.com (10.173.161.187) with
	Microsoft SMTP Server (TLS) id 15.1.172.14 via Frontend Transport;
	Mon, 25 May 2015 22:29:30 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:57485
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1Yx0sD-0003Ks-AG
	for openembedded-core@lists.openembedded.org;
	Mon, 25 May 2015 15:29:29 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1Yx0sD-00079x-4G
	for openembedded-core@lists.openembedded.org;
	Mon, 25 May 2015 15:29:29 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t4PMT4cZ017977; Mon, 25 May 2015 15:29:04 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1Yx0sB-00079r-Ox; Mon, 25 May 2015 15:29:27 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 May 2015 15:29:19 -0700
Message-ID: <1432592959-11553-1-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.4.1.3.g4adf53d.dirty
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21568.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC003;
	1:ULmNoEfjcALrjkVWASVzi6rdfMwv++xSQr5kQmFOMu7+9oVqyBQbN+ybQknEYsMJWJ+odCE1yaYD3xb8VCDakwDTVYMRAS6HyK0DbY4shFnIePVzGjFnjRfG8BY5VtSoVXfv/41rOWCORbjC48GNSTXBP6cU+3tNSIIO5uDalWnShKndVzuvf9sbCd0blUV4ptZ0JKKTb2ba3fz5FQB16Sl3lAJyYJJU7lRMFAEa4tIuZCxtqQyl/C1cGaAS5SwSOQLX3DtfOLnUdz4pO0+PaQ==
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(199003)(189002)(87936001)(2351001)(229853001)(189998001)(19580405001)(47776003)(64706001)(36756003)(106466001)(575784001)(33646002)(50466002)(6806004)(86362001)(92566002)(63266004)(107886002)(110136002)(76506005)(5001960100002)(81156007)(5001920100001)(5001830100001)(5001860100001)(4001540100001)(62966003)(450100001)(77156002)(36386004)(77096005)(15975445007)(23676002)(50986999)(19580395003)(57986006)(5820100001)(50226001)(46102003)(107986001)(5001870100001)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB030;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11HUB030;
	2:zUPEQMl9asCCALQSJ1zrfsIf+WAN7iVVKEO3yMo6ggpdsMJGltc3cLigH0u0h8Ti;
	2:GSDXjoRKczTw3hvd3DgugHizLOmAAEzTq+qRzpg6YbxLM+p+5xMDZ9/o/f0rorSzxMOpB0GU/ZsE1VO8lQSgloo8BbID600X5MI/nsD5Mh6JiyCVV+Xs5H3rlcMo5uM709QOoYMu67423bGcgufDSzHqmLXnJDMGmsb2vJOJomQyQmBSY0JbZt5a+WvMs94YsFDs/vqMvbJSYhk7CX9yTtmoVkbhB+etNbf02159dnpkZmV7/8Y4vFEJF6Sg+cu1;
	6:HCoIzNwfcz6NtTu+34de2KBlOlJL9a+xrR2hXpcTzabZvdH9YxXKai57ItZ0Rne45fLXzzgHoM8PllrUWxn5wUAtiRw+N1lcxmCZyqiYNeM1yd9MHY6U7l2t1eATuYjvquDH26OHjyNYrBrorwgBXmhrrG6k81x+2YM5Q7uwT09dxubDTH5cik3kxtMgkz3rGgqOXEgRInQt99sFbL0QYrTR4x+u13LHfVs4vyhHwbN+rhI+PV4D+PSJjzekVVy5hZlewpFidCRkQYXqQLpnz28HJTYMnK1IRctWJZR0MTCspodcwHioKX7LYhDbVovFJTxDma6veexUliPqh0gjr2Sg4iSbUufaXa8kam9jEUhRN+sp0Oh+y0wpnSFgtV4F7HFcCAziXZo4zNmhshteg9kSnXYQgHrokj7Nsqztl+4dziEAOER0IDayWgeNtpfLtJcr6ELCdKECL8oRi9hjd+8kdnYCbSyyQr7DjqobyYAzBI8WBdKI3g6mn91CDGld
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB030;
X-Microsoft-Antispam-PRVS: <BL2FFO11HUB0308307F74FC42EA8E320CE8CCD0@BL2FFO11HUB030.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(520002)(3002001); SRVR:BL2FFO11HUB030;
	BCL:0; PCL:0; RULEID:; SRVR:BL2FFO11HUB030; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11HUB030;
	3:lMyfni9KSoN5nFh8c5dTeYAbJU090BVYIKihscPD2CHktj+wBw+AhQn29Xx6XYxBY0QYwXdW9Q0Uf1xygKxKoEhLnR0sn0v4rIPVy+C5PQtQF94jcOXy2Q6mO2iGzDHN2gY9CvgeZkD4knd/xv14uxsCR+QsidDbJNSfE4LN52L4/aDQkFfA60jJX//THMQ5S2ipTen8I3RIoMmor0pPWrm0o2lTvcIZ3qODgkgeKT4G+ECnbSmuTQaZErF84kOK5NpY50sHhtSP+BgeKQehx8bTv97y1vFknB3aYwfF+HywIpURcYRukJ7UDrk5XqU3
X-Forefront-PRVS: 058707456E
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDJGRk8xMUhVQjAzMDs5OklWWWJZNEVHZUhRVzV3S0UrbUxyU1Z5NDVn?=
	=?utf-8?B?WFg3OHcrV1VxN0haZDB6Y3dSR1Z6djlFaEtZazB5eGUyblc4L29HSjhtSXBa?=
	=?utf-8?B?VGY4S0hGQmdydXVHR0dzZ3A1cnZPRTFxNXlQOWpzc1k5aDcvQXNDR1VzTXE4?=
	=?utf-8?B?QmJKYW9MNUxRdGpWUlpPcmpYcGlsNzMrVnFwdG13RWJidXh4RThsY3JUakdJ?=
	=?utf-8?B?eWkwSXNpQWxGR2xpSVFnUHRibzRqenBqVzQ5OU1xcnVOenJwVE1haVVuSlFU?=
	=?utf-8?B?NHdhMXhMRVlyU2VGVHF2dVdjRFZBVE5pRWxSdkVFcmxVZ0VTNE9oN1JDOHNi?=
	=?utf-8?B?YlRmS2wxZ3ZUYi9HYllpaTNFNjdrUkpiTnZKOU9iZFNFeUFUWFVOSHp6Uy9L?=
	=?utf-8?B?bFFNeDAxZlFVdVB6U2RWaS84SEgvdTdHbEEvcll3TkxZbHRySXNsbHVqdGIv?=
	=?utf-8?B?aEZZTmxNTWJYdXlGMzN2VUxValppd1ZaWFczWEM4RWViZVl1VlY1S2szYnpJ?=
	=?utf-8?B?UloxMkp4Mk5NN0pJR3J3WmZNT3lqZGRyRlVBNlpiUWFicXp6bjEySFpWM2Ro?=
	=?utf-8?B?c3dEMytWQ1I3Y2VOenJMSUoyUWV0T3BEV2RNNklnQWlBWWlkNjB5VHdRQzIx?=
	=?utf-8?B?eXk3SlFrcHhrTGJENi9id0xwUGhBdGZIWU1vQlRKTER0aTBYNHg1RGtEcCth?=
	=?utf-8?B?c1huMC9FdWhNWjMvWkw1TVhPR3BYZFE5ZVZ5bGxwSkt3eFdYWncxRlZ0S3Jm?=
	=?utf-8?B?UlFlV0E1NEdydXRIb1I0WThyd2hvRUU0aGVscGI3SFh1U0k1S2FMZWc5N2Rm?=
	=?utf-8?B?S3lrdVphbVU3Y0FVZ2FnbndjNWlUdVBHdFZFTlBycVZwSVZHRHBKSi8yTzZS?=
	=?utf-8?B?bm5QR2NjTzhRZ3hZb0pGVXFYVXF4dUE5Y0VWcXNEMHRhT1N1bGtDVnV5Wjd1?=
	=?utf-8?B?a1poNWt4cEFMckZXNkYxRUNkbU93WVVvc1h3VFFnUkdPLzlaRDliWTJmdjZT?=
	=?utf-8?B?YlZoQzF3djZxT043a3JtdzdiZFBpZVU5M0lDWitKOHBOa0RkR0dwUGU1VXox?=
	=?utf-8?B?a3M2UUFhRS9Hait2OXQrNEFZbzBsdGRGSm1Tb3k4aUxmeFBRYXN2QWV0SnlV?=
	=?utf-8?B?QnJ0dW1wcEdCMlBML3VCckRuWnBsZUF0OHF0ZTRLZXJtUEdOUWtvSmtINmR2?=
	=?utf-8?B?SEpDZWw0OTYxUENHYzkybDFZK1l1U2s5Qk9DK1JPV0lMZ2kzZXh4UGxaTXBV?=
	=?utf-8?B?L3ovTFA2cEVySTQ0VG84NUdZenBrT2lRUGpQNmUyOHMyQnJDZlVxaU5SNFcz?=
	=?utf-8?B?ZWdsNFFtZGdSd24vTERYQ1BudWp6WTBuMGR2UFBvRHJiR3kwekVZNWdGc3Jj?=
	=?utf-8?B?cllwOWl4TmZUbFlSVis1OTZKWHJVMU5DUzBZMjV0MEJZM2VGOFlMMjR2UGlG?=
	=?utf-8?B?djlmQ1dCS1RXQ2orVXBSY1hqQjBML0p3L3lMQng3RmpRZnE0ZUVMcDE2SHE2?=
	=?utf-8?B?QjlyZHMxVGFlbnpNWXZnZks1eURmK0dNUklicExnci9BeXI1NWdwNktNVnhE?=
	=?utf-8?B?YitWcDROdm5LZTZMaExEV3Y2OS9Rb29aeVEvMFRtOFIvMmpkWUZQY1p3UGZo?=
	=?utf-8?Q?w+mf2aDCJNLFvWwt0l+F?=
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11HUB030;
	3:ygexqlH5UEc3SmIRdwVXsRzZqN24MO8GgfV9cRO8Xpzt1QMEs6GTgV7EVHPORdLojNhcmFpRhTI50wBv3EMsChR85i+ltyRkRrQ86cx3wvfKr0PEIHrCjUl0y+1dU3aI2q0/kFYjmQqhF5NjrqVDpQ==;
	10:S758utLevwGfF0ZV/2T4egTr3i7SnBD+qMZSWugzC0r6TqcsLzquvwaT22m3ljeB9gVNU+CalX9h1n0rYcIvqgd1BSZ/nmfiKYjwR+xoLbY=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2015 22:29:30.5051 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB030
Subject: [PATCH v2] dosfstools: Add recipe for v3.0.28
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
X-List-Received-Date: Mon, 25 May 2015 22:45:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add a recipe for building the latest (as of today) version of
dosfstools.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
v2:
 - add recipe for 3.0.28 additionally to the 2.11 one
---
 meta/recipes-devtools/dosfstools/dosfstools.inc    |  8 ++++++++
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |  7 +++----
 .../dosfstools/dosfstools_3.0.28.bb                | 22 ++++++++++++++++++++++
 3 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools.inc
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb

diff --git a/meta/recipes-devtools/dosfstools/dosfstools.inc b/meta/recipes-devtools/dosfstools/dosfstools.inc
new file mode 100644
index 000000000000..d2e672df1f48
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools.inc
@@ -0,0 +1,8 @@
+# dosfstools OE build file
+# Copyright (C) 2015, Sören Brinkmann <soeren.brinkmann@gmail>  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+SUMMARY = "DOS FAT Filesystem Utilities"
+SECTION = "base"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index d1c24b874845..d237cc9b9eac 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -1,10 +1,11 @@
 # dosfstools OE build file
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
-SUMMARY = "DOS FAT Filesystem Utilities"
+
+require dosfstools.inc
+
 HOMEPAGE = "http://daniel-baumann.ch/software/dosfstools/"
 
-SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
 PR = "r5"
@@ -31,5 +32,3 @@ do_install () {
 	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${base_sbindir}" \
 		   "MANDIR=${D}${mandir}/man8" install
 }
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
new file mode 100644
index 000000000000..3a746498a013
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
@@ -0,0 +1,22 @@
+# dosfstools OE build file
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
+# Copyright (C) 2015, Sören Brinkmann <soeren.brinkmann@gmail>  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require dosfstools.inc
+
+HOMEPAGE = "https://github.com/dosfstools/dosfstools"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/dosfstools-3.0.28.tar.xz"
+SRC_URI[md5sum] = "6a047a6c65186b9ebb1853709adb36db"
+SRC_URI[sha256sum] = "ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2"
+
+FILES_${PN} = "${base_sbindir}"
+FILES_${PN}-doc = "${mandir} ${docdir}"
+
+do_install () {
+	oe_runmake "PREFIX=${D}${prefix}" "SBINDIR=${D}${base_sbindir}" install
+}
-- 
2.4.1.3.g4adf53d.dirty


