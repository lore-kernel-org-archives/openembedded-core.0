Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1A87D0FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 13:33:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so11198718wro.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 06:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fmxOaWqSWFNcPp/KxLkyMEQSLYw/rexuZRVCEcZfSz0=;
	b=Di179WshwX1pfb81j8eYPgvCRTilmtGGZm6Ijq7pwYjpBGX1zLwnXZrcQ/f8GIpk9I
	PR733YsjB+Gq2xAI8PrNxw+h4yqXY8Kwkv3R7zJRLv8kvFLM/G6UWOAmxvCdSeVnZY0T
	Xm4RLOe/VY2fkcqBssJZFkg3KZjcDs30f1VKjBynNA1WNBG3wwCsa8tKv0iEwXc+cn7Q
	bnbFGGp1A7sWXaYt2Q7TzqicoVGoAAB+SgqVzZha23VLfohsZpGGuALKCUQtOSYG17H+
	g3B3szjJCuZmySR4Ng4pPcTm344CCoBxqqDc4HH3neUUJGwiYSBjNPyAbCFlH66kb0wf
	BlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fmxOaWqSWFNcPp/KxLkyMEQSLYw/rexuZRVCEcZfSz0=;
	b=IAOn3dscC+UTh8mqVIyGkJ07RKbf4efJrNZZPn99KQU72vEAZTanUQOd59ggNgtmZr
	oj2qSw9MFjcbXQWg9su9KlZ4Z67N7l5n1VszKWsbR9FbMkjn6QR/9cCwBL3xrdO3Fxdv
	lcPeEH3ZDxg/vKzGVxNfD8CHzu27ljFBBoJqJfVVfkYX5gaF5bsUxBSjO1UtMue77AeL
	txJpyg1M5geDlD53kJXvFP04/kUQUI/t7/r1VyRlyyyi3XyGF0V24kMsbF0FUjt6fIhR
	GcMnCwcZ0QVR4jmDtCV2SO4zjnW4E/2CkW7tVKfxRIS49e1y6+S2hds+4UCqK9E1gm7X
	xEGw==
X-Gm-Message-State: APjAAAX2HUX0im1a4gI6Gb6knXLqdPnJce3PY8sB/cYlUilkzhLsFA/a
	OA9fTEXah5CD+4hc/OhIwqU=
X-Google-Smtp-Source: APXvYqzqz+w627oa7oaL/Fc/iwIXCytRVLTuAsdJAr5AdzzPfahdaJIRPXM2X8DwleHZZbRSEk8b4w==
X-Received: by 2002:adf:f050:: with SMTP id t16mr23291640wro.198.1553693596271;
	Wed, 27 Mar 2019 06:33:16 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id h9sm22577wmb.5.2019.03.27.06.33.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 06:33:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Mar 2019 14:33:14 +0100
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190327133314.GA1598@jama>
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
	<CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
	<20190326102017.GA1929@jama> <20190326104212.GB19885@localhost>
MIME-Version: 1.0
In-Reply-To: <20190326104212.GB19885@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Wed, 27 Mar 2019 13:33:16 -0000
X-Groupsio-MsgNum: 122649
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 12:42:12PM +0200, Adrian Bunk wrote:
> On Tue, Mar 26, 2019 at 11:20:17AM +0100, Martin Jansa wrote:
> > On Tue, Mar 26, 2019 at 10:00:52AM +0000, Burton, Ross wrote:
> > > On Tue, 26 Mar 2019 at 01:39, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > This isn't a git snapshot recipe but a release that is fetched ov=
er it.  For
> > > > > clarity, put the PV in the filename.
> > > >
> > > > I think its better to keep it as it is. since its easy to trace git=
 log history.
> > >=20
> > > So should I be renaming gcc-8.3.bb to gcc_http.bb?  If the argument is
> > > that the filename should contain the transport protocol and PV is
> > > embedded in the recipe so that git log is easier, we should be
> > > applying that rule consistently.
> >=20
> > FWIW: I agree with Khem.
> >=20
> > http fetcher won't (usually) fetch different version just by changing 1
> > variable inside the recipe and vice versa, renaming the recipe won't
> > fetch different SRCREV with git.
>=20
> Why should the name of the recipe depend on whatever fetcher is=20
> currently used?
>=20
> If the same gcc release would be fetched from the upstream SVN,
> would you argue that the recipe has to be renamed to gcc_svn.bb?

It's quite common use case to override SRCREV outside the recipe (at
least during the development) to newer SRCREV or even AUTOREV.

Using _git or _svn in recipe filename was good indicator that this might
be happening.

With e.g. http fetcher the PV is usually used in SRC_URI, so it's less
likely to be inconsistent between what version the recipe (and enduser
visible packages) say and what is actually downloaded and built.

> > If someone wants to update SRCREV in libcoms to be 10 commits behind
> > 0.1.10, is he expected to rename the recipe back to libcomps_git.bb and
> > re-add the PV variable (with new +git${SRCPV} suffix)?
> >=20
> > I got used to "+git${SRCPV}" being dropped when the SRCREV matches
> > exactly the git tag, but renaming the recipe and removing the PV seems
> > too much, what is the benefit of doing that?
>=20
> Is it actually a benefit to make it easy to switch from a release to=20
> some random git snapshot?
>=20
> This is not something that should happen frequently.

It's not about easy switching, it's about making sure that SRCREV is
updated at the same time as PV. Which is easier to notice when the 2
variables are set next to each other, than when PV is taken from the
recipe filename and SRCREV (which is the only one which matters when
downloading the source) is set inside the renamed recipe file.

> > It's not for clarity or
> > easier maintenance (at least for me), because PV next to SRCREV makes
> > much more sense to me (and helps people not to forget updating both at
> > the same time).
>=20
> There are not only developers, but also users.
>=20
> It is valuable to see from the filename whether it is a release
> (and which release it is) or some VCS snapshot.

That's why bitbake shows not only the filename (which isn't really
important for users) but also the PV set in the recipe (either through
the recipe filename or through PV variable set inside the recipe).

> Not having the release there also loses the ability to use either
> gcc_%.bbappend or gcc_8.3.0.bbappend, which are suitable for
> different situations.

There is usually just one version per recipe and even with _git.bb
suffix you can easily do gcc_7+git.bb and gcc_8+git.bb if you need to.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJt7mQAKCRA3VSO3ZXaA
HM+eAJ0cxqQ+tfY6Y0KzCxCAI/x1/jOw3wCeKtVKDZ2o2QqcRovBhE0zastJepA=
=Cqrg
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
