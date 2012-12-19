Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TlRHM-0001Ue-R9
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 22:34:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2012 13:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,318,1355126400"; d="scan'208";a="267277200"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2012 13:19:31 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 15:19:36 -0600
Message-Id: <cover.1355951741.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] cmake build fix
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
X-List-Received-Date: Wed, 19 Dec 2012 21:34:19 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

After a fresh pull from master, I got the following build error:

ERROR: Fetcher failure for URL: 'http://www.cmake.org/files/v2.8/cmake-2.8.10.2\
.tar.gz'. No checksum specified for /home/trz/work/sandbox/build/downloads/cmak\
e-2.8.10.2.tar.gz, please add at least one to the recipe:
SRC_URI[md5sum] = "097278785da7182ec0aea8769d06860c"
SRC_URI[sha256sum] = "ce524fb39da06ee6d47534bbcec6e0b50422e18b62abc4781a4ba72ea\
2910eb1"
ERROR: Function failed: Fetcher failure for URL: 'http://www.cmake.org/files/v2\
.8/cmake-2.8.10.2.tar.gz'. No checksum specified for /home/trz/work/sandbox/bui\
ld/downloads/cmake-2.8.10.2.tar.gz, please add at least one to the recipe:
SRC_URI[md5sum] = "097278785da7182ec0aea8769d06860c"
SRC_URI[sha256sum] = "ce524fb39da06ee6d47534bbcec6e0b50422e18b62abc4781a4ba72ea\
2910eb1"
ERROR: Logfile of failure stored in: /usr/local/dev/yocto/nitin-test/build/tmp/\
work/x86_64-linux/cmake-native/2.8.10.2-r0.0/temp/log.do_fetch.11057
ERROR: Task 4772 (/usr/local/dev/yocto/nitin-test/meta/recipes-devtools/cmake/c\
make-native_2.8.10.2.bb, do_fetch) failed with exit code '1'

This patch fixes that.

The following changes since commit 80bc9a0643f31029558eda8cbc5365b7583f1a29:

  icu: reduce what's needed for cross tools (2012-12-19 17:55:08 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib.git tzanussi/cmake-checksum-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/cmake-checksum-fix

Tom Zanussi (1):
  cmake-native: add checksums

 .../cmake/cmake-native_2.8.10.2.bb                 |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.4.1



