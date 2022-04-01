Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F64BC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.10523.1648819420822820118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=tg3IXEeb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 0101017fe54bbe60-c1dc6625-cd2f-4cd3-a3c0-1103c7eab66f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819421;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=sKKhqQsr76ne1VzCipUtmoNxF2T9vdajG/61flnTVbI=;
	b=tg3IXEebLFq07sKG1xKqZ8rKMytufBDEfGDLmObA1GX0MNtPc80Mu034koXxkJM5
	z7g7VBoOUFGgkJo7SQ+8bqpNLi5+6T1YX5arwR3dvK+lomDRs6EsJDLRvgJf/SeJ10r
	2Mu3qwPc31LL3NDdj8KY4K5wr/0yUKh5LPUlNqng=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819421;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=sKKhqQsr76ne1VzCipUtmoNxF2T9vdajG/61flnTVbI=;
	b=CBJbczFg4dkvo82ENE1/rJHlx1FR1QNr2rf6jkmVDozFWzB8s/snsMbBALLtRxMv
	VAFdlMukTLIzQ6ALsf6Z7iag5iZ2qbfboE2axjzkAj/0p864gtj1jFHKAU1SHTEGb3r
	uhrkLUtCZVg2O01frzapIutkyzf2rXGmkh0li5wQ=
Content-Type: multipart/mixed; boundary="===============1809783407934175892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tzdata: upgrading to 2022a FAILED
Message-ID: 
 <0101017fe54bbe60-c1dc6625-cd2f-4cd3-a3c0-1103c7eab66f-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163911

--===============1809783407934175892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tzdata* to *2022a* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-upgrade-2021e-2022a.patch
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
--===============1809783407934175892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (880 cached, 2 parsed). 1640 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3374279bb012fd9f3c89cf050ccd30c3491699e6"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 5 Mirrors 0 Missed 9 Current 101 (35% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 331 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: Running task 335 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzcode-native-2022a-r0: task do_fetch: Started
NOTE: recipe tzdata-2022a-r0: task do_fetch: Started
WARNING: tzcode-native-2022a-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022a.tar.gz
Cleaning and trying again.
WARNING: tzcode-native-2022a-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022a.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022a.tar.gz_bad-checksum_ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664
WARNING: tzcode-native-2022a-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022a.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzcode-native-2022a-r0: task do_fetch: Failed
WARNING: tzdata-2022a-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022a.tar.gz
Cleaning and trying again.
WARNING: tzdata-2022a-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022a.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022a.tar.gz_bad-checksum_ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664
WARNING: tzdata-2022a-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022a.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzdata-2022a-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 479 tasks of which 477 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch
Summary: There were 6 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: tzcode-native-2022a-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022a.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022a.tar.gz' has sha256 checksum 'ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664' when '07ec42b737d0d3c6be9c337f8abb5f00554a0f9cc4fcf01a703d69403b6bb2b1' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2022a-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022a.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/tzcode-native/2022a-r0/temp/log.do_fetch.2473923
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: tzdata-2022a-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022a.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022a.tar.gz' has sha256 checksum 'ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664' when '07ec42b737d0d3c6be9c337f8abb5f00554a0f9cc4fcf01a703d69403b6bb2b1' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2022a-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022a.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/tzdata/2022a-r0/temp/log.do_fetch.2473922
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============1809783407934175892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-tzdata-upgrade-2021e-2022a.patch"

From b9a6c63e16686936968618487e31b66b75279106 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 10:10:53 +0000
Subject: [PATCH] tzdata: upgrade 2021e -> 2022a

---
 meta/recipes-extended/timezone/timezone.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 43d14d7f12..7048c4c3a1 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2021e"
+PV = "2022a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "584666393a5424d13d27ec01183da17703273664742e049d4f62f62dab631775"
+SRC_URI[tzcode.sha256sum] = "f8575e7e33be9ee265df2081092526b81c80abac3f4a04399ae9d4d91cdadac7"
 SRC_URI[tzdata.sha256sum] = "07ec42b737d0d3c6be9c337f8abb5f00554a0f9cc4fcf01a703d69403b6bb2b1"
 
-- 
2.27.0


--===============1809783407934175892==--

