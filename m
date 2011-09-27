Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R8e42-0006Ex-9u
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 22:15:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Sep 2011 13:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="57213708"
Received: from unknown (HELO [10.255.14.185]) ([10.255.14.185])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2011 13:10:07 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Zhai, Edwin" <edwin.zhai@intel.com>
In-Reply-To: <cover.1317084972.git.edwin.zhai@intel.com>
References: <cover.1317084972.git.edwin.zhai@intel.com>
Date: Tue, 27 Sep 2011 15:08:49 -0500
Message-ID: <1317154129.16543.237.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] [RFC] enable Pegasus touch screen
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
X-List-Received-Date: Tue, 27 Sep 2011 20:15:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-26 at 18:03 -0700, Zhai, Edwin wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Tom,
> These changes, based on meta-intel/tzanussi/pegasus, are needed to enable
> eGalax touch screen on Pegasus. Could you pls. help to review?
> 

Hi Edwin,

First, I don't think this is the correct list for meta-intel stuff,
please use the yocto list.

Anyway, the first two patches look ok to me, but the 3rd seems to be a
combination of what it says in the title, enabling touch screen kernel
config, and updating the BSP to work with the current kernel recipes.
The latter should I think be squashed into the base BSP, which isn't
posted.

> When will you push Pegasus changes into meta-intel/master? We can have a common
> place for people to try pegasus...
> 

The meta-pegasus you pointed to seems to be an old version, basically
the same prototype version I gave you for the demo.  I thought the
current one had been updated to address the comments from the quick
review of Aug 9:

- meta-pegasus - commented-out stuff in pegasus.conf, xorg.conf,
linux-yocto-2.6.37.bbappend, ReleaseNotes are unrelated to the BSP, etc.

Also, it has a blacksand.pdf and has old kernel recipes, etc.

Basically, it needs to be cleaned up a bit before it can be pulled in,
and should be buildable without relying on later patches.

Also, I'm wondering if there's a reason it's using 2.6.37 - we're at 3.0
now, and it would be good if it used that.

Finally, please also add yourself or whoever will be the maintainer
going forward to meta-intel/MAINTAINERS...

Thanks,

Tom

> Thanks,
> Edwin
> 
> The following changes since commit 59dc67f6e64a836fc01fa91a1200e76264bb954d:
> 
>   meta-pegasus: new layer for Pegasus (N455) systems (2011-06-15 23:27:47 -0500)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib gzhai/pegasus
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/pegasus
> 
> Zhai Edwin (3):
>   eGalax touchscreen offical xorg driver
>   Config xorg.conf with eGalax touchscreen input driver
>   Enabled kernel module for eGalax touch screen.
> 
>  meta-pegasus/conf/machine/pegasus.conf             |    2 +-
>  .../xf86-input-egalax/88eGalaxCalibrate.sh         |    5 ++
>  .../xorg-driver/xf86-input-egalax_3.06.5605.bb     |   49 ++++++++++++++++++++
>  .../xserver-xf86-config/pegasus/xorg.conf          |   10 ++++
>  .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    2 +
>  .../recipes-kernel/linux/linux-yocto/pegasus.cfg   |    4 ++
>  .../linux/linux-yocto_2.6.37.bbappend              |   12 +++++
>  7 files changed, 83 insertions(+), 1 deletions(-)
>  create mode 100755 meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax/88eGalaxCalibrate.sh
>  create mode 100644 meta-pegasus/recipes-graphics/xorg-driver/xf86-input-egalax_3.06.5605.bb
>  create mode 100644 meta-pegasus/recipes-kernel/linux/linux-yocto/pegasus.cfg
>  create mode 100644 meta-pegasus/recipes-kernel/linux/linux-yocto_2.6.37.bbappend
> 




