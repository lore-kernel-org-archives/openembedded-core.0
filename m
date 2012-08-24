Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1T4yTS-00025j-EX
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:19:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2012 11:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="184996187"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2012 11:06:01 -0700
Received: from qa.intel.com (qa.rb.intel.com [10.237.100.11])
	by linux.intel.com (Postfix) with ESMTP id 802092C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 11:06:01 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 21:06:11 +0300
Message-Id: <cover.1345831050.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 0/1] grub-efi: fix Nothing PROVIDES 'grub-efi-x86_64-native'
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
X-List-Received-Date: Fri, 24 Aug 2012 18:19:14 -0000

"ERROR: Nothing PROVIDES 'grub-efi-x86_64-native'" is returned when
trying to build meta-intel/meta-cedartrail with DEFAULTTUNE = "core2-64"
Used TRANSLATED_TARGET_ARCH instead of TARGET_ARCH in grub-efi.bbclass

[YOCTO #3013]

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---

Mihai Lindner (1):
  grub-efi: fix Nothing PROVIDES 'grub-efi-x86_64-native' error

 meta/classes/grub-efi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.12



