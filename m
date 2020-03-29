Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.27022.1585488616046552437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 06:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:46884 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jIY10-00Bfs6-Ko
	for openembedded-core@lists.openembedded.org; Sun, 29 Mar 2020 09:30:15 -0400
Date: Sun, 29 Mar 2020 09:30:12 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] core-image.bbclass: add mention of allow-root-login, stateless-rootfs
Message-ID: <alpine.LFD.2.21.2003290928470.18549@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

Add mention/description of missing IMAGE_FEATURES.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 94f112c397..88ca272145 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -26,6 +26,7 @@
 # - debug-tweaks        - makes an image suitable for development, e.g. allowing passwordless root logins
 #   - empty-root-password
 #   - allow-empty-password
+#   - allow-root-login
 #   - post-install-logging
 # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
 # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
@@ -33,6 +34,7 @@
 # - bash-completion-pkgs - bash-completion packages for recipes using bash-completion bbclass
 # - ptest-pkgs          - ptest packages for all ptest-enabled recipes
 # - read-only-rootfs    - tweaks an image to support read-only rootfs
+# - stateless-rootfs    - systemctl-native not run, image populated by systemd at runtime
 # - splash              - bootup splash screen
 #
 FEATURE_PACKAGES_x11 = "packagegroup-core-x11"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
