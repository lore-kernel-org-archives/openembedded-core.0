Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RsHtS-0002Bz-Io
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 18:53:22 +0100
Received: by iaby12 with SMTP id y12so316610iab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:45:28 -0800 (PST)
Received: by 10.42.131.129 with SMTP id z1mr4962443ics.53.1328031927528;
	Tue, 31 Jan 2012 09:45:27 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id k3sm3697062igq.1.2012.01.31.09.45.25
	(version=SSLv3 cipher=OTHER); Tue, 31 Jan 2012 09:45:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2012 09:45:15 -0800
Message-Id: <1328031918-23871-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v5 0/3] libzypp: support signed repositories
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
X-List-Received-Date: Tue, 31 Jan 2012 17:53:22 -0000

The current libzypp implementation does not work with signed repositories.
This patch series adds recipes for the required packages as well as the
necessary runtime dependencies to libzypp.

Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
a systemd based console image.

Version 5 incorporates all feedback from Koen Kooi, Saul Wold, Khem Raj,
and Anders Darander
 - adds runtime dependencies to existing RDEPENDS_${PN} of libzypp
 - removes duplicate recipe for libassuan
 - moves recipes for gnupg and libksba to recipes-support
 - adds dependency on libgpg-error for libksba
 - cleans up LICENSE field

Steve Sakoman (3):
  libksba: add recipe for 1.2.0
  gnupg: add recipe for 2.0.18
  libzypp: add missing runtime dependences on gzip and gnupg

 meta/recipes-extended/libzypp/libzypp_git.bb  |    4 ++--
 meta/recipes-support/gnupg/gnupg_2.0.18.bb    |   25 +++++++++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.2.0.bb |   12 ++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
 create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb



