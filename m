Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 878B17713C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:27:01 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id e63so1048982ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=JWQc95GaxWNZP+foZgwHaUNfO2sGDnqblTEgrDjIS78=;
	b=swaProWAvGWK9YtTOOGoVTuKn0JXIEcVpuJdVch/7HAUANKGZIN79xlMCbYSHNgmEO
	QRxikow0OoS6r5X1ORczwIGbvFDrjKXH2E0mowohLWRYOCVoQe4BOtvqx1D4QWnZ9WJL
	LM77uFKp3P9EHwIcyL+BEDWUD8g8rkXJDHWnUoZkM4c8aSlfhyfp5ljWyvaKu79WJ6Lq
	EBlTLO3m62Q7YfczRWHX1Iv2k9EtofqRKN/IYojoISvG5Fak4ofdwmm7LjkZmqJ31Z7x
	OOUeR+M82ZUpNerBN2bxID72IyDaD8xX7D+nwn/ttK2a4x0Gp6X1abnd9/5/Hr7YvGUO
	T27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=JWQc95GaxWNZP+foZgwHaUNfO2sGDnqblTEgrDjIS78=;
	b=CNzprFajHowNM4TB5qCxZiX7YEHoPJLNNc+v7robS7iUegQxsSaOfrq9RdNWM00/td
	QZFYuuURp7njFCHO83GBs+xs9tx7iOElKbHYeaIDQDtxKB3kA1GK8v0mqP+oNdZglDZP
	Ck1wMbAziBP8ScdpJSclMVv8Jt0Y7Cj7wFwexhBA11DI3wooPEIQI8gBCXd7O1NJhzf2
	fmNQqIA0Usfygnkzw3t1g5BWseNaHcR2HmtYW9lHhwZLOwdXoC7YCsmatId+TjVi4i2m
	kJbeRRIWwgPZD5U53HJugXkBWKOsp86+xEA1nMvIS519a8Rzj4nX3JKCpppi7NtU3jgE
	J3tw==
X-Gm-Message-State: AEkoousmIEVl0JRbI1M/QgElNN97YZFguEiNOwp9HRTB9m9znT8HkYnNn4Aj2qnJqb8rXA==
X-Received: by 10.36.127.75 with SMTP id r72mr16040627itc.55.1471285621613;
	Mon, 15 Aug 2016 11:27:01 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94])
	by smtp.gmail.com with ESMTPSA id 65sm7908858itl.16.2016.08.15.11.27.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 11:27:01 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2016 14:26:54 -0400
Message-Id: <cover.1471281772.git.bruce@zedd.org>
X-Mailer: git-send-email 2.5.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 15 Aug 2016 18:27:03 -0000

Hi all,

Here's a collection of changes that have been queued over the past couple of
weeks.

I'm working on some additional -stable updates, as well as a new release
kernel for the fall release, but I wanted to get this queue cleared first.

The patches:

  linux-yocto/4.1: netfilter: x_tables: fix stable backport
  linux-yocto/4.1: bump to v4.1.29
  linux-yocto/4.1: config updates
  linux-yocto/4.4: -rt update patch meta-data to remove ()

Are typical -stable, and bug fix changes. I haven't seen any issues in my
local builds, so all looks well there. These can be taken in isolation from
the kernel tools changes that follow:

  kernel-yocto: streamline patch, configuration and audit phases
  yocto-bsp/yocto-kernel: update to work with the latest kern-tools

Are the important part of this series, and a significant contribution to the
fall release. I've been testing these for some time, and we've run the
kernel lab and yocto-bsp scripts against the tools. We haven't found a
regression yet, but I'm sure there are some lurking. These definitely need
cycles on the autobuilders.

From the patch itself:

[
   We've been running with a set of kern-tools that were designed to work
   with build systems that knew nothing about git, trees, commits, etc.

   As such, there's been a set of shims/wrappers in place to work with
   within bitbake/oe-core. These were the *me scripts: createme, updateme,
   patchme and configme.

   With this commit, we strip that legacy code and use the tools directly.
   This means less complexity, fewer corner cases .. and no surprises
   when the tools are arunning. As another benefit, the tools consume
   much less time during a typical build and have no noticeable impact
   on the overall build time.

   Existing .scc files, features, and processing are not impacted as
   these tools are compatible with existing feature descriptions and
   kerne configuration fragments.

   The audit of kernel configuration fragments is now detached
   from the linux-yocto build structure and process. This means that
   they can eventually be tweaked to offer kernel audit to any type of
   kernel build and configuration process.

   Additionally, the kernel symbol audit phase can now resolve symbol
   dependencies and offer guidance when a symbol is missing:

      WARNING: linux-yocto-4.4.15+gitAUTOINC+b030d96c7b_f5e2c49d58-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:

      ---------- CONFIG_BT_6LOWPAN -----------------
      Config: CONFIG_BT_6LOWPAN
      From: /home/bruce/poky/build/tmp/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/standard/features/bluetooth/bluetooth.cfg
      Requested value:  CONFIG_BT_6LOWPAN=y
      Actual value:

      Config 'BT_6LOWPAN' has the following conditionals:
        BT_LE && 6LOWPAN (value: "n")
      Dependency values are:
        BT_LE [y] 6LOWPAN [n]
]

