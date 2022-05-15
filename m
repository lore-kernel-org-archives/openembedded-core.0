Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FA4C38A05
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.18886.1652634913627203930
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RQhh1rZU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010180c8b786f2-4931fcdd-cc1d-484f-b554-3360aea2af52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rF5lDsMODHbMiy7JND5dYruiUGbqXHUl1w/r+zxvFhQ=;
	b=RQhh1rZUuN51YyUl/PLts1BAW/Zii8MhDAbqKIXnErMf7nPP9bj9Gp3IDEMSwA13
	uGXNYrgvW5HZ84pnysynXdC2KAenjqGtMspN3v8s30BHh4XJ6m0eZR5dq0mZmTfXO+F
	bo0C4Z6nYNw+CM66MaUKgIo7LLxgg43STHW36ocw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rF5lDsMODHbMiy7JND5dYruiUGbqXHUl1w/r+zxvFhQ=;
	b=UHU3u04L0UtCU6mZWf39NU1H+BtyoWM5wqWFYxdmudYnDaIjIdEL2QtqBs8KtgZ8
	Y4qiqYKG10Dv7Bl4JKeisEn/NzQDoPny/XkN4uo7vCMOgibDwBrRrDDH6njp6Kbav83
	9dpQVHOwzs6N+s7JGBuSJr6HGhV5ntjATeZ4+JII=
Content-Type: multipart/mixed; boundary="===============3636637085979421859=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.18.2 FAILED
Message-ID: 
 <01010180c8b786f2-4931fcdd-cc1d-484f-b554-3360aea2af52-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165624

--===============3636637085979421859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.18.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.18.1-1.18.2.patch
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
--===============3636637085979421859==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.18.1-1.18.2.patch"

From d4ca04f9482ffeb57ea7b74282003743e85cbc9a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 07:17:04 +0000
Subject: [PATCH] go: upgrade 1.18.1 -> 1.18.2

---
 meta/recipes-devtools/go/{go-1.18.1.inc => go-1.18.2.inc} | 2 +-
 meta/recipes-devtools/go/{go_1.18.1.bb => go_1.18.2.bb}   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/go/{go-1.18.1.inc => go-1.18.2.inc} (88%)
 rename meta/recipes-devtools/go/{go_1.18.1.bb => go_1.18.2.bb} (100%)

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
diff --git a/meta/recipes-devtools/go/go_1.18.1.bb b/meta/recipes-devtools/go/go_1.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.18.1.bb
rename to meta/recipes-devtools/go/go_1.18.2.bb
-- 
2.31.1


--===============3636637085979421859==
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
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-native_1.18.1.bb:4: Could not include required file go-1.18.1.inc
ERROR: Parsing halted due to errors, see error messages above

--===============3636637085979421859==--

