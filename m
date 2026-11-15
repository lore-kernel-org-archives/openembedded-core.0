Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15242.1794778938044453325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=G5g1R/kP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202611152142150fd5094837000207af-fmtcdw@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202611152142150fd5094837000207af
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:42:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=31BgblfUn/ArfgDXirhsJix4zQtjUT7VBawZsmkZY+w=;
 b=G5g1R/kPhFxkwS8Tv3LzMnFWtZcCHiX73CkdZi1D3I2fsIQ0npI2QpP6pMamu4+fDS9/xt
 fyBE0FiXntHXb+J5embCj9POs52Ywr3IxOJehmAk1nP16ttPv5bLZwZJI3Bw/T1jTOGnu2xn
 NldSd0W7a9zIoqa00Wm4qEJ0Fvg2yyzDBCW+YyJ1KnK2WqVedfzBaqgNup4/q9N3+/LCBG+h
 uMlVjnBC5jWBSvKqlTc2mdTsPvHYHl14jYOSo+B3F6atc4YZ7RhqAV3S0fVIbHQ1Knh7H0kv
 4wB8DeLUzj/sQLGAPQjI0ANJ22kNsnKh6+ceC1cUBtjDM1ExDYjQ+s3w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/9] apt: upgrade 3.0.3 -> 3.0.4
Date: Sun, 15 Nov 2026 22:39:35 +0100
Message-ID: <20261115213944.1653468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250290
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://metadata.ftp-master.debian.org/changelogs/main/a/apt/apt_3.0.4_changelog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 203c161188764e57677758e4d0cc7951428a208a)
Fixes CVE-2026-109518.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/apt/{apt_3.0.3.bb => apt_3.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_3.0.3.bb => apt_3.0.4.bb} (98%)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.4.bb
similarity index 98%
rename from meta/recipes-devtools/apt/apt_3.0.3.bb
rename to meta/recipes-devtools/apt/apt_3.0.4.bb
index 7c72f489a3..901eee5eaf 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.4.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "5b5f6f6d26121742a83aa80d4ed0eb0c6ce9bea259518db412edefd95760e4ef"
+SRC_URI[sha256sum] = "e853aec49afbe520ebcd4dbcbc98e1c55262c6bf1c119cf43e6aec69752443c6"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
