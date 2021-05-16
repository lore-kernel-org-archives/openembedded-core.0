Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.9015.1621189020900205485
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 11:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:57610 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1liLJy-0001DN-KW
	for openembedded-core@lists.openembedded.org; Sun, 16 May 2021 14:16:59 -0400
Date: Sun, 16 May 2021 14:16:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bitbake.conf: alphabetize contents of ASSUME_PROVIDED
Message-ID: <1ed655b8-f6b3-bb9d-6ac9-53fefb9f52bd@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Alphabetical order is always good.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4fa47d88e5..f451ba6a47 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -173,25 +173,25 @@ DATETIME = "${DATE}${TIME}"
 # python-native should be here but python relies on building
 # its own in staging
 ASSUME_PROVIDED = "\
+    bash-native \
     bzip2-native \
     chrpath-native \
+    diffstat-native \
     file-native \
     findutils-native \
     gawk-native \
     git-native \
     grep-native \
-    diffstat-native \
-    patch-native \
-    libgcc-native \
     hostperl-runtime-native \
     hostpython-runtime-native \
+    libgcc-native \
+    patch-native \
+    sed-native \
     tar-native \
-    virtual/libintl-native \
-    virtual/libiconv-native \
-    virtual/crypt-native \
     texinfo-native \
-    bash-native \
-    sed-native \
+    virtual/crypt-native \
+    virtual/libiconv-native \
+    virtual/libintl-native \
     wget-native \
     "
 # gzip-native should be listed above?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
