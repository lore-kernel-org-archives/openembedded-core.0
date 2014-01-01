Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 075746A413;
	Wed,  1 Jan 2014 11:49:55 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id d17so5862387eek.11
	for <multiple recipients>; Wed, 01 Jan 2014 03:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=sfFoQhFRyGNcQMki3ZaxubADDE1BkPMWp4TLALgavPE=;
	b=VO/PLqRsE7dmqZ6kFZGr1oM9lbPZr4eRvpFuFHGiuo0ZpbkExXSzhCjJILyQsikHCV
	Wbj22rOKMu1lcTnA1JsPCbxHY18qDrMHZyTTAfNLBlhMrgq3SMz+GR7ShNab49auUl2E
	a/c9W0d8aHSnErdhWgU+ZeX2W9HwoIsY9fNP/FnX3c9YwZpMZ9DQLtIWKQTyRgHgrc3r
	SRCJB+nnsCQyCDU6ve0eU8B6HLBLTpc1GCB6c09V3j2ZoF9tn1A+7POl0lzi+WB5g9Kw
	bV4fMJDo/OCc8bRFDkSSL75hrjcJAJx3a2dHFQ1ZWLyE48ijh7XbrFIEy399Kh90vDN9
	T0kg==
X-Received: by 10.14.204.135 with SMTP id h7mr9004560eeo.104.1388576996554;
	Wed, 01 Jan 2014 03:49:56 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm126428020eef.9.2014.01.01.03.49.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 03:49:55 -0800 (PST)
Date: Wed, 1 Jan 2014 12:49:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140101114957.GA11840@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks Wed Jan
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
X-List-Received-Date: Wed, 01 Jan 2014 11:49:57 -0000
X-Groupsio-MsgNum: 48537
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'll take care of fetch issues in meta-oe git recipes

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks Wed Jan  1 11:45:17 UTC 2014 ==

=== common (21) ===
    * meta-openembedded/meta-efl/recipes-efl/efl/evas_1.7.9.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb, do_fetch
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb, do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb, do_compile
    * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-kernel/ktap/ktap_0.3.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, do_configure
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compile
    * meta-openembedded/meta-oe/recipes-navigation/navit/navit_svn.bb, do_compile
    * meta-openembedded/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-qt/qconnman/qconnman_git.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-support/libssh/libssh_0.5.5.bb, do_fetch
    * meta-openembedded/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb, do_fetch
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb, do_compile
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile

=== common-x86 (4) ===
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=== qemuarm (0) ===

=== qemux86 (1) ===
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb, do_compile

=== qemux86_64 (3) ===
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb, do_compile

=== Number of failed tasks ===
{| class=wikitable
|-
||qemuarm       ||21    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20131231_122037.log/
|-
||qemux86       ||26    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20131231_161849.log/
|-
||qemux86_64    ||28    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20131231_201114.log/
|}

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLEAOUACgkQN1Ujt2V2gBxdbgCbBD51uIb8+vDv8HhItmiWF9x4
uQwAniR5W14fs8+3trWoUfe6OfQPrh1p
=N/hL
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
