Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F123FC46467
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.19013.1652634913207034421
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FTL/jNbb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010180c8b78600-fd0f7b8c-fa24-4e4c-b233-0e026e5041ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=glt+/XIxSjUfWQ7Om9JXi0/Jg7mUqpdMJe9cMQ0G/Nk=;
	b=FTL/jNbbUSe63ARC63ZlVS5rqEUI8oejAbKCKQUbuCn16Ve+wexHDZ1iBRTbakSZ
	8sZcpwhLTcR5o/GlYM9zx9C8EGQiPYDdsNYWyX3qZXeSrArvJReNhRzbC2sFBCVWLhT
	YQ8PjijHFVzXaajeJDK6LRWfMs/fVdZoYkjdH/pI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=glt+/XIxSjUfWQ7Om9JXi0/Jg7mUqpdMJe9cMQ0G/Nk=;
	b=THw0x5Q7h4v3UVmEDQT7LT8+Z51p8FVHUJBwwBpRosxyVMt7y0IyYvGAy6etOU6z
	iEZ/3UbztPDwtlD1S8Ifx+FlFRO2wAE5bF/cAmEUcQuhx90pi9LwtY8B39nmWoecQGz
	PIX7LcDBWcFgBO+5WA4q1tQ8REAB73gg8fRPLYsA=
Content-Type: multipart/mixed; boundary="===============0288657647028053365=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.18.2 FAILED
Message-ID: 
 <01010180c8b78600-fd0f7b8c-fa24-4e4c-b233-0e026e5041ab-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165615

--===============0288657647028053365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.18.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.18.1-1.18.2.patch
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
--===============0288657647028053365==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.18.1-1.18.2.patch"

From e3debce8fb56238417957dd7f5fe608e8880504d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 07:14:47 +0000
Subject: [PATCH] go-runtime: upgrade 1.18.1 -> 1.18.2

---
 meta/recipes-devtools/go/{go-1.18.1.inc => go-1.18.2.inc}       | 2 +-
 .../go/{go-runtime_1.18.1.bb => go-runtime_1.18.2.bb}           | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/go/{go-1.18.1.inc => go-1.18.2.inc} (88%)
 rename meta/recipes-devtools/go/{go-runtime_1.18.1.bb => go-runtime_1.18.2.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.18.1.inc b/meta/recipes-devtools/go/go-1.18.2.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.18.1.inc
rename to meta/recipes-devtools/go/go-1.18.2.inc
index 64426471df..8f4f47db9e 100644
--- a/meta/recipes-devtools/go/go-1.18.1.inc
+++ b/meta/recipes-devtools/go/go-1.18.2.inc
@@ -14,4 +14,4 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088"
+SRC_URI[main.sha256sum] = "2c44d03ea2c34092137ab919ba602f2c261a038d08eb468528a3f3a28e5667e2"
diff --git a/meta/recipes-devtools/go/go-runtime_1.18.1.bb b/meta/recipes-devtools/go/go-runtime_1.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.18.1.bb
rename to meta/recipes-devtools/go/go-runtime_1.18.2.bb
-- 
2.31.1


--===============0288657647028053365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.18.1.bb:1: Could not include required file go-1.18.1.inc
ERROR: Parsing halted due to errors, see error messages above

--===============0288657647028053365==--

