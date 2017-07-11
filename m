Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8347C71A70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:41:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 02:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,345,1496127600"; d="scan'208";a="106912585"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.0.217])
	by orsmga004.jf.intel.com with ESMTP; 11 Jul 2017 02:41:29 -0700
Message-ID: <1499766088.3497.2.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Tan Shen Joon <shen.joon.tan@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 10:41:28 +0100
In-Reply-To: <1499736642-142343-1-git-send-email-shen.joon.tan@intel.com>
References: <1499736642-142343-1-git-send-email-shen.joon.tan@intel.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH] update distro_alias to include unmap packages on other distro
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jul 2017 09:41:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Shen Joon,

The commit message doesn't match the expected format of

"primary item changed: short summary

Long description"

as documented at:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

If in doubt about how to describe the primary item changed git log is
invaluable, in this case we can see from a `git log
meta/conf/distro/include/distro_alias.inc` that commit messages for
changes to this file use "distro_alias.inc:" to describe the file.



On Tue, 2017-07-11 at 09:30 +0800, Tan Shen Joon wrote:
> From: Shen Joon Tan <stan74@rebeccas.png.intel.com>

You should update your git config to use a real email address.

Thanks,

Joshua

> Added packages with different names or based on sources that
> generates multiple binaries eg: python-pycurl source generates
> python3-pycurl as well. Currently, some of these packages are not
> displayed as part of other distro due to naming differences on
> the source rather than the binaries as a single source could
> produce multiple binaries with different names.
> 
> Signed-off-by: Shen Joon Tan <shen.joon.tan@intel.com>
> ---
>  meta/conf/distro/include/distro_alias.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/conf/distro/include/distro_alias.inc
> b/meta/conf/distro/include/distro_alias.inc
> index ba47f90..f7c8b4a 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -62,6 +62,7 @@ DISTRO_PN_ALIAS_pn-core-image-testmaster = "OE-
> Core"
>  DISTRO_PN_ALIAS_pn-core-image-testmaster-initramfs = "OE-Core"
>  DISTRO_PN_ALIAS_pn-core-image-weston = "OE-Core"
>  DISTRO_PN_ALIAS_pn-core-image-x11 = "OE-Core"
> +DISTRO_PN_ALIAS_pn-createrepo-c = "Fedora=createrepo_c
> Clear=createrepo_c"
>  DISTRO_PN_ALIAS_pn-cross-localedef = "OSPDT"
>  DISTRO_PN_ALIAS_pn-cryptodev-linux = "OE-Core"
>  DISTRO_PN_ALIAS_pn-cryptodev-module = "OE-Core"
> @@ -128,6 +129,7 @@ DISTRO_PN_ALIAS_pn-gstreamer1.0-plugins-bad =
> "Debian=gstreamer1.0-plugins-bad U
>  DISTRO_PN_ALIAS_pn-gstreamer1.0-plugins-base = "Debian=gstreamer1.0-
> plugins-base Ubuntu=gstreamer1.0-plugins-base"
>  DISTRO_PN_ALIAS_pn-gstreamer1.0-plugins-good = "Debian=gstreamer1.0-
> plugins-good Ubuntu=gstreamer1.0-plugins-bad"
>  DISTRO_PN_ALIAS_pn-gstreamer1.0-rtsp-server = "Ubuntu=gstreamer0.10-
> rtsp Fedora=gstreamer-rtsp"
> +DISTRO_PN_ALIAS_pn-gstreamer1.0-vaapi = "Fedora=gstreamer1-vaapi
> Debian=gstreamer-vaapi Clear=gstreamer-vaapi"
>  DISTRO_PN_ALIAS_pn-gtk+ = "Meego=gtk2 Fedora=gtk2 OpenSuSE=gtk2
> Ubuntu=gtk+2.0 Mandriva=gtk+2.0 Debian=gtk+2.0"
>  DISTRO_PN_ALIAS_pn-gtk+3 = "Ubuntu=gtk+3.0 Debian=gtk+3.0
> Fedora=gtk3"
>  DISTRO_PN_ALIAS_pn-gtk-doc = "Fedora=gtk-doc Ubuntu=gtk-doc"
> @@ -193,6 +195,7 @@ DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=htt
> p://omxil.sourceforge.net/"
>  DISTRO_PN_ALIAS_pn-libowl = "Debian=owl OpenedHand"
>  DISTRO_PN_ALIAS_pn-libpam = "Meego=pam Fedora=pam OpenSuSE=pam
> Ubuntu=pam Mandriva=pam Debian=pam"
>  DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
> +DISTRO_PN_ALIAS_pn-libpcre2 = "Fedora=pcre2 Debian=pcre2
> Clear=pcre2"
>  DISTRO_PN_ALIAS_pn-libpng12 = "Debian=libpng12-0 Fedora=libpng"
>  DISTRO_PN_ALIAS_pn-libpod-plainer-perl = "OSPDT"
>  DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate
> Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate
> Mandriva=libsamplerate Debian=libsamplerate"
> @@ -207,6 +210,7 @@ DISTRO_PN_ALIAS_pn-libusb1 = "Debian=libusb-1.0-0 
> Fedora=libusb1"
>  DISTRO_PN_ALIAS_pn-libusb-compat = "OSPDT"
>  DISTRO_PN_ALIAS_pn-libx11 = "Debian=libx11-6 Fedora=libX11
> Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
>  DISTRO_PN_ALIAS_pn-libxcalibrate = "OSPDT upstream=http://cgit.freed
> esktop.org/xorg/lib/libXCalibrate/"
> +DISTRO_PN_ALIAS_pn-libxfont2 = "Fedora=libXfont2 Clear=libXfont2"
>  DISTRO_PN_ALIAS_pn-libxft = "Mandriva=libxft Debian=libxft2
> Ubuntu=libxft2"
>  DISTRO_PN_ALIAS_pn-libxi = "Ubuntu=libxi Fedora=libXi"
>  DISTRO_PN_ALIAS_pn-libxkbcommon = "Fedora=libxkbcommon
> Debian=libxkbcommon"
> @@ -323,7 +327,10 @@ DISTRO_PN_ALIAS_pn-pulseaudio-client-conf-sato =
> "OE-Core"
>  DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
>  DISTRO_PN_ALIAS_pn-python3 = "Fedora=python3 Debian=python3.2"
>  DISTRO_PN_ALIAS_pn-python3-distribute = "Debian=python3-setuptools
> Fedora=python3-setuptools"
> +DISTRO_PN_ALIAS_pn-python3-iniparse = "Fedora=python-iniparse
> Debian=python-iniparse"
>  DISTRO_PN_ALIAS_pn-python3-pip = "OpenSuSE=python3-pip
> Debian=python3-pip"
> +DISTRO_PN_ALIAS_pn-python3-pycurl = "Fedora=python-pycurl
> Debian=pycurl"
> +DISTRO_PN_ALIAS_pn-python3-pygpgme = "Fedora=python-pygpgme
> Debian=pygpgme"
>  DISTRO_PN_ALIAS_pn-python3-setuptools = "OpenSuSE=python3-setuptools 
> Debian=python3-setuptools"
>  DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-
> dbus Mandriva=python-dbus"
>  DISTRO_PN_ALIAS_pn-python-distribute = "Opensuse=python-setuptools
> Fedora=python-setuptools"
> -- 
> 2.7.4
> 

