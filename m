Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1DBC3271E
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42228.1717263217935323263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IDjpZAop;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pwpAHUOW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018fd4dd397f-0bf9e973-32bd-4575-8e2f-6bbecea21f1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oIgQC/7o+8ekonlOsnfNZUCX/q3VviKITS8yHo3+DLQ=;
	b=IDjpZAopkfgL57peLDBMm22ToDgB/kjBGdCJdxPCgQ8XrP/+wRWj2ushZdLWHdAM
	LiuBR8l/sN9SECKHVMB1L2n2EsRVUo9e/vbElg+0k48/C4Z8JW+kYrksyEC74YLdRCq
	J+vxrTlUB10Hymo1IuafQhi4xzw8cWN1P7S+/mAk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oIgQC/7o+8ekonlOsnfNZUCX/q3VviKITS8yHo3+DLQ=;
	b=pwpAHUOWqHC6UHTMCuK6GAkLlp3/sWJIrmF2VI6o8RralP1KkIfPc2cGGWm5ZECn
	luyyq0awP4m5xP14nZHflKZHzVCq87v7kwDlEf/UMRbSDu4I0oNM176Q1GZARHzhdwr
	vu1prGR5VSuVJJX13N1HvjwT/dyDNkmgbdocGr5E=
Content-Type: multipart/mixed; boundary="===============3232437093539510999=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.24.4 SUCCEEDED
Message-ID: <0101018fd4dd397f-0bf9e973-32bd-4575-8e2f-6bbecea21f1b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200167

--===============3232437093539510999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.24.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.24.3-1.24.4.patch
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
From f060d47238d01ee3ea8c15997811d79f9a91bf35 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 15:11:02 +0000
Subject: [PATCH] gstreamer1.0-rtsp-server: upgrade 1.24.3 -> 1.24.4

---
 ...rtsp-server_1.24.3.bb => gstreamer1.0-rtsp-server_1.24.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.3.bb => gstreamer1.0-rtsp-server_1.24.4.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
index f63d61b2c9..13431ed788 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "62628ecca78b8f5b51c59a4d602c65e9205ffc50c3c83cd61fab1f6348b63565"
+SRC_URI[sha256sum] = "eeca811cef6312fa21433294ae216b3c6fa0a389d8980727102516bdcf973eae"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.44.0


--===============3232437093539510999==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.24.3-1.24.4.patch"

RnJvbSBmMDYwZDQ3MjM4ZDAxZWUzZWE4YzE1OTk3ODExZDc5ZjlhOTFiZjM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNToxMTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1ydHNwLXNlcnZlcjogdXBncmFkZSAxLjI0LjMgLT4gMS4yNC40CgotLS0KIC4u
LnJ0c3Atc2VydmVyXzEuMjQuMy5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC40
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4w
LXJ0c3Atc2VydmVyXzEuMjQuMy5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC40
LmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC4zLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0LjQuYmIKc2ltaWxh
cml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC40
LmJiCmluZGV4IGY2M2Q2MWIyYzkuLjEzNDMxZWQ3ODggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC4zLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRz
cC1zZXJ2ZXJfMS4yNC40LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVBTCA9ICJnc3QtcnRzcC1z
ZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3Ny
Yy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjYyNjI4ZWNjYTc4YjhmNWI1MWM1OWE0ZDYwMmM2NWU5MjA1ZmZjNTBjM2M4M2NkNjFmYWIx
ZjYzNDhiNjM1NjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWVjYTgxMWNlZjYzMTJmYTIxNDMz
Mjk0YWUyMTZiM2M2ZmEwYTM4OWQ4OTgwNzI3MTAyNTE2YmRjZjk3M2VhZSIKIAogUyA9ICIke1dP
UktESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi40NC4wCgo=

--===============3232437093539510999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2403.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2404.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.4.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2403.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2404.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2403.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2404.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2403.0 to libgstrtspserver-1.0.so.0.2404.0
  /usr/lib/libgstrtspserver-1.0.so.0.2403.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2404.0

--===============3232437093539510999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2403.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2404.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2403.0 to libgstrtspserver-1.0.so.0.2404.0
  /usr/lib/libgstrtspserver-1.0.so.0.2403.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2404.0

--===============3232437093539510999==--

