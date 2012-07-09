Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SoHbJ-0006KQ-7O
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:18:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2012 10:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175124630"
Received: from unknown (HELO localhost) ([10.255.13.39])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 10:07:10 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, sgw@linux.intel.com
Date: Mon,  9 Jul 2012 12:07:07 -0500
Message-Id: <cover.1341852059.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/3] perf-scripting/perf-tui features, v3
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
X-List-Received-Date: Mon, 09 Jul 2012 17:18:21 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset enables the Perl and Python bindings for perf, as well
as the perf TUI (text-based UI).

These are now turned on by default via a new variable,
PERF_FEATURES_ENABLE, which can be overridden if the default set of
perf features aren't desired (perf-scripting and perf-tui).

Because perf isn't normally enabled except in sdk builds, which
contains most of the additional packages that these features drag
in anyway e.g. Python and Perl, it shouldn't be too bothersome
to unconidtionally turn the perf features on if perf itself is
enabled.  Future work will probably allow these features to be
disabled individually using PACKAGECONFIG for example.

These changes need corresponding changes made to linux-yocto and posted
separately on the yocto and linux-yocto mailing lists.

This patchset depends on the associated kernel changes posted
along with the original patchset:

http://www.mail-archive.com/yocto@yoctoproject.org/msg07279.html
http://www.mail-archive.com/yocto@yoctoproject.org/msg07286.html

Bruce Ashfield submitted a SRCREV update for the 3.4 kernel today
that you'll also need to build this.

I just started testing this, it works so far, but thought
I'd put it out there now in case there were comments before
putting too much effort into that, and possibly giving other
people a chance to try it out.

This patchset has been build-tested on the following machines:

qemuarm

The following changes since commit 5051e9837fa698e03d0a7a8a918ee7aa98409ce1:
  Robert P. J. Day (1):
        bitbake: usermanual: Fix missing markup

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-scripting-v3
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-scripting-v3

Tom Zanussi (3):
  perf: add perf.inc
  perf: add perf-scripting feature
  perf: add perf-tui feature

 meta/recipes-kernel/perf/perf.inc    |   22 ++++++++++++++++++++++
 meta/recipes-kernel/perf/perf_3.4.bb |   18 +++++++++++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/perf/perf.inc



