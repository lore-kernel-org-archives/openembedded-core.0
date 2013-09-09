Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7126BE4F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 16:16:20 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w62so4524851wes.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 09:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yL6zS+ZHLMEMxQIoUefqeypPotYtuXYrB8JiFlrTOMI=;
	b=O2NG+9N0bDNEx6qfbnNQKnYqUDSk9dfGZLUPAYmndrv5Yq+NS6Uczms4Qzqkq7hTt6
	rpIgD9ygjwRxjBYvg654WTom6eGgwq6QohXWLkxjTnyR5gOOmRwjWy9SlThzojAzFSmv
	sN982NresaT3ziIphtfJddBGZlAue1MJeS5T3lKXrZ4Qh7ug93X66r6U/FvOhhOynBiU
	PEi7LgHLE8l4PA+/EFCeN3Ewmcjks/RcSTMDlDtNG3Czu/7uPvIr5SB5rUZXOrrS3bjY
	1iYNsroDw84xh++LJaWDvzCkIrKDxXBWj4KCBbHdps8boJc4V6LJoVn0Jm1E/zaVqJEU
	UG1Q==
X-Gm-Message-State: ALoCoQlqxD6GZTWaDDinlgqXRLS6SOJyMf8bidMu/e8XNyZCsCV/byGkkXKxwMzF4jnQKQ+3qytx
X-Received: by 10.180.206.180 with SMTP id lp20mr9115329wic.48.1378743381291; 
	Mon, 09 Sep 2013 09:16:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id li9sm6394753wic.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 09:16:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2013 17:16:10 +0100
Message-Id: <1378743370-21987-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] avahi: use correct names in SYSTEMD_SERVICE_* variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Sep 2013 16:16:22 -0000

Don't hard-code full package names in SYSTEMD_SERVICE_*, because in multilib
they'll be changed.

[ YOCTO #4803 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi_0.6.31.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
index 22731f9..5d796a2 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
@@ -3,8 +3,8 @@ require avahi.inc
 inherit systemd
 
 SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
-SYSTEMD_SERVICE_avahi-daemon = "avahi-daemon.service"
-SYSTEMD_SERVICE_avahi-dnsconfd = "avahi-dnsconfd.service"
+SYSTEMD_SERVICE_${PN}-daemon = "avahi-daemon.service"
+SYSTEMD_SERVICE_${PN}-dnsconfd = "avahi-dnsconfd.service"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
-- 
1.7.10.4


