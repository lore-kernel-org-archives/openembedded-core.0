Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135D1C52D7B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1368.1721071146842268588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aORO1PmK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hW73XcRL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010190b7d59d38-8c445c41-ef2c-4be4-81b4-13e71c8817e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IXs9GbXDcXKmi5qFuzRQAHg/U8+YnS31oE1KxZgIuJE=;
	b=aORO1PmKRTAa+N0Yjz05sZfMm6G8q6LWb6zWyX2jllqQqDckyX3t50WIpnzwzuS8
	JhBBKQfK4Fq4aXFKChMmRHcgfGyWeX1eB8NmdD2Y8EN4hKYoxEku0PFUam8bu5awbf8
	SrHT2S3Vp/vX4dnr3c/adbTq8etMFeGj/Jd/LeOw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IXs9GbXDcXKmi5qFuzRQAHg/U8+YnS31oE1KxZgIuJE=;
	b=hW73XcRLhC5OItaI4/H2w6OAPPNI8a8WwN42N/FnhhmobWadDWTIeuu3EXFpcJAS
	HVmPk2ju4VUKhXIIx3EgiPtxVyHKnxsTxtSxdDQ+C+xkeVsMw18vGIHVU0WbmmwD251
	a8fawxGp4/f3pJYxcHLlZV+4+ajxuwoPDJ6E4NTs=
Content-Type: multipart/mixed; boundary="===============8428246336281620290=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.24.5 SUCCEEDED
Message-ID: <01010190b7d59d38-8c445c41-ef2c-4be4-81b4-13e71c8817e4-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202030

--===============8428246336281620290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.24.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.24.4-1.24.5.patch
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
From 38aef5c2bb93b51f99050329a7d3510dfb7a25e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 16:33:42 +0000
Subject: [PATCH] gstreamer1.0-rtsp-server: upgrade 1.24.4 -> 1.24.5

---
 ...rtsp-server_1.24.4.bb => gstreamer1.0-rtsp-server_1.24.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.4.bb => gstreamer1.0-rtsp-server_1.24.5.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
index 13431ed788..9971eee48e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eeca811cef6312fa21433294ae216b3c6fa0a389d8980727102516bdcf973eae"
+SRC_URI[sha256sum] = "a3062665e41814d3dba3e02b7b06b77326d54d2b6f178ffcb196af9b91a1bfb9"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.44.0


--===============8428246336281620290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2404.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2405.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2404.0 to libgstrtspserver-1.0.so.0.2405.0
  /usr/lib/libgstrtspserver-1.0.so.0.2404.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2405.0

--===============8428246336281620290==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.24.4-1.24.5.patch"

RnJvbSAzOGFlZjVjMmJiOTNiNTFmOTkwNTAzMjlhN2QzNTEwZGZiN2EyNWUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTY6MzM6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXI6IHVwZ3JhZGUgMS4yNC40IC0+IDEuMjQuNQoKLS0tCiAu
Li5ydHNwLXNlcnZlcl8xLjI0LjQuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQu
NS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEu
MC1ydHNwLXNlcnZlcl8xLjI0LjQuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQu
NS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuNC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC41LmJiCnNpbWls
YXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC40LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQu
NS5iYgppbmRleCAxMzQzMWVkNzg4Li45OTcxZWVlNDhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuNC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0
c3Atc2VydmVyXzEuMjQuNS5iYgpAQCAtMTAsNyArMTAsNyBAQCBQTlJFQUwgPSAiZ3N0LXJ0c3At
c2VydmVyIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9z
cmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJlZWNhODExY2VmNjMxMmZhMjE0MzMyOTRhZTIxNmIzYzZmYTBhMzg5ZDg5ODA3MjcxMDI1
MTZiZGNmOTczZWFlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEzMDYyNjY1ZTQxODE0ZDNkYmEz
ZTAyYjdiMDZiNzczMjZkNTRkMmI2ZjE3OGZmY2IxOTZhZjliOTFhMWJmYjkiCiAKIFMgPSAiJHtX
T1JLRElSfS8ke1BOUkVBTH0tJHtQVn0iCiAKLS0gCjIuNDQuMAoK

--===============8428246336281620290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2404.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2405.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.5.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2404.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2405.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2404.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2405.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2404.0 to libgstrtspserver-1.0.so.0.2405.0
  /usr/lib/libgstrtspserver-1.0.so.0.2404.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2405.0

--===============8428246336281620290==--

