Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A86D60CFE
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4737.1731964680597332243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iYIyi3ZU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uZDnUHWK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934123f01b-f444633b-b07d-470a-b6b8-ac01cef0cfcb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964694;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=25Oly+fZ3zum+23pDWFj/AV48fnHKh5Ls3ZUK1yQiNM=;
	b=iYIyi3ZUjUt85qp/RXAsua3dWgOX2uIjKlMOAvxSw8M894O836ByPIj6GKYROg+N
	IaZibivRdVZwEVzCqOl7cseBEJPjPct4/Ljqs4Ar1rbACLcIaGdJnzYoMbNJjzZnEYX
	F8UqVjNElXktLaA9gGQALrst5Yf6VyeJktDnEyZI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964694;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=25Oly+fZ3zum+23pDWFj/AV48fnHKh5Ls3ZUK1yQiNM=;
	b=uZDnUHWKNhWbUHk7B91kS0c5Y/i27ElMUS8joJRPobIJ5/8yJ8cWxkAOlgUqu+0s
	q90lt0uReE6zLuKCLNLvNoSXG3+XUSohMJaj7gsyvs06x3CORiKBnEDtN9NcvBqkRWH
	VjyDCALWwIkBYUKVHt/AHECR6UoglbPDovChR+68=
Content-Type: multipart/mixed; boundary="===============0883022480821234173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] numactl: upgrading to 2.0.19 SUCCEEDED
Message-ID: <010101934123f01b-f444633b-b07d-470a-b6b8-ac01cef0cfcb-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207369

--===============0883022480821234173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *numactl* to *2.0.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-numactl-upgrade-2.0.18-2.0.19.patch
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
From fa22c3eddaa42a6ab51f0320185ad0ac4bd7621b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 18:22:50 +0000
Subject: [PATCH] numactl: upgrade 2.0.18 -> 2.0.19

---
 .../numactl/numactl/0001-define-run-test-target.patch        | 3 +--
 .../numactl/numactl/Fix-the-test-output-format.patch         | 5 ++---
 meta/recipes-support/numactl/numactl_git.bb                  | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
index 68b3e2491f..2262b5d4ff 100644
--- a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
+++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
@@ -1,4 +1,4 @@
-From a5e1fa272f294e739d6caaf629968478796ca53a Mon Sep 17 00:00:00 2001
+From e6d55a81ddcef021f720196ad88aab845644ed28 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Mon, 19 Oct 2020 14:42:11 -0700
 Subject: [PATCH] rename test target as run-test
@@ -11,7 +11,6 @@ not suitable for cross-compile environment, so rename it as run-test.
 and define test target to compile the test files.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
 ---
  Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index 8345f71d72..a529c6acd5 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From 29f811d9d381f2ab54b3c8cef77334e32970ef09 Mon Sep 17 00:00:00 2001
+From 862f2d1c9ade6683238c99f8f146cab179cf60ea Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Tue, 21 Jul 2015 02:01:22 +0900
 Subject: [PATCH] Fix the test output format
@@ -8,14 +8,13 @@ Upstream-Status: Pending
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
-
 ---
  test/regress  |  6 +++---
  test/regress2 | 11 +++++------
  2 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/test/regress b/test/regress
-index f06b22f..2fdfacb 100755
+index 1da7784..b0f06ea 100755
 --- a/test/regress
 +++ b/test/regress
 @@ -78,6 +78,7 @@ probe_hardware()
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 6c853f1966..f87c9b3e6a 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,8 +10,8 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "3871b1c42fc71bceadafd745d2eff5dddfc2d67e"
-PV = "2.0.18"
+SRCREV = "3bc85e37d5a30da6790cb7e8bb488bb8f679170f"
+PV = "2.0.19"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
-- 
2.44.1


--===============0883022480821234173==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-numactl-upgrade-2.0.18-2.0.19.patch"

