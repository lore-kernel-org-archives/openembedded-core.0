Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383E610F6FA3
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14649.1775054158767052482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yXk3gkjH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GUFIojkE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d49793a8a-cc56126d-0bc7-4e75-847d-8690165498be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JwIagLMt2J9dImf1Skj/hWQkCnKqYd4hwIWXUEej9Vo=;
	b=yXk3gkjHV28nCHRrudX+2C++v7H5m0sh2mJRS/emBHiDK93dJG+3VlgKSbp5rlmq
	7YQFHW34ad5/UOSgvAnRyiqSu3vBDIEpKbp193IuhViDAZRV+s2DNr7PQ0urhDaukQ5
	jPE1Xt+i1Dz0c7aMAfsMgBL2fOVH+w0v4cEZKFJM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JwIagLMt2J9dImf1Skj/hWQkCnKqYd4hwIWXUEej9Vo=;
	b=GUFIojkEmEwvL0J868FKhfkUKko9r03/FcL4TTxBk7jj+CewURChEFWWM0AbK34y
	DbKpdR9tfnpg6M91uLXklEQHupvSi4DnQvb//487E6bl0KudY9SHAoBhjlvVTaKxKbL
	lZnWAFWt7wKoqQYAR6HzjgmEZXn2o7UQPEjr6v3Q=
Content-Type: multipart/mixed; boundary="===============9043328162354687004=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpng: upgrading to 1.6.56 SUCCEEDED
Message-ID: <0101019d49793a8a-cc56126d-0bc7-4e75-847d-8690165498be-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234429

--===============9043328162354687004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpng* to *1.6.56* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.55-1.6.56.patch
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
From 14fda5a859cb1bf5bc969a1d202ed85decf3d82b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 14:00:32 +0000
Subject: [PATCH] libpng: upgrade 1.6.55 -> 1.6.56

---
 .../libpng/{libpng_1.6.55.bb => libpng_1.6.56.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.55.bb => libpng_1.6.56.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.55.bb b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.55.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.56.bb
index c6e95e0723..7ede0a6c8b 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.55.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d"
+SRC_URI[sha256sum] = "f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.47.1


--===============9043328162354687004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/tests/pngstest-negative-stride-extra /usr/lib/libpng/ptest/src/tests/pngstest-negative-stride"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.55.0", added "/usr/lib/libpng16.so.16.56.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.55.0 to libpng16.so.16.56.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.55.0 to libpng16.so.16.56.0
  /usr/lib/libpng16.so.16.55.0 moved to /usr/lib/libpng16.so.16.56.0

--===============9043328162354687004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpng: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.55.tar.xz file://run-ptest" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.56.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 1603976 to 1606008 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.55.0", added "/usr/lib/.debug/libpng16.so.16.56.0"
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGSIZE changed from 179839 to 179835 (-0%)
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268149 to 268133 (-0%)
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGSIZE changed from 2510360 to 2516635 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/tests/pngstest-negative-stride /usr/lib/libpng/ptest/src/tests/pngstest-negative-stride-extra"
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGSIZE changed from 2143183 to 2145398 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-src: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng/libpng-src: FILELIST: directory renamed /usr/src/debug/libpng/1.6.55/contrib/libtests -> /usr/src/debug/libpng/1.6.56/contrib/libtests, directory renamed /usr/src/debug/libpng/1.6.55/contrib/tools -> /usr/src/debug/libpng/1.6.56/contrib/tools, directory renamed /usr/src/debug/libpng/1.6.55 -> /usr/src/debug/libpng/1.6.56
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng/libpng: PKGV changed from 1.6.55 [default] to 1.6.56 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: PV changed from "1.6.55" to "1.6.56"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.55.0", added "/usr/lib/libpng16.so.16.56.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.55.0 to libpng16.so.16.56.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.55.0 to libpng16.so.16.56.0
  /usr/lib/libpng16.so.16.55.0 moved to /usr/lib/libpng16.so.16.56.0

--===============9043328162354687004==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.55-1.6.56.patch"

RnJvbSAxNGZkYTVhODU5Y2IxYmY1YmM5NjlhMWQyMDJlZDg1ZGVjZjNkODJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxNDowMDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBuZzogdXBncmFkZSAxLjYuNTUgLT4gMS42LjU2CgotLS0KIC4uLi9saWJwbmcve2xpYnBuZ18x
LjYuNTUuYmIgPT4gbGlicG5nXzEuNi41Ni5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2xpYnBuZy97bGlicG5nXzEuNi41NS5iYiA9PiBsaWJwbmdfMS42LjU2
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9s
aWJwbmdfMS42LjU1LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18x
LjYuNTYuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18xLjYuNTUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjU2LmJiCmluZGV4IGM2ZTk1ZTA3MjMuLjdlZGUw
YTZjOGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjU1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42
LjU2LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9
LyR7QlBOfS8ke0JQTn0ke0xJQlZ9LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9y
dW4tcHRlc3QgXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDkyNTcyMjg2NDgzN2FkNWFl
MmE4MjA3MGQ0YjJlMDYwM2RjNzJhZjQ0YmQ0NTdjMzk2MjI5ODI1OGI4ZTgyZCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJmN2Q4YmYxNjAxYjc4MDRmNTgzYTI1NGFiMzQzYTY1NDljYTZjZjI3ZDI1
NWMzMDJjNDdhZjJkOWQzNmE2ZjE4IgogCiBNSVJST1JTICs9ICIke1NPVVJDRUZPUkdFX01JUlJP
Un0vcHJvamVjdC8ke0JQTn0vJHtCUE59JHtMSUJWfS8gJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3By
b2plY3QvJHtCUE59LyR7QlBOfSR7TElCVn0vb2xkZXItcmVsZWFzZXMvIgogCi0tIAoyLjQ3LjEK
Cg==

--===============9043328162354687004==--

