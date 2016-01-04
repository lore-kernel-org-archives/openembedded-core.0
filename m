Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B8E8C60745;
	Mon,  4 Jan 2016 14:15:38 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f206so174608260wmf.0;
	Mon, 04 Jan 2016 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=MzYitBcZr5AN3OOh/nm60uRjWVAq5zj+Mjqm2RoD/x8=;
	b=xX1FJz8+4/oy2wgwbSPjULG2B55VndRXv4iLP161rk8HBebh+/rgOoGZKxCy78nBiY
	JhpEY9K23Q4Pma5h5fe5775cCQ9TaefwLN5pYQ4j6mBotvh7umBO+uv8U2uxFICBouMn
	Vv0V1HdsthbwsOYWkEtDfMNH9qsnB+KKHXvj9Lx3qIPp6LOhzHcSiUW0Ul/A0QqNbBnl
	wfm6vOu0ydjmcravyPbi6MyKnrz3Ww01P60R6WVTlyCdUhjD9hUZ1dPmuTM5P8kh819v
	dIAIKjo8I/3QpSKyB4tuRMREcmXHRENqs4LbVubvbzD9llNupsNjQfBugQeNpGLURw7d
	/AXQ==
X-Received: by 10.28.218.75 with SMTP id r72mr92881290wmg.59.1451916938744;
	Mon, 04 Jan 2016 06:15:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u126sm77957956wme.3.2016.01.04.06.15.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 06:15:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 15:19:49 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20160104141949.GE2581@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2016-01-04
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
X-List-Received-Date: Mon, 04 Jan 2016 14:15:39 -0000
X-Groupsio-MsgNum: 75378
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline

--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This may look like improvement, but that's only qemux86-64 failed to
build linux-yocto again.

== Failed tasks 2016-01-04 ==

INFO: jenkins-job.sh-1.7.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20160104_040826.log

=== common (8) ===
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/iksemel/iksemel_1.4.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/libetpan/libetpan_0.57.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb, do_compile

=== common-x86 (5) ===
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb, do_compile

=== qemuarm (0) ===

=== qemux86 (0) ===

=== qemux86_64 (3) ===
    * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_compile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb, do_compile
    * /openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb, do_compile

=== Number of failed tasks (37) ===
{| class=wikitable
|-
|| qemuarm 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20160103_213013.log// || http://errors.yoctoproject.org:80/Errors/Build/11158/
|-
|| qemux86 	|| 13	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20160103_234200.log// || http://errors.yoctoproject.org:80/Errors/Build/11159/
|-
|| qemux86_64 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20160104_014918.log// || http://errors.yoctoproject.org:80/Errors/Build/11160/
|}

=== PNBLACKLISTs (88) ===

=== QA issues (0) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|}

--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaKf4UACgkQN1Ujt2V2gBw9BgCePX97epYwbgFLsFPlQqzFw0xD
RssAn2rXiLz+4uLn5rAzfsUhj92YeGGo
=M0ei
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
