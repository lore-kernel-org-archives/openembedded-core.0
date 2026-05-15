Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC10CD4F58
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34756.1778851226279965805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BTt3u4kW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lDRhCDTx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e2bcbe277-68f37901-0c33-4b80-a2ee-9d906197ceee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851242;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ApGdQR0OXo/+w9xQ7vjHS1n7+5scztyHfZcs11QaWo8=;
	b=BTt3u4kWX1J/Bj0SfR8c2HDvVIWDl7KrK3GdT8rPWyKB/GeocNCCWJVsaom0ezgO
	rLjJsF7pCTWiuLtkThlm5zNojGoAvAsjPCeED+RdyPzI1El7efPx1Yn5GD9KktL6aba
	d8pzvsu5HY8K6vyYkm5EH2ERqsDk9KobUkJTmDvU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851242;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ApGdQR0OXo/+w9xQ7vjHS1n7+5scztyHfZcs11QaWo8=;
	b=lDRhCDTxATdrWia50rPzAepdIGtK/F57jp5u8nKd0tc3va5kHY581196k/pvFasr
	zqzQpd0gx1cLVuntW/fC+54olmFPOmQjVTO6+h7fkAJQtCDQXf7yMPWGaRjOc6w7DLs
	GSqAkn2Ovrh0h4Lud1FO94X+qww1Wm1bhrg3U08w=
Content-Type: multipart/mixed; boundary="===============8683396051512907260=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libgit2: upgrading to 1.9.3 SUCCEEDED
Message-ID: <0101019e2bcbe277-68f37901-0c33-4b80-a2ee-9d906197ceee-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237164

--===============8683396051512907260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgit2* to *1.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.9.2-1.9.3.patch
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
From f46fdbc09229884233be45de3a678107af036dcb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 12:32:22 +0000
Subject: [PATCH] libgit2: upgrade 1.9.2 -> 1.9.3

