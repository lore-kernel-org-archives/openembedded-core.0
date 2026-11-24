Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20254.1795533891017628999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 07:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YC2BehUX;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild08.wrs.com, ip: 205.220.166.238, mailfrom: prvs=57880bdd68=sgavini@oak-lpgbuild08.wrs.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFMGct1183780
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 07:24:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0+BjxMUUZ
	f6RVUf+8jfTKvkHNwmOhvy9tZ9IJtKc3DY=; b=YC2BehUXjLBG+kzymTiZ2o9TL
	BQIpCWYUKhW8zPUq+Y2nck8awfqrMaM4P2v/NIdDt9BvG19p8CvU6Iq5Lf1nQffu
	S8zSAm7JjTCd+SafR7Yh7+NGmj1YZBXilsRnRef11UcEeATpFQVM7ACPNZ4bRBud
	DNQgkdhF4O68tk02yeD8sUbCcnGP8+NVg8bcQxWbvxP47czZRisjH9ZSE8Qmntde
	Cbrup4XfU2AVc3mWMDfyi2R4jjAZfr8lSxoeVDqTAYXWwpJbOAg2BQEiXRu21txG
	e5c+/XkMc7yhbM61o9HiumJ5uHFBHSOvLboT6kE5ba37a7eCZjizVuRTABcVA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j51d7s1sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 07:24:49 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Tue, 24 Nov 2026 07:24:49 -0800
Received: from oak-lpgbuild08.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 24 Nov 2026 07:24:49 -0800
Received: by oak-lpgbuild08.wrs.com (Postfix, from userid 1762445539)
	id 3491D41C039C; Tue, 24 Nov 2026 15:24:49 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <sumanth.gavini@windriver.com>, <randy.macleod@windriver.com>
Subject: [PATCH] shadow: upgrade 4.20.3 -> 4.20.4
Date: Tue, 24 Nov 2026 15:24:49 +0000
Message-ID: <20261124152449.2973779-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Mwd2G3fLoxgp1qne_mn7HlDnaASe8imo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MCBTYWx0ZWRfX9+L9PY8eWLkL
 jLyNcTYl7gAoKp8p3QG9IRwxwGfVO+5OAN6ZKurLqeFrTg+8e1UOqLy4wHlKNMNd1Es2lakZ/zy
 WN3px+0epryxHQf9mrZ4SITlyZG6LL8U47WeGlSDqaE0xbE9offu
X-Authority-Analysis: v=2.4 cv=GZOCDgXL c=1 sm=1 tr=0 ts=6b05ac41 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=jVwDQN0dAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=uneEPHohPPLKnTHkbfMA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MCBTYWx0ZWRfXyhu62QQp9XoQ
 5mJL2Fg+Dhe6Jb7IwcGVJQ0fTzR+6I22PeiYUcDqvskHn6Uy+XodcRgJ8TEJQ43zfuxHFs2rmZ8
 PiZzTr2UWKZRaQy60XMNIz38phWJzS0RdpCj3l2864cdmSGXItdhr98wosV/6k21v6Tum6E1pg0
 IJ1IY6UemUuFox3O2kkeHiWRqdD1DfINBm+y2Pf6JLzK8O4B+tNolrk4axy55v1SnFwS4FKA/yp
 Mrq4kp2ekHU9e05vd/+tzpMLyqhEsO8eyl80jMCYRrTUvdSi9OriodSnyFGqke3EganrXctPL+q
 53d4+anol9OAtijvS5pXmdiEga0ei/+5xxE/rqKSs5FJCX7M8InNbkcxhwG8tTIUVunio7sn97T
 LcCVdVkxYNKl0XAQYIgA2iw3VU9ZE88PIGuGS1ILqPqT6P8xHq4LpBHaGKxUCGiZwwyfBJbMniZ
 Q1UmNHDlKhD+kdu15Xg==
X-Proofpoint-GUID: Mwd2G3fLoxgp1qne_mn7HlDnaASe8imo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 15:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251040
Content-Type: text/plain; charset="utf-8"

