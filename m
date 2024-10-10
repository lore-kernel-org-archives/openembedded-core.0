Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5ABD0D795
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.53304.1728588990812385277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=H7yE0ph1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=q0vNZCR9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019277eee36d-91862acc-0f6d-44f6-8984-511e32ec7a69-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588997;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=njxkK7Ydntfdv7okH6eW0vbL2odJKxomiHY9/17hA8c=;
	b=H7yE0ph1kw4Jy75+wjC9MfN9jHdEr9iMy/0DXeaqE2ZdhfJgSljBz7CqqtRMoToa
	4ZiC/vCayvlPJX4071fasZctgxpcKsd/NALkmjCHCY09KHyY5ZZICPKVrOFvQ3U7FVm
	YtNbURLD8WpYI26+cPUaYrL6dIE2LJLVxJHz5rgk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588997;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=njxkK7Ydntfdv7okH6eW0vbL2odJKxomiHY9/17hA8c=;
	b=q0vNZCR9wEzAc5tf9MucfHtkqCZ6bfsQlxcbye1BYeEDwTD8sAb/ve/Q5H7yTdBg
	MRdQJ2k4ytkMqUdzPA4ASNrSFnBLcbcHTs05F2Mtx4tiHqE8IXWzbx3NPJeAj7HWAZU
	gZKzJDUaIQXsT+MbYV75AA/tIrZiyXXo7/xNwyC0=
Content-Type: multipart/mixed; boundary="===============3116674702433213090=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.30.8 SUCCEEDED
Message-ID: <0101019277eee36d-91862acc-0f6d-44f6-8984-511e32ec7a69-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205614

--===============3116674702433213090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsdl2* to *2.30.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.30.7-2.30.8.patch
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
From 53da41484f9ec467c98c3858c64c00f6839aa07f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 15:04:01 +0000
Subject: [PATCH] libsdl2: upgrade 2.30.7 -> 2.30.8

