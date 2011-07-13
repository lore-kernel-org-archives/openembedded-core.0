Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh4oN-0002hR-NJ
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:09:31 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qh4kY-0000nL-KX from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:05:34 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 12:03:55 -0700
Received: from localhost.localdomain ([172.30.80.65]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 Jul 2011 13:05:33 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:05:30 -0700
Message-Id: <cover.1310583292.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 13 Jul 2011 19:05:33.0505 (UTC)
	FILETIME=[D74B0B10:01CC418F]
Subject: [PATCH 0/4] Misc updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 19:09:31 -0000

Hey all,

This is the first of two pull requests.  As part of updating siteinfo.bbclass
I did a world build (qemux86) before and after the changes and diff'd the
config.log files.  That showed two classes of problems, both fixed in this
series.  The first is a checksum mismatch and an invalid SRC_URI.  The second
is some implicit DEPENDS in recipes.

The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
  Saul Wold (1):
        libx11: ensure nativesdk uses correct DEPENDS and XCB flags

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/misc

Tom Rini (4):
  libsamplerate0: Update checksums
  hicolor-icon-theme: Use ${BPN}-${PV} not ${P} to unbreak nativesdk
  groff: Disable x11 support
  libpcre: Add bzip2, zlib and readline to DEPENDS

 meta/recipes-extended/groff/groff_1.20.1.bb        |    1 +
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    2 +-
 .../libsamplerate/libsamplerate0_0.1.7.bb          |    4 ++--
 meta/recipes-support/libpcre/libpcre_8.12.bb       |    1 +
 4 files changed, 5 insertions(+), 3 deletions(-)



