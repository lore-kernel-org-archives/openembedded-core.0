Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2039EC1452
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:37:18 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18352.1772545032293485296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 05:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=NXorMgev;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1334352-20260303133710ffeb59929d00020786-svakoz@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260303133710ffeb59929d00020786
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Mar 2026 14:37:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=y3RkwirlW3H9PwYTP5LK0dtic8/Bxhg6MfjLkyPB/ps=;
 b=NXorMgevA1OcUXTvci8E/97w5Spemc6x8J/X4lWWkZgBZrVlFOa8J55jobHq7X9G/Qb/y7
 bpzMaTgiL/m+neTBgrE8dSSmpNDiQOq64f+vDE9bs+jyV2e2DAF3PSJLpoU2+UmhqH2hxBwI
 pSiht3APk7gju15wBIECHrf3nZm5wW+EchrvCADuwqsOtagUiaJlDZl9uKCTRAOM4EWJ0RDg
 G+rhT1Sa6AFLSEzgrnh2uEXferHzVuCND02qdwLgiVwfYOPQyxpw5T9A3fLuK6p1dxbY1qfB
 Aq1G85Le51d5Dbl9lLxTJXKEwYtzA6jIO8YBBUgiMVvUyyGnf2LAMhLw==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH 6/6] shadow: upgrade 4.18.0 -> 4.19.4
Date: Tue,  3 Mar 2026 14:36:45 +0100
Message-ID: <20260303133645.1449-6-andrej.kozemcak@siemens.com>
In-Reply-To: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
References: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 13:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232312

Changelog:  https://github.com/shadow-maint/shadow/blob/4.19.4/ChangeLog

  - useradd.8: fix default group ID (Tim Biermann)
  - revert drop of subid_init() (Serge Hallyn)
  - Georgian translation (NorwayFun)
  - useradd: Avoid taking unneeded space: do not reset non-existent data
    in lastlog (David Kalnischkies)
  - relax username restrictions (Alexander Kanavin)
  - selinux: check MLS enabled before setting serange (genBTC)
  - copy_tree: use fchmodat instead of chmod (Samanta Navarro)
  - copy_tree: don't block on FIFOs (Samanta Navarro)
  - add shell linter (Jan Macku)
  - copy_tree: carefully treat permissions (Samanta Navarro)
  - lib/commonio: make lock failures more detailed (Luca BRUNO)
  - lib: use strzero and memzero where applicable (Christian Göttsche)
  - Update Dutch translation (Frans Spiesschaert)
  - Don't test for NULL before calling free (Alex Colomar)
  - Use libc MAX() and MIN() (Alejandro Colomar)
  - chage: Fix regression in print_date (Xiami)
  - usermod: report error if homedir does not exist (Iker Pedrosa)
  - libmisc: minimum id check for system accounts (Iker Pedrosa)
  - fix usermod -rG x y wrongly adding a group (xyz)
  - man: add missing space in useradd.8.xml (Iker Pedrosa)
  - lastlog: check for localtime() return value (Iker Pedrosa)
  - Raise limit for passwd and shadow entry length (Iker Pedrosa)
  - Remove adduser-old.c (Alejandro Colomar)
  - useradd: Fix buffer overflow when using a prefix (David Michael)
  - Don't warn when failed to open /etc/nsswitch.conf (Serge Hallyn

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../shadow/{shadow_4.18.0.bb => shadow_4.19.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/shadow/{shadow_4.18.0.bb => shadow_4.19.4.bb} (99%)

diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-extended/shadow/shadow_4.19.4.bb
similarity index 99%
rename from meta/recipes-extended/shadow/shadow_4.18.0.bb
rename to meta/recipes-extended/shadow/shadow_4.19.4.bb
index d9a49d8ccf..7bc7f74555 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
            "
-SRC_URI[sha256sum] = "ae486ce4c0bce55c42d76d8478e428c41586f1da2f89fbf5228243fb4d849db4"
+SRC_URI[sha256sum] = "ba7e9aed1c5420203ac549583d6e6f485a819ac7505af9c7cd8c13b2013210b8"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.47.3


