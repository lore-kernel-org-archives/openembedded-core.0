Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E59E16AD4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 15:41:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2013 08:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="364247570"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2013 08:40:56 -0700
Message-ID: <51D44607.5070604@intel.com>
Date: Wed, 03 Jul 2013 18:40:55 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372861799.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 0/4] Allow xuser to shutdown
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
X-List-Received-Date: Wed, 03 Jul 2013 15:41:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Saul spotted an issue with the 4/4 regarding the usage of /sbin directly
in the .desktop file and I'm going to send a v2 to address that.

Laurentiu

On 07/03/2013 05:34 PM, Laurentiu Palcu wrote:
> The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:
> 
>   bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib lpalcu/b4345_shutdown_icon_rootless_x
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4345_shutdown_icon_rootless_x
> 
> Laurentiu Palcu (4):
>   sysvinit: allow users in shutdown group to perform halt/reboot
>   connman: make xuser a member of 'shutdown' group
>   xserver-nodm-init: make xuser a member of 'shutdown' group
>   shutdown-desktop: give entire path in Exec field
> 
>  meta/recipes-connectivity/connman/connman.inc      |    2 +-
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   12 +++++++++---
>  .../x11-common/xserver-nodm-init.bb                |    2 +-
>  .../shutdown-desktop/shutdown-desktop.bb           |    2 +-
>  .../shutdown-desktop/shutdown.desktop              |    4 ++--
>  5 files changed, 14 insertions(+), 8 deletions(-)
> 

