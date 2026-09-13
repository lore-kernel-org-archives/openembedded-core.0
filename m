Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6F3C88E63
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 21:00:10 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6837.1789333206334290670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 14:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eeONyy6j;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026091321000479c4f5baa80002072a-o9yqer@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026091321000479c4f5baa80002072a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 23:00:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jnSRqE06/4LXi7Ubw+XZrha7hSZiYErbB15gQUKPWw0=;
 b=eeONyy6jFdnoaDeBiuh7vwJkcr6QJIym+JENHypdu+j40ZzmnjV19/5Qr4dTZNh+HGliJO
 cSDMCDNsBiQJU+nsqvPRBQWE7AkO0Y+bbqNkoD+PHQn1Rqb7Ee09em06ZAgcYkjuAGq8UWE1
 9o/Xtf70vPGYui1PwlHz0yyLdiBH8Cee/GsklQWIg44l0HPYSJOHiFJ69ZMnoh910n56ZJjz
 zYLd1QcpnjlySlu2dIf1z/i4gR5mCNXbNGnOCiqjmljAj2TCcLJESnDsuRI5Bxkmar0+ctx2
 wRCUZ/EYkhgLeBWWn1POaSTd+oQjE+6vwAJKDd+5bdmSwuUbRSrAHXYA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/3] libucontext: upgrade 1.3.2 -> 1.5.2
Date: Sun, 13 Sep 2026 22:59:11 +0200
Message-ID: <20260913205911.3638917-3-peter.marko@siemens.com>
In-Reply-To: <20260913205911.3638917-1-peter.marko@siemens.com>
References: <20260913205911.3638917-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 21:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245742

From: Peter Marko <peter.marko@siemens.com>

Release Notes [1]:

Changes from 1.5.1 to 1.5.2
---------------------------
* Fix KERNEL_UAPI_UCONTEXT_SIZE typo in 32-bit PowerPC headers.

Changes from 1.5 to 1.5.1
-------------------------
* Rename public register definitions on x86 and x86_64 to avoid clashing
  with glibc definitions when built in freestanding mode.
  Patch contributed by Daan De Meyer.

Changes from 1.4 to 1.5
-----------------------
* Workaround various header compatibility issues in glibc and bionic.
* Allow ppc64 target to be built in freestanding mode.

Changes from 1.3.3 to 1.4
-------------------------
* Add hard-float support to most architectures where relevant.
  Some patches contributed by Richard Campbell.

Changes from 1.3.2 to 1.3.3
---------------------------
* Use `bl` instruction instead of explicit GOT lookup for `exit`
  in 64-bit PowerPC assembly.
* Fix installation path for standalone libucontext headers.
  Patch contributed by Marian Buschsieweke.
* Fix missing includes for freestanding builds.
  Patch contributed by David Leeds.

[1] https://github.com/kaniini/libucontext/blob/libucontext-1.5.2/NEWS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
I'm not particularly interested in this update, I just noticed it being
very old and not handled by AUH when adding tag to SRC_URI...
I guess AUH should be updated to also run non-default configurations
(e.g. musl) to cover more recipes...

 .../musl/{libucontext_1.3.2.bb => libucontext_1.5.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/musl/{libucontext_1.3.2.bb => libucontext_1.5.2.bb} (97%)

diff --git a/meta/recipes-core/musl/libucontext_1.3.2.bb b/meta/recipes-core/musl/libucontext_1.5.2.bb
similarity index 97%
rename from meta/recipes-core/musl/libucontext_1.3.2.bb
rename to meta/recipes-core/musl/libucontext_1.5.2.bb
index 2d4505b68f..47af50e235 100644
--- a/meta/recipes-core/musl/libucontext_1.3.2.bb
+++ b/meta/recipes-core/musl/libucontext_1.5.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ebea527af0602d509b7f4c49533fb1bd"
 SECTION = "libs"
 DEPENDS = ""
 
-SRCREV = "a0323579ac50b9a9d4033754d089f1fed0f59a00"
+SRCREV = "49e671dd52ff6791295d8161ad3b6da7dc5f6f9d"
 SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https;tag=${BPN}-${PV} \
            "
 

