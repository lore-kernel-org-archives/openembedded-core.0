Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A74DC7EEC0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 12:22:48 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so58017117iot.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vAV1CRnwVZBJMQz1vRCgf6QCH33l3sj5mg8byG52kIQ=;
	b=SIEBsWaRP1HnyXP8s39XqP/N9ZTyvk4dSICV51RKYduBxuZSOgW9dUs67pnp+RYaKC
	mvgQLlclK848GwsJwlFzlsPtIrB8wDIS27j3G2JM4DJEFiXsCubGhD5TZ9z95MY9LcdA
	nFhlFGrNOnRfXZGobfdkn4NEj2f8KrvPKZHXd0ZFlYQN7SS3bpKSK62TC0O2gsdTsnlu
	+/iNs80RA5oKCP1jod+RVG3JfTItSuX+y90SsDxaXJYzep7TUN7QDBRSUDp+1TBF+i5H
	MMvJr1gJEYKEM9JjxrGVpNzyZeEcev9H5WtHPerk+rSRuTJ7XMgjIQPuT0NncmcG5BZj
	+eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vAV1CRnwVZBJMQz1vRCgf6QCH33l3sj5mg8byG52kIQ=;
	b=UFiz9O08guxjJcibzVJlXAc+xrW97WC5axiT8mpBpKAAjtQMvN1C5of5V6YY26/WHy
	a4vJAfd9Jpmq/ouLBA1C5wyEVSMXo+/h240hZHQVhkD5eci41vce6eK/lrXS8w1v9dYs
	7JwiQLG6G/knv6Bem9s99+ldQ/uicsVszkbeSjl8rwYrCgQ8RdTPsiZ5jzoanf9FEk/R
	8O3CCqmhl8QVQWXd3tRe+OvSNwoZsrv7rK1GYDx1taT6j+0zjt6g2u5b81AmRezehZT/
	dVv951vzU1xw7OqLODtfcZTNSoHl9f7C3OZPu/894ubxqB7ZXZKn4yH7bPaJh/F/a1hh
	vN6Q==
X-Gm-Message-State: APjAAAWCkpzQqJh0kawgZJB/tIBgSlZDm2Bv7CVIz/D0H0BUL/iczfRr
	bxuJTXSuQywhTtckq9bkI34CmL/1v0fFtzQvjBc=
X-Google-Smtp-Source: APXvYqyNWGtaQQMvs4Veg9mkEz0LBzegXJXSDCW2YZ1XwXrw1uSkBf9otrojbZzJYAX3xpLAP+esti6/Ovd8Fhg5lwc=
X-Received: by 2002:a02:b88b:: with SMTP id p11mr971891jam.144.1563538969611; 
	Fri, 19 Jul 2019 05:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190716135444.12057-1-u.oelmann@pengutronix.de>
	<09978b11aded8890d37f2a64f7833f7a028e2577.camel@linuxfoundation.org>
	<6rlfwx2atq.fsf@pengutronix.de>
	<5fc8a130cfb17be80c146dec31ab5ffd71eea247.camel@linuxfoundation.org>
	<20190718061948.GB27459@localhost>
In-Reply-To: <20190718061948.GB27459@localhost>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 19 Jul 2019 13:22:37 +0100
Message-ID: <CAO5Uq5QLHqXu2bRHBJzCC+d5cykXcBgDenrPzRtqzoN4OJnOwg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] squashfs-tools: upgrade to commit f95864afe883
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
X-List-Received-Date: Fri, 19 Jul 2019 12:22:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 7:20 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Jul 17, 2019 at 11:57:42AM +0100, richard.purdie@linuxfoundation.=
org wrote:
> > On Wed, 2019-07-17 at 12:51 +0200, Ulrich =C3=96lmann wrote:
> > > Hi Richard,
> > >
> > > On Wed, Jul 17 2019 at 11:19 +0200, Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > > On Tue, 2019-07-16 at 15:54 +0200, Ulrich =C3=96lmann wrote:
> > > > > [...]
> > > > > -PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr"
> > > > > +PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd reproducibl=
e"
> > > > > [...]
> > > > > +PACKAGECONFIG[zstd] =3D "ZSTD_SUPPORT=3D1,ZSTD_SUPPORT=3D0,zstd"
> > > > > +PACKAGECONFIG[reproducible] =3D
> > > > > "REPRODUCIBLE_DEFAULT=3D1,REPRODUCIBLE_DEFAULT=3D0,"
> > > >
> > > > This fails in OE-Core since zstd isn't present and you've enabled
> > > > that
> > > > by default:
> > > >
> > > > e.g.:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8=
27
> > > >
> > > > (but many other similar failures).
> > > >
> > > > Adding the PACKAGECONFIG[zstd] is good, we just can't enable it by
> > > > default.
> > >
> > > see my reply to Adrian: what do you think of transplanting the zstd
> > > recipe from meta-rauc to OE-core?
> >
> > I think right now that zstd is not common enough to be something for
> > oe-core. If multiple people reply and disagree I'm willing to reasses
> > that but that's my feeling right now...
>
> zstd not even being in meta-oe is a surprise that should be corrected.
>

I've had it sat in a local layer forever, just sent a patch to add it
to meta-oe.

--=20
Alex Kiernan

