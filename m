Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rrv1S-0002CD-I9
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:28:06 +0100
Received: by pbaa13 with SMTP id a13so3300196pba.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 09:20:13 -0800 (PST)
Received: by 10.68.190.4 with SMTP id gm4mr42754078pbc.95.1327943675143;
	Mon, 30 Jan 2012 09:14:35 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id z5sm48521910pbc.5.2012.01.30.09.14.32
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 09:14:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 09:14:22 -0800
Message-Id: <1327943665-16402-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v3 0/3] *** SUBJECT HERE ***
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
X-List-Received-Date: Mon, 30 Jan 2012 17:28:06 -0000

The current zypper implementation does not work with signed repositories.
This patch series adds recipes for the required packages as well as the
necessary runtime dependencies to zypper.

Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
a systemd based console image.

Version 3 incorporates feedback from Koen Kooi and Saul Wold
 - adds runtime dependencies to existing RDEPENDS_${PN}
 - removes duplicate recipe for libassuan
 - moves recipes for gnupg and libksba to recipes-support
 
Steve Sakoman (3):
  libksba: add recipe for 1.2.0
  gnupg: add recipe for 2.0.18
  zypper: add missing runtime dependences on gzip and gnupg

 meta/recipes-extended/zypper/zypper_git.bb    |    4 ++--
 meta/recipes-support/gnupg/gnupg_2.0.18.bb    |   24 ++++++++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.2.0.bb |   10 ++++++++++
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
 create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb



