Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434F6C3DA61
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.13585.1713248038243705258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XywMhtxz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cY2Tc7xv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58a9d57-c1d3f408-d040-4831-88a0-c32f3c803d6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FLcfjzXTnb45OXJyUwKdGYe2ByPasbAF5R4Qj3pnm3Q=;
	b=XywMhtxzG/drD4dkp7tVQoCi08tDPAZ84dyPgnU9BKLih0pgted7Fccv94DpMs/g
	u0bj33D9MBcO27w+caoqbKdNlVDD/w4BegcRPgPnBVYUhZ45i1Z69awFTi/XueK08Q1
	vjDPhDaZU9KWynZkbCILAXu4bAfF74iQwzKFEB/8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FLcfjzXTnb45OXJyUwKdGYe2ByPasbAF5R4Qj3pnm3Q=;
	b=cY2Tc7xvsP8k3NPFPHJVonOpGwsoVSmkC1OrUEznQZsVcqfebLuvtieE8sHh8rDJ
	1NcOWifoSpvPZI/rZgZy4GNSFFej5BNvaVzGFLkdJZFotCQaBTYOlglq2jtS5tXtgDf
	3AC5uSzoTez5zfU0K3NQEoI0aH1z+rpBE8YGEdWg=
Content-Type: multipart/mixed; boundary="===============4754854725782186002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] babeltrace2: upgrading to 2.0.6 SUCCEEDED
Message-ID: <0101018ee58a9d57-c1d3f408-d040-4831-88a0-c32f3c803d6c-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198386

--===============4754854725782186002==
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
From bafb315f4cbf50f76239edbbcbae5660a72b48da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 01:15:40 +0000
Subject: [PATCH] babeltrace2: upgrade 2.0.5 -> 2.0.6

---
 .../babeltrace2/0001-Make-manpages-multilib-identical.patch | 5 +----
 ...0001-tests-do-not-run-test-applications-from-.libs.patch | 6 +-----
 .../lttng/{babeltrace2_2.0.5.bb => babeltrace2_2.0.6.bb}    | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.5.bb => babeltrace2_2.0.6.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index 2401b176e6..db6336b3c5 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -1,4 +1,4 @@
-From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
+From ae767a9421fb44b1a3eb1e68c41113d89a92452d Mon Sep 17 00:00:00 2001
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
index 805dde8064..43716a2d1b 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
@@ -1,5 +1,4 @@
-From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
-Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com>
+From 4d454a275f6d6f0d2c6813856320dd0f0eb20b03 Mon Sep 17 00:00:00 2001
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


--===============4754854725782186002==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.0.5-2.0.6.patch"

