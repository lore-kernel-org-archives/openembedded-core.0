Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAEFCD12C0
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1993.1711994601512053514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eMoZ53OI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sppXXC7u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e9ad486c1-d9aabc99-9f4e-4080-8a6d-0f3a30afff16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0tP3qWxUAb930E5fqVKF+KJ5Uaq2IrdaJhBNAv7ACrc=;
	b=eMoZ53OIm9XM39jjWi7ztQFNgkNyYOjTT8T8aYdkHgKGR/pFV+JaJ3sOA6Pr7Kpp
	38o9J78dqSFv6xm3ilUqqY96aSAtoUHtUf1e8K6WL13xztOXbcyQjQn0GcZd7VXkUPK
	65tU/IqxcV0b8h5YXnf9H/H9AdIFGojdly5IeV2I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0tP3qWxUAb930E5fqVKF+KJ5Uaq2IrdaJhBNAv7ACrc=;
	b=sppXXC7unNvvochDjFD7KsIYEQjwX45dbHzA1sHvWSRGbccc/TuBTtgZfQX9+VPi
	AN3QFELLEW5DRiqpA78ZXLK2y3yX8Ks3RTa+OIDffTSelCu4Bk5x41dPfcxoXC1n0Nz
	RwZa0HgsnmSCrXqk+BoAVkS5PyTjN5kXNmoUZCYc=
Content-Type: multipart/mixed; boundary="===============3785278769983272568=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] babeltrace2: upgrading to 2.0.6 SUCCEEDED
Message-ID: <0101018e9ad486c1-d9aabc99-9f4e-4080-8a6d-0f3a30afff16-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197772

--===============3785278769983272568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *babeltrace2* to *2.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-babeltrace2-upgrade-2.0.5-2.0.6.patch
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
From 7356f798dd8933a32959da15e7d6ce9ef47dec18 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 15:26:39 +0000
Subject: [PATCH] babeltrace2: upgrade 2.0.5 -> 2.0.6

---
 .../babeltrace2/0001-Make-manpages-multilib-identical.patch | 5 +----
 ...0001-tests-do-not-run-test-applications-from-.libs.patch | 6 +-----
 .../lttng/{babeltrace2_2.0.5.bb => babeltrace2_2.0.6.bb}    | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.5.bb => babeltrace2_2.0.6.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index 2401b176e6..bdd8c4f469 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -1,4 +1,4 @@
-From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
+From 0a64e936f80e93eb8dd5983d82a4a45186376c3f Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Mon, 9 Mar 2020 21:10:35 +0000
 Subject: [PATCH] Make manpages multilib identical
@@ -23,6 +23,3 @@ index ad1183f1..e11c7031 100644
  babeltrace_version="@PACKAGE_VERSION@"
  enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
  defrdport=5344
--- 
-2.24.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
index 805dde8064..694751dcd9 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
@@ -1,5 +1,4 @@
-From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
-Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com>
+From 310b1243801667fb06dc9f23f4ad8291d3dd28bc Mon Sep 17 00:00:00 2001
 From: Anders Wallin <wallinux@gmail.com>
 Date: Thu, 5 Mar 2020 11:20:04 +0100
 Subject: [PATCH] tests: do not run test applications from .libs
@@ -23,6 +22,3 @@ index 652c90cc..1f817c50 100755
  
 -"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
 +"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
index 9a4007fb25..d6c75d7580 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=http
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
            "
