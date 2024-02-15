Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FEDC48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20351.1708018348820367801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L0DNZA/M;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Iq6z/Wr7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dadd3ad8b-d27eb9a8-f4ba-4cc4-84bb-b63d301f8c93-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8ymmzJMcLmT3vMiuTklzBkbA6legpYWt9vC8kLqKwts=;
	b=L0DNZA/M0uMTsj6yPPumUOlLTHQPp91YufZGGKydIP+LfX/ow+XqbekBV99NDcuU
	lTMxpbZ/dLQG3AYipdHYstz09f0o7ZcR/G3gk1NNTz29o4YwuuNXHwS6HeVwLDvGhcJ
	5QEr2UaWBCD2DMwjLWHjIAdkXPdABx2TrPHPm28U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8ymmzJMcLmT3vMiuTklzBkbA6legpYWt9vC8kLqKwts=;
	b=Iq6z/Wr7iW46v5UFU9eanoUFPA1hE7+qaNP5/AoBE1DWWVoWkAUBQ9OWeBA57te+
	r9+nzn7/j6gkq5H60XWcZs1BwCAYpaRCEv0Gvz9Yj3WzMcW82YonVzc5QPSKzrSRc6P
	IrBwnFTEEmGymwS8ARBMW4ZIHafScdYL1zIDs/Yw=
Content-Type: multipart/mixed; boundary="===============5045937399365227282=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] numactl: upgrading to 2.0.18 SUCCEEDED
Message-ID: <0101018dadd3ad8b-d27eb9a8-f4ba-4cc4-84bb-b63d301f8c93-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195685

--===============5045937399365227282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *numactl* to *2.0.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-numactl-upgrade-2.0.17-2.0.18.patch
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
From f2de26b265797b2250859ce73e96849fd883cb18 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 17:21:56 +0000
Subject: [PATCH] numactl: upgrade 2.0.17 -> 2.0.18

---
 .../numactl/numactl/0001-define-run-test-target.patch     | 8 ++++++--
 .../numactl/numactl/Fix-the-test-output-format.patch      | 3 ++-
 meta/recipes-support/numactl/numactl_git.bb               | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
index 185dcb3e2d..6da1db97d2 100644
--- a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
+++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
@@ -1,4 +1,7 @@
-rename test target as run-test
+From cdee7a5b111af415c9b3d24e2a4b840ba2e89061 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Mon, 19 Oct 2020 14:42:11 -0700
+Subject: [PATCH] rename test target as run-test
 
 Upstream-Status: Pending
 
@@ -8,12 +11,13 @@ not suitable for cross-compile environment, so rename it as run-test.
 and define test target to compile the test files.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
  Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index e84b21e..94a8bff 100644
+index da01d27..c738b93 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -126,7 +126,9 @@ regress2: $(check_PROGRAMS)
diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index 00c4f9dfcb..e156ae95a3 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00 2001
+From 7c75a1fe5b0559e8eb7dc677d853feaae1404ba5 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Tue, 21 Jul 2015 02:01:22 +0900
 Subject: [PATCH] Fix the test output format
@@ -8,6 +8,7 @@ Upstream-Status: Pending
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
 ---
  test/regress  |  6 +++---
  test/regress2 | 11 +++++------
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index bc5b09fc82..bd16df91ec 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,8 +10,8 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "c1165896572b74e971d817909bf652066ddf801a"
-PV = "2.0.17"
+SRCREV = "3871b1c42fc71bceadafd745d2eff5dddfc2d67e"
+PV = "2.0.18"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
-- 
2.42.0


--===============5045937399365227282==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-numactl-upgrade-2.0.17-2.0.18.patch"

