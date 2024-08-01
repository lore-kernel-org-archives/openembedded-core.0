Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9647CC54FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75494.1722536827650515422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J6lklW/b;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eWI4GnWH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f323a04-192aff08-ab8e-406f-81c1-1332341229f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EvxcAnt8Es98peorZBUTfndHW8RjTyL5B3OE3K81XM0=;
	b=J6lklW/b7r12G+ifwOLSW8GW4gz6quJv88vs9+2tud2pgiKxBh3YDhYtCSrZNgG+
	MlJ6JjH6cq749+qrf68TdWQAHraoP+fu15no8J5SWizzri5fVXWNIfZLhTlqCL4pyLM
	nrZPTl//ZM44OPoOO5ndsWtUn8v87zaUJBgNcVAQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EvxcAnt8Es98peorZBUTfndHW8RjTyL5B3OE3K81XM0=;
	b=eWI4GnWHeYeggFsdjC9K8aju03BZ7ljgG2Dc6kE5B9885+mceX/HHpy6C58FP98l
	omCPg76QZYmMoDzXTgTEJmS0WgZSXOGmzZrUH9JI3Q+rapDTaBCbtyk7SivH1oQbVy4
	0CMkX4arfJ8/t/6fbFJCBm4yvMRkmDPn5flZPsjo=
Content-Type: multipart/mixed; boundary="===============7857250447766974247=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.24.6 SUCCEEDED
Message-ID: <010101910f323a04-192aff08-ab8e-406f-81c1-1332341229f4-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202865

--===============7857250447766974247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.24.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.24.5-1.24.6.patch
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
From 472f59fa897a2105fc3f27f449c2f1d907c730d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 15:22:49 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.24.5 -> 1.24.6

---
 ...streamer1.0-libav_1.24.5.bb => gstreamer1.0-libav_1.24.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.5.bb => gstreamer1.0-libav_1.24.6.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
index 24c6c792c5..7a72f9120e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7fd16bdfa56ed51c40b474648fc35c4edde3e8ac934b12b82b49727b5d703521"
+SRC_URI[sha256sum] = "4bbd08481a390f907e342aa3f25ab885c80ec0a53f3b14244cf733cc8622f2bf"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.44.0


--===============7857250447766974247==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.24.5-1.24.6.patch"

RnJvbSA0NzJmNTlmYTg5N2EyMTA1ZmMzZjI3ZjQ0OWMyZjFkOTA3YzczMGQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNToyMjo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI0LjUgLT4gMS4yNC42CgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjQuNS5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNC42LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjQuNS5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yNC42LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yNC41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjI0LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjI0LjUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yNC42LmJiCmluZGV4IDI0YzZjNzkyYzUuLjdhNzJmOTEyMGUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yNC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNC42LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiN2ZkMTZiZGZhNTZlZDUxYzQwYjQ3NDY0OGZjMzVjNGVkZGUzZThh
YzkzNGIxMmI4MmI0OTcyN2I1ZDcwMzUyMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0YmJkMDg0
ODFhMzkwZjkwN2UzNDJhYTNmMjVhYjg4NWM4MGVjMGE1M2YzYjE0MjQ0Y2Y3MzNjYzg2MjJmMmJm
IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjQ0LjAKCg==

--===============7857250447766974247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 912992 to 905760 (-1%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 537167 to 534443 (-1%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.6.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.24.5" to "1.24.6"

--===============7857250447766974247==--

