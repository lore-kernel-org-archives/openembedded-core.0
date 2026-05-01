Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75D1CD3442
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15606.1777645529533463501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=t4NVgQ2m;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IRchpcpZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee270b-8e0bce06-a0b7-4a3e-b7ec-c7ffad753110-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645529;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+rC9u10vu1NOCU2fksQcNXiBZCEOBDs7hiPUQtuyajM=;
	b=t4NVgQ2mPuL1+xiCLx4s3GNJtSAxkPCD8zIyx+9POWtlzzXcS5wXQxWcpFMnnt5J
	6JWwWmojoRTipSDu6DM+d1+RyQuOVkGoks/1k5ZzRYvKBCrdVS89cG90pWz68RJ8k3e
	6ZYQJMhI7Md4cYZBmhORMgKmo+azbVTopvPoO+1w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645529;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+rC9u10vu1NOCU2fksQcNXiBZCEOBDs7hiPUQtuyajM=;
	b=IRchpcpZaKTMkbIvu3rXGIz5zNeJxoAV0qbqq1skE38qotGyhlYVZv+3GBgfGhTZ
	PfNXwyfbZPYJ1GHjZ8vcdCF0FFDJAoj6R687+PzALu/TGVx9Qu1uKNx7Y8PjQ5rsP9M
	rvuPR9uGV0Txt0ZF4NdVrQbEVAF6czVRYG6QvJDo=
Content-Type: multipart/mixed; boundary="===============3909464534498478635=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tzcode-native,tzdata: upgrading to 2026b,2026b FAILED
Message-ID: <0101019de3ee270b-8e0bce06-a0b7-4a3e-b7ec-c7ffad753110-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236201

--===============3909464534498478635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tzcode-native,tzdata* to *2026b,2026b* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzcode-native-tzdata-upgrade-2026a-2026b-2026a-2026b.patch
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
From b447703dbed78f058213f5000d6c3e66b3bc5140 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 06:00:52 +0000
Subject: [PATCH] tzcode-native,tzdata: upgrade 2026a -> 2026b,2026a -> 2026b

---
 meta/recipes-extended/timezone/timezone.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 00bb704e36..9310b4e69e 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026a"
+PV = "2026b"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzcode.sha256sum] = "37e9ed8427f5d3521c22fc58e293cbfb043d70eedf1003870b33f363f61ca344"
 SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
-- 
2.47.1


--===============3909464534498478635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ddfc65f649bc1f0be6d6b602494cff3b036bf9bc"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ddfc65f649bc1f0be6d6b602494cff3b036bf9bc"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 106 Local 86 Mirrors 0 Missed 20 Current 142 (81% match, 91% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 476 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa)
NOTE: Running task 482 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa)
NOTE: Running task 729 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_create_recipe_spdx)
NOTE: recipe tzcode-native-2026b-r0: task do_recipe_qa: Started
NOTE: recipe tzcode-native-2026b-r0: task do_create_recipe_spdx: Started
NOTE: recipe tzdata-2026b-r0: task do_recipe_qa: Started
NOTE: recipe tzcode-native-2026b-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 768 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_create_recipe_spdx)
NOTE: recipe tzdata-2026b-r0: task do_create_recipe_spdx: Started
NOTE: recipe tzcode-native-2026b-r0: task do_recipe_qa: Succeeded
NOTE: Running task 769 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzdata-2026b-r0: task do_recipe_qa: Succeeded
NOTE: Running task 770 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe tzcode-native-2026b-r0: task do_fetch: Started
NOTE: recipe tzdata-2026b-r0: task do_fetch: Started
NOTE: recipe tzdata-2026b-r0: task do_create_recipe_spdx: Succeeded
WARNING: tzcode-native-2026b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2026b.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzdata-2026b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2026b.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
NOTE: recipe tzcode-native-2026b-r0: task do_fetch: Failed
NOTE: recipe tzdata-2026b-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 770 tasks of which 764 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501060037.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501060037.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2026b/temp/log.do_fetch.2154340
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2026b/temp/log.do_fetch.2154361
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2026b-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2026b.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2026b.tar.gz.tmp' has sha256 checksum '114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544' when '77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2026b-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2026b.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2026b-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2026b.tar.gz;name=tzdata;subdir=tz'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2026b.tar.gz.tmp' has sha256 checksum '114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544' when '77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2026b-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2026b.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2026b/temp/log.do_fetch.2154340
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2026b/temp/log.do_fetch.2154361
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============3909464534498478635==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzcode-native-tzdata-upgrade-2026a-2026b-2026a-2026b.patch"

RnJvbSBiNDQ3NzAzZGJlZDc4ZjA1ODIxM2Y1MDAwZDZjM2U2NmIzYmM1MTQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjowMDo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR6
Y29kZS1uYXRpdmUsdHpkYXRhOiB1cGdyYWRlIDIwMjZhIC0+IDIwMjZiLDIwMjZhIC0+IDIwMjZi
CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25lL3RpbWV6b25lLmluYyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKaW5kZXggMDBiYjcwNGUz
Ni4uOTMxMGI0ZTY5ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25l
L3RpbWV6b25lLmluYworKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpv
bmUuaW5jCkBAIC02LDcgKzYsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNFTlNFID0gIlBEICYg
QlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzY3
OWM5ZDZiMDJiYzI3NTdiM2VhZjhmNTNjNDNmYmEiCiAKLVBWID0gIjIwMjZhIgorUFYgPSAiMjAy
NmIiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVzL3JlcG9zaXRv
cnkvcmVsZWFzZXMvdHpjb2RlJHtQVn0udGFyLmd6O25hbWU9dHpjb2RlO3N1YmRpcj10eiBcCiAg
ICAgICAgICAgIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcy9yZXBvc2l0b3J5L3JlbGVh
c2VzL3R6ZGF0YSR7UFZ9LnRhci5nejtuYW1lPXR6ZGF0YTtzdWJkaXI9dHogXApAQCAtMTYsNSAr
MTYsNSBAQCBTID0gIiR7VU5QQUNLRElSfS90eiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0
dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcyIKIAotU1JDX1VSSVt0emNvZGUuc2hhMjU2c3Vt
XSA9ICJmODBhMTdhMmVkZGQyYjU0MDQxZjljOThkNzViMGFhODAzOGIwMTZkN2M1ZGU3Mjg5MmEx
NDZkOTkzODc0MGUxIgorU1JDX1VSSVt0emNvZGUuc2hhMjU2c3VtXSA9ICIzN2U5ZWQ4NDI3ZjVk
MzUyMWMyMmZjNThlMjkzY2JmYjA0M2Q3MGVlZGYxMDAzODcwYjMzZjM2M2Y2MWNhMzQ0IgogU1JD
X1VSSVt0emRhdGEuc2hhMjU2c3VtXSA9ICI3N2I1NDE3MjU5MzdiYjUzYmQ5MmJkNDg0YzBiNDNi
ZWM4NTQ1ZTJkMzQzMWVlMDFmMDRlZjhmMjIwM2JhMmI3IgotLSAKMi40Ny4xCgo=

--===============3909464534498478635==--

