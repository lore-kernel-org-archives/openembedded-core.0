Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 20A2D71637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:34:09 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y19so2773515wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NFlsohnz7j0qpQLJwa8byIKd4aUrb074kkvrNXNuSss=;
	b=M9qiHL0HrKz622ZawlJawceTQgm5h2DgFbmdXH1gWpkei/JRpGdADabvbDN6vsIr6r
	RQkL32rtQsTM4ht7xu8bAbprucGzq/cWOS0Sm8sIuaUcKskUZlvvIadzAFMgtGZ82jL9
	DPsa15DfBcD2AidkIBShAXyuUIqoi+xt8niD/pVUfiHxDo3bUfl3t8Pz1VCEkFcYRyYl
	OZAlX3uqCKSvJo0HVynkmYdOYCxw0KRRfLuiyAIPI3i7XtUePTqGolgjCvVhZWRUeMYV
	mPQcCaPSSU9eLCm9T9CuOBdt17qY5x3fNrvxOeBQBJuEOAa6XanhOqtSr/cTptKFXBOF
	lV+A==
X-Received: by 10.194.185.68 with SMTP id fa4mr4370538wjc.111.1421944449615;
	Thu, 22 Jan 2015 08:34:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ei5sm3699211wid.2.2015.01.22.08.34.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:34:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Jan 2015 17:34:14 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150122163414.GE2456@jama>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221117-12710-3-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LZyFhMvO1YHeQTQsRRbVGmQ7xtmkzBH3rk4LvtGvvBMQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZyFhMvO1YHeQTQsRRbVGmQ7xtmkzBH3rk4LvtGvvBMQw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/4] xorg-driver: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 22 Jan 2015 16:34:24 -0000
X-Groupsio-MsgNum: 61627
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zaRBsRFn0XYhEU69"
Content-Disposition: inline

--zaRBsRFn0XYhEU69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 09:17:40PM +0000, Burton, Ross wrote:
> On 10 December 2014 at 14:18, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> >  meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb  | 4 ++++
> >  meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb | 4 ++++
> >  meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb       | 4 ++++
> >  meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb     | 4 ++++
> >  meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb     | 4 ++++
> >  meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb  | 4 ++++
> >
>=20
> There's a xorg-driver-common.inc you can patch instead.

libx11 dependency isn't added in xorg-driver-common.inc:

OE @ ~/openembedded-core/meta/recipes-graphics/xorg-driver $ git grep libx11
xf86-video-intel_2.21.15.bb:DEPENDS +=3D "virtual/libx11 drm libpciaccess p=
ixman"
xf86-video-intel_2.21.15.bb:# depends on virtual/libx11
xf86-video-intel_2.99.917.bb:DEPENDS +=3D "virtual/libx11 drm libpciaccess =
pixman"
xf86-video-intel_2.99.917.bb:# depends on virtual/libx11
xf86-video-omap_git.bb:DEPENDS +=3D "virtual/libx11 libdrm xf86driproto"
xf86-video-omap_git.bb:# depends on virtual/libx11
xf86-video-omapfb_git.bb:DEPENDS +=3D "virtual/libx11"
xf86-video-omapfb_git.bb:# depends on virtual/libx11
xf86-video-vesa_2.3.3.bb:DEPENDS +=3D "virtual/libx11 randrproto libpciacce=
ss"
xf86-video-vesa_2.3.3.bb:# depends on virtual/libx11
xf86-video-vmware_13.0.2.bb:DEPENDS +=3D "virtual/libx11 xineramaproto vide=
oproto libpciaccess"
xf86-video-vmware_13.0.2.bb:# depends on virtual/libx11

and the .inc file is used in much more recipes (which don't need libx11 to =
build)
OE @ ~/openembedded-core/meta/recipes-graphics/xorg-driver $ git grep xorg-=
driver-common.inc
xorg-driver-input.inc:include xorg-driver-common.inc
xorg-driver-video.inc:include xorg-driver-common.inc

OE @ ~/openembedded-core/meta/recipes-graphics/xorg-driver $ git grep xorg-=
driver-input.inc
xf86-input-evdev_2.9.1.bb:require xorg-driver-input.inc
xf86-input-keyboard_1.8.0.bb:require xorg-driver-input.inc
xf86-input-keyboard_git.bb:require xorg-driver-input.inc
xf86-input-mouse_1.9.1.bb:require xorg-driver-input.inc
xf86-input-mouse_git.bb:require xorg-driver-input.inc
xf86-input-synaptics_1.8.1.bb:require xorg-driver-input.inc
xf86-input-synaptics_git.bb:require xorg-driver-input.inc
xf86-input-vmmouse_13.0.0.bb:require xorg-driver-input.inc

OE @ ~/openembedded-core/meta/recipes-graphics/xorg-driver $ git grep xorg-=
driver-video.inc
xf86-video-cirrus_1.5.2.bb:require xorg-driver-video.inc
xf86-video-fbdev_0.4.4.bb:require xorg-driver-video.inc
xf86-video-intel_2.21.15.bb:require xorg-driver-video.inc
xf86-video-intel_2.99.917.bb:require xorg-driver-video.inc
xf86-video-modesetting_0.9.0.bb:require xorg-driver-video.inc
xf86-video-omap_git.bb:require xorg-driver-video.inc
xf86-video-omapfb_git.bb:require xorg-driver-video.inc
xf86-video-vesa_2.3.3.bb:require xorg-driver-video.inc
xf86-video-vmware_13.0.2.bb:require xorg-driver-video.inc


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zaRBsRFn0XYhEU69
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTBJoYACgkQN1Ujt2V2gBwc0wCfVxlWK+cCL3sxMVWw6mAs+fFY
03YAn1ccT7lmiCwR8feOpROyQetLf0Z2
=XnNG
-----END PGP SIGNATURE-----

--zaRBsRFn0XYhEU69--
