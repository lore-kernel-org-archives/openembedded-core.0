Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 04FB46E672
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 12:51:52 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id t71so2299984ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xAd6wBFQhc5VWq5LAmpZFudH9WC0abMxascNSF1UDJM=;
	b=DRfFk4Y1wzdYE/d1V/2dKuXSA87bPaKyRNENor/id179Mpnt/oL8Gc1al1fVUVlMEw
	cdcCBSmAbpxPN1vR8LnPBX3VidBx8bgoI4srm+wXERFyWYHg+JKgJa3d6Zn3NZvH8B9i
	dv9gWSwFbLHqa0iC3PCXQWafL6LmU1B/oULrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xAd6wBFQhc5VWq5LAmpZFudH9WC0abMxascNSF1UDJM=;
	b=F8geCBLMpvUeRn/YOSlhsjZBhCyhDgptt+AXgnAuSduvMrbKjUsA+lWN7tVY4pqQJo
	9tHO2627YrAUXxX2BX2JstKp8jGEm98y3MW/wKCfcJ2Uhs3eyVCMeoDwNUBThzvoBnNB
	Z9JBu0B28sM7iICUbPa1eWOgoh34Nnf6We6wIFIi3XrNKv5X1X5oLFGkUhL7JS4Aqu2g
	/0ZYipSIw6CIyT3Cu7dj5ph0WBQsoVdEZI/fCfDCFD6BSym6b7zZgPR2ipmavanatSei
	aop6zx1kRbW78uC29VyYPtvKXW7Q/qkxXWXNzFLACJTX1ZZLlYEMDCBx8e46PiJuiqxK
	HN6w==
X-Gm-Message-State: AMCzsaWlomxShcI8Aola893M+glOl04oQI3ucd6anP8xJTGmD2RrJD8w
	ItOOJ6uyg048eM5xje5gWjkaDmVPHHA=
X-Google-Smtp-Source: ABhQp+SDPWNkpj8bmH5fzOVQbWGRVvmlqfSWedxAJ8lGJIZOyRFBRDx0q/lem3kITlpcNwazRvSSPw==
X-Received: by 10.129.141.20 with SMTP id d20mr4449386ywg.105.1509713513688;
	Fri, 03 Nov 2017 05:51:53 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	b11sm2591867ywc.84.2017.11.03.05.51.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 05:51:52 -0700 (PDT)
Date: Fri, 3 Nov 2017 08:51:50 -0400
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20171103125150.GA32663@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20171020131505.GG12015@bill-the-cat>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Fri, 03 Nov 2017 12:51:53 -0000
X-Groupsio-MsgNum: 104518
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
> On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
> > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> > > When we have been told to use the UUID we should also update the fstab
> > > to make use of PARTUUID instead of hard-coding the device in question.
> > > This will make the resulting image much more portable.
> > >=20
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > ---
> > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> >=20
> > Where we did we end up with this?  Ed pointed out that you can tell wic
> > to use a specific UUID, so reproducible images are not a problem.  And
> > making images that are readily portable is why other distros use
> > UUID/LABEL and not device names as much as possible.  I personally enjoy
> > being able to put an image on uSD for minnow and have it work :)
> > Thanks!
>=20
> ping?

I was just reminded about the real problems this solves (swap isn't
/dev/sda3, boot is being excessively slow), so, ping?

--=20
Tom

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZ/GZmAAoJEIf59jXTHXZSX58QALMXi0RJXefAWNY9Va63vTUu
FdAhkWLUkVKcG2Y0OweBS/1WQUQcSgpqot0CVnjGxuvw1/vg8YZx9T4Pn2SS3kvD
4BIlA7cBdAN73lnpY5fiMX5UN6JIPbKDgTRxMlZPYpVocymxTtto1UAKFjjfi4cD
h9WUmbPAuUtC8sByWw2uBjvLqCMuBdVbY7ifQ8/6oUEJcOEG50cVIiuml0PkgV6u
vEVYUT3v7dMylvOSm2Pk3DJm5Lf51R4i4LOEtJmMlBB65h2auixSgwMJEq6+Nr9s
Q/KGQDrwSeID+IdJ0tVPWFcn9j5DzR1lPD+MhiVxNLFXe3ysqZDz33bB+E9O1l3Y
z77I85qas3A+3+dsP7HxUOg3I9Bl/lIqHq5mAx89DyHXfS4bylpU39aHwvbKQde+
Opjtpi/X0Ud/UlVctShELrgGWq2VxSvjArAfZE2CfAOWObl+LGRoB4BICYjP1U/A
iK+Sq/RzspwIq8S5Q1396FAtfis45WJJxGIk1CjwV5t23ogWp5Jx4YYWvvGlAG9G
lslKM7t49zLuXmeYNN3ib6YOiPJGDgW/DApeAqmdBog0x3fK7HkCoOQS8AtpVRfX
au7KbTBW7YqD0eaJsLzZtrp1gbJid5iL6FVHmaZ1QJ7yZlX+jjCEl68BXlSoCzJw
eZscQN9Yt1XjFbPfnOme
=QqOi
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
