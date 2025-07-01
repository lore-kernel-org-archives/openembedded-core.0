Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B153C87FD1
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:36 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1403.1751386801499103242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YLaryJJ9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=A52WErz7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010197c6ca320e-2c541bd5-eb98-477a-93cb-fe97b9d1b369-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386829;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N7uGJ4YODskYgEeyt31/az6fXOepaaLR6YgeQReg2Jw=;
	b=YLaryJJ9ws5EUqjHUeD6XYfup5sDAkAu2bzISRXlQSz29NK7yayHiwncLd+DmBSV
	nyrDmlxGhGFAGHaWkp/r0CtQj10Z7QdCg50nzKtNHW35H8TJK0VOUMRbF9gYslA3hn4
	GEkLd2NqVBrmIkuesSyXIG4bqmyzlH7U2hmKZR0o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386829;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N7uGJ4YODskYgEeyt31/az6fXOepaaLR6YgeQReg2Jw=;
	b=A52WErz7FrpqNJmHKnOrtHqEQ/2re12cZyv97G7CWjZmpjXkkkEdpfFFHu1vxGvS
	dBcqO9L+y0+CgsL28xycioMmixfNZ/TZyQ+mzOhxpAwQ4H358zGAsm0JRYIhU+/aT1E
	NBrGCXoRdgHPTkhF1ErL7Aio497WbyArHW9MF8t0=
Content-Type: multipart/mixed; boundary="===============4811330299460488164=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.26.3 SUCCEEDED
Message-ID: <01010197c6ca320e-2c541bd5-eb98-477a-93cb-fe97b9d1b369-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219690

--===============4811330299460488164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-vaapi* to *1.26.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.26.2-1.26.3.patch
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
From c50775c7a23a7ad53a67a3787fe72b881d4b7a53 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 15:20:58 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.26.2 -> 1.26.3

---
 ...streamer1.0-vaapi_1.26.2.bb => gstreamer1.0-vaapi_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.2.bb => gstreamer1.0-vaapi_1.26.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.3.bb
index 9b8aaf09df..98eba8bcdb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "0e24194236ed3b7f06f90e90efdf17f3f5ee39132e20081189a6c7690601051a"
+SRC_URI[sha256sum] = "2d643fbd1420297da5a4d6945d11f0a5b4f82feea54ea6aec9368d42995d8b03"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.47.1


--===============4811330299460488164==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.26.2-1.26.3.patch"

RnJvbSBjNTA3NzVjN2EyM2E3YWQ1M2E2N2EzNzg3ZmU3MmI4ODFkNGI3YTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNToyMDo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC12YWFwaTogdXBncmFkZSAxLjI2LjIgLT4gMS4yNi4zCgotLS0KIC4uLnN0cmVh
bWVyMS4wLXZhYXBpXzEuMjYuMi5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yNi4zLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjYuMi5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yNi4zLmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFh
cGlfMS4yNi4yLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC12YWFwaV8xLjI2LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12YWFwaV8xLjI2LjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtdmFhcGlfMS4yNi4zLmJiCmluZGV4IDliOGFhZjA5ZGYuLjk4ZWJhOGJjZGIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlf
MS4yNi4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yNi4zLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2
YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjLyR7
UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MGUyNDE5NDIzNmVkM2I3ZjA2ZjkwZTkwZWZkZjE3ZjNmNWVlMzkxMzJlMjAwODExODlhNmM3Njkw
NjAxMDUxYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyZDY0M2ZiZDE0MjAyOTdkYTVhNGQ2OTQ1
ZDExZjBhNWI0ZjgyZmVlYTU0ZWE2YWVjOTM2OGQ0Mjk5NWQ4YjAzIgogCiBTID0gIiR7VU5QQUNL
RElSfS8ke1JFQUxQTn0tJHtQVn0iCiBERVBFTkRTID0gImxpYnZhIGdzdHJlYW1lcjEuMCBnc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYXNlIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZCIKLS0gCjIuNDcu
MQoK

--===============4811330299460488164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.26.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.26.3.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi: PV changed from "1.26.2" to "1.26.3"

--===============4811330299460488164==--

