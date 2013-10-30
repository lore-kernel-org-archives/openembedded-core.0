Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 499F76D486;
	Wed, 30 Oct 2013 23:08:24 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so989547eae.24
	for <multiple recipients>; Wed, 30 Oct 2013 16:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rDF1sRy0xZdS3noXNtbc5xB73FJja0HV5DRyhZUzI5Q=;
	b=TDfOiftqqjt/BomA711oWYs5AA1q67ehWBUxMaDRnz351faV2lRqU96snjmxd8TWl7
	Ysl1WUhRciMBVl2N/JxdujfwoA8YHr41WSR4Whny58ddL9OJdfWXNue8ZihlJOu1hZaf
	WCIZzkP6IW1G9eAMQWXy38EKyz7PGRIJBJEied1XYmYwDo+1z+hmzW31hwcY2QyXCe2k
	ZZOEBJ5QSfGCMn8PehluEvVaefwDV5VqJQTsYb05t1jUFEY4+3HawZU5/FxI6K5LWD3v
	o9mY1Hv2BvDMmtHA5sp1FB7W3PKSmNigSb0SHYHrlkUKSLG07FhWx/h3aCoBQ5XIWgA6
	/zdg==
X-Received: by 10.14.179.66 with SMTP id g42mr143388eem.104.1383174505347;
	Wed, 30 Oct 2013 16:08:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w6sm919915eeo.12.2013.10.30.16.08.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Oct 2013 16:08:24 -0700 (PDT)
Date: Thu, 31 Oct 2013 00:08:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20131030230825.GB32015@jama>
References: <20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130917123058.GC7313@jama>
	<20131020194345.GB3709@jama>
MIME-Version: 1.0
In-Reply-To: <20131020194345.GB3709@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: State of bitbake world
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
X-List-Received-Date: Wed, 30 Oct 2013 23:08:24 -0000
X-Groupsio-MsgNum: 46414
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2013 at 09:43:45PM +0200, Martin Jansa wrote:
> On Tue, Sep 17, 2013 at 02:30:58PM +0200, Martin Jansa wrote:
> > I haven't updated this status for few weeks because there were always
> > some issue deeper in the dependency tree so it was hiding a lot of other
> > issues, now it's good time to update all qemu* statuses. All these
> > builds had both my dependency-fixes patchsets included.
> >=20
> > qemuarm: Summary: 5 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130915_024550.log
> >=20
> > qemux86: Summary: 10 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130915_190536.log
> >=20
> > qemux86-64: Summary: 14 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130916_160509.log

Starting now I'll use
http://openembedded.org/wiki/Bitbake_World_Status
to post results from my bitbake world buils.

common (10)
   * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb=
, do_compile
   * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb=
, do_compile
   * meta-openembedded/meta-networking/recipes-support/lowpan-tools/lowpan-=
tools_git.bb, do_install
   * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_in=
stall
   * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_c=
ompile
   * meta-openembedded/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.b=
b, do_configure
   * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compi=
le
   * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_co=
mpile
   * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_configure
   * meta-smartphone/meta-fso/recipes-freesmartphone/cornucopia/fsogsmd_0.1=
2.0.bb, do_compile
common-x86 (5)
   * meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_comp=
ile
   * meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexecboo=
t-klibc-image.bb, do_rootfs
   * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_comp=
ile
   * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
   * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
qemuarm (1)
   * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_=
git.bb, do_compile
qemux86 (1)
   * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geod=
e_2.11.14.bb, do_compile
qemux86_64 (3)
   * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
   * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimo=
biledevice_1.1.4.bb, do_configure
   * meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.21=
=2E1.bb, do_compile

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJxkWkACgkQN1Ujt2V2gBwZPwCdGQEbN2j7bmdFA8LFq3ZAFyLt
NFEAoKFHASs0leNU1uN/m9Bpe7IDUtPg
=GEW5
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
