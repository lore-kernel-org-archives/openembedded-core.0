Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4536.1795813552285815990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 13:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=B+2CDaIB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261127210548bcee6b296e0002077d-xqiovj@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261127210548bcee6b296e0002077d
        for <openembedded-core@lists.openembedded.org>;
        Fri, 27 Nov 2026 22:05:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=L6tevjcAzfIDBQbK4BfCs/KSe7TrU0TZkrrJYR9u7fY=;
 b=B+2CDaIBZl4KahhYSOdd8uVCkXA10+2Byn8+aaNXdG+K5xvDQQ9SDu4uqIMdnXF+nEyUwZ
 2dqGJ0YcPkxW3IOgYtIQWCTAl97ymrzese+tBrWmO3KVlXaoN4tHemz4et1LQ133NZo0R9f2
 bPazA9GEYswEVIouhLXNyx0BgHV0o7VSBY9wve3QOSfbI3pSCSmKqkzlPo4R/8VgN2PBP4N0
 uN1CB52mzjXLlx144F8xpbF/IvCOLMIj5Sl15CXPdndSdCtihDVjTOEMvxm8N3m6Q+RD4i2b
 fzD4/2TpkAGJjn5HD/KnhzSK5hvIdVaO1NJvSeFHNQrlaKPPZUCewc2g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] gpgme: upgrade 2.2.0 -> 2.3.1
Date: Fri, 27 Nov 2026 22:05:10 +0100
Message-ID: <20261127210510.676446-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 21:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251456
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Release notes: https://github.com/gpg/gpgme/blob/gpgme-2.3.1/NEWS

Noteworthy changes in version 2.3.1 (2026-11-19)   [C48/A3/R1]
------------------------------------------------
 * Fix a regression in 2.3.0
 Release-info: https://dev.gnupg.org/T8427

Noteworthy changes in version 2.3.0 (2026-11-18)   [C48/A3/R0]
------------------------------------------------
 * New constants GPGME_PK_MLKEM, GPGME_PK_MLDSA, and GPGME_PK_DLTHM.
   Add mappings for algos used bei backends.   [rMa85fa49236]
 * Fix a double free in the status line read code.
   [T8557,CVE-2026-129975]
 * Interface changes relative to the 2.2.0 release:
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 GPGME_PK_DLTHM                NEW.
 GPGME_PK_MLKEM                NEW.
 GPGME_PK_MLDSA                NEW.
 Release-info: https://dev.gnupg.org/T8427

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gpgme/{gpgme_2.2.0.bb => gpgme_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_2.2.0.bb => gpgme_2.3.1.bb} (96%)

diff --git a/meta/recipes-support/gpgme/gpgme_2.2.0.bb b/meta/recipes-support/gpgme/gpgme_2.3.1.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_2.2.0.bb
rename to meta/recipes-support/gpgme/gpgme_2.3.1.bb
index bffa0b40e41..739313073fc 100644
--- a/meta/recipes-support/gpgme/gpgme_2.2.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.3.1.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "7160e80e84dafd00d956c84891c533bb7ab16a6a54fbe1574b2f3acf0496977b"
+SRC_URI[sha256sum] = "2bf94e0e677e5a8fc31f79dd323f91c5416b36fb851058bc1e8bce39f2642434"
 
 DEPENDS = "libgpg-error-native libgpg-error libassuan"
 
