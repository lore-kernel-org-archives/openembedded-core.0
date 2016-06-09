Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 933656FF9B;
	Thu,  9 Jun 2016 18:15:47 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id m124so71448558wme.1;
	Thu, 09 Jun 2016 11:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=io6227OuBNk+1S6pxCAtaWfe6wf4h6dHfIvI9mKdc0E=;
	b=KVokVWGrN/OxeA1b5z+O8YahrR5/v9ptiHLEDAAYAnB26vQ5W0xr6TmmTrdkzPySWN
	bxV7XVNWHZR+S3dfbKJ5AyCsS3V0RAGY7BbVhKPG93GgE+NFIZVJHGcmxlPpK8utEt+E
	2B+QmrmNTArwdVeJnoXa5796Q/5GPSSv17NZ2z0KpjVtbK13yi/75XXjBFMWqWOX28CH
	CaZbBm82Wtph8sFfCL80AziN3IR4LIDYtAECT7bjEgk+5MJ1MKbF4qdPzxp62Y6qUeFi
	6XA2BCp66moePLkIYehl1JVd79BjTkMdfgcsPbz0QHnvRdGBf/Z9rT2an4VSVh1zM48a
	AZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=io6227OuBNk+1S6pxCAtaWfe6wf4h6dHfIvI9mKdc0E=;
	b=Q89Crd3C7E7nhaeLlcBY5vOz6OBvI1oyax+ENEuTJ6CdclhQjU/VyTy4KniyZNYc48
	ZtBYQ87uBJHHdPE/eMOthkcu7LmiaGpk3O2UDt8z1IPvqVonPljdzFZbtZKzVbu1fv/6
	1pZCe0h/NowAuTY2SZPVlLiv4qJb8XY1HEitLuk0g+CQgiqA1SwELVJEu0R2U3kRTbn8
	1tlkB3CLY4EBoOpAbXvt97NF4DYlFENYjyZUgzYNp9f700tTI3Sl0vUNnpHkNrYZGeyd
	u4rQeEWS6df1V/aIqQcCnMWYt9IK3x5VRt4tKIayeih42urhpZPwYUzT0MeGpaHooDGS
	Rx1g==
X-Gm-Message-State: ALyK8tI/0NvxMflCdDFcJpNikNuHUBUUdWioIWR/kdoQ/39Ra0yanusQYhzFCZlJE39Qsg==
X-Received: by 10.28.158.17 with SMTP id h17mr12268582wme.1.1465496147007;
	Thu, 09 Jun 2016 11:15:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id l9sm8291941wjm.0.2016.06.09.11.15.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Jun 2016 11:15:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 9 Jun 2016 20:16:13 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160609181613.GB2586@jama>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
	<CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
	<CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Konstantin Ripak <konstantin.ripak@cogentembedded.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] the fate of Vala in OE
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
X-List-Received-Date: Thu, 09 Jun 2016 18:15:48 -0000
X-Groupsio-MsgNum: 83265
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline

--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2016 at 05:36:32PM +0100, Burton, Ross wrote:
> On 9 June 2016 at 16:59, Petr Nechaev <petr.nechaev@cogentembedded.com>
> wrote:
>=20
> > We do use Vala for internal gstreamer-related projects so I would
> > volunteer to support it in oe-core.
> >
>=20
> Would you volunteer to maintain it in a separate layer if possible?  If
> nothing in core uses it and it can be maintained out of core then I think
> it should be moved out.  Currently, vala support is in oe-core but nothing
> in oe-core uses it... so the autobuilder can't tell if it works.

It's used by couple recipes in meta-oe and other layers which already
depend on meta-oe:
meta-multimedia, meta-gnome, meta-efl, meta-fso

so if you want to move it out from oe-core, then it should be returned
to meta-oe (from where it was moved to oe-core a while back with midori):

commit 6f642a51dc98b0a8a20b2d0a6bfe6917e9f2091f
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Wed Aug 28 10:43:25 2013 +0000

    classes/vala: remove
   =20
    This is now in OE-Core as of 807285c751862aaa775db5a13293007bfb3c29df.
   =20
    Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

commit ad185f4494fff1254bfa167d6715db7be5a2de04
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Wed Aug 28 10:43:24 2013 +0000

    vala: remove
   =20
    This is now in OE-Core as of 649b48557d8702daaf4f28482848ab0b07abed83.
   =20
    Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldZsmwACgkQN1Ujt2V2gByKjACgqvsf5/Dr/vQZTH0cbDAGG78X
ycAAoKOmMy4+o0isXvjiT1Te1YGMPrtn
=6Cyc
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
