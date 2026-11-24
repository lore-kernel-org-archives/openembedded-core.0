Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24278.1795541028558067594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ERbDqpJo;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10272; q=dns/txt;
  s=iport01; t=1795541028; x=1796750628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cc1iMGwjFE4G48lI0gXEK5p1vvgQPZNSX6hGi/Svjs8=;
  b=ERbDqpJo9kkQHx34swgn5VbYASbuQAdXvVBxU9CYAf/ytOgAQazy9PVl
   Axw8BK9Exh6+SOCodP3nAytVHsTMHMMcU92kcK2u/h6VhYd059DImzhDB
   0kmNq01pbkY4kISliC/x+70oypw1hRokMe4lNT13yEPFqNp62XdvLaHNv
   MS/PLNe5WfJw5HPoQS+D+flHEw8GGT7ei7gTWiU1+ivwK9Flyg1T7AMBB
   3Uu/To5brkiMC0gFaaXRpy05BfOgvKx79sbkcEmhRLzBoxRyiXs4e+bI9
   OTGp5OTDE9yrOl1HMuYGqFvml6InJCJu6WR3Ef+HDkaAO0B/PZvZ4CFd4
   g==;
X-CSE-ConnectionGUID: ykyz08gtT5WTMh4NcbByog==
X-CSE-MsgGUID: ZYjRVtz5R0mlQX4cLBykTA==
X-IPAS-Result: =?us-ascii?q?A0BMAgD7xQVr/9BK/pBaglmCGD91YENJA5ZImieEBYF+D?=
 =?us-ascii?q?wEBAQ8uFg0EAQGFBY4kAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBBCYLARgBLSwDAQJWBCMhgwIBgnQDEbpsgXkzgQGDK?=
 =?us-ascii?q?QGBVNszAQsUAYE4hUKIJV0YAYR+JxsbgXKBFYNqgQWBXAEBiCYEgiKBDIFUH?=
 =?us-ascii?q?mSMFQKBT4hPSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWIQsjG?=
 =?us-ascii?q?A1IESw3FRkEPm4HlBmCew0BEj0WOwEHJCACY3otkxEdCQiQFYIhgTWeHoE+C?=
 =?us-ascii?q?iiDeYwkjT6HfBozqnILmH2KCymDVhaVbE+EaoFoPIFZcBWDIglKGQ+OLgsLg?=
 =?us-ascii?q?RQBCYJChRPJSCYyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:fA8EAK392AttjskO4PbD5Ydwkn2cJEfYwER7XKvMYLTBsI5bp2cCy
 GMbD2COOv6DNmbzeN4lOt7noUlTupXUzoBjT1Ru3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcubjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGHUInL9VI9fpLXF5y0
 PxEDjsHRAGEiLfjqF67YrEEasULJcTxeYdasXZ6wHSBUrAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NESojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjuC3bICNK4LiqcN9rHean
 Fza7TnDWhQeDezDwh6v43GQr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/KLpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:+E9XQqrl9qQbJPGKrDk52zcaV5odeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:ohMphWF4/DcjK29aqmJ2918GQpAqbkGA80v1IxOeAmxDWbqaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A55HjbA7wkbOWaSTx2suy83IHxoxa0qaUNlwfzK9?=
 =?us-ascii?q?evs29BXB7Hx2MjwieF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,231,1787011200"; 
   d="scan'208";a="60242096"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 17:23:45 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 90D741800020B;
	Tue, 24 Nov 2026 17:23:45 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 45AD3CC1611; Tue, 24 Nov 2026 09:23:44 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][blacksail][PATCH 1/2] perl: fix CVE-2026-15534
Date: Tue, 24 Nov 2026 09:23:40 -0800
Message-Id: <20261124172341.1626772-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251065
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the two upstream regex cache changes [1,2] identified in the
CVE announcement [3]. The first adjusts the countdown states so the
second can use STRLEN counters and guard cache allocation arithmetic.
The follow-up discussion clarifies the affected version range [4].

Include local corrections for gaps retained by the upstream fixes:
compute and save cache indexes as STRLEN, cast the pointer difference
before multiplication, and skip cache processing when the allocation
guard rejects the requested size.

[1] https://github.com/Perl/perl5/commit/568e6fd238867bb9e99fa3f47cba3169009239e0
[2] https://github.com/Perl/perl5/commit/54cf3d44cbbedd17d774e9a37921963e8fd5d0cb
[3] https://www.openwall.com/lists/oss-security/2026/08/09/12
[4] https://www.openwall.com/lists/oss-security/2026/08/09/13

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../perl/files/CVE-2026-15534_p1.patch        |  79 +++++++++++
 .../perl/files/CVE-2026-15534_p2.patch        | 132 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.44.0.bb     |   2 +
 3 files changed, 213 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-15534_p1.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-15534_p2.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-15534_p1.patch b/meta/recipes-devtools/perl/files/CVE-2026-15534_p1.patch
