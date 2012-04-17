Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SKGcV-0001wt-3T
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 00:11:31 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3HM21PI020816;
	Tue, 17 Apr 2012 15:02:01 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 17 Apr 2012 18:01:43 -0400
Message-Id: <cover.1334699045.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: denys@ti.com, openembedded-core@lists.openembedded.org,
	yang.shi@windriver.com, saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: -rc4 pull request
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
X-List-Received-Date: Tue, 17 Apr 2012 22:11:31 -0000

Richard/Saul,

Here's a set of 3 fixes that should be considered for -rc4. 
I split things up as much as I could, in the order that they
should be taken.

1/3: linux-yocto: .diff is a valid patch extension

This was reported on IRC today, it was an easy fix to an obvious
problem. I doubled check the old cases and the new .diff case. I've
also confirmed that patch.bbclass and these patch extensions agree.

2/3: linux-yocto/meta: beagleboard: disable CONFIG_PREEMPT

This is the merge of Denys' fix for the beagleboard boot issue
(aka YOCTO 1892]. With this booting on the xM is fixed. I've merged
it into the tree in a named config, so we'll be able to easily identify
it in the future. This same change is in the 3.0 kernel, and staged
in the 3.2 and 3.4 trees as well.

3/3: linux-yocto/meta: remove kernel config audit warnings

This is from Yang Shi @ Wind River. It fixes the issues reporting
on the mailing list during the beta testing. The qemu* BSPs on 3.2
and the hardware references on 3.0 now audit cleanly during the
kernel build. This is one of those items we promise with each release,
and it took a bit longer to acheive this time. 

Yang and I looked at these and only obselete / invalid options are
removed or are tagged as 'hardware' to declare them valid and remove
a warning. The functional changes limited. Yang boot tested the
changes and I've re-run the audit testing here.

(my master branch is a bit out of date, but I had to switch to my
secondary builder for testing, and didn't want to disturb it. There
are no changes in master that would impact this testing).

cc: Yang Shi <yang.shi@windriver.com>
cc: Denys Dmytriyenko <denys@ti.com>

Cheers,

Bruce

The following changes since commit 5326847ef821c382aac26b474ab0e35939c463b7:

  Hob: fixed a little view issue about package selection page (2012-04-16 12:56:25 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: .diff is a valid patch extension
  linux-yocto/meta: beagleboard: disable CONFIG_PREEMPT
  linux-yocto/meta: remove kernel config audit warnings

 meta/classes/kernel-yocto.bbclass                  |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.7.5.4