-SRCREV = "66e76d1ea601705928899138f02730a3a2a3153d"
+SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============3785278769983272568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 8656160 to 8656824 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PKGSIZE changed from 1185993 to 1186263 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 395480 to 399255 (+1%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGSIZE changed from 11368263 to 11370118 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PKGSIZE changed from 5376938 to 5377544 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2: PV changed from "2.0.5" to "2.0.6"

--===============3785278769983272568==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.0.5-2.0.6.patch"

RnJvbSA3MzU2Zjc5OGRkODkzM2EzMjk1OWRhMTVlN2Q2Y2U5ZWY0N2RlYzE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNToyNjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
YmVsdHJhY2UyOiB1cGdyYWRlIDIuMC41IC0+IDIuMC42CgotLS0KIC4uLi9iYWJlbHRyYWNlMi8w
MDAxLU1ha2UtbWFucGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoIHwgNSArLS0tLQogLi4u
MDAwMS10ZXN0cy1kby1ub3QtcnVuLXRlc3QtYXBwbGljYXRpb25zLWZyb20tLmxpYnMucGF0Y2gg
fCA2ICstLS0tLQogLi4uL2x0dG5nL3tiYWJlbHRyYWNlMl8yLjAuNS5iYiA9PiBiYWJlbHRyYWNl
Ml8yLjAuNi5iYn0gICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy97YmFiZWx0
cmFjZTJfMi4wLjUuYmIgPT4gYmFiZWx0cmFjZTJfMi4wLjYuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtbWFucGFn
ZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9i
YWJlbHRyYWNlMi8wMDAxLU1ha2UtbWFucGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoCmlu
ZGV4IDI0MDFiMTc2ZTYuLmJkZDhjNGY0NjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNh
bC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEt
TWFrZS1tYW5wYWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDU2OTg2MTkwZTRiMGMxMDk0NWNlNmFhYTdjYTEwZDZiZDhhMjZhMzkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDBhNjRlOTM2ZjgwZTkzZWI4ZGQ1OTgzZDgyYTRhNDUxODYzNzZj
M2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxt
YW5AbXZpc3RhLmNvbT4KIERhdGU6IE1vbiwgOSBNYXIgMjAyMCAyMToxMDozNSArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBNYWtlIG1hbnBhZ2VzIG11bHRpbGliIGlkZW50aWNhbApAQCAtMjMsNiAr
MjMsMyBAQCBpbmRleCBhZDExODNmMS4uZTExYzcwMzEgMTAwNjQ0CiAgYmFiZWx0cmFjZV92ZXJz
aW9uPSJAUEFDS0FHRV9WRVJTSU9OQCIKICBlbmFibGVfZGVidWdfaW5mbz0iQEVOQUJMRV9ERUJV
R19JTkZPX1ZBTEAiCiAgZGVmcmRwb3J0PTUzNDQKLS0tIAotMi4yNC4xCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1kby1ub3Qt
cnVuLXRlc3QtYXBwbGljYXRpb25zLWZyb20tLmxpYnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtZG8tbm90LXJ1bi10ZXN0LWFwcGxpY2F0
aW9ucy1mcm9tLS5saWJzLnBhdGNoCmluZGV4IDgwNWRkZTgwNjQuLjY5NDc1MWRjZDkgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1k
by1ub3QtcnVuLXRlc3QtYXBwbGljYXRpb25zLWZyb20tLmxpYnMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLWRvLW5vdC1ydW4tdGVz
dC1hcHBsaWNhdGlvbnMtZnJvbS0ubGlicy5wYXRjaApAQCAtMSw1ICsxLDQgQEAKLUZyb20gNTgy
NzEzY2M5YTAxMzQ4MWVlZWYyNTMxOTVkNjQ0MDIwZjYzN2VjNCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKLU1lc3NhZ2UtSWQ6IDw1ODI3MTNjYzlhMDEzNDgxZWVlZjI1MzE5NWQ2NDQwMjBmNjM3
ZWM0LjE1ODM0MDM2MjIuZ2l0LndhbGxpbnV4QGdtYWlsLmNvbT4KK0Zyb20gMzEwYjEyNDM4MDE2
NjdmYjA2ZGM5ZjIzZjRhZDgyOTFkM2RkMjhiYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFuZGVycyBXYWxsaW4gPHdhbGxpbnV4QGdtYWlsLmNvbT4KIERhdGU6IFRodSwgNSBNYXIg
MjAyMCAxMToyMDowNCArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogZG8gbm90IHJ1biB0
ZXN0IGFwcGxpY2F0aW9ucyBmcm9tIC5saWJzCkBAIC0yMyw2ICsyMiwzIEBAIGluZGV4IDY1MmM5
MGNjLi4xZjgxN2M1MCAxMDA3NTUKICAKIC0iJHtCVF9URVNUU19CVUlMRERJUn0vbGliL3BsdWdp
biIgIiR7QlRfVEVTVFNfQlVJTERESVJ9L2xpYi90ZXN0LXBsdWdpbi1wbHVnaW5zLy5saWJzIgog
KyIke0JUX1RFU1RTX0JVSUxERElSfS9saWIvcGx1Z2luIiAiJHtCVF9URVNUU19CVUlMRERJUn0v
bGliL3Rlc3QtcGx1Z2luLXBsdWdpbnMiCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMC41LmJiIGIvbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjAuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMC41LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMC42LmJi
CmluZGV4IDlhNDAwN2ZiMjUuLmQ2Yzc1ZDc1ODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4wLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5l
bC9sdHRuZy9iYWJlbHRyYWNlMl8yLjAuNi5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0g
ImdpdDovL2dpdC5lZmZpY2lvcy5jb20vYmFiZWx0cmFjZS5naXQ7YnJhbmNoPXN0YWJsZS0yLjA7
cHJvdG9jb2w9aHR0cAogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy1kby1ub3QtcnVuLXRl
c3QtYXBwbGljYXRpb25zLWZyb20tLmxpYnMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaCBcCiAgICAgICAgICAgICIK
LVNSQ1JFViA9ICI2NmU3NmQxZWE2MDE3MDU5Mjg4OTkxMzhmMDI3MzBhM2EyYTMxNTNkIgorU1JD
UkVWID0gIjBhNjYzMmY3NzgwMWYzMjE4YTI4ODYwNGM2NDZmOGEzOWNiMGQyYzQiCiBVUFNUUkVB
TV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+MihcLlxkKykrKSQiCiAKIFMgPSAiJHtX
T1JLRElSfS9naXQiCi0tIAoyLjQyLjAKCg==

--===============3785278769983272568==--

