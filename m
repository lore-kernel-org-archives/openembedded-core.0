Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.23812.1600266607922684707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 07:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e32PgO9W;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id i22so10665965eja.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=59HBdNU7B+Xo9CNugwfHOVSO0ChS26N7KAgMBquRD/w=;
        b=e32PgO9W82mvYtHJD2uwBs/RkJDq2aLeoXrP8wz3PRZZXR2hKI3OqkpjTSZ+9BEj9n
         35r8tl362OU6HNxeixBVlRJUam4owp2hYNdP/EYORANwK/MwA8FadPoWhJ1nVmXuPs8D
         tpi7VIW2JwC0KJ8ZMOZT+3r1p2tCWUVFSfgWJ0H3uWXjL0o2AZArlagfr0qaQop92tB5
         dBe65wX6Bk7OxkRC5m6GFvT8Jc5XA2pvSS70e3EgfcXSD4BZzHojQptV4TzUPk4nhiaE
         n9Xch9GfQQQSPIKYODF11I4ITe0Y5sSTpZmc0F6kGqNzt7tLrdk3PlRmk8R5Y6hTSAHT
         T3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=59HBdNU7B+Xo9CNugwfHOVSO0ChS26N7KAgMBquRD/w=;
        b=t3/CSRCG13vQtae8CsejB2Mvt6oyEQkWynNVTRMkeppFXfvmRVyIWntAHtfPRxs+x+
         s3Sf1Tm0SgD53UNvSEe5drrWyyXrOP2asIlw0+jeY9gNwfX+drxFalTric1pBKy66q2r
         woxQvtkK8zk1dI/6gvlAADL4Md4ezNc+HdCB2DQfysmGOv1ukxcVX9g1BZM0c5NIaKzW
         sUoxvtMWex7+LKpS+C1KdzAtqFzubwd+fLdoMzT6xJK5DYrCptTEhAKDtQfhJ/iNjIEX
         fzR60NJJGCRIkaxaOudvIl/4rR0Ei+4lhym4hLV6Xv9WQ+V27tNwJc4/4elXsCdKSOev
         OyeA==
X-Gm-Message-State: AOAM531hL2UTQNBi609Pt8YOfiusXqzJtkW0tjn5V9uzVAXFpLqUNhAP
	4CTeUTCEaaisW+7IOpJeQGRDSYXsXek=
X-Google-Smtp-Source: ABdhPJyD3a6CAdkBkhIpZzWVz1aOREknRWN7A6f7zF8dagRFvjtN7vstPsUd1eFHu2Gyc92r05SpDw==
X-Received: by 2002:a17:906:2dd:: with SMTP id 29mr15085803ejk.31.1600266605963;
        Wed, 16 Sep 2020 07:30:05 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o3sm14367250edq.63.2020.09.16.07.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 07:30:05 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Sep 2020 16:30:04 +0200
To: Jon Mason <jdmason@kudzu.us>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
Message-ID: <20200916143004.ane4vsenrojbemke@jama>
References: <20200914151359.11240-1-jon.mason@arm.com>
 <8c3f76c48201397cc3f90fa89cda85a4fa739b76.camel@linuxfoundation.org>
 <CAPoiz9yVTQAH2WJbVdbfED6r1EWKfaAnfRjSLbrcCzJL7og92Q@mail.gmail.com>
 <c8e4bad572b1305b1b1a15b96643aeafe2272f6b.camel@linuxfoundation.org>
 <CAPoiz9w55vmv+TPB69CFc_Js_qfBRk63EQ9q3kZ8j-xGaFmjZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPoiz9w55vmv+TPB69CFc_Js_qfBRk63EQ9q3kZ8j-xGaFmjZQ@mail.gmail.com>
X-Groupsio-MsgNum: 142616
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b63msbsv55ilg7zf"
Content-Disposition: inline

