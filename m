Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E269BC54E7C
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.20331.1708018344965045133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X8CymR4R;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RzeAYCbC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dadd3a6c0-36eb94db-dca3-4784-8fe3-669ef0246dea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=PajDkN7g4WCzyemHTHOXI68lzYMEMWFu0cxKcf08NiA=;
	b=X8CymR4RyrRHoMUFCOQK/xp1A+RKlRVTtRvzYjXhHmntgOFeLhZcwQ7keV8twn+/
	+v/8oZ/czZdeoUNZq/RuzmpuzGDYCbz6j1t86uj6Nw/29EF8GasuQaw/0St7SKLgh6J
	BwRkcgY0p9yxpKdIK7sbODXGDtYbj9kLZNXO6wlw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=PajDkN7g4WCzyemHTHOXI68lzYMEMWFu0cxKcf08NiA=;
	b=RzeAYCbCZLH5HY04j/6nW13BrNitIH0k5rjiKUAuvAL04SIU59hBA3Q34yFK1W+R
	ZXev9itXR9NVUCDhW28HbahBuVjAy11EdGo7vUL9rCNXr03JXDo+OSxislDXXlVGnNc
	zpuI78XfWSVRQsMymdGsLqWEB6U+LhvKXXOGcHNk=
Content-Type: multipart/mixed; boundary="===============9144397082435032775=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tzdata: upgrading to 2024a FAILED
Message-ID: <0101018dadd3a6c0-36eb94db-dca3-4784-8fe3-669ef0246dea-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195617

--===============9144397082435032775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tzdata* to *2024a* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-upgrade-2023d-2024a.patch
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
From 7e0f7ccbca4d1f85f7fc0fa5063aea207530875e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 11:56:38 +0000
Subject: [PATCH] tzdata: upgrade 2023d -> 2024a

---
 meta/recipes-extended/timezone/timezone.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2774e5e730..54a9219089 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2023d"
+PV = "2024a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
+SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
 SRC_URI[tzdata.sha256sum] = "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
-- 
2.42.0


--===============9144397082435032775==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-upgrade-2023d-2024a.patch"

RnJvbSA3ZTBmN2NjYmNhNGQxZjg1ZjdmYzBmYTUwNjNhZWEyMDc1MzA4NzVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTE6NTY6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
emRhdGE6IHVwZ3JhZGUgMjAyM2QgLT4gMjAyNGEKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3RpbWV6b25lL3RpbWV6b25lLmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25l
L3RpbWV6b25lLmluYwppbmRleCAyNzc0ZTVlNzMwLi41NGE5MjE5MDg5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKQEAgLTYsNyArNiw3IEBAIFNFQ1RJ
T04gPSAiYmFzZSIKIExJQ0VOU0UgPSAiUEQgJiBCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1jNjc5YzlkNmIwMmJjMjc1N2IzZWFmOGY1M2M0M2Zi
YSIKIAotUFYgPSAiMjAyM2QiCitQViA9ICIyMDI0YSIKIAogU1JDX1VSSSA9IiBodHRwOi8vd3d3
LmlhbmEub3JnL3RpbWUtem9uZXMvcmVwb3NpdG9yeS9yZWxlYXNlcy90emNvZGUke1BWfS50YXIu
Z3o7bmFtZT10emNvZGU7c3ViZGlyPXR6IFwKICAgICAgICAgICAgaHR0cDovL3d3dy5pYW5hLm9y
Zy90aW1lLXpvbmVzL3JlcG9zaXRvcnkvcmVsZWFzZXMvdHpkYXRhJHtQVn0udGFyLmd6O25hbWU9
dHpkYXRhO3N1YmRpcj10eiBcCkBAIC0xNiw1ICsxNiw1IEBAIFMgPSAiJHtXT1JLRElSfS90eiIK
IAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcyIK
IAotU1JDX1VSSVt0emNvZGUuc2hhMjU2c3VtXSA9ICJlOWE1ZjllMTE4ODg2ZDJkZTkyYjYyYmIw
NTUxMGEyOGNjNmMwNThkNzkxYzkzYmQ2Yjg0ZDMyOTJjM2MxNjFlIgorU1JDX1VSSVt0emNvZGUu
c2hhMjU2c3VtXSA9ICI4MDA3Mjg5NGFkZmY1YTQ1OGYxZDE0M2UxNmU0Y2ExZDhiMmExMjJjOWM1
Mzk5ZGE0ODJjYjY4Y2JhNmExZmY4IgogU1JDX1VSSVt0emRhdGEuc2hhMjU2c3VtXSA9ICJkYmNh
MjE5NzBiMGE4YjhjMGNlY2VlYzFkN2I5MWZhOTAzYmUwZjZlY2E1YWU3MzJiNTMyOTY3MjIzMmEw
OGYzIgotLSAKMi40Mi4wCgo=

--===============9144397082435032775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1859 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (912 cached, 2 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-10da8d65d44f1ceaf102c554873262b13d3ae452"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:10da8d65d44f1ceaf102c554873262b13d3ae452"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 75 Local 59 Mirrors 0 Missed 16 Current 142 (78% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 450 of 705 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa)
NOTE: Running task 451 of 705 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa)
NOTE: recipe tzcode-native-2024a-r0: task do_recipe_qa: Started
NOTE: recipe tzdata-2024a-r0: task do_recipe_qa: Started
NOTE: recipe tzcode-native-2024a-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa unihash changed to d9c5c551b309658b3d62f514d031007a97bfd2fa06f3bac63d0e1294a4602ccf
NOTE: recipe tzdata-2024a-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa unihash changed to 2d69c41568c9028ab0e8e4dd3bbfa5c10aa517b6e53e4b82f2d1171aef71b408
NOTE: Setscene tasks completed
NOTE: Running task 675 of 705 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: Running task 676 of 705 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzcode-native-2024a-r0: task do_fetch: Started
NOTE: recipe tzdata-2024a-r0: task do_fetch: Started
WARNING: tzcode-native-2024a-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz
Cleaning and trying again.
WARNING: tzcode-native-2024a-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz_bad-checksum_0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3
WARNING: tzcode-native-2024a-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2024a.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzcode-native-2024a-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz
Cleaning and trying again.
WARNING: tzcode-native-2024a-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz_bad-checksum_0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3
WARNING: tzdata-2024a-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2024a.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzdata-2024a-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz
Cleaning and trying again.
WARNING: tzdata-2024a-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz_bad-checksum_0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3
NOTE: recipe tzcode-native-2024a-r0: task do_fetch: Failed
NOTE: recipe tzdata-2024a-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 676 tasks of which 672 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215115625.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215115625.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch
Summary: There were 8 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2024a-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2024a.tar.gz;name=tzdata;subdir=tz
ERROR: tzcode-native-2024a-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz\' has sha256 checksum \'0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3\' when \'dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024a.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2024a-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2024a.tar.gz;name=tzdata;subdir=tz
ERROR: tzdata-2024a-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/tzdata2024a.tar.gz\' has sha256 checksum \'0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3\' when \'dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024a.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2024a/temp/log.do_fetch.2674983
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2024a/temp/log.do_fetch.2674982
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============9144397082435032775==--

