Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A306DD5C0CE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17180.1765872132398807664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=emR/y5D4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NFWEAtLF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262e5ddd-0f5cc002-d1e7-4a34-8ba2-902c989405ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mSRUngUX6dF2Dczj1kd9YRxXHdMHau1KYLvKpHQgh5A=;
	b=emR/y5D4OhegomiUaboLYdyDVsvTp9WcP/s9XbgZeRwgR+XAoDsjV5PCYAf9HX6f
	TivJ7+P7knm35BuqfAbfIClHswYV1zRAfywFy7lNeIX2+fjo7CS1qTJhQPuTCsniWCB
	j10j8tiOnUAxPpXW6n7e33XX3ioNQ/rB99MUnbp4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mSRUngUX6dF2Dczj1kd9YRxXHdMHau1KYLvKpHQgh5A=;
	b=NFWEAtLFLprG6RjauIICFGtPj0dRbP5qR93XdiRfM5pYXw8z3qnQnqN+sP0VXr+F
	yTOVuEEvanaby4Zok/IVJy+Al7flDvaD4ZHinssOfaHEq7yZyXFElESJj2Qwv64XU0a
	ytEa0+1Y7EnSy/0vmEEbGWj/afOLoqlkIxbntXro=
Content-Type: multipart/mixed; boundary="===============1599047602131621003=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tzdata,tzcode-native: upgrading to 2025c,2025c FAILED
Message-ID: <0101019b262e5ddd-0f5cc002-d1e7-4a34-8ba2-902c989405ec-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227770

--===============1599047602131621003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tzdata,tzcode-native* to *2025c,2025c* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-tzcode-native-upgrade-2025b-2025c-2025b-2025c.patch
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
From a1a3cdbe7f870bf34376c1fba0c50526a52b094f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 21:19:03 +0000
Subject: [PATCH] tzdata,tzcode-native: upgrade 2025b -> 2025c,2025b -> 2025c

---
 meta/recipes-extended/timezone/timezone.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 9a5105ffd7..786f7d57ab 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
 SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
-- 
2.47.1


--===============1599047602131621003==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-tzcode-native-upgrade-2025b-2025c-2025b-2025c.patch"

RnJvbSBhMWEzY2RiZTdmODcwYmYzNDM3NmMxZmJhMGM1MDUyNmE1MmIwOTRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjE6MTk6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
emRhdGEsdHpjb2RlLW5hdGl2ZTogdXBncmFkZSAyMDI1YiAtPiAyMDI1YywyMDI1YiAtPiAyMDI1
YwoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jCmluZGV4IDlhNTEwNWZm
ZDcuLjc4NmY3ZDU3YWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9u
ZS90aW1lem9uZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25lL3RpbWV6
b25lLmluYwpAQCAtNiw3ICs2LDcgQEAgU0VDVElPTiA9ICJiYXNlIgogTElDRU5TRSA9ICJQRCAm
IEJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM2
NzljOWQ2YjAyYmMyNzU3YjNlYWY4ZjUzYzQzZmJhIgogCi1QViA9ICIyMDI1YiIKK1BWID0gIjIw
MjVjIgogCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcy9yZXBvc2l0
b3J5L3JlbGVhc2VzL3R6Y29kZSR7UFZ9LnRhci5nejtuYW1lPXR6Y29kZTtzdWJkaXI9dHogXAog
ICAgICAgICAgICBodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMvcmVwb3NpdG9yeS9yZWxl
YXNlcy90emRhdGEke1BWfS50YXIuZ3o7bmFtZT10emRhdGE7c3ViZGlyPXR6IFwKQEAgLTE2LDUg
KzE2LDUgQEAgUyA9ICIke1VOUEFDS0RJUn0vdHoiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJo
dHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMiCiAKLVNSQ19VUklbdHpjb2RlLnNoYTI1NnN1
bV0gPSAiMDVmOGZlZGIzNTI1ZWU3MGQ0OWM4N2QzZmFlNzhhOGEwZGJhZTRmZTg3YWE1NjVjNjVj
ZGE5OTQ4YWUxMzVlYyIKK1NSQ19VUklbdHpjb2RlLnNoYTI1NnN1bV0gPSAiNjk3ZWJlNjYyNTQ0
NGFlZjUwODBmNThlNDlkMDM0MjRiYmI1MmUwOGJmNDgzZDNkZGI1YWNmMTBjYmQxNTc0MCIKIFNS
Q19VUklbdHpkYXRhLnNoYTI1NnN1bV0gPSAiMTE4MTA0MTMzNDVmYzc4MDUwMTdlMjdlYTlmYTQ4
ODVmZDc0Y2Q2MWIyOTExNzExYWQwMzhmNWQyOGQ3MTQ3NCIKLS0gCjIuNDcuMQoK

--===============1599047602131621003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e46b9325b25be71ea95bc15f5374b61c16a17b12"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:e46b9325b25be71ea95bc15f5374b61c16a17b12"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 72 Local 56 Mirrors 0 Missed 16 Current 144 (77% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 214 of 216 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 216 of 216 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa_setscene)
NOTE: recipe tzcode-native-2025c-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2025c-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzcode-native-2025c-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2025c-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 665 of 699 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 667 of 699 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe tzcode-native-2025c-r0: task do_fetch: Started
NOTE: recipe tzdata-2025c-r0: task do_fetch: Started
WARNING: tzcode-native-2025c-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2025c.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzdata-2025c-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2025c.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
NOTE: recipe tzcode-native-2025c-r0: task do_fetch: Failed
NOTE: recipe tzdata-2025c-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 667 tasks of which 665 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251215211849.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251215211849.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2025c/temp/log.do_fetch.1401871
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2025c/temp/log.do_fetch.1401872
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2025c-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2025c.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025c.tar.gz.tmp' has sha256 checksum '4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957' when '11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2025c-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2025c.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2025c-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2025c.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025c.tar.gz.tmp' has sha256 checksum '4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957' when '11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2025c-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2025c.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2025c/temp/log.do_fetch.1401871
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2025c/temp/log.do_fetch.1401872
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============1599047602131621003==--

