Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F18D5C0F9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17389.1765872134497055278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=onqXhq5i;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UZNf3Cwb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262e66de-9cf18e2f-9865-46a9-bbfa-21b73f85fec8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bErtzydQZgAgHa0bm+C3Ch0tMO4lHytqoUN32gdiwsA=;
	b=onqXhq5i3bH0BpQHbBNoL+qROUWDuyOsBMo1TgBZtiaqzynnbIpgvfrItcTJWyaA
	57G9uu1tcyKRiTMVy1b58IDNyD+3yFH6wTWV9abaDXeYmtmLIbK1yRPYLCTIwiPDb9Y
	eF7zkGri8g+Ec1uRJDKoyWUuDkVMXkXec5ymb0is=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bErtzydQZgAgHa0bm+C3Ch0tMO4lHytqoUN32gdiwsA=;
	b=UZNf3CwbjE98hEdrhE2Zokkx23JoXdgYKLWmkp5rPUyp3amN6xBJUsJbKsiMmEDo
	NH+QWL6LqcOUwFP/VBphlMt20QVNNm8w5CQQ3zCzT6p/hOem231fjI2GzH5HZvJNE0o
	lCoriyd8tvkWxJvphlh2sXw8oB9R1bBj+uRgJLwk=
Content-Type: multipart/mixed; boundary="===============1297691705100541274=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xkbcomp: upgrading to 1.5.0 SUCCEEDED
Message-ID: <0101019b262e66de-9cf18e2f-9865-46a9-bbfa-21b73f85fec8-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227773

--===============1297691705100541274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xkbcomp* to *1.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xkbcomp-upgrade-1.4.7-1.5.0.patch
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
From c8ffacbfd09a90faa0d309234420feaf490dbadd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 21:21:47 +0000
Subject: [PATCH] xkbcomp: upgrade 1.4.7 -> 1.5.0

---
 .../xorg-app/{xkbcomp_1.4.7.bb => xkbcomp_1.5.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.7.bb => xkbcomp_1.5.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
index f259f33dd8..67bed254ac 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
@@ -16,4 +16,4 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF += "--disable-selective-werror"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "0a288114e5f44e31987042c79aecff1ffad53a8154b8ec971c24a69a80f81f77"
+SRC_URI[sha256sum] = "2ac31f26600776db6d9cd79b3fcd272263faebac7eb85fb2f33c7141b8486060"
-- 
2.47.1


--===============1297691705100541274==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xkbcomp-upgrade-1.4.7-1.5.0.patch"

RnJvbSBjOGZmYWNiZmQwOWE5MGZhYTBkMzA5MjM0NDIwZmVhZjQ5MGRiYWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjE6MjE6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
a2Jjb21wOiB1cGdyYWRlIDEuNC43IC0+IDEuNS4wCgotLS0KIC4uLi94b3JnLWFwcC97eGtiY29t
cF8xLjQuNy5iYiA9PiB4a2Jjb21wXzEuNS4wLmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWFwcC97eGtiY29tcF8xLjQuNy5iYiA9PiB4a2Jjb21wXzEuNS4w
LmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94
a2Jjb21wXzEuNC43LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hrYmNvbXBf
MS41LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctYXBwL3hrYmNvbXBfMS40LjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWFwcC94a2Jjb21wXzEuNS4wLmJiCmluZGV4IGYyNTlmMzNkZDguLjY3YmVk
MjU0YWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94a2Jjb21w
XzEuNC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94a2Jjb21wXzEu
NS4wLmJiCkBAIC0xNiw0ICsxNiw0IEBAIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgogRVhUUkFf
T0VDT05GICs9ICItLWRpc2FibGUtc2VsZWN0aXZlLXdlcnJvciIKIAogU1JDX1VSSV9FWFQgPSAi
eHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGEyODgxMTRlNWY0NGUzMTk4NzA0MmM3OWFlY2Zm
MWZmYWQ1M2E4MTU0YjhlYzk3MWMyNGE2OWE4MGY4MWY3NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIyYWMzMWYyNjYwMDc3NmRiNmQ5Y2Q3OWIzZmNkMjcyMjYzZmFlYmFjN2ViODVmYjJmMzNjNzE0
MWI4NDg2MDYwIgotLSAKMi40Ny4xCgo=

--===============1297691705100541274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-dev: PKGSIZE changed from 187 to 271 (+45%)
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-dev: RDEPENDS: added "libx11-dev libxkbfile-dev"

--===============1297691705100541274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xkbcomp: PKGV changed from 1.4.7 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/xkbcomp: SRC_URI changed from "https://www.x.org/releases//individual/app/xkbcomp-1.4.7.tar.xz" to "https://www.x.org/releases//individual/app/xkbcomp-1.5.0.tar.xz"
packages/x86-64-v3-poky-linux/xkbcomp: PV changed from "1.4.7" to "1.5.0"
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-dbg: PKGV changed from 1.4.7 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-dbg: PV changed from "1.4.7" to "1.5.0"
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-dbg: PKGSIZE changed from 628000 to 630784 (+0%)
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-dev: PKGV changed from 1.4.7 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-dev: PV changed from "1.4.7" to "1.5.0"
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-dev: RDEPENDS: added "libxkbfile-dev libx11-dev"
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-dev: PKGSIZE changed from 187 to 271 (+45%)
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-doc: PKGV changed from 1.4.7 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-doc: PV changed from "1.4.7" to "1.5.0"
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-doc: PKGSIZE changed from 4274 to 4354 (+2%)
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-locale: PKGV changed from 1.4.7 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-locale: PV changed from "1.4.7" to "1.5.0"
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-src: PKGV changed from 1.4.7 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-src: FILELIST: directory renamed /usr/src/debug/xkbcomp/1.4.7 -> /usr/src/debug/xkbcomp/1.5.0
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-src: PV changed from "1.4.7" to "1.5.0"
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-src: PKGSIZE changed from 709044 to 714763 (+1%)
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-staticdev: PKGV changed from 1.4.7 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp-staticdev: PV changed from "1.4.7" to "1.5.0"
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp: PKGV changed from 1.4.7 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/xkbcomp/xkbcomp: PV changed from "1.4.7" to "1.5.0"

--===============1297691705100541274==--

