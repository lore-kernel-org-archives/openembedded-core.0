Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48495C4450D
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:12:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2988.1783577514200572127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bm0kyAvb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FJTccMG1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f45810d1a-a758e740-ee20-44f8-a3d0-3cc36db91ea5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577513;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=avegZyu+4y1DYjm6KInDeZ/NTyt0Ju7eYUewyaJLCyM=;
	b=bm0kyAvb+yushbWeU/jXddGS/BbX79cqklGCv5muxlNV0HAFNJHwDqTBp9jz6G2b
	BcjgzO0cNY744Ov0YAszEC8Rlt7mEsWT0VnB7vKitVUxTQjZUqAk9C4czClvdKCIYJO
	imFtqe4s4GYj8arFTiNctSwD3t74IcVw584U9mlQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577513;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=avegZyu+4y1DYjm6KInDeZ/NTyt0Ju7eYUewyaJLCyM=;
	b=FJTccMG1KD+hoLmVp1gCf9+OGX9RJXbxnJex5A13426iG8nnZ983zh1ZdnKBwY4o
	e6w6eZVbS6B7ApZFAgoi+hCLLlNE4ukJqxAJgga8JibsLYPeUmNk1YEL1VTGi33A0ZB
	cMV3iuyQBUDw2w+wy+E8OiSXNCYPkKs0l+fgEOr0=
Content-Type: multipart/mixed; boundary="===============0655251883643635683=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tzdata,tzcode-native: upgrading to 2026c,2026c FAILED
Message-ID: <0101019f45810d1a-a758e740-ee20-44f8-a3d0-3cc36db91ea5-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240527

--===============0655251883643635683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tzdata,tzcode-native* to *2026c,2026c* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-tzcode-native-upgrade-2026b-2026c-2026b-2026c.patch
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
From d958858aeb6a204afaca24741a73dd675b861f39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 05:07:35 +0000
Subject: [PATCH] tzdata,tzcode-native: upgrade 2026b -> 2026c,2026b -> 2026c

---
 meta/recipes-extended/timezone/timezone.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index ff02416ed3..94b6ad4d78 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026b"
+PV = "2026c"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "37e9ed8427f5d3521c22fc58e293cbfb043d70eedf1003870b33f363f61ca344"
+SRC_URI[tzcode.sha256sum] = "b1cffc3ace4c4c7cd0efba2f7add86ec3d0b79da48bcf03582671fd3c8feace8"
 SRC_URI[tzdata.sha256sum] = "114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544"
-- 
2.47.1


--===============0655251883643635683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0f3ce620a5f31f5faf58a22d40f0b79360af0d03"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0f3ce620a5f31f5faf58a22d40f0b79360af0d03"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 152 Local 132 Mirrors 0 Missed 20 Current 96 (86% match, 91% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 219 of 248 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: Running task 194 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa)
NOTE: Running task 196 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa)
NOTE: Running task 224 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_create_recipe_spdx)
NOTE: recipe tzcode-native-2026c-r0: task do_recipe_qa: Started
NOTE: recipe tzcode-native-2026c-r0: task do_create_recipe_spdx: Started
NOTE: recipe tzdata-2026c-r0: task do_recipe_qa: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 245 of 248 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 248 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_recipe_qa_setscene)
NOTE: recipe quilt-native-0.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzcode-native-2026c-r0: task do_recipe_qa: Succeeded
NOTE: Running task 238 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe quilt-native-0.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 248 of 248 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2026c-r0: task do_recipe_qa: Succeeded
NOTE: recipe tzcode-native-2026c-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 239 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: Running task 240 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_create_recipe_spdx)
NOTE: recipe tzcode-native-2026c-r0: task do_fetch: Started
NOTE: recipe quilt-native-0.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_fetch: Started
NOTE: recipe tzdata-2026c-r0: task do_create_recipe_spdx: Started
NOTE: recipe quilt-native-0.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe tzdata-2026c-r0: task do_create_recipe_spdx: Succeeded
WARNING: tzcode-native-2026c-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2026c.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzdata-2026c-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2026c.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
NOTE: recipe tzcode-native-2026c-r0: task do_fetch: Failed
NOTE: recipe tzdata-2026c-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 770 tasks of which 764 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260709050720.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260709050720.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2026c/temp/log.do_fetch.3405313
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2026c/temp/log.do_fetch.3405366
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2026c-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2026c.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2026c.tar.gz.tmp' has sha256 checksum 'e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4' when '114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2026c-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2026c.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2026c-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2026c.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2026c.tar.gz.tmp' has sha256 checksum 'e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4' when '114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2026c-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2026c.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2026c/temp/log.do_fetch.3405313
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2026c/temp/log.do_fetch.3405366
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============0655251883643635683==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-tzcode-native-upgrade-2026b-2026c-2026b-2026c.patch"

RnJvbSBkOTU4ODU4YWViNmEyMDRhZmFjYTI0NzQxYTczZGQ2NzViODYxZjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNTowNzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR6
ZGF0YSx0emNvZGUtbmF0aXZlOiB1cGdyYWRlIDIwMjZiIC0+IDIwMjZjLDIwMjZiIC0+IDIwMjZj
CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25lL3RpbWV6b25lLmluYyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKaW5kZXggZmYwMjQxNmVk
My4uOTRiNmFkNGQ3OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25l
L3RpbWV6b25lLmluYworKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpv
bmUuaW5jCkBAIC02LDcgKzYsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNFTlNFID0gIlBEICYg
QlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzY3
OWM5ZDZiMDJiYzI3NTdiM2VhZjhmNTNjNDNmYmEiCiAKLVBWID0gIjIwMjZiIgorUFYgPSAiMjAy
NmMiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVzL3JlcG9zaXRv
cnkvcmVsZWFzZXMvdHpjb2RlJHtQVn0udGFyLmd6O25hbWU9dHpjb2RlO3N1YmRpcj10eiBcCiAg
ICAgICAgICAgIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcy9yZXBvc2l0b3J5L3JlbGVh
c2VzL3R6ZGF0YSR7UFZ9LnRhci5nejtuYW1lPXR6ZGF0YTtzdWJkaXI9dHogXApAQCAtMTYsNSAr
MTYsNSBAQCBTID0gIiR7VU5QQUNLRElSfS90eiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0
dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcyIKIAotU1JDX1VSSVt0emNvZGUuc2hhMjU2c3Vt
XSA9ICIzN2U5ZWQ4NDI3ZjVkMzUyMWMyMmZjNThlMjkzY2JmYjA0M2Q3MGVlZGYxMDAzODcwYjMz
ZjM2M2Y2MWNhMzQ0IgorU1JDX1VSSVt0emNvZGUuc2hhMjU2c3VtXSA9ICJiMWNmZmMzYWNlNGM0
YzdjZDBlZmJhMmY3YWRkODZlYzNkMGI3OWRhNDhiY2YwMzU4MjY3MWZkM2M4ZmVhY2U4IgogU1JD
X1VSSVt0emRhdGEuc2hhMjU2c3VtXSA9ICIxMTQ1NDNkOWYxOWE2YmZlYjViY2E0MzY4NmFlYTE3
M2QzODc1NWEzZGIxZjJlZWMxMTI2NDdhZTkyYzZmNTQ0IgotLSAKMi40Ny4xCgo=

--===============0655251883643635683==--

