Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2791.1794506901336035440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 10:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OpHhsL2W;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261112180818daf7616e1a00020774-ucga5h@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261112180818daf7616e1a00020774
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Nov 2026 19:08:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZYG8mDZqdkhz2Rd1VQTMOJJo4vwpuy4zyaD5HfroyvU=;
 b=OpHhsL2WbxeK7hNJJStOLZdviTMqB54zg5L2KzsKLuht2ft4qZhdVDNQrT3vcTIenMbMR8
 J6zGa+1GC0yI4X6BJ/u35FMJtU4+OryLGLu8s+ViZlZSW53omun+ZPLyrdu/QvJmpJiAq3zK
 Fnce6hxiGKzTX7q/44dZKl4Ndi+39xnm43E+KsEAw9x9S7BOtSyseNzmvV4d2vpknoKUS3D5
 ZtdYeF/dcFkpwfR1G7qTFw2HxEQOsS8RudT5A5RIcXKVGsde9DjNT/l1R19tgvNLh4pOFwmT
 ZNeEq9f88ldEZegE0Ny3uRgJkqE2aLA8z6hEpvdMUVf1tVcOtO54ShYw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] epiphany: set status for CVE-2026-118598 and CVE-2026-118599
Date: Thu, 12 Nov 2026 19:08:05 +0100
Message-ID: <20261112180805.412901-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 18:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250111
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Fixing commits are mentioned in [1] and [2].
These were backported to 51.2 as [3] and [4].

Thes CVEs have following metadata problems in CVE DBs:
* CVE-2026-118598: "lessThan": "*"
* CVE-2026-118599: "defaultStatus": "affected"

[1] https://security-tracker.debian.org/tracker/CVE-2026-118598
[2] https://security-tracker.debian.org/tracker/CVE-2026-118599
[3] https://gitlab.gnome.org/GNOME/epiphany/-/commit/d2dc4a73a3725589daaebde238474f1b476a8306
[4] https://gitlab.gnome.org/GNOME/epiphany/-/commit/22433332f7e4a5e085d506f472705493b76750ce

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-gnome/epiphany/epiphany_51.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/epiphany/epiphany_51.2.bb b/meta/recipes-gnome/epiphany/epiphany_51.2.bb
index 317477bc89..1b79d7a4a5 100644
--- a/meta/recipes-gnome/epiphany/epiphany_51.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_51.2.bb
@@ -44,3 +44,6 @@ RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
 
 # please see webkitgtk recipe for details
 COMPATIBLE_HOST:x86 = "null"
+
+CVE_STATUS[CVE-2026-118598] = "fixed-version: Fixed from version 51.2"
+CVE_STATUS[CVE-2026-118599] = "fixed-version: Fixed from version 51.2"
