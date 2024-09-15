Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90FCC3ABAC
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.115393.1726410840756965070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=I4fbw1lU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JTCZFD+/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61ad50c-e8453a4e-7ccc-409d-97f5-7a8e93922484-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lO+3zpd4pPrU/CbF/teX1rUvrqJXS4225JZCKub/25g=;
	b=I4fbw1lUorTZyA+8OyKDFW1OORlkra17DDnEnluk9JHFf6kwImyhdI5tyqsQNhWa
	9RUuz+M9g3tNNzZvYJiWWlNAzs2cB/KU4yO7zT9gqEYU1Bhretm7C00mAL/xJlUfyfV
	beQe2htJJjpje0HiTipAsrybIIac1pxCf+i7LQeU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lO+3zpd4pPrU/CbF/teX1rUvrqJXS4225JZCKub/25g=;
	b=JTCZFD+/dZhoSG0c9NWDX66BGplCQrwTa8NbCDoUZ4ZgA+5MbQT2iUO1m0z1Q7ZQ
	wply/uioWBiydwodsSau1hk7qcluo2i+CAHzFTcoJnbGNcDdpjfSl7AaCxztgSrVcJM
	WJ8ie2rZz/HTRXYlpFOW5QKK2wqdSCrTkCp8pqco=
Content-Type: multipart/mixed; boundary="===============7871826276354714228=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tzcode-native,tzdata: upgrading to 2024b,2024b FAILED
Message-ID: <01010191f61ad50c-e8453a4e-7ccc-409d-97f5-7a8e93922484-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204585

--===============7871826276354714228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tzcode-native,tzdata* to *2024b,2024b* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzcode-native-tzdata-upgrade-2024a-2024b-2024a-2024b.patch
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
From d613b0a3806c1d75a48c02d6c6ae46d68ed8a707 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 06:57:56 +0000
Subject: [PATCH] tzcode-native,tzdata: upgrade 2024a -> 2024b,2024a -> 2024b

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
2.44.0


--===============7871826276354714228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1866 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (914 cached, 2 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ff9c742088bcec2449695440c69bb3bd2fed99df"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ff9c742088bcec2449695440c69bb3bd2fed99df"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 76 Local 58 Mirrors 0 Missed 18 Current 143 (76% match, 91% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 402 of 708 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa)
NOTE: Running task 427 of 708 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa)
NOTE: recipe tzcode-native-2024b-r0: task do_recipe_qa: Started
NOTE: recipe tzdata-2024b-r0: task do_recipe_qa: Started
NOTE: recipe tzcode-native-2024b-r0: task do_recipe_qa: Succeeded
NOTE: Running task 675 of 708 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzdata-2024b-r0: task do_recipe_qa: Succeeded
NOTE: Running task 676 of 708 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe tzcode-native-2024b-r0: task do_fetch: Started
NOTE: recipe tzdata-2024b-r0: task do_fetch: Started
WARNING: tzcode-native-2024b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzdata-2024b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
NOTE: recipe tzcode-native-2024b-r0: task do_fetch: Failed
NOTE: recipe tzdata-2024b-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 676 tasks of which 672 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915065743.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915065743.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2024b/temp/log.do_fetch.226483
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2024b/temp/log.do_fetch.226488
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2024b-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz.tmp' has sha256 checksum '70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550' when '0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2024b-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2024b-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz.tmp' has sha256 checksum '70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550' when '0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2024b-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2024b/temp/log.do_fetch.226483
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2024b/temp/log.do_fetch.226488
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============7871826276354714228==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzcode-native-tzdata-upgrade-2024a-2024b-2024a-2024b.patch"

RnJvbSBkNjEzYjBhMzgwNmMxZDc1YTQ4YzAyZDZjNmFlNDZkNjhlZDhhNzA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDY6NTc6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
emNvZGUtbmF0aXZlLHR6ZGF0YTogdXBncmFkZSAyMDI0YSAtPiAyMDI0YiwyMDI0YSAtPiAyMDI0
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
YTg2NTkxZjZlZDY5YzYyNDhmZmZhNTAyYjZlZGZmZTMiCi0tIAoyLjQ0LjAKCg==

--===============7871826276354714228==--

