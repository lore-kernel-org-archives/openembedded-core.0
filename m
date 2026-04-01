Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7366410F6FB9
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14748.1775054159247703731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EBsdKlEZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H9Tx0teG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d49792276-8329dc76-371b-4039-9c86-f69b72d6ffe7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Aods/Fvj5n4J1OD2sUaibUwltwSj1LRl63e3dVDRHFo=;
	b=EBsdKlEZ65KOGsWcUBE1+c0JMoJSVHcoeRzIpEeiHjfyhvWAhcB9KuputViA8pvw
	+jaam1GUfjF07PLq8vWQSKGqEius6/v7XdqX8ALX8VarLsLC54mQsBtktlhoNmvNt33
	o/kgHnF0YtpSg39tAsUILkFBHxwk94h4UsbYYz6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Aods/Fvj5n4J1OD2sUaibUwltwSj1LRl63e3dVDRHFo=;
	b=H9Tx0teG0vRItoEEk5OEaQwFri0/in+uwq7w831vTovuMl9UKETJf8m3YJg1W3Xc
	gIkqpwBaCW/OEARCbDFx60gyp43XZo/VzgI62r3PvzG9Z7W59dzZUO16sjRTJoO2g8J
	BbtF82CYih8pwOu+u+y7LwYTlEuUqoRFV2Ufnyrw=
Content-Type: multipart/mixed; boundary="===============2134329717504624971=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.8.3 SUCCEEDED
Message-ID: <0101019d49792276-8329dc76-371b-4039-9c86-f69b72d6ffe7-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234404

--===============2134329717504624971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xz* to *5.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.8.2-5.8.3.patch
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
From 9296b74db78e8d0f6f1baffb28ef425e93751682 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 11:49:27 +0000
Subject: [PATCH] xz: upgrade 5.8.2 -> 5.8.3

---
 meta/recipes-extended/xz/{xz_5.8.2.bb => xz_5.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.8.2.bb => xz_5.8.3.bb} (97%)

diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended/xz/xz_5.8.3.bb
similarity index 97%
rename from meta/recipes-extended/xz/xz_5.8.2.bb
rename to meta/recipes-extended/xz/xz_5.8.3.bb
index 982f5054c3..2c87065837 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.3.bb
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f70f9e7ce58a8f1"
+SRC_URI[sha256sum] = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.47.1


--===============2134329717504624971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.2", added "/usr/lib/liblzma.so.5.8.3"
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3
packages/x86-64-v3-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/ar/man1/lzfgrep.1 /usr/share/man/ar/man1/xzfgrep.1 /usr/share/man/ar/man1/lzcat.1 /usr/share/man/ar/man1/xzcat.1 /usr/share/man/ar/man1/xz.1 /usr/share/man/ar/man1/lzmadec.1 /usr/share/man/ar/man1/unlzma.1 /usr/share/man/ar/man1/unxz.1 /usr/share/man/ar/man1/lzcmp.1 /usr/share/man/ar/man1/xzcmp.1 /usr/share/man/ar/man1/xzdec.1 /usr/share/man/ar/man1/lzegrep.1 /usr/share/man/ar/man1/xzegrep.1 /usr/share/man/ar/man1/lzma.1 /usr/share/man/ar/man1/lzless.1 /usr/share/man/ar/man1/xzless.1 /usr/share/man/ar/man1/lzgrep.1 /usr/share/man/ar/man1/xzgrep.1 /usr/share/man/ar/man1/lzdiff.1 /usr/share/man/ar/man1/xzdiff.1 /usr/share/man/ar/man1/lzmore.1 /usr/share/man/ar/man1/xzmore.1 /usr/share/man/ar/man1/lzmainfo.1"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3

--===============2134329717504624971==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.8.2-5.8.3.patch"

