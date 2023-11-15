Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C50C54F76
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.14625.1700059030184937340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cikaT+8L;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XtpuYlfc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018bd36a1f5a-73d791b1-99bc-4963-bdef-d28d9f6588d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q+9NlS1NkEP8lCCetCrNz0eL6YoKi9Bd/0yNnh/9E5A=;
	b=cikaT+8LRVgM+WkeFkqW1CxPURQPbjGJic5DoBuPCkvqUspHEOSrO+QGn/8AvudN
	JXqkK/Aie5pXo2X0/fKp5UWbcJ0Pz6EJVgiadeHu0WN5gidf+sA0yukyaIoxd8zimMa
	2NzUSfgablVLY7gglCKjcj9Zx7yXxZKgYSzEIFDI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q+9NlS1NkEP8lCCetCrNz0eL6YoKi9Bd/0yNnh/9E5A=;
	b=XtpuYlfcpqr/wiQgchxSL6+flK1UUQFRWasazWS2j+lQ42KWZ+/Ex65RrOqV+Y7F
	YXMObgLseUMJRKLcOzfInHbZRkH4hwlA+1PWCBOBxMssYkyudJYNuGqfE99hmiT7FUt
	Q3Xvn/r39F54P/CWZFnFKQHfMxOZU5yXmE3FqgFE=
Content-Type: multipart/mixed; boundary="===============6548914021086034524=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 17.0.5 SUCCEEDED
Message-ID: <0101018bd36a1f5a-73d791b1-99bc-4963-bdef-d28d9f6588d2-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190626

--===============6548914021086034524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *17.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-17.0.4-17.0.5.patch
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
From dce7cdbe751977ab8b63ede95b95f1a63bf8c125 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 06:46:22 +0000
Subject: [PATCH] llvm: upgrade 17.0.4 -> 17.0.5

---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 0f811624a4..de8d411686 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.4"
+PV = "17.0.5"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "309d55140c46384b6de7a7573206cbeba3f7077f"
+SRCREV = "98bfdac5ce82d1679f8af9a57501471812ab68d7"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.39.2


--===============6548914021086034524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 3691858840 to 3691911688 (+0%)
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-17.0.4.so", added "/usr/lib/libLLVM-17.0.5.so"
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-17.0.4.so", added "/usr/lib/libLLVM-17.0.5.so"
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGSIZE changed from 83231440 to 83235536 (+0%)
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PKGSIZE changed from 336109713 to 336110473 (+0%)
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 3723647914 to 3723713844 (+0%)
packages/core2-64-poky-linux/llvm/llvm: PV changed from "17.0.4" to "17.0.5"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 17.0.4 [default] to 17.0.5 [default]
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config17.0.4 moved to /usr/bin/crossscripts/llvm-config17.0.5
  /usr/lib/libLLVM-17.0.4.so moved to /usr/lib/libLLVM-17.0.5.so

--===============6548914021086034524==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-17.0.4-17.0.5.patch"

RnJvbSBkY2U3Y2RiZTc1MTk3N2FiOGI2M2VkZTk1Yjk1ZjFhNjNiZjhjMTI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDY6NDY6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
bHZtOiB1cGdyYWRlIDE3LjAuNCAtPiAxNy4wLjUKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xsdm0vbGx2bV9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xs
dm0vbGx2bV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtX2dpdC5iYgpp
bmRleCAwZjgxMTYyNGE0Li5kZThkNDExNjg2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGx2bS9sbHZtX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9s
bHZtX2dpdC5iYgpAQCAtMTQsMTQgKzE0LDE0IEBAIFJERVBFTkRTOiR7UE59OmFwcGVuZDpjbGFz
cy10YXJnZXQgPSAiIG5jdXJzZXMtdGVybWluZm8iCiAKIGluaGVyaXQgY21ha2UgcGtnY29uZmln
CiAKLVBWID0gIjE3LjAuNCIKK1BWID0gIjE3LjAuNSIKIAogTUFKT1JfVkVSU0lPTiA9ICIke0Bv
ZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9IiwgMSl9IgogCiBMTFZNX1JFTEVBU0UgPSAiJHtQ
Vn0iCiAKIEJSQU5DSCA9ICJyZWxlYXNlLyR7TUFKT1JfVkVSU0lPTn0ueCIKLVNSQ1JFViA9ICIz
MDlkNTUxNDBjNDYzODRiNmRlN2E3NTczMjA2Y2JlYmEzZjcwNzdmIgorU1JDUkVWID0gIjk4YmZk
YWM1Y2U4MmQxNjc5ZjhhZjlhNTc1MDE0NzE4MTJhYjY4ZDciCiBTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QuZ2l0O2JyYW5jaD0ke0JSQU5DSH07cHJvdG9jb2w9
aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwNy1sbHZtLWFsbG93LWVudi1vdmVycmlkZS1v
Zi1leGUtcGF0aC5wYXRjaDtzdHJpcGxldmVsPTIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1B
c21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNo
O3N0cmlwbGV2ZWw9MiBcCi0tIAoyLjM5LjIKCg==

--===============6548914021086034524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-17.0.4.so", added "/usr/lib/libLLVM-17.0.5.so"
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config17.0.4 moved to /usr/bin/crossscripts/llvm-config17.0.5
  /usr/lib/libLLVM-17.0.4.so moved to /usr/lib/libLLVM-17.0.5.so

--===============6548914021086034524==--

