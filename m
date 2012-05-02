Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SPh0H-00019D-MW
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:22:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 May 2012 14:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161131193"
Received: from unknown (HELO helios.localnet) ([10.252.120.39])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2012 14:12:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 02 May 2012 22:12:23 +0100
Message-ID: <3279315.scVOi5yrOL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-19-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <e8d5425f8ca14a0c0b7378a9202fd4c72761ea12.1335991900.git.raj.khem@gmail.com>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
	<e8d5425f8ca14a0c0b7378a9202fd4c72761ea12.1335991900.git.raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] Enable PARALLEL_MAKE for testing
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
X-List-Received-Date: Wed, 02 May 2012 21:22:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 02 May 2012 13:54:00 Khem Raj wrote:
> From: Yuri Bushmelev <jay4mail@gmail.com>
> 
> Signed-off-by: Yuri Bushmelev <jay4mail@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-bsp/pciutils/pciutils_3.1.9.bb        |    1 -
>  meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 -
>  meta/recipes-connectivity/iproute2/iproute2.inc    |    1 -
>  .../nfs-utils/nfs-utils_1.2.3.bb                   |    1 -
>  meta/recipes-core/eggdbus/eggdbus_0.6.bb           |    1 -
>  meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    1 -
>  meta/recipes-extended/groff/groff_1.20.1.bb        |    1 -
>  meta/recipes-extended/mailx/mailx_12.5.bb          |    1 -
>  .../net-tools/net-tools_1.60-23.bb                 |    1 -
>  meta/recipes-extended/sat-solver/sat-solver_git.bb |    1 -
>  .../fontconfig/fontconfig_2.8.0.bb                 |    1 -
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    1 -
>  meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb  |    1 -
>  meta/recipes-graphics/xcb/xcb-util.inc             |    1 -
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 -
>  meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    1 -
>  meta/recipes-support/icu/icu-3.6.inc               |    1 -
>  meta/recipes-support/libpcre/libpcre_8.21.bb       |    1 -
>  18 files changed, 0 insertions(+), 18 deletions(-)

Rather than "for testing" it would be good to know that these fixes have been 
tested and proven before going in. I know quite a bit of testing with re-
enabling PARALLEL_MAKE was done by you guys earlier - can you confirm this is 
the tested working set? If so can you make sure the commit message reflects 
this?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


