Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAQgW-0006pS-Nb
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 19:55:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 11:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="80064538"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Mar 2012 11:45:05 -0700
Message-ID: <4F6A21B1.3080603@linux.intel.com>
Date: Wed, 21 Mar 2012 11:45:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
Subject: Re: [PATCH 00/60] Package Upgrade
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
X-List-Received-Date: Wed, 21 Mar 2012 18:55:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2012 05:52 PM, Shane Wang wrote:
> Upgrade recipes for M4. Please review.
>
> The following changes since commit bd2d8904181aa67258b6be8a7bbeaf8d12a8dd5a:
>
>    xorg-xserver: Explictly disable dtrace, its not in DEPENDS (2012-03-12 17:45:41 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib shane/m4upgrade
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/m4upgrade
>
> Dongxiao Xu (1):
>    dbus-glib: upgrade to 0.98
>
> Shane Wang (59):
>    distro_tracking: update the recipe info for manual check
>    glib-2.0: upgrade to 2.30.3
>    gdk-pixbuf: upgrade to 2.24.1
>    glproto: update its info in distro tracking
>    libvorbis: upgrade to 1.3.3
>    tremor: upgrade to 18221
>    alsa-lib: upgrade to 1.0.25
>    alsa-utils: upgrade to 1.0.25
>    telepathy-glib: upgrade to 0.17.5
>    telepathy-mission-control: upgrade to 5.11.0
>    ofono: upgrade to 1.5
>    bluez4: upgrade to 4.99
>    bluez-hcidump: upgrade to 2.3
>    gst-plugin-bluetooth: upgrade to 4.99
>    gstreamer: upgrade to 0.10.36
>    gst-plugins-base: upgrade to 0.10.36
>    gst-plugins-good: upgrade to 0.10.31
>    gst-plugins-bad: upgrade to 0.10.23
>    gst-plugins-ugly: upgrade to 0.10.19
>    libpcap: upgrade to 1.2.1
>    busybox: upgrade to 1.19.4
>    curl: upgrade to 7.24.0
>    dropbear: upgrade to 2012.55
>    avahi: upgrade to 0.6.31
>    avahi-ui: upgrade to 0.6.31
>    apr: upgrade to 1.4.6
>    minicom: upgrade to 2.6.1
>    tzdata: upgrade to 2012b
>    util-macros: upgrade to 1.17
>    libxcursor: upgrade to 1.1.13
>    libxinerama: upgrade to 1.1.2
>    libsm: upgrade to 1.2.1
>    libxkbfile: upgrade to 1.0.8
>    libice: upgrade to 1.0.8
>    pixman: upgrade to 0.25.2
>    libxdmcp: upgrade to 1.1.1
>    libXxf86vm: upgrade to 1.1.2
>    libXrender: upgrade to 0.9.7
>    libxpm: upgrade to 3.5.10
>    libXext: upgrade to 1.3.1
>    libXv: upgrade to 1.0.7
>    libxt: upgrade to 1.1.2
>    libXmu: upgrade to 1.1.1
>    libfontenc: upgrade to 1.1.1
>    libxscrnsaver: upgrade to 1.2.2
>    libxau: upgrade to 1.0.7
>    libdmx: upgrade to 1.1.2
>    libxft: upgrade to 2.3.0
>    libxtst: upgrade to 1.2.1
>    libpciaccess: upgrade to 0.13
Had build issues, so not merged

>    libXvMC: upgrade to 1.0.7
>    libxfont: upgrade to 1.4.5
>    libxres: upgrade to 1.0.6
>    inputproto: upgrade to 2.2
>    font-util: upgrade to 1.3.0
>    libxcb: upgrade to 1.8.1
>    libxi: upgrade to 1.4.5
>    distro_tracking: update the info of the recipes upgraded in the round
>    distro_tracking: update those NOT UPDATE REASON

Mostly Merged into OE-Core, you will need to rebase the distro_tracking 
changes.

Thanks
	Sau!