This is the 2nd step in making fragments, and their audit available to
any type of kernel build. They are also a significant simplification and
speed up of the processing. There's no branching, no conditioning of the
tree, etc.

The shortlogs of the tools changes are:

   4b5de90 kconf_check: use symbol_why to provide diagnostics on missing options
   92f8053 symbol_why: introduce symbol_why
   779d675 Makefile: add Kconfiglib to install list
   39c00bc tools: import Kconfiglib
   68531c9 kgit: add repo clean function
   b73353f kgit-scc: update tree gen to new kern-tools
   09a1a6c kgit: detect if sourced
   2bad46f kgit-meta: adapt to new scc/spp meta series generation
   8332818 kconf_check: standalone operation and command line options
   d7e06ed spp/scc: streamline patch and config series generation
   f67df1c merge_config: update to mainline variant
   a67df68 kgit-s2q: log last patch applied

The overall diffstat for the tools changes are:

    b/Makefile                  |   26 -
    b/tools/kconf_check         |  923 ++++++++++++++++--------------------
    b/tools/kgit                |  320 ++++++++----
    b/tools/kgit-init           |  301 ++---------
    b/tools/kgit-meta           | 1119 +++-----------------------------------------
    b/tools/kgit-s2q            |   29 -
    b/tools/kgit-scc            |  238 ++-------
    b/tools/merge_config.sh     |  102 ++--
    b/tools/scc                 |  290 +++++++----
    b/tools/scc-cmds/auto.cmd   |   30 +
    b/tools/scc-cmds/branch.cmd |   38 +
    b/tools/scc-cmds/define.cmd |    9
    b/tools/scc-cmds/kconf.cmd  |   55 ++
    b/tools/scc-cmds/mark.cmd   |    4
    b/tools/scc-cmds/patch.cmd  |   32 +
    b/tools/spp                 |  653 +++++++++++++++++--------
    b/tools/symbol_why.py       |  236 +++++++++
    tools/configme              |  397 ---------------
    tools/createme              |  235 ---------
    tools/patchme               |  132 -----
    tools/pre_config            |  226 --------
    tools/updateme              |  621 ------------------------
    22 files changed, 2001 insertions(+), 4015 deletions(-)

We end up at a 2:1 code reduction, and the raw tools are directly used, wins
on both counts.

Note: there are still warnings in the kernel meta-data, they are being worked
on, but I've left them in place so a few people can see the new kernel audit
information :)

Cheers,

Bruce


The following changes since commit 6b66e9317f4ec3a69f98f29836aafa35b52f3fc7:

  Allow for simultaneous do_rootfs tasks with rpm (2016-08-12 15:25:22 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/4.1: netfilter: x_tables: fix stable backport
  linux-yocto/4.1: bump to v4.1.29
  linux-yocto/4.1: config updates
  linux-yocto/4.4: -rt update patch meta-data to remove ()
  kernel-yocto: streamline patch, configuration and audit phases
  yocto-bsp/yocto-kernel: update to work with the latest kern-tools

 meta/classes/kernel-yocto.bbclass                  | 143 ++++++++-------------
 .../kern-tools/kern-tools-native_git.bb            |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |   2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |  20 +--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |   2 +-
 scripts/lib/bsp/kernel.py                          |   1 -
 .../linux/files/machine-standard.scc               |   2 +-
 .../linux/files/machine-standard.scc               |   2 +-
 .../linux/files/machine-standard.scc               |   2 +-
 .../linux/files/machine-standard.scc               |   2 +-
 .../linux/files/machine-standard.scc               |   2 +-
 .../linux/files/machine-standard.scc               |  10 +-
 .../linux/files/machine-standard.scc               |   2 +-
 16 files changed, 85 insertions(+), 123 deletions(-)

-- 
2.5.0


