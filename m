Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rrt9x-0003dd-3S
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 16:28:45 +0100
Received: by dakf10 with SMTP id f10so3028700dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 07:20:51 -0800 (PST)
Received: by 10.68.83.105 with SMTP id p9mr42859127pby.92.1327936851407;
	Mon, 30 Jan 2012 07:20:51 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id w4sm40437462pbf.4.2012.01.30.07.20.48
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 07:20:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 07:20:36 -0800
Message-Id: <1327936840-13937-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH 0/4] zypper: support signed repositories
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
X-List-Received-Date: Mon, 30 Jan 2012 15:28:46 -0000

The current zypper implementation does not work with signed repositories.
This patch series adds recipes for the required packages as well as the
necessary runtime dependencies to zypper.

Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
a systemd based console image.

Steve Sakoman (4):
  libassuan: add recipe for 2.0.3
  libksba: add recipe for 1.2.0
  gnupg: add recipe for 2.0.18
  zypper: add missing runtime dependences on gzip and gnupg

 meta/recipes-extended/gnupg/gnupg_2.0.18.bb    |   24 ++++++++++++++++++++++++
 meta/recipes-extended/gnupg/libassuan_2.0.3.bb |   11 +++++++++++
 meta/recipes-extended/gnupg/libksba_1.2.0.bb   |   10 ++++++++++
 meta/recipes-extended/zypper/zypper_git.bb     |    4 +++-
 4 files changed, 48 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/gnupg/gnupg_2.0.18.bb
 create mode 100644 meta/recipes-extended/gnupg/libassuan_2.0.3.bb
 create mode 100644 meta/recipes-extended/gnupg/libksba_1.2.0.bb



