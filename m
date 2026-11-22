Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43893.1795388680101221862
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 15:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XUZXM+N5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202611222304363a6eb9f5de00020718-vctupz@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202611222304363a6eb9f5de00020718
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Nov 2026 00:04:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jDNBfO7hlGCnJK6iC6x9NF77Bdnhrt9kkC6WCULl1JI=;
 b=XUZXM+N5BkecSf6E7YM/md4oi0l9X9dQUzSlt0TfxiB+1ocDOMcQ2gLnIMTfnwThh9Bysi
 ekIpMudddPFswyTVQbsMMLvuEEiTvWdmuJGuV3l4lj2FIzb4V4eN+7VXUtm6r6zLRR6MvzH9
 AiseplpSoqbFXmjtjVIGsHBWRd/5YCo4pD8jzALb7QF1w7BY/Q/H4tKDQqbeOpwG+EU+sMXj
 sfsEOljpa9T5zRY6D/lkEpVFS2HPJHb+OVugUWNWN8+IiHirEQsDM7NISk5j61RTZbRbYUTb
 cKinxFZiJ3mxKd+eUonYcwCcDSJI7E74mhfWYPcSHLwrmks3bdAJ+P8Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v3] grub: update upstream-check
Date: Mon, 23 Nov 2026 00:04:27 +0100
Message-ID: <20261122230427.203608-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 23:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250877
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Repository has moved, see [1].
Old location does not contain new releases anymore.

[1] https://www.phoronix.com/news/GNU-GRUB-To-FreeDesktop

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v3: add $ to version regex to skip -rcX tags

 meta/recipes-bsp/grub/grub2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 466c772e5bf..a7c6bc4f66f 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -23,6 +23,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
 
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/gnu-grub/grub/-/tags"
+UPSTREAM_CHECK_REGEX = "grub-(?P<pver>\d+(\.\d+)+)$"
+
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
