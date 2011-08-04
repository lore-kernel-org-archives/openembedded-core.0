Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QozS6-0004Cd-0A
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:03:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2011 07:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,317,1309762800"; d="scan'208";a="37854088"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2011 07:58:49 -0700
Message-ID: <4E3AB3A9.1020908@linux.intel.com>
Date: Thu, 04 Aug 2011 07:58:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311990837.git.ke.yu@intel.com>
In-Reply-To: <cover.1311990837.git.ke.yu@intel.com>
Subject: Re: [PATCH 0/1] replace PN with BPN in SRC_URI and S for multilib
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
X-List-Received-Date: Thu, 04 Aug 2011 15:03:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2011 06:59 PM, Yu Ke wrote:
> in multilibcase, PN has multilib prefix, so it is not
> correct to use PN in SRC_URI and S. instead,  we've
> dedicately pruned multilib prefix in BPN, so BPN is
> the right alternative for PN.
>
> The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:
>    Bruce Ashfield (1):
>          poky.conf: explicitly referenced preferred linux-yocto version
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib kyu3/src-uri
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/src-uri
>
> Yu Ke (1):
>    SRC_URI, S: use BPN instead of PN for multilib case
>
>   .../farsight/farsight2_0.0.9.bb                    |    2 +-
>   .../loudmouth/loudmouth_1.4.0.bb                   |    2 +-
>   .../opensync/libopensync-plugin_0.36.inc           |    2 +-
>   .../telepathy/telepathy-farsight_0.0.7.bb          |    2 +-
>   .../telepathy/telepathy-gabble_0.7.8.bb            |    2 +-
>   .../recipes-connectivity/wbxml/wbxml2_0.9.2.bb     |    2 +-
>   .../recipes-gnome/gcalctool/gcalctool_5.7.32.bb    |    2 +-
>   .../recipes-gnome/gcalctool/gcalctool_5.8.17.bb    |    2 +-
>   .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |    2 +-
>   meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb         |    2 +-
>   meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb        |    2 +-
>   .../matchbox-themes-extra_git.bb                   |    2 +-
>   .../recipes-support/poppler/poppler-data_0.1.bb    |    2 +-
>   meta-demoapps/recipes-support/poppler/poppler.inc  |    2 +-
>   .../omap3-sgx-modules_1.3.13.1397.bb               |    4 ++--
>   meta/recipes-bsp/zaurusd/zaurusd_svn.bb            |    2 +-
>   .../galago/galago-daemon_0.5.1.bb                  |    2 +-
>   .../iproute2/iproute2_2.6.38.bb                    |    2 +-
>   meta/recipes-connectivity/ofono/ofono_0.50.bb      |    2 +-
>   .../telepathy/telepathy-glib_0.14.3.bb             |    2 +-
>   .../telepathy/telepathy-idle_0.1.8.bb              |    2 +-
>   .../telepathy/telepathy-python_0.15.19.bb          |    2 +-
>   meta/recipes-core/dbus-wait/dbus-wait_svn.bb       |    2 +-
>   .../glib-networking/glib-networking_2.28.7.bb      |    2 +-
>   meta/recipes-devtools/distcc/distcc_2.18.3.bb      |    2 +-
>   .../subversion/subversion_1.6.15.bb                |    2 +-
>   meta/recipes-extended/blktool/blktool_4-6.bb       |    2 +-
>   .../recipes-extended/chkconfig/chkconfig_1.3.52.bb |    2 +-
>   meta/recipes-extended/libidn/libidn_0.6.14.bb      |    2 +-
>   meta/recipes-extended/libidn/libidn_1.22.bb        |    2 +-
>   meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |    4 ++--
>   meta/recipes-extended/mktemp/mktemp_1.7.bb         |    2 +-
>   meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb |    2 +-
>   .../ttf-fonts/liberation-fonts_1.06.bb             |    2 +-
>   .../xorg-driver/xf86-driver-common.inc             |    2 +-
>   meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb |    2 +-
>   meta/recipes-sato/eds/eds-tools_bzr.bb             |    2 +-
>   meta/recipes-sato/gaku/gaku_svn.bb                 |    2 +-
>   meta/recipes-sato/libical/libical_0.46.bb          |    2 +-
>   meta/recipes-sato/libowl/libowl_svn.bb             |    2 +-
>   .../recipes-sato/owl-video-widget/libowl-av_svn.bb |    2 +-
>   meta/recipes-sato/puzzles/oh-puzzles_svn.bb        |    2 +-
>   meta/recipes-sato/puzzles/puzzles_r9175.bb         |    2 +-
>   meta/recipes-sato/screenshot/screenshot_svn.bb     |    2 +-
>   meta/recipes-support/apr/apr-util_1.3.10.bb        |    2 +-
>   meta/recipes-support/apr/apr_1.4.2.bb              |    2 +-
>   meta/recipes-support/liboil/liboil_0.3.17.bb       |    2 +-
>   meta/recipes-support/neon/neon_0.29.5.bb           |    2 +-
>   48 files changed, 50 insertions(+), 50 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


