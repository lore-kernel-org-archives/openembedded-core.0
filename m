Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CDF68784C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:00:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 10 Nov 2017 04:00:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,374,1505804400"; 
   d="scan'208";a="52040"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 10 Nov 2017 04:00:13 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 8D0A55803E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:00:12 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 14:00:21 +0200
Message-Id: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/7] package upgrades
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
X-List-Received-Date: Fri, 10 Nov 2017 12:00:13 -0000


Maxin B. John (7):
  ofono: upgrade to 1.21
  harfbuzz: upgrade to 1.6.3
  quota: upgrade to 4.04
  screen: upgrade to 4.6.2
  libproxy: upgrade to 0.4.15
  sqlite3: upgrade to 3.21.0
  libsoup-2.4: upgrade to 2.60.2

 meta/recipes-connectivity/ofono/ofono_1.20.bb      |   8 --
 meta/recipes-connectivity/ofono/ofono_1.21.bb      |   8 ++
 ...dentaly-override-commandline-passed-CFLAG.patch |  33 -----
 .../quota/0001-Fix-build-with-disabled-ldap.patch  |  93 -------------
 .../0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch  |  83 -----------
 ...ing-on-systems-that-do-not-have-rpc-heade.patch | 153 ---------------------
 ...-rpc.rquotad-when-disable-rpc-was-request.patch |  62 ---------
 ...0004-Fix-warnings-due-to-missing-stdlib.h.patch |  46 -------
 .../quota/quota/replace_getrpcbynumber_r.patch     |  40 ++++--
 .../quota/{quota_4.03.bb => quota_4.04.bb}         |  10 +-
 .../screen/0001-fix-for-multijob-build.patch       |  58 --------
 .../screen/0002-comm.h-now-depends-on-term.h.patch |  33 -----
 .../screen/{screen_4.6.1.bb => screen_4.6.2.bb}    |   6 +-
 .../{harfbuzz_1.4.8.bb => harfbuzz_1.6.3.bb}       |   4 +-
 .../{libproxy_0.4.14.bb => libproxy_0.4.15.bb}     |   4 +-
 ...libsoup-2.4_2.58.2.bb => libsoup-2.4_2.60.2.bb} |   4 +-
 .../sqlite/files/sqlite3-fix-CVE-2017-13685.patch  |  57 --------
 .../{sqlite3_3.20.0.bb => sqlite3_3.21.0.bb}       |   5 +-
 18 files changed, 46 insertions(+), 661 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.20.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.21.bb
 delete mode 100644 meta/recipes-extended/quota/quota/0001-Do-not-accidentaly-override-commandline-passed-CFLAG.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0001-Fix-build-with-disabled-ldap.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch
 delete mode 100644 meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch
 rename meta/recipes-extended/quota/{quota_4.03.bb => quota_4.04.bb} (73%)
 delete mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
 delete mode 100644 meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
 rename meta/recipes-extended/screen/{screen_4.6.1.bb => screen_4.6.2.bb} (88%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.4.8.bb => harfbuzz_1.6.3.bb} (88%)
 rename meta/recipes-support/libproxy/{libproxy_0.4.14.bb => libproxy_0.4.15.bb} (89%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.58.2.bb => libsoup-2.4_2.60.2.bb} (89%)
 delete mode 100644 meta/recipes-support/sqlite/files/sqlite3-fix-CVE-2017-13685.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.20.0.bb => sqlite3_3.21.0.bb} (52%)

-- 
2.4.0


