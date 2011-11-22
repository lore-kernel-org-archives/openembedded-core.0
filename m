Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RSxBR-00044E-2p
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 21:43:13 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 12:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,555,1315206000"; d="scan'208";a="40252910"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2011 12:36:40 -0800
Message-ID: <4ECC07D8.2070104@linux.intel.com>
Date: Tue, 22 Nov 2011 12:36:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321972428.git.anders@chargestorm.se>
In-Reply-To: <cover.1321972428.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH v2 0/1] busybox: update to 1.19.3
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
X-List-Received-Date: Tue, 22 Nov 2011 20:43:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2011 06:34 AM, Anders Darander wrote:
> This updates busybox to the latest stable, 1.19.3.
>
> Among other things, there should be rudimentary support in syslogd for
> systemd, by enabling CONFIG_FEATURE_SYSTEMD.
>
How much size does this add to busybox by having it enabled by default?
Is it possible to conditional add a config fragment if systemd is 
enabled ad the DISTRO/IMAGE_FEATURE level?

More info is required.

> It has been tested and verified on qemux86 and on our local arm-based system.
>
> However, the patch busybox-udhcpc-no_deconfig.patch has been modified to
> apply, but hasn't really been tested. As we're currently mostly running static
> configurations, we've only verified that udhcpc works to the extent that we
> get the network up and running, not how it behaves during dhcp renewal.
> Thus I'm starting this as an RFC.
>
> Changes:
> v2: * Checked the new defconfig (removed settings implying CFLAGS and
>      ARCH). The new defconfig should be as close as possible to the old one,
>      with the exception of some new utils/options.
Can you clearly enumerate what new utils and options and what their size 
impact on the busybox image is.

Thanks
	Sau!

>      * Added one patch from upstream, to safeguard the use of CBAUD
>      termios_init().
>      * The other upstream patch from http://busybox.net/downloads/fixes-1.19.3/
>      do only affect comments, thus I'm not adding it.
>
> The following changes since commit dd2fdf9f5a3923c37e4ea2e46e347bb0657c2f5b:
>
>    gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a (2011-11-21 16:55:01 +0000)
>
> are available in the git repository at:
>    git://github.com/darander/oe-core busybox-systemd
>    https://github.com/darander/oe-core/tree/busybox-systemd
>
> Anders Darander (1):
>    busybox: update to 1.19.3
>
>   .../B921600.patch                                  |    0
>   .../busybox-1.19.3/busybox-1.19.3-getty.patch      |   17 ++
>   .../busybox-appletlib-dependency.patch             |    0
>   .../busybox-udhcpc-no_deconfig.patch               |   66 +++--
>   .../{busybox-1.18.5 =>  busybox-1.19.3}/defconfig   |  265 +++++++++++++-------
>   .../get_header_tar.patch                           |    0
>   .../run-parts.in.usr-bin.patch                     |   16 +-
>   .../udhcpc-fix-nfsroot.patch                       |    0
>   .../udhcpscript.patch                              |    0
>   .../{busybox_1.18.5.bb =>  busybox_1.19.3.bb}       |    7 +-
>   10 files changed, 245 insertions(+), 126 deletions(-)
>   rename meta/recipes-core/busybox/{busybox-1.18.5 =>  busybox-1.19.3}/B921600.patch (100%)
>   create mode 100644 meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
>   rename meta/recipes-core/busybox/{busybox-1.18.5 =>  busybox-1.19.3}/busybox-appletlib-dependency.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.5 =>  busybox-1.19.3}/busybox-udhcpc-no_deconfig.patch (62%)
>   rename meta/recipes-core/busybox/{busybox-1.18.5 =>  busybox-1.19.3}/defconfig (89%)
>   rename meta/recipes-core/busybox/{busybox-1.18.5 =>  busybox-1.19.3}/get_header_tar.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.5 =>  busybox-1.19.3}/run-parts.in.usr-bin.patch (64%)
>   rename meta/recipes-core/busybox/{busybox-1.18.5 =>  busybox-1.19.3}/udhcpc-fix-nfsroot.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.5 =>  busybox-1.19.3}/udhcpscript.patch (100%)
>   rename meta/recipes-core/busybox/{busybox_1.18.5.bb =>  busybox_1.19.3.bb} (82%)
>


