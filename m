Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652FBC83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 06:09:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8653.1752041343899112306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 23:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=928594d0a8=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5695A2uS015516
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jul 2025 06:09:03 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19kqsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 06:09:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 8 Jul 2025 23:08:46 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 8 Jul 2025 23:08:44 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 2/2] sudo: upgrade 1.9.17 -> 1.9.17p1
Date: Wed, 9 Jul 2025 11:38:46 +0530
Message-ID: <20250709060846.1931242-2-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250709060846.1931242-1-praveen.kumar@windriver.com>
References: <20250709060846.1931242-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zpXaV44XI48BM7qt8ewqYS63RkCIG8aU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX09StzVa6mGjc ipIpZCUaw9PboDGVPI0GB5Aa6xr3o59oJNBkE7ziHCWD1XvDOYBf+T9w62PmUFf/4ggNcNmlfhZ E7KEpfM/PTM2PTVNqMu1orDtWilfdSoVxjNzKIUe4Z1coBOlD6AdV7hhLk/NHh8Ep88cwDJRRmE
 WzHiZc5uYOBQ9sjAQ6nQ+CkDi3MYele+zWNuEJzmq/f79kbvT7qOzWTovMACG+O1DNOhbTdUZNT VgweyceVFpU8u/Srf1mttw7L+2NDqZj7ARym9pN9nfF2KlONIXkgxBBbVpztXTVUit4tWNoT+aK HVXqsiOBx8q/TVj41sAaNr64KONS9o7JKjl8wjjUdRmS8ez2STcQKRRjJoDFjkTtBqn9HhhVB2A 1uLED9Dh
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=686e077e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=SETLuvH0AAAA:8 a=t7CeM3EgAAAA:8 a=g99q-cRUv0A7vnuUccEA:9 a=K2dp-gY6hJjlCEVBUzYH:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zpXaV44XI48BM7qt8ewqYS63RkCIG8aU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 06:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220076

Changelog:
===========
* Fixed CVE-2025-32462.  Sudo's -h (--host) option could be specified
   when running a command or editing a file.  This could enable a
   local privilege escalation attack if the sudoers file allows the
   user to run commands on a different host.

* Fixed CVE-2025-32463.  An attacker can leverage sudo's -R
  (--chroot) option to run arbitrary commands as root, even if
  they are not listed in the sudoers file.  The chroot support has
  been deprecated an will be removed entirely in a future release.

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.17.bb => sudo_1.9.17p1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.17.bb => sudo_1.9.17p1.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17.bb b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.17.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p1.bb
index 71d48f448d..83bfc0621c 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "3f212c69d534d5822b492d099abb02a593f91ca99f5afde5cb9bd3e1dcdad069"
+SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.40.0


