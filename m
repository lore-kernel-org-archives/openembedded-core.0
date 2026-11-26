Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16131.1795706784706377962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 07:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TYFjl8aL;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild08.wrs.com, ip: 205.220.166.238, mailfrom: prvs=579015d7b8=sgavini@oak-lpgbuild08.wrs.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEWRhA2665353;
	Thu, 26 Nov 2026 07:26:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NAlMub+P8j9ut9c3BqRTtkHcIYvh9M712DBuWUoJ+4E=; b=
	TYFjl8aLXHX97ayBXuAhOQDwetwsokHYqQqLYrwGj4EDzXjmYRfElHTlluvL3NDo
	HXuY5mnmmNWlaYSQ7XaohBeoiHrxA7+5YMjH7lcHBE/aTPGYm1x+qRd6PYsVaSBA
	8zA05+3QVpF7yjTDYKnB4aBxRFY2Mvqm1hBOw6EjOuNeK6guSbheLOtcqdU4hCpc
	75rCvI1LO3G880qYVfCzolvDnP97bITzHg+EM4XDfMNGgsjZnoh3EZ9CccoB4cFQ
	b+5pjwKc5QuZoe1jeEsbtqi/kgUIvyTpiAChKPqNnEW9+P44TuyuKMV1dLKswg1M
	CBdPsvr16ecz0eyTIYoKjw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j60gh2vh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:26:19 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Thu, 26 Nov 2026 07:26:19 -0800
Received: from oak-lpgbuild08.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 26 Nov 2026 07:26:19 -0800
Received: by oak-lpgbuild08.wrs.com (Postfix, from userid 1762445539)
	id 85E5741C03ED; Thu, 26 Nov 2026 15:26:19 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: <ross.burton@arm.com>
CC: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>,
        <sumanth.gavini@windriver.com>
Subject: [PATCH v2] shadow: upgrade 4.20.3 -> 4.20.4
Date: Thu, 26 Nov 2026 15:26:19 +0000
Message-ID: <20261126152619.3584348-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3085864B-3AB6-4135-B33C-8663E1346941@arm.com>
References: <3085864B-3AB6-4135-B33C-8663E1346941@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R5SWitRX c=1 sm=1 tr=0 ts=6b084f9b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=jVwDQN0dAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=uneEPHohPPLKnTHkbfMA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: kBda7Xr2dgooAwQUqYzqniYGymKrhuS6
X-Proofpoint-ORIG-GUID: kBda7Xr2dgooAwQUqYzqniYGymKrhuS6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfXxOlu52onAVm9
 6W9JbKToc+7iuT4C+wbYuauB6ZS+Xc6vA31rHl9bFCvLKPZJpkvZMCcUPDgUtGCC55P5J3bwKAC
 5ne3i/Cgm4VadGaMQDANOdQgmj2Y8PFSBirnce2RBS3vOfW/x/Ot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfXweCjE+oEpYtD
 nohoZLzr0jnuL58i4gyeZQ/VHk+id96FdYiKCf6eYfSNH3cCK4M/qKQBXFC7VDH46xEjj2T+Mr4
 3BSw10l1E/+IiR/J/7m2dQpQvBlJkgyuhdQOvM58wSJBWo0AyTtGhN5HvQcCdaKZ01cYwKt8x8M
 zFVzNd+fFVRJI9HH8AEa8qzdncsoTsB1DB+2Pifv1HAKEorsIRhmt6tnYefscPVUcDwOYGBIfna
 BTRK9PiiUBCS+9aBkR4qR2tSz1I/VaV/DlMaPPuH4+SX7lZvqVO9veKvqWoegVA93WQT5ThsOyx
 Y7/hI6+050suVKVJJhmsR2eBO2nwAmFdob0DcXjW/X0pjBrJCFdHexqe0M2p0aVl3xWBJRWwDcB
 3TNoT5PPA6Ojyg+Ct8jHp7u4JYwOeHy+dk3gV8W6r612MM3YHBcI9A3diksWwNWf1VuuSkOSHTC
 pXfVskcP3BJjpOEtZVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251316
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
v2:
- Drop the duplicate file://login_defs_pam.sed from SRC_URI. It is already
  in SRC_URI:append:class-target (devtool/AUH artifact), as noted by Ross.

 ...cd_flush_cache-Fix-type-of-parameter.patch | 30 -------------------
 .../shadow/files/notallylog.patch             |  2 +-
 .../{shadow_4.20.3.bb => shadow_4.20.4.bb}    |  3 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
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
index 683a284aad..9607bfcdc2 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.4.bb
@@ -14,7 +14,6 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
-           file://0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -24,7 +23,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://notallylog.patch \
            "
-SRC_URI[sha256sum] = "39006c9daf9228ddda9156605201fc9f59c43f9fdecc83c78bbe0e72d9ffd58c"
+SRC_URI[sha256sum] = "041728ec7eaf1c4d45b5a861ce28f66a42d156a6a04ae725336bf4c997b74885"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
