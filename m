Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE6171A70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0IDsUui020797
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 18 Jan 2017 05:54:30 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:30 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:15 -0500
Message-ID: <cover.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/14] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:32 -0000
Content-Type: text/plain

People have been asking about 4.9 and related changes, so I'm resending
my consolidated queue to make the patches visible and available for
merging.

These are 4.9, 4.9-rt, libc-headers, -stable updates, meta data tweaks
and fixes/enhancements for the kern tools.

Cheers,

Bruce

The following changes since commit 63f899a950daf1018999455bafa7a2be8b22f164:

  bitbake: toaster: bin/toaster whitelist TOASTER_DIR (2017-01-17 13:18:47 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (14):
  linux-libc-headers: introduce 4.9 headers
  kernel: introduce linux-yocto v4.9 recipes
  linux-yocto-rt/4.9: add -rt specific patches
  kernel-yocto: tiny features aka Link Time Optimization
  linux-yocto/4.4/4.8/4.9: netfilter: iptables: enable NAT tables
  kernel-yocto: firewire and audio configuration updates
  linux-yocto/4.9: -stable update to v4.9.2
  linux-yocto/4.8: -stable update to v4.8.17
  linux-yocto/4.4: update to v4.4.41
  linux-yocto/4.1: update to v4.1.37
  kern-tools: scc: Fix process_file error check
  linux-yocto/4.8: update to -rt10
  kern-tools: kconf_check: flag CONFIG options with invalid spaces
  linux-yocto/4.9: merge 4.9.3 and ethernet config changes

 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 ...bc-headers_4.8.bb => linux-libc-headers_4.9.bb} |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 38 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 25 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 +++++-----
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 +++++-----
 meta/recipes-kernel/linux/linux-yocto_4.8.bb       | 20 +++++-----
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 44 ++++++++++++++++++++++
 15 files changed, 159 insertions(+), 54 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.8.bb => linux-libc-headers_4.9.bb} (64%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.9.bb

-- 
2.5.0


