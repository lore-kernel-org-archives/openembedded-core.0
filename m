Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDEBC41513
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1385.1721071149502157142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BiGDm08l;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hUdiWQNH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d59eea-3b8e8249-893f-4362-bf4e-f3cb9e9c89e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nzaidcQEhapodGDA4zJAo3hYmPQ/8K2TqqfgVJCowKA=;
	b=BiGDm08lAloDm4SQcSBz83IEe41Qy+aX1LQ4g1HUbLIzxCSjMqHNQhGRih0yLgcy
	PQHIpg1Eb0dNFwY12g3qZWRp4Vs7uUEsJ9BiZXo5kRbPdgFNJDixjMO2dm8zYie/1M1
	sD2dol4dRQKXpFOnw8AtVKZFgUwIlsvavNGyNRXI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nzaidcQEhapodGDA4zJAo3hYmPQ/8K2TqqfgVJCowKA=;
	b=hUdiWQNHxa+B5vpDTtgnjbEg72NaEGRN6ycT1Dq2bBYLNMXNzL075DMxg20vyz9+
	eKbz1cGY2jdVWeMJLiT5trfkSgMpfZRs3CZBPqCC+OjtGZ5RVNKjkqKjxSOFkUnbFC7
	5IH0uTGEUAZ18SCKbFvjQ71jn+qTG2y/pf6qkE6I=
Content-Type: multipart/mixed; boundary="===============1319186432308448032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.7 SUCCEEDED
Message-ID: <01010190b7d59eea-3b8e8249-893f-4362-bf4e-f3cb9e9c89e6-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202063

--===============1319186432308448032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libproxy* to *0.5.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.6-0.5.7.patch
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
From 172869e48bafbd99db31369ed9bcc83eb210e7ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 18:55:31 +0000
Subject: [PATCH] libproxy: upgrade 0.5.6 -> 0.5.7

---
 .../libproxy/{libproxy_0.5.6.bb => libproxy_0.5.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.6.bb => libproxy_0.5.7.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.6.bb b/meta/recipes-support/libproxy/libproxy_0.5.7.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.6.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.7.bb
index 6a705b305f..80441d4525 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.6.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.7.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "e7d18806575e21f94cf2f6024659386b129ca189"
+SRCREV = "2686d35cfa5db970d4ba65e2951ebc8183b1be82"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.44.0


--===============1319186432308448032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.6", added "/usr/lib/libproxy.so.0.5.7"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.6 to libproxy.so.0.5.7
  /usr/lib/libproxy.so.0.5.6 moved to /usr/lib/libproxy.so.0.5.7

--===============1319186432308448032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libproxy: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 149368 to 149296 (-0%)
packages/core2-64-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.6", added "/usr/lib/.debug/libproxy.so.0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGSIZE changed from 68457 to 68468 (+0%)
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-src: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.6/modules", added "/usr/lib/libproxy/0.5.7/modules"
packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.6", added "/usr/lib/libproxy.so.0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy: PV changed from "0.5.6" to "0.5.7"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.6 to libproxy.so.0.5.7
  /usr/lib/libproxy.so.0.5.6 moved to /usr/lib/libproxy.so.0.5.7

--===============1319186432308448032==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.6-0.5.7.patch"

RnJvbSAxNzI4NjllNDhiYWZiZDk5ZGIzMTM2OWVkOWJjYzgzZWIyMTBlN2FjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTg6NTU6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwcm94eTogdXBncmFkZSAwLjUuNiAtPiAwLjUuNwoKLS0tCiAuLi4vbGlicHJveHkve2xpYnBy
b3h5XzAuNS42LmJiID0+IGxpYnByb3h5XzAuNS43LmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwcm94eS97bGlicHJveHlfMC41LjYuYmIgPT4gbGlicHJveHlfMC41
LjcuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkv
bGlicHJveHlfMC41LjYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94
eV8wLjUuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlicHJveHkvbGlicHJveHlfMC41LjcuYmIKaW5kZXggNmE3MDViMzA1Zi4uODA0
NDFkNDUyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJv
eHlfMC41LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJveHlf
MC41LjcuYmIKQEAgLTE0LDcgKzE0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAogREVQRU5EUyA9ICJn
bGliLTIuMCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpYnByb3h5L2xpYnByb3h5
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgotU1JDUkVWID0gImU3ZDE4ODA2NTc1ZTIxZjk0
Y2YyZjYwMjQ2NTkzODZiMTI5Y2ExODkiCitTUkNSRVYgPSAiMjY4NmQzNWNmYTVkYjk3MGQ0YmE2
NWUyOTUxZWJjODE4M2IxYmU4MiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgbWVz
b24gcGtnY29uZmlnIGdvYmplY3QtaW50cm9zcGVjdGlvbiB2YWxhIGdpLWRvY2dlbgotLSAKMi40
NC4wCgo=

--===============1319186432308448032==--

