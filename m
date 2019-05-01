Return-Path: <trini@konsulko.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB0B7D9A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 15:48:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s15so24996633wra.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Nt1rmKGiJ6+D5PAJIWcfUFpJ1R8zb2z1i3QkcREyvQY=;
	b=ZTFFAFr3qSgVQPN8ikxzy9rjhh90THSOggdt0DAuN0lT3LZgVhEazz30qdkcz8BRB3
	C3i2UNznMLWcTtihDRJ8TiqmTJahJNhYTZzlqiuvUinNVu/rh4u4AuT98olp3TpDEmZl
	Az/6OpRz3OMdXkIBAo7pUME1L/k/+2lKHdR+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Nt1rmKGiJ6+D5PAJIWcfUFpJ1R8zb2z1i3QkcREyvQY=;
	b=ieLpRbF6aCAftPVfC6N8g+/wnZ1bZrBjr/hk7s0ytIDFvizLzu/jqYAUjqbGE++dqA
	rBoO8RVsWwE9ect3Gn+nu6xNyH21cavKZAtsy3mFv3yNUgoXa1Cq5rdHApzldfWslKq7
	8U4yjnFqHG+8/HpZ1tYm/DHfujRvTyviKqqtgunWyrLZZIg8uztajMbXixn7czCosLnw
	aGs7eJmz8FYKVAKmqoe0lfALdKUKQVKrJHHf+icy9sQKSQd4sZWVk76OBUouC8wM9wgC
	6Q/4mtdL4SB4myJI+0qQomPT/S8NHnsB+ak2Gdy3uWB9DDWo6K2UW6pXIsQwm2ygzMrG
	AxAA==
X-Gm-Message-State: APjAAAWCWK4Ne/f0NSQBxK9Mo990Zq8o+WQfxjF6zNXTZdq4Q5KvNIoK
	IA9INybnylOZGCH6WVe3LwjhoQ==
X-Google-Smtp-Source: APXvYqw1puF82HyFSbBuJ+HAr0MOGSNEIu5YUuLogWF/k6inJ+1GCJUDgQH1qS7ejF/phGO7dAZ+9A==
X-Received: by 2002:adf:dd86:: with SMTP id x6mr2553638wrl.308.1556725702900; 
	Wed, 01 May 2019 08:48:22 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	b10sm10617610wrh.59.2019.05.01.08.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 08:48:21 -0700 (PDT)
Date: Wed, 1 May 2019 11:48:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20190501154818.GZ31207@bill-the-cat>
References: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
	<20190501152748.GY31207@bill-the-cat>
	<f3d54ab2a6c9fd0f452483c86b4a1f84d31a8420.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f3d54ab2a6c9fd0f452483c86b4a1f84d31a8420.camel@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [warrior][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Wed, 01 May 2019 15:48:22 -0000
X-Groupsio-MsgNum: 123919
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="weephzeRde4EOwAc"
Content-Disposition: inline

--weephzeRde4EOwAc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 10:45:03AM -0500, Joshua Watt wrote:
> On Wed, 2019-05-01 at 11:27 -0400, Tom Rini wrote:
> > On Wed, May 01, 2019 at 07:52:00AM -0700, Armin Kuster wrote:
> > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > ---
> > >  README                      |  2 +-
> > >  meta-filesystems/README     | 12 ++++++------
> > >  meta-gnome/README           | 10 +++++-----
> > >  meta-initramfs/README       |  8 ++++----
> > >  meta-multimedia/README      | 10 +++++-----
> > >  meta-networking/MAINTAINERS | 32 +++-----------------------------
> > >  meta-networking/README      |  6 +++---
> > >  meta-oe/README              |  8 ++++----
> > >  meta-perl/README            | 10 ++++------
> > >  meta-python/README          | 12 +++++-------
> > >  meta-webserver/README       |  8 ++++----
> > >  meta-xfce/README            | 10 +++++-----
> > >  12 files changed, 49 insertions(+), 79 deletions(-)
> > >=20
> > > diff --git a/README b/README
> > > index 7318f09..881115e 100644
> > > --- a/README
> > > +++ b/README
> > > @@ -1,6 +1,6 @@
> > >  Collection of layers for the OE-core universe
> > > =20
> > > -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> > > +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
> > > =20
> > >  This repository is a collection of layers to suppliment OE-Core
> > >  with additional packages, Each layer have designated maintainer
> > > diff --git a/meta-filesystems/README b/meta-filesystems/README
> > > index 87cb685..d9f07df 100644
> > > --- a/meta-filesystems/README
> > > +++ b/meta-filesystems/README
> > > @@ -10,30 +10,30 @@ Dependencies
> > >  This layer depends on:
> > > =20
> > >    URI: git://git.openembedded.org/bitbake
> > > -  branch: master
> > > +  branch: 1.40
> >=20
> > I may be starting off on the wrong patch here, but, did 1.40 or
> > bitbake.conf ever get patched up such that rm_work doesn't cause
> > world-rebuilds every time?  I recall when digging into this before
> > there
> > was a "maybe if we tweak $something it'll be happy again with this
> > older
> > bitbake".  Thanks!
>=20
> No it didn't... I seem to recall looking at it and it wasn't quite as
> trivial as I had assumed but got distracted; sorry about that. If we
> are still wanting to make oe-core backward compatible with older
> bitbake I can open a bugzilla.=20
>=20
> For reference, here is the discussion:=20
> http://lists.openembedded.org/pipermail/openembedded-core/2019-March/2797=
24.html

Please do, as IMHO we need to either fix the feature (rm_work + sstate
equivalence) or mark a newer minimum bitbake version.  rm_work + sstate
cache is part of the back-bone of internal deployments as there's never
enough disk space and also never enough wall clock time.  Thanks!

--=20
Tom

--weephzeRde4EOwAc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcyb/CAAoJEIf59jXTHXZS4YIP/jlSibDnll481AS0VbS+bASa
W57W1HzPjLm/cyPW719lHtbkQK7NY7QjILYh0GoVAbrgjBK0WgwCGtoYBQyVxdD4
FVKA0FldBZWuBTHmv+DNxdUUOsutFfIvtraia47ANeXkp0P5RkYDMf/1bdsR6HTN
LPvB7QoJPeReznK74XSkrPRxFhceU6ooCW6s6RnbqOctNXMfGjcOgXauc6UH1WJ5
IsXv7KI8rjg32lpyYcl/WW4lNSbayyNI0EPHLLy/JUGOay2IuJ6fvsmF5eGTYWM4
tRPYqLxd43egGck3v940OToGLW4xLSOOdtDxRVs70WfNq3x8HSA6PwPPil6z2uOs
qE2Oy1VguD2Aj2FhOa3vGUG7BzM/xTnM/8602wrsT9c8U0oWdyOBI0HQPBPXpjmn
ARNETUmKjJcxbEtHEHFK1PhhBE1oN2SgFN850LtfPh7ncNiuGjrUpcqgz3tZF65V
ADzM+o6UWRW6E+LGBfD2JCpPpK7h0/Heocj36dIAI6rB3Ipb093ZaN9rTwExWKED
qvQH3LdQVaP9q/e+Rxz53/jpejKOyYKXXi2eSahfZa5w4dF4+/pUJUgZG42SIwv8
TGihcfDSuLfhFpR/+Kf/mAEzQeVHx5BNHMcF+/DAAAD7/6jzjvGqXgl+F0XkNW4B
aoXVFK2U7zaXlNMUzGkF
=MoE7
-----END PGP SIGNATURE-----

--weephzeRde4EOwAc--
