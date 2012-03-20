Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SA81e-0003Fd-PE
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 23:59:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2012 15:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119753958"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2012 15:50:40 -0700
Message-ID: <4F6909C0.8060900@linux.intel.com>
Date: Tue, 20 Mar 2012 15:50:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332248282-5226-1-git-send-email-lauri.hintsala@bluegiga.com>
In-Reply-To: <1332248282-5226-1-git-send-email-lauri.hintsala@bluegiga.com>
Subject: Re: [PATCH 1/1] xserver-kdrive: compile xserver without dtrace support
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
X-List-Received-Date: Tue, 20 Mar 2012 22:59:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/20/2012 05:58 AM, Lauri Hintsala wrote:
> Cross compiling of xserver-kdrive fails if dtrace is enabled. Configure
> script enables dtrace automatically if dtrace binary exists. xserver-kdrive
> compiling was failed if systemtap package was builded beforehand because
> systemtap provides dtrace binary.
>
> Signed-off-by: Lauri Hintsala<lauri.hintsala@bluegiga.com>
> ---
> This issue has been existed also with xserver-xorg. It was already fixed
> to xserver-xorg by commit 01c1a0f7.
> ---
>   .../xorg-xserver/xserver-kdrive.inc                |    1 +
>   .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    2 +-
>   2 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
> index 52b63ed..58dee27 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
> @@ -102,6 +102,7 @@ EXTRA_OECONF = "--enable-composite --enable-kdrive \
>                   --disable-xkb --disable-xnest --disable-xvfb \
>                   --disable-xevie --disable-xprint --disable-xtrap \
>                   --disable-dmx \
> +                --without-dtrace \
>                   --with-default-font-path=built-ins \
>                   --enable-tslib --enable-xcalibrate \
>                   ac_cv_file__usr_share_X11_sgml_defs_ent=no"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> index 3b3a004..360a0f3 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> @@ -7,7 +7,7 @@ RDEPENDS_${PN} += "xkeyboard-config"
>   EXTRA_OECONF += "--disable-glx"
>
>   PE = "1"
> -PR = "r28"
> +PR = "r29"
>
>   SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
>   	file://extra-kmodes.patch \

Merged into OE-Core

Thanks
	Sau!


