Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S8a0s-0000YK-Fo
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:28:22 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id D0A002FF5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 12:19:30 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 09:19:38 -0700
Message-Id: <cover.1331914572.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: D0A002FF5F.69E12
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/2] e2fsprogs and manual recipe checks updates
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
X-List-Received-Date: Fri, 16 Mar 2012 16:28:22 -0000

Hello,

This pull request includes an upgrade for our e2fsprogs recipe, and
updates for all of my recipes which require manual checks. 

e2fsprogs was build tested successfully on all 5 of our qemu
architectures, and I did a visual comparison of the image and
package output between this and the previous version to check
for unusual discrepancies.

Scott

The following changes since commit 9950163c91412eb58c3475354cc7f87a7be33c2b:

  python-imaging: bring in fixes from meta-oe (2012-03-16 10:56:31 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades3-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades3-oe

Scott Garman (2):
  e2fsprogs: upgrade to 1.42.1
  distro_tracking: updates for upgraded recipes and manual checks

 .../conf/distro/include/distro_tracking_fields.inc |   26 ++++++++++----------
 .../acinclude.m4                                   |    0
 .../fallocate.patch                                |    4 +-
 .../mkdir.patch                                    |    1 +
 .../remove.ldconfig.call.patch                     |   11 ++++++--
 .../{e2fsprogs_1.42.bb => e2fsprogs_1.42.1.bb}     |    6 ++--
 6 files changed, 27 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 => e2fsprogs-1.42.1}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 => e2fsprogs-1.42.1}/fallocate.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 => e2fsprogs-1.42.1}/mkdir.patch (99%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 => e2fsprogs-1.42.1}/remove.ldconfig.call.patch (76%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.bb => e2fsprogs_1.42.1.bb} (93%)

-- 
1.7.5.4



