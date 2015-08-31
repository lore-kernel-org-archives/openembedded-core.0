Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8D476E09
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 15:20:58 +0000 (UTC)
Received: by wibz8 with SMTP id z8so3770239wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dkL9e/VjyLJYzEDDcy0P6wIdP/QkR6YGKF142DUB6Yw=;
	b=kU5H++G6+6EBnoDI7wtSk2HquqKEtPPX1EduwpRoVbCH2kEjDoaqnu/8a3UKR0B3vp
	aeYsUi9p1680Z+0knTlRiDHCBkEW9ECTzi/Q9ijqRvdua93m5GjESS4V+SOskVuT8d9o
	5/WJb2UU0n1IJET6exRqBjZHEI0RP6O1Lfa2LZwc09KS13gba0Ke7trJLqG2AxRK4BLZ
	mACs8p6Rsg+U7aqYuFHaP9nFsvW+Br5uJB6Z65OvFu9tmifvqX5O1RXV5YeVS+7VSVuN
	XzWPoiRTr2FACcrthqVcrck39sHNrQC5A3i3vPqMYIjFxrgd2xUJSZQZxlv/6kF8NSfG
	i2bg==
X-Received: by 10.194.78.230 with SMTP id e6mr28315038wjx.43.1441034458407;
	Mon, 31 Aug 2015 08:20:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	f7sm18521444wij.17.2015.08.31.08.20.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 08:20:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 31 Aug 2015 17:21:03 +0200
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20150831152103.GB2465@jama>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Mon, 31 Aug 2015 15:21:02 -0000
X-Groupsio-MsgNum: 70355
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline

--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2015 at 10:22:31AM -0300, Otavio Salvador wrote:
> On Sat, Aug 29, 2015 at 7:18 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2015-08-29 at 10:43 +0200, Martin Jansa wrote:
> >> Did you enable thumb in that qemuarm build?
> >>
> >>
> >> It's disabled by default and multiple components are broken when you
> >> enable it, see:
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717
> >
> > I'm going to draw a line here. People are asking that the old version of
> > gmp be brought back due license issues, fine. It doesn't mean that all
> > the bugs in said old release should be fixed.
> >
> > If thumb on arm with old gmp is an issue for people, I'd suggest that
> > those people figure out which patches are needed and send the patches.
> > Asking Jussi to deal with this isn't right/fair though.
>=20
> I disagree. If it will be merged it ought to support what we are
> testing nowadays otherwise the backlog will be kept growing forever...

FWIW: I don't mind getting it merged as is.

It improves situation for non-GPLv3 builds and if there is issue with
thumb, then it was there before as well, so returning it doesn't make
things worse.

My previous reply was just to show that building default qemuarm doesn't
show anything, because thumb isn't enabled and gmp even isn't one of the
recipes which are failing with thumb-1, maybe Khem meant some issues in
runtime I don't know about.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXkcN4ACgkQN1Ujt2V2gByvtACgj5qD8M2K8OAPRicnTvCW0QMA
k7cAnicuqZ6bPjaTccWz+c1oY54Zdyx2
=4P3m
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
