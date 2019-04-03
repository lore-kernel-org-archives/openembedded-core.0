Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 807FB7D2D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 00:45:54 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v32so17310168qtc.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 17:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wwMcG1UiAvWFETUamd3jk0TcCtSqnVC0SBSKTelaBmA=;
	b=fMLepZyfInpxGH6tC0cIczS5lgNsZv6cC+TIsFjPggKBKdh2qibybfAvEpKBKpu/3q
	4Cruw1vf2N//QIjK81EqikuSxqkbmDUgQd19jkYbzVaDACc9Oz0qIvZuA2plF6GZdqh7
	0kXpzEH4EoPLvmATc6KC/7BQeOFY1HXvOg8So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wwMcG1UiAvWFETUamd3jk0TcCtSqnVC0SBSKTelaBmA=;
	b=t5PkaaPXoS+ZNLKqF6dBceZ68UAj9wtFdBY+NTTnSRKWoaJlKbHBTPXcSSiK1EhGbD
	szpWNnQoJtmuxAjo0Fiq47H97yTWqkEAi3Cs++FaIi2cDR/0AzTJqJiHudpqWjkk+X1a
	qWz8s7mYrZAYMC0RANMSTGJk3sByua0VjvphzTo7TIWSR1fn2Wa1gX6hfHL19VIjZ7fI
	1RnpzbSPjTecTcoKoX7/Oq1fCxuTfDHcByEj48WXZW+Zi9K7+3IJrZTER0m78nvASai7
	MFeyYywo16WoAJvQ7XY9tEEeVemQMMPh6Qktz4oKS4ets69qE1qk5TsZmWhnIGyaMAgt
	wJOg==
X-Gm-Message-State: APjAAAVoVu0iXqKF82iI9B/Fq/XJRmVwMuzkXnwEXopNRgvghmT+bp8p
	yP37mPihNpz/KyszGUEhPuxgnQ==
X-Google-Smtp-Source: APXvYqw8jZ3TDeEgLJ/eK3JYpgCsXNJyoHAkHL/gctH3A9nd2IB488x+cOKPr7jJyg02t1XuImUVLQ==
X-Received: by 2002:ac8:5493:: with SMTP id h19mr59561983qtq.23.1554252355043; 
	Tue, 02 Apr 2019 17:45:55 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105]) by smtp.gmail.com with ESMTPSA id
	z20sm8202506qkb.52.2019.04.02.17.45.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 17:45:52 -0700 (PDT)
Date: Tue, 2 Apr 2019 20:45:50 -0400
From: Tom Rini <trini@konsulko.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190403004550.GB4664@bill-the-cat>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<6068e963-94c1-7225-2c60-9ae027c74639@windriver.com>
	<CAPoiz9yat-4XRgSFikh5PxrsgVpRAWNi2dx1O0+_iHyVR529Ag@mail.gmail.com>
	<20190402194738.GZ4664@bill-the-cat>
	<56e2b936-177c-7066-99c0-bb46854daa4b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56e2b936-177c-7066-99c0-bb46854daa4b@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Git commit process question.
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
X-List-Received-Date: Wed, 03 Apr 2019 00:45:54 -0000
X-Groupsio-MsgNum: 122964
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NctWKJLgDreUm1FS"
Content-Disposition: inline

--NctWKJLgDreUm1FS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2019 at 02:24:51PM -0700, akuster808 wrote:
>=20
>=20
> On 4/2/19 12:47 PM, Tom Rini wrote:
> > On Tue, Apr 02, 2019 at 04:45:16AM +0000, Jon Mason wrote:
> >> On Tue, Apr 2, 2019 at 6:41 AM Mark Hatle <mark.hatle@windriver.com> w=
rote:
> >>> On 4/1/19 6:20 PM, akuster808 wrote:
> >>>>
> >>>> On 4/1/19 4:02 PM, Richard Purdie wrote:
> >>>>> On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
> >>>>>> Hello,
> >>>>>>
> >>>>>> I have noticed a large number of git commits with no header
> >>>>>> information being accepted.
> >>>>> Can you be more specific about what "no header information" means? =
You
> >>>>> mean a shortlog and no full log message?
> >>>> Commits with just a "subject" and signoff. No additional information
> >>> If you can convey the reason for the change in just the subject, that=
 is
> >>> acceptable.. but there is -always- supposed to be a signed-off-by lin=
e according
> >>> to our guidelines.
> >>>
> >>> So if you see this, I think we need to step back and figure out where=
 and why
