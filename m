Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12550.1795500412751526255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SMWiYpcN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026112406064939f720c30e0002079a-o2r2jd@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026112406064939f720c30e0002079a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 24 Nov 2026 07:06:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=CRAZCFOC9Fi1bRR6zzO65lVIEUDIHl15XRXTaS5eArU=;
 b=SMWiYpcNIMIYS5pyXTYoW5H6fHycfKBkv8VADPsDkzlSM1XhUSA/6JZSCj+QUEFfletc9v
 B29UmtAlozDacOybppdh9rORtFOJZzIaeTNTMszKIObUpFV96hlJAACrPmrUGnRkddFSfzMc
 bA5sP+assM8T+c+eJhH06gsXDc0eCbZoWivoNNrUr5rA0m6iFUccyDucKdT+AKMmOR4JPYjz
 cUVbOWQHMwHB562cht1/ZYZASmp5hEDTZp2bmy7moxH3KJZ28t8X2o8hIkUDSKbdVeGy/HmD
 jZ3D6cP3ovSsyuitfu/SjNFNOfcEBUkXru82wqubCdrZ0orBhxtPNGTg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] expat: upgrade 2.10.0 -> 2.11.0
Date: Tue, 24 Nov 2026 07:06:47 +0100
Message-ID: <20261124060647.3151588-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250945
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Security fixes:
* CVE-2026-124317
* CVE-2026-128241
* CVE-2026-134703
* #1495

Release blog: [1]
Full changelog: [2]

[1] https://blog.hartwork.org/posts/expat-2-11-0-released/
[2] https://github.com/libexpat/libexpat/blob/R_2_11_0/expat/Changes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/expat/{expat_2.10.0.bb => expat_2.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.10.0.bb => expat_2.11.0.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.10.0.bb b/meta/recipes-core/expat/expat_2.11.0.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.10.0.bb
rename to meta/recipes-core/expat/expat_2.11.0.bb
index 5b252f6146..14f6025799 100644
--- a/meta/recipes-core/expat/expat_2.10.0.bb
+++ b/meta/recipes-core/expat/expat_2.11.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.xz  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "c624ba2998fc65df1163a49641ff3f9ab73138b11641d92c86bee0fb01b1bc7f"
+SRC_URI[sha256sum] = "61e7614b602201c28a189dafee78f5bceaee192bbde46a930752ff09cf5542fa"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
