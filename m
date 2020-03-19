Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C879860AF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 19:37:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s1so4659447wrv.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 12:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8CwErwuk76VO3xRZU/7eCs9uzp/r7cyj19Wu7HCEEis=;
	b=lCkDG97rwzZuSnWphhZ3u9f6sZEKLUqmPSTxZeBRZyb1FRwz5ekAzdg0ey6Txfz7Qq
	ZBqY5TjN15XOgWjklEFbzY5MaBa+Cwy+46K4ODbqCga5532HIe1KEfLED96BFBvhHCJz
	we+cyRBByikMtgSq9Vms6qJ41avVxqG0LX7DCEysl+Kqu0IwtyVcU8iDTFygEz9TUKPo
	F2RlqbK6j3gAreqvgOMEgJQ7/S/tD3R8sVYYyweKOtkxlaghJpAskpYxLRn/YfYmY6E8
	7StFGFBCoFmO2tB68oep9PyFi99x8PR4J4wqe6xVrcUB1isEdW2cds6PHNCZKIUlPgfv
	h+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8CwErwuk76VO3xRZU/7eCs9uzp/r7cyj19Wu7HCEEis=;
	b=k5pB+r4pt2FzsAmMUWyUUKuUUMMGo8K652BiAGgBZQfeVyh2pjyVCKxxMADGpDQFME
	EWpvo/NHz/afnBVci7CpTLniwYRnvide76qLvxMFx7JuAlWyFpN9yizABiASg2LN13Q1
	baqt9JYG4tNMCuiJAbMtYDpsAsogLXaizWyhqczvSYFuJMMSRvRXDtuFEsGnYKysukk0
	5eUUlZ+Dr5rO5qFwXeFGisGWMaT9ZRevKSosOHmNodW8LaYpDKZEpczSHhB2cTMd8B7g
	GEWVSwr1NDLjooJI8pYhm7h7L5fsG8Jg49BarAH4oMurfdIe6kndmtsFXydcDQaYPydc
	vOVA==
X-Gm-Message-State: ANhLgQ12CKhvNn6e1P4EnPxaSwvfmwoVavPDWlFE9HWxlFnJYYqfhUe7
	K7qGggBIeOKflnMQM1OrINk=
X-Google-Smtp-Source: ADFU+vvoyWfGgJDYuv/s1bxlE9wful+XNNfV/1iGAcudTTWWbsYR4qrrEkmOnCc6hvWDTPGBYnDJpg==
X-Received: by 2002:a5d:4bc1:: with SMTP id l1mr6648528wrt.103.1584646663474; 
	Thu, 19 Mar 2020 12:37:43 -0700 (PDT)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	w81sm4243010wmg.19.2020.03.19.12.37.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 12:37:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Mar 2020 20:37:41 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20200319193741.7sld24mwcdujjpxb@jama>
References: <20200319191913.13388-1-Martin.Jansa@gmail.com>
	<CAJ86T=U9+UuFK214nZgjw_-6EU1EbCUkdV-HoWs61gk3=MbLGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=U9+UuFK214nZgjw_-6EU1EbCUkdV-HoWs61gk3=MbLGw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Ross Burton <ross.burton@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [zeus][PATCH] sanity: check for more bits of Python
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
X-List-Received-Date: Thu, 19 Mar 2020 19:37:43 -0000
X-Groupsio-MsgNum: 136538
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pcuscpa7niznj4xs"
Content-Disposition: inline

--pcuscpa7niznj4xs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 12:33:17PM -0700, Andre McCurdy wrote:
> On Thu, Mar 19, 2020 at 12:19 PM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > From: Ross Burton <ross.burton@intel.com>
> >
> > MJ: icu in master doesn't need distutils anymore, because icu 65.1 curr=
ently in
> > dunfell/master doesn't depend on python3-distutils anymore since:
> > https://github.com/unicode-org/icu/commit/b4d41b0561b6e8de38b99850ce0e4=
be8ef536bb1
> >
> > but the icu-64.2 in zeus and openembedded-core/meta/recipes-core/ovmf/o=
vmf_git.bb
> > still need python3-distutils as described in:
> > http://lists.openembedded.org/pipermail/openembedded-core/2020-March/29=
3984.html
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/classes/sanity.bbclass | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index 936fe913b4..5c2f8f9d75 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -625,13 +625,14 @@ def check_sanity_version_change(status, d):
> >      # In other words, these tests run once in a given build directory =
and then
> >      # never again until the sanity version or host distrubution id/ver=
sion changes.
>=20
> s/distrubution/distribution/ (not part of the original patch but maybe
> worth fixing in a v2).
>=20
> > -    # Check the python install is complete. glib-2.0-natives requries
> > -    # xml.parsers.expat
> > +    # Check the python install is complete. Examples that are often re=
moved in
> > +    # minimal installations: glib-2.0-natives requries # xml.parsers.e=
xpat and icu
>=20
> Stray # left over from reformatting the comment.
>=20
> > +    # requires distutils.sysconfig.
> >      try:
> >          import xml.parsers.expat
> > -    except ImportError:
> > -        status.addresult('Your python is not a full install. Please in=
stall the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).=
\n')
> > -    import stat
> > +        import distutils.sysconfig
> > +    except ImportError as e:
> > +        status.addresult('Your Python 3 is not a full install. Please =
install the module %s (see the Getting Started guide for further informatio=
n).\n' % e.name)
>=20
> Should that be the Yocto Project Quick Start? Googling for "yocto
> getting started guide" doesn't come up with anything.
>=20
> The version of Yocto Project Quick Start found by google doesn't
> mention anything about installing python3-distutils though, so maybe
> it's not the right document...

This is just cherry-pick from master to zeus (I've only updated the
commit message).

If you want these issues fixed, then it should be fixed first in master
and then backported to zeus.

>=20
> >      status.addresult(check_make_version(d))
> >      status.addresult(check_patch_version(d))
> > @@ -667,6 +668,7 @@ def check_sanity_version_change(status, d):
> >          status.addresult('Please use ASSUME_PROVIDED +=3D, not ASSUME_=
PROVIDED =3D in your local.conf\n')
> >
> >      # Check that TMPDIR isn't on a filesystem with limited filename le=
ngth (eg. eCryptFS)
> > +    import stat
> >      tmpdir =3D d.getVar('TMPDIR')
> >      status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
> >      tmpdirmode =3D os.stat(tmpdir).st_mode
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--pcuscpa7niznj4xs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXnPKBQAKCRA3VSO3ZXaA
HF8jAJ9JbYG1gBWWNoxmA7DCZGbnXm1b+wCeJmbAzaUz0CRRZ91BRW4iAv7nRDc=
=VTF7
-----END PGP SIGNATURE-----

--pcuscpa7niznj4xs--
