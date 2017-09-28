Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id BE44F60125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 17:59:11 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id o143so1571522ywd.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=h8q9I/9UfFz5K1NwOvqWl1DX7PO5sqAPcbVJ2VOPcHA=;
	b=OceEbrzBYeI5JZuVT4qQrqct+N3+WcpHu+8w1s5CbfMyp8mIrcpm9LFBWlZXbolsTI
	sX3sXjIU3dDFXAOEhccm28zsfA3A2WGuEgv8pTbzCAp3JgDh7swzB3yS45Hj7ilTanKT
	3xFt+pWekDFtdAwWffvg7WA6YbfiOiGZXsurs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=h8q9I/9UfFz5K1NwOvqWl1DX7PO5sqAPcbVJ2VOPcHA=;
	b=Dj2q8+EDv6UFREmpY/4u+cvNtaIeurMDxJLMy8T/ibq4HnCRwma5MMPkQPf01MD4dt
	KwHExCnCjEhIC+rYcmzSZOTcyLddwM6IXss1ikXG7EEyFvDz0M3b0c8R7Ri5JTxfQX4x
	8PYA33OHZPM2m2hhNTzhdF+v7AEapJhxYYIloz70lHiiRHCA22x30TqzUsFjuv4AAneB
	bbJDhn1faauA9Dct9wD3Yao4Eg3elIkpwKVi9MogyUJ0/sXa42wHwj9rIk+vATcoXXFk
	HnlrGyq68JI0z3JxPq3AYDZRJgkiG7jDwtHdDh0T6CJS6Y/6koMzv8qqh37gGGnPbU98
	if/g==
X-Gm-Message-State: AHPjjUiEbdfI6dEzvvM+B/loO4n8jOyFNkSSg3TdziP+1o3VgLS2+VBl
	K6b7zntGHAFDMBHlrEtIroVvXaaCnzY=
X-Google-Smtp-Source: AOwi7QA9aaci7pKvA2Wt52o+JAW6Zsua1+/A1gELCJbkkSIdjrmmkhiui6LralvUbFYEiJqGtmaw1Q==
X-Received: by 10.37.63.68 with SMTP id m65mr4000971yba.76.1506621552863;
	Thu, 28 Sep 2017 10:59:12 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:706c:f3a8:eab4:3cc8])
	by smtp.gmail.com with ESMTPSA id
	h129sm799044ywb.67.2017.09.28.10.59.12
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Sep 2017 10:59:12 -0700 (PDT)
Date: Thu, 28 Sep 2017 13:59:15 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20170928175915.GQ3112@bill-the-cat>
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
	<20170928154707.362zfbhccbydkdox@linux.intel.com>
	<20170928174429.GO3112@bill-the-cat>
	<CAP9ODKrACBBvDGYSMUW1mv=UxMUUOnwK9k5g7d6rEL=Mdm3wuw@mail.gmail.com>
	<20170928174942.GP3112@bill-the-cat>
	<CAP9ODKrN8R_BpNobDUQNw33vEeQVJKF7g9mGK3-m=TUiyRukSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrN8R_BpNobDUQNw33vEeQVJKF7g9mGK3-m=TUiyRukSQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Generate startup.nsh for EFI cases if none found
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
X-List-Received-Date: Thu, 28 Sep 2017 17:59:11 -0000
X-Groupsio-MsgNum: 103474
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qUZ+4mk6dr19Czgg"
Content-Disposition: inline

--qUZ+4mk6dr19Czgg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 02:57:04PM -0300, Otavio Salvador wrote:
> On Thu, Sep 28, 2017 at 2:49 PM, Tom Rini <trini@konsulko.com> wrote:
> > On Thu, Sep 28, 2017 at 02:46:23PM -0300, Otavio Salvador wrote:
> >> Hello Tom,
> >>
> >> On Thu, Sep 28, 2017 at 2:44 PM, Tom Rini <trini@konsulko.com> wrote:
> >> > On Thu, Sep 28, 2017 at 06:47:07PM +0300, Ed Bartosh wrote:
> >> >> On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
> >> >> > In the case of non-wic images there is logic today to generate a
> >> >> > startup.nsh file that will be executed by EFI to run the loader t=
hat the
> >> >> > image contains.  In the WIC case is currently depends on that fil=
e being
> >> >> > generated elsewhere and placed in DEPLOY_DIR_IMAGE and only used =
if
> >> >> > present there.
> >> >>
> >> >> What's wrong with this approach?
> >> >
> >> > No one ever provides a startup.nsh and everyone that wants one creat=
es
> >> > the same one line trivial example.  The end result is that no WIC im=
ages
> >> > are Just Bootable on UEFI systems unless you first go and spell that=
 out
> >> > as the desired booting device.  This isn't an awesome workflow which=
 is
> >> > why the non-WIC cases make the required startup.nsh :)
> >>
> >> I think it could be done as we did for u-boot-extlinux support.
> >
> > That's complete overkill for a static one line file.
>=20
> No, it is not. It allows for reproducable builds.

Either solution would allow for reproducible builds.  Perhaps it would
be clearer if the patch just always generated that content instead like
the systemd and grub2 classes do?

--=20
Tom

--qUZ+4mk6dr19Czgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzThzAAoJEIf59jXTHXZSlnwP/34r9nLG0mon4UqAR4wXQBL0
2pjMdnHvPoqQ0c9yHdBurzihclFf4ZrDRHTUdDGhqBBn9NveKDuHXPH9SC94fUZ5
6LOlzaHqiRzfytRtDNEiyTvcFeT59YWm5vxe54EQGyBsEd04rFz8VtLPr0n/WX2Q
5Xbl1pzCGRgpE2EyES6z5BZXJgmMFTIisG90iWpkIRszWpriTCQfziheJJmU4G+D
QCjnlL3DMgUX0+h8C/xOq8xJmVPiqe1PomvYrvmN+0J8ug764KIfzSGrWMRl2ag6
E9RgmLNqezhW7p9QLO2Q9cNViN03CtiZYZHEjMbY27SCAz0MFBQvPgqOg6gvISu2
CXBLGi0R2gmJGfXxWq8w1URn6E+TfLyNPQfwo1HcqRXFkUfyKX+XtUUIbINT9jYd
u7vO9l9wdMEHSG+spALqD3p9hHUadDLjeJScO01El5K79zX2w3sp7glsn0PCwWAk
CGc8wspRJ/R4Df1yPT07+tIirmXkMlrdzosnqNw9R6PGPWC2dkMXF5eiqe+Pa7H5
FXAqJ8WLTSkHnA5/eTL3Z7PpXHZPO1+rtB5WEkSlgISw6nXTHRndJwMYDiSqmew2
j4Motj/zhCFDq70pnirLzyb37JgGE1hBJ6BppbBB02dZ7xIgfFrABMaPpfaRnvBx
GG300KGfpr/Cp7JtMDVN
=rxxP
-----END PGP SIGNATURE-----

--qUZ+4mk6dr19Czgg--
