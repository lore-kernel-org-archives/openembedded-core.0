Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Tdo8x-0003iV-A4
	for Openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 21:22:04 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2012 12:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,180,1355126400"; d="scan'208";a="225994926"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2012 12:07:42 -0800
Message-ID: <1354133261.28084.102.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: nitin.a.kamble@intel.com
Date: Wed, 28 Nov 2012 14:07:41 -0600
In-Reply-To: <cover.1354126748.git.nitin.a.kamble@intel.com>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: meta-intel@yoctoproject.org, darren.hart@intel.com,
	Openembedded-core@lists.openembedded.org
Subject: Re: [meta-intel patch 0/3] Fixes for rescent X breakages in meta-intel layer
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
X-List-Received-Date: Wed, 28 Nov 2012 20:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-28 at 10:21 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This commits are for meta-intel layer. And Ross'es patch tries to achieve the same 
> from the oecore layer.
> 

Hi Nitin,

So does this conflict with Ross's patch, which seems simpler...

Tom

> Thanks,
> Nitin
> 
> 
> The following changes since commit 154156a4db56f7b33fb1765cf6b87e683d027af9:
> 
>   emgd-driver-bin: add further needed soft links (2012-11-26 18:02:11 -0600)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/meta-intel-contrib nitin/misc
>   http://git.yoctoproject.org/cgit.cgi/meta-intel-contrib/log/?h=nitin/misc
> 
> Nitin A Kamble (3):
>   xserver-xorg-1.9.3: fix packaging issues
>   xserver-psb: fix packaging issues
>   xserver-xorg-video-psb: fix packaging issues
> 
>  .../xorg-xserver/xserver-xorg-1.9.3.inc            |    2 +-
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  160 ++++++++++++++++++++
>  .../xorg-xserver/xserver-xorg_1.9.3.bb             |    2 +-
>  conf/machine/include/meta-intel.inc                |   10 +-
>  .../xorg-xserver/xserver-psb-1.7.99.2.inc          |    2 +-
>  .../xorg-xserver/xserver-psb_1.7.99.2.bb           |    2 +-
>  .../xserver-xorg-video-psb_0.32.1.bb               |    8 +-
>  7 files changed, 180 insertions(+), 6 deletions(-)
>  create mode 100644 common/recipes-graphics/xorg-xserver/xserver-xorg.inc
> 




