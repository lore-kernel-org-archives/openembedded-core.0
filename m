Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F927EEEC11
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29682.1694804394236312760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=duK/t9tX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i4+FgSwb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a9a36c2da-c7fc1eac-0b3d-48f2-8801-5f7159af74e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6zP1f1LxD0jSf4+loc3e8EAqU4tqYFKXboOjBhxUi9E=;
	b=duK/t9tXzDK/oA2J+Po45XROdiTY4KgpxDPiNw4LYhbY5y0GewOhr4RWVPqMoMyF
	MXLC2JZAO23mhAv5BamBZ9u2MNPSrKkdnC8Fm9wE+vzVV3AYcMPZ75WML1Yywdi5gEo
	BQDGsQa8erelqtPtNvClrfID/0dyDHehvZBjuVUw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6zP1f1LxD0jSf4+loc3e8EAqU4tqYFKXboOjBhxUi9E=;
	b=i4+FgSwb1T1xcj5afKx2xgGnCo1sRPRrgfjTNnoNnGPp/Qn7z9ekp6o1CD84byS/
	UiBPQvt0QH6vzUVoJA/Pb5VcenRtvcRSSld7OB2wJpc9D6YloMAeqlZdAHRAYfFC4KN
	HJXqEdHKYexrTLx7sxj8g9HNqN5ge4TxfZ+IjBMo=
Content-Type: multipart/mixed; boundary="===============0590886578033822539=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] freetype: upgrading to 2.13.2 SUCCEEDED
Message-ID: <0101018a9a36c2da-c7fc1eac-0b3d-48f2-8801-5f7159af74e0-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187732

--===============0590886578033822539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *freetype* to *2.13.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-freetype-upgrade-2.13.1-2.13.2.patch
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
From 35624ffdbc4a844691cdcbb6f8adb60ddb2a6866 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 14:36:29 +0000
Subject: [PATCH] freetype: upgrade 2.13.1 -> 2.13.2

