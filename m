Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3672.1794951062708618151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 13:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ouCBiMPq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202611172130595220ad00ee000207e1-peqeqp@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202611172130595220ad00ee000207e1
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Nov 2026 22:31:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Azy3wOAiGUHkpYXpAeMginR+z7kojDZg+eFw+s6Vnok=;
 b=ouCBiMPqI+qlHvF1gh61lRJxZqif8fej84rCs6KyOo8c6CrGIVmisggB7QS/6jWH/QsLyr
 0phrvVaWhhGpslITfgHs8lbMGyVt1C9+/Ic5I9TeuSlET27enhd4dxvaKFo+JltqYAg8xN2U
 xSBk0NwLQE+PqMNK+ymDaDLgYQeegNTSrHi6BtOvVzhHLlAb3bzBu5mQ9v+666/BVFufw7ao
 hYp6Xs4qQh5zRcQt9USimBGztdox6DB57cHPQD0LAAWgEL+fHErn0GuCUTuOLXzZ7VA/Vm08
 KoGmNf9xm9V4ag0scbIdSS46QtDaDIRqNGUS5FZ+pkFrc7aTCPjyhykQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2 1/2] grub: update upstream-check
Date: Tue, 17 Nov 2026 22:30:47 +0100
Message-ID: <20261117213048.842034-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 21:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250494
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Repository has moved, see [1].
Old location does not contain new releases anymore.

[1] https://www.phoronix.com/news/GNU-GRUB-To-FreeDesktop

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: no changes in this patch

 meta/recipes-bsp/grub/grub2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 466c772e5bf..d0f737164f7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -23,6 +23,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
 
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/gnu-grub/grub/-/tags"
+UPSTREAM_CHECK_REGEX = "grub-(?P<pver>\d+(\.\d+)+)"
+
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
