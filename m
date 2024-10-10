Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7251BD1A456
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.53386.1728588990275154279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CkaH6OZt;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ceAL1sTd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019277eec517-709568d9-257a-4992-88ce-9c19085ab7f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ndgr/WleQJ5DO7kLsSpr92NZdovjxgzawywjIbymKcw=;
	b=CkaH6OZthWkYDrRVMv7AWcO88LL+zl6IOKxB7842HWw/Nnz0He6VHNarGKO8s+kD
	uKXtkyraCKMi8QBhbhfot5DTj4mdFBAQTF5606gxUPtpgro6fGtAV/sBWaa8tgmwjEj
	xYPsrBTRerIQCgXRfVjve4twpJKaWgbskRvA3i8U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ndgr/WleQJ5DO7kLsSpr92NZdovjxgzawywjIbymKcw=;
	b=ceAL1sTdO34QwE0PpWmoaDOKiw9h/J38rCjaDbE4qU4DFneuYdPlRpx+cdlqvtBA
	bJJsLn2otLySpwTRMeKEefSdvJ3XpMAWdlEQdSdca2H7eeGgEwOllr9stg5Pe4YwVPC
	pGj4RdcC5YlvnJHfHlefAIX2ehipRxzFxP60sokQ=
Content-Type: multipart/mixed; boundary="===============3125676268642240504=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.9 SUCCEEDED
Message-ID: <0101019277eec517-709568d9-257a-4992-88ce-9c19085ab7f3-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205589

--===============3125676268642240504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libproxy* to *0.5.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.8-0.5.9.patch
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
From 45fc8554ce65d929fe5cbde9e37f050510dce14b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 16:23:41 +0000
Subject: [PATCH] libproxy: upgrade 0.5.8 -> 0.5.9

---
 .../libproxy/{libproxy_0.5.8.bb => libproxy_0.5.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.8.bb => libproxy_0.5.9.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.8.bb b/meta/recipes-support/libproxy/libproxy_0.5.9.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.8.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.9.bb
index 5dcd7d019b..e6192a6960 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.8.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.9.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "04c5185729e164dcc2d010177f83b6209769d9e7"
+SRCREV = "77e2a2b88a319974cf099c8eaaaa03030bc4c0d4"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.44.1


--===============3125676268642240504==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.8-0.5.9.patch"

RnJvbSA0NWZjODU1NGNlNjVkOTI5ZmU1Y2JkZTllMzdmMDUwNTEwZGNlMTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTY6MjM6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwcm94eTogdXBncmFkZSAwLjUuOCAtPiAwLjUuOQoKLS0tCiAuLi4vbGlicHJveHkve2xpYnBy
b3h5XzAuNS44LmJiID0+IGxpYnByb3h5XzAuNS45LmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwcm94eS97bGlicHJveHlfMC41LjguYmIgPT4gbGlicHJveHlfMC41
LjkuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkv
bGlicHJveHlfMC41LjguYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94
eV8wLjUuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlicHJveHkvbGlicHJveHlfMC41LjkuYmIKaW5kZXggNWRjZDdkMDE5Yi4uZTYx
OTJhNjk2MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJv
eHlfMC41LjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJveHlf
MC41LjkuYmIKQEAgLTE0LDcgKzE0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAogREVQRU5EUyA9ICJn
bGliLTIuMCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpYnByb3h5L2xpYnByb3h5
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgotU1JDUkVWID0gIjA0YzUxODU3MjllMTY0ZGNj
MmQwMTAxNzdmODNiNjIwOTc2OWQ5ZTciCitTUkNSRVYgPSAiNzdlMmEyYjg4YTMxOTk3NGNmMDk5
YzhlYWFhYTAzMDMwYmM0YzBkNCIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgbWVz
b24gcGtnY29uZmlnIGdvYmplY3QtaW50cm9zcGVjdGlvbiB2YWxhIGdpLWRvY2dlbgotLSAKMi40
NC4xCgo=

--===============3125676268642240504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.8", added "/usr/lib/libproxy.so.0.5.9"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.8 to libproxy.so.0.5.9
  /usr/lib/libproxy.so.0.5.8 moved to /usr/lib/libproxy.so.0.5.9

--===============3125676268642240504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libproxy: PKGV changed from 0.5.8 [default] to 0.5.9 [default]
packages/core2-64-poky-linux/libproxy: PV changed from "0.5.8" to "0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.8", added "/usr/lib/.debug/libproxy.so.0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 149480 to 150224 (+0%)
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.8" to "0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.8 [default] to 0.5.9 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.8" to "0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.8 [default] to 0.5.9 [default]
packages/core2-64-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.8" to "0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.8 [default] to 0.5.9 [default]
packages/core2-64-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.8" to "0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.8 [default] to 0.5.9 [default]
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGSIZE changed from 68655 to 69096 (+1%)
packages/core2-64-poky-linux/libproxy/libproxy-src: PV changed from "0.5.8" to "0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.8 [default] to 0.5.9 [default]
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.8" to "0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.8 [default] to 0.5.9 [default]
packages/core2-64-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.8/modules", added "/usr/lib/libproxy/0.5.9/modules"
packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.8", added "/usr/lib/libproxy.so.0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy: PV changed from "0.5.8" to "0.5.9"
packages/core2-64-poky-linux/libproxy/libproxy: PKGV changed from 0.5.8 [default] to 0.5.9 [default]
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.8 to libproxy.so.0.5.9
  /usr/lib/libproxy.so.0.5.8 moved to /usr/lib/libproxy.so.0.5.9

--===============3125676268642240504==--

