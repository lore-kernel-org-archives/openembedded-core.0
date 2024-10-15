Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8471D1D861
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:15:50 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.11861.1728994547342670252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CFHjIdYg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wYS7zS6/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010192901b11b8-611ee5a4-8413-4a83-8c10-3b92e5b3b332-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jvvs89wvToaCITAG6L/a8nVMP8Re2KF05FnR8GXHJRA=;
	b=CFHjIdYgcSGCAAGqpQSDCa9Jd3w7g0ixdzKQ4zoYWjPK/91HouEBnuvJJ57ns2cH
	AmOhCAWIxyx43aFUY8cZwfzUUuHb0BsTO/D2/6YJ38GHtqsKGeKW3nqK5P/2dcxPSzB
	pBmmq2yIaO+YtyyEs3EjzBHfA2KBC2Wu6Y/drCgA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jvvs89wvToaCITAG6L/a8nVMP8Re2KF05FnR8GXHJRA=;
	b=wYS7zS6/vqRoeWXkhU92Stn6nrqvUsV3RUpdlrz+CDu/4W8r1OWZfOotQz3+zxBa
	6+yC7/KWYPWYrMq0tLmWYcZe4rdN/hGjLB6rj2UwC6hg2Dy3VJ0F6xuTMZns9obTM6E
	y1nuYZ+em1T8kiZKDuduT7z+K8o30jSp18OL7EiE=
Content-Type: multipart/mixed; boundary="===============3440140092123738401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tzdata,tzcode-native: upgrading to 2024b,2024b FAILED
Message-ID: <01010192901b11b8-611ee5a4-8413-4a83-8c10-3b92e5b3b332-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205817

--===============3440140092123738401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tzdata,tzcode-native* to *2024b,2024b* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-tzcode-native-upgrade-2024a-2024b-2024a-2024b.patch
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
From c17081ced1292fde68c98284b1bcd34d6ab7b9d4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 06:30:28 +0000
Subject: [PATCH] tzdata,tzcode-native: upgrade 2024a -> 2024b,2024a -> 2024b

---
 meta/recipes-extended/timezone/timezone.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4734adcc08..c1cd2922d0 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024a"
+PV = "2024b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
+SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
 SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
-- 
2.44.1


--===============3440140092123738401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1d072af50be04f8346645c7b1948aa881b611922"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 76 Local 60 Mirrors 0 Missed 16 Current 143 (78% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 165 of 219 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 167 of 219 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa_setscene)
NOTE: recipe tzcode-native-2024b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2024b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzcode-native-2024b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 674 of 708 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzdata-2024b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 676 of 708 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe tzcode-native-2024b-r0: task do_fetch: Started
NOTE: recipe tzdata-2024b-r0: task do_fetch: Started
WARNING: tzcode-native-2024b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzcode-native-2024b-r0 do_fetch: Checksum mismatch for local file /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz
Cleaning and trying again.
WARNING: tzcode-native-2024b-r0 do_fetch: Renaming /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz to /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz_bad-checksum_70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550
WARNING: tzdata-2024b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzdata-2024b-r0 do_fetch: Checksum mismatch for local file /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz
Cleaning and trying again.
WARNING: tzdata-2024b-r0 do_fetch: Renaming /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz to /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz_bad-checksum_70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550
NOTE: recipe tzcode-native-2024b-r0: task do_fetch: Failed
NOTE: recipe tzdata-2024b-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 676 tasks of which 674 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015063011.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015063011.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2024b/temp/log.do_fetch.2460592
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2024b/temp/log.do_fetch.2460593
Summary: There were 6 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2024b-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz
ERROR: tzcode-native-2024b-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz\' has sha256 checksum \'70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550\' when \'0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2024b-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz
ERROR: tzdata-2024b-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz\' has sha256 checksum \'70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550\' when \'0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2024b/temp/log.do_fetch.2460592
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2024b/temp/log.do_fetch.2460593
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============3440140092123738401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-tzcode-native-upgrade-2024a-2024b-2024a-2024b.patch"

RnJvbSBjMTcwODFjZWQxMjkyZmRlNjhjOTgyODRiMWJjZDM0ZDZhYjdiOWQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDY6MzA6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
emRhdGEsdHpjb2RlLW5hdGl2ZTogdXBncmFkZSAyMDI0YSAtPiAyMDI0YiwyMDI0YSAtPiAyMDI0
YgoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jCmluZGV4IDQ3MzRhZGNj
MDguLmMxY2QyOTIyZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9u
ZS90aW1lem9uZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25lL3RpbWV6
b25lLmluYwpAQCAtNiw3ICs2LDcgQEAgU0VDVElPTiA9ICJiYXNlIgogTElDRU5TRSA9ICJQRCAm
IEJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM2
NzljOWQ2YjAyYmMyNzU3YjNlYWY4ZjUzYzQzZmJhIgogCi1QViA9ICIyMDI0YSIKK1BWID0gIjIw
MjRiIgogCiBTUkNfVVJJID0iIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcy9yZXBvc2l0
b3J5L3JlbGVhc2VzL3R6Y29kZSR7UFZ9LnRhci5nejtuYW1lPXR6Y29kZTtzdWJkaXI9dHogXAog
ICAgICAgICAgICBodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMvcmVwb3NpdG9yeS9yZWxl
YXNlcy90emRhdGEke1BWfS50YXIuZ3o7bmFtZT10emRhdGE7c3ViZGlyPXR6IFwKQEAgLTE2LDUg
KzE2LDUgQEAgUyA9ICIke1dPUktESVJ9L3R6IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0
cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVzIgogCi1TUkNfVVJJW3R6Y29kZS5zaGEyNTZzdW1d
ID0gIjgwMDcyODk0YWRmZjVhNDU4ZjFkMTQzZTE2ZTRjYTFkOGIyYTEyMmM5YzUzOTlkYTQ4MmNi
NjhjYmE2YTFmZjgiCitTUkNfVVJJW3R6Y29kZS5zaGEyNTZzdW1dID0gIjVlNDM4ZmM0NDk2MjQ5
MDZhZjE2YTE4ZmY0NTczNzM5ZjBjZGE5ODYyZTVlYzI4ZDNiY2IxOWNiYWVkMGY2NzIiCiBTUkNf
VVJJW3R6ZGF0YS5zaGEyNTZzdW1dID0gIjBkMDQzNDQ1OWFjYmQyMDU5YTdhOGRhMWYzMzA0YTg0
YTg2NTkxZjZlZDY5YzYyNDhmZmZhNTAyYjZlZGZmZTMiCi0tIAoyLjQ0LjEKCg==

--===============3440140092123738401==--