new file mode 100644
index 0000000..5cfd64e
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-15534_p1.patch
@@ -0,0 +1,79 @@
+From 568e6fd238867bb9e99fa3f47cba3169009239e0 Mon Sep 17 00:00:00 2001
+From: David Mitchell <davem@iabyn.com>
+Date: Tue, 30 Jun 2026 11:19:45 +0100
+Subject: [PATCH] regex super-linear cache: make countdown unsigned
+
+The super-linear cache is a block of flag bits malloc()ed during regex
+execution for patterns such as:
+
+    ((aaa)+)+
+
+which can go exponential in run time. The idea is that after the pattern
+has been executing for a while, the cache is malloced(), and subsequent
+failed iterations set a flag in the cache indicating a fail at this
+position, so that it can be failed quickly if a similar point is
+reached again after backtracking.
+
+The "executing for a while" bit is determined by setting a counter to a
+largish value, then counting down each time a WHILEM node is executed.
+When the count reaches zero, the cache is malloc()ed. When the count
+reaches -1, the cache becomes active, and no more decrements are done.
+
+This commit changes it so that the zero and -1 above become 1 and 0.
+This will allow the counter be made unsigned.
+
+This commit's only side effect is that the SLC will become active one
+iteration earlier than it did before. This isn't really an issue, as the
+current count start value is an extremely vague heuristic: the value
+used at the moment is (string length) x (the number of WHILEM nodes
+which can participate in the SLC).
+
+Actually changing the counter's type to unsigned will be done in the
+next commit.
+
+CVE: CVE-2026-15534
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/568e6fd238867bb9e99fa3f47cba3169009239e0]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ regexec.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/regexec.c b/regexec.c
+index 61b5c4a..53987b7 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -9142,7 +9142,8 @@ NULL
+                     reginfo->poscache_iter = reginfo->poscache_maxiter;
+                 }
+ 
+-                if (reginfo->poscache_iter-- == 0) {
++                if (reginfo->poscache_iter == 1) {
++                    reginfo->poscache_iter--;
+                     /* initialise cache */
+                     const SSize_t size = (reginfo->poscache_maxiter + 7)/8;
+                     regmatch_info_aux *const aux = reginfo->info_aux;
+@@ -9163,11 +9164,10 @@ NULL
+                     );
+                 }
+ 
+-                if (reginfo->poscache_iter < 0) {
++                if (reginfo->poscache_iter == 0) {
+                     /* have we already failed at this position? */
+                     SSize_t offset, mask;
+ 
+-                    reginfo->poscache_iter = -1; /* stop eventual underflow */
+                     offset  = (FLAGS(scan) & 0xf) - 1
+                                 +   (locinput - reginfo->strbeg)
+                                   * (FLAGS(scan)>>4);
+@@ -9183,6 +9183,8 @@ NULL
+                     ST.cache_offset = offset;
+                     ST.cache_mask   = mask;
+                 }
++                else
++                    reginfo->poscache_iter--;
+             }
+ 
+             /* Prefer B over A for minimal matching. */
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-15534_p2.patch b/meta/recipes-devtools/perl/files/CVE-2026-15534_p2.patch
new file mode 100644
index 0000000..bfbbb36
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-15534_p2.patch
@@ -0,0 +1,132 @@
+From 54cf3d44cbbedd17d774e9a37921963e8fd5d0cb Mon Sep 17 00:00:00 2001
+From: David Mitchell <davem@iabyn.com>
+Date: Tue, 30 Jun 2026 12:14:52 +0100
+Subject: [PATCH] regex: make superlinear cache 64-bit clean
+
+(See the previous commit for an explanation of what the SLC is).
+
+The iter and maxiter variables associated with the SLC are currently
+declared as I32. This causes various possible issues, including
+potential out of bounds reads and writes of the cache in the presence of
+very large strings and many WHILEM nodes: for example when the string is
+over 128Mb and there are 16 nodes (the max).
+
+Following on from the previous commit which made iter never be negative,
+this commit changes the variables' type to STRLEN (typically equal to
+U64 on 64-bit systems) and does calculations in a way to avoid potential
+overflows. If an overflow *could* occur, the cache isn't enabled.
+
+Previously, a -ve overflow was "fixed" by setting maxiter to I32_MAX, and
++ve overflows weren't detected.
+
+No tests are added, since this code only affects very large strings
+using lots of memory and iterations, and such tests would crash on small
+memory machines.
+
+CVE: CVE-2026-15534
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/54cf3d44cbbedd17d774e9a37921963e8fd5d0cb]
+
+Backport Changes:
+- Correct upstream index-width gaps: use STRLEN for computed and
+  saved cache indexes, and cast the pointer difference before
+  multiplication.
+- Skip cache processing when the allocation guard rejects caching,
+  before reading or decrementing an uninitialized or stale countdown.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ regexec.c | 31 ++++++++++++++++++++-----------
+ regexp.h  |  6 +++---
+ 2 files changed, 23 insertions(+), 14 deletions(-)
+
+diff --git a/regexec.c b/regexec.c
+index 53987b7..e265e95 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -9133,22 +9133,29 @@ NULL
+                 if (!reginfo->poscache_maxiter) {
+                     /* start the countdown: Postpone detection until we
+                      * know the match is not *that* much linear. */
+-                    reginfo->poscache_maxiter
+-                        =    (reginfo->strend - reginfo->strbeg + 1)
+-                           * (FLAGS(scan)>>4);
+-                    /* possible overflow for long strings and many CURLYX's */
+-                    if (reginfo->poscache_maxiter < 0)
+-                        reginfo->poscache_maxiter = I32_MAX;
+-                    reginfo->poscache_iter = reginfo->poscache_maxiter;
++                    STRLEN len = reginfo->strend - reginfo->strbeg;
++                    /* number of participating WHILEMs */
++                    U8 n = (FLAGS(scan)>>4);
++
++                    /* Only do the calculations and enable the cache if it
++                     * won't overflow. This test is equivalent to:
++                     *    ((len + 1) * n  + 7) <= max(STRLEN)
++                     */
++                    if (len < ((~(STRLEN)0) - 7)/n) {
++                        reginfo->poscache_maxiter = (len + 1) * n;
++                        reginfo->poscache_iter = reginfo->poscache_maxiter;
++                    }
++                    else
++                        goto whilem_no_cache;
+                 }
+ 
+                 if (reginfo->poscache_iter == 1) {
+                     reginfo->poscache_iter--;
+                     /* initialise cache */
+-                    const SSize_t size = (reginfo->poscache_maxiter + 7)/8;
++                    const STRLEN size = (reginfo->poscache_maxiter + 7)/8;
+                     regmatch_info_aux *const aux = reginfo->info_aux;
+                     if (aux->poscache) {
+-                        if ((SSize_t)reginfo->poscache_size < size) {
++                        if (reginfo->poscache_size < size) {
+                             Renew(aux->poscache, size, char);
+                             reginfo->poscache_size = size;
+                         }
+@@ -9166,10 +9173,11 @@ NULL
+ 
+                 if (reginfo->poscache_iter == 0) {
+                     /* have we already failed at this position? */
+-                    SSize_t offset, mask;
++                    STRLEN offset;
++                    SSize_t mask;
+ 
+                     offset  = (FLAGS(scan) & 0xf) - 1
+-                                +   (locinput - reginfo->strbeg)
++                                +   (STRLEN)(locinput - reginfo->strbeg)
+                                   * (FLAGS(scan)>>4);
+                     mask    = 1 << (offset % 8);
+                     offset /= 8;
+@@ -9187,6 +9195,7 @@ NULL
+                     reginfo->poscache_iter--;
+             }
+ 
++          whilem_no_cache:
+             /* Prefer B over A for minimal matching. */
+ 
+             if (cur_curlyx->u.curlyx.minmod) {
+diff --git a/regexp.h b/regexp.h
+index fbe89eb..6d8fc6f 100644
+--- a/regexp.h
++++ b/regexp.h
+@@ -830,8 +830,8 @@ typedef struct {
+     char *cutpoint;      /* (*COMMIT) position (if any) */
+     regmatch_info_aux      *info_aux; /* extra fields that need cleanup */
+     regmatch_info_aux_eval *info_aux_eval; /* extra saved state for (?{}) */
+-    I32  poscache_maxiter; /* how many whilems todo before S-L cache kicks in */
+-    I32  poscache_iter;    /* current countdown from _maxiter to zero */
++    STRLEN poscache_maxiter; /* how many whilems todo before S-L cache kicks in */
++    STRLEN poscache_iter;    /* current countdown from _maxiter to zero */
+     STRLEN poscache_size;  /* size of regmatch_info_aux.poscache */
+     bool intuit;    /* re_intuit_start() is the top-level caller */
+     bool is_utf8_pat;    /* regex is utf8 */
+@@ -1044,7 +1044,7 @@ typedef struct regmatch_state {
+             CHECKPOINT  cp;             /* see note above "struct branchlike" */
+             CHECKPOINT  lastcp;         /* see note above "struct branchlike" */
+             char        *save_lastloc;  /* previous curlyx.lastloc */
+-            I32		cache_offset;
++            STRLEN      cache_offset;
+             I32		cache_mask;
+         } whilem;
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/perl/perl_5.44.0.bb b/meta/recipes-devtools/perl/perl_5.44.0.bb
index 2c2e075..8b301a8 100644
--- a/meta/recipes-devtools/perl/perl_5.44.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.44.0.bb
@@ -15,6 +15,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://perl-dynloader.patch \
            file://0002-Constant-Fix-up-shebang.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://CVE-2026-15534_p1.patch \
+           file://CVE-2026-15534_p2.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.35.6
