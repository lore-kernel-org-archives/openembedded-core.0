Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UHSV2-0004e5-3P
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 06:20:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Mar 2013 22:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,862,1355126400"; d="scan'208";a="303649134"
Received: from unknown (HELO [10.252.120.182]) ([10.252.120.182])
	by orsmga002.jf.intel.com with ESMTP; 17 Mar 2013 22:03:54 -0700
Message-ID: <5146A039.5030507@intel.com>
Date: Mon, 18 Mar 2013 07:03:53 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1362558952-4483-1-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1362558952-4483-1-git-send-email-laurentiu.palcu@intel.com>
Subject: Re: [PATCH v2 0/1] Rename mesa-dri recipe to mesa
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
X-List-Received-Date: Mon, 18 Mar 2013 05:20:53 -0000
X-List-Received-Date: Mon, 18 Mar 2013 05:20:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping!

On 03/06/2013 10:35 AM, Laurentiu Palcu wrote:
> Changes in v2:
>  * squashed the commits into a single one to be easily bisectable;
>  * removed FILESEXTRAPATHS references;
>  * removed a file that had to go to poky ML;
> 
> Thanks,
> Laurentiu
> 
> Hi all,
> 
> This patchset will rename the "mesa-dri" recipe to "mesa" and will replace
> all occurences to mesa-dri in recipes/configs.
> 
> The changes and the upgrade path were tested on qemux86 and on an atom-pc
> ideapad s10-3t. No issues observed.
> 
> For more info, as to why this was needed, go here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3385
> 
> Thanks,
> Laurentiu
> 
> 
> Laurentiu Palcu (1):
>   mesa: rename mesa-dri recipe to just mesa
> 
>  meta/conf/distro/include/default-providers.inc     |    6 +++---
>  meta/conf/machine/include/ia32-base.inc            |    4 ++--
>  meta/conf/machine/include/qemu.inc                 |    8 ++++----
>  meta/conf/machine/qemux86-64.conf                  |    8 ++++----
>  meta/conf/machine/qemux86.conf                     |    8 ++++----
>  meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    2 +-
>  meta/recipes-graphics/mesa/mesa-common.inc         |    5 +----
>  meta/recipes-graphics/mesa/mesa-git.inc            |    1 -
>  .../mesa/{mesa-dri.inc => mesa.inc}                |   11 ++++++++---
>  .../mesa/{mesa-dri_9.0.2.bb => mesa_9.0.2.bb}      |    2 +-
>  .../mesa/{mesa-dri_git.bb => mesa_git.bb}          |    5 ++---
>  meta/recipes-graphics/wayland/weston_1.0.3.bb      |    6 +++---
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
>  .../arch/i386/conf/machine/{{=machine}}.conf       |    2 +-
>  .../arch/qemu/conf/machine/{{=machine}}.conf       |    8 ++++----
>  15 files changed, 39 insertions(+), 39 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-dri.inc => mesa.inc} (65%)
>  rename meta/recipes-graphics/mesa/{mesa-dri_9.0.2.bb => mesa_9.0.2.bb} (75%)
>  rename meta/recipes-graphics/mesa/{mesa-dri_git.bb => mesa_git.bb} (28%)
> 


