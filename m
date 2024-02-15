Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64E2C48BF2
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20337.1708018346064708194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cqNfMB2Y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ignkujCw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dadd3ad3d-18bbfe67-a73a-48cd-a72d-2d3c6e677fa6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yPraj9KNK18zwEx7ZvQ9AuUSDJdjhe/hi4qYENzmAO8=;
	b=cqNfMB2YnlLpOw54y2oeDAaGycSfWbmPTFKtIHOk764q35ZO+XBU9nWP8DlWP2yZ
	JrOSK54OnOm9P8zC7qx/jxu4cysyeO7NIZ/GJid70GXpErRsIZEutkeHaKs5FxOxsnn
	wEaPtxCsEllapm4dNP1oDeKDyC7BZ6SY0mpSsuG0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yPraj9KNK18zwEx7ZvQ9AuUSDJdjhe/hi4qYENzmAO8=;
	b=ignkujCwgidhN75xrAPDZjn2XqjdrhSmBMXhay/GhGVyfhUcJYq0oLMAnDopmmHa
	0UHAbf5/jwdDPGtF5lkrr+Ce8PbuEoyGAUeqUsyjk7B1H/iW/YT1emP5XxsuZAlqv04
	k6hlTHG5YcutI84YJ4N/kYbh/Mjg5Y9ZAe/J/vS4=
Content-Type: multipart/mixed; boundary="===============8526330881581175669=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.4 SUCCEEDED
Message-ID: <0101018dadd3ad3d-18bbfe67-a73a-48cd-a72d-2d3c6e677fa6-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195683

--===============8526330881581175669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libproxy* to *0.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.3-0.5.4.patch
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
From c57b0dfc167062c880bfdbf8708d0890f9a069e5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 17:17:26 +0000
Subject: [PATCH] libproxy: upgrade 0.5.3 -> 0.5.4

---
 .../libproxy/{libproxy_0.5.3.bb => libproxy_0.5.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.3.bb => libproxy_0.5.4.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.3.bb b/meta/recipes-support/libproxy/libproxy_0.5.4.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.3.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.4.bb
index db88af093e..b4f4c6d254 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.3.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.4.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "29d51a611f28af0bdbd51a5779cc8df264c8dcff"
+SRCREV = "dff9a603d823dcc740ec966cd27960daa6b891b1"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.42.0


--===============8526330881581175669==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.3-0.5.4.patch"

RnJvbSBjNTdiMGRmYzE2NzA2MmM4ODBiZmRiZjg3MDhkMDg5MGY5YTA2OWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTc6MTc6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwcm94eTogdXBncmFkZSAwLjUuMyAtPiAwLjUuNAoKLS0tCiAuLi4vbGlicHJveHkve2xpYnBy
b3h5XzAuNS4zLmJiID0+IGxpYnByb3h5XzAuNS40LmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwcm94eS97bGlicHJveHlfMC41LjMuYmIgPT4gbGlicHJveHlfMC41
LjQuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkv
bGlicHJveHlfMC41LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94
eV8wLjUuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlicHJveHkvbGlicHJveHlfMC41LjQuYmIKaW5kZXggZGI4OGFmMDkzZS4uYjRm
NGM2ZDI1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJv
eHlfMC41LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJveHlf
MC41LjQuYmIKQEAgLTE0LDcgKzE0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAogREVQRU5EUyA9ICJn
bGliLTIuMCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpYnByb3h5L2xpYnByb3h5
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgotU1JDUkVWID0gIjI5ZDUxYTYxMWYyOGFmMGJk
YmQ1MWE1Nzc5Y2M4ZGYyNjRjOGRjZmYiCitTUkNSRVYgPSAiZGZmOWE2MDNkODIzZGNjNzQwZWM5
NjZjZDI3OTYwZGFhNmI4OTFiMSIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgbWVz
b24gcGtnY29uZmlnIGdvYmplY3QtaW50cm9zcGVjdGlvbiB2YWxhIGdpLWRvY2dlbgotLSAKMi40
Mi4wCgo=

--===============8526330881581175669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libproxy: PV changed from "0.5.3" to "0.5.4"
packages/core2-64-poky-linux/libproxy: PKGV changed from 0.5.3 [default] to 0.5.4 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.3" to "0.5.4"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.1", added "/usr/lib/.debug/libproxy.so.0.5.4"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.3 [default] to 0.5.4 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 138608 to 135592 (-2%)
packages/core2-64-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.3" to "0.5.4"
packages/core2-64-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.3 [default] to 0.5.4 [default]
packages/core2-64-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.3" to "0.5.4"
packages/core2-64-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.3 [default] to 0.5.4 [default]
packages/core2-64-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.3" to "0.5.4"
packages/core2-64-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.3 [default] to 0.5.4 [default]
packages/core2-64-poky-linux/libproxy/libproxy-src: PV changed from "0.5.3" to "0.5.4"
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.3 [default] to 0.5.4 [default]
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGSIZE changed from 63507 to 62614 (-1%)
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.3" to "0.5.4"
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.3 [default] to 0.5.4 [default]
packages/core2-64-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.3/modules", added "/usr/lib/libproxy/0.5.4/modules"
packages/core2-64-poky-linux/libproxy/libproxy: PV changed from "0.5.3" to "0.5.4"
packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: added "/usr/lib/libproxy.so.0.5.4"
packages/core2-64-poky-linux/libproxy/libproxy: PKGV changed from 0.5.3 [default] to 0.5.4 [default]
packages/core2-64-poky-linux/libproxy/libproxy: PKGSIZE changed from 64072 to 64017 (-0%)
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed type from file to symlink
  /usr/lib/libproxy.so.1 changed permissions from rwxr-xr-x to rwxrwxrwx
  /usr/lib/libproxy.so.1 changed symlink target from None to libproxy.so.0.5.4
  /usr/lib/libproxy.so.0.5.4 was added

--===============8526330881581175669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: added "/usr/lib/libproxy.so.0.5.4"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed type from file to symlink
  /usr/lib/libproxy.so.1 changed permissions from rwxr-xr-x to rwxrwxrwx
  /usr/lib/libproxy.so.1 changed symlink target from None to libproxy.so.0.5.4
  /usr/lib/libproxy.so.0.5.4 was added

--===============8526330881581175669==--

