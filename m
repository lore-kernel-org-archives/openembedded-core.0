Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RLeFP-0004IV-Ju
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 18:05:08 +0100
Received: from localhost (c-67-170-181-205.hsd1.or.comcast.net
	[67.170.181.205])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id DC1C630465
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 12:58:52 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 09:58:41 -0700
Message-Id: <cover.1320252973.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: DC1C630465.937D0
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] distro tracking updates for some recipes
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
X-List-Received-Date: Wed, 02 Nov 2011 17:05:08 -0000

Hello,

Now that the date formatting is normalized in the distro tracking file,
here are updates for the recipes that I recently updated: sudo, mtools,
grep, and openssh.

The following changes since commit 37579d7d74d127c90c1e078d05c5bf4ba0b3f755:

  meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:21 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgarman/distro-tracking
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/distro-tracking

Scott Garman (1):
  distro_tracking_fields: updates for sudo, mtools, grep, and openssh

 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
 1 files changed, 16 insertions(+), 16 deletions(-)

-- 
1.7.5.4



