Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5A05078721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 17:47:38 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GwAADTXW9ah5i0x9VbHQEBBQELAYM/g?=
	=?us-ascii?q?U8EMwqNenSNKpoRgTgDXAqFO4MPGAEBAQEBAQEBAgECEAEBAQgNCQgoL4I4IoE?=
	=?us-ascii?q?EMQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAwI0fQEBN?=
	=?us-ascii?q?wGBUIodAxmZdgKLDQEBgxSDCgEBBYQmGIM8CAkBhEqDbIhFBIE4gQOFMKQZgkq?=
	=?us-ascii?q?TEJQ0Apc1AgICAgkCEQEBB4E8H4IKMxojgnyCRhAPDIIIdow5gTQBgRYBAQE?=
X-IPAS-Result: =?us-ascii?q?A2GwAADTXW9ah5i0x9VbHQEBBQELAYM/gU8EMwqNenSNKpo?=
	=?us-ascii?q?RgTgDXAqFO4MPGAEBAQEBAQEBAgECEAEBAQgNCQgoL4I4IoEEMQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAwI0fQEBNwGBUIodAxmZdgK?=
	=?us-ascii?q?LDQEBgxSDCgEBBYQmGIM8CAkBhEqDbIhFBIE4gQOFMKQZgkqTEJQ0Apc1AgICA?=
	=?us-ascii?q?gkCEQEBB4E8H4IKMxojgnyCRhAPDIIIdow5gTQBgRYBAQE?=
X-IronPort-AV: E=Sophos;i="5.46,432,1511820000"; d="scan'208";a="79138514"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VaisalaWorks.onmicrosoft.com; s=selector1-vaisala-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=udIQHCqC2C22LgNw4U/1QnysTSR/ClPdGuSGovCd1zg=;
	b=TcBO5fvjg4RB/N0yn60jYZHqTJTzBZiUKeEB29EM0rDEZvkpKRnL1pyrZ0gwsv7OGaA2voPhuyrvweOxbZNqv1RmMPRR/pWYKAPs7sORKKxO4oWGgEGY6G+GnMDi7XvVd0dt5zUPYqTWu6+eMV50j6dkFKkFsJjnz/ePXLJcDfU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 19:47:24 +0200
Message-Id: <20180129174724.26768-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: VI1PR08CA0109.eurprd08.prod.outlook.com
	(2603:10a6:800:d4::11) To HE1PR0601MB2539.eurprd06.prod.outlook.com
	(2603:10a6:3:52::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1258b70-8d96-441d-52d7-08d567406268
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:HE1PR0601MB2539; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2539;
	3:VNGoxxO5/iHe0GpUigqOJvWwBa+NSIFcuPB561BGODnB8wQOBMem6y57QXMQWBD3GgFaaUKteSHMExfCsxI9ecNhTSuS6qzECaKoCbR/GWByn/Ypjrc1LGPqla6XZ/dlgf/ZiXADZWIQZhBlUjpHy84rCwV17set2tLtLa6M9TO/lZAIdUTq+oYPcCnBFzyqISS41N8Brlc4FYX9riNm66OFhm9iypTXwSzQXC74xJ0K3tJH8XAGtlUNG0UCIjtK;
	25:hX6FRX9MWAO63voNzAJEtIgCZHT7ZgVVLePHHkr0nHrKqKKpbfrHLSdtzU/06pUHfhohsL8lAhXNQA+egwSuck+Gui8/+RlA/dvBKZmzFawKTzw16n2PlwCqFJwQecXoMO/OipPmHU17uHVW3s+n1TA5SA5Slc9zd33NF91TELYaax4KMzmzSUp2SgV7LZQ6SHXji8zHOESI3uypDiZkW2OOMQtFwMcC4T3ABh7MI7vwNWBIqdkaK6X6PHyy3K6AJQzxQfpQwoQYL6PV49iilj2n0Dix8bjLo0U5LJuQ0lxUveDfGXdTU3y2dDVJ3dI9wK5HK/xZJJ3tleJciOLryA==;
	31:flcOmMMen/8RtFm+85kb8QZU+/XThSg4pAgZisIzU+Tf8xpverZKr3yDxN5mifc+C8LuCYObk5pdu+2ChltlDWG8ZflooE5WTo6N3T38E+4dzLIfQUHHzCWBwAPQ85HOlIffWQvvKu/u0HEbIaGn9ntZB4P1kVuAYbAY0yGvhO2TYd0zLIiVmQ99i4WR9ABwryHk34MD0vhGT5M4VxSuY/pTLTmcmNSfjm8ux5zD2z4=
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2539:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2539;
	20:SKc33Y6UDJNnErstgeIqgIwmXdF4unzZ8x05qOf1qMM0qjxilaOIS/17fMsU5V/j5YF9MC3hUUzT69bvofciq3A8ci3t+pPq8DFyVYYSSkZDLXDv1kw0dawGXRKEQpmY4dGZ7oJek+UwMgIAEbBLm3v9AcyzFUfeBAor9pg+slY=;
	4:CXwdSV+LQIZaCmvAiUFSNSXpXB9NCjuqqqDiWFrSlin5KGuXQazmLrXKu6jM2a+NjaFzxTUGKo3QELknpGutqUcT1h2lHjQnJFb5POyU3v/IFvy2S2o23xVhoGPcI5qmt6Gr0qNlcrl+XtbnB+6TphBO1PrToCYcFQVKLQZB9NYv37NnAfoNUThOaxk3biDW9HJNRog3Gd2iqKNcVasI36/WuNz9vNFOokA/keq3SmABG290QfM7W+XGvQo/gsjo39HQ9F+tO31V8O/zXbDD9ZFkHnENr7hYQKBJua5QfvWThgW3mrkwbmD2uHxiw37Z
X-Microsoft-Antispam-PRVS: <HE1PR0601MB253974331BA8DEDF0D58553D81E50@HE1PR0601MB2539.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(150554046322364);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231101)(944501161)(3002001)(10201501046)(93006095)(93001095)(6041288)(2016111802025)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(6072148)(6043046)(201708071742011);
	SRVR:HE1PR0601MB2539; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0601MB2539; 
