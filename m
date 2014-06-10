Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id ACD386BD9A;
	Tue, 10 Jun 2014 10:07:04 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id f8so5775094wiw.2
	for <multiple recipients>; Tue, 10 Jun 2014 03:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=MDmvLyrPXMvqik5EI4G4Y4YTjQZ7DbgeuvC0sPXXP28=;
	b=b3waj3WwPotLPEpNHYEUBzOFAYnQpDdxjC8BTAwdgUQHQ4vmxUp1PVaSzbK5VAAA7J
	aLvh8eD7+qbPnG7xPdqrEOBlUM6wFGZLNiHJQnv9Z+I1VpWQkixvDmWKDnT0ioCcuo7g
	IHuqe8BxkAvckyJEGy0+BHNqSVeBfPeEX4U5f0ATi1HN7qtzm0vllBfy3xdBFMpGszyq
	92SVSA+7EONA/bWORoCTr3/azOcc3jZjVJ4uHOMbFLJL5kZHTeddQV6QVw6GP2MdYRbS
	1bS7uRR8XGlTy/aOcmt4yjO/x+0pd9A5C7t3n3Lxk2+jAVoZkQDnCxIu1knt4KuzCobn
	cy/Q==
X-Received: by 10.15.49.8 with SMTP id i8mr2137eew.33.1402394823303;
	Tue, 10 Jun 2014 03:07:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm30391045eem.15.2014.06.10.03.07.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jun 2014 03:07:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Jun 2014 12:07:22 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140610100722.GC2433@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-06-02
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
X-List-Received-Date: Tue, 10 Jun 2014 10:07:07 -0000
X-Groupsio-MsgNum: 54001
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline

--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 02, 2014 at 10:49:50AM +0200, Martin Jansa wrote:
> This build still contains huge patch setting B = S or inherit for
> autotools-brokensep for all recipes which were failing in earlier
> master builds.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2014-06-10 ==

=== common (17) ===
    * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.10.0.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/python/python-cython_0.20.1.bb, do_package
    * meta-openembedded/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb, do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb, do_configure
    * meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/daemonize/daemonize_git.bb, do_configure
    * meta-openembedded/meta-oe/recipes-support/eject/eject_2.1.5.bb, do_compile
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb, do_compile
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb, do_compile
    * meta-qt5/recipes-qt/maliit/maliit-framework-qt5_git.bb, do_compile
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_install
    * meta-smartphone/meta-fso/recipes-freesmartphone/python/python-pyrtc_git.bb, do_compile
    * meta-smartphone/meta-shr/recipes-shr/shr/python-phoneutils_git.bb, do_compile

=== common-x86 (3) ===
    * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do_compile
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=== qemuarm (0) ===

=== qemux86 (0) ===

=== qemux86_64 (1) ===
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb, do_compile

=== Number of failed tasks ===
{| class=wikitable
|-
||qemuarm       ||17    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140606_153039.log/
|-
||qemux86       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140609_094000.log/
|-
||qemux86_64    ||21    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140610_021320.log/
|}


--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOW2NoACgkQN1Ujt2V2gBxsxACgkCE6/3YH9LSkuT1uIWGQ0n8B
keoAoLmOBDhD4XehnoLLEp84Gx2nGs4e
=Ixh/
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