ChangeLog:
https://github.com/shadow-maint/shadow/releases/tag/4.20.4

Compare log: https://github.com/shadow-maint/shadow/compare/4.20.3...4.20.4

Security fixes:
* new[ug]idmap(1)
  * Use openat2(2) to avoid following symlinks and bind mounts.
  * Drop fd:N.

Regression fixes:
* lib/nscd.h
  * Fix build error due to wrong type.
    (regression introduced in 4.20.3)
* chfn(1)
  * Restore an error message that was accidentally made unreachable.
    (regression introduced in 4.20.0)
* chpasswd(8)
  * Respect chroot/prefix when reading </etc/login.defs>.
    (regression introduced in 4.12)
* groupmod(8)
  * Fix wrong database name in syslog(3) message.
    (regression introduced in 4.1.3)

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...cd_flush_cache-Fix-type-of-parameter.patch | 30 -------------------
 .../shadow/files/notallylog.patch             |  2 +-
 .../{shadow_4.20.3.bb => shadow_4.20.4.bb}    |  4 +--
 3 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch
 rename meta/recipes-extended/shadow/{shadow_4.20.3.bb => shadow_4.20.4.bb} (97%)

diff --git a/meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch b/meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch
deleted file mode 100644
index e873cdaffd..0000000000
--- a/meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b8d3549a49acfe967f45aebaf06d474c82c46d22 Mon Sep 17 00:00:00 2001
-From: Alejandro Colomar <alx@kernel.org>
-Date: Wed, 30 Sep 2026 19:12:01 +0200
-Subject: [PATCH] lib/nscd.h: nscd_flush_cache(): Fix type of parameter
-
-Fixes: deef7d84c3e4 (2026-09-09; "lib/nscd.h: nscd_flush_cache(): Define as static inline function")
-Closes: <https://github.com/shadow-maint/shadow/issues/1763>
-Reported-by: <https://github.com/Bonnietwin>
-Tested-by: <https://github.com/Bonnietwin>
-Signed-off-by: Alejandro Colomar <alx@kernel.org>
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/b8d3549a49acfe967f45aebaf06d474c82c46d22]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- lib/nscd.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/nscd.h b/lib/nscd.h
-index fda3b1cb..30b56720 100644
---- a/lib/nscd.h
-+++ b/lib/nscd.h
-@@ -8,7 +8,7 @@
- extern int nscd_flush_cache (const char *service);
- #else
- static inline int
--nscd_flush_cache(MAYBE_UNUSED int _1)
-+nscd_flush_cache(MAYBE_UNUSED const char *_1)
- {
- 	return 0;
- }
diff --git a/meta/recipes-extended/shadow/files/notallylog.patch b/meta/recipes-extended/shadow/files/notallylog.patch
index b3b30026ce..5a51d03692 100644
--- a/meta/recipes-extended/shadow/files/notallylog.patch
+++ b/meta/recipes-extended/shadow/files/notallylog.patch
@@ -1,4 +1,4 @@
-From a7d45933186754a1190509b46c51c56d48089004 Mon Sep 17 00:00:00 2001
+From 9cb5b470b3d704dc6b987a67d08a622b79702212 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 21 Apr 2026 11:30:52 +0100
 Subject: [PATCH] shadow: Disable tallylog execution
diff --git a/meta/recipes-extended/shadow/shadow_4.20.3.bb b/meta/recipes-extended/shadow/shadow_4.20.4.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.20.3.bb
rename to meta/recipes-extended/shadow/shadow_4.20.4.bb
index 683a284aad..5725dd391c 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.4.bb
@@ -14,7 +14,7 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
-           file://0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch \
+           file://login_defs_pam.sed \
            "
 
 SRC_URI:append:class-target = " \
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://notallylog.patch \
            "
-SRC_URI[sha256sum] = "39006c9daf9228ddda9156605201fc9f59c43f9fdecc83c78bbe0e72d9ffd58c"
+SRC_URI[sha256sum] = "041728ec7eaf1c4d45b5a861ce28f66a42d156a6a04ae725336bf4c997b74885"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
