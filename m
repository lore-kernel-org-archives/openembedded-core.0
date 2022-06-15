Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56474CCA49F
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.4458.1655298221455411646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VaxC9oee;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101018167766048-0efb959d-9be0-4932-8e69-7d933424405c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OnpHmOmS2FN/kxPY/7WCA6KvB2+GnBL2IkDO+FvDfuc=;
	b=VaxC9oeeAqH1fsaoki612DYnzh2Jpw3WKSnODr9u+TqVP5XRp/LZfs16CwZ/+sQQ
	C8N0GeOnRFmD11+UH9VhFMuSATlESi/7BI0UV7awRfL29e1yD/gq8AyXZWqxyVt3DLi
	QnuSqtkA2x0tMfKYJCUYPJkfUgevwfZRGVsXEb/8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OnpHmOmS2FN/kxPY/7WCA6KvB2+GnBL2IkDO+FvDfuc=;
	b=QMHPOy/2MzLfiNbQC6Gv/EJX+pXcBC1l263Y8Y8F/7lcM1JzBZ7uPoixXJEC6F/i
	UNwR8BudzZI1fvWQuQMlAS1AMU+9BuqN4XbrnDP9wvMMIoR7fX4suHE4HS52IYrQ1UX
	VsElfmkzmQiqk3bgw9xONORwnV+TeM65Y7B11+nI=
Content-Type: multipart/mixed; boundary="===============4612656735641227422=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.18.3 FAILED
Message-ID: 
 <0101018167766048-0efb959d-9be0-4932-8e69-7d933424405c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166946

--===============4612656735641227422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.18.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.18.2-1.18.3.patch
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
--===============4612656735641227422==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.18.2-1.18.3.patch"

From 2c354ef9ae3e5928eb8e151d530d0f895d503e4f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 07:28:08 +0000
Subject: [PATCH] go: upgrade 1.18.2 -> 1.18.3

---
 meta/recipes-devtools/go/{go-1.18.2.inc => go-1.18.3.inc} | 2 +-
 meta/recipes-devtools/go/{go_1.18.2.bb => go_1.18.3.bb}   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/go/{go-1.18.2.inc => go-1.18.3.inc} (88%)
 rename meta/recipes-devtools/go/{go_1.18.2.bb => go_1.18.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.18.2.inc b/meta/recipes-devtools/go/go-1.18.3.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.18.2.inc
rename to meta/recipes-devtools/go/go-1.18.3.inc
index 8f4f47db9e..68062952ca 100644
--- a/meta/recipes-devtools/go/go-1.18.2.inc
+++ b/meta/recipes-devtools/go/go-1.18.3.inc
@@ -14,4 +14,4 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "2c44d03ea2c34092137ab919ba602f2c261a038d08eb468528a3f3a28e5667e2"
+SRC_URI[main.sha256sum] = "0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d"
diff --git a/meta/recipes-devtools/go/go_1.18.2.bb b/meta/recipes-devtools/go/go_1.18.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.18.2.bb
rename to meta/recipes-devtools/go/go_1.18.3.bb
-- 
2.31.1


--===============4612656735641227422==
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
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.18.2.bb:1: Could not include required file go-1.18.2.inc
ERROR: Parsing halted due to errors, see error messages above

--===============4612656735641227422==--

