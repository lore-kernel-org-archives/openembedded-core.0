Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.5282.1614859518072261857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 04:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VYA4Z+Xd;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d11so27355856wrj.7
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 04:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=bGbEKbSJg5XdSRILNOvufgLUsN+AzFMS3EL0DL0BY0w=;
        b=VYA4Z+XdguXaF4JVIpfFCHwwXApfYVMtCYLwZ5f+oDWg8fM5JHrOqHKaCL7daTpjNQ
         Vt1VhPtodFLRcqAlKJXxq9E6MXOwJBd9J9lWc0I9ZK8CN5mcZ6EUNZG4RXBO0UqYLB/o
         4T7rm+k45iDjakpnkTlQ2TEXI65ohboevE+3Q4rpl+DWON12fZr5VJl3HHEOQgsQtVur
         MbBbIae/9LWI4/oDq62ROJAHl6QAry5Zgr3Vr32BvGXxhx1eKLFpYkCEgfY0nMv1FK7L
         IwyDEV+XFJkRtQdlIk7IRNpMAPgSXlT0zhzCcZ/ibcCa+9dRqb0v2BRpaAgHL7t3GXjX
         MEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=bGbEKbSJg5XdSRILNOvufgLUsN+AzFMS3EL0DL0BY0w=;
        b=VwJ9/KyFDmmdJAKYc3lSxC/nyuJS7QetOPf5EexABOxY6so4q3T1q0qy08eO93jRRY
         Oc5cEH4kFFSp3BghD9A+xq3vLn2OtzHb8TTdofXbeveUxLNuBsU0W0DaKRyS3B7YdY5q
         j0lYuF3J7Vqe4khwpD2IB6ca8Nxj4zH1QQXVpY97luOIG25rYTQby86wjF/Ad66fSZko
         7CJmnRodV8PkaKbx3QDcmFTFL3iK03hgcwEO7OasVCdBvvPHca6KeQwBJ0Dzaj1c++Q0
         BPsaoA4p7GpVuSAkJOVAsT17lUiUIcIPW840hD+1iS0BFRUkOX1/83Yb1wdzd2oydea5
         J6fg==
X-Gm-Message-State: AOAM532tuvWFX21nB9NYurw7Xoy1Vhe1Dla8JUWhnW/h/8FV5Ji6GncE
	qE3CFR4SS1hBVpF2KeUhsGg=
X-Google-Smtp-Source: ABdhPJxWiuULesU4boBeYP40FolJidLgH3LiHQkkNpyncFQ6GxEO/546RyrriEIxRFyyTBvis64XGA==
X-Received: by 2002:a05:6000:1ca:: with SMTP id t10mr3659609wrx.45.1614859516449;
        Thu, 04 Mar 2021 04:05:16 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id w18sm9935081wrr.7.2021.03.04.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:05:15 -0800 (PST)
Message-ID: <46acd9fcda47c567d3ffd9b096593b53af094674.camel@gmail.com>
Subject: Re: [PATCH v5] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Thu, 04 Mar 2021 12:05:14 +0000
In-Reply-To: <09c1419c406fa4c00ad7496b096b18a7f2d28777.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210225153035.1239276-1-luca.boccassi@gmail.com>
	 <09c1419c406fa4c00ad7496b096b18a7f2d28777.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 148932
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bDW9RQTxVj4YFR7XK4nM"

--=-bDW9RQTxVj4YFR7XK4nM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-03-03 at 22:30 +0000, Richard Purdie wrote:
> On Thu, 2021-02-25 at 15:30 +0000, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/m=
eta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> > new file mode 100644
> > index 0000000000..ffb2c87270
> > --- /dev/null
> > +++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> > @@ -0,0 +1,22 @@
> >=20
> [...]
> > +S =3D "${WORKDIR}/util-linux-${PV}"
> > +EXTRA_OECONF +=3D "--disable-all-programs --enable-libuuid"
> > +DEBIAN_NOAUTONAME_util-linux-libuuid =3D "1"
> > +DEBIAN_NOAUTONAME_util-linux-libuuid-dev =3D "1"
> > +DEBIAN_NOAUTONAME_util-linux-libuuid-dbg =3D "1"
> > +PACKAGES =3D "util-linux-libuuid util-linux-libuuid-dev util-linux-lib=
uuid-dbg"
> > +FILES_util-linux-libuuid =3D "${libdir}/libuuid.so.*"
> > +FILES_util-linux-libuuid-dev =3D "${libdir}/libuuid.so ${includedir} $=
{libdir}/pkgconfig"
> > +FILES_util-linux-libuuid-dbg =3D "/usr/src ${libdir}/.debug"
> > +
> [...]
> > diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/r=
ecipes-core/util-linux/util-linux_2.36.2.bb
> > index 19950a2726..d4406695f6 100644
> > --- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> > +++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> > @@ -1,46 +1,8 @@
> > [...]
> >=20
> > +RDEPENDS_${PN}_append +=3D " util-linux-uuid"
> > +
>=20
> I know this patch has caused a bit of confusion as it blew up in testing.=
=20
> I can't explain why you didn't see that but I did spot why its breaking.=
=20
> I've cut this email to the bare bones of the problem for clarity.
>=20
> In util-linux-uuid, you set PACKAGES as above with util-linux-libuuid.
>=20
> In util-linux, you set it to refer to a util-linux-uuid package which=20
> does not exist. It needs s/uuid/libuuid/. RDEPENDS refer to PACKAGES=20
> namespace so need to be consistent.
>=20
> Why the tools haven't been clearer about the issue, I don't know but
> that is no doubt causing many of the issues.
>=20
> Cheers,
>=20
> Richard

Thanks for the suggestion, I had completely missed it - I get confused
all the time w.r.t. using the source package name or the binary package
names in the various fields.

I'll shortly send v6 with the following changes:

- install .a in libuuid-dev
- change rdepends on uuid /uuid/libuuid/
- add rdepends on uuid-dev to libuuid-dev
- remove rprovides of libuuid-dev from uuid-dev

The local.conf I am using to test this adds the following lines on top
of the default that's auto-generated:

PACKAGECONFIG_append_pn-util-linux +=3D " cryptsetup"
PACKAGECONFIG_remove_pn-cryptsetup +=3D " blkid"
PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"

Not sure why the issue wasn't seen, I suspect there's some additional
packages that need to be included for it to manifest, although I'm not
sure which.

--=20
Kind regards,
Luca Boccassi

--=-bDW9RQTxVj4YFR7XK4nM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBAzPoACgkQSylmgFB4
UWKpBAgArMM8Mtg6LNJI9KE52ZAdIERF8vkll2AyYQemsuf9wnHjxLHZk6UsR8sp
UEvs98j9yud5w5eJBTzlPdJLYWrz++x25BDve3bx3Mog20PJ7fKOfsHjG8p8/kz+
93RbLqtSGbqSuep80OP8vYvkgC4l0QCr8Tzb6uLBUsyILZ/MBuQQcyY/ejwz9QkV
eWFGod3aVsakrIlERh6KdSB6wuzPhvEI2jmdVxbqv320UVX08OnXfSOM0BWMhTqR
LxNwmOqT03FZjuKi8aeP6TGIKo+7Mz3+jEFWbBZr5r3kogFoTDjdMViln/sd5Imc
FKFS6nak6jRfn9+lSUKk2LcComlv9A==
=naXq
-----END PGP SIGNATURE-----

--=-bDW9RQTxVj4YFR7XK4nM--
