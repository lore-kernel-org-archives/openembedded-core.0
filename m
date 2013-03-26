Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UKVPi-0002Vr-72
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 16:04:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2QEkkIs015601
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Mar 2013 07:46:46 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 26 Mar 2013 07:46:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Mar 2013 07:46:31 -0700
Message-ID: <cover.1364308617.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: M6 -stable updates and changes
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
X-List-Received-Date: Tue, 26 Mar 2013 15:04:46 -0000
X-List-Received-Date: Tue, 26 Mar 2013 15:04:46 -0000
Content-Type: text/plain

Richard,

Here's a consolidated pull request that I've been working on last
week, and more intensively since tglx dropped the 3.8-rt release
late last week.

This series is a collection of kernel fixes:

  [linux-yocto/3.8: fix perf host contamination]

Usability tweaks:

  [linux-yocto/3.8: allow kernel feature _appends to be overriden]

korg -stable updates:

  [linux/yocto-3.4: update to v3.8.4]
  [linux-yocto/3.4: import v3.4.36 -stable fixes]

And the introduction of 3.8-rt:

  [linux-yocto/3.8: introduce v3.8.4-rt1]
  [linux-yocto/3.8: qemuarm boot fix]

Due to the timing of this request, I've made sure to do extra build and
boot testing on the changes. 

I found a minor issue with the 3.8.4 -stable update on MIPS, which I've fixed
and boot tested. And 3.8.4-rt didn't initially boot on qemuarm, I've also
fixed it and boot tested sato under the -rt kernel. Darren and I both talked
about the -rt release, and there's value in making sure that the base -rt
release for 3.8 is part of the main 1.4 release, and it has no impact on
existing boards, builds or recipes .. so it is completely safe and isolated
from that point of view.

I've built all architectures at this point, and booted at least 
core-image-minimal, with sato builds running as I type up this pull request.

cc: Darren Hart <dvhart@linux.intel.com>
cc: Tom Zanussi <tom.zanussi@intel.com>

Cheers,

Bruce

The following changes since commit f36926a264190e6202830e8520b41b30ae77ea43:

  docbook-utils-native: Unbreak the build after source and build dir split (2013-03-25 20:51:19 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/3.8: allow kernel feature _appends to be overriden
  linux/yocto-3.4: update to v3.8.4
  linux-yocto/3.8: introduce v3.8.4-rt1
  kern-tools: initialization and meta branch fixes
  linux-yocto/3.4: import v3.4.36 -stable fixes
  linux-yocto/3.8: fix perf host contamination
  linux-yocto/3.8: qemuarm boot fix

 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |   29 ++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    6 ++--
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 +++++------
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |   23 ++++++++--------
 6 files changed, 56 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb

-- 
1.7.10.4



