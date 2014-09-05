Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4BC713BB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 20:06:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2014 13:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="382099468"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.5])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2014 13:01:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Sep 2014 13:06:24 -0700
Message-Id: <cover.1409947480.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] Some final package Updates for 1.7
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
X-List-Received-Date: Fri, 05 Sep 2014 20:06:31 -0000

Richard,

Here are some of the package updates that I had pending as we discussed.
There is one more pending (nspr), which has an autotools issue I am working.

Thanks
	Sau!

The following changes since commit e72aac2ae9e5fce1715fa04b7e94034fd06892d9:

  alsa-lib: libasound should runtime depends on alsa-conf (2014-09-03 11:30:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (4):
  vala: Update to 0.24.0
  findutils: Upgrade to 4.5.14
  libcap: Upgrade to 2.24
  nss: Upgrade to 3.17

 meta/recipes-devtools/vala/vala.inc                |   3 +-
 ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch |   0
 meta/recipes-devtools/vala/vala_0.16.0.bb          |   8 -
 meta/recipes-devtools/vala/vala_0.24.0.bb          |   6 +
 .../findutils/findutils-4.4.2/01-27017.patch       | 781 ------------------
 .../findutils/findutils-4.4.2/02-28824.patch       | 294 -------
 .../findutils/findutils-4.4.2/03-28872.patch       |  58 --
 .../findutils-4.4.2/findutils_fix_doc.patch        |  84 --
 .../findutils_fix_for_automake-1.12.patch          |  22 -
 .../findutils-4.4.2/findutils_fix_for_x32.patch    |  40 -
 meta/recipes-extended/findutils/findutils.inc      |   2 +-
 .../{findutils_4.4.2.bb => findutils_4.5.14.bb}    |  16 +-
 meta/recipes-support/libcap/libcap.inc             |  10 +-
 .../libcap/libcap/fix-CAP_LAST_CAP.patch           |  39 -
 meta/recipes-support/libcap/libcap_2.22.bb         |   6 -
 meta/recipes-support/libcap/libcap_2.24.bb         |   4 +
 .../nss/files/nss-3.15.1-fix-CVE-2013-1739.patch   |  81 --
 .../nss/files/nss-3.15.1-fix-CVE-2013-1741.patch   |  92 ---
 .../nss/files/nss-3.15.1-fix-CVE-2013-5605.patch   |  18 -
 .../nss/files/nss-CVE-2013-1740.patch              | 916 ---------------------
 .../nss/files/nss-CVE-2013-5606.patch              |  48 --
 .../nss/files/nss-CVE-2014-1492.patch              |  68 --
 .../nss/files/nss-CVE-2014-1544.patch              |  41 -
 meta/recipes-support/nss/nss.inc                   |   9 +-
 .../nss-fix-incorrect-shebang-of-perl.patch        |   0
 .../nss-fix-support-cross-compiling.patch          |   0
 .../nss-no-rpath-for-cross-compiling.patch         |   0
 meta/recipes-support/nss/{files => nss}/nss.pc.in  |   0
 .../recipes-support/nss/{files => nss}/signlibs.sh |   0
 meta/recipes-support/nss/nss_3.15.1.bb             |   9 -
 meta/recipes-support/nss/nss_3.17.bb               |   8 +
 31 files changed, 28 insertions(+), 2635 deletions(-)
 rename meta/recipes-devtools/vala/{vala-0.16.0 => vala}/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch (100%)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.16.0.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.24.0.bb
 delete mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/01-27017.patch
 delete mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/02-28824.patch
 delete mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/03-28872.patch
 delete mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch
 delete mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch
 rename meta/recipes-extended/findutils/{findutils_4.4.2.bb => findutils_4.5.14.bb} (48%)
 delete mode 100644 meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch
 delete mode 100644 meta/recipes-support/libcap/libcap_2.22.bb
 create mode 100644 meta/recipes-support/libcap/libcap_2.24.bb
 delete mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1739.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-1740.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-5606.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1492.patch
 delete mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1544.patch
 rename meta/recipes-support/nss/{files => nss}/nss-fix-incorrect-shebang-of-perl.patch (100%)
 rename meta/recipes-support/nss/{files => nss}/nss-fix-support-cross-compiling.patch (100%)
 rename meta/recipes-support/nss/{files => nss}/nss-no-rpath-for-cross-compiling.patch (100%)
 rename meta/recipes-support/nss/{files => nss}/nss.pc.in (100%)
 rename meta/recipes-support/nss/{files => nss}/signlibs.sh (100%)
 delete mode 100644 meta/recipes-support/nss/nss_3.15.1.bb
 create mode 100644 meta/recipes-support/nss/nss_3.17.bb

-- 
1.8.3.1


