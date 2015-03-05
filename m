Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id AA8DB71637
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:43:53 +0000 (UTC)
Received: by wibbs8 with SMTP id bs8so5174674wib.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 00:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ql+w0Xtw/VfgjILPAg8Jl7vC/lGOPOFMZFSskrcWOhU=;
	b=fiQOBuiP1WDefzD9ZfkwawK3d9gTBzeNDx6SJrNIpucRjQQ/+x5ZGea2XjXR2YdYNf
	9BPpp8A9sp0aWrD3YcmidrQcSIN6u7kBt9LCYdpaTujwseVVg9fYuLuMcfJSRFzIKPdC
	4+Z6hRLqB5DHKauHAsDZInKKVppCofd/xh8LxDzgPZiuNrYJdTJVsgsr8tKXiodNg0P3
	hv5dj2xt6vMcpo9ABmwjbPuFGEG8YYRmmzvKXgAJx6huLL4HnuS/XCiySl8cWBhT5mU6
	EE+wX2QndixdKJdvoi5aodUu4WHYG5k3tg27eGhnEqm5ZWivj/FnUgrH7Y4cFAM5u7cA
	1RzA==
X-Received: by 10.194.20.67 with SMTP id l3mr15977519wje.94.1425545033773;
	Thu, 05 Mar 2015 00:43:53 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nb18sm10616689wic.3.2015.03.05.00.43.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 00:43:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 09:43:57 +0100
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20150305084357.GM2337@jama>
References: <alpine.LFD.2.11.1503050259530.21019@Device-040570>
	<alpine.LFD.2.11.1503050304230.21427@Device-040570>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1503050304230.21427@Device-040570>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "_append" error in gdb-cross-canadian.inc?
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
X-List-Received-Date: Thu, 05 Mar 2015 08:43:56 -0000
X-Groupsio-MsgNum: 62987
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eWmFpGZayiNrn4FL"
Content-Disposition: inline

--eWmFpGZayiNrn4FL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2015 at 03:06:13AM -0500, Robert P. J. Day wrote:
> On Thu, 5 Mar 2015, Robert P. J. Day wrote:
>=20
> >
> >   EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"
> >                          ^??
> >
> > does that not require a leading space there?
>=20
>   just did a quick scan of other possibilities where a leading space
> might be needed where _append is being used to append command-line
> options, and here's the only other one i could find:
>=20
> meta/recipes-multimedia/libpng/libpng_1.6.16.bb:EXTRA_OECONF_append_class=
-target
> =3D " ${@bb.utils.contains("TUNE_FEATURES", "neon",
> "--enable-arm-neon=3Don", "--enable-arm-neon=3Doff" ,d)}"

This one has a leading space.
>=20
> i'll let someone else apply those if they're actually needed.
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eWmFpGZayiNrn4FL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4F00ACgkQN1Ujt2V2gBxc0ACgqyJ7hNXshxRnklwo5lLSb/a3
hbUAniU9eRc8THFpgbs4SM2q68+K2zYF
=b+JR
-----END PGP SIGNATURE-----

--eWmFpGZayiNrn4FL--