---
 .../libsdl2/{libsdl2_2.30.7.bb => libsdl2_2.30.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.7.bb => libsdl2_2.30.8.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb
index 25bbe2067a..d46f014502 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "2508c80438cd5ff3bbeb8fe36b8f3ce7805018ff30303010b61b03bb83ab9694"
+SRC_URI[sha256sum] = "380c295ea76b9bd72d90075793971c8bcb232ba0a69a9b14da4ae8f603350058"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.44.1


--===============3116674702433213090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.3000.7", added "/usr/lib/libSDL2-2.0.so.0.3000.8"
Changes to packages/core2-64-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.3000.7 to libSDL2-2.0.so.0.3000.8
  /usr/lib/libSDL2-2.0.so.0.3000.7 moved to /usr/lib/libSDL2-2.0.so.0.3000.8

--===============3116674702433213090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsdl2: SRC_URI changed from "http://www.libsdl.org/release/SDL2-2.30.7.tar.gz" to "http://www.libsdl.org/release/SDL2-2.30.8.tar.gz"
packages/core2-64-poky-linux/libsdl2: PKGV changed from 2.30.7 [default] to 2.30.8 [default]
packages/core2-64-poky-linux/libsdl2: PV changed from "2.30.7" to "2.30.8"
packages/core2-64-poky-linux/libsdl2/libsdl2-bin: PKGV changed from 2.30.7 [default] to 2.30.8 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-bin: PV changed from "2.30.7" to "2.30.8"
packages/core2-64-poky-linux/libsdl2/libsdl2-dbg: PKGSIZE changed from 7277296 to 7278752 (+0%)
packages/core2-64-poky-linux/libsdl2/libsdl2-dbg: PKGV changed from 2.30.7 [default] to 2.30.8 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-dbg: FILELIST: removed "/usr/lib/.debug/libSDL2-2.0.so.0.3000.7", added "/usr/lib/.debug/libSDL2-2.0.so.0.3000.8"
packages/core2-64-poky-linux/libsdl2/libsdl2-dbg: PV changed from "2.30.7" to "2.30.8"
packages/core2-64-poky-linux/libsdl2/libsdl2-dev: PKGSIZE changed from 2452548 to 2452529 (-0%)
packages/core2-64-poky-linux/libsdl2/libsdl2-dev: PKGV changed from 2.30.7 [default] to 2.30.8 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-dev: PV changed from "2.30.7" to "2.30.8"
packages/core2-64-poky-linux/libsdl2/libsdl2-doc: PKGV changed from 2.30.7 [default] to 2.30.8 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-doc: PV changed from "2.30.7" to "2.30.8"
packages/core2-64-poky-linux/libsdl2/libsdl2-locale: PKGV changed from 2.30.7 [default] to 2.30.8 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-locale: PV changed from "2.30.7" to "2.30.8"
packages/core2-64-poky-linux/libsdl2/libsdl2-src: PKGSIZE changed from 10541952 to 10543882 (+0%)
packages/core2-64-poky-linux/libsdl2/libsdl2-src: PKGV changed from 2.30.7 [default] to 2.30.8 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-src: PV changed from "2.30.7" to "2.30.8"
packages/core2-64-poky-linux/libsdl2/libsdl2-staticdev: PKGSIZE changed from 14479588 to 14482468 (+0%)
packages/core2-64-poky-linux/libsdl2/libsdl2-staticdev: PKGV changed from 2.30.7 [default] to 2.30.8 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-staticdev: PV changed from "2.30.7" to "2.30.8"
packages/core2-64-poky-linux/libsdl2/libsdl2: PKGV changed from 2.30.7 [default] to 2.30.8 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.3000.7", added "/usr/lib/libSDL2-2.0.so.0.3000.8"
packages/core2-64-poky-linux/libsdl2/libsdl2: PV changed from "2.30.7" to "2.30.8"
Changes to packages/core2-64-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.3000.7 to libSDL2-2.0.so.0.3000.8
  /usr/lib/libSDL2-2.0.so.0.3000.7 moved to /usr/lib/libSDL2-2.0.so.0.3000.8

--===============3116674702433213090==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.30.7-2.30.8.patch"

RnJvbSA1M2RhNDE0ODRmOWVjNDY3Yzk4YzM4NThjNjRjMDBmNjgzOWFhMDdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTU6MDQ6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzZGwyOiB1cGdyYWRlIDIuMzAuNyAtPiAyLjMwLjgKCi0tLQogLi4uL2xpYnNkbDIve2xpYnNk
bDJfMi4zMC43LmJiID0+IGxpYnNkbDJfMi4zMC44LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIve2xpYnNkbDJfMi4zMC43LmJiID0+IGxpYnNkbDJfMi4z
MC44LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwy
L2xpYnNkbDJfMi4zMC43LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2Rs
Ml8yLjMwLjguYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8yLjMwLjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDJfMi4zMC44LmJiCmluZGV4IDI1YmJlMjA2N2EuLmQ0
NmYwMTQ1MDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNk
bDJfMi4zMC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDJf
Mi4zMC44LmJiCkBAIC0yNSw3ICsyNSw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5saWJzZGwu
b3JnL3JlbGVhc2UvU0RMMi0ke1BWfS50YXIuZ3oiCiAKIFMgPSAiJHtXT1JLRElSfS9TREwyLSR7
UFZ9IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjUwOGM4MDQzOGNkNWZmM2JiZWI4ZmUzNmI4
ZjNjZTc4MDUwMThmZjMwMzAzMDEwYjYxYjAzYmI4M2FiOTY5NCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIzODBjMjk1ZWE3NmI5YmQ3MmQ5MDA3NTc5Mzk3MWM4YmNiMjMyYmEwYTY5YTliMTRkYTRh
ZThmNjAzMzUwMDU4IgogCiBpbmhlcml0IGNtYWtlIGxpYl9wYWNrYWdlIGJpbmNvbmZpZy1kaXNh
YmxlZCBwa2djb25maWcgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuCiAKLS0gCjIuNDQuMQoK

--===============3116674702433213090==--

