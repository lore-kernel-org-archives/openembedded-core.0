Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D40D0EE2A
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.53285.1728588965508360841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Tz4Mv3pn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sg8ls6v3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019277ee63ab-f206ef74-b860-4b1b-8d68-0155d970fe3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588964;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HX0BJJra2WK54IFHFK+iGw3xRJvvb9VeHOeIZR+3XcM=;
	b=Tz4Mv3pnuQyhCx29eQVC3Q1F75J6r/oSvr64EZj8n6tSdw8eBlx8k1K8AxziVG1A
	Gb7/6iQgw2rdJFsiil0cKw2JRjIwzMQeEYWs1tDFkJVLhjeJt8HMublIE7S0T9PmqCD
	4GnxVH2WJM9RDi+eUgklseaNkQLjsVTOuE2W+xXM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588964;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HX0BJJra2WK54IFHFK+iGw3xRJvvb9VeHOeIZR+3XcM=;
	b=sg8ls6v3oLTlmbj/0JbMB4ah0cXI9WARvJ4sfPDEDmMG2cPAbqICYBSKFCwY+Zcv
	2HTdtCx16XRgOdEBGMhItZeboDLjzyWM9FyboBo0edAEn6hPqAJb+C3XpoQDxxj9aBk
	7oCFazZkifOt8AxcscKQNQ4uo0LAGHx01i4AS0ms=
Content-Type: multipart/mixed; boundary="===============4217771863064481306=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tzcode-native,tzdata: upgrading to 2024b,2024b FAILED
Message-ID: <0101019277ee63ab-f206ef74-b860-4b1b-8d68-0155d970fe3e-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205508

--===============4217771863064481306==
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
From b7eb44fe5632f15595fb7f201f558a56bb3c7233 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 11:56:10 +0000
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
2.44.1


--===============4217771863064481306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1870 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (915 cached, 2 parsed). 1871 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:ace4f6d7f070dfdb51c2b38f9a5449629424d215"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 78 Local 62 Mirrors 0 Missed 16 Current 141 (79% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 163 of 219 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 165 of 219 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 177 of 219 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe tzcode-native-2024b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2024b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzcode-native-2024b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 665 of 708 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzdata-2024b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 667 of 708 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe tzcode-native-2024b-r0: task do_fetch: Started
NOTE: recipe tzdata-2024b-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
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
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010115552.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010115552.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2024b/temp/log.do_fetch.2609624
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2024b/temp/log.do_fetch.2609629
Summary: There were 6 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2024b-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz
ERROR: tzcode-native-2024b-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz\' has sha256 checksum \'70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550\' when \'0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2024b-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz
ERROR: tzdata-2024b-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz\' has sha256 checksum \'70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550\' when \'0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2024b/temp/log.do_fetch.2609624
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2024b/temp/log.do_fetch.2609629
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============4217771863064481306==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzcode-native-tzdata-upgrade-2024a-2024b-2024a-2024b.patch"

RnJvbSBiN2ViNDRmZTU2MzJmMTU1OTVmYjdmMjAxZjU1OGE1NmJiM2M3MjMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTE6NTY6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
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
YTg2NTkxZjZlZDY5YzYyNDhmZmZhNTAyYjZlZGZmZTMiCi0tIAoyLjQ0LjEKCg==

--===============4217771863064481306==--

