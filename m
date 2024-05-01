Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303D0C25B74
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:20 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1125.1714579217202221813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Wov8Lw98;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=yDsDicS4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f34e2992a-1b9a1a3b-92aa-41a6-9e52-9814c7f6e4fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UOjMjnJz7D/0HWtYRMZpjZyEgy0+yITziuUdgyDhUhE=;
	b=Wov8Lw98c+etF2u8trpUtveYNvEaQ7SIBIP9rwzdTy0YvdyM5743L86bPjdk787e
	38WnCOavd9dEP928yzeWvaE4PVd6Fw82yAjlkU375nC5ZBhlOm+bC9cLKW76YsjxPEr
	0JtZvb5O4DNCN4Vc9javnIgyjNMptLYo+hvShXS8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UOjMjnJz7D/0HWtYRMZpjZyEgy0+yITziuUdgyDhUhE=;
	b=yDsDicS4MHBo936S1cJNIfy4AT8LUuIzkImWd4I1zMGoRxtlizbTeDm28iviF3Ro
	DPfdd8XWIeNqjAH6WFFJGvNT0gg9xekd4A7X0vanlL16dYHCKHK8qFSNc9hHITOi4v6
	Wl27mvcnjEDi1QmEZNrljnIlHn6OTq+LrYXuujlk=
Content-Type: multipart/mixed; boundary="===============8851410305394049687=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.6 SUCCEEDED
Message-ID: <0101018f34e2992a-1b9a1a3b-92aa-41a6-9e52-9814c7f6e4fc-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198877

--===============8851410305394049687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libproxy* to *0.5.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.4-0.5.6.patch
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
From 60512ff98fb8f54e533266c94f11cf582d7fa36e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 15:33:06 +0000
Subject: [PATCH] libproxy: upgrade 0.5.4 -> 0.5.6

---
 .../libproxy/{libproxy_0.5.4.bb => libproxy_0.5.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.4.bb => libproxy_0.5.6.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.4.bb b/meta/recipes-support/libproxy/libproxy_0.5.6.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.4.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.6.bb
index b4f4c6d254..6a705b305f 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.4.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.6.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "dff9a603d823dcc740ec966cd27960daa6b891b1"
+SRCREV = "e7d18806575e21f94cf2f6024659386b129ca189"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.44.0


--===============8851410305394049687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 135592 to 150640 (+11%)
packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.4", added "/usr/lib/libproxy.so.0.5.6"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.4 to libproxy.so.0.5.6
  /usr/lib/libproxy.so.0.5.4 moved to /usr/lib/libproxy.so.0.5.6

--===============8851410305394049687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libproxy: PKGV changed from 0.5.4 [default] to 0.5.6 [default]
packages/core2-64-poky-linux/libproxy: PV changed from "0.5.4" to "0.5.6"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 135592 to 150640 (+11%)
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.4 [default] to 0.5.6 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.4", added "/usr/lib/.debug/libproxy.so.0.5.6"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.4" to "0.5.6"
packages/core2-64-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.4 [default] to 0.5.6 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.4" to "0.5.6"
packages/core2-64-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.4 [default] to 0.5.6 [default]
packages/core2-64-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.4" to "0.5.6"
packages/core2-64-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.4 [default] to 0.5.6 [default]
packages/core2-64-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.4" to "0.5.6"
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGSIZE changed from 62614 to 68457 (+9%)
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.4 [default] to 0.5.6 [default]
packages/core2-64-poky-linux/libproxy/libproxy-src: FILELIST: directory renamed /usr/src/debug/libproxy/0.5.4/src/backend/plugins/config-kde -> /usr/src/debug/libproxy/0.5.6/src/backend/plugins/config-kde, directory renamed /usr/src/debug/libproxy/0.5.4/src/libproxy -> /usr/src/debug/libproxy/0.5.6/src/libproxy, directory renamed /usr/src/debug/libproxy/0.5.4/src/backend/plugins/config-sysconfig -> /usr/src/debug/libproxy/0.5.6/src/backend/plugins/config-sysconfig, directory renamed /usr/src/debug/libproxy/0.5.4/src/tools -> /usr/src/debug/libproxy/0.5.6/src/tools, directory renamed /usr/src/debug/libproxy/0.5.4/src/backend/plugins/config-env -> /usr/src/debug/libproxy/0.5.6/src/backend/plugins/config-env, directory renamed /usr/src/debug/libproxy/0.5.4/src/backend -> /usr/src/debug/libproxy/0.5.6/src/backend, added "/usr/src/debug/libproxy/0.5.6/src/backend/plugins/config-xdp/config-xdp.h /usr/src/debug/libproxy/0.5.6/src/backend/plugins/config-xdp/config-xdp.c"
packages/core2-64-poky-linux/libproxy/libproxy-src: PV changed from "0.5.4" to "0.5.6"
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.4 [default] to 0.5.6 [default]
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.4" to "0.5.6"
packages/core2-64-poky-linux/libproxy/libproxy: PKGSIZE changed from 64017 to 68113 (+6%)
packages/core2-64-poky-linux/libproxy/libproxy: PKGV changed from 0.5.4 [default] to 0.5.6 [default]
packages/core2-64-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.4/modules", added "/usr/lib/libproxy/0.5.6/modules"
packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.4", added "/usr/lib/libproxy.so.0.5.6"
packages/core2-64-poky-linux/libproxy/libproxy: PV changed from "0.5.4" to "0.5.6"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.4 to libproxy.so.0.5.6
  /usr/lib/libproxy.so.0.5.4 moved to /usr/lib/libproxy.so.0.5.6

--===============8851410305394049687==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.4-0.5.6.patch"

RnJvbSA2MDUxMmZmOThmYjhmNTRlNTMzMjY2Yzk0ZjExY2Y1ODJkN2ZhMzZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxNTozMzowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnByb3h5OiB1cGdyYWRlIDAuNS40IC0+IDAuNS42CgotLS0KIC4uLi9saWJwcm94eS97bGlicHJv
eHlfMC41LjQuYmIgPT4gbGlicHJveHlfMC41LjYuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYnByb3h5L3tsaWJwcm94eV8wLjUuNC5iYiA9PiBsaWJwcm94eV8wLjUu
Ni5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9s
aWJwcm94eV8wLjUuNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L2xpYnByb3h5
XzAuNS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYnByb3h5L2xpYnByb3h5XzAuNS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuNi5iYgppbmRleCBiNGY0YzZkMjU0Li42YTcw
NWIzMDVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94
eV8wLjUuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8w
LjUuNi5iYgpAQCAtMTQsNyArMTQsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCiBERVBFTkRTID0gImds
aWItMi4wIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGlicHJveHkvbGlicHJveHk7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiZGZmOWE2MDNkODIzZGNjNzQw
ZWM5NjZjZDI3OTYwZGFhNmI4OTFiMSIKK1NSQ1JFViA9ICJlN2QxODgwNjU3NWUyMWY5NGNmMmY2
MDI0NjU5Mzg2YjEyOWNhMTg5IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJpdCBtZXNv
biBwa2djb25maWcgZ29iamVjdC1pbnRyb3NwZWN0aW9uIHZhbGEgZ2ktZG9jZ2VuCi0tIAoyLjQ0
LjAKCg==

--===============8851410305394049687==--

