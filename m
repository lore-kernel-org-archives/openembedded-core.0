Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B986C54E64
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2157.1706810405701359527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YW+6R9w5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kUnb0hW4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d65d3fabd-3710b203-807e-45dd-8d94-8cbef2ed6c17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k+fK4Efc3PairjmiQr9V8g0MwpGkmuiEUTTHMD2ByFk=;
	b=YW+6R9w5cRA1MBjShVaNg8O6btf9bSYWOQWeuAnyVIijVOvvJ/++JcvqJpqNKZL0
	x7r4YB9z77E672zZc9P7GCOXwKU3QfR7l/o+vP+XeW0FFK1wJbZlfw9wgLmDrqWsVt2
	MFyiiZZJyiPOyaO250uLutjz7/5rm0tyMXMnZtyI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k+fK4Efc3PairjmiQr9V8g0MwpGkmuiEUTTHMD2ByFk=;
	b=kUnb0hW4XUXLUA6QkbndUghpgb0j26VMrFpXxYK4raIc3W/LtJLMicOCVifp283A
	I+hwXXXztRDFWj2h3+01U6Ej7U32AVyLPCUbZ0o9lISvr7uU4ToYdia+LXVwkI59UXi
	Vbgjs8KkiqtZkM7JbZ5WMVxhjOibKQNnZ3bvA/Yo=
Content-Type: multipart/mixed; boundary="===============4250862368329364293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.22.9 SUCCEEDED
Message-ID: <0101018d65d3fabd-3710b203-807e-45dd-8d94-8cbef2ed6c17-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194691

--===============4250862368329364293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.22.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.22.8-1.22.9.patch
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
From cb8f6aa6c895af08bbb0b5687752eee25c6061af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 14:40:44 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.22.8 -> 1.22.9

---
 .../{gstreamer1.0-omx_1.22.8.bb => gstreamer1.0-omx_1.22.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.8.bb => gstreamer1.0-omx_1.22.9.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
index 5aa9c9cc41..05d64748bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "94df10e7713618f0c8a4223f6e047f2d8f0ccecba1d585618e791f13037762df"
+SRC_URI[sha256sum] = "9362d6117985d09dcf6e27bdaef377dc08efb7df01d00101d04fb644addac61e"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.42.0


--===============4250862368329364293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.22.8-1.22.9.patch"

RnJvbSBjYjhmNmFhNmM4OTVhZjA4YmJiMGI1Njg3NzUyZWVlMjVjNjA2MWFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNDo0MDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1vbXg6IHVwZ3JhZGUgMS4yMi44IC0+IDEuMjIuOQoKLS0tCiAuLi4ve2dzdHJl
YW1lcjEuMC1vbXhfMS4yMi44LmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMi45LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1vbXhfMS4y
Mi44LmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMi45LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
OC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214
XzEuMjIuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIyLjguYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
OS5iYgppbmRleCA1YWE5YzljYzQxLi4wNWQ2NDc0OGJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIyLjguYmIKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi45
LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIAogU1JDX1VSSSA9ICJodHRw
czovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1vbXgvZ3N0LW9teC0ke1BWfS50
YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NGRmMTBlNzcxMzYxOGYwYzhhNDIyM2Y2
ZTA0N2YyZDhmMGNjZWNiYTFkNTg1NjE4ZTc5MWYxMzAzNzc2MmRmIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjkzNjJkNjExNzk4NWQwOWRjZjZlMjdiZGFlZjM3N2RjMDhlZmI3ZGYwMWQwMDEwMWQw
NGZiNjQ0YWRkYWM2MWUiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3Qtb214LSR7UFZ9IgogCi0tIAoy
LjQyLjAKCg==

--===============4250862368329364293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.8.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.9.tar.xz"

--===============4250862368329364293==--

