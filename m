Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22217.1795539992323889504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dXAtwYNA;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10272; q=dns/txt;
  s=iport01; t=1795539992; x=1796749592;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cc1iMGwjFE4G48lI0gXEK5p1vvgQPZNSX6hGi/Svjs8=;
  b=dXAtwYNA0kVoBmwaE1u9VcesJAkk+3UyzwlK1+NZeM4JCTrFbNlqW5CO
   pKFMoCAbI+OSei0oCRlxJtFqWiOmHbE4MCUVr4P2QlN3Fshrky6g2jiUz
   dWtmPD68aeBTHvQ/zTZC7ywNZCA0EgiLDp/hs4oS0kTKesBOsyIhVsYA7
   x5RnRoO4NLUs/2J0QnhwGc0UQWB5sLYFfKBANBwMclsNU2Fi/lKGsQV3D
   bxW/fj0tFaSdwdSmnE5QuLAwSQv5iyr8LueosnprbDa5PBVLbquf0g4BW
   v+10gY2n1Yu5XVPQ/1JscqjFp2UAulRXF32jA3dMSY6c6dIXbsKqtHrEk
   w==;
X-CSE-ConnectionGUID: HQum33a6Sti82feTjVVWNw==
X-CSE-MsgGUID: sxAT0uebQlmbe90Gwmay6w==
X-IPAS-Result: =?us-ascii?q?A0BMAgDlvAVr/8pK/pBaglmCGD91YENJA5ZImieEBYF+D?=
 =?us-ascii?q?wEBAQ8uFg0EAQGFBY4kAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBBCYLARgBLSwDAQJWBCMhgwIBgnQDEbppgXkzgQGDK?=
 =?us-ascii?q?QGBVNszAQsUAYE4hUKIJV0YAYR+JxsbgXKBFYNqgQWBXAEBiCYEgiKBDIFUH?=
 =?us-ascii?q?mSMFQKBT4hLSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWIQseG?=
 =?us-ascii?q?A1IESw3FRkEPm4HlBaCeg0BEj0WOwEHJCACY3otkxEdCQiQFYIhgTWeHoE+C?=
 =?us-ascii?q?iiDeYwkjT6HfBozqnILmH2KCymDVhaVbE+EaoFoPIFZcBWDIglKGQ+OLgsLg?=
 =?us-ascii?q?RQBCYJChRPJSCYyAgkDMAEHAgcPAoFzkX4BAQ?=
IronPort-Data: A9a23:QzKDUqJr994q32NwFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS0DNSy
 mIcWWzTPfyDNGL0L4x/Pdiy8U1V6pLUxt8yQQId+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQvajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1ONVwzZtYRpN1rADEU+
 /EkKg4zUTac0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3NnwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQviui2a4qLI7RmQ+1Ojm+k/
 n/L9V39BxsXZYSw1j+M4yyz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvOS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:IoHdb6+YLH0bB+9Qd45uk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:XXDSzm5CcHP1QzvRmtss1HcJH5t+eyPm0HaAeUG1NWRXdoKzVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A1SgJVQxorAWTqrZAEEV8NrwJJYOaqL++IXxVjJg?=
 =?us-ascii?q?Mgs2BPyEhYxiCiT2mHJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62833861"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 17:06:30 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id AC89A345CD;
	Tue, 24 Nov 2026 17:06:29 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 53426CC1611; Tue, 24 Nov 2026 09:06:28 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][PATCH 1/2] perl: fix CVE-2026-15534
Date: Tue, 24 Nov 2026 09:06:24 -0800
Message-Id: <20261124170625.1602109-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251042
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
