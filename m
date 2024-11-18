Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C217D6004B
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4790.1731964607557674668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=j39GWiC2;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=w9PVjxLz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101934122caf5-bbba7cff-50cd-427b-8925-f61eaa4e2168-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964619;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tmIbSP6olIJokH/yHmzD6N7HYq1uZqom4iAOElTfyv8=;
	b=j39GWiC241YEEFGDxL7nzOmoSVwRnaFwZlQjFta500MsHLDKTFg4S4h4QBvvZjV5
	mXJlhUa9PBM4hWY43CluZL71U6fwwrrFgnMroftp8xBkYeNFmUCe8rh8aE4TnRYUkUs
	jGPdp7xLXWF+y1fl2ZuVW+esbYsGAK9Ki6VBYUJY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964619;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tmIbSP6olIJokH/yHmzD6N7HYq1uZqom4iAOElTfyv8=;
	b=w9PVjxLzan1gmx6a+dg84r4anlsx2PsX902Dynw5vlWynz5oUOj/jDOVI/tW/Sqy
	bYPnB+ItSKpZ6GBKLiSFzQ3RvuIdCtqHkc+9Vsphr4DyfXxS2xN7+1oc/gmndqn8uAj
	5qi1L2ct6gEx4jCRpmnCEovKrT6vOaoYcAwBJbes=
Content-Type: multipart/mixed; boundary="===============3111039744769966741=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] log4cplus: upgrading to 2.1.2 SUCCEEDED
Message-ID: <010101934122caf5-bbba7cff-50cd-427b-8925-f61eaa4e2168-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207266

--===============3111039744769966741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *log4cplus* to *2.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-log4cplus-upgrade-2.1.1-2.1.2.patch
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
From 57767521fe69df8ef9777dcfa3e7d4b2978d2ed9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 17:44:18 +0000
Subject: [PATCH] log4cplus: upgrade 2.1.1 -> 2.1.2