--b63msbsv55ilg7zf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2020 at 10:25:49AM -0400, Jon Mason wrote:
> On Wed, Sep 16, 2020 at 9:49 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2020-09-16 at 09:45 -0400, Jon Mason wrote:
> > > On Wed, Sep 16, 2020 at 9:26 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Mon, 2020-09-14 at 11:13 -0400, Jon Mason wrote:
> > > > > There is a large number of Arm Tune files located in
> > > > > meta/conf/machine/include/, and to support the current and
> > > > > upcoming Arm
> > > > > cores, more are needed.  Adding more files is simply going to
> > > > > make it
> > > > > harder to find the relevant ones for an OE/YP
> > > > > developer/user.  Also,
> > > > > there are problems with stale and erroneous configs (see my
> > > > > previous
> > > > > series), which will only be exacerbated by having more files.
> > > > >
> > > > > I am proposing a reorganization of the existing tune files by
> > > > > including
> > > > > them in the generic family include file.  For example, the
> > > > > tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
> > > > > tune-cortexa57.inc would be moved into arch-armv8a.inc.  This
> > > > > reduces
> > > > > the number of files from 12 to 2 for ARMv8a, and that is
> > > > > excluding the
> > > > > 13 I am adding in this series that would otherwise be unique
> > > > > files.
> > > > >
> > > > > To use, simply add
> > > > > ...
> > > > > DEFAULTTUNE ?=3D "neoversen1"
> > > > > require conf/machine/include/arm/arch-armv8-2a.inc
> > > > > ...
> > > > >
> > > > > Which is arguably what should be done anyway (instead of taking
> > > > > the
> > > > > default of the tune include file).
> > > > > See the qemuarm64 patch in the series for a working example.
> > > > >
> > > > > Of course, by removing the existing tune files, current users ar=
e
> > > > > going
> > > > > to break.  A simple script can be written to use sed (or similar=
)
> > > > > to
> > > > > replace the relevant parts for those users that would be affecte=
d
> > > > > (at
> > > > > least for those that are in the layer index and update
> > > > > regularly).
> > > >
> > > > I've just looked at this in a bit more details and I'm worried.
> > > >
> > > > The intent is the BSP includes the processor/core tune file that
> > > > its
> > > > based upon. The BSP should usually know which one is present.
> > > >
> > > > That tune then presents the possible options which the BSPs select=
s
> > > > from but the end user or distro can override.
> > > >
> > > > With this change, you get all tunes and you don't know which are
> > > > compatible with a given core/processor. I'm not sure that is an
> > > > improvement.
> > >
> > > Before you were selecting an A75 inc file (for example), now you are
> > > specifying an ARMv8.2 inc file and saying it is an A75 from the
> > > available list.  Either way, you needed to know which core you were
> > > running.
> > >
> > > In addition to this, you have the ability to run the generic default
> > > for the family, which will work for all of them.  And for ARMv8, eve=
n
> > > the more generic armv8 will work for all of them.  So, there isn't a=
n
> > > incompatibility problem.
> >
> > You should have the ability to access the generic tune with either
> > approach?
> >
> > > > I appreciate not wanting "lots of files" but we need to consider
> > > > the
> > > > usability too.
> > > >
> > > > As others have mentioned, the errors are fairly obvious with diff
> > > > between the files (or a GUI like meld).
> > > >
> > > > What are the advantages this brings other than fewer files? Am I
> > > > missing something?
> > >
> > > This is the main benefit of it, TBH.  If I add 25 more arm tunes,
> > > it's going to get ugly.  And if Arm keeps adding cores at this same
> > > pace every year, it's going to get even uglier.  However, I'm fine t=
o
> > > send out those patches if it only bothers me to have so many files.
> >
> > My worry is that the current system:
> >
> > a) tells BSP developers to select their processor, not an arch
> > b) only shows them tunes that work on that processor
> >
> > So we're changing the model, but only for armv8XXX. This is going to b=
e
> > confusing. I do like only showing people things they can use too.
> >
> > How about we split the difference and add the new tune files into
> > subdirs by architecture?
>=20
> So it would look something like
> meta/conf/machine/arm/armv8.0/tune-cortexa57.inc
> meta/conf/machine/arm/armv8.2/tune-cortexa75.inc

This additional level will still force all BSPs to update the
include/require line in MACHINE configs.

> And inside of those, it would reference
> meta/conf/machine/include/arm/arch-armv8.inc or
> meta/conf/machine/include/arm/arch-armv8-2a.inc (just as it does now).
> Correct?

Isn't this enough to see which tune-coretex* file belongs to which
family? (e.g. git grep arch-armv8-2a.inc to see all available tune files
from armv8.2a family instead of armv8.2 subdirectory)

> Assuming so, does it make sense to try and match this with all the
> other CPU architectures (e.g., x86, ppc, mips, armv7, etc)?
>=20
> Thanks,
> Jon
>=20
>=20
> > Cheers,
> >
> > Richard
> >

>=20


--b63msbsv55ilg7zf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCX2IhaAAKCRA3VSO3ZXaA
HGVzAKC2qew4nxPz6yyliY4uPuHBTUhULwCcDnOvbLPlx7LgV0i8oSwuOs3e3o4=
=5r/U
-----END PGP SIGNATURE-----

--b63msbsv55ilg7zf--
