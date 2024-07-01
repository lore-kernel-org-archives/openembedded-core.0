Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E5AC53212
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:03 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2126.1719853077726468707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Cm+Sl7Wu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Cq+xtpBk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101906f3b52d0-926558fd-9c6d-45db-8deb-64b4e9571805-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zxMTMygy2x9909f2xp/MGhgujLDYrWNORqqNyGKrcdY=;
	b=Cm+Sl7Wuizplvk7UEMTBYzVd4vhLefpqq+3QiHURyKGRWg3XWUcDftlfkrGiR1IJ
	cBeIQ1Mz7spIezN/FYVrVEZwRIsVhUgFviLGbzLiRAObmGNRVKmW3EbZgyjSPXm76eO
	jsMnt4Sl8R+j7asJ1ZHEB8pqGzXszpLua5ReQKjA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zxMTMygy2x9909f2xp/MGhgujLDYrWNORqqNyGKrcdY=;
	b=Cq+xtpBkbnSKcAV5fObyZWpZHWfJYe28O5zSPyNpIljpr6s1fn7PIVX8mhwWgZir
	WTKDPbXVPaGMDJlNFFydKbS1vCSPvoQ81IUeJgaJpnDOodA0n2z2hKvgk32jbc7x+y6
	OhaSEAR9B+wenmNf9tbCAMQ7i/lcAtiNc0KNYLaA=
Content-Type: multipart/mixed; boundary="===============7320067556160843304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.7 SUCCEEDED
Message-ID: <010101906f3b52d0-926558fd-9c6d-45db-8deb-64b4e9571805-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201393

--===============7320067556160843304==
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
From 8bbdacef7cee86ced53c80c3bd9421ba24c7bbd9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 16:28:21 +0000
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


--===============7320067556160843304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libproxy: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 149496 to 149424 (-0%)
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.6", added "/usr/lib/.debug/libproxy.so.0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGSIZE changed from 68457 to 68468 (+0%)
packages/core2-64-poky-linux/libproxy/libproxy-src: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy: PKGV changed from 0.5.6 [default] to 0.5.7 [default]
packages/core2-64-poky-linux/libproxy/libproxy: PV changed from "0.5.6" to "0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.6", added "/usr/lib/libproxy.so.0.5.7"
packages/core2-64-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.6/modules", added "/usr/lib/libproxy/0.5.7/modules"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.6 to libproxy.so.0.5.7
  /usr/lib/libproxy.so.0.5.6 moved to /usr/lib/libproxy.so.0.5.7

--===============7320067556160843304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.6", added "/usr/lib/libproxy.so.0.5.7"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.6 to libproxy.so.0.5.7
  /usr/lib/libproxy.so.0.5.6 moved to /usr/lib/libproxy.so.0.5.7

--===============7320067556160843304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.6-0.5.7.patch"

RnJvbSA4YmJkYWNlZjdjZWU4NmNlZDUzYzgwYzNiZDk0MjFiYTI0YzdiYmQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxNjoyODoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnByb3h5OiB1cGdyYWRlIDAuNS42IC0+IDAuNS43CgotLS0KIC4uLi9saWJwcm94eS97bGlicHJv
eHlfMC41LjYuYmIgPT4gbGlicHJveHlfMC41LjcuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYnByb3h5L3tsaWJwcm94eV8wLjUuNi5iYiA9PiBsaWJwcm94eV8wLjUu
Ny5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9s
aWJwcm94eV8wLjUuNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L2xpYnByb3h5
XzAuNS43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYnByb3h5L2xpYnByb3h5XzAuNS42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuNy5iYgppbmRleCA2YTcwNWIzMDVmLi44MDQ0
MWQ0NTI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94
eV8wLjUuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8w
LjUuNy5iYgpAQCAtMTQsNyArMTQsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCiBERVBFTkRTID0gImds
aWItMi4wIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGlicHJveHkvbGlicHJveHk7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiZTdkMTg4MDY1NzVlMjFmOTRj
ZjJmNjAyNDY1OTM4NmIxMjljYTE4OSIKK1NSQ1JFViA9ICIyNjg2ZDM1Y2ZhNWRiOTcwZDRiYTY1
ZTI5NTFlYmM4MTgzYjFiZTgyIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJpdCBtZXNv
biBwa2djb25maWcgZ29iamVjdC1pbnRyb3NwZWN0aW9uIHZhbGEgZ2ktZG9jZ2VuCi0tIAoyLjQ0
LjAKCg==

--===============7320067556160843304==--