X-Forefront-PRVS: 0567A15835
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(376002)(396003)(366004)(346002)(39380400002)(189003)(199004)(47776003)(107886003)(2351001)(53416004)(66066001)(53936002)(97736004)(4326008)(25786009)(2361001)(68736007)(86362001)(2906002)(106356001)(36756003)(7736002)(386003)(478600001)(6486002)(7696005)(51416003)(186003)(69596002)(50226002)(3846002)(16526019)(8936002)(105586002)(6116002)(52116002)(316002)(59450400001)(1076002)(6916009)(305945005)(50466002)(16586007)(6666003)(26005)(81156014)(81166006)(5660300001)(8676002)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0601MB2539;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0601MB2539;
	23:kEar2GaT/AauQiFwak8qMgdkwLomRyzlPEIfjHW?=
	=?us-ascii?Q?+m9MAwpifzk0/3NA4Rt4OsgMGuDEJ7SZDjsa1O1MCm4YS4YoMfxHNl3j2hEm?=
	=?us-ascii?Q?OezHtc+pCiUn+Q+fqtVvmVtGrwdCmBCS7TK7ErUMjSay13Jn9MMLTM8sA4fB?=
	=?us-ascii?Q?gZOybFo0M7Fx4+Om9Pv2tJLLSvnq9vQvNqBMrp2qOhIDevTG0WO1zCKI9n/b?=
	=?us-ascii?Q?jV/ejdSebDt+RvrFAK1YyvkUISTCCyyDaI2MyXy7Z0PBMsF8YKNNib8yeLtT?=
	=?us-ascii?Q?5vjfqedKi5NKsD21IhJX2zpsHIUPKlTVBmYlZlo1qgjoEysD+/un31OXqVPt?=
	=?us-ascii?Q?6MjfGDt4U8asU8Zy/VCVieGzIDfrtfpSGHc6PGVAbLAbTyajXv4BuhCyIZ84?=
	=?us-ascii?Q?4yAWas2XECJZ0vFO+1V/GOiYzVcsymdBx0uqb/vS85nTSryzipxqjDiSfY8M?=
	=?us-ascii?Q?g4f1bGoI6d10FcjvgTbQCUXc0d8mboQobac2qkaqmKbhPmb5YP2SWsdl6sOL?=
	=?us-ascii?Q?n2QLiskd/R8ZmqHHmTmc293kEbnYCXXOZdQX53jldhF4ee8nmIHkSg4gV+Lf?=
	=?us-ascii?Q?0POVp9jbt3rgc/GepAERCanR2OIpyhFxIWoQ+UT+XASJIBdn1mwHX+hF6FdA?=
	=?us-ascii?Q?E4ZoKstaK8BZBuUibFOnRkw9KzpFOZus7Xv1PcgCJm+FKAUnGaYvSCd+LGsE?=
	=?us-ascii?Q?I09OnyFip/uEGkgqnl68VESUZm7c2CaEG8/e4wgvELXOLre3XsMENMAvXuc1?=
	=?us-ascii?Q?Rjt/L3wffOygQC72uhYEhAyK0tCODB29rhZ5IkriFntB+50R+mEWQP4VYJDF?=
	=?us-ascii?Q?KsNI+jShsDL57uHBQydRc+LCIhz/sHlApkJyZRwpuEtarOrt0Re6x2EjNxsy?=
	=?us-ascii?Q?OSrIQMNO9Nj4erEIRGHuwtW8iEkzK6a0trUPph9FTY6j1+eRtF7GtoDvsCH6?=
	=?us-ascii?Q?+2vIiL0YfmuCshTRyCGsGocbR1M7KRBY0lqgeruxU8Tn+vZK+EUD+VhVW7/r?=
	=?us-ascii?Q?fjElbc8YE1KgWtcKOWjjaOC8vo9cZ+CYt808jjX8PvwiTFzzK+xmRFz4Gume?=
	=?us-ascii?Q?O5VnkECiyBsbAEx56oqEUP9CwO6sHWAGlY7ZltBU+UCldulovLckWrICT6r3?=
	=?us-ascii?Q?2BRaBfnci04MFv+n5x0DFN32fwqp/51AN5yYqEVOAeWxEQiRFsuML+UNapnz?=
	=?us-ascii?Q?hVItbXGujIos/n9I=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2539;
	6:pDoWPOlUKaijyqszhciEz5gEBphAauUUN+twhQ+mMohvfeOcIR2bLLp5ivkvGkpgO35y5yIkQ6XNOfBW1bJ4KAeGGaPsOBAe9mAlzK8AkGG/vS72cNSTygo6rnf5PL0vegq8FA2oEG+XJaygKByOpHUaZ4puBbUiylOOtglDKIeOTzDbIxuoZ4OgavRoNIUiA+4pCOgH/pPFpKxwzkeMHz1jj1Uv+G29Y889oYechgQltHSw6X0/AQXybH+htYiuH+G2iEGmbxdkLwA+oE8tpc0GF2pNeyArD4PYyTBzB3T9SwxZMoDuM3apkPbOOQoj/uwTmNs4k9N5dbfIv7SMK53lY0Jt6jKZXv0PmPpm9C0=;
	5:ASaDMu/x2Sjerx4Q5rJpGUrmH6ct0my77F+6djLQ/vgc7IW+bgM0BHl/ZzatWdlerfBxmw+x9hv63hnj9yKvW57Wf8LEj0Ovd0Q9/k8sRbQIqUHQIpMtx0t3t478FgR7epo337xXmODWDP0VorWYkFqOGqQOMZQf9lXGjsQA+L8=;
	24:2viFnlAdziI+lFGuFcXmA6FC2Xwhpn97pS8Miakg9zAfnqN6t7XkCXqeUnJVYSR12L89w11x1f3/gtdSkrlrNWoFhfbe7nZWr4qwRTJa8ZI=;
	7:sltdNNTajNzI691Kzq9mbo/W9PI1TnE9wxC0/ANRtaTBE+HFnAdNZte00b5a/y6srQ3qi+DLmJs10d6QHK7H+Gh4W8TM/jTPDH8A3WlJWwejd/aFaEYj/hKwgON0Ok6Hf3zFxZE8qif49Ng2JbQIrs+Rb6zx9G86osO70Y5Xv1zZ9k3UUq9WhyMIvgvnSLG8jf1IVn73Y7pCITrrfGSU2w32HQMIBCOB2MlFn0hPW8/Lf5dh1/mBKtXU9cm7Krfp
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2018 17:47:36.5146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1258b70-8d96-441d-52d7-08d567406268
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2539
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Mon, 29 Jan 2018 17:47:39 -0000
Content-Type: text/plain

This mitigates following issues during u-boot do_compile() step --
otherwise, if comm is not available, they are quietly ignored:

  .../scripts/check-config.sh: line 33: comm: command not found
  .../scripts/check-config.sh: line 39: comm: command not found

Since 'comm' is provided by coreutils package, adding it to HOSTTOOLS
was considered a lower impact fix compared to adding coreutils-native
buildtime dependency to u-boot recipe.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93afb13166..e1d2f3c3e2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -473,7 +473,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 
 # Tools needed to run builds with OE-Core
 HOSTTOOLS += " \
-    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
+    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
-- 
2.11.0