> >>> it's happening and get it resolved in the future.
> >>>
> >>> (Places I've seen in the past were one-off mistakes and clearly that =
-- so it
> >>> wasn't anything that we needed to work on a correction.)
> >>>
> >>> --Mark
> >>>
> >>>> We tend to reference back to how the kernel does things.
> >>>>
> >>>> https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml
> >>>> These two sections in particular.
> >>>>
> >>>>
> >>>>     2) Describe your changes
> >>>>
> >>>> Describe your problem. Whether your patch is a one-line bug fix or 5=
000 lines of
> >>>> a new feature, there must be an underlying problem that motivated yo=
u to do this
> >>>> work. Convince the reviewer that there is a problem worth fixing and=
 that it
> >>>> makes sense for them to read past the first paragraph.
> >>>>
> >>>>
> >>>> along with this section.
> >>>>
> >>>>
> >>>>     14) The canonical patch format
> >>>>
> >>>> This section describes how the patch itself should be formatted. Not=
e that, if
> >>>> you have your patches stored in a |git| repository, proper patch for=
matting can
> >>>> be had with |git format-patch|. The tools cannot create the necessar=
y text,
> >>>> though, so read the instructions below anyway.
> >>>>
> >>>> The canonical patch subject line is:
> >>>>
> >>>> Subject: [PATCH 001/123] subsystem: summary phrase
> >>>>
> >>>> The canonical patch message body contains the following:
> >>>>
> >>>>       * A |from| line specifying the patch author, followed by an em=
pty line
> >>>>         (only needed if the person sending the patch is not the auth=
or).
> >>>>       * The body of the explanation, line wrapped at 75 columns, whi=
ch will be
> >>>>         copied to the permanent changelog to describe this patch.
> >>>>       * An empty line.
> >>>>       * The |Signed-off-by:| lines, described above, which will also=
 go in the
> >>>>         changelog.
> >>>>       * A marker line containing simply |---|.
> >>>>       * Any additional comments not suitable for the changelog.
> >>>>       * The actual patch (|diff| output).
> >>>>
> >>>>
> >>>>     - Armin
> >> There are existing git hooks that can be used to detect and fail to
> >> merge patches like this.  For Linux, I have the following in
> >> .git/hooks/pre-commit
> >> #!/bin/sh
> >> exec git diff --cached | scripts/checkpatch.pl -
> > FWIW, over in U-Boot land I do:
> > ./scripts/checkpatch.pl -q --git origin/master..
> > as part of checking things prior to pushing to master.
> Having hooks is fine but after the fact. It puts the burden back on the
> Layer maintainer to resolve. If we think more info is better, it needs
> to happen at time of change submittal.

Note that I'm not talking about a hook, I'm talking about what's part of
my CI process.  And when something pops up there is when I grab the
patch in question and push back on the submitter.

--=20
Tom

--NctWKJLgDreUm1FS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcpAI+AAoJEIf59jXTHXZSpM0P/1Z9ooTGT1JPJ+MmTxmPMur5
KQx9wu6dsP9Ckq4S3T8oig+6SdRQziZmcVLa7dXzioG33nBVysFZsPhpOScj0Z8z
1mpie6av/woMXqI+YPUB2W+l7Rkk9op3d5uCiqxYIdOEoVXmQJTvv+qThes8SpZM
37uAeZJKgR+UP10n4ChAMOHVM/q572WVNV/PjbY0z++I9hWA4vzaR2t18eRHEOed
7q8OrRg7TaaPaVszHrXgdXvBhtvGTyKPRBPikO+MAt1JF2w/fJlSxIM50t4pydVY
exAK348lv716XwhKADVztDtlln0a8Yzqz9huaVLgsDMSl8+TVr3xrriTCZ1MM548
46a81gbCVxe2nifkVD/62l+2AsUpdLq2ejhRGsJFUsZmLWZHnMuqi8bGktF2iPXv
UxQgrBlxRX++aTkJoegotq5CsYrZLzkKjCZGT1H05VnfO7KfDWY34eko7f5baJpZ
7eywswXcGNsbijMYppOI1FjyS9cM/ELCQZg/gqrqym6RQu8DDwaPuhQ0OVlxDUcr
yOasXk0n7Sw0/tV3nyjkh1wBGW/DpehZ9K4RfgjsbqqpIpdUhj1eI+LHb7HK+8bW
IcrTPMtTPAKjGrHTOxIhupDbnYAJxs4d7zkKt/ZKD6DAIOpWSN46+u5cWzJ4F4+8
8VEbSvhj9/O/Dvz4E6GX
=6nIq
-----END PGP SIGNATURE-----

--NctWKJLgDreUm1FS--
