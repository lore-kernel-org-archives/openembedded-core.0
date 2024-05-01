Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD71C27C50
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1139.1714579216840039726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fBPTyZ8l;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=htiLdGkn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f34e29763-9233b836-952b-4c50-a4f7-1243eda867b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mVu2Hi8VdtwGka7O78VpFbTOxoEb5lk6AVcm7OqTY0Q=;
	b=fBPTyZ8lo9qoUJp3KOLmYIu63Pp1XgJ8y44AY8apWkfO/dk1oqJYwchGY5M1CviA
	ZRsPO+IqFisoMymGInPL59gFZmZejujgWNl9RhThwuo2Ojtex0HT0GLDpK8SsZJ9NH/
	+MmhOL1qUCLK/FQQ2bvbVQ0+6x0x7NIbrg3NPFGU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mVu2Hi8VdtwGka7O78VpFbTOxoEb5lk6AVcm7OqTY0Q=;
	b=htiLdGknPAxNRmVspOKlq9Q8ivq6XHcBMGui3PsEIQJOTb3iSBUWC2vMKykkYGqr
	ygg1hIyEn+P5w+hYiCJ9MxmOMgNLdJwEHnVlYYAtqQWQjQ48014VkmP5pCoY4u8F0Nn
	ubUj97ykR42dj5rWJZskXoOsCSyd3QQ+8fQ4qau0=
Content-Type: multipart/mixed; boundary="===============3031770047336375270=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.22.12 SUCCEEDED
Message-ID: <0101018f34e29763-9233b836-952b-4c50-a4f7-1243eda867b0-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198859

--===============3031770047336375270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.22.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.22.11-1.22.12.patch
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
From 3cef490c58674551d691e07a2034e8a36971e93b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 13:48:58 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.22.11 -> 1.22.12

---
 ...{gstreamer1.0-omx_1.22.11.bb => gstreamer1.0-omx_1.22.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.11.bb => gstreamer1.0-omx_1.22.12.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.12.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.12.bb
index 97348fb398..4db16ed10b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "18dfdf5f6b773d67e62a315c6cf6247da320b83603a5819493f53c69ed2eeef6"
+SRC_URI[sha256sum] = "6b0685b92ac735032d7987d1028afaeab0a98ab726e0c51e5b9bfc8f2da7c8b1"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.44.0


--===============3031770047336375270==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.22.11-1.22.12.patch"

RnJvbSAzY2VmNDkwYzU4Njc0NTUxZDY5MWUwN2EyMDM0ZThhMzY5NzFlOTNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxMzo0ODo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1vbXg6IHVwZ3JhZGUgMS4yMi4xMSAtPiAxLjIyLjEyCgotLS0KIC4uLntnc3Ry
ZWFtZXIxLjAtb214XzEuMjIuMTEuYmIgPT4gZ3N0cmVhbWVyMS4wLW9teF8xLjIyLjEyLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLW9teF8x
LjIyLjExLmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMi4xMi5iYn0gKDk1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8x
LjIyLjExLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1vbXhfMS4yMi4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIyLjExLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9t
eF8xLjIyLjEyLmJiCmluZGV4IDk3MzQ4ZmIzOTguLjRkYjE2ZWQxMGIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIuMTEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1v
bXhfMS4yMi4xMi5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCiAKIFNSQ19V
UkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3Qtb214L2dzdC1v
bXgtJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMThkZmRmNWY2Yjc3M2Q2
N2U2MmEzMTVjNmNmNjI0N2RhMzIwYjgzNjAzYTU4MTk0OTNmNTNjNjllZDJlZWVmNiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI2YjA2ODViOTJhYzczNTAzMmQ3OTg3ZDEwMjhhZmFlYWIwYTk4YWI3
MjZlMGM1MWU1YjliZmM4ZjJkYTdjOGIxIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LW9teC0ke1BW
fSIKIAotLSAKMi40NC4wCgo=

--===============3031770047336375270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.22.11" to "1.22.12"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.22.11 [default] to 1.22.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.22.11" to "1.22.12"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.22.11 [default] to 1.22.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.22.11" to "1.22.12"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.22.11 [default] to 1.22.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.22.11" to "1.22.12"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.22.11 [default] to 1.22.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.22.11" to "1.22.12"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.22.11 [default] to 1.22.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.22.11" to "1.22.12"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.22.11 [default] to 1.22.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.22.11" to "1.22.12"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.22.11 [default] to 1.22.12 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx: PV changed from "1.22.11" to "1.22.12"
packages/core2-64-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.11.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.12.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-omx: PKGV changed from 1.22.11 [default] to 1.22.12 [default]

--===============3031770047336375270==--

