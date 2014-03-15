Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0E06F4C4;
	Sat, 15 Mar 2014 14:10:31 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so2404929eek.38
	for <multiple recipients>; Sat, 15 Mar 2014 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=D1nXQXsK2ymYcyLbMeNeBDhRj6EutpV2RzfkYKtqUEQ=;
	b=xvNVLvHjqwYzAFnwUC3fxu7XXiIrIwRFGodQGT8vMbzpQOwLyfRWbK5hLYAzS3+2My
	8sB+YEcBlaZ2R00F/K5D8ENLMud6oRCMS8SqOJ09UOE5GnUKm/eoPhUBvaDaO03U9d9l
	wqz+sgRbU0aYRpZnzbureG0mGamLmog/r+c7mCPNsAH+thmc1qyvt1VYjaI/3w+phLlP
	dHutlBvaX9Ob/AwFxegSvIAJPZNxMya3v37STLUyFDbTkfdbJ3mV64Gd+WEfBSWNpSbk
	Aibo1IuSGbCjYfvi5Kf6nPewBZyNj2am7zC2AIUv4dBkyT8wdIVT/02Lwe9JeeuVs/8Y
	abBA==
X-Received: by 10.14.193.201 with SMTP id k49mr14226545een.50.1394892631762;
	Sat, 15 Mar 2014 07:10:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm24944497eeh.13.2014.03.15.07.10.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Mar 2014 07:10:30 -0700 (PDT)
Date: Sat, 15 Mar 2014 15:10:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140315141046.GI3759@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-03-15
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
X-List-Received-Date: Sat, 15 Mar 2014 14:10:34 -0000
X-Groupsio-MsgNum: 51245
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6b3yLyRKT1M6kiA0"
Content-Disposition: inline

--6b3yLyRKT1M6kiA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrote:
> > Biggest difference from last e-mail is aclocal changes which can possibly explain
> > increased number of do_configure failures, I've asked Richard to delay merging B!=S
> > change until we resolve or at least analyze these new failures, so any help with
> > would be highly appreciated.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2014-03-15 ==

=== common (15) ===
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb, do_configure
    * meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_install
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb, do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb, do_configure
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compile
    * meta-openembedded/meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_install
    * meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb, do_compile

=== common-x86 (1) ===
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=== qemuarm (10) ===
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-graphics/lxdm/lxdm_git.bb, do_configure
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_compile
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package

=== qemux86 (3) ===
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb, do_compile
    * meta-openembedded/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb, do_install
    * openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.22.bb, do_compile

=== qemux86_64 (4) ===
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/eve_svn.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb, do_configure
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile

=== Number of failed tasks ===
{| class=wikitable
|-
||qemuarm       ||25    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140311_153819.log/
|-
||qemux86       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140312_132359.log/
|-
||qemux86_64    ||27    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140313_065059.log/
|}

--6b3yLyRKT1M6kiA0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMkX2YACgkQN1Ujt2V2gBzCjACfa+ZTv1KcYw9mkg70NBDzdtVB
aU8An1kECdk5ig25OXmMd8nCK3c2R6GR
=45er
-----END PGP SIGNATURE-----

--6b3yLyRKT1M6kiA0--
