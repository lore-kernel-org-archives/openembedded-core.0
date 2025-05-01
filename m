Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4056C5B549
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:34:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1782.1746113612990327236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hk9Ofh8k;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XnY8TBmT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101968c7bb42e-29323da8-6bc7-454a-b593-835c21fb0008-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113639;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pN8A9RzLpcV8GUmij0IHKhRJg0nHxi21Mv2LBQ8Nqe4=;
	b=hk9Ofh8kyaauRWRb0mXN9OEx6W35QbnOb80t7joL26n6su0fK4MWmB2lsviBTHQ5
	NEFBP+s3G78VuMIuwMAZeH+gxtfo5J3yPZB3KzrQJW5U/r6A5nefsNzK0XlIUJd/KA4
	YfdI1EmRVuDZoXI//z/aOsQcW7Ew70RJGWit8YOs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113639;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pN8A9RzLpcV8GUmij0IHKhRJg0nHxi21Mv2LBQ8Nqe4=;
	b=XnY8TBmTyw2pS1k8A8mJiRdvO2vht0qY4j8kw9Qt3rkgMnZSwF1S+2XE19MV6yfd
	ZxGK8G5vevluq7bg1z1Gk82l3G4mnpKuV4sQeMYk1shW+FW3RS6SUKMeXVbmbeE4wZ4
	4NdVLUg8MEpXO8z15bwMAGBMOSrWa0KPET0rw8Uc=
Content-Type: multipart/mixed; boundary="===============7710513336716537808=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.4 SUCCEEDED
Message-ID: <010101968c7bb42e-29323da8-6bc7-454a-b593-835c21fb0008-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215888

--===============7710513336716537808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.2-2.8.4.patch
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
From 1196628aed0d823b67d524fa3b2be94d774dce56 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 14:39:34 +0000
Subject: [PATCH] enchant2: upgrade 2.8.2 -> 2.8.4

---
 .../enchant/{enchant2_2.8.2.bb => enchant2_2.8.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.2.bb => enchant2_2.8.4.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.2.bb b/meta/recipes-support/enchant/enchant2_2.8.4.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.2.bb
rename to meta/recipes-support/enchant/enchant2_2.8.4.bb
index e26fb640f4..a5479a0e7d 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8f19535adb5577b83b00e02f330fe9b9eb40dd21f19e2899636fc4d3a7696375"
+SRC_URI[sha256sum] = "e28f98208df5f99320d6a05cd49f83420bf71e69052debe3b343c9bb15c833ed"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============7710513336716537808==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.2-2.8.4.patch"

RnJvbSAxMTk2NjI4YWVkMGQ4MjNiNjdkNTI0ZmEzYjJiZTk0ZDc3NGRjZTU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxNDozOTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuOC4yIC0+IDIuOC40CgotLS0KIC4uLi9lbmNoYW50L3tlbmNoYW50
Ml8yLjguMi5iYiA9PiBlbmNoYW50Ml8yLjguNC5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuOC4yLmJiID0+IGVuY2hhbnQyXzIuOC40
LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5j
aGFudDJfMi44LjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIu
OC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjQuYmIKaW5kZXggZTI2ZmI2NDBmNC4uYTU0NzlhMGU3
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjgu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC40LmJi
CkBAIC0xMiw3ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ3JvZmYtbmF0aXZlIgogaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGdpdGh1Yi1yZWxlYXNlcwogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vZW5jaGFudC0ke1BWfS50YXIuZ3oiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOGYxOTUzNWFkYjU1NzdiODNiMDBlMDJmMzMwZmU5YjllYjQw
ZGQyMWYxOWUyODk5NjM2ZmM0ZDNhNzY5NjM3NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMjhm
OTgyMDhkZjVmOTkzMjBkNmEwNWNkNDlmODM0MjBiZjcxZTY5MDUyZGViZTNiMzQzYzliYjE1Yzgz
M2VkIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3JydGhvbWFzL2Vu
Y2hhbnQvcmVsZWFzZXMiCiAKLS0gCjIuNDcuMQoK

--===============7710513336716537808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.2 [default] to 2.8.4 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.2" to "2.8.4"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 374072 to 458768 (+23%)
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.2", added "/usr/lib/.debug/libenchant-2.so.2.8.4"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.2 [default] to 2.8.4 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.2" to "2.8.4"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.2 [default] to 2.8.4 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.2" to "2.8.4"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGSIZE changed from 23346 to 23339 (-0%)
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.2 [default] to 2.8.4 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.2" to "2.8.4"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.2 [default] to 2.8.4 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.8.2" to "2.8.4"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 356917 to 469057 (+31%)
packages/core2-64-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.8.2/lib -> /usr/src/debug/enchant2/2.8.4/lib, added "/usr/src/debug/enchant2/2.8.4/src/util.c /usr/src/debug/enchant2/2.8.4/src/enchant.c /usr/src/debug/enchant2/2.8.4/src/enchant-lsmod.c /usr/src/debug/enchant2/2.8.4/src/enchant.vala /usr/src/debug/enchant2/2.8.4/src/util.vala /usr/src/debug/enchant2/2.8.4/src/enchant-lsmod.vala"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.2 [default] to 2.8.4 [default]
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.2" to "2.8.4"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.8.2 [default] to 2.8.4 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.8.2" to "2.8.4"
packages/core2-64-poky-linux/enchant2/enchant2: PKGSIZE changed from 123330 to 135618 (+10%)
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.2", added "/usr/lib/libenchant-2.so.2.8.4"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.8.2 [default] to 2.8.4 [default]
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.2/enchant-2.8.2.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.4/enchant-2.8.4.tar.gz"
packages/core2-64-poky-linux/enchant2: PV changed from "2.8.2" to "2.8.4"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.2 to libenchant-2.so.2.8.4
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.2 to libenchant-2.so.2.8.4
  /usr/lib/libenchant-2.so.2.8.2 moved to /usr/lib/libenchant-2.so.2.8.4

--===============7710513336716537808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 374072 to 458768 (+23%)
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 356917 to 469057 (+31%)
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.2", added "/usr/lib/libenchant-2.so.2.8.4"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.2 to libenchant-2.so.2.8.4
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.2 to libenchant-2.so.2.8.4
  /usr/lib/libenchant-2.so.2.8.2 moved to /usr/lib/libenchant-2.so.2.8.4

--===============7710513336716537808==--

