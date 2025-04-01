Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAEFC369BA
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18038.1743511387886438903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Sayqswvx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IauXeNIF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f1607b81-f4384d29-bffb-40a3-88f1-6412dbd71f92-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511387;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cIN8so3TwcArSlH1TfaQTd/8KjFMODb2U8d0dyvpZqk=;
	b=SayqswvxKecSfou1nVamUw+FXUGDJQubMoicTeeVyCKNklHpumAHZ/mz8c1wmQ/U
	CxL9WJ1LuDw84aYiI+BOJ1Gia59wg9vbaXb0aaniTu5gvHjbezpXtehpfRg61Ov8VyD
	jySo88WDuqBGrPTJK62D5qOgzDTnF656qVl4gcko=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511387;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cIN8so3TwcArSlH1TfaQTd/8KjFMODb2U8d0dyvpZqk=;
	b=IauXeNIFr3tuCTq4ZzuZ/ZENxDi84KZMs4jrbelUDcbyEsRNchfDzZRvhKJZyMul
	60N7SarOqyXRPIrXSi00kVt9ChK/XnlkyMBnV3JA0vZTBmCUHjOi7yDVsRhzrzjkptA
	jczeWIx8F7LdruZqEFtS5TSiBNq7COMqiFHpPFzg=
Content-Type: multipart/mixed; boundary="===============5222382652934616246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tzcode-native,tzdata: upgrading to 2025b,2025b FAILED
Message-ID: <01010195f1607b81-f4384d29-bffb-40a3-88f1-6412dbd71f92-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214029

--===============5222382652934616246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tzcode-native,tzdata* to *2025b,2025b* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzcode-native-tzdata-upgrade-2025a-2025b-2025a-2025b.patch
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
From 53fcb82ed9fea050f269ee7263312c1368923b67 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 06:33:04 +0000
Subject: [PATCH] tzcode-native,tzdata: upgrade 2025a -> 2025b,2025a -> 2025b

---
 meta/recipes-extended/timezone/timezone.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index ca9e29f72d..62e08b0dc8 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025a"
+PV = "2025b"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
+SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
 SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
-- 
2.47.1


--===============5222382652934616246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1885 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (922 cached, 2 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cf8f14dce4d0a0d19ea592f6bb2607283e810f6a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 77 Local 59 Mirrors 0 Missed 18 Current 145 (76% match, 91% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 418 of 719 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa)
NOTE: Running task 437 of 719 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa)
NOTE: recipe tzcode-native-2025b-r0: task do_recipe_qa: Started
NOTE: recipe tzdata-2025b-r0: task do_recipe_qa: Started
NOTE: recipe tzcode-native-2025b-r0: task do_recipe_qa: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa unihash changed to 0e1cb40f2ca2d4a65c7d2ae2b514dc03151a066078da624d18815f24ac86607e
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa unihash changed to 209ed9fa09f9b5b974b9a2b5ccffc8eb0e2728e825bf6c0e665030aea66bfc4c
NOTE: Setscene tasks completed
NOTE: Running task 686 of 719 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: Running task 687 of 719 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe tzcode-native-2025b-r0: task do_fetch: Started
NOTE: recipe tzdata-2025b-r0: task do_fetch: Started
WARNING: tzcode-native-2025b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2025b.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzcode-native-2025b-r0 do_fetch: Checksum mismatch for local file /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025b.tar.gz
Cleaning and trying again.
WARNING: tzcode-native-2025b-r0 do_fetch: Renaming /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025b.tar.gz to /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025b.tar.gz_bad-checksum_11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474
WARNING: tzdata-2025b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2025b.tar.gz;name=tzdata;subdir=tz - will attempt other sources if available
WARNING: tzdata-2025b-r0 do_fetch: Checksum mismatch for local file /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025b.tar.gz
Cleaning and trying again.
WARNING: tzdata-2025b-r0 do_fetch: Renaming /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025b.tar.gz to /srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025b.tar.gz_bad-checksum_11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474
NOTE: recipe tzcode-native-2025b-r0: task do_fetch: Failed
NOTE: recipe tzdata-2025b-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 687 tasks of which 683 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401063250.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401063250.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2025b/temp/log.do_fetch.1236392
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2025b/temp/log.do_fetch.1236393
Summary: There were 6 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: tzcode-native-2025b-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2025b.tar.gz;name=tzdata;subdir=tz
ERROR: tzcode-native-2025b-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025b.tar.gz\' has sha256 checksum \'11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474\' when \'4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2025b.tar.gz;name=tzdata;subdir=tz')
ERROR: tzdata-2025b-r0 do_fetch: Checksum failure fetching http://www.iana.org/time-zones/repository/releases/tzdata2025b.tar.gz;name=tzdata;subdir=tz
ERROR: tzdata-2025b-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/pokybuild/yocto-worker/auh/build/build/downloads/tzdata2025b.tar.gz\' has sha256 checksum \'11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474\' when \'4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'http://www.iana.org/time-zones/repository/releases/tzdata2025b.tar.gz;name=tzdata;subdir=tz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/tzcode-native/2025b/temp/log.do_fetch.1236392
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/tzdata/2025b/temp/log.do_fetch.1236393
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============5222382652934616246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzcode-native-tzdata-upgrade-2025a-2025b-2025a-2025b.patch"