RnJvbSBmMmRlMjZiMjY1Nzk3YjIyNTA4NTljZTczZTk2ODQ5ZmQ4ODNjYjE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTc6MjE6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
dW1hY3RsOiB1cGdyYWRlIDIuMC4xNyAtPiAyLjAuMTgKCi0tLQogLi4uL251bWFjdGwvbnVtYWN0
bC8wMDAxLWRlZmluZS1ydW4tdGVzdC10YXJnZXQucGF0Y2ggICAgIHwgOCArKysrKystLQogLi4u
L251bWFjdGwvbnVtYWN0bC9GaXgtdGhlLXRlc3Qtb3V0cHV0LWZvcm1hdC5wYXRjaCAgICAgIHwg
MyArKy0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bF9naXQuYmIgICAgICAg
ICAgICAgICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVt
YWN0bC8wMDAxLWRlZmluZS1ydW4tdGVzdC10YXJnZXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9udW1hY3RsL251bWFjdGwvMDAwMS1kZWZpbmUtcnVuLXRlc3QtdGFyZ2V0LnBhdGNoCmlu
ZGV4IDE4NWRjYjNlMmQuLjZkYTFkYjk3ZDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L251bWFjdGwvbnVtYWN0bC8wMDAxLWRlZmluZS1ydW4tdGVzdC10YXJnZXQucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsLzAwMDEtZGVmaW5lLXJ1bi10
ZXN0LXRhcmdldC5wYXRjaApAQCAtMSw0ICsxLDcgQEAKLXJlbmFtZSB0ZXN0IHRhcmdldCBhcyBy
dW4tdGVzdAorRnJvbSBjZGVlN2E1YjExMWFmNDE1YzliM2QyNGUyYTRiODQwYmEyZTg5MDYxIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2
ZXIuY29tPgorRGF0ZTogTW9uLCAxOSBPY3QgMjAyMCAxNDo0MjoxMSAtMDcwMAorU3ViamVjdDog
W1BBVENIXSByZW5hbWUgdGVzdCB0YXJnZXQgYXMgcnVuLXRlc3QKIAogVXBzdHJlYW0tU3RhdHVz
OiBQZW5kaW5nCiAKQEAgLTgsMTIgKzExLDEzIEBAIG5vdCBzdWl0YWJsZSBmb3IgY3Jvc3MtY29t
cGlsZSBlbnZpcm9ubWVudCwgc28gcmVuYW1lIGl0IGFzIHJ1bi10ZXN0LgogYW5kIGRlZmluZSB0
ZXN0IHRhcmdldCB0byBjb21waWxlIHRoZSB0ZXN0IGZpbGVzLgogCiBTaWduZWQtb2ZmLWJ5OiBS
b3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CisKIC0tLQogIE1ha2VmaWxlLmFtIHwg
NCArKystCiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5hbQotaW5kZXggZTg0YjIxZS4u
OTRhOGJmZiAxMDA2NDQKK2luZGV4IGRhMDFkMjcuLmM3MzhiOTMgMTAwNjQ0CiAtLS0gYS9NYWtl
ZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KIEBAIC0xMjYsNyArMTI2LDkgQEAgcmVncmVzczI6
ICQoY2hlY2tfUFJPR1JBTVMpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9udW1h
Y3RsL251bWFjdGwvRml4LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9udW1hY3RsL251bWFjdGwvRml4LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0
Y2gKaW5kZXggMDBjNGY5ZGZjYi4uZTE1NmFlOTVhMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsL0ZpeC10aGUtdGVzdC1vdXRwdXQtZm9ybWF0LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bC9GaXgtdGhlLXRlc3Qt
b3V0cHV0LWZvcm1hdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTlmZDc1MGE4NGJiZTU4
NzRkZWM5MzZkMmJlZTllZjExYTFiNjUwNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
N2M3NWExZmU1YjA1NTllOGViN2RjNjc3ZDg1M2ZlYWFlMTQwNGJhNSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IExpIHhpbiA8bGl4aW4uZm5zdEBjbi5mdWppdHN1LmNvbT4KIERhdGU6
IFR1ZSwgMjEgSnVsIDIwMTUgMDI6MDE6MjIgKzA5MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IHRo
ZSB0ZXN0IG91dHB1dCBmb3JtYXQKQEAgLTgsNiArOCw3IEBAIFVwc3RyZWFtLVN0YXR1czogUGVu
ZGluZwogU2lnbmVkLW9mZi1ieTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2ZXIuY29tPgog
U2lnbmVkLW9mZi1ieTogTGkgWGluIDxsaXhpbi5mbnN0QGNuLmZ1aml0c3UuY29tPgogU2lnbmVk
LW9mZi1ieTogWGlhbmd5dSBDaGVuIDx4aWFuZ3l1LmNoZW5Ad2luZHJpdmVyLmNvbT4KKwogLS0t
CiAgdGVzdC9yZWdyZXNzICB8ICA2ICsrKy0tLQogIHRlc3QvcmVncmVzczIgfCAxMSArKysrKy0t
LS0tLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsX2dp
dC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bF9naXQuYmIKaW5kZXgg
YmM1YjA5ZmM4Mi4uYmQxNmRmOTFlYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bnVtYWN0bC9udW1hY3RsX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9udW1hY3Rs
L251bWFjdGxfZ2l0LmJiCkBAIC0xMCw4ICsxMCw4IEBAIGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tl
bnNlcCBwdGVzdAogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUubWQ7YmVnaW5s
aW5lPTE5O2VuZGxpbmU9MzI7bWQ1PTlmMzRjM2FmNGVkNmYzZjVkZjBkYTVmM2MwODM1YTQzIgog
Ci1TUkNSRVYgPSAiYzExNjU4OTY1NzJiNzRlOTcxZDgxNzkwOWJmNjUyMDY2ZGRmODAxYSIKLVBW
ID0gIjIuMC4xNyIKK1NSQ1JFViA9ICIzODcxYjFjNDJmYzcxYmNlYWRhZmQ3NDVkMmVmZjVkZGRm
YzJkNjdlIgorUFYgPSAiMi4wLjE4IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbnVt
YWN0bC9udW1hY3RsO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBm
aWxlOi8vRml4LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2ggXAotLSAKMi40Mi4wCgo=

