Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SWe7y-0006Ey-NL
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 03:43:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2012 18:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="146691930"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.17])
	by orsmga002.jf.intel.com with SMTP; 21 May 2012 18:32:59 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Tue, 22 May 2012 09:33:46 +0800
Date: Tue, 22 May 2012 09:33:46 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120522013346.GI1450@edwin-gen>
References: <cover.1337003838.git.edwin.zhai@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1337003838.git.edwin.zhai@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 0/1] qemu: Add option to disable GL acceleration, Edwin, May14, 2012
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
X-List-Received-Date: Tue, 22 May 2012 01:43:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping...

On Mon, May 14, 2012 at 10:00:58PM +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> All,
> This patch add an PACKAGECONFIG in qemu to disable GL acceleration:
> * By default configure try best to enable GL acceleration and fail when missing
>   host dependency(libSDL and libGL).
> * End user can also choose to turn off GL capability, thus remove the host
>   dependence(libSDL&libGL) in building.
> 
> [YOCTO #2407] got fixed.
> 
> Pls. help to review and pull
> 
> 
> The following changes since commit 54f38111868775c85bfe921592d8443a61952c62:
> 
>   pango: Fix modules load failure in multilib environment (2012-05-14 21:50:55 +0800)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib gzhai/fix2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2
> 
> Zhai Edwin (1):
>   qemu: Add an option to remove host sdl/gl checking
> 
>  .../qemu/qemu-0.15.1/opengl-disable-option.patch   |  172 ++++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu.inc                |   23 +---
>  meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    1 +
>  3 files changed, 176 insertions(+), 20 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/opengl-disable-option.patch
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
best rgds,
edwin


