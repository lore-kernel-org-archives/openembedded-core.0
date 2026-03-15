Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CB8EFCBC1
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28964.1773582111701495761
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fhet3x3P;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XwbWZSM/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019cf1bb50d9-88b2d804-1ca2-48cf-811d-1b9aa75a0d5e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wMq6q/k5ewKekRKG0LW+EOISQ3k7QGeO+W8oi3Hd+3Y=;
	b=fhet3x3PUnE69NH2h8I9j24KNKPWalIwYrlzWjaXgeRm3gBP10cYnnXphgfRGWlq
	x3E/0LOaI/QKaNucR7lkzdbrFlPOVBD7g4MHptd33cKYKfPGrWoJ4kBOnt3m4vxUEg3
	rH+y8Ee3RSh6H64ZMFvHjfGQ9Nme3A8IgFMRlf18=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wMq6q/k5ewKekRKG0LW+EOISQ3k7QGeO+W8oi3Hd+3Y=;
	b=XwbWZSM/n5uSiCfEr93/3VRlH/J5O4zRCsn4LZyrDDbaOdgvLAVK4Zxf3E8cqx6B
	EzLq09pE7oBj/2TPNHrWmB384ub3+ABRNcdnDJ+jP0MLaFBy+5pGsKTESc+o8ejBCG7
	4dG6BY8GWcQXwGWDfGgjo0Jvjn7vVwnsAglTnNVw=
Content-Type: multipart/mixed; boundary="===============0085761925078492045=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tzcode-native,tzdata: upgrading to 2026a,2026a FAILED
Message-ID: <0101019cf1bb50d9-88b2d804-1ca2-48cf-811d-1b9aa75a0d5e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233120

--===============0085761925078492045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tzcode-native,tzdata* to *2026a,2026a* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzcode-native-tzdata-upgrade-2025c-2026a-2025c-2026a.patch
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
From 71e03fc2aa8fd2d67cc848a0b5c72d7e47ffbb05 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 05:34:39 +0000
Subject: [PATCH] tzcode-native,tzdata: upgrade 2025c -> 2026a,2025c -> 2026a

---
 meta/recipes-extended/timezone/timezone.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index b9323432b8..c637aa42f7 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
 SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
-- 
2.47.1


--===============0085761925078492045==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzcode-native-tzdata-upgrade-2025c-2026a-2025c-2026a.patch"

RnJvbSA3MWUwM2ZjMmFhOGZkMmQ2N2NjODQ4YTBiNWM3MmQ3ZTQ3ZmZiYjA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDU6MzQ6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
emNvZGUtbmF0aXZlLHR6ZGF0YTogdXBncmFkZSAyMDI1YyAtPiAyMDI2YSwyMDI1YyAtPiAyMDI2
YQoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jCmluZGV4IGI5MzIzNDMy
YjguLmM2MzdhYTQyZjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9u
ZS90aW1lem9uZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25lL3RpbWV6
b25lLmluYwpAQCAtNiw3ICs2LDcgQEAgU0VDVElPTiA9ICJiYXNlIgogTElDRU5TRSA9ICJQRCAm
IEJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM2
NzljOWQ2YjAyYmMyNzU3YjNlYWY4ZjUzYzQzZmJhIgogCi1QViA9ICIyMDI1YyIKK1BWID0gIjIw
MjZhIgogCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcy9yZXBvc2l0
b3J5L3JlbGVhc2VzL3R6Y29kZSR7UFZ9LnRhci5nejtuYW1lPXR6Y29kZTtzdWJkaXI9dHogXAog
ICAgICAgICAgICBodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMvcmVwb3NpdG9yeS9yZWxl
YXNlcy90emRhdGEke1BWfS50YXIuZ3o7bmFtZT10emRhdGE7c3ViZGlyPXR6IFwKQEAgLTE2LDUg
KzE2LDUgQEAgUyA9ICIke1VOUEFDS0RJUn0vdHoiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJo
dHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMiCiAKLVNSQ19VUklbdHpjb2RlLnNoYTI1NnN1
bV0gPSAiNjk3ZWJlNjYyNTQ0NGFlZjUwODBmNThlNDlkMDM0MjRiYmI1MmUwOGJmNDgzZDNkZGI1
YWNmMTBjYmQxNTc0MCIKK1NSQ19VUklbdHpjb2RlLnNoYTI1NnN1bV0gPSAiZjgwYTE3YTJlZGRk
MmI1NDA0MWY5Yzk4ZDc1YjBhYTgwMzhiMDE2ZDdjNWRlNzI4OTJhMTQ2ZDk5Mzg3NDBlMSIKIFNS
Q19VUklbdHpkYXRhLnNoYTI1NnN1bV0gPSAiNGFhNzllNGVmZmVlNTNmYzQwMjlmZmU1ZjZlYmU5
NzkzNzI4MmViY2RmMzg2ZDVkMmRhOTFjZTg0MTQyZjk1NyIKLS0gCjIuNDcuMQoK

--===============0085761925078492045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-2c396e36fd9d47b29f42ed84a4393d6980ac8a49"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:2c396e36fd9d47b29f42ed84a4393d6980ac8a49"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 84 Local 66 Mirrors 0 Missed 18 Current 132 (78% match, 91% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 400 of 699 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa)
NOTE: Running task 421 of 699 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa)
NOTE: recipe tzcode-native-2026a-r0: task do_recipe_qa: Started
NOTE: recipe tzdata-2026a-r0: task do_recipe_qa: Started
NOTE: recipe tzcode-native-2026a-r0: task do_recipe_qa: Succeeded
NOTE: Running task 666 of 699 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzdata-2026a-r0: task do_recipe_qa: Succeeded
NOTE: Running task 667 of 699 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe tzcode-native-2026a-r0: task do_fetch: Started
NOTE: recipe tzdata-2026a-r0: task do_fetch: Started
WARNING: tzcode-native-2026a-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2026a.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzdata-2026a-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2026a.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
NOTE: recipe tzcode-native-2026a-r0: task do_fetch: Failed
NOTE: recipe tzdata-2026a-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 667 tasks of which 663 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315053426.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315053426.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2026a/temp/log.do_fetch.1429972
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2026a/temp/log.do_fetch.1429978
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2026a-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2026a.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2026a.tar.gz.tmp' has sha256 checksum '77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7' when '4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2026a-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2026a.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2026a-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2026a.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2026a.tar.gz.tmp' has sha256 checksum '77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7' when '4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2026a-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2026a.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2026a/temp/log.do_fetch.1429972
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2026a/temp/log.do_fetch.1429978
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============0085761925078492045==--

