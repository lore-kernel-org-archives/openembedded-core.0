Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1Tsxdl-0004rs-6p; Wed, 09 Jan 2013 16:32:36 +0100
Received: by mail-vb0-f54.google.com with SMTP id l1so1651948vba.13
	for <multiple recipients>; Wed, 09 Jan 2013 07:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=C5SnaagPLgLrjQUYDnMwH75opAR3etohomhc6AR3+5Q=;
	b=HhGnAd5/fQqyRNLtJQnc35h38SmRctb2nrjrdUVkR87IQ6QIuHakE7+wk/VkndlWcp
	KgwK2+8ZGHOOMfeq0LMN1h6E8a4izjZEOkmiJBHw3dNErHDeP78l2QfC8bSwIX3cM9Ny
	VO3vlr1RFbciCO3WmezYqET75bdTNyczwD2TeQSWxlx9tGkrsLs+3TF+2HREXWBAvP92
	kAFZUmsLpOaN4yt83CnmZgfU1DfxLY+HyakypFjZ7pVNrTj4iLfA6/5IC4e6SEpsPFs7
	dm3WggDTRyOQhRqu1AeBeEsNnht17PQDP2QMlAmc0p+fai73se/Ijf0edPanLEhUCNRH
	Lx6g==
MIME-Version: 1.0
Received: by 10.220.115.20 with SMTP id g20mr89298523vcq.31.1357744636479;
	Wed, 09 Jan 2013 07:17:16 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 9 Jan 2013 07:17:16 -0800 (PST)
In-Reply-To: <20130109132813.GJ3722@jama.palm1.palmone.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<20121224091242.GS8988@jama.palm1.palmone.com>
	<20130109132813.GJ3722@jama.palm1.palmone.com>
Date: Wed, 9 Jan 2013 16:17:16 +0100
Message-ID: <CALbNGRTEiLQ8JkN1PvRc6k2rbuvnozP79ywYudMaUyXNViGpSg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Wed, 09 Jan 2013 15:32:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 9, 2013 at 2:28 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Updated list with current oe-core + eglibc-2.17 and changes listed in
> in-test bundle on patchwork
>
> Summary: 31 tasks failed:
> Build log:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/20130109051600.log
>
> New entries:
>   meta-openembedded/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/gpm/gpm_1.99.7.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb, do_compile
>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb, do_configure
>   meta-openembedded/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb, do_compile
>   meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb, do_compile
>   meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb, do_configure
>
> Old entries:
>   meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb, do_package_write_ipk
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb, do_compile
>   meta-smartphone/meta-shr/recipes-multimedia/mplayer/mplayer_svn.bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/uhd/uhd_git.bb, do_compile
>   meta-openembedded/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb, do_compile
>   virtual:native:meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb, do_populate_sysroot
>   meta-openembedded/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb, do_compile
>   openembedded-core/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb, do_compile
>   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do_compile
>   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb, do_install
>   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_compile
>   meta-openembedded/meta-oe/recipes-graphics/slim/slim_1.3.2.bb, do_compile
>   meta-openembedded/meta-networking/recipes-support/netcat/netcat_0.7.1.bb, do_compile
>   meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.08.bb, do_compile
>   meta-smartphone/meta-samsung/recipes-bsp/samsung-modem-mgr/samsung-modem-mgr_git.bb, do_configure
>   meta-openembedded/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_compile
>   meta-openembedded/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb, do_install
>   meta-openembedded/meta-oe/recipes-support/fftw/benchfft_3.1.bb, do_configure
>   meta-openembedded/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compile
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile
>
> Cheers,
>
As already discussed: gnome-disk-utility, epiphany,
gnome-power-manager and gnome-disk-utility share the same error:

| notification-main.c:539:21: error: too many arguments to function
'notify_notification_new'

I spent some time with this and found out that this error is caused in
case libnotify3 is build. The error could be now reproduced by:

1. Building my image from scratch. libnotfy+gnome-disk-utility were built

2. bitbake libnotify3 -> Tons of: 'WARNING: The recipe libnotify3 is
trying to install files into a shared area when those files already
exist. Those files and their manifest location are:
   /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/lib/libnotify.a
   Matched in manifest-overo-libnotify

3. bitbake -ccleansstate gnome-disk-utility

4. bitbake gnome-disk-utility -> error above

Since we are on our way to gtk+3 we need to ensure that libnotfy and
libnotify3 can live together peacefully.

Andreas


