Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23683C44508
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 06:31:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9788.1783837894098917368
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 23:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fTs2ysuf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q0W7Jp6v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f55062230-d75ae7e6-5b48-4536-a645-1e364886a2c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783837893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NM52ZkG9FGvX0onQm25Bu/w1XwYPoFCcnL7OpNN4uiE=;
	b=fTs2ysufuJA1LnhUqO59lzKIS/l0d9GlnjstFaYxztgCNRuiJpUk2szyQrOZlx7z
	1ERdt2zad5jdVoqlp1ecqphrcCI1vZmrVtehGHCvEBa74p+aCEY26bt/ztDksVz5kpF
	qCER/sFVsBiQ1d+s00AYk7tlZhUOIluqzH1P6294=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783837893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NM52ZkG9FGvX0onQm25Bu/w1XwYPoFCcnL7OpNN4uiE=;
	b=Q0W7Jp6vtvPecisRMSKwfOZ7iMplzSTEgqshx7KRoHH4LUcOtWbPTypyxLrvjd17
	j/j2yNdNYV28YFnMEQzF0oZSWsokQ1eF7jQ8A0e1Ss6tK7avj80Yf83wHuiJEIVhufh
	rMpueeN2NWfkNiCp5gkByGviFVFpAbMv5Jeo1fCw=
Content-Type: multipart/mixed; boundary="===============4190789566964050683=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.33 SUCCEEDED
Message-ID: <0101019f55062230-d75ae7e6-5b48-4536-a645-1e364886a2c4-000000@us-west-2.amazonses.com>
Date: Sun, 12 Jul 2026 06:31:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.12-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 06:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240759

--===============4190789566964050683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *msmtp* to *1.8.33* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.32-1.8.33.patch
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
From ae455d044ca6157ed176f349beb49d024469d403 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 12 Jul 2026 05:58:25 +0000
Subject: [PATCH] msmtp: upgrade 1.8.32 -> 1.8.33

---
 .../recipes-extended/msmtp/{msmtp_1.8.32.bb => msmtp_1.8.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.32.bb => msmtp_1.8.33.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.32.bb b/meta/recipes-extended/msmtp/msmtp_1.8.33.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.32.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.33.bb
index 548c94aaaf..1971fcae65 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.32.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.33.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "20cd58b58dd007acf7b937fa1a1e21f3afb3e9ef5bbcfb8b4f5650deadc64db4"
+SRC_URI[sha256sum] = "41c163ce2c4c8c3c326cda8d0abd9391a7323788f0a893f49bfbe7aff3d4f276"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.47.1


--===============4190789566964050683==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.32-1.8.33.patch"

RnJvbSBhZTQ1NWQwNDRjYTYxNTdlZDE3NmYzNDliZWI0OWQwMjQ0NjlkNDAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTIgSnVsIDIwMjYgMDU6NTg6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
c210cDogdXBncmFkZSAxLjguMzIgLT4gMS44LjMzCgotLS0KIC4uLi9yZWNpcGVzLWV4dGVuZGVk
L21zbXRwL3ttc210cF8xLjguMzIuYmIgPT4gbXNtdHBfMS44LjMzLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9tc210cC97bXNtdHBfMS44LjMyLmJiID0+IG1zbXRwXzEuOC4zMy5iYn0g
KDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44
LjMyLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4zMy5iYgpzaW1p
bGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAv
bXNtdHBfMS44LjMyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNt
dHBfMS44LjMzLmJiCmluZGV4IDU0OGM5NGFhYWYuLjE5NzFmY2FlNjUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjguMzIuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4zMy5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4
MGQ0N2ZhZTUwNCIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS9tc210
cC9kb3dubG9hZC8iCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9tYXJsYW0uZGUvJHtCUE59L3JlbGVh
c2VzLyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMGNkNThiNThkZDAwN2Fj
ZjdiOTM3ZmExYTFlMjFmM2FmYjNlOWVmNWJiY2ZiOGI0ZjU2NTBkZWFkYzY0ZGI0IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjQxYzE2M2NlMmM0YzhjM2MzMjZjZGE4ZDBhYmQ5MzkxYTczMjM3ODhm
MGE4OTNmNDliZmJlN2FmZjNkNGYyNzYiCiAKIGluaGVyaXQgZ2V0dGV4dCBhdXRvdG9vbHMgdXBk
YXRlLWFsdGVybmF0aXZlcyBwa2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============4190789566964050683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ka"

--===============4190789566964050683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/msmtp: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.32.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.33.tar.xz"
packages/x86-64-v3-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ka"
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 513568 to 514488 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 117983 to 117987 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-es: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-es: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ro: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ro: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ru: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ru: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-zh-cn: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-zh-cn: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: FILELIST: directory renamed /usr/src/debug/msmtp/1.8.32/src -> /usr/src/debug/msmtp/1.8.33/src
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 527114 to 528917 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.32 [default] to 1.8.33 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp: PV changed from "1.8.32" to "1.8.33"
packages/x86-64-v3-poky-linux/msmtp/msmtp: PKGV changed from 1.8.32 [default] to 1.8.33 [default]

--===============4190789566964050683==--