---
 .../freetype/{freetype_2.13.1.bb => freetype_2.13.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.13.1.bb => freetype_2.13.2.bb} (95%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.13.1.bb b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
similarity index 95%
rename from meta/recipes-graphics/freetype/freetype_2.13.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.13.2.bb
index 5b1c520944..4e7a0ad160 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "ea67e3b019b1104d1667aa274f5dc307d8cbd606b399bc32df308a77f1a564bf"
+SRC_URI[sha256sum] = "12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.2


--===============0590886578033822539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/freetype/freetype-dbg: PV changed from "2.13.1" to "2.13.2"
packages/core2-32-poky-linux/freetype/freetype-dbg: FILELIST: removed "/usr/lib/.debug/libfreetype.so.6.20.0", added "/usr/lib/.debug/libfreetype.so.6.20.1"
packages/core2-32-poky-linux/freetype/freetype-dbg: PKGV changed from 2.13.1 [default] to 2.13.2 [default]
packages/core2-32-poky-linux/freetype/freetype-dbg: PKGSIZE changed from 2426400 to 2426156 (-0%)
packages/core2-32-poky-linux/freetype/freetype-dev: PV changed from "2.13.1" to "2.13.2"
packages/core2-32-poky-linux/freetype/freetype-dev: PKGV changed from 2.13.1 [default] to 2.13.2 [default]
packages/core2-32-poky-linux/freetype/freetype-doc: PV changed from "2.13.1" to "2.13.2"
packages/core2-32-poky-linux/freetype/freetype-doc: PKGV changed from 2.13.1 [default] to 2.13.2 [default]
packages/core2-32-poky-linux/freetype/freetype-locale: PV changed from "2.13.1" to "2.13.2"
packages/core2-32-poky-linux/freetype/freetype-locale: PKGV changed from 2.13.1 [default] to 2.13.2 [default]
packages/core2-32-poky-linux/freetype/freetype-src: PV changed from "2.13.1" to "2.13.2"
packages/core2-32-poky-linux/freetype/freetype-src: PKGV changed from 2.13.1 [default] to 2.13.2 [default]
packages/core2-32-poky-linux/freetype/freetype-src: PKGSIZE changed from 5593535 to 5551879 (-1%)
packages/core2-32-poky-linux/freetype/freetype-staticdev: PV changed from "2.13.1" to "2.13.2"
packages/core2-32-poky-linux/freetype/freetype-staticdev: PKGV changed from 2.13.1 [default] to 2.13.2 [default]
packages/core2-32-poky-linux/freetype/freetype: PV changed from "2.13.1" to "2.13.2"
packages/core2-32-poky-linux/freetype/freetype: FILELIST: removed "/usr/lib/libfreetype.so.6.20.0", added "/usr/lib/libfreetype.so.6.20.1"
packages/core2-32-poky-linux/freetype/freetype: PKGV changed from 2.13.1 [default] to 2.13.2 [default]
packages/core2-32-poky-linux/freetype: PV changed from "2.13.1" to "2.13.2"
packages/core2-32-poky-linux/freetype: SRC_URI changed from "https://download.savannah.nongnu.org/releases/freetype/freetype-2.13.1.tar.xz" to "https://download.savannah.nongnu.org/releases/freetype/freetype-2.13.2.tar.xz"
packages/core2-32-poky-linux/freetype: PKGV changed from 2.13.1 [default] to 2.13.2 [default]
Changes to packages/core2-32-poky-linux/freetype (sysroot):
  /usr/lib/libfreetype.so.6 changed symlink target from libfreetype.so.6.20.0 to libfreetype.so.6.20.1
  /usr/lib/libfreetype.so changed symlink target from libfreetype.so.6.20.0 to libfreetype.so.6.20.1
  /usr/lib/libfreetype.so.6.20.0 moved to /usr/lib/libfreetype.so.6.20.1

--===============0590886578033822539==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-freetype-upgrade-2.13.1-2.13.2.patch"

RnJvbSAzNTYyNGZmZGJjNGE4NDQ2OTFjZGNiYjZmOGFkYjYwZGRiMmE2ODY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTQ6MzY6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
cmVldHlwZTogdXBncmFkZSAyLjEzLjEgLT4gMi4xMy4yCgotLS0KIC4uLi9mcmVldHlwZS97ZnJl
ZXR5cGVfMi4xMy4xLmJiID0+IGZyZWV0eXBlXzIuMTMuMi5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9mcmVldHlwZS97ZnJlZXR5cGVfMi4xMy4xLmJiID0+IGZyZWV0eXBl
XzIuMTMuMi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZnJl
ZXR5cGUvZnJlZXR5cGVfMi4xMy4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZyZWV0eXBl
L2ZyZWV0eXBlXzIuMTMuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZnJlZXR5cGUvZnJlZXR5cGVfMi4xMy4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZnJlZXR5cGUvZnJlZXR5cGVfMi4xMy4yLmJiCmluZGV4IDVi
MWM1MjA5NDQuLjRlN2EwYWQxNjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9m
cmVldHlwZS9mcmVldHlwZV8yLjEzLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2Zy
ZWV0eXBlL2ZyZWV0eXBlXzIuMTMuMi5iYgpAQCAtMTQsNyArMTQsNyBAQCBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFLlRYVDttZDU9ODQzYjZlZmMxNmY2YjE2NTJlYzk3Zjg5ZDVh
NTE2YzAgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiJHtTQVZBTk5BSF9O
T05HTlVfTUlSUk9SfS8ke0JQTn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImVhNjdlM2IwMTliMTEwNGQxNjY3YWEyNzRmNWRjMzA3ZDhjYmQ2MDZiMzk5YmMzMmRmMzA4YTc3
ZjFhNTY0YmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTI5OTFjNGU1NWM1MDZkZDdmOWI3NjU5
MzNlNjJmZDJiZTJlMDZkNDIxNTA1ZDc5NTBhMTMyZTRmMWJiNDg0ZCIKIAogVVBTVFJFQU1fQ0hF
Q0tfUkVHRVggPSAiZnJlZXR5cGUtKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoyLjM5LjIK
Cg==

--===============0590886578033822539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/freetype/freetype: FILELIST: removed "/usr/lib/libfreetype.so.6.20.0", added "/usr/lib/libfreetype.so.6.20.1"
Changes to packages/core2-32-poky-linux/freetype (sysroot):
  /usr/lib/libfreetype.so.6 changed symlink target from libfreetype.so.6.20.0 to libfreetype.so.6.20.1
  /usr/lib/libfreetype.so changed symlink target from libfreetype.so.6.20.0 to libfreetype.so.6.20.1
  /usr/lib/libfreetype.so.6.20.0 moved to /usr/lib/libfreetype.so.6.20.1

--===============0590886578033822539==--