---
 .../libgit2/{libgit2_1.9.2.bb => libgit2_1.9.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.2.bb => libgit2_1.9.3.bb} (93%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.2.bb b/meta/recipes-support/libgit2/libgit2_1.9.3.bb
similarity index 93%
rename from meta/recipes-support/libgit2/libgit2_1.9.2.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.3.bb
index 2e023b44ff..d0c9a20d78 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.2.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v${PV}"
-SRCREV = "ca225744b992bf2bf24e9a2eb357ddef78179667"
+SRCREV = "1affb8b19346c4f90e163a9a0364959ff1410f64"
 
 inherit cmake
 
-- 
2.47.1


--===============8683396051512907260==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.9.2-1.9.3.patch"

RnJvbSBmNDZmZGJjMDkyMjk4ODQyMzNiZTQ1ZGUzYTY3ODEwN2FmMDM2ZGNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTI6MzI6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnaXQyOiB1cGdyYWRlIDEuOS4yIC0+IDEuOS4zCgotLS0KIC4uLi9saWJnaXQyL3tsaWJnaXQy
XzEuOS4yLmJiID0+IGxpYmdpdDJfMS45LjMuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmdpdDIve2xpYmdpdDJfMS45LjIuYmIgPT4gbGliZ2l0Ml8xLjkuMy5i
Yn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdp
dDJfMS45LjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS45LjMu
YmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZ2l0Mi9saWJnaXQyXzEuOS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJnaXQyL2xpYmdpdDJfMS45LjMuYmIKaW5kZXggMmUwMjNiNDRmZi4uZDBjOWEyMGQ3OCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuOS4yLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjkuMy5iYgpAQCAtNiw3
ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OGVhY2ZkYzE3
YzhmNGQyMTllMTMxYTA3Mzk3M2I5N2QiCiBERVBFTkRTID0gImN1cmwgb3BlbnNzbCB6bGliIGxp
YnNzaDIgbGliZ2NyeXB0IGxpYnBjcmUyIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
bGliZ2l0Mi9saWJnaXQyLmdpdDticmFuY2g9bWFpbnQvdjEuOTtwcm90b2NvbD1odHRwczt0YWc9
diR7UFZ9IgotU1JDUkVWID0gImNhMjI1NzQ0Yjk5MmJmMmJmMjRlOWEyZWIzNTdkZGVmNzgxNzk2
NjciCitTUkNSRVYgPSAiMWFmZmI4YjE5MzQ2YzRmOTBlMTYzYTlhMDM2NDk1OWZmMTQxMGY2NCIK
IAogaW5oZXJpdCBjbWFrZQogCi0tIAoyLjQ3LjEKCg==

--===============8683396051512907260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libgit2: SRC_URI changed from "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v1.9.2" to "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v1.9.3"
packages/x86-64-v3-poky-linux/libgit2: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libgit2: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PKGSIZE changed from 11211752 to 11216040 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.9.2", added "/usr/lib/.debug/libgit2.so.1.9.3"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PKGSIZE changed from 841708 to 842143 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-doc: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-locale: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 4622180 to 4626723 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: FILELIST: directory renamed /usr/src/debug/libgit2/1.9.2/src/util -> /usr/src/debug/libgit2/1.9.3/src/util, directory renamed /usr/src/debug/libgit2/1.9.2/deps/ntlmclient -> /usr/src/debug/libgit2/1.9.3/deps/ntlmclient, directory renamed /usr/src/debug/libgit2/1.9.2/deps/llhttp -> /usr/src/debug/libgit2/1.9.3/deps/llhttp, directory renamed /usr/src/debug/libgit2/1.9.2/include/git2 -> /usr/src/debug/libgit2/1.9.3/include/git2, directory renamed /usr/src/debug/libgit2/1.9.2/src/cli -> /usr/src/debug/libgit2/1.9.3/src/cli, directory renamed /usr/src/debug/libgit2/1.9.2/src/util/allocators -> /usr/src/debug/libgit2/1.9.3/src/util/allocators, directory renamed /usr/src/debug/libgit2/1.9.2/src/libgit2/transports -> /usr/src/debug/libgit2/1.9.3/src/libgit2/transports, directory renamed /usr/src/debug/libgit2/1.9.2/src/util/hash/sha1dc -> /usr/src/debug/libgit2/1.9.3/src/util/hash/sha1dc, directory renamed /usr/src/debug/libgit2/1.9.2/deps/x
 diff -> /usr/src/debug/libgit2/1.9.3/deps/xdiff, directory renamed /usr/src/debug/libgit2/1.9.2/src/cli/unix -> /usr/src/debug/libgit2/1.9.3/src/cli/unix, directory renamed /usr/src/debug/libgit2/1.9.2/src/util/unix -> /usr/src/debug/libgit2/1.9.3/src/util/unix, directory renamed /usr/src/debug/libgit2/1.9.2/include/git2/sys -> /usr/src/debug/libgit2/1.9.3/include/git2/sys, directory renamed /usr/src/debug/libgit2/1.9.2/src/util/hash -> /usr/src/debug/libgit2/1.9.3/src/util/hash, directory renamed /usr/src/debug/libgit2/1.9.2/src/libgit2 -> /usr/src/debug/libgit2/1.9.3/src/libgit2, directory renamed /usr/src/debug/libgit2/1.9.2/src/libgit2/streams -> /usr/src/debug/libgit2/1.9.3/src/libgit2/streams
packages/x86-64-v3-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2: PKGSIZE changed from 2692400 to 2696496 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libgit2/libgit2: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.9.2", added "/usr/lib/libgit2.so.1.9.3"
Changes to packages/x86-64-v3-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.9 changed symlink target from libgit2.so.1.9.2 to libgit2.so.1.9.3
  /usr/lib/libgit2.so.1.9.2 moved to /usr/lib/libgit2.so.1.9.3

--===============8683396051512907260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.9.2", added "/usr/lib/libgit2.so.1.9.3"
Changes to packages/x86-64-v3-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.9 changed symlink target from libgit2.so.1.9.2 to libgit2.so.1.9.3
  /usr/lib/libgit2.so.1.9.2 moved to /usr/lib/libgit2.so.1.9.3

--===============8683396051512907260==--