RnJvbSBiYWZiMzE1ZjRjYmY1MGY3NjIzOWVkYmJjYmFlNTY2MGE3MmI0OGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDE6MTU6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YWJlbHRyYWNlMjogdXBncmFkZSAyLjAuNSAtPiAyLjAuNgoKLS0tCiAuLi4vYmFiZWx0cmFjZTIv
MDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaCB8IDUgKy0tLS0KIC4u
LjAwMDEtdGVzdHMtZG8tbm90LXJ1bi10ZXN0LWFwcGxpY2F0aW9ucy1mcm9tLS5saWJzLnBhdGNo
IHwgNiArLS0tLS0KIC4uLi9sdHRuZy97YmFiZWx0cmFjZTJfMi4wLjUuYmIgPT4gYmFiZWx0cmFj
ZTJfMi4wLjYuYmJ9ICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcve2JhYmVs
dHJhY2UyXzIuMC41LmJiID0+IGJhYmVsdHJhY2UyXzIuMC42LmJifSAoOTglKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1NYWtlLW1hbnBh
Z2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcv
YmFiZWx0cmFjZTIvMDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaApp
bmRleCAyNDAxYjE3NmU2Li5kYjYzMzZiM2M1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1tYW5wYWdlcy1tdWx0aWxpYi1pZGVudGlj
YWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAx
LU1ha2UtbWFucGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA1Njk4NjE5MGU0YjBjMTA5NDVjZTZhYWE3Y2ExMGQ2YmQ4YTI2YTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBhZTc2N2E5NDIxZmI0NGIxYTNlYjFlNjhjNDExMTNkODlhOTI0
NTJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhs
bWFuQG12aXN0YS5jb20+CiBEYXRlOiBNb24sIDkgTWFyIDIwMjAgMjE6MTA6MzUgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gTWFrZSBtYW5wYWdlcyBtdWx0aWxpYiBpZGVudGljYWwKQEAgLTIzLDYg
KzIzLDMgQEAgaW5kZXggYWQxMTgzZjEuLmUxMWM3MDMxIDEwMDY0NAogIGJhYmVsdHJhY2VfdmVy
c2lvbj0iQFBBQ0tBR0VfVkVSU0lPTkAiCiAgZW5hYmxlX2RlYnVnX2luZm89IkBFTkFCTEVfREVC
VUdfSU5GT19WQUxAIgogIGRlZnJkcG9ydD01MzQ0Ci0tLSAKLTIuMjQuMQotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtZG8tbm90
LXJ1bi10ZXN0LWFwcGxpY2F0aW9ucy1mcm9tLS5saWJzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtl
cm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLWRvLW5vdC1ydW4tdGVzdC1hcHBsaWNh
dGlvbnMtZnJvbS0ubGlicy5wYXRjaAppbmRleCA4MDVkZGU4MDY0Li40MzcxNmEyZDFiIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMt
ZG8tbm90LXJ1bi10ZXN0LWFwcGxpY2F0aW9ucy1mcm9tLS5saWJzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1kby1ub3QtcnVuLXRl
c3QtYXBwbGljYXRpb25zLWZyb20tLmxpYnMucGF0Y2gKQEAgLTEsNSArMSw0IEBACi1Gcm9tIDU4
MjcxM2NjOWEwMTM0ODFlZWVmMjUzMTk1ZDY0NDAyMGY2MzdlYzQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCi1NZXNzYWdlLUlkOiA8NTgyNzEzY2M5YTAxMzQ4MWVlZWYyNTMxOTVkNjQ0MDIwZjYz
N2VjNC4xNTgzNDAzNjIyLmdpdC53YWxsaW51eEBnbWFpbC5jb20+CitGcm9tIDRkNDU0YTI3NWY2
ZDZmMGQyYzY4MTM4NTYzMjBkZDBmMGViMjBiMDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbmRlcnMgV2FsbGluIDx3YWxsaW51eEBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDUgTWFy
IDIwMjAgMTE6MjA6MDQgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGRvIG5vdCBydW4g
dGVzdCBhcHBsaWNhdGlvbnMgZnJvbSAubGlicwpAQCAtMjMsNiArMjIsMyBAQCBpbmRleCA2NTJj
OTBjYy4uMWY4MTdjNTAgMTAwNzU1CiAgCiAtIiR7QlRfVEVTVFNfQlVJTERESVJ9L2xpYi9wbHVn
aW4iICIke0JUX1RFU1RTX0JVSUxERElSfS9saWIvdGVzdC1wbHVnaW4tcGx1Z2lucy8ubGlicyIK
ICsiJHtCVF9URVNUU19CVUlMRERJUn0vbGliL3BsdWdpbiIgIiR7QlRfVEVTVFNfQlVJTERESVJ9
L2xpYi90ZXN0LXBsdWdpbi1wbHVnaW5zIgotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjAuNS5iYiBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4wLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjAuNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjAuNi5i
YgppbmRleCA5YTQwMDdmYjI1Li5kNmM3NWQ3NTgwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
a2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4wLjYuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXQuZWZmaWNpb3MuY29tL2JhYmVsdHJhY2UuZ2l0O2JyYW5jaD1zdGFibGUtMi4w
O3Byb3RvY29sPWh0dHAKICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMtZG8tbm90LXJ1bi10
ZXN0LWFwcGxpY2F0aW9ucy1mcm9tLS5saWJzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAw
MDEtTWFrZS1tYW5wYWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNSRVYgPSAiNjZlNzZkMWVhNjAxNzA1OTI4ODk5MTM4ZjAyNzMwYTNhMmEzMTUzZCIKK1NS
Q1JFViA9ICIwYTY2MzJmNzc4MDFmMzIxOGEyODg2MDRjNjQ2ZjhhMzljYjBkMmM0IgogVVBTVFJF
QU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPjIoXC5cZCspKykkIgogCiBTID0gIiR7
V09SS0RJUn0vZ2l0IgotLSAKMi40Mi4wCgo=

--===============4754854725782186002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 8656160 to 8656824 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-dev: PKGSIZE changed from 1185993 to 1186263 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 395480 to 399255 (+1%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-ptest: PKGSIZE changed from 11368263 to 11370118 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2-src: PKGSIZE changed from 5376938 to 5377544 (+0%)
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-64-poky-linux/babeltrace2: PV changed from "2.0.5" to "2.0.6"
packages/core2-64-poky-linux/babeltrace2: PKGV changed from 2.0.5 [default] to 2.0.6 [default]

--===============4754854725782186002==--

