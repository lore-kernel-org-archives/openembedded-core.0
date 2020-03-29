Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.37566.1585518050638039812
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 14:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:57416 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jIffl-00D5LP-3U
	for openembedded-core@lists.openembedded.org; Sun, 29 Mar 2020 17:40:49 -0400
Date: Sun, 29 Mar 2020 17:40:47 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] append_: adjust some appends to guarantee leading space
Message-ID: <alpine.LFD.2.21.2003291739390.16161@localhost.localdomain>
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

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.178.bb b/meta/recipes-devtools/elfutils/elfutils_0.178.bb
index 8f5deb2c62..c500ae3c19 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.178.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.178.bb
@@ -56,7 +56,7 @@ PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"

 RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"

-EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
+EXTRA_OECONF_append_class-target = " --disable-tests-rpath"

 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"

diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtools/file/file_5.38.bb
index 99c75988c2..b8f09107e8 100644
--- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -23,8 +23,8 @@ EXTRA_OECONF += "--disable-libseccomp"
 ALTERNATIVE_${PN} = "file"
 ALTERNATIVE_LINK_NAME[file] = "${bindir}/file"

-EXTRA_OEMAKE_append_class-target = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
-EXTRA_OEMAKE_append_class-nativesdk = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
+EXTRA_OEMAKE_append_class-target = " -e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
+EXTRA_OEMAKE_append_class-nativesdk = " -e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"

 FILES_${PN} += "${datadir}/misc/*.mgc"


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
