Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA13781AD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 22:48:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 15:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,303,1493708400"; d="scan'208";a="977113001"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.94.120])
	by orsmga003.jf.intel.com with ESMTP; 05 Jun 2017 15:47:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jun 2017 15:47:55 -0700
Message-Id: <1496702876-32494-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Fix mkelfimage native target
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
X-List-Received-Date: Mon, 05 Jun 2017 22:48:02 -0000

Folks,

I am going to start here, we may need a wider audience, let's see what happens!

Based on the fact that mkelfimage-native has been broken since late year,
I wonder if it's time to retire the ELF Image type?  Clear no one recently 
has use the native, or we would have seen a patch sooner.

I know that the target side was fixed a year a go, so not sure about getting
rid of the recipe completely?

Thoughts?  Flames??

Sau!


Saul Wold (1):
  mkelfimage: Fix broken patch when building native

 .../mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.7.4


