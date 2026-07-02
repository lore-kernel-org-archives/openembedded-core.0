Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA114C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 05:32:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63292.1782970367014721594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 22:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rwniOJUK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kA4KxcUj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f2150b83c-2251176a-1927-4d2d-a2c3-425b541c5392-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782970366;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xRMq10+rHSi6ZyqeqE30+EtrYtYnlOCDEDKlSgZEhQo=;
	b=rwniOJUKuTf7sN9eifZbntaNc4DlxYKRcKwOC2DEYYuOU/2iY6pkK+iHE8fVr9Ti
	PkFFt5YrlAVDRtP2D1n4ZTPwDHmA3VNJL1x/2CcODudb5WIcGZQ+Z/PFWXmfkkQgpsU
	ZHcKGUHDLMPc0rn9nR6f/v05zTAcj4RFwCuah7JU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782970366;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xRMq10+rHSi6ZyqeqE30+EtrYtYnlOCDEDKlSgZEhQo=;
	b=kA4KxcUj2/XI0yZZ1gzypgu7w8vk2c2pvXiE4NjGo6sCwlQnbleGGcLyA+KoDpN/
	zJHJR3AH4opY1xpIDdzolOcvhMl8mBfU6DWap+SziqEBmHzGRkKpt7j/Sz1Baxekr2z
	Hvw62h58BbKKO49iHlc+uk4EPG6YHsH0ejE3O0i4=
Content-Type: multipart/mixed; boundary="===============0108492313038734188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libevent: upgrading to 2.1.13 SUCCEEDED
Message-ID: <0101019f2150b83c-2251176a-1927-4d2d-a2c3-425b541c5392-000000@us-west-2.amazonses.com>
Date: Thu, 2 Jul 2026 05:32:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 05:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240016

--===============0108492313038734188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libevent* to *2.1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libevent-upgrade-2.1.12-2.1.13.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 7e09389e57ea0ba43c6ea669d776a535a6731174 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 2 Jul 2026 05:28:45 +0000
Subject: [PATCH] libevent: upgrade 2.1.12 -> 2.1.13

---
 ...s_dns.c-patch-out-tests-that-require-a-wo.patch |  8 ++++----
 ...s.h-Increase-default-timeval-tolerance-50.patch |  8 ++++----
 ...-util-monotonic_prc_fallback-as-retriable.patch |  9 +++------
 ...e-tests-are-marked-failed-only-when-all-a.patch |  9 +++------
 .../libevent/Makefile-missing-test-dir.patch       | 14 ++++++++++----
 .../{libevent_2.1.12.bb => libevent_2.1.13.bb}     |  2 +-
 6 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-support/libevent/{libevent_2.1.12.bb => libevent_2.1.13.bb} (95%)

diff --git a/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch b/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch
index 505153d285..bab94a17ec 100644
--- a/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch
+++ b/meta/recipes-support/libevent/libevent/0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch
@@ -1,4 +1,4 @@
-From 7c17967b8fd2d18b74a8934fd9bb8212ebd6a271 Mon Sep 17 00:00:00 2001
+From 3444b04844a0cd75050d16e9382427f0f431a948 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Jan 2020 13:22:46 +0100
 Subject: [PATCH] test/regress_dns.c: patch out tests that require a working
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/test/regress_dns.c b/test/regress_dns.c
-index d2084b7..a1a8f3b 100644
+index 9a8bff4..7449e94 100644
 --- a/test/regress_dns.c
 +++ b/test/regress_dns.c
