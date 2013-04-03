Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UNSfn-0003MH-E9
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 20:44:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2013 11:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="313146075"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.159])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2013 11:27:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 19:27:23 +0100
Message-Id: <cover.1365013369.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Bring in overlayed recipe from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 18:44:39 -0000

This is one of the last remaining recipes from meta-oe that we need to
bring over to OE-Core. I realise this is late in the cycle, but the
impact should be minimal and would help reduce the overlap of meta-oe
which is a beneficial thing in itself. I have tested building and
running a Sato image with it applied and there was no apparent change
in the icons or indicated by buildhistory for sato-icon-theme which
seems to be the only item we have that depends upon
icon-naming-utils(-native).



The following change since commit ca36be708e54c0c86535bc8512295c76c48f6cf5:

  classes/sstate: avoid traceback when no files have been staged (2013-04-03 17:01:09 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/meta-oe-cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/meta-oe-cleanup

Paul Eggleton (1):
  icon-naming-utils: import version 0.8.90 from meta-oe

 ...tils-native_0.8.7.bb => icon-naming-utils_0.8.90.bb} |   15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/icon-naming-utils/{icon-naming-utils-native_0.8.7.bb => icon-naming-utils_0.8.90.bb} (58%)

-- 
1.7.10.4