--===============5045937399365227282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/numactl: PV changed from "2.0.17" to "2.0.18"
packages/core2-64-poky-linux/numactl: PKGV changed from 2.0.17 [default] to 2.0.18 [default]
packages/core2-64-poky-linux/numactl/numactl-dbg: PV changed from "2.0.17" to "2.0.18"
packages/core2-64-poky-linux/numactl/numactl-dbg: PKGV changed from 2.0.17 [default] to 2.0.18 [default]
packages/core2-64-poky-linux/numactl/numactl-dbg: PKGSIZE changed from 737512 to 739840 (+0%)
packages/core2-64-poky-linux/numactl/numactl-dev: PV changed from "2.0.17" to "2.0.18"
packages/core2-64-poky-linux/numactl/numactl-dev: PKGV changed from 2.0.17 [default] to 2.0.18 [default]
packages/core2-64-poky-linux/numactl/numactl-dev: PKGSIZE changed from 17244 to 17644 (+2%)
packages/core2-64-poky-linux/numactl/numactl-doc: PV changed from "2.0.17" to "2.0.18"
packages/core2-64-poky-linux/numactl/numactl-doc: PKGV changed from 2.0.17 [default] to 2.0.18 [default]
packages/core2-64-poky-linux/numactl/numactl-doc: PKGSIZE changed from 56714 to 57254 (+1%)
packages/core2-64-poky-linux/numactl/numactl-locale: PV changed from "2.0.17" to "2.0.18"
packages/core2-64-poky-linux/numactl/numactl-locale: PKGV changed from 2.0.17 [default] to 2.0.18 [default]
packages/core2-64-poky-linux/numactl/numactl-ptest: PV changed from "2.0.17" to "2.0.18"
packages/core2-64-poky-linux/numactl/numactl-ptest: PKGV changed from 2.0.17 [default] to 2.0.18 [default]
packages/core2-64-poky-linux/numactl/numactl-src: PV changed from "2.0.17" to "2.0.18"
packages/core2-64-poky-linux/numactl/numactl-src: PKGV changed from 2.0.17 [default] to 2.0.18 [default]
packages/core2-64-poky-linux/numactl/numactl-src: PKGSIZE changed from 243844 to 242814 (-0%)
packages/core2-64-poky-linux/numactl/numactl-staticdev: PV changed from "2.0.17" to "2.0.18"
packages/core2-64-poky-linux/numactl/numactl-staticdev: PKGV changed from 2.0.17 [default] to 2.0.18 [default]
packages/core2-64-poky-linux/numactl/numactl: PV changed from "2.0.17" to "2.0.18"
packages/core2-64-poky-linux/numactl/numactl: PKGV changed from 2.0.17 [default] to 2.0.18 [default]
packages/core2-64-poky-linux/numactl/numactl: PKGSIZE changed from 219008 to 219040 (+0%)

