Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 013916D588
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 18:15:48 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>) id 1Vh1SF-0001Wu-9D
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Nov 2013 19:15:50 +0100
Message-ID: <1384452946.17320.85.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2013 18:15:46 +0000
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details. Content preview:  ADOBE_MIRROR,
	HANDHELDS_CVS and E_SVN were broken links and
	not used by any recipe in oe-core. FREEDESKTOP_CVS is no longer useful
	because all the source code that matters is in git;
	no recipe in oe-core still uses the CVS repository. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] bitbake.conf: Remove obsolete/unused MIRROR cruft
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
X-List-Received-Date: Thu, 14 Nov 2013 18:15:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

ADOBE_MIRROR, HANDHELDS_CVS and E_SVN were broken links and not used by
any recipe in oe-core.

FREEDESKTOP_CVS is no longer useful because all the source code that 
matters is in git; no recipe in oe-core still uses the CVS repository.

E_MIRROR, FREEBSD_MIRROR, FREESMARTPHONE_GIT still point to valid-seeming
locations but there are no recipes in oe-core that use them.  Any layers
which need these variables can define them for themselves.

GPE_SVN, GPE_EXTRA_SVN, GPEPHONE_MIRROR and GPEPHONE_SVN are not used by
any recipe in oe-core and the corresponding projects seem to be mostly
dead upstream.  Again, any layers which still wish to use these variables
can define them locally.

All the above are just wasting space in bitbake's datastore and would be
better deleted.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/conf/bitbake.conf | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0f6c28e..e6349cc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -560,24 +560,13 @@ BUILD_OPTIMIZATION = "-O2 -pipe"
 # Download locations and utilities.
 ##################################################################
 
-ADOBE_MIRROR = "http://fpdownload.macromedia.com/get/flashplayer/current/"
 APACHE_MIRROR = "http://www.apache.org/dist"
 DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
-E_MIRROR = "http://download.enlightenment.org/releases"
-E_SVN = "svn://svn.enlightenment.org/svn/e"
-FREEBSD_MIRROR = "ftp://ftp.freebsd.org/pub/FreeBSD/"
-FREEDESKTOP_CVS = "cvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs"
-FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://git.gnome.org"
 GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
 GNU_MIRROR = "ftp://ftp.gnu.org/gnu"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
-GPE_EXTRA_SVN = "svn://projects.linuxtogo.org/svn/gpe/trunk/extra;module=${PN}"
-GPE_SVN = "svn://projects.linuxtogo.org/svn/gpe/trunk/base;module=${PN}"
-GPEPHONE_MIRROR = "http://gpephone.linuxtogo.org/download/gpephone"
-GPEPHONE_SVN = "svn://projects.linuxtogo.org/svn/gpephone/trunk/source;module=${PN}"
-HANDHELDS_CVS = "cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs"
 KERNELORG_MIRROR = "http://kernel.org/pub"
 SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
 XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
-- 
1.8.4.rc3




