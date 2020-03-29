Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.25382.1585481993155901133
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 04:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:45696 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jIWIB-00BOld-J7
	for openembedded-core@lists.openembedded.org; Sun, 29 Mar 2020 07:39:52 -0400
Date: Sun, 29 Mar 2020 07:39:49 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] yocto-check-layer: simple grammatical fixes
Message-ID: <alpine.LFD.2.21.2003290738550.9099@localhost.localdomain>
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


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 010830f842..ca6c79bc8d 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -84,7 +84,7 @@ def main():
         logger.setLevel(logging.ERROR)

     if not 'BUILDDIR' in os.environ:
-        logger.error("You must source the environment before run this script.")
+        logger.error("You must source the environment before running this script.")
         logger.error("$ source oe-init-build-env")
         return 1
     builddir = os.environ['BUILDDIR']
@@ -92,7 +92,7 @@ def main():

     layers = detect_layers(args.layers, args.no_auto)
     if not layers:
-        logger.error("Fail to detect layers")
+        logger.error("Failed to detect layers")
         return 1
     if args.additional_layers:
         additional_layers = detect_layers(args.additional_layers, args.no_auto)
@@ -108,7 +108,7 @@ def main():
     for layer in layers:
         if layer['type'] == LayerType.ERROR_BSP_DISTRO:
             logger.error("%s: Can't be DISTRO and BSP type at the same time."\
-                     " The conf/distro and conf/machine folders was found."\
+                     " Both conf/distro and conf/machine folders were found."\
                      % layer['name'])
             layers.remove(layer)
         elif layer['type'] == LayerType.ERROR_NO_LAYER_CONF:

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