RnJvbSBmYTIyYzNlZGRhYTQyYTZhYjUxZjAzMjAxODVhZDBhYzRiZDc2MjFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMTg6MjI6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
dW1hY3RsOiB1cGdyYWRlIDIuMC4xOCAtPiAyLjAuMTkKCi0tLQogLi4uL251bWFjdGwvbnVtYWN0
bC8wMDAxLWRlZmluZS1ydW4tdGVzdC10YXJnZXQucGF0Y2ggICAgICAgIHwgMyArLS0KIC4uLi9u
dW1hY3RsL251bWFjdGwvRml4LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2ggICAgICAgICB8
IDUgKystLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bF9naXQuYmIgICAg
ICAgICAgICAgICAgICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0
bC9udW1hY3RsLzAwMDEtZGVmaW5lLXJ1bi10ZXN0LXRhcmdldC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bC8wMDAxLWRlZmluZS1ydW4tdGVzdC10YXJnZXQucGF0
Y2gKaW5kZXggNjhiM2UyNDkxZi4uMjI2MmI1ZDRmZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsLzAwMDEtZGVmaW5lLXJ1bi10ZXN0LXRhcmdldC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9udW1hY3RsL251bWFjdGwvMDAwMS1kZWZpbmUt
cnVuLXRlc3QtdGFyZ2V0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhNWUxZmEyNzJmMjk0
ZTczOWQ2Y2FhZjYyOTk2ODQ3ODc5NmNhNTNhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBlNmQ1NWE4MWRkY2VmMDIxZjcyMDE5NmFkODhhYWI4NDU2NDRlZDI4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogTW9uLCAxOSBPY3QgMjAyMCAxNDo0MjoxMSAtMDcwMAogU3ViamVjdDogW1BBVENIXSByZW5h
bWUgdGVzdCB0YXJnZXQgYXMgcnVuLXRlc3QKQEAgLTExLDcgKzExLDYgQEAgbm90IHN1aXRhYmxl
IGZvciBjcm9zcy1jb21waWxlIGVudmlyb25tZW50LCBzbyByZW5hbWUgaXQgYXMgcnVuLXRlc3Qu
CiBhbmQgZGVmaW5lIHRlc3QgdGFyZ2V0IHRvIGNvbXBpbGUgdGhlIHRlc3QgZmlsZXMuCiAKIFNp
Z25lZC1vZmYtYnk6IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KLQogLS0tCiAg
TWFrZWZpbGUuYW0gfCA0ICsrKy0KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9udW1hY3RsL251
bWFjdGwvRml4LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9udW1hY3RsL251bWFjdGwvRml4LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2gKaW5k
ZXggODM0NWY3MWQ3Mi4uYTUyOWM2YWNkNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbnVtYWN0bC9udW1hY3RsL0ZpeC10aGUtdGVzdC1vdXRwdXQtZm9ybWF0LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bC9GaXgtdGhlLXRlc3Qtb3V0cHV0
LWZvcm1hdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjlmODExZDlkMzgxZjJhYjU0YjNj
OGNlZjc3MzM0ZTMyOTcwZWYwOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODYyZjJk
MWM5YWRlNjY4MzIzOGM5OWY4ZjE0NmNhYjE3OWNmNjBlYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IExpIHhpbiA8bGl4aW4uZm5zdEBjbi5mdWppdHN1LmNvbT4KIERhdGU6IFR1ZSwg
MjEgSnVsIDIwMTUgMDI6MDE6MjIgKzA5MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IHRoZSB0ZXN0
IG91dHB1dCBmb3JtYXQKQEAgLTgsMTQgKzgsMTMgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5n
CiBTaWduZWQtb2ZmLWJ5OiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiBTaWdu
ZWQtb2ZmLWJ5OiBMaSBYaW4gPGxpeGluLmZuc3RAY24uZnVqaXRzdS5jb20+CiBTaWduZWQtb2Zm
LWJ5OiBYaWFuZ3l1IENoZW4gPHhpYW5neXUuY2hlbkB3aW5kcml2ZXIuY29tPgotCiAtLS0KICB0
ZXN0L3JlZ3Jlc3MgIHwgIDYgKysrLS0tCiAgdGVzdC9yZWdyZXNzMiB8IDExICsrKysrLS0tLS0t
CiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiAKIGRp
ZmYgLS1naXQgYS90ZXN0L3JlZ3Jlc3MgYi90ZXN0L3JlZ3Jlc3MKLWluZGV4IGYwNmIyMmYuLjJm
ZGZhY2IgMTAwNzU1CitpbmRleCAxZGE3Nzg0Li5iMGYwNmVhIDEwMDc1NQogLS0tIGEvdGVzdC9y
ZWdyZXNzCiArKysgYi90ZXN0L3JlZ3Jlc3MKIEBAIC03OCw2ICs3OCw3IEBAIHByb2JlX2hhcmR3
YXJlKCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bF9n
aXQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9udW1hY3RsL251bWFjdGxfZ2l0LmJiCmluZGV4
IDZjODUzZjE5NjYuLmY4N2M5YjNlNmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L251bWFjdGwvbnVtYWN0bF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0
bC9udW1hY3RsX2dpdC5iYgpAQCAtMTAsOCArMTAsOCBAQCBpbmhlcml0IGF1dG90b29scy1icm9r
ZW5zZXAgcHRlc3QKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLm1kO2JlZ2lu
bGluZT0xOTtlbmRsaW5lPTMyO21kNT05ZjM0YzNhZjRlZDZmM2Y1ZGYwZGE1ZjNjMDgzNWE0MyIK
IAotU1JDUkVWID0gIjM4NzFiMWM0MmZjNzFiY2VhZGFmZDc0NWQyZWZmNWRkZGZjMmQ2N2UiCi1Q
ViA9ICIyLjAuMTgiCitTUkNSRVYgPSAiM2JjODVlMzdkNWEzMGRhNjc5MGNiN2U4YmI0ODhiYjhm
Njc5MTcwZiIKK1BWID0gIjIuMC4xOSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL251
bWFjdGwvbnVtYWN0bDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAg
ZmlsZTovL0ZpeC10aGUtdGVzdC1vdXRwdXQtZm9ybWF0LnBhdGNoIFwKLS0gCjIuNDQuMQoK

