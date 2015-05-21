Return-Path: <ismo.puustinen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8D4607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 08:21:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2015 01:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,467,1427785200"; d="scan'208";a="729483443"
Received: from ipuustin-mobl.ger.corp.intel.com (HELO
	ipuustin-mobl.fi.intel.com) ([10.237.68.151])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2015 01:21:58 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 11:21:29 +0300
Message-Id: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 00/11] Fix quotes in several recipes
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
X-List-Received-Date: Thu, 21 May 2015 08:22:01 -0000

I recently wrote my own parser for BitBake recipes and ran it over the recipes
in openembedded-core. I found a number of bugs in my parser, but I also saw some
"patterns" in recipes which I thought were against the spec but still allowed by
the BitBake parser.

This patch series fixes quotes in variable values. Specifically, it disallows
having unescaped double quotes inside a variable value that is surrounded by
double quotes. This patch series in not critical in that sense that everything
should work still the same way it used to. However, if the BitBake parser is
ever made stricter or the BitBake User Manual written to have less ambiguity on
the subject of the .bb file format, having these fixed will help in transition.

Of course, it may be that I'm mistaken and the quoting around variable values is
not even supposed to have a meaning in the variable definition, in which case
the whole patch set can be disregarded.

Ismo Puustinen (11):
  flac: do not mix single and double quotes.
  libxml-sax-perl: escape quotes and fix whitespace.
  grub: do not mix single and double quotes.
  foomatic-filters: escape quotes inside variable values.
  libfile-checktree-perl: escape quotes inside variable values.
  packagegroup-core-boot: do not mix single and double quotes.
  libclass-isa-perl: escape quotes inside variable values.
  packagegroup-core-tools-testapps: do not mix single and double quotes.
  grub: do not mix single and double quotes.
  gconf: do not mix single and double quotes.
  packagegroup-core-lsb: do not mix single and double quotes.

 meta/recipes-bsp/grub/grub_2.00.bb                             |  4 ++--
 meta/recipes-bsp/grub/grub_git.bb                              |  4 ++--
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb      |  4 ++--
 .../packagegroups/packagegroup-core-tools-testapps.bb          |  6 +++---
 meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb      |  2 +-
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb   |  2 +-
 meta/recipes-extended/perl/libxml-sax-perl_0.99.bb             |  4 ++--
 meta/recipes-gnome/gnome/gconf_3.2.6.bb                        |  2 +-
 meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb               |  2 +-
 meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb          |  6 +++---
 meta/recipes-multimedia/flac/flac_1.3.1.bb                     | 10 +++++-----
 11 files changed, 23 insertions(+), 23 deletions(-)

-- 
2.1.0


