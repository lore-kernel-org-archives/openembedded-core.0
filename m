Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE3665D08
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 16:06:49 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id k14so2765015wgh.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 09:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=X5JqzlJ2L3pNhGr/jv695H5gZfBemhs1Fs+D5fJccGY=;
	b=Bwh281AVR13X5kv8QnVr0N62vFRWgRnegAzNDrHxSWxDIIg91X08nz+fcCaE0mKlgM
	YMt38FCAim8cYZ34oRqbS3IYd5WVfD6T7+U7FpP4bLkkPt88lMP0eel6nHCsqCDy9JdL
	xEpq8V6FUFJzAmXcsKiTftJvC033ofW5b700FQjTZBzXqZmJZjulxftTgC+NQId/b+id
	pZj2531pTLnPBYNeYqeoZcdebwFQjldttPOYaq/qei1ANjRQgtishBXlGJmA7aLX3iNd
	EB+lMckZZzoqOq1joLxvWAKoo2WhhJq/RukYfzNAdCEpgbPmlOtsf2nw1JsvdNPggXWk
	SgxA==
X-Gm-Message-State: ALoCoQn3k5uD6mpx4cCyJ6XJYBiN6WGoeDrW6pf7YEABeti85MdYgq+M1azBV2rxTxVUOUjB3OBi
X-Received: by 10.194.9.8 with SMTP id v8mr2656227wja.53.1398096409895;
	Mon, 21 Apr 2014 09:06:49 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id ll1sm57710803wjc.6.2014.04.21.09.06.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Apr 2014 09:06:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140421153432.GF2486@jama>
Date: Mon, 21 Apr 2014 18:06:41 +0200
Message-Id: <C2E43C04-5157-4E66-B0FA-0149531642C8@dominion.thruhere.net>
References: <20140421153432.GF2486@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Mon, 21 Apr 2014 16:06:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 apr. 2014, om 17:34 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> gnome-backgrounds fix is on ML
> mousepad, gd are fixed now, but fix wasn't included in qemuarm build
> iozone3 should be fixed by v2 on ML
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2014-04-21 =3D=3D
>=20
> =3D=3D=3D common (7) =3D=3D=3D
>    * =
meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb, =
do_compile
>    * =
meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgro=
unds_2.32.0.bb, do_configure
>    * =
meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, =
do_configure
>    * =
meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft_1.=
15.1.bb, do_compile
>    * =
meta-openembedded/meta-oe/recipes-benchmark/iozone3/iozone3_414.bb, =
do_fetch
>    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, =
do_compile
>    * =
openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb,=
 do_configure
>=20
> =3D=3D=3D common-x86 (4) =3D=3D=3D
>    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, =
do_compile
>    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, =
do_install
>    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, =
do_compile
>    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

The grub fix has been being ignored for a few weeks now on the oe-core =
ML :(

>=20
> =3D=3D=3D qemuarm (5) =3D=3D=3D
>    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, =
do_compile
>    * meta-openembedded/meta-oe/recipes-support/gd/gd_2.1.0.bb, =
do_configure
>    * =
meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
>    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
>    * =
openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, =
do_compile
>=20
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86_64 (2) =3D=3D=3D
>    * =
meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobile=
device_1.1.4.bb, do_configure
>    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, =
do_configure
>=20
> =3D=3D=3D Number of failed tasks =3D=3D=3D
> {| class=3Dwikitable
> |-
> ||qemuarm       ||12    =
||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world=
.20140418_190059.log/
> |-
> ||qemux86       ||14    =
||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world=
.20140419_163001.log/
> |-
> ||qemux86_64    ||13    =
||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world=
.20140420_141804.log/
> |}
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