--===============5045937399365227282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1858 targets, 46 skipped, 0 masked, 0 errors.
Removing 51 recipes from the core2-64 sysroot...done.
Removing 57 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-348a2c104786dcb553bf621dd4f329f8d01e6bda"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:348a2c104786dcb553bf621dd4f329f8d01e6bda"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 271 Local 255 Mirrors 0 Missed 16 Current 200 (94% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 206 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 207 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 208 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 223 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 224 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 225 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 226 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 622 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_recipe_qa)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe numactl-2.0.18-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 298 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 302 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe numactl-2.0.18-r0: task do_recipe_qa: Succeeded
NOTE: Running task 715 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe numactl-2.0.18-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 308 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe numactl-2.0.18-r0: task do_fetch: Succeeded
NOTE: Running task 726 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe numactl-2.0.18-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 328 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 330 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 758 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 353 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 774 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 775 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/acl/2.3.1/temp/log.do_packagedata_setscene.2947813
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 363 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_package_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe numactl-2.0.18-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running task 900 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_patch)
NOTE: Running task 903 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe numactl-2.0.18-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 917 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe numactl-2.0.18-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 938 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 939 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_populate_lic)
NOTE: Running task 940 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe numactl-2.0.18-r0: task do_populate_lic: Started
NOTE: recipe numactl-2.0.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 941 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_package_setscene: Started
NOTE: recipe numactl-2.0.18-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_populate_lic unihash changed to ebd508c5c1cfdc6ef923e3c348e44f6b9c3838d7768125d8c786527af760921b
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe numactl-2.0.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 401 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 402 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 947 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 983 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 207b00fd10966d38e4dcd948d5a71a49dea326058e3e7b62481ecc97a37137fd to hashserv.yocto.io:8686 ({'taskhash': 'b5f995348a4a90627b4f126680d415bd0244438bcb3ed1b0e9c4e38c2b06554c', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '207b00fd10966d38e4dcd948d5a71a49dea326058e3e7b62481ecc97a37137fd'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed b5f995348a4a90627b4f126680d415bd0244438bcb3ed1b0e9c4e38c2b06554c -> 207b00fd10966d38e4dcd948d5a71a49dea326058e3e7b62481ecc97a37137fd as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 439 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 442 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 459 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 466 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 471 of 471 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1155 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1289 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata)
NOTE: Running task 1311 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_collect_spdx_deps)
NOTE: recipe numactl-2.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Started
NOTE: recipe numactl-2.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe numactl-2.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe numactl-2.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1333 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_configure)
NOTE: recipe numactl-2.0.18-r0: task do_configure: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe numactl-2.0.18-r0: task do_configure: Succeeded
NOTE: Running task 1339 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_configure_ptest_base)
NOTE: recipe numactl-2.0.18-r0: task do_configure_ptest_base: Started
NOTE: recipe numactl-2.0.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1340 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_compile)
NOTE: recipe numactl-2.0.18-r0: task do_compile: Started
NOTE: recipe numactl-2.0.18-r0: task do_compile: Succeeded
NOTE: Running task 1341 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_compile_ptest_base)
NOTE: recipe numactl-2.0.18-r0: task do_compile_ptest_base: Started
NOTE: recipe numactl-2.0.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1342 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_install)
NOTE: recipe numactl-2.0.18-r0: task do_install: Started
NOTE: recipe numactl-2.0.18-r0: task do_install: Succeeded
NOTE: Running task 1343 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_install_ptest_base)
NOTE: recipe numactl-2.0.18-r0: task do_install_ptest_base: Started
NOTE: recipe numactl-2.0.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1344 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_package)
NOTE: Running task 1345 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_populate_sysroot)
NOTE: recipe numactl-2.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe numactl-2.0.18-r0: task do_package: Started
NOTE: recipe numactl-2.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe numactl-2.0.18-r0: task do_package: Succeeded
NOTE: Running task 1346 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_packagedata)
NOTE: recipe numactl-2.0.18-r0: task do_packagedata: Started
NOTE: recipe numactl-2.0.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1347 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_create_spdx)
NOTE: Running task 1348 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_package_write_ipk)
NOTE: Running task 1349 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_package_write_deb)
NOTE: Running task 1350 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_package_write_rpm)
NOTE: Running task 1351 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_package_qa)
NOTE: recipe numactl-2.0.18-r0: task do_create_spdx: Started
NOTE: recipe numactl-2.0.18-r0: task do_package_write_ipk: Started
NOTE: recipe numactl-2.0.18-r0: task do_package_write_deb: Started
NOTE: recipe numactl-2.0.18-r0: task do_package_write_rpm: Started
NOTE: recipe numactl-2.0.18-r0: task do_package_qa: Started
NOTE: recipe numactl-2.0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 1352 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_create_runtime_spdx)
NOTE: recipe numactl-2.0.18-r0: task do_package_write_ipk: Succeeded
NOTE: recipe numactl-2.0.18-r0: task do_create_runtime_spdx: Started
NOTE: recipe numactl-2.0.18-r0: task do_package_write_deb: Succeeded
NOTE: recipe numactl-2.0.18-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe numactl-2.0.18-r0: task do_package_qa: Succeeded
NOTE: recipe numactl-2.0.18-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1353 of 1353 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/numactl/numactl_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1353 tasks of which 1319 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-src went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dbg went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libacl went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-ptest went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-staticdev went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dev went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-doc went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-de went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+boldquot went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+quot went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-es went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-fr went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-gl went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-pl went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-sv went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5045937399365227282==--

