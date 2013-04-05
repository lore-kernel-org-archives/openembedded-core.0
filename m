Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UOAPh-0002uK-Qs
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 19:27:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2013 10:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,415,1363158000"; d="scan'208";a="314232965"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.17])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2013 10:09:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 10:09:30 -0700
Message-Id: <1365181772-18644-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 0/2] Fix issue with newer glibc crypt() function
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
X-List-Received-Date: Fri, 05 Apr 2013 17:27:20 -0000
X-List-Received-Date: Fri, 05 Apr 2013 17:27:20 -0000

The 2.17 version of glibc's crypt() was changed to returning NULL if
it got an invalid seed, this broke tinylogin and shadow in different
ways.

Thanks to the Slackware team for "just in time patches", they found it 
first in shadow around March 28th!

I do not believe that these will introduce any security concerns, please 
review with a careful eye.

Sau!


Saul Wold (2):
  tinylogin: fix segfault from crypt()
  shadow: add patch to fix crypt: Invalid Argument

 .../tinylogin/tinylogin-1.4/glibc_crypt_fix.patch  | 23 ++++++++
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |  4 +-
 .../files/slackware_fix_for_glib-2.17_crypt.patch  | 63 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  1 +
 4 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/glibc_crypt_fix.patch
 create mode 100644 meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch

-- 
1.8.0.2



