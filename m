Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f175.google.com (mail-yb0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 695D474955
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 02:03:05 +0000 (UTC)
Received: by mail-yb0-f175.google.com with SMTP id o80-v6so5869918ybc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 19:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=l9y5I5IvfjMn3vWFhvVD7GBRELpthUjzveS2TbB8/Ww=;
	b=sKnXUP9W1gLlEYVXlbvHP4V1E7IH6SSfmWi3cFwH7Mqn+2/H1yTmZxK4sVGKBw5dzA
	DuXEJZwPBRVMzjYvuc8UE9xZdeEaiteXKGDT3jUrlDxH6lra+bwe98YvRmiqzNt6rz5e
	w3BrxeQqH6wR3dPzhvqvdKW0x5FJ38e36SabE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=l9y5I5IvfjMn3vWFhvVD7GBRELpthUjzveS2TbB8/Ww=;
	b=HX+D1xCQYwhKdTtLijkiLWsDdQGUfg4q5f4xwdDhbYuRNtnvdpyjBAlUrM2AYZAh3q
	9e3djLCsf4EkpDLNbuKDfaFMbxzRymEQFhVM8zEWrYP2GxkW8Ank5gy9aiQX1apa9jOa
	1MtOjBILYWeuuMIoTJ/a2g+eTAGefp9RYHcriH97ph8WVWmG2c6eekzfTvco2TGqlHLl
	EqwxQXkB+jtcFZ7lwoVXMrZ+/wWIrkNuOg5WWdYhn0LoawnG1AxCAq8ULi20r4kx5zPg
	2Bcw/6WFWwGEO+HpU6CdKqvmD9dipdryV+W0bPyTpMCLzjylqtamhRvnBOGnlEr+C93f
	TtuQ==
X-Gm-Message-State: ALQs6tDKU0XgHa/5pRBRFFmCKT9pfGWfBjwOAnWg0gtfpmUqQjmZw98m
	8IvOXKyfIu6U23fEOGM4G8oXwA==
X-Google-Smtp-Source: AB8JxZo4wAXDN6fVjzB8I1uKYGWTIYGmIOsV8iChAGBvhMEibdOcmV3LSDPmMH2f44VQsMd5EVa8CQ==
X-Received: by 2002:a25:9704:: with SMTP id
	d4-v6mr16033997ybo.525.1525399385981; 
	Thu, 03 May 2018 19:03:05 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	u207-v6sm7286305ywu.25.2018.05.03.19.03.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 May 2018 19:03:05 -0700 (PDT)
Date: Thu, 3 May 2018 22:03:03 -0400
From: Tom Rini <trini@konsulko.com>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20180504020303.GE12235@bill-the-cat.ec.rr.com>
References: <CAJTo0LYUEgJgU03xxhi2ke3SspsEs0_JPcX4yiBaVbF6p-saUQ@mail.gmail.com>
	<1496838489-25242-1-git-send-email-ed.bartosh@linux.intel.com>
	<1496838748.6630.214.camel@linuxfoundation.org>
	<20170608004333.GH10782@bill-the-cat>
	<CAHUNapQXxNY1473299BoPKPcKz8Uja9UXpdxnv1hXpYpkGBdJA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapQXxNY1473299BoPKPcKz8Uja9UXpdxnv1hXpYpkGBdJA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH v2] u-boot: enable dhcp for MPC8315 board
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
X-List-Received-Date: Fri, 04 May 2018 02:03:05 -0000
X-Groupsio-MsgNum: 110969
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 10:01:54PM -0400, Trevor Woerner wrote:
> On Wed, Jun 7, 2017 at 8:43 PM, Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Wed, Jun 07, 2017 at 01:32:28PM +0100, Richard Purdie wrote:
> > > On Wed, 2017-06-07 at 15:28 +0300, Ed Bartosh wrote:
> > > > Getting ip address from DHCP server is much more convenient
> > > > than setting static ip. It allows to configure u-boot in
> > > > more generic way and to avoid hardcoding static ip in
> > > > u-boot configuration.
> > > >
> > > > Enabled dhcp client functionality for Yocto reference
> > > > hardware MPC8315E-RDB.
>=20
> Is this really something that should be part of the oe-core recipe? This
> looks more like something one would find in a BSP layer.

It was since it was needed to make this reference BSP slightly more
usable.  It's since been merged upstream.

--=20
Tom

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa679WAAoJEIf59jXTHXZSF+MP/RvTsHiz3StJKzjIs6dOcTyK
W7TYuHOXXZnB2f7Hx4UUWQKtLyLqskvrudX6YtOXWN4g0nstDn57kg7No6QgXDWT
/+IbDykGpq4bHxTXUO92urfoKCQEcpRP4ApLQFX0XL1qAhRkitlXctuZORxddJOV
svUEwmnHLHv797JEjLF2VmLknUtOgukwZgJQp6SZ75fNvLAU7kDw7WWnzkLUrLdi
IkHFE1HjcMQxqKRMeO88Q5+nVIyrj3kmGfQtxdAVnOY2dYOPetoJU7p2Asecxoyq
8oDhHbqrW3P//Y1sfhF3m0yMibwpP2ARH1xeIS9dVfmVSsALZ4xceRW2gYGe0h/R
tFFk+0Ti7U2PtotucvaZxCTHBFSPg8QGK1XpSf0P6NLZ2/YhssqMSYNNcCM8z5rV
UwhLSujbFlHPzyM5g+s+BDnHaLQqLMBouz8i+Rab5g8rb7qabJwesSnj3qyVpWtl
8JOMSSQ7+Mxb0TA4qDiwKTYH4jqkNq4+GUAPO1YYh+4DYmQafwLwN99hvf3a+oVi
BB5o0M4lqU3zmyNbwoqVRvQBEguWh0tg3eQfdB+fbVI7pS7YU/L4X+zdRW4ZOlyb
HI9pTAZUt6tD/cnW2KoEDxVMHCIj9cwsWnH7O6sGBe0aHtFQyIMU4W6wjEXHaVuW
A6cC1L25289VfxwetJwv
=t/Wj
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
