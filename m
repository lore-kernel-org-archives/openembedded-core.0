Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RO4UD-0001w9-Ja
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 10:30:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Nov 2011 01:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,483,1315206000"; d="scan'208";a="72180414"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 01:24:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 01:24:02 -0800
Message-Id: <cover.1320830515.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 0/5] Various Fixes
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
X-List-Received-Date: Wed, 09 Nov 2011 09:30:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor clean-up patches.

I added a PR bump to the udev-extraconf recipe for the /dev/md issue.

Sau!


The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:

  python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Matthew McClintock (1):
  Introduce new SERIAL_CONSOLES to add multiple consoles for your
    MACHINE

Paul Menzel (1):
  libarchive: Remove obsolete comment and empty line at the end

Saul Wold (2):
  Distro_tracking: Update Manual Check Date
  udev-extraconf: blacklist /dev/md

Xiaofeng Yan (1):
  local.conf.sample.extended: Fix bug 1674

 .../conf/distro/include/distro_tracking_fields.inc |   94 ++++++++++++--------
 meta/conf/local.conf.sample.extended               |    3 +
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   10 ++
 meta/recipes-core/udev/files/mount.blacklist       |    1 +
 meta/recipes-core/udev/udev-extraconf_0.0.bb       |    2 +-
 .../libarchive/libarchive_2.8.5.bb                 |    3 -
 6 files changed, 72 insertions(+), 41 deletions(-)

-- 
1.7.6.4



