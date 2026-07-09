Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55810C4450F
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:12:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2991.1783577517416003255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gbwDjG1g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=huusMql3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f45811d22-280078f2-01e7-4a16-936a-7ee18e8e24d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577517;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=lDGAA9LvGbv6rxhhQKzWKlAEwB/dXk5cR+x7Hxx5v0I=;
	b=gbwDjG1gnpPqYwCtIr4cpkCvG0V7gYKboC0OnCj6Qv2i6F4JqooCyJeBzRO2U88D
	6HD/BMap/CzZf4MlgY/o7D26KxDKPKKnR6NBL9dWeSVbnX1icxkb8aGxw2azr9K1a23
	hytil2rTsJK7fIaNZk2n/ZuA0qhgqRHZk3QSH/1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577517;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=lDGAA9LvGbv6rxhhQKzWKlAEwB/dXk5cR+x7Hxx5v0I=;
	b=huusMql3rdNiXF9mkVlfXesf8Gp92Qa4zPCQUUcMQRyEK0rkloKxyHW8Zg+RX7O+
	izT/2/pnqinUzXc+znE3ViedSTCUYVoH8PGzAdmXgwoAptXP9WPdhiGHgjneZ2G2aSR
	A6lv3S15S+qHeMwSj2LEikGywA0CgKKa8aq13Pgw=
Content-Type: multipart/mixed; boundary="===============8019352884444142154=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.28.5 SUCCEEDED
Message-ID: <0101019f45811d22-280078f2-01e7-4a16-936a-7ee18e8e24d4-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240536

--===============8019352884444142154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.28.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.28.4-1.28.5.patch
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
From 6d91924c9e3915cefb364dfe5fe6b660432928c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 05:52:00 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.28.4 -> 1.28.5

---
 ...streamer1.0-libav_1.28.4.bb => gstreamer1.0-libav_1.28.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.4.bb => gstreamer1.0-libav_1.28.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
index 4898c42190..bda9b213a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bd17a5df2874a7a58bcbaf7b940223379ad9613624db8ead783db03e74bb904b"
+SRC_URI[sha256sum] = "452854656056f0b16511a1d9ad4f2679ff5e5a87c89f90cf7ee5dec005ddb1e4"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============8019352884444142154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-libav/1.28.4/ext/libav -> /usr/src/debug/gstreamer1.0-libav/1.28.5/ext/libav
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.28.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.28.5.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PKGV changed from 1.28.4 [default] to 1.28.5 [default]

--===============8019352884444142154==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.28.4-1.28.5.patch"

RnJvbSA2ZDkxOTI0YzllMzkxNWNlZmIzNjRkZmU1ZmU2YjY2MDQzMjkyOGM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNTo1MjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI4LjQgLT4gMS4yOC41CgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjguNC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yOC41LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjguNC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yOC41LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yOC40LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjI4LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjI4LjQu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yOC41LmJiCmluZGV4IDQ4OThjNDIxOTAuLmJkYTliMjEzYTMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yOC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yOC41LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYmQxN2E1ZGYyODc0YTdhNThiY2JhZjdiOTQwMjIzMzc5YWQ5NjEz
NjI0ZGI4ZWFkNzgzZGIwM2U3NGJiOTA0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0NTI4NTQ2
NTYwNTZmMGIxNjUxMWExZDlhZDRmMjY3OWZmNWU1YTg3Yzg5ZjkwY2Y3ZWU1ZGVjMDA1ZGRiMWU0
IgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3QtbGliYXYtJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============8019352884444142154==--

