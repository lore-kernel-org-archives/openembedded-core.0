Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4866.1794866632046183009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 14:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GFCwrDtb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261116220349d1c0605b0200020743-lslgtn@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261116220349d1c0605b0200020743
        for <openembedded-core@lists.openembedded.org>;
        Mon, 16 Nov 2026 23:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=G6vepYycrux8Fa1eMkbnGxKqEkmR1iOMjR7mgDiSG1g=;
 b=GFCwrDtbWXBgqtkZhUENd9Wpqkw97ZSYhTKbFMWAua80l16xnEyRYNRFfcUS12sLLOXYmP
 Ahmu6cxpK1rxuv1nuXFTsPIozHqOz71TAZGPJlJIAFrrTST7Cd66IArRcrG77iBLgskl2nbZ
 RKEx7tvH7pzQN8EQkji9DMtW3EZ84EjvqMZfc8ww2H23ah2xJEEl4NjZqjfrha9/NZcYXbfL
 btNO+Bgg01hzct0ppvJX9a5Qy7IUx1u/nITRjz/bz8bSktZQbom0qy2HnhmzY29LZOT79JJ1
 oxA/q7mjZFqU7BA//JfngPrBdN47IS4zo4+PT/ZSKVAeAdOLeThI/02A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] gstreamer1.0: set status for CVE-2026-111183
Date: Mon, 16 Nov 2026 23:03:16 +0100
Message-ID: <20261116220316.58793-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 22:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250395
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Fixed release is mentioned in [1].
CVE data is still incorrect more than a month after release.

[1] https://gstreamer.freedesktop.org/security/sa-2026-0088.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
index 3a97ee009e..0bff1e17ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
@@ -74,5 +74,6 @@ CVE_PRODUCT = "gstreamer"
 CVE_STATUS[CVE-2026-5056] = "cpe-stable-backport: Fixed since 1.28.2"
 CVE_STATUS[CVE-2026-12891] = "cpe-stable-backport: Fixed since 1.28.5"
 CVE_STATUS[CVE-2026-12892] = "cpe-stable-backport: Fixed since 1.28.5"
+CVE_STATUS[CVE-2026-111183] = "cpe-stable-backport: Fixed since 1.28.8"
 
 PTEST_BUILD_HOST_FILES = ""