RnJvbSA1M2ZjYjgyZWQ5ZmVhMDUwZjI2OWVlNzI2MzMxMmMxMzY4OTIzYjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNjozMzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR6
Y29kZS1uYXRpdmUsdHpkYXRhOiB1cGdyYWRlIDIwMjVhIC0+IDIwMjViLDIwMjVhIC0+IDIwMjVi
CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25lL3RpbWV6b25lLmluYyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKaW5kZXggY2E5ZTI5Zjcy
ZC4uNjJlMDhiMGRjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25l
L3RpbWV6b25lLmluYworKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpv
bmUuaW5jCkBAIC02LDcgKzYsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNFTlNFID0gIlBEICYg
QlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzY3
OWM5ZDZiMDJiYzI3NTdiM2VhZjhmNTNjNDNmYmEiCiAKLVBWID0gIjIwMjVhIgorUFYgPSAiMjAy
NWIiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVzL3JlcG9zaXRv
cnkvcmVsZWFzZXMvdHpjb2RlJHtQVn0udGFyLmd6O25hbWU9dHpjb2RlO3N1YmRpcj10eiBcCiAg
ICAgICAgICAgIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25lcy9yZXBvc2l0b3J5L3JlbGVh
c2VzL3R6ZGF0YSR7UFZ9LnRhci5nejtuYW1lPXR6ZGF0YTtzdWJkaXI9dHogXApAQCAtMTYsNSAr
MTYsNSBAQCBTID0gIiR7V09SS0RJUn0vdHoiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRw
Oi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMiCiAKLVNSQ19VUklbdHpjb2RlLnNoYTI1NnN1bV0g
PSAiMTE5Njc5ZDU5Zjc2NDgxZWI1ZTAzZDNkMmE0N2Q3ODcwZDU5MmYzOTk5NTQ5YWYxODlkYmQz
MWYyZWJmNTA2MSIKK1NSQ19VUklbdHpjb2RlLnNoYTI1NnN1bV0gPSAiMDVmOGZlZGIzNTI1ZWU3
MGQ0OWM4N2QzZmFlNzhhOGEwZGJhZTRmZTg3YWE1NjVjNjVjZGE5OTQ4YWUxMzVlYyIKIFNSQ19V
UklbdHpkYXRhLnNoYTI1NnN1bV0gPSAiNGQ1ZmNiYzcyYzdjNDUwZWJmZTBiNjU5YmQwZjFjMDJm
YmY1MmZkN2Y1MTdhOWVhMTNmZTcxYzIxZWI1ZjBkMCIKLS0gCjIuNDcuMQoK

--===============5222382652934616246==--

