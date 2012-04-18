Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SKXIg-0005MJ-Vq
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 18:00:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Apr 2012 08:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="131254633"
Received: from unknown (HELO envy.home) ([10.255.12.120])
	by orsmga001.jf.intel.com with ESMTP; 18 Apr 2012 08:50:42 -0700
Message-ID: <4F8EE2B1.9050806@linux.intel.com>
Date: Wed, 18 Apr 2012 08:50:09 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334763599.git.dvhart@linux.intel.com>
	<5840692e28971d911b9c95eb85c2aff0eb028e3c.1334763599.git.dvhart@linux.intel.com>
In-Reply-To: <5840692e28971d911b9c95eb85c2aff0eb028e3c.1334763599.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.4
Subject: Re: [PATCH 1/1] gthumb: Disable parallel make for gthumb install
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
X-List-Received-Date: Wed, 18 Apr 2012 16:00:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/18/2012 08:40 AM, Darren Hart wrote:
> With PARALLEL_MAKE set to 14, I frequently see the gthumb do_install
> task hang. Make is spinning at 100% CPU and the build makes no
> more progress.
> 
> The following work-around proposed by Richard Purdie allows progress
> to be made.

Ooops, forgot to add:

Fixes [YOCTO #2319]

> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Joshua Lock <josh@linux.intel.com>
> CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-gnome/gthumb/gthumb_2.12.4.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
> index 5c87dc1..5821dc4 100644
> --- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
> +++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
> @@ -8,6 +8,8 @@ PR = "r2"
>  
>  EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
>  
> +PARALLEL_MAKEINST=""
> +
>  inherit gnome pkgconfig
>  
>  FILES_${PN} += "${datadir}/icons"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


