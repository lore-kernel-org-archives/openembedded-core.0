Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF92CCA498
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.940.1657900668119059240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Njpi66im;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101018202949100-4aeb5dc3-5135-4d78-a64a-0f7d1fe75f2d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CDkqLt9sE2VjADJnRHcpdys1dQUMzbYLWd21w3x3b64=;
	b=Njpi66imXqFn239MO6iSOAKs6p94VOJU59SboQSeHDJSy6KJHhj5I7n/bGcKrDuC
	+C01F9iCIoTrUJQHywd3GVOC3fzTRi9ZjhmWABT6YGbj5mM+oxMQMMB2Z8ZKgiQXyp1
	yQVxAuANspo73vgZ/l1U5hLwBFkRqdd7b3TLVFb0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CDkqLt9sE2VjADJnRHcpdys1dQUMzbYLWd21w3x3b64=;
	b=cXstCT8ntc0rV8v5LdQjk1r/r886qybu7/TaRf77e2mWhOCkgU67mnlVUsIuCBrc
	/0h+NeLJI8I9x9de1zCpuxk8TAsF0RWSxbdBBQ9iZSZuAjTlyx1y1oGLZtWiF8NHYOw
	AgCU5vgRYvicwifnPny36ibglydjUbjDcKSt4SvM=
Content-Type: multipart/mixed; boundary="===============3534433842173632543=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.18.4 FAILED
Message-ID: 
 <0101018202949100-4aeb5dc3-5135-4d78-a64a-0f7d1fe75f2d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168075

--===============3534433842173632543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.18.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.18.3-1.18.4.patch
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
--===============3534433842173632543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.18.3.bb:1: Could not include required file go-1.18.3.inc
ERROR: Parsing halted due to errors, see error messages above

--===============3534433842173632543==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.18.3-1.18.4.patch"

From 9578d96ed154fa21fe13b9a716641ec4d650e3c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 06:58:33 +0000
Subject: [PATCH] go: upgrade 1.18.3 -> 1.18.4

---
 meta/recipes-devtools/go/{go-1.18.3.inc => go-1.18.4.inc} | 2 +-
 meta/recipes-devtools/go/{go_1.18.3.bb => go_1.18.4.bb}   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/go/{go-1.18.3.inc => go-1.18.4.inc} (89%)
 rename meta/recipes-devtools/go/{go_1.18.3.bb => go_1.18.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.18.3.inc b/meta/recipes-devtools/go/go-1.18.4.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.18.3.inc
rename to meta/recipes-devtools/go/go-1.18.4.inc
index 693b045e8f..bfda15c54f 100644
--- a/meta/recipes-devtools/go/go-1.18.3.inc
+++ b/meta/recipes-devtools/go/go-1.18.4.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
 "
-SRC_URI[main.sha256sum] = "0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d"
+SRC_URI[main.sha256sum] = "4525aa6b0e3cecb57845f4060a7075aafc9ab752bb7b6b4cf8a212d43078e1e4"
diff --git a/meta/recipes-devtools/go/go_1.18.3.bb b/meta/recipes-devtools/go/go_1.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.18.3.bb
rename to meta/recipes-devtools/go/go_1.18.4.bb
-- 
2.31.1


--===============3534433842173632543==--

