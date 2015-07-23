Return-Path: <B54851@freescale.com>
X-Greylist: delayed 908 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Jul 2015 05:45:11 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0140.outbound.protection.outlook.com [157.56.110.140])
	by mail.openembedded.org (Postfix) with ESMTP id BA727734B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:45:11 +0000 (UTC)
Received: from BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) by
	BN3PR0301MB1251.namprd03.prod.outlook.com (10.161.207.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.219.17; Thu, 23 Jul 2015 05:30:03 +0000
Received: from BY2PR03CA004.namprd03.prod.outlook.com (10.255.93.21) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 23 Jul 2015 05:30:02 +0000
Received: from BN1BFFO11FD028.protection.gbl (10.255.93.4) by
	BY2PR03CA004.outlook.office365.com (10.255.93.21) with Microsoft SMTP
	Server (TLS) id 15.1.219.17 via Frontend Transport;
	Thu, 23 Jul 2015 05:30:02 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD028.mail.protection.outlook.com (10.58.144.91) with
	Microsoft SMTP Server (TLS) id 15.1.225.13 via Frontend Transport;
	Thu, 23 Jul 2015 05:30:01 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t6N5Twkf012178;
	Wed, 22 Jul 2015 22:29:59 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jul 2015 21:29:49 +0800
Message-ID: <1437658192-8322-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD028;
	1:Vg3A/NppvACK1wEEa3/TqGMwbMqh5J+4W4J5AiQT7W6N92dUQHOE9QEmMZ/rYfaHWJ5li5VKNrnqzp/cklrLR0TR3CNJBMSOvukB1eH3PFfrPZ6siYmSxVhxsDAeSDU6bEZhvThpZ5TCrq18G5TsuR3bWY+hhIE6sykNmB4edBo3cL+LUfiXQvGWPr1H6CmHqbbTpEOJNJ1sMV61kl2WyMLz5c9D1aQCIW6/u8P32GLQE6fe5H5zrM3gDU/t68OPasXm+BdifoIuymdsuyK+3h7AZ23IafSCXlRpAbl/pgEc3VUXv2FCRlpglE3AlMGIF4Yu6akJZi0jFDhuaWJaFg==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(5423002)(189002)(199003)(229853001)(33646002)(47776003)(2351001)(62966003)(50986999)(6806004)(36756003)(450100001)(77156002)(86362001)(110136002)(5001920100001)(92566002)(77096005)(5003940100001)(104016003)(189998001)(50466002)(50226001)(105606002)(107886002)(85426001)(106466001)(87936001)(46102003)(48376002)(5001960100002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	2:wlbstrxorFV/VS5E6dgFTi3O/JF0RTpDQTgbqR7e+vPQneoT2OYcg7rVjnjSyPSbncuHRaBecs+rdxvUjBgX+AkDzNlsSz+0mZdTeaYdVrjs5MfgZFxI6kkESpLUdla/nTxCEXn+xiQQ0eKJOM9AlL1tk6ywF1SZIxIb7Jzr3R0=;
	3:vaCfDP4Bnv0IZn0Gp73rxs0d5UajEWppdPeE2j4zgG6wvKVKDpZkzdX+QtGoM3RL21V4qQz13lmpTxQkMbyNfN965QDWG4r9hiFbsZiHDor67xWlSBboY2Kjn34Yb+9wEwd0dxlF5ApkSMN2/6giJzB6LKj7cb8HcBPMK1m74b9Fy6tXKlKcSFeaiA1O6FtFNOqDFd307BEEXFNh7MUheRC7LKJKVn/P6T5RP1XU7V4=;
	25:BoPbUO6uusG4rxHJkxY6bJZOy5jZ9CH6Hn4p8koWKKn6LPOiYUkfZoaFTufwaXiIbrQLDwtorawmuy+Im3IlB5x5xBXUvpybHsUWC3noJQAQXI9Ic52NzAplcYLayCeIOAoFr4wWG15WAF2X3j76+2OmB5PuFT409rki48hO2Z9Hcg4t5BQceh4iIiikMQOW4E9jHfTWu1maO8Gj+572DDn450SZhEeR4rBBUHatJ8bUHQ0SaZujh1uRzLWI1K4BDafhbl0pc5JJR/yCySVg6g==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB1169;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB1251; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	20:YNjCrkGngem7SsHx6Jc/oSrTzQUWCi2vRrl8YHpB2U65hrR2NRoDb2TYuLPP9ViHzV8usAej9INw0CzaNTP1ZoH0gPzpuerUSQ6asdYEekhmOO/UiiLSAHSjm6jifYQLi2ASjluMMx3SBcTZzdmx1De4f+KX2h7esKZEfw9SgsEYEB3qZOtOFvwC8PGAu0q+94DJZZmZYWTz6HlrBD2xJ1U90HTmKz1CCcU74wv1QsRoOJKMtXYZm3x/dDquZRn/xwENfj18NcWkDon5Q9pbidG8x8iO06QZTGLZwG9j2T/ioDxDy9h2qrt/GCTBZ+0FvpVnWucs1CIro2JW07S7EMDK23c7Bn/gHglWKAH6Iq0=;
	4:51AczsM1igoL4UXSHxT7Pd36e5ZSzMDLgLo7XIaXMuzAHdQRCySkJHTUqOgwiQAUNNJWCPUQ8koz2NMhd5zXu2nLCY3Z7DREGP20trkUSskIH7H2O6WNkU65wtK8UrTjqolFMQ5Fy31VocERTH7E0Xr57p0DAS/2UpzARyb+mE01Buo1l2kCx3RDdk3CYTNyMwMimXfJ+ioao1RZL6PPThDfe51jZVDuJxKcswkwSCfNNBDI30TMEQ04KOOVVq1x0lCf2g1HkGyeaNBtEBcmvsAvzQO63pB+rZ2boQbZBJE=
BN3PR0301MB1169: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BN3PR0301MB1169E774553D4E29ED5D408486820@BN3PR0301MB1169.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1169; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1169; 
X-Forefront-PRVS: 06469BCC91
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	23:kbrFD22UjbUYb6aDEY3kLeZLCXDH0BoLcjqQS4VSB07qz36w6E8MYTWSzLjT+qQbsPmS4sk2qWKcSUlao5DIPNH3fs1iPfNON1zxcMHyiopJ83XeGNnOONCO12Z0xcpc/HCtWyN5kwKtzOV5QW28BOxwCNIwklnqbinCfWitnk5D6X26WVcBlNYfELbuT8EAcZNX1SY1okVdeF2NtE8R2juHxfxWFbN5P3x3hEM4fazAnoqqhYujq1HhLuo1Uk4tRN1qCI/jUjMFPr7VT8zbvTnya3N9HvmBEzX8gCG5pDrTCCimVQdH57ZazPFqaWf0l2WtJloZ23sk9/13lmfdam1S1V7Ncb9QyeBhaNJGLF2E2kZgX8x1QK8Y9AQkRhZFJwK+wAbOrabM5TOXGFGQv0srNaY/Uaghqd6kE8jXgFPIN0UIfXzgcJz4jG6bktISnprHl92cUMbDhFTpxgljcZNtMBMlgjKIkB++I0C4R+fNCF/uy8H+JbSlV/u4k36h3lDPccy0tb5dTbrBOctGmf2ysrGfVMfVOgq/43BG+tkkWluaaYeobAJSSd1XZV0uGqQKCTFd2GmXLZRMsaFwLgybrpVkBHnYJ1keT+gEmY9AFOjob+wgtQKY4B0cNaKJDaChqZH0Iv5C/vZgolompYPyMKvrOFpGrbdQH0A9jVf6229P8FAvbFK1jO/v6Xzl5FV5jyaly1Y+AScCy2Hnw8iEXd7Y8F0jt4ojeYIP2X6h9Bktm9I9S19Criqk19oaSca0B6fM8oc8yKey1mdJXgJjB4YsrEInu4Uub/vL4oOewE/eczKCjyaAYxp+HH4gXDjQHOyXzg4+zrUZhxCUBgma9hyizGsJfS8V/5Uc7paUnamkt01c5K5LZfx0qAVwTVOkajXGD3LAReMAbDduSWV4xYWmcoJtkEUEknWAmG5OkmjpzybnHwQ+O//CpVrS
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	5:GIs1d0HpGT7QUgYc9UrUvB8s4cebLKg3Ca+F55NPmluRwhSADaq+dq+sX1wyA4TEprjseiVQEBDOzMnOnUO0X0Caed8SZHiTwrclHcEJeXSybhG06f9MseK9X5zlne8JDpaGsk6GTr427abCodAy6w==;
	24:Z0yy3LmrsQBW0lmfxaKnmjYmSx/L74hDIuVJrPxXUlStf7q+aGfAnolcokSe0UAJtKMkv63a/6g3sO0iY9JCCLqDICKiQi6kh6KU9BlCgmc=;
	20:mj4Xm6xEynyd0DInEqBDuK962GQ8k3alIj0oDNV8X++TK8pyMb9kLUOdnScyk3WufXP0lbGKa1qN+EiKCS6G2A==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2015 05:30:01.1776 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1251;
	2:UrZ7TEp6pHnrKeZa8jssT4NbnQ1o2MbbgA3MvAUZYrDsqKVveGSU1AdSlX5Ee8fk;
	3:Qs3mihqYKWhJIaCR8BLTPXdjZw0Gu/VRdzDcu69cNQeq5TkgJOVBNMg+Z/ycBPGDJ4UcWYNmXdBm7tmtoKumNKQqp6VSMjTiKNT2hzJclOk8kNGHYJ6Od+EMwCmpvjKjTuu8+y7X27BGE21QmQqrAAaE0zY6KwWqHqzOMKW4v9OxhCp3pNPLTENqXvZVPJXNXmQ4LwRzEw+GRESSfu0WBKhYogeQVK/rw7+HUo8fSJE=;
	25:x42B2raaIOHtVmlQtKCj+PpNW+SDvuQsEYF6dPvhPpOGgfQdyc5bQApWqK+yA2Uy76pOAUgf5jHGMg+Okg7NntcZnJDsMLz0xtWlgFO3YcbsW/Tz0vrEAsMeW8RwMEwHGwb9VU+4UBaIfVjdWN1ZniPQFt2eBDAlKrGpkDnHebZzdsJFCLbGfCFW3RGKMn3n0Px7oORAC2Yl7VR4rsB5tboiIPb5VVHWxrXYo0MBfSiW1L4zfHh+5YfACseGQuP9hiGgba828lkCKUgwwzdGew==;
	23:39ueCdaGAdXK7Gnoj9H9YD5X16RMcEnEpEFGzTj3MOfK7gY8WQxKhAb9eZLIzXkzg7HS8omRyyb0upn9aN6sqDBnUxG5f211590goXB2+c4N9KIfpqnrj8FUxOMMxR0WOIGA2IIWqHHOjuMRTADhXEFS0hYRzBKDQuAfiGLtEfNd5BRbskyx4yh1Y+F0xJLTtDMbHrHytJBYm2EwkuDlvTuCwHyt4k0LdfHuyUm55bMCk4wBrJIKbDxsfy6iOSXU
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH 0/3] Upgrade to 3.14.38-6QP_Beta release
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
X-List-Received-Date: Thu, 23 Jul 2015 05:45:18 -0000
Content-Type: text/plain

Add patches for "gstreamer1.0", "gstreamer1.0-plugins-base/good"

Support aacparse

Yuqing Zhu (3):
  gstreamer1.0: Add patch for Gstreamer 1.4.5 including baseparse,
    basesink, inputselector
  gstreamer1.0-plugins-good: Add patch support aacparse
  gstreamer1.0-plugins-base: Add patch for Gstreamer 1.4.5 base

 ...rame-Don-t-ref-buffers-twice-when-mapping.patch |  25 +++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  87 +++++++++++
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  69 +++++++++
 .../fix-id3demux-utf16-to-utf8-issue.patch         |  54 +++++++
 .../handle-audio-video-decoder-error.patch         |  66 ++++++++
 .../videobuffer_updata_alignment_update.patch      |  53 +++++++
 ...p-sticky-events-around-when-doing-a-soft-.patch |  46 ++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |   7 +
 ...cparse-Fix-aacparse-error-tolerance-issue.patch |  34 +++++
 .../gstreamer/gstreamer1.0-plugins-good_1.4.5.bb   |   1 +
 .../0001-baseparse-handle-base-parse-error.patch   |  37 +++++
 ...x-QoS-lateness-checking-if-subclass-imple.patch |  70 +++++++++
 ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.4.5.bb                |   3 +
 14 files changed, 719 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/aacparse-Fix-aacparse-error-tolerance-issue.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-baseparse-handle-base-parse-error.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch

-- 
1.9.1