-@@ -2394,8 +2394,6 @@ struct testcase_t dns_testcases[] = {
+@@ -2459,8 +2459,6 @@ struct testcase_t dns_testcases[] = {
  	{ "reissue_disable_when_inactive", dns_reissue_disable_when_inactive_test,
  	  TT_FORK|TT_NEED_BASE|TT_NO_LOGS, &basic_setup, NULL },
  	{ "inflight", dns_inflight_test, TT_FORK|TT_NEED_BASE, &basic_setup, NULL },
@@ -26,7 +26,7 @@ index d2084b7..a1a8f3b 100644
  #ifdef EVENT__HAVE_SETRLIMIT
  	{ "bufferevent_connect_hostname_emfile", test_bufferevent_connect_hostname,
  	  TT_FORK|TT_NEED_BASE, &basic_setup, (char*)"emfile" },
-@@ -2405,8 +2403,6 @@ struct testcase_t dns_testcases[] = {
+@@ -2470,8 +2468,6 @@ struct testcase_t dns_testcases[] = {
  	{ "disable_when_inactive_no_ns", dns_disable_when_inactive_no_ns_test,
  	  TT_FORK|TT_NEED_BASE|TT_NO_LOGS, &basic_setup, NULL },
  
diff --git a/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch b/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
index 0b20eda3c0..68a84468d0 100644
--- a/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
+++ b/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
@@ -1,4 +1,4 @@
-From dff8fd27edb23bc1486809186c6a4fe1f75f2179 Mon Sep 17 00:00:00 2001
+From 64f2b035a1073c9f594036b46521e19dac029ec2 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 22 Apr 2021 22:35:59 -0400
 Subject: [PATCH] test/regress.h: Increase default timeval tolerance 50 ms ->
@@ -19,10 +19,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/test/regress.h b/test/regress.h
-index f06a7669..829af4a7 100644
+index 43cb4ea..21cfb5f 100644
 --- a/test/regress.h
 +++ b/test/regress.h
-@@ -127,7 +127,7 @@ int test_ai_eq_(const struct evutil_addrinfo *ai, const char *sockaddr_port,
+@@ -123,7 +123,7 @@ int test_ai_eq_(const struct evutil_addrinfo *ai, const char *sockaddr_port,
  	tt_int_op(labs(timeval_msec_diff((tv1), (tv2)) - diff), <=, tolerance)
  
  #define test_timeval_diff_eq(tv1, tv2, diff)				\
@@ -30,4 +30,4 @@ index f06a7669..829af4a7 100644
 +	test_timeval_diff_leq((tv1), (tv2), (diff), 100)
  
  long timeval_msec_diff(const struct timeval *start, const struct timeval *end);
-
+ 
diff --git a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
index ddc19c495f..b83c83b976 100644
--- a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
+++ b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
@@ -1,4 +1,4 @@
-From d01a57a998798da977c470f3b8d6a457c1adb144 Mon Sep 17 00:00:00 2001
+From 9ad27391a97157eb8cee84a7e9cc3dc93df34cbb Mon Sep 17 00:00:00 2001
 From: Azat Khuzhin <azat@libevent.org>
 Date: Sun, 19 Sep 2021 00:57:31 +0300
 Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
@@ -11,10 +11,10 @@ Upstream-Status: Backport
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/test/regress_util.c b/test/regress_util.c
-index 45caa2700a40..a9e80db20149 100644
+index fd149b3..10244d6 100644
 --- a/test/regress_util.c
 +++ b/test/regress_util.c
-@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
+@@ -1674,7 +1674,7 @@ struct testcase_t util_testcases[] = {
  	{ "monotonic_res_fallback", test_evutil_monotonic_res, TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
  	{ "monotonic_prc", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"" },
  	{ "monotonic_prc_precise", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"precise" },
@@ -23,6 +23,3 @@ index 45caa2700a40..a9e80db20149 100644
  	{ "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL },
  	{ "evutil_v4addr_is_local", test_evutil_v4addr_is_local, 0, NULL, NULL },
  	{ "evutil_v6addr_is_local", test_evutil_v6addr_is_local, 0, NULL, NULL },
--- 
-2.31.1
-
diff --git a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
index 26b707ad31..4cb2a6d7bc 100644
--- a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
+++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
@@ -1,4 +1,4 @@
-From 36ebd92fa53c0097f1e2f9ec5aa5b5c6ec1b411d Mon Sep 17 00:00:00 2001
+From 59ab048f0fe32fb8d8e43214f93c32b53148419c Mon Sep 17 00:00:00 2001
 From: Thomas Perrot <thomas.perrot@bootlin.com>
 Date: Wed, 29 Sep 2021 13:50:35 +0200
 Subject: [PATCH] test: retriable tests are marked failed only when all
@@ -15,7 +15,7 @@ Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
  2 files changed, 7 insertions(+), 8 deletions(-)
 
 diff --git a/test/tinytest.c b/test/tinytest.c
-index 85dfe74a720e..bf2882418eb6 100644
+index 85dfe74..bf28824 100644
 --- a/test/tinytest.c
 +++ b/test/tinytest.c
 @@ -310,7 +310,8 @@ testcase_run_forked_(const struct testgroup_t *group,
@@ -64,7 +64,7 @@ index 85dfe74a720e..bf2882418eb6 100644
  
  			switch (test_ret_err) {
 diff --git a/test/tinytest.h b/test/tinytest.h
-index d321dd467542..c276b5339331 100644
+index d321dd4..c276b53 100644
 --- a/test/tinytest.h
 +++ b/test/tinytest.h
 @@ -92,7 +92,7 @@ char *tinytest_format_hex_(const void *, unsigned long);
@@ -76,6 +76,3 @@ index d321dd467542..c276b5339331 100644
  
  void tinytest_set_aliases(const struct testlist_alias_t *aliases);
  
--- 
-2.31.1
-
diff --git a/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch b/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch
index 8880bd0407..c54a2b7bb0 100644
--- a/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch
+++ b/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch
@@ -1,4 +1,7 @@
-Fix missing test directory creation.
+From c16d91420b94701065d3bdfdf96c41e0710c3bc8 Mon Sep 17 00:00:00 2001
+From: Andrej Valek <andrej.valek@siemens.com>
+Date: Tue, 25 Apr 2017 08:11:48 +0200
+Subject: [PATCH] Fix missing test directory creation.
 
 GCC used in OE-core has "dependency tracking" disabled and
 libevent has problem with this.
@@ -12,12 +15,15 @@ Workaround specific to our build system.
 
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+---
+ test/include.am | 1 +
+ 1 file changed, 1 insertion(+)
 
-diff --git a/libevent-2.1.8-stable/test/include.am b/libevent-2.1.8-stable/test/include.am
-index eea249f..d323dff 100644
+diff --git a/test/include.am b/test/include.am
+index 0437524..48c7307 100644
 --- a/test/include.am
 +++ b/test/include.am
-@@ -161,6 +161,7 @@ test_bench_httpclient_LDADD = $(LIBEVENT_GC_SECTIONS) libevent_core.la
+@@ -162,6 +162,7 @@ test_bench_httpclient_LDADD = $(LIBEVENT_GC_SECTIONS) libevent_core.la
  test/regress.gen.c test/regress.gen.h: test/rpcgen-attempted
  
  test/rpcgen-attempted: test/regress.rpc event_rpcgen.py test/rpcgen_wrapper.sh
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.13.bb
similarity index 95%
rename from meta/recipes-support/libevent/libevent_2.1.12.bb
rename to meta/recipes-support/libevent/libevent_2.1.13.bb
index 8bb6d90d70..431018f0f3 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.13.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/release-${PV}-stable/${BP}-stable.tar.gz
            file://0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch \
            "
 
-SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
+SRC_URI[sha256sum] = "f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c"
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>.+)-stable"
 
 S = "${UNPACKDIR}/${BPN}-${PV}-stable"
-- 
2.47.1


--===============0108492313038734188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libevent/libevent-core: FILELIST: removed "/usr/lib/libevent_core-2.1.so.7.0.1", added "/usr/lib/libevent_core-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent-extra: FILELIST: removed "/usr/lib/libevent_extra-2.1.so.7.0.1", added "/usr/lib/libevent_extra-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent-pthreads: FILELIST: removed "/usr/lib/libevent_pthreads-2.1.so.7.0.1", added "/usr/lib/libevent_pthreads-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent: FILELIST: removed "/usr/lib/libevent-2.1.so.7.0.1", added "/usr/lib/libevent-2.1.so.7.0.2"
Changes to packages/x86-64-v3-poky-linux/libevent (sysroot):
  /usr/lib/libevent-2.1.so.7 changed symlink target from libevent-2.1.so.7.0.1 to libevent-2.1.so.7.0.2
  /usr/lib/libevent_core-2.1.so.7 changed symlink target from libevent_core-2.1.so.7.0.1 to libevent_core-2.1.so.7.0.2
  /usr/lib/libevent_core.so changed symlink target from libevent_core-2.1.so.7.0.1 to libevent_core-2.1.so.7.0.2
  /usr/lib/libevent_extra-2.1.so.7 changed symlink target from libevent_extra-2.1.so.7.0.1 to libevent_extra-2.1.so.7.0.2
  /usr/lib/libevent_extra.so changed symlink target from libevent_extra-2.1.so.7.0.1 to libevent_extra-2.1.so.7.0.2
  /usr/lib/libevent_pthreads-2.1.so.7 changed symlink target from libevent_pthreads-2.1.so.7.0.1 to libevent_pthreads-2.1.so.7.0.2
  /usr/lib/libevent_pthreads.so changed symlink target from libevent_pthreads-2.1.so.7.0.1 to libevent_pthreads-2.1.so.7.0.2
  /usr/lib/libevent.so changed symlink target from libevent-2.1.so.7.0.1 to libevent-2.1.so.7.0.2
  /usr/lib/libevent-2.1.so.7.0.1 moved to /usr/lib/libevent-2.1.so.7.0.2
  /usr/lib/libevent_core-2.1.so.7.0.1 moved to /usr/lib/libevent_core-2.1.so.7.0.2
  /usr/lib/libevent_extra-2.1.so.7.0.1 moved to /usr/lib/libevent_extra-2.1.so.7.0.2
  /usr/lib/libevent_pthreads-2.1.so.7.0.1 moved to /usr/lib/libevent_pthreads-2.1.so.7.0.2

--===============0108492313038734188==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libevent-upgrade-2.1.12-2.1.13.patch"

RnJvbSA3ZTA5Mzg5ZTU3ZWEwYmE0M2M2ZWE2NjlkNzc2YTUzNWE2NzMxMTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMiBKdWwgMjAyNiAwNToyODo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmV2ZW50OiB1cGdyYWRlIDIuMS4xMiAtPiAyLjEuMTMKCi0tLQogLi4uc19kbnMuYy1wYXRjaC1v
dXQtdGVzdHMtdGhhdC1yZXF1aXJlLWEtd28ucGF0Y2ggfCAgOCArKysrLS0tLQogLi4ucy5oLUlu
Y3JlYXNlLWRlZmF1bHQtdGltZXZhbC10b2xlcmFuY2UtNTAucGF0Y2ggfCAgOCArKysrLS0tLQog
Li4uLXV0aWwtbW9ub3RvbmljX3ByY19mYWxsYmFjay1hcy1yZXRyaWFibGUucGF0Y2ggfCAgOSAr
KystLS0tLS0KIC4uLmUtdGVzdHMtYXJlLW1hcmtlZC1mYWlsZWQtb25seS13aGVuLWFsbC1hLnBh
dGNoIHwgIDkgKysrLS0tLS0tCiAuLi4vbGliZXZlbnQvTWFrZWZpbGUtbWlzc2luZy10ZXN0LWRp
ci5wYXRjaCAgICAgICB8IDE0ICsrKysrKysrKystLS0tCiAuLi4ve2xpYmV2ZW50XzIuMS4xMi5i
YiA9PiBsaWJldmVudF8yLjEuMTMuYmJ9ICAgICB8ICAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmV2ZW50L3tsaWJldmVudF8yLjEuMTIuYmIgPT4gbGliZXZlbnRfMi4xLjEzLmJifSAo
OTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZW50L2xpYmV2ZW50
LzAwMDEtdGVzdC1yZWdyZXNzX2Rucy5jLXBhdGNoLW91dC10ZXN0cy10aGF0LXJlcXVpcmUtYS13
by5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZW50L2xpYmV2ZW50LzAwMDEtdGVz
dC1yZWdyZXNzX2Rucy5jLXBhdGNoLW91dC10ZXN0cy10aGF0LXJlcXVpcmUtYS13by5wYXRjaApp
bmRleCA1MDUxNTNkMjg1Li5iYWI5NGExN2VjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJldmVudC9saWJldmVudC8wMDAxLXRlc3QtcmVncmVzc19kbnMuYy1wYXRjaC1vdXQt
dGVzdHMtdGhhdC1yZXF1aXJlLWEtd28ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZXZlbnQvbGliZXZlbnQvMDAwMS10ZXN0LXJlZ3Jlc3NfZG5zLmMtcGF0Y2gtb3V0LXRlc3Rz
LXRoYXQtcmVxdWlyZS1hLXdvLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3YzE3OTY3Yjhm
ZDJkMThiNzRhODkzNGZkOWJiODIxMmViZDZhMjcxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSAzNDQ0YjA0ODQ0YTBjZDc1MDUwZDE2ZTkzODI0MjdmMGY0MzFhOTQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiBEYXRlOiBUaHUsIDkgSmFuIDIwMjAgMTM6MjI6NDYgKzAxMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gdGVzdC9yZWdyZXNzX2Rucy5jOiBwYXRjaCBvdXQgdGVzdHMgdGhhdCByZXF1aXJlIGEg
d29ya2luZwpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdC9yZWdyZXNzX2Rucy5jIGIvdGVzdC9yZWdyZXNzX2Ru
cy5jCi1pbmRleCBkMjA4NGI3Li5hMWE4ZjNiIDEwMDY0NAoraW5kZXggOWE4YmZmNC4uNzQ0OWU5
NCAxMDA2NDQKIC0tLSBhL3Rlc3QvcmVncmVzc19kbnMuYwogKysrIGIvdGVzdC9yZWdyZXNzX2Ru
cy5jCi1AQCAtMjM5NCw4ICsyMzk0LDYgQEAgc3RydWN0IHRlc3RjYXNlX3QgZG5zX3Rlc3RjYXNl
c1tdID0geworQEAgLTI0NTksOCArMjQ1OSw2IEBAIHN0cnVjdCB0ZXN0Y2FzZV90IGRuc190ZXN0
Y2FzZXNbXSA9IHsKICAJeyAicmVpc3N1ZV9kaXNhYmxlX3doZW5faW5hY3RpdmUiLCBkbnNfcmVp
c3N1ZV9kaXNhYmxlX3doZW5faW5hY3RpdmVfdGVzdCwKICAJICBUVF9GT1JLfFRUX05FRURfQkFT
RXxUVF9OT19MT0dTLCAmYmFzaWNfc2V0dXAsIE5VTEwgfSwKICAJeyAiaW5mbGlnaHQiLCBkbnNf
aW5mbGlnaHRfdGVzdCwgVFRfRk9SS3xUVF9ORUVEX0JBU0UsICZiYXNpY19zZXR1cCwgTlVMTCB9
LApAQCAtMjYsNyArMjYsNyBAQCBpbmRleCBkMjA4NGI3Li5hMWE4ZjNiIDEwMDY0NAogICNpZmRl
ZiBFVkVOVF9fSEFWRV9TRVRSTElNSVQKICAJeyAiYnVmZmVyZXZlbnRfY29ubmVjdF9ob3N0bmFt
ZV9lbWZpbGUiLCB0ZXN0X2J1ZmZlcmV2ZW50X2Nvbm5lY3RfaG9zdG5hbWUsCiAgCSAgVFRfRk9S
S3xUVF9ORUVEX0JBU0UsICZiYXNpY19zZXR1cCwgKGNoYXIqKSJlbWZpbGUiIH0sCi1AQCAtMjQw
NSw4ICsyNDAzLDYgQEAgc3RydWN0IHRlc3RjYXNlX3QgZG5zX3Rlc3RjYXNlc1tdID0geworQEAg
LTI0NzAsOCArMjQ2OCw2IEBAIHN0cnVjdCB0ZXN0Y2FzZV90IGRuc190ZXN0Y2FzZXNbXSA9IHsK
ICAJeyAiZGlzYWJsZV93aGVuX2luYWN0aXZlX25vX25zIiwgZG5zX2Rpc2FibGVfd2hlbl9pbmFj
dGl2ZV9ub19uc190ZXN0LAogIAkgIFRUX0ZPUkt8VFRfTkVFRF9CQVNFfFRUX05PX0xPR1MsICZi
YXNpY19zZXR1cCwgTlVMTCB9LAogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZXZlbnQvbGliZXZlbnQvMDAwMi10ZXN0LXJlZ3Jlc3MuaC1JbmNyZWFzZS1kZWZhdWx0LXRp
bWV2YWwtdG9sZXJhbmNlLTUwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZlbnQv
bGliZXZlbnQvMDAwMi10ZXN0LXJlZ3Jlc3MuaC1JbmNyZWFzZS1kZWZhdWx0LXRpbWV2YWwtdG9s
ZXJhbmNlLTUwLnBhdGNoCmluZGV4IDBiMjBlZGEzYzAuLjY4YTg0NDY4ZDAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZW50L2xpYmV2ZW50LzAwMDItdGVzdC1yZWdyZXNz
LmgtSW5jcmVhc2UtZGVmYXVsdC10aW1ldmFsLXRvbGVyYW5jZS01MC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJldmVudC9saWJldmVudC8wMDAyLXRlc3QtcmVncmVzcy5oLUlu
Y3JlYXNlLWRlZmF1bHQtdGltZXZhbC10b2xlcmFuY2UtNTAucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGRmZjhmZDI3ZWRiMjNiYzE0ODY4MDkxODZjNmE0ZmUxZjc1ZjIxNzkgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDY0ZjJiMDM1YTEwNzNjOWY1OTQwMzZiNDY1MjFlMTlkYWMw
MjllYzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBZaSBGYW4gWXUgPHlpZmFuLnl1
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDIyIEFwciAyMDIxIDIyOjM1OjU5IC0wNDAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHRlc3QvcmVncmVzcy5oOiBJbmNyZWFzZSBkZWZhdWx0IHRpbWV2YWwg
dG9sZXJhbmNlIDUwIG1zIC0+CkBAIC0xOSwxMCArMTksMTAgQEAgU2lnbmVkLW9mZi1ieTogWWkg
RmFuIFl1IDx5aWZhbi55dUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdC9yZWdyZXNzLmggYi90
ZXN0L3JlZ3Jlc3MuaAotaW5kZXggZjA2YTc2NjkuLjgyOWFmNGE3IDEwMDY0NAoraW5kZXggNDNj
YjRlYS4uMjFjZmI1ZiAxMDA2NDQKIC0tLSBhL3Rlc3QvcmVncmVzcy5oCiArKysgYi90ZXN0L3Jl
Z3Jlc3MuaAotQEAgLTEyNyw3ICsxMjcsNyBAQCBpbnQgdGVzdF9haV9lcV8oY29uc3Qgc3RydWN0
IGV2dXRpbF9hZGRyaW5mbyAqYWksIGNvbnN0IGNoYXIgKnNvY2thZGRyX3BvcnQsCitAQCAtMTIz
LDcgKzEyMyw3IEBAIGludCB0ZXN0X2FpX2VxXyhjb25zdCBzdHJ1Y3QgZXZ1dGlsX2FkZHJpbmZv
ICphaSwgY29uc3QgY2hhciAqc29ja2FkZHJfcG9ydCwKICAJdHRfaW50X29wKGxhYnModGltZXZh
bF9tc2VjX2RpZmYoKHR2MSksICh0djIpKSAtIGRpZmYpLCA8PSwgdG9sZXJhbmNlKQogIAogICNk
ZWZpbmUgdGVzdF90aW1ldmFsX2RpZmZfZXEodHYxLCB0djIsIGRpZmYpCQkJCVwKQEAgLTMwLDQg
KzMwLDQgQEAgaW5kZXggZjA2YTc2NjkuLjgyOWFmNGE3IDEwMDY0NAogKwl0ZXN0X3RpbWV2YWxf
ZGlmZl9sZXEoKHR2MSksICh0djIpLCAoZGlmZiksIDEwMCkKICAKICBsb25nIHRpbWV2YWxfbXNl
Y19kaWZmKGNvbnN0IHN0cnVjdCB0aW1ldmFsICpzdGFydCwgY29uc3Qgc3RydWN0IHRpbWV2YWwg
KmVuZCk7Ci0KKyAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZW50L2xp
YmV2ZW50LzAwMDMtdGVzdC1tYXJrLXV0aWwtbW9ub3RvbmljX3ByY19mYWxsYmFjay1hcy1yZXRy
aWFibGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmVudC9saWJldmVudC8wMDAz
LXRlc3QtbWFyay11dGlsLW1vbm90b25pY19wcmNfZmFsbGJhY2stYXMtcmV0cmlhYmxlLnBhdGNo
CmluZGV4IGRkYzE5YzQ5NWYuLmI4M2M4M2I5NzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmV2ZW50L2xpYmV2ZW50LzAwMDMtdGVzdC1tYXJrLXV0aWwtbW9ub3RvbmljX3By
Y19mYWxsYmFjay1hcy1yZXRyaWFibGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZXZlbnQvbGliZXZlbnQvMDAwMy10ZXN0LW1hcmstdXRpbC1tb25vdG9uaWNfcHJjX2ZhbGxi
YWNrLWFzLXJldHJpYWJsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDAxYTU3YTk5ODc5
OGRhOTc3YzQ3MGYzYjhkNmE0NTdjMWFkYjE0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gOWFkMjczOTFhOTcxNTdlYjhjZWU4NGE3ZTljYzNkYzkzZGYzNGNiYiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEF6YXQgS2h1emhpbiA8YXphdEBsaWJldmVudC5vcmc+CiBEYXRl
OiBTdW4sIDE5IFNlcCAyMDIxIDAwOjU3OjMxICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3Q6
IG1hcmsgdXRpbC9tb25vdG9uaWNfcHJjX2ZhbGxiYWNrIGFzIHJldHJpYWJsZQpAQCAtMTEsMTAg
KzExLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3QvcmVncmVzc191
dGlsLmMgYi90ZXN0L3JlZ3Jlc3NfdXRpbC5jCi1pbmRleCA0NWNhYTI3MDBhNDAuLmE5ZTgwZGIy
MDE0OSAxMDA2NDQKK2luZGV4IGZkMTQ5YjMuLjEwMjQ0ZDYgMTAwNjQ0CiAtLS0gYS90ZXN0L3Jl
Z3Jlc3NfdXRpbC5jCiArKysgYi90ZXN0L3JlZ3Jlc3NfdXRpbC5jCi1AQCAtMTY3Miw3ICsxNjcy
LDcgQEAgc3RydWN0IHRlc3RjYXNlX3QgdXRpbF90ZXN0Y2FzZXNbXSA9IHsKK0BAIC0xNjc0LDcg
KzE2NzQsNyBAQCBzdHJ1Y3QgdGVzdGNhc2VfdCB1dGlsX3Rlc3RjYXNlc1tdID0gewogIAl7ICJt
b25vdG9uaWNfcmVzX2ZhbGxiYWNrIiwgdGVzdF9ldnV0aWxfbW9ub3RvbmljX3JlcywgVFRfT0ZG
X0JZX0RFRkFVTFQsICZiYXNpY19zZXR1cCwgKHZvaWQqKSJmYWxsYmFjayIgfSwKICAJeyAibW9u
b3RvbmljX3ByYyIsIHRlc3RfZXZ1dGlsX21vbm90b25pY19wcmMsIDAsICZiYXNpY19zZXR1cCwg
KHZvaWQqKSIiIH0sCiAgCXsgIm1vbm90b25pY19wcmNfcHJlY2lzZSIsIHRlc3RfZXZ1dGlsX21v
bm90b25pY19wcmMsIFRUX1JFVFJJQUJMRSwgJmJhc2ljX3NldHVwLCAodm9pZCopInByZWNpc2Ui
IH0sCkBAIC0yMyw2ICsyMywzIEBAIGluZGV4IDQ1Y2FhMjcwMGE0MC4uYTllODBkYjIwMTQ5IDEw
MDY0NAogIAl7ICJkYXRlX3JmYzExMjMiLCB0ZXN0X2V2dXRpbF9kYXRlX3JmYzExMjMsIDAsIE5V
TEwsIE5VTEwgfSwKICAJeyAiZXZ1dGlsX3Y0YWRkcl9pc19sb2NhbCIsIHRlc3RfZXZ1dGlsX3Y0
YWRkcl9pc19sb2NhbCwgMCwgTlVMTCwgTlVMTCB9LAogIAl7ICJldnV0aWxfdjZhZGRyX2lzX2xv
Y2FsIiwgdGVzdF9ldnV0aWxfdjZhZGRyX2lzX2xvY2FsLCAwLCBOVUxMLCBOVUxMIH0sCi0tLSAK
LTIuMzEuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmVudC9saWJl
dmVudC8wMDA0LXRlc3QtcmV0cmlhYmxlLXRlc3RzLWFyZS1tYXJrZWQtZmFpbGVkLW9ubHktd2hl
bi1hbGwtYS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZW50L2xpYmV2ZW50LzAw
MDQtdGVzdC1yZXRyaWFibGUtdGVzdHMtYXJlLW1hcmtlZC1mYWlsZWQtb25seS13aGVuLWFsbC1h
LnBhdGNoCmluZGV4IDI2YjcwN2FkMzEuLjRjYjJhNmQ3YmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmV2ZW50L2xpYmV2ZW50LzAwMDQtdGVzdC1yZXRyaWFibGUtdGVzdHMt
YXJlLW1hcmtlZC1mYWlsZWQtb25seS13aGVuLWFsbC1hLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmV2ZW50L2xpYmV2ZW50LzAwMDQtdGVzdC1yZXRyaWFibGUtdGVzdHMtYXJl
LW1hcmtlZC1mYWlsZWQtb25seS13aGVuLWFsbC1hLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAzNmViZDkyZmE1M2MwMDk3ZjFlMmY5ZWM1YWE1YjVjNmVjMWI0MTFkIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA1OWFiMDQ4ZjBmZTMyZmI4ZDhlNDMyMTRmOTNjMzJiNTMxNDg0MTlj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBl
cnJvdEBib290bGluLmNvbT4KIERhdGU6IFdlZCwgMjkgU2VwIDIwMjEgMTM6NTA6MzUgKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gdGVzdDogcmV0cmlhYmxlIHRlc3RzIGFyZSBtYXJrZWQgZmFpbGVk
IG9ubHkgd2hlbiBhbGwKQEAgLTE1LDcgKzE1LDcgQEAgU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
cnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3QvdGlueXRlc3Qu
YyBiL3Rlc3QvdGlueXRlc3QuYwotaW5kZXggODVkZmU3NGE3MjBlLi5iZjI4ODI0MThlYjYgMTAw
NjQ0CitpbmRleCA4NWRmZTc0Li5iZjI4ODI0IDEwMDY0NAogLS0tIGEvdGVzdC90aW55dGVzdC5j
CiArKysgYi90ZXN0L3Rpbnl0ZXN0LmMKIEBAIC0zMTAsNyArMzEwLDggQEAgdGVzdGNhc2VfcnVu
X2ZvcmtlZF8oY29uc3Qgc3RydWN0IHRlc3Rncm91cF90ICpncm91cCwKQEAgLTY0LDcgKzY0LDcg
QEAgaW5kZXggODVkZmU3NGE3MjBlLi5iZjI4ODI0MThlYjYgMTAwNjQ0CiAgCiAgCQkJc3dpdGNo
ICh0ZXN0X3JldF9lcnIpIHsKIGRpZmYgLS1naXQgYS90ZXN0L3Rpbnl0ZXN0LmggYi90ZXN0L3Rp
bnl0ZXN0LmgKLWluZGV4IGQzMjFkZDQ2NzU0Mi4uYzI3NmI1MzM5MzMxIDEwMDY0NAoraW5kZXgg
ZDMyMWRkNC4uYzI3NmI1MyAxMDA2NDQKIC0tLSBhL3Rlc3QvdGlueXRlc3QuaAogKysrIGIvdGVz
dC90aW55dGVzdC5oCiBAQCAtOTIsNyArOTIsNyBAQCBjaGFyICp0aW55dGVzdF9mb3JtYXRfaGV4
Xyhjb25zdCB2b2lkICosIHVuc2lnbmVkIGxvbmcpOwpAQCAtNzYsNiArNzYsMyBAQCBpbmRleCBk
MzIxZGQ0Njc1NDIuLmMyNzZiNTMzOTMzMSAxMDA2NDQKICAKICB2b2lkIHRpbnl0ZXN0X3NldF9h
bGlhc2VzKGNvbnN0IHN0cnVjdCB0ZXN0bGlzdF9hbGlhc190ICphbGlhc2VzKTsKICAKLS0tIAot
Mi4zMS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZW50L2xpYmV2
ZW50L01ha2VmaWxlLW1pc3NpbmctdGVzdC1kaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJldmVudC9saWJldmVudC9NYWtlZmlsZS1taXNzaW5nLXRlc3QtZGlyLnBhdGNoCmluZGV4
IDg4ODBiZDA0MDcuLmM1NGEyYjdiYjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmV2ZW50L2xpYmV2ZW50L01ha2VmaWxlLW1pc3NpbmctdGVzdC1kaXIucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZlbnQvbGliZXZlbnQvTWFrZWZpbGUtbWlzc2luZy10
ZXN0LWRpci5wYXRjaApAQCAtMSw0ICsxLDcgQEAKLUZpeCBtaXNzaW5nIHRlc3QgZGlyZWN0b3J5
IGNyZWF0aW9uLgorRnJvbSBjMTZkOTE0MjBiOTQ3MDEwNjVkM2JkZmRmOTZjNDFlMDcxMGMzYmM4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQW5kcmVqIFZhbGVrIDxhbmRyZWoudmFs
ZWtAc2llbWVucy5jb20+CitEYXRlOiBUdWUsIDI1IEFwciAyMDE3IDA4OjExOjQ4ICswMjAwCitT
dWJqZWN0OiBbUEFUQ0hdIEZpeCBtaXNzaW5nIHRlc3QgZGlyZWN0b3J5IGNyZWF0aW9uLgogCiBH
Q0MgdXNlZCBpbiBPRS1jb3JlIGhhcyAiZGVwZW5kZW5jeSB0cmFja2luZyIgZGlzYWJsZWQgYW5k
CiBsaWJldmVudCBoYXMgcHJvYmxlbSB3aXRoIHRoaXMuCkBAIC0xMiwxMiArMTUsMTUgQEAgV29y
a2Fyb3VuZCBzcGVjaWZpYyB0byBvdXIgYnVpbGQgc3lzdGVtLgogCiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZWogVmFsZWsgPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbT4KIFNpZ25lZC1vZmYtYnk6IFBh
c2NhbCBCYWNoIDxwYXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4KKy0tLQorIHRlc3QvaW5jbHVkZS5h
bSB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCi1kaWZmIC0tZ2l0IGEv
bGliZXZlbnQtMi4xLjgtc3RhYmxlL3Rlc3QvaW5jbHVkZS5hbSBiL2xpYmV2ZW50LTIuMS44LXN0
YWJsZS90ZXN0L2luY2x1ZGUuYW0KLWluZGV4IGVlYTI0OWYuLmQzMjNkZmYgMTAwNjQ0CitkaWZm
IC0tZ2l0IGEvdGVzdC9pbmNsdWRlLmFtIGIvdGVzdC9pbmNsdWRlLmFtCitpbmRleCAwNDM3NTI0
Li40OGM3MzA3IDEwMDY0NAogLS0tIGEvdGVzdC9pbmNsdWRlLmFtCiArKysgYi90ZXN0L2luY2x1
ZGUuYW0KLUBAIC0xNjEsNiArMTYxLDcgQEAgdGVzdF9iZW5jaF9odHRwY2xpZW50X0xEQUREID0g
JChMSUJFVkVOVF9HQ19TRUNUSU9OUykgbGliZXZlbnRfY29yZS5sYQorQEAgLTE2Miw2ICsxNjIs
NyBAQCB0ZXN0X2JlbmNoX2h0dHBjbGllbnRfTERBREQgPSAkKExJQkVWRU5UX0dDX1NFQ1RJT05T
KSBsaWJldmVudF9jb3JlLmxhCiAgdGVzdC9yZWdyZXNzLmdlbi5jIHRlc3QvcmVncmVzcy5nZW4u
aDogdGVzdC9ycGNnZW4tYXR0ZW1wdGVkCiAgCiAgdGVzdC9ycGNnZW4tYXR0ZW1wdGVkOiB0ZXN0
L3JlZ3Jlc3MucnBjIGV2ZW50X3JwY2dlbi5weSB0ZXN0L3JwY2dlbl93cmFwcGVyLnNoCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmVudC9saWJldmVudF8yLjEuMTIuYmIg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmVudC9saWJldmVudF8yLjEuMTMuYmIKc2ltaWxh
cml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZlbnQv
bGliZXZlbnRfMi4xLjEyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmVu
dC9saWJldmVudF8yLjEuMTMuYmIKaW5kZXggOGJiNmQ5MGQ3MC4uNDMxMDE4ZjBmMyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZlbnQvbGliZXZlbnRfMi4xLjEyLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZW50L2xpYmV2ZW50XzIuMS4xMy5iYgpAQCAt
MjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC9yZWxl
YXNlLSR7UFZ9LXN0YWJsZS8ke0JQfS1zdGFibGUudGFyLmd6CiAgICAgICAgICAgIGZpbGU6Ly8w
MDA0LXRlc3QtcmV0cmlhYmxlLXRlc3RzLWFyZS1tYXJrZWQtZmFpbGVkLW9ubHktd2hlbi1hbGwt
YS5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkyZTZkZTFi
ZTllYzE3NjQyOGZkMjM2NzY3N2U2MWNlZmZjMmVlMWNiMTE5MDM1MDM3YTI3ZDM0NmIwNDAzYmIi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjdlOTM4M2I4YzBiYWE4MWI2ODdlNWI1ZWVjYzAxYmVl
ZmFmMWIxOWI2NDE1MWQ5NWVkNjE2NDdmZTdhMzE1YyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
InJlbGVhc2VzL3RhZy9yZWxlYXNlLSg/UDxwdmVyPi4rKS1zdGFibGUiCiAKIFMgPSAiJHtVTlBB
Q0tESVJ9LyR7QlBOfS0ke1BWfS1zdGFibGUiCi0tIAoyLjQ3LjEKCg==

--===============0108492313038734188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libevent: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent: SRC_URI changed from "https://github.com/libevent/libevent/releases//download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz file://Makefile-missing-test-dir.patch file://run-ptest file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch file://0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch file://0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch" to "https://github.com/libevent/libevent/releases//download/release-2.1.13-stable/libevent-2.1.13-stable.tar.gz file://Makefile-missing-test-dir.patch file://run-ptest file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch file://0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch file://0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch"
packages/x86-64-v3-poky-linux/libevent/libevent-core: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-core: FILES: removed "/usr/lib/libevent_core-2.1.so.7.0.1", added "/usr/lib/libevent_core-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent-core: FILELIST: removed "/usr/lib/libevent_core-2.1.so.7.0.1", added "/usr/lib/libevent_core-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent-core: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent-dbg: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-dbg: PKGSIZE changed from 4673560 to 4699016 (+1%)
packages/x86-64-v3-poky-linux/libevent/libevent-dbg: FILELIST: removed "/usr/lib/.debug/libevent_extra-2.1.so.7.0.1 /usr/lib/.debug/libevent-2.1.so.7.0.1 /usr/lib/.debug/libevent_core-2.1.so.7.0.1 /usr/lib/.debug/libevent_pthreads-2.1.so.7.0.1", added "/usr/lib/.debug/libevent_core-2.1.so.7.0.2 /usr/lib/.debug/libevent-2.1.so.7.0.2 /usr/lib/.debug/libevent_extra-2.1.so.7.0.2 /usr/lib/.debug/libevent_pthreads-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent-dbg: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent-dev: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-dev: PKGSIZE changed from 376511 to 376572 (+0%)
packages/x86-64-v3-poky-linux/libevent/libevent-dev: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent-doc: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-doc: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent-extra: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-extra: FILES: removed "/usr/lib/libevent_extra-2.1.so.7.0.1", added "/usr/lib/libevent_extra-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent-extra: FILELIST: removed "/usr/lib/libevent_extra-2.1.so.7.0.1", added "/usr/lib/libevent_extra-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent-extra: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent-locale: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-locale: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent-ptest: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-ptest: PKGSIZE changed from 736246 to 744566 (+1%)
packages/x86-64-v3-poky-linux/libevent/libevent-ptest: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent-pthreads: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-pthreads: FILES: removed "/usr/lib/libevent_pthreads-2.1.so.7.0.1", added "/usr/lib/libevent_pthreads-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent-pthreads: FILELIST: removed "/usr/lib/libevent_pthreads-2.1.so.7.0.1", added "/usr/lib/libevent_pthreads-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent-pthreads: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent-src: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-src: PKGSIZE changed from 1943251 to 1951483 (+0%)
packages/x86-64-v3-poky-linux/libevent/libevent-src: FILELIST: directory renamed /usr/src/debug/libevent/2.1.12/include/event2 -> /usr/src/debug/libevent/2.1.13/include/event2, directory renamed /usr/src/debug/libevent/2.1.12 -> /usr/src/debug/libevent/2.1.13, directory renamed /usr/src/debug/libevent/2.1.12/test -> /usr/src/debug/libevent/2.1.13/test
packages/x86-64-v3-poky-linux/libevent/libevent-src: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent-staticdev: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent-staticdev: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
packages/x86-64-v3-poky-linux/libevent/libevent: PV changed from "2.1.12" to "2.1.13"
packages/x86-64-v3-poky-linux/libevent/libevent: FILELIST: removed "/usr/lib/libevent-2.1.so.7.0.1", added "/usr/lib/libevent-2.1.so.7.0.2"
packages/x86-64-v3-poky-linux/libevent/libevent: PKGV changed from 2.1.12 [default] to 2.1.13 [default]
Changes to packages/x86-64-v3-poky-linux/libevent (sysroot):
  /usr/lib/libevent-2.1.so.7 changed symlink target from libevent-2.1.so.7.0.1 to libevent-2.1.so.7.0.2
  /usr/lib/libevent_core-2.1.so.7 changed symlink target from libevent_core-2.1.so.7.0.1 to libevent_core-2.1.so.7.0.2
  /usr/lib/libevent_core.so changed symlink target from libevent_core-2.1.so.7.0.1 to libevent_core-2.1.so.7.0.2
  /usr/lib/libevent_extra-2.1.so.7 changed symlink target from libevent_extra-2.1.so.7.0.1 to libevent_extra-2.1.so.7.0.2
  /usr/lib/libevent_extra.so changed symlink target from libevent_extra-2.1.so.7.0.1 to libevent_extra-2.1.so.7.0.2
  /usr/lib/libevent_pthreads-2.1.so.7 changed symlink target from libevent_pthreads-2.1.so.7.0.1 to libevent_pthreads-2.1.so.7.0.2
  /usr/lib/libevent_pthreads.so changed symlink target from libevent_pthreads-2.1.so.7.0.1 to libevent_pthreads-2.1.so.7.0.2
  /usr/lib/libevent.so changed symlink target from libevent-2.1.so.7.0.1 to libevent-2.1.so.7.0.2
  /usr/lib/libevent-2.1.so.7.0.1 moved to /usr/lib/libevent-2.1.so.7.0.2
  /usr/lib/libevent_core-2.1.so.7.0.1 moved to /usr/lib/libevent_core-2.1.so.7.0.2
  /usr/lib/libevent_extra-2.1.so.7.0.1 moved to /usr/lib/libevent_extra-2.1.so.7.0.2
  /usr/lib/libevent_pthreads-2.1.so.7.0.1 moved to /usr/lib/libevent_pthreads-2.1.so.7.0.2

--===============0108492313038734188==--

