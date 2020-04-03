Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.4833.1585943378863198684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 12:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:40890 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jKSJt-00HQIT-5I
	for openembedded-core@lists.openembedded.org; Fri, 03 Apr 2020 15:49:37 -0400
Date: Fri, 3 Apr 2020 15:49:31 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cdrtools-native: remove use of REALPV in versioning
Message-ID: <alpine.LFD.2.21.2004031546020.97934@localhost.localdomain>
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

There appears to be no need for the use of REALPV in the recipe for
cdrtools-native as the downloaded tarball has the official version in
it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  unless i'm misreading something, there is no need to over-complicate
the recipe for cdrtools-native given the current versioning.

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 1c602e7ce7..b568bb39f6 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"

 SRC_URI = " \
-	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${REALPV}.tar.bz2 \
+	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${PV}.tar.bz2 \
 	file://0001-Don-t-set-uid-gid-during-install.patch \
 	"
 UPSTREAM_VERSION_UNKNOWN = "1"
@@ -23,11 +23,6 @@ export ac_cv_prog_CC = "${CC}"

 inherit native

-PV = "3.01a31+really3.01"
-REALPV = "3.01"
-
-S = "${WORKDIR}/${BPN}-${REALPV}"
-
 do_install() {
 	make install GMAKE_NOWARN=true INS_BASE=${prefix} DESTDIR=${D}
 }

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
