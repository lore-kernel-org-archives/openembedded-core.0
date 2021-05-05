Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.6024.1620212639574346278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 04:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:39366 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1leFJs-0002HH-Be
	for openembedded-core@lists.openembedded.org; Wed, 05 May 2021 07:03:58 -0400
Date: Wed, 5 May 2021 07:03:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bitbake.conf: sort MIRROR list, add missing SAMBA_MIRROR
Message-ID: <73ffca9d-2f19-b7e6-8293-54eea2dfbb4a@crashcourse.ca>
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


As is the pattern with all lists, put the list of MIRRORs in
alphabetical order, and add an entry for SAMBA_MIRROR as it appears in
the samba recipe from the meta-networking layer.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a0e0c77fe6..4fa47d88e5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -635,6 +635,7 @@ BBLAYERS_FETCH_DIR ??= "${COREBASE}"
 ##################################################################

 APACHE_MIRROR = "https://archive.apache.org/dist"
+CPAN_MIRROR = "https://search.cpan.org/CPAN"
 DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://gitlab.gnome.org/GNOME"
@@ -643,12 +644,12 @@ GNU_MIRROR = "https://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 KERNELORG_MIRROR = "https://cdn.kernel.org/pub"
+SAMBA_MIRROR = "http://samba.org/samba/ftp"
+SAVANNAH_GNU_MIRROR = "https://download.savannah.gnu.org/releases"
+SAVANNAH_NONGNU_MIRROR = "https://download.savannah.nongnu.org/releases"
 SOURCEFORGE_MIRROR = "https://downloads.sourceforge.net"
 XLIBS_MIRROR = "https://xlibs.freedesktop.org/release"
 XORG_MIRROR = "https://www.x.org/releases/"
-SAVANNAH_GNU_MIRROR = "https://download.savannah.gnu.org/releases"
-SAVANNAH_NONGNU_MIRROR = "https://download.savannah.nongnu.org/releases"
-CPAN_MIRROR = "https://search.cpan.org/CPAN"

 SRC_URI[vardepsexclude] += "\
     APACHE_MIRROR \
@@ -661,6 +662,7 @@ SRC_URI[vardepsexclude] += "\
     GNUPG_MIRROR \
     GPE_MIRROR \
     KERNELORG_MIRROR \
+    SAMBA_MIRROR \
     SAVANNAH_GNU_MIRROR \
     SAVANNAH_NONGNU_MIRROR \
     SOURCEFORGE_MIRROR \

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
