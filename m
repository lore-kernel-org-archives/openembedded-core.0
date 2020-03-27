Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.16434.1585327431226769270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 09:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02RGhU8w011927
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 09:43:40 -0700
Received: from mt-manjaro (128.224.21.60) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 27 Mar
 2020 09:43:19 -0700
User-agent: mu4e 1.2.0; emacs 28.0.50
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] avahi: add LICENSE for individual packages
Date: Fri, 27 Mar 2020 12:43:18 -0400
Message-ID: <87v9mp21g9.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.21.60]
Content-Type: text/plain

Fixes [YOCTO #13609]

avahi_0.7.bb defines 9 PACKAGES. However, avahi.inc generically sets
LICENSE to "GPLv2+ & LGPLv2.1+". The library specific
packages should be LGPLv2.1+ only.

Signed-off-by: Matthew Zeng <matthew.zeng@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.7.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
index 2e04d304c7..24523c7f81 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
@@ -10,6 +10,16 @@ inherit update-rc.d systemd useradd

 PACKAGES =+ "libavahi-gobject avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd avahi-utils"

+LICENSE_libavahi-gobject = "LGPLv2.1+"
+LICENSE_avahi-daemon = "LGPLv2.1+"
+LICENSE_libavahi-common = "LGPLv2.1+"
+LICENSE_libavahi-core = "LGPLv2.1+"
+LICENSE_avahi-client = "LGPLv2.1+"
+LICENSE_avahi-dnsconfd = "LGPLv2.1+"
+LICENSE_libavahi-glib = "LGPLv2.1+"
+LICENSE_avahi-autoipd = "LGPLv2.1+"
+LICENSE_avahi-utils = "LGPLv2.1+"
+
 # As avahi doesn't put any files into PN, clear the files list to avoid problems
 # if extra libraries appear.
 FILES_${PN} = ""
--
Mingde (Matthew) Zeng
