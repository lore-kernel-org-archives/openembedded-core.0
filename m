Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8CF6B25A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 11:02:57 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so153304eek.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 04:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t6H8OiBIlik/9M7poEpr+oJGL3w5KxEdCAiXYzPKyL4=;
	b=Pc4Tp61SuAFUz5LAc0qjmmweFnsM64ocPMZ0GthFNiCMpmncXo794Vt4cr7YP9vNeB
	8kA9nblYs4PdYJAeOfLURMzuRXNsDBARREWj6xObOwtvtRn5BMXQgi2rNJ/w9AL15itq
	DXeNiImDoFWByEW9vnvaGglDriJCB+S59tnMoVr3cCpdaXtu1noTGPB4RIx66WhfICUg
	J/nF2eyaY8vB1bn9vbzv5tvZAyo55r43I5D4SLAVsMFwz2ZkvMTJNren3sdLAuN43hoi
	b1M9K+vYC0UWl2SpY5CwHwvUjIFzM8FEPxVtikkqlUDC3ZJMA1uFO95ZGEoifkBWYvRy
	0tfA==
X-Received: by 10.14.216.3 with SMTP id f3mr1294eep.80.1377082977404;
	Wed, 21 Aug 2013 04:02:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm8895471eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 04:02:56 -0700 (PDT)
Date: Wed, 21 Aug 2013 13:04:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20130821110401.GG522@jama>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
	<CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
	<CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
	<CAJTo0La2UVtZ9rM-HRGY9DGzD9=D4RTZzutHT8Aks4QJ9E=zPw@mail.gmail.com>
	<CAOMwXhP6awmXzW2Sm0OMKyrWBFtQRje1CkL3yWtvzdU6fvd1bw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhP6awmXzW2Sm0OMKyrWBFtQRje1CkL3yWtvzdU6fvd1bw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Wed, 21 Aug 2013 11:02:58 -0000
X-Groupsio-MsgNum: 43646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w2JjAQZceEVGylhD"
Content-Disposition: inline

--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2013 at 11:31:53AM +0100, Laszlo Papp wrote:
> On Wed, Aug 21, 2013 at 11:26 AM, Burton, Ross <ross.burton@intel.com>wro=
te:
>=20
> > On 21 August 2013 11:24, Laszlo Papp <lpapp@kde.org> wrote:
> >
> >> I am not saying to fix gtk-doc-stub only. I am saying fix the nastiness
> >> of using git repositories for released and supposedly stable versions.=
 I do
> >> not see why tarball would not be enough for those to work off-hand? Th=
at
> >> should be the ideal architecture IMHO.
> >>
> >
> > Two good reasons to allow git repositories as a source:
> >
> > 1) Many projects don't make tarball releases.
> >
>=20
> That does not mean bitbake cannot generate tarball out of the git
> repository. In fact, it is relatively simple. ;-)

It does, all you need to do is enable BB_GENERATE_MIRROR_TARBALLS

Versioned tarballs are already tracked by
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1511

> > 2) It's incredibly useful to be able to build from git snapshots for
> > development/testing purposes.
> >
>=20
> I was explicitly mentioning stable and official released variants.
>=20
> What you're asking for is the inability to use git repositories in SRC_UR=
I,
> > which won't happen.
> >
>=20
> No, that is not what I am asking.
>=20
> Here you can find the feature request:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5035
>=20
> Cheers, L.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w2JjAQZceEVGylhD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIUnqEACgkQN1Ujt2V2gBwhfQCeLu8n0Zas5jqDeYENMB2yonfz
f6oAniMGRVO00IiH1Wn9RjXZfH5PahI1
=KcgG
-----END PGP SIGNATURE-----

--w2JjAQZceEVGylhD--
