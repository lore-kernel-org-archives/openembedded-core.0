Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id D6C576EE45;
	Wed, 26 Mar 2014 17:11:36 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so1918949eek.10
	for <multiple recipients>; Wed, 26 Mar 2014 10:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=0YB6i7TlPLSvBcDzG0C+120r8meZiU56EG2PZvTnu+Y=;
	b=HiuxWelMKy0gQvQAK+lrmQP3eJU3T8yZJYtzQYyL60QTeF9O9SjpQedil/ikVmLwgg
	A4cHCwPTK7u1P5NzOriR4r9sZF1IH+ngfxHmkTVv865x1hkSA79McpjIb8DYtRCbYYB8
	ExoDnUYIR+Q3+ygCAymbjf4h8tAU+fgphXAc56YCfPJxOSPkYLsDIwt/ks4utYQy/cjZ
	MjoH4g4ubwaLyuUGwR5cExKxqcKjBS9P20ySuJ9Mf6JLb/TKUrnMURqDe4KuJ7jV/qSW
	jHzZiRcBJ8kQL8G3c8xyTvYwsQEG8SVK+JA7XyaM6C4qwRNK3qWPWyjaM5nHWRE2qGZ9
	oEDA==
X-Received: by 10.15.63.66 with SMTP id l42mr9495006eex.63.1395853897499;
	Wed, 26 Mar 2014 10:11:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a42sm30133195ees.10.2014.03.26.10.11.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 10:11:36 -0700 (PDT)
Date: Wed, 26 Mar 2014 18:11:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140326171136.GF3709@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-03-26
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
X-List-Received-Date: Wed, 26 Mar 2014 17:11:38 -0000
X-Groupsio-MsgNum: 51671
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ls2Gy6y7jbHLe9Od"
Content-Disposition: inline

--Ls2Gy6y7jbHLe9Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 23, 2014 at 09:43:24PM +0100, Martin Jansa wrote:
> On Tue, Mar 18, 2014 at 07:50:08PM +0100, Martin Jansa wrote:
> > On Sat, Mar 15, 2014 at 03:10:46PM +0100, Martin Jansa wrote:
> > > On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> > > > On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrote:
> > > > > Biggest difference from last e-mail is aclocal changes which can possibly explain
> > > > > increased number of do_configure failures, I've asked Richard to delay merging B!=S
> > > > > change until we resolve or at least analyze these new failures, so any help with
> > > > > would be highly appreciated.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2014-03-26 ==

=== common (16) ===
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb, do_configure
    * meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb, do_configure
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_install
    * meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb, do_compile
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb, do_configure

=== common-x86 (6) ===
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/eve_svn.bb, do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb, do_configure
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=== qemuarm (4) ===
    * meta-openembedded/meta-efl/recipes-efl/e17/e-wm_0.18.4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package

=== qemux86 (3) ===
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb, do_compile
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_install

=== qemux86_64 (1) ===
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb, do_configure

=== Number of failed tasks ===
{| class=wikitable
|-
||qemuarm       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140323_205755.log/
|-
||qemux86       ||25    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140324_032725.log/
|-
||qemux86_64    ||23    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140324_231909.log/
|}


--Ls2Gy6y7jbHLe9Od
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMzCkgACgkQN1Ujt2V2gBwHPwCfZBvMyc4Dow1gqRTw261GBMU7
YFgAoLE1X2LapYNzAczIRdzXH50kgoxF
=rLV5
-----END PGP SIGNATURE-----

--Ls2Gy6y7jbHLe9Od--