--===============0883022480821234173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/numactl: PKGV changed from 2.0.18 [default] to 2.0.19 [default]
packages/core2-64-poky-linux/numactl: PV changed from "2.0.18" to "2.0.19"
packages/core2-64-poky-linux/numactl/numactl-dbg: PKGSIZE changed from 724032 to 726768 (+0%)
packages/core2-64-poky-linux/numactl/numactl-dbg: PKGV changed from 2.0.18 [default] to 2.0.19 [default]
packages/core2-64-poky-linux/numactl/numactl-dbg: PV changed from "2.0.18" to "2.0.19"
packages/core2-64-poky-linux/numactl/numactl-dev: PKGSIZE changed from 17644 to 17814 (+1%)
packages/core2-64-poky-linux/numactl/numactl-dev: PKGV changed from 2.0.18 [default] to 2.0.19 [default]
packages/core2-64-poky-linux/numactl/numactl-dev: PV changed from "2.0.18" to "2.0.19"
packages/core2-64-poky-linux/numactl/numactl-doc: PKGSIZE changed from 57254 to 57754 (+1%)
packages/core2-64-poky-linux/numactl/numactl-doc: PKGV changed from 2.0.18 [default] to 2.0.19 [default]
packages/core2-64-poky-linux/numactl/numactl-doc: PV changed from "2.0.18" to "2.0.19"
packages/core2-64-poky-linux/numactl/numactl-locale: PKGV changed from 2.0.18 [default] to 2.0.19 [default]
packages/core2-64-poky-linux/numactl/numactl-locale: PV changed from "2.0.18" to "2.0.19"
packages/core2-64-poky-linux/numactl/numactl-ptest: PKGSIZE changed from 251439 to 251473 (+0%)
packages/core2-64-poky-linux/numactl/numactl-ptest: PKGV changed from 2.0.18 [default] to 2.0.19 [default]
packages/core2-64-poky-linux/numactl/numactl-ptest: PV changed from "2.0.18" to "2.0.19"
packages/core2-64-poky-linux/numactl/numactl-src: PKGSIZE changed from 242814 to 243575 (+0%)
packages/core2-64-poky-linux/numactl/numactl-src: PKGV changed from 2.0.18 [default] to 2.0.19 [default]
packages/core2-64-poky-linux/numactl/numactl-src: PV changed from "2.0.18" to "2.0.19"
packages/core2-64-poky-linux/numactl/numactl-staticdev: PKGV changed from 2.0.18 [default] to 2.0.19 [default]
packages/core2-64-poky-linux/numactl/numactl-staticdev: PV changed from "2.0.18" to "2.0.19"
packages/core2-64-poky-linux/numactl/numactl: PKGSIZE changed from 223136 to 222032 (-0%)
packages/core2-64-poky-linux/numactl/numactl: PKGV changed from 2.0.18 [default] to 2.0.19 [default]
packages/core2-64-poky-linux/numactl/numactl: PV changed from "2.0.18" to "2.0.19"

--===============0883022480821234173==--

