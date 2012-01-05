Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RildT-0000YJ-7h for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 12:37:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05BU9BX003892
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 11:30:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31936-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2012 11:30:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05BU2mv003877
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 11:30:03 GMT
Message-ID: <1325763002.20759.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jan 2012 11:30:02 +0000
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/28] Build Fixes and Updates
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
X-List-Received-Date: Thu, 05 Jan 2012 11:37:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 22:30 -0800, Saul Wold wrote:
> Richard,
> 
> This is a set of changes that have been built and booted for 
> sato. This address the failure we have seen on the Autobuilder,
> please check the master_under_test build currenly building.
> 
> We have another kernel update from Bruce, with the sanity checks
> from Scott G. along with other change from the community.
> The matchbox changes make sense based on a better explaination 
> from Edwin.
> 
> Please review overall, but I am positive about this change set.
> 
> Sau!
> 
> The following changes since commit f309769d10cb3d8b72b8c7c4f7f418dcb8422c61:
> 
>   valgrind: Fix for automake update (2012-01-04 16:03:59 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (3):
>   kern-tools: import flexible branching support
>   linux-yocto: bump kernel version to v3.0.14
>   linux-yocto: use src_patches for out of tree kernel feature support

These look related to the failures on the autobuilder so I didn't take
them.

> Christopher Larson (1):
>   opkg-utils: use /usr/bin/env python
> 
> Derek Buitenhuis (2):
>   binutils-cross-canadian: Allow ld-is-gold

I took these.

>   binutils: Allow plugins

I'm sceptical about this. Does this really need to be a distro feature?

> Gary Thomas (1):
>   xserver-kdrive: work around issues with -Werror=address

I've taken this.

> Joshua Lock (2):
>   alsa-state: add alsa-state from oe classic
>   task-base: add alsa-state to task-base-alsa

I've held off this at this time, likely will take it next time around.

> Otavio Salvador (3):
>   udev: use 'echo' instead of 'echo -n' in init script
>   udev: split utilities onto udev-utils
>   udev: remove commented code from init script (no code changes)
> 
> Phil Blundell (1):
>   python-native: correct prefix handling for oe-core sysroot layout
> 
> Saul Wold (6):
>   image_types: Fix rootfs size calcuation
>   glib-2.0: ensure dtrace is diabled for all distro options and fix
>     packaging
>   libxp: fix cast error
>   Patch Upstream-Status Update

I took these.

>   util-linux: Update patch for non-GPLv3
>   gnutls: remove gettext patch for non-GPLv3

These are one line commit descriptions which tell me very little. Please
improve the patch descriptions.

> Scott Garman (7):
>   ncurses: move libraries to base_libdir
>   libcap: move library to base_libdir
>   util-linux: move libraries to base_libdir
>   e2fsprogs: move libraries to base_libdir
>   libusb1: move libraries to base_libdir
>   libusb-compat: move libraries to base_libdir
>   insane.bbclass: add QA tests for unsafe references to exec_prefix
> 
> Zhai Edwin (1):
>   matchbox-wm: Remove x-session-manager handling

I took these.

> Zhenhua Luo (1):
>   linux-dtb: add multi-dtb build support and keep dtb in deploy cache
>     package

This looks like it should be done in do_deploy and doesn't fix the real
problem just adding some races in.

Cheers,

Richard





