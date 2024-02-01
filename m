Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B68AC48BF6
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2101.1706810405467394132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TtWMXgE+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RHl4QAUo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d65d3fab2-061b7d2f-5cd1-48e2-9da9-81f08acdbc69-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xaLz1P2KwGF7PjwwNd3caZjgEvSl2sW8jxKh0G0hndk=;
	b=TtWMXgE+l73ce9kz197Q+Oq9ct7904v5XHOIGAEGYc/BixPFbhrcRXBmcEn5XXBW
	eyKZHtK/i0YGqrY2z5L3Hivn8eLZZdrZGyJZLiEiJ32V4lxB1N5z8vek9AUhxVJEysR
	2irYP2GPSQMyw2c6YedLknXwjuBwHFjjxtQeHwOI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xaLz1P2KwGF7PjwwNd3caZjgEvSl2sW8jxKh0G0hndk=;
	b=RHl4QAUoYuPsnWULdJ0G4o+OSlIUSwdEXCJzsb7aYRlFZ7UUj48Z8Qj5o725XIVV
	4Xrm245Pyc4BPgO0ndK88gEp2kO8UuAkFNSNMegEvXQ9886S+DFyCOy6gDJppDCB0qN
	mTfqBQBG8a1PA6UncG98MdIMohXk+8aHm+QuxOs8=
Content-Type: multipart/mixed; boundary="===============3732604430870992399=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.22.9 SUCCEEDED
Message-ID: <0101018d65d3fab2-061b7d2f-5cd1-48e2-9da9-81f08acdbc69-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194690

--===============3732604430870992399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.22.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.22.8-1.22.9.patch
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
From 902795cea3eed512766c9ffcc41966955332414f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 14:34:44 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.22.8 -> 1.22.9

---
 ...streamer1.0-libav_1.22.8.bb => gstreamer1.0-libav_1.22.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.8.bb => gstreamer1.0-libav_1.22.9.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
index 7c75173989..10536acc87 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "be39349bc07ab4cdbd9a5fd6ea9848c601c7560ba5a0577ad5200b83bd424981"
+SRC_URI[sha256sum] = "192f7d27d21c1e7c72c339a2647a9b0c247fedc62ea5029115f8c3e22ebb87d8"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.42.0


--===============3732604430870992399==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.22.8-1.22.9.patch"

RnJvbSA5MDI3OTVjZWEzZWVkNTEyNzY2YzlmZmNjNDE5NjY5NTUzMzI0MTRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNDozNDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjIyLjggLT4gMS4yMi45CgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjIuOC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yMi45LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjIuOC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yMi45LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yMi44LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjIyLjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjIyLjgu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yMi45LmJiCmluZGV4IDdjNzUxNzM5ODkuLjEwNTM2YWNjODcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yMi44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yMi45LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYmUzOTM0OWJjMDdhYjRjZGJkOWE1ZmQ2ZWE5ODQ4YzYwMWM3NTYw
YmE1YTA1NzdhZDUyMDBiODNiZDQyNDk4MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxOTJmN2Qy
N2QyMWMxZTdjNzJjMzM5YTI2NDdhOWIwYzI0N2ZlZGM2MmVhNTAyOTExNWY4YzNlMjJlYmI4N2Q4
IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjQyLjAKCg==

--===============3732604430870992399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.8.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.9.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.22.8 [default] to 1.22.9 [default]

--===============3732604430870992399==--

