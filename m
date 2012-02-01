Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rsc6z-0007tm-23
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 16:28:41 +0100
Received: by ghbf19 with SMTP id f19so580237ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 07:20:44 -0800 (PST)
Received: by 10.50.214.38 with SMTP id nx6mr7438886igc.19.1328109643904;
	Wed, 01 Feb 2012 07:20:43 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id xu6sm15087657igb.7.2012.02.01.07.20.42
	(version=SSLv3 cipher=OTHER); Wed, 01 Feb 2012 07:20:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 07:20:29 -0800
Message-Id: <1328109632-3300-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v6 0/3] libzypp: support signed repositories
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
X-List-Received-Date: Wed, 01 Feb 2012 15:28:41 -0000

The current libzypp implementation does not work with signed repositories.
This patch series adds recipes for the required packages as well as the
necessary runtime dependencies to libzypp.

Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
a systemd based console image.

Changes from version 5 include feedback from Paul Menzel:
 - add (initial recipe) to patch subject for libksba and gnupg
 - add HOMEPAGE to libksba and gnupg
 - use ${PV}/${P} in gnupg SRC_URI
 - fix description/punctuation for libksba and gnupg

Steve Sakoman (3):
  libksba: add 1.2.0 (initial recipe)
  gnupg: add 2.0.18 (initial recipe)
  libzypp: add missing runtime dependences on gzip and gnupg

 meta/recipes-extended/libzypp/libzypp_git.bb  |    4 ++--
 meta/recipes-support/gnupg/gnupg_2.0.18.bb    |   24 ++++++++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.2.0.bb |   13 +++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
 create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb



