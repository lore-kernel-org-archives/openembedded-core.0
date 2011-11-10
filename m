Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROYhk-0000Zj-2t
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 18:46:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Nov 2011 09:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="73426950"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by orsmga002.jf.intel.com with ESMTP; 10 Nov 2011 09:40:05 -0800
Message-ID: <4EBC0C75.3040500@linux.intel.com>
Date: Thu, 10 Nov 2011 09:40:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320860288.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320860288.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2][oe-core 00/10] Merge more stuff from meta-oe
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
X-List-Received-Date: Thu, 10 Nov 2011 17:46:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2011 09:39 AM, Martin Jansa wrote:
> v2: 3 more libsdl patches based on sgw review to cleanup libsdl dir and use PACKAGECONFIG
>
> The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:
>
>    python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2
>
> Martin Jansa (10):
>    kbd: import from meta-oe
>    kbd: add RREPLACES/RCONFLICTS/RPROVIDES for upgradeable path from
>      console-tools
>    task-core-boot, keymaps: add another VIRTUAL-RUNTIME to allow
>      distributions to use different set of initscripts or no initscripts
>      at all
>    keymaps: depend on kbd instead of console-tools
>    task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and
>      graphical_init_manager

Merged the kbd and keymaps changes to OE-Core

>    libsdl: drop unused files
>    libsdl: rename files dir to libsdl-1.2.14 for faster lookup
>    libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes
>      from meta-oe
>    libsdl: enable alsa/opengl based on PACKAGECONFIG and respect
>      DISTRO_FEATURES
>    libsdl: replace tabs with spaces
>
These patches seems to have caused some other issues, so I dropped the 
lot of them.

Not sure what testing you did, but I saw bluez failure due to alsa 
failure.  Also did you build the meta-toolchain-gmae, there were clear 
failures with nothing providing alsa-lib-nativesdk

Thanks
	Sau!



>   meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    9 +++-
>   meta/recipes-core/kbd/kbd_1.15.2.bb                |   24 +++++++++
>   meta/recipes-core/tasks/task-core-boot.bb          |    6 ++-
>   .../libsdl/files/directfb_obsolete_calls.patch     |   35 ------------
>   .../recipes-graphics/libsdl/files/extra-keys.patch |   55 --------------------
>   .../{files =>  libsdl-1.2.14}/configure_tweak.patch |    0
>   meta/recipes-graphics/libsdl/libsdl_1.2.14.bb      |   28 +++++++---
>   meta/recipes-sato/tasks/task-core-x11.bb           |   10 +++-
>   8 files changed, 62 insertions(+), 105 deletions(-)
>   create mode 100644 meta/recipes-core/kbd/kbd_1.15.2.bb
>   delete mode 100644 meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
>   delete mode 100644 meta/recipes-graphics/libsdl/files/extra-keys.patch
>   rename meta/recipes-graphics/libsdl/{files =>  libsdl-1.2.14}/configure_tweak.patch (100%)
>