---
 .../log4cplus/{log4cplus_2.1.1.bb => log4cplus_2.1.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.1.1.bb => log4cplus_2.1.2.bb} (90%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
similarity index 90%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
index be3c787ab2..9a3c31e887 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[sha256sum] = "42dc435928917fd2f847046c4a0c6086b2af23664d198c7fc1b982c0bfe600c1"
+SRC_URI[sha256sum] = "e2673815ea34886f29b2213fff19cc1a6707a7e65099927a19ea49b4eb018822"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.44.1


--===============3111039744769966741==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-log4cplus-upgrade-2.1.1-2.1.2.patch"

RnJvbSA1Nzc2NzUyMWZlNjlkZjhlZjk3NzdkY2ZhM2U3ZDRiMjk3OGQyZWQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMTc6NDQ6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
b2c0Y3BsdXM6IHVwZ3JhZGUgMi4xLjEgLT4gMi4xLjIKCi0tLQogLi4uL2xvZzRjcGx1cy97bG9n
NGNwbHVzXzIuMS4xLmJiID0+IGxvZzRjcGx1c18yLjEuMi5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xvZzRjcGx1cy97bG9nNGNwbHVzXzIuMS4xLmJiID0+IGxvZzRjcGx1
c18yLjEuMi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbG9n
NGNwbHVzL2xvZzRjcGx1c18yLjEuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sb2c0Y3Bs
dXMvbG9nNGNwbHVzXzIuMS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9sb2c0Y3BsdXMvbG9nNGNwbHVzXzIuMS4xLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbG9nNGNwbHVzL2xvZzRjcGx1c18yLjEuMi5iYgppbmRl
eCBiZTNjNzg3YWIyLi45YTNjMzFlODg3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbG9nNGNwbHVzL2xvZzRjcGx1c18yLjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbG9nNGNwbHVzL2xvZzRjcGx1c18yLjEuMi5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NDFlOGUwNjBjMjY4MjI4ODZiNTkyYWI0NzY1
Yzc1NmIiCiAKIFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3Byb2plY3QvJHtCUE59
LyR7QlBOfS1zdGFibGUvJHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNDJkYzQzNTkyODkxN2ZkMmY4NDcwNDZjNGEwYzYwODZiMmFmMjM2NjRk
MTk4YzdmYzFiOTgyYzBiZmU2MDBjMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMjY3MzgxNWVh
MzQ4ODZmMjliMjIxM2ZmZjE5Y2MxYTY3MDdhN2U2NTA5OTkyN2ExOWVhNDliNGViMDE4ODIyIgog
CiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMv
bG9nNGNwbHVzL2ZpbGVzL2xvZzRjcGx1cy1zdGFibGUvIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVgg
PSAibG9nNGNwbHVzLXN0YWJsZS8oP1A8cHZlcj5cZCsoXC5cZCspKykvIgotLSAKMi40NC4xCgo=

--===============3111039744769966741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/log4cplus/log4cplus-dev: FILELIST: added "/usr/include/log4cplus/helpers/eventcounter.h"
packages/core2-64-poky-linux/log4cplus/log4cplus: FILELIST: removed "/usr/lib/liblog4cplusU-2.1.so.9.0.1 /usr/lib/liblog4cplus-2.1.so.9.0.1", added "/usr/lib/liblog4cplus-2.1.so.9.1.1 /usr/lib/liblog4cplusU-2.1.so.9.1.1"
Changes to packages/core2-64-poky-linux/log4cplus (sysroot):
  /usr/lib/liblog4cplus-2.1.so.9 changed symlink target from liblog4cplus-2.1.so.9.0.1 to liblog4cplus-2.1.so.9.1.1
  /usr/lib/liblog4cplus.so changed symlink target from liblog4cplus-2.1.so.9.0.1 to liblog4cplus-2.1.so.9.1.1
  /usr/lib/liblog4cplusU-2.1.so.9 changed symlink target from liblog4cplusU-2.1.so.9.0.1 to liblog4cplusU-2.1.so.9.1.1
  /usr/lib/liblog4cplusU.so changed symlink target from liblog4cplusU-2.1.so.9.0.1 to liblog4cplusU-2.1.so.9.1.1
  /usr/lib/liblog4cplus-2.1.so.9.0.1 moved to /usr/lib/liblog4cplus-2.1.so.9.1.1
  /usr/lib/liblog4cplusU-2.1.so.9.0.1 moved to /usr/lib/liblog4cplusU-2.1.so.9.1.1
  /usr/include/log4cplus/helpers/eventcounter.h was added

--===============3111039744769966741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/log4cplus: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/log4cplus: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/log4cplus: SRC_URI changed from "https://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/2.1.1/log4cplus-2.1.1.tar.gz" to "https://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/2.1.2/log4cplus-2.1.2.tar.gz"
packages/core2-64-poky-linux/log4cplus/log4cplus-dbg: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/log4cplus/log4cplus-dbg: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/log4cplus/log4cplus-dbg: PKGSIZE changed from 17587272 to 18032320 (+3%)
packages/core2-64-poky-linux/log4cplus/log4cplus-dbg: FILELIST: removed "/usr/lib/.debug/liblog4cplusU-2.1.so.9.0.1 /usr/lib/.debug/liblog4cplus-2.1.so.9.0.1", added "/usr/lib/.debug/liblog4cplusU-2.1.so.9.1.1 /usr/lib/.debug/liblog4cplus-2.1.so.9.1.1"
packages/core2-64-poky-linux/log4cplus/log4cplus-dev: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/log4cplus/log4cplus-dev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/log4cplus/log4cplus-dev: PKGSIZE changed from 379660 to 385504 (+2%)
packages/core2-64-poky-linux/log4cplus/log4cplus-dev: FILELIST: added "/usr/include/log4cplus/helpers/eventcounter.h"
packages/core2-64-poky-linux/log4cplus/log4cplus-doc: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/log4cplus/log4cplus-doc: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/log4cplus/log4cplus-locale: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/log4cplus/log4cplus-locale: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/log4cplus/log4cplus-src: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/log4cplus/log4cplus-src: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/log4cplus/log4cplus-src: PKGSIZE changed from 717360 to 727975 (+1%)
packages/core2-64-poky-linux/log4cplus/log4cplus-src: FILELIST: directory renamed /usr/src/debug/log4cplus/2.1.1/include/log4cplus -> /usr/src/debug/log4cplus/2.1.2/include/log4cplus, directory renamed /usr/src/debug/log4cplus/2.1.1/include/log4cplus/spi -> /usr/src/debug/log4cplus/2.1.2/include/log4cplus/spi, directory renamed /usr/src/debug/log4cplus/2.1.1/threadpool -> /usr/src/debug/log4cplus/2.1.2/threadpool, directory renamed /usr/src/debug/log4cplus/2.1.1/include/log4cplus/thread -> /usr/src/debug/log4cplus/2.1.2/include/log4cplus/thread, directory renamed /usr/src/debug/log4cplus/2.1.1/include/log4cplus/internal -> /usr/src/debug/log4cplus/2.1.2/include/log4cplus/internal, directory renamed /usr/src/debug/log4cplus/2.1.1/include/log4cplus/thread/impl -> /usr/src/debug/log4cplus/2.1.2/include/log4cplus/thread/impl, removed "/usr/src/debug/log4cplus/2.1.1/src/loggerimpl.cxx /usr/src/debug/log4cplus/2.1.1/src/timehelper.cxx /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helper
 s/appenderattachableimpl.h /usr/src/debug/log4cplus/2.1.1/src/socket-unix.cxx /usr/src/debug/log4cplus/2.1.1/src/clogger.cxx /usr/src/debug/log4cplus/2.1.1/src/pointer.cxx /usr/src/debug/log4cplus/2.1.1/src/snprintf.cxx /usr/src/debug/log4cplus/2.1.1/src/hierarchylocker.cxx /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/fileinfo.h /usr/src/debug/log4cplus/2.1.1/src/rootlogger.cxx /usr/src/debug/log4cplus/2.1.1/src/threads.cxx /usr/src/debug/log4cplus/2.1.1/src/syslogappender.cxx /usr/src/debug/log4cplus/2.1.1/src/appenderattachableimpl.cxx /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/socket.h /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/connectorthread.h /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/stringhelper.h /usr/src/debug/log4cplus/2.1.1/src/filter.cxx /usr/src/debug/log4cplus/2.1.1/src/exception.cxx /usr/src/debug/log4cplus/2.1.1/src/logger.cxx /usr/src/debug/log4cplus/2.1.1/src/syncprims.cxx /usr/src/debug/log4cplus/2.1.1/src/fac
 tory.cxx /usr/src/debug/log4cplus/2.1.1/src/global-init.cxx /usr/src/debug/log4cplus/2.1.1/src/asyncappender.cxx /usr/src/debug/log4cplus/2.1.1/src/loggingevent.cxx /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/snprintf.h /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/property.h /usr/src/debug/log4cplus/2.1.1/src/version.cxx /usr/src/debug/log4cplus/2.1.1/src/loglevel.cxx /usr/src/debug/log4cplus/2.1.1/src/patternlayout.cxx /usr/src/debug/log4cplus/2.1.1/src/env.cxx /usr/src/debug/log4cplus/2.1.1/src/mdc.cxx /usr/src/debug/log4cplus/2.1.1/src/ndc.cxx /usr/src/debug/log4cplus/2.1.1/src/property.cxx /usr/src/debug/log4cplus/2.1.1/src/loglog.cxx /usr/src/debug/log4cplus/2.1.1/src/objectregistry.cxx /usr/src/debug/log4cplus/2.1.1/src/layout.cxx /usr/src/debug/log4cplus/2.1.1/src/log4judpappender.cxx /usr/src/debug/log4cplus/2.1.1/src/socketbuffer.cxx /usr/src/debug/log4cplus/2.1.1/src/socketappender.cxx /usr/src/debug/log4cplus/2.1.1/src/fileappender.cxx /usr/src/de
 bug/log4cplus/2.1.1/src/nullappender.cxx /usr/src/debug/log4cplus/2.1.1/src/consoleappender.cxx /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/timehelper.h /usr/src/debug/log4cplus/2.1.1/src/connectorthread.cxx /usr/src/debug/log4cplus/2.1.1/src/hierarchy.cxx /usr/src/debug/log4cplus/2.1.1/src/fileinfo.cxx /usr/src/debug/log4cplus/2.1.1/src/loggingmacros.cxx /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/queue.h /usr/src/debug/log4cplus/2.1.1/src/configurator.cxx /usr/src/debug/log4cplus/2.1.1/src/stringhelper.cxx /usr/src/debug/log4cplus/2.1.1/src/queue.cxx /usr/src/debug/log4cplus/2.1.1/src/callbackappender.cxx /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/pointer.h /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/socketbuffer.h /usr/src/debug/log4cplus/2.1.1/src/appender.cxx /usr/src/debug/log4cplus/2.1.1/src/lockfile.cxx /usr/src/debug/log4cplus/2.1.1/src/socket.cxx /usr/src/debug/log4cplus/2.1.1/include/log4cplus/helpers/lockfile.h /usr/sr
 c/debug/log4cplus/2.1.1/include/log4cplus/helpers/loglog.h", added "/usr/src/debug/log4cplus/2.1.2/src/loggerimpl.cxx /usr/src/debug/log4cplus/2.1.2/src/timehelper.cxx /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/appenderattachableimpl.h /usr/src/debug/log4cplus/2.1.2/src/socket-unix.cxx /usr/src/debug/log4cplus/2.1.2/src/clogger.cxx /usr/src/debug/log4cplus/2.1.2/src/pointer.cxx /usr/src/debug/log4cplus/2.1.2/src/snprintf.cxx /usr/src/debug/log4cplus/2.1.2/src/hierarchylocker.cxx /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/fileinfo.h /usr/src/debug/log4cplus/2.1.2/src/rootlogger.cxx /usr/src/debug/log4cplus/2.1.2/src/threads.cxx /usr/src/debug/log4cplus/2.1.2/src/syslogappender.cxx /usr/src/debug/log4cplus/2.1.2/src/appenderattachableimpl.cxx /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/socket.h /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/connectorthread.h /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/stringhelper.h /usr/
 src/debug/log4cplus/2.1.2/src/filter.cxx /usr/src/debug/log4cplus/2.1.2/src/exception.cxx /usr/src/debug/log4cplus/2.1.2/src/logger.cxx /usr/src/debug/log4cplus/2.1.2/src/syncprims.cxx /usr/src/debug/log4cplus/2.1.2/src/factory.cxx /usr/src/debug/log4cplus/2.1.2/src/global-init.cxx /usr/src/debug/log4cplus/2.1.2/src/asyncappender.cxx /usr/src/debug/log4cplus/2.1.2/src/loggingevent.cxx /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/snprintf.h /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/property.h /usr/src/debug/log4cplus/2.1.2/src/version.cxx /usr/src/debug/log4cplus/2.1.2/src/loglevel.cxx /usr/src/debug/log4cplus/2.1.2/src/patternlayout.cxx /usr/src/debug/log4cplus/2.1.2/src/env.cxx /usr/src/debug/log4cplus/2.1.2/src/mdc.cxx /usr/src/debug/log4cplus/2.1.2/src/ndc.cxx /usr/src/debug/log4cplus/2.1.2/src/eventcounter.cxx /usr/src/debug/log4cplus/2.1.2/src/property.cxx /usr/src/debug/log4cplus/2.1.2/src/loglog.cxx /usr/src/debug/log4cplus/2.1.2/src/objectregistry.
 cxx /usr/src/debug/log4cplus/2.1.2/src/layout.cxx /usr/src/debug/log4cplus/2.1.2/src/log4judpappender.cxx /usr/src/debug/log4cplus/2.1.2/src/socketbuffer.cxx /usr/src/debug/log4cplus/2.1.2/src/socketappender.cxx /usr/src/debug/log4cplus/2.1.2/src/fileappender.cxx /usr/src/debug/log4cplus/2.1.2/src/nullappender.cxx /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/eventcounter.h /usr/src/debug/log4cplus/2.1.2/src/consoleappender.cxx /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/timehelper.h /usr/src/debug/log4cplus/2.1.2/src/connectorthread.cxx /usr/src/debug/log4cplus/2.1.2/src/hierarchy.cxx /usr/src/debug/log4cplus/2.1.2/src/fileinfo.cxx /usr/src/debug/log4cplus/2.1.2/src/loggingmacros.cxx /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/queue.h /usr/src/debug/log4cplus/2.1.2/src/configurator.cxx /usr/src/debug/log4cplus/2.1.2/src/stringhelper.cxx /usr/src/debug/log4cplus/2.1.2/src/queue.cxx /usr/src/debug/log4cplus/2.1.2/src/callbackappender.cxx /usr/src/
 debug/log4cplus/2.1.2/include/log4cplus/helpers/pointer.h /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/socketbuffer.h /usr/src/debug/log4cplus/2.1.2/src/appender.cxx /usr/src/debug/log4cplus/2.1.2/src/lockfile.cxx /usr/src/debug/log4cplus/2.1.2/src/socket.cxx /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/lockfile.h /usr/src/debug/log4cplus/2.1.2/include/log4cplus/helpers/loglog.h"
packages/core2-64-poky-linux/log4cplus/log4cplus-staticdev: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/log4cplus/log4cplus-staticdev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/log4cplus/log4cplus: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/log4cplus/log4cplus: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/log4cplus/log4cplus: PKGSIZE changed from 1311091 to 1347971 (+3%)
packages/core2-64-poky-linux/log4cplus/log4cplus: FILELIST: removed "/usr/lib/liblog4cplusU-2.1.so.9.0.1 /usr/lib/liblog4cplus-2.1.so.9.0.1", added "/usr/lib/liblog4cplusU-2.1.so.9.1.1 /usr/lib/liblog4cplus-2.1.so.9.1.1"
Changes to packages/core2-64-poky-linux/log4cplus (sysroot):
  /usr/lib/liblog4cplus-2.1.so.9 changed symlink target from liblog4cplus-2.1.so.9.0.1 to liblog4cplus-2.1.so.9.1.1
  /usr/lib/liblog4cplus.so changed symlink target from liblog4cplus-2.1.so.9.0.1 to liblog4cplus-2.1.so.9.1.1
  /usr/lib/liblog4cplusU-2.1.so.9 changed symlink target from liblog4cplusU-2.1.so.9.0.1 to liblog4cplusU-2.1.so.9.1.1
  /usr/lib/liblog4cplusU.so changed symlink target from liblog4cplusU-2.1.so.9.0.1 to liblog4cplusU-2.1.so.9.1.1
  /usr/lib/liblog4cplus-2.1.so.9.0.1 moved to /usr/lib/liblog4cplus-2.1.so.9.1.1
  /usr/lib/liblog4cplusU-2.1.so.9.0.1 moved to /usr/lib/liblog4cplusU-2.1.so.9.1.1
  /usr/include/log4cplus/helpers/eventcounter.h was added

--===============3111039744769966741==--

