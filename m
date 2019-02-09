Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 353706D523
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 09:32:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r17so7566582wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 01:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=geXhorrKSbDSgoyT2cGmfocK6OK22KktyIRPs5VhF/U=;
	b=nY7TDE7OyL699sHnOvf3roFihxB05JCknvBkzr8u9TBIUDaA1b8aiZoHkbKJaArOni
	wYzEBCsg3Dtq+Fo1kYqv+tUT2skBCkAhr2AhPZPpiCP1uJnfIpAjHLSSBocEXkIsw8g/
	yM74ioExfbNf1D6ZeY13nMhFsEaY0UgxDcSiIRCAo/O0Ve6GnL+5R4uQt0KloMpGmsmN
	iFUsODpORQdyvDqzIWxaNh9q6gIRagI6FWHSKj0Mwik2OHBlwn4TAfJ9njam0YkuwLa9
	/eJJHvkrN7Y1dobgP1l2cxg2tg33rtxvfggqeJW0EGctDj3vIryojySH9gOKQqPdupKH
	lsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=geXhorrKSbDSgoyT2cGmfocK6OK22KktyIRPs5VhF/U=;
	b=sbXwWm9sMoZnjP2pfpmYc45Po8WlgqUalYjgYQOLZggV8Uln4SxAiNzJWDyWyPNHWY
	Q9oD8TvdDPAvW46LU9/led/N24tUsLpnxk4sTvP/T3KGWpmowQqDvrhKXuvdEXpTZGjj
	fgEhA+dJphSDACUXc45mm680BniOxkj71eFvNQol8tqb/VPTRSfTLiZ3ht4r8GMhkWY5
	6Ep0Dr9GvcyYPhsXp5tw/G8qxSHyMFrTQJPMAj8Qp3HfKnJXx4lq5ccpzD8B6ExUb+Hf
	MCaRQC7IFTi2cDOUXBp0XQR5SLYRe6Pjc7oPONuU8H43tsg3VSzPY96riH6sz02W/wfX
	48bA==
X-Gm-Message-State: AHQUAuZaifNRmbyf1uGkyccef6TQ+b1gAopfl0Wr5vHAYmcgcnTLElAL
	lowbX3ktevk6i6MVZLKmjXU=
X-Google-Smtp-Source: AHgI3IYGJ2ZmnYD4Hm+/jxdywYC08fQ1m/BzgGlkndnjetjEgVwEC0UPXFY9/S1o9pM5hJa2fncmLQ==
X-Received: by 2002:adf:ecc4:: with SMTP id s4mr10223018wro.286.1549704777711; 
	Sat, 09 Feb 2019 01:32:57 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f134sm5447868wme.31.2019.02.09.01.32.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 09 Feb 2019 01:32:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 9 Feb 2019 10:32:59 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190209093259.GB2258@jama>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<bb8c993db03526b5f7ef16b2c076055b1ce6de40.1549637121.git.alex.kanavin@gmail.com>
	<20190208231255.GA2258@jama>
	<CANNYZj-LeigbBS592R5qwvfG5yCApqgQhU_Fjhiz79U=y-ZddA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-LeigbBS592R5qwvfG5yCApqgQhU_Fjhiz79U=y-ZddA@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Sat, 09 Feb 2019 09:32:57 -0000
X-Groupsio-MsgNum: 121002
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline

--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 09, 2019 at 12:32:13AM +0100, Alexander Kanavin wrote:
> On Sat, 9 Feb 2019 at 00:12, Martin Jansa <martin.jansa@gmail.com> wrote:
> > >  "
> > > -PACKAGECONFIG_class-native ??=3D "fdt alsa kvm"
> > > -PACKAGECONFIG_class-nativesdk ??=3D "fdt sdl kvm"
> > > +PACKAGECONFIG_class-native ??=3D "fdt alsa kvm virglrenderer glx"
> > > +PACKAGECONFIG_class-nativesdk ??=3D "fdt sdl kvm virglrenderer glx"
> >
> > Didn't you want to enable gtk+ here as well?
>=20
> Nope; it's enabled in a separate patch in meta-poky/local.conf
> template, in the same way as sdl is enabled there currently.
>=20
> On the other hand... maybe we can just simplify it all, and enable gtk
> directly in the recipe.

Does enabling virglrenderer and glx do anything useful without any UI?
If not then I guess it should be enabled directly here or all 3 enabled
only in the poky's local.conf.

I haven't tried egl-headless+spice on this patchset yet, maybe that's
the combination I'm looking for.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXF6eSQAKCRA3VSO3ZXaA
HEqFAKCwExnydfhXNOkljkXuCcryMZ426gCeMhPu1lYIesUlCK/4bhUN29O1kVs=
=IHAn
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