RnJvbSA5Mjk2Yjc0ZGI3OGU4ZDBmNmYxYmFmZmIyOGVmNDI1ZTkzNzUxNjgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMTo0OToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh6
OiB1cGdyYWRlIDUuOC4yIC0+IDUuOC4zCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC94ei97
eHpfNS44LjIuYmIgPT4geHpfNS44LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6
L3t4el81LjguMi5iYiA9PiB4el81LjguMy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQveHoveHpfNS44LjIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHov
eHpfNS44LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3h6L3h6XzUuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
eHoveHpfNS44LjMuYmIKaW5kZXggOTgyZjUwNTRjMy4uMmM4NzA2NTgzNyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC94ei94el81LjguMy5iYgpAQCAtMjgsNyArMjgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzhkNTYyZjYxMTIxNzRkZTkzYTk2Nzc2ODIyMzFiMiBc
CiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS90dWthYW5pLXByb2plY3QveHovcmVsZWFz
ZXMvZG93bmxvYWQvdiR7UFZ9L3h6LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9y
dW4tcHRlc3QgXAogICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZTA5YzUwYTU5
NjI3ODZiODNlNWRhMzg5YzkwZGQyYzE1ZWNkMDk4MGEyNThkZDAxZjcwZjllN2NlNThhOGYxIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjNkM2ExYjk3M2FmMjE4MTE0ZjRmODg5YmJhYTJmNGMwMzdk
ZWFhZTBjOGU4MTVlZWMzODFjM2Q1NDZiOTc0YTAiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJy
ZWxlYXNlcy90YWcvdig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGh1Yi5jb20vdHVrYWFuaS1wcm9qZWN0L3h6L3JlbGVhc2VzLyIKIAotLSAK
Mi40Ny4xCgo=

--===============2134329717504624971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xz: SRC_URI changed from "https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.gz file://run-ptest" to "https://github.com/tukaani-project/xz/releases/download/v5.8.3/xz-5.8.3.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/xz: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/liblzma: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.2", added "/usr/lib/liblzma.so.5.8.3"
packages/x86-64-v3-poky-linux/xz/liblzma: PV changed from "5.8.2" to "5.8.3"
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGSIZE changed from 2251128 to 2255160 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.8.2", added "/usr/lib/.debug/liblzma.so.5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-dbg: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGSIZE changed from 229928 to 229942 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-dev: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGSIZE changed from 1390205 to 1517047 (+9%)
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/ar/man1/lzcmp.1 /usr/share/man/ar/man1/xzcmp.1 /usr/share/man/ar/man1/xzdec.1 /usr/share/man/ar/man1/lzless.1 /usr/share/man/ar/man1/lzma.1 /usr/share/man/ar/man1/xzless.1 /usr/share/man/ar/man1/lzegrep.1 /usr/share/man/ar/man1/xzegrep.1 /usr/share/man/ar/man1/unxz.1 /usr/share/man/ar/man1/lzmore.1 /usr/share/man/ar/man1/xzmore.1 /usr/share/man/ar/man1/lzmainfo.1 /usr/share/man/ar/man1/xz.1 /usr/share/man/ar/man1/xzgrep.1 /usr/share/man/ar/man1/lzgrep.1 /usr/share/man/ar/man1/unlzma.1 /usr/share/man/ar/man1/xzfgrep.1 /usr/share/man/ar/man1/lzfgrep.1 /usr/share/man/ar/man1/lzcat.1 /usr/share/man/ar/man1/xzcat.1 /usr/share/man/ar/man1/xzdiff.1 /usr/share/man/ar/man1/lzmadec.1 /usr/share/man/ar/man1/lzdiff.1"
packages/x86-64-v3-poky-linux/xz/xz-doc: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-ptest: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-ptest: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-src: PKGSIZE changed from 1696338 to 1698866 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-src: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-src: FILELIST: directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/api/lzma -> /usr/src/debug/xz/5.8.3/src/liblzma/api/lzma, directory renamed /usr/src/debug/xz/5.8.2/tests -> /usr/src/debug/xz/5.8.3/tests, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/check -> /usr/src/debug/xz/5.8.3/src/liblzma/check, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/common -> /usr/src/debug/xz/5.8.3/src/liblzma/common, directory renamed /usr/src/debug/xz/5.8.2/src/common -> /usr/src/debug/xz/5.8.3/src/common, directory renamed /usr/src/debug/xz/5.8.2/src/lzmainfo -> /usr/src/debug/xz/5.8.3/src/lzmainfo, directory renamed /usr/src/debug/xz/5.8.2/src/xz -> /usr/src/debug/xz/5.8.3/src/xz, directory renamed /usr/src/debug/xz/5.8.2/src/xzdec -> /usr/src/debug/xz/5.8.3/src/xzdec, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/delta -> /usr/src/debug/xz/5.8.3/src/liblzma/delta, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/lzma -> /usr/src/
 debug/xz/5.8.3/src/liblzma/lzma, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/rangecoder -> /usr/src/debug/xz/5.8.3/src/liblzma/rangecoder, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/simple -> /usr/src/debug/xz/5.8.3/src/liblzma/simple, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/lz -> /usr/src/debug/xz/5.8.3/src/liblzma/lz
packages/x86-64-v3-poky-linux/xz/xz-src: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz: PV changed from "5.8.2" to "5.8.3"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3

--===============2134329717504624971==--

