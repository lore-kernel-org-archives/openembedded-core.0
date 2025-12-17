Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A15D64077
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 05:27:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7711.1765949272718692646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 21:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OtjeS5zQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3unwq3878794;
	Wed, 17 Dec 2025 05:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=OtbR0JQWSM2yjEPvZGtV
	1iaIdkPmTIm+Ke1HuSuvPPw=; b=OtjeS5zQwqzEhx+BobYKQ7v//rjY9JaOYTpu
	E22pJjXCfnvBphcxi8B9qsQi/PWAcErQZb6HZHnp4TYbvOFL7IHWBiKK0L3UXRYq
	NqoKKppP0u/Hs0lxRtE3YaWWEqw30OszL89DzNp5KDQk7iZRo8x1+Jqm3i/8fBmH
	1r8tOX4Z+2Oaf8DYn7d1ekDTnIoc7IAf3PBcZ0H7nhpXEaQH7He6etNfGcnzzy0b
	0Nu+ZEGyWw+Qdff1Kx/DsSe0R+DMUZaIoIiIvGTMI0j37k/t4fu73qKUuK3r6CGW
	ZysdhQFNufXzpcQHd4AQ4qGE19Ei80m/aiz6mEBFKn8bfBhD2g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k68r4v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Dec 2025 05:27:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Dec 2025 21:27:49 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Dec 2025 21:27:48 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2] socat: 1.8.0.3 -> 1.8.1.0
Date: Wed, 17 Dec 2025 13:27:47 +0800
Message-ID: <20251217052747.1182612-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA0MSBTYWx0ZWRfX3SHo9gW4iG2f
 NOo03JwNbS4qYSzERaoe3hTt4U5oJaLnA9N/qKR0q37UrgNpgIBsm3xTtM/VlQR7K4Q6AXIKX6N
 0zTDofRemKPv16WAGReZeOKJTPt4Dhv2YXDyY0w3a6hkZTHfyZPB3pHmcDOWC2f6UzAP2BsLHA7
 6kbiixxKYHFeqBf92zFozjoWmJP1Rcl5Rpk+0qdIryjf3oZ3kB+uPCYmSf4Jw6BPWWseJFaD8St
 TQVW0D6Iws/yicdXcwpYst3Rlals0NkbRkGqqHxn3oupBSMfYdp+sHKbrZLL6e9LSFag5qywNBW
 WOA9SUfp/57N/gxVEKOIKJcY/uW12Otb3/TmAqIHJnM6GuhKolEaquuZCrFHgCdXl5wksJIAurs
 12YWyVlixVKNNjz3BR3uFxWU52wuTw==
X-Proofpoint-ORIG-GUID: _uRorrxkJQ8xQYz3UWyEGTSVizDtppD9
X-Proofpoint-GUID: _uRorrxkJQ8xQYz3UWyEGTSVizDtppD9
X-Authority-Analysis: v=2.4 cv=EpLfbCcA c=1 sm=1 tr=0 ts=69423f56 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=uPZiAMpXAAAA:8 a=rFFRleaeAAAA:8
 a=t7CeM3EgAAAA:8 a=kMNUVrGqrNMktKWwMbMA:9 a=YLtI_f64H5IAZ6mI3Lwl:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 05:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227998

Fix compile failed with musl

License-Update: No change, update README to add new lines

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-compile-failed-with-musl.patch   | 42 +++++++++++++++++++
 .../{socat_1.8.0.3.bb => socat_1.8.1.0.bb}    |  5 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch
 rename meta/recipes-connectivity/socat/{socat_1.8.0.3.bb => socat_1.8.1.0.bb} (88%)

diff --git a/meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch b/meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch
new file mode 100644
index 0000000000..47ca6b97b0
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch
@@ -0,0 +1,42 @@
+From baf05d4c74d35a98d65328b89627d1806bfd84a5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Dec 2025 11:31:29 +0800
+Subject: [PATCH] fix compile failed with musl
+
+...
+|../sources/socat-1.8.1.0/xio-netlink.c:33:59: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
+|   33 |         struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
+|      |                                                           ^~~~
+...
+
+The warning is due to the fact the NULL macro is defined (by most modern
+compilers) as ((void *)0), as it is intended to be used only for pointers.
+Assigning this value to the void *msg_control member of structure msghdr
+causes the warning.
+
+To remove this warning, use 0 in place of NULL;
+
+Refer https://stackoverflow.com/questions/64535635/assignment-to-int-from-void-makes-integer-from-pointer-without-a-cast
+
+Upstream-Status: Submitted [socat@dest-unreach.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ xio-netlink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xio-netlink.c b/xio-netlink.c
+index 533d78c..cb31c43 100644
+--- a/xio-netlink.c
++++ b/xio-netlink.c
+@@ -30,7 +30,7 @@ int xio_netlink_mtu(
+ 	struct nlmsghdr buf[8192/sizeof(struct nlmsghdr)];
+ 	struct iovec iov = { buf, sizeof(buf) };
+ 	struct sockaddr_nl sa;
+-	struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
++	struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1, 0, 0, 0 };
+ 	struct nlmsghdr *nh;
+ 
+ 	Info2("Setting interface %d MTU to %u using netlink", interface_index, mtu);
+-- 
+2.49.0
+
diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
similarity index 88%
rename from meta/recipes-connectivity/socat/socat_1.8.0.3.bb
rename to meta/recipes-connectivity/socat/socat_1.8.1.0.bb
index b5f5d72f9c..331133d6f9 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
@@ -7,13 +7,14 @@ SECTION = "console/network"
 
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=248;endline=278;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=252;endline=282;md5=338c05eadd013872abb1d6e198e10a3f"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
+           file://0001-fix-compile-failed-with-musl.patch \
 "
 
-SRC_URI[sha256sum] = "01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095"
+SRC_URI[sha256sum] = "91f222ee65559036600c2505b999acebed48b899f0e2e53ae1c9c31d6986b6a4"
 
 inherit autotools
 
-- 
2.34.1


