Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6AFCFB45C
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.53363.1728588948890684536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BxhfB4BR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0s4juE0L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277ee22f9-cddcf97e-225d-49fd-9c97-faddcf731a33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P6dQLR8zHgJgnm8K+y78+ogt/h/YrfyiBBWDLS+yFSs=;
	b=BxhfB4BR1Rb0eTbv8w+Q4PYWp5CFzaKpwVRS12qNhlV/bDeXtcZGxy/WVELu3j8K
	k9gujjErpu1qYkVgntfLpIaAFZPA8mngvkDml2tIQ/nNN9XTt/kdIJjkhLNPZt4nfLk
	+/m7iIwgTdnTU2u9t41UC/GXkFsK2CZ/EF1ryfWo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P6dQLR8zHgJgnm8K+y78+ogt/h/YrfyiBBWDLS+yFSs=;
	b=0s4juE0LiLmkQRSng29K6/8UR+MuLlmGOY1waR0mhc0EUwmqBSx5vjw/QCAbOuAE
	IsT3F1MsxRBJWxHUqomPX67mPmG2NZrabP5JWEkz5y1YuE43vMmfUFOh8PXgdPgt4O8
	tGEOxHvTk/3NP0EA0eEk1PSbT3moXdJ3zwH/Qkvw=
Content-Type: multipart/mixed; boundary="===============4933953386033540079=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tzdata,tzcode-native: upgrading to 2024b,2024b FAILED
Message-ID: <0101019277ee22f9-cddcf97e-225d-49fd-9c97-faddcf731a33-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205458

--===============4933953386033540079==
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
From 0d73093ae24a09937d00ac796851a1c4e76c69bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 9 Oct 2024 23:57:59 +0000
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


--===============4933953386033540079==
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
workspace            = "tmp-auh-upgrades:7c4bf5ef7c95a5f197be90abeb63fe0bbbf4aa1d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 76 Local 58 Mirrors 0 Missed 18 Current 143 (76% match, 91% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 402 of 708 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa)
NOTE: Running task 427 of 708 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa)
NOTE: recipe tzcode-native-2024b-r0: task do_recipe_qa: Started
NOTE: recipe tzdata-2024b-r0: task do_recipe_qa: Started
NOTE: recipe tzcode-native-2024b-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa unihash changed to f00a8daf88baa45bf4410e18505aee93133144803f6f3da671e02eabf25802e7
NOTE: recipe tzdata-2024b-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa unihash changed to aaacf4da9ed6c071253f919007b55c8a2992a09ba0882420c7d6319c1fbdee30
NOTE: Setscene tasks completed
NOTE: Running task 675 of 708 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
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
NOTE: Tasks Summary: Attempted 676 tasks of which 672 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241009235742.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241009235742.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2024b/temp/log.do_fetch.1597184
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2024b/temp/log.do_fetch.1597185
Summary: There were 6 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2024b-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz
ERROR: tzcode-native-2024b-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz\' has sha256 checksum \'70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550\' when \'0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2024b-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz
ERROR: tzdata-2024b-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2024b.tar.gz\' has sha256 checksum \'70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550\' when \'0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2024b.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2024b/temp/log.do_fetch.1597184
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2024b/temp/log.do_fetch.1597185
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============4933953386033540079==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-tzcode-native-upgrade-2024a-2024b-2024a-2024b.patch"

RnJvbSAwZDczMDkzYWUyNGEwOTkzN2QwMGFjNzk2ODUxYTFjNGU3NmM2OWJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOSBPY3QgMjAyNCAyMzo1Nzo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR6
ZGF0YSx0emNvZGUtbmF0aXZlOiB1cGdyYWRlIDIwMjRhIC0+IDIwMjRiLDIwMjRhIC0+IDIwMjRi
CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25lL3RpbWV6b25lLmluYyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKaW5kZXggNDczNGFkY2Mw
OC4uYzFjZDI5MjJkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25l
L3RpbWV6b25lLmluYworKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpv
bmUuaW5jCkBAIC02LDcgKzYsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNFTlNFID0gIlBEICYg
QlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzY3
OWM5ZDZiMDJiYzI3NTdiM2VhZjhmNTNjNDNmYmEiCiAKLVBWID0gIjIwMjRhIgorUFYgPSAiMjAy
NGIiCiAKIFNSQ19VUkkgPSIgaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVzL3JlcG9zaXRv
cnkvcmVsZWFzZXMvdHpjb2RlJHtQVn0udGFyLmd6O25hbWU9dHpjb2RlO3N1YmRpcj10eiBcCiAg
ICAgICAgICAgIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcy9yZXBvc2l0b3J5L3JlbGVh
c2VzL3R6ZGF0YSR7UFZ9LnRhci5nejtuYW1lPXR6ZGF0YTtzdWJkaXI9dHogXApAQCAtMTYsNSAr
MTYsNSBAQCBTID0gIiR7V09SS0RJUn0vdHoiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRw
Oi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMiCiAKLVNSQ19VUklbdHpjb2RlLnNoYTI1NnN1bV0g
PSAiODAwNzI4OTRhZGZmNWE0NThmMWQxNDNlMTZlNGNhMWQ4YjJhMTIyYzljNTM5OWRhNDgyY2I2
OGNiYTZhMWZmOCIKK1NSQ19VUklbdHpjb2RlLnNoYTI1NnN1bV0gPSAiNWU0MzhmYzQ0OTYyNDkw
NmFmMTZhMThmZjQ1NzM3MzlmMGNkYTk4NjJlNWVjMjhkM2JjYjE5Y2JhZWQwZjY3MiIKIFNSQ19V
UklbdHpkYXRhLnNoYTI1NnN1bV0gPSAiMGQwNDM0NDU5YWNiZDIwNTlhN2E4ZGExZjMzMDRhODRh
ODY1OTFmNmVkNjljNjI0OGZmZmE1MDJiNmVkZmZlMyIKLS0gCjIuNDQuMQoK

--===============4933953386033540079==--

