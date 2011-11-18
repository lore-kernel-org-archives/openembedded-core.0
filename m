Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RRQ5J-0004Hd-7O
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 16:10:33 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Nov 2011 07:03:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,533,1315206000"; d="scan'208";a="92477203"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.185])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2011 07:03:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2011 15:03:40 +0000
Message-Id: <cover.1321628513.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC PATCH 0/1] Disable pulseaudio in Qt4
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
X-List-Received-Date: Fri, 18 Nov 2011 15:10:33 -0000

We had a failure on the autobuilder because qt4-x11-free detected
pulseaudio was present but then since it wasn't listed in DEPENDS,
when it came to compile time pulseaudio happened to be unavailable and
the build failed. At first I just added pulseaudio to DEPENDS but then I
considered that it becomes a hard runtime dependency of phonon when it
is enabled and many will not want that. So I'm making this an RFC,
please comment.


The following changes since commit 0a815e889d056f44af1ada623b4b2edcb699693a:

  mesa: fix calling host's commands (2011-11-18 14:37:09 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt4-pulseaudio
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-pulseaudio

Paul Eggleton (1):
  qt4: disable pulseaudio

 meta/recipes-qt/qt4/files/pulseaudio-config.patch |   31 +++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                  |    3 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb         |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb         |    2 +-
 4 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/pulseaudio-config.patch

-- 
1.7.5.4



