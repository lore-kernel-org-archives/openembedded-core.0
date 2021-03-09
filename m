Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.7033.1615288028936159044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 03:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HjsqTpcs;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so2757361wmj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 03:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=0+BaeJGB9w7TwEKYqP2kI6K/O7q13Y6XtCfwTKcRvYI=;
        b=HjsqTpcsYQqFvz0bXwGGQFSaFwYSxW2Gb01IyriAdCiwZbVrqevoy3r7+MsVgfQj5C
         HC3cgw25Xa5+DAC1VsIwAJPcFozugDuX0AitRJpci8LaIgG6noIF0RwjZjlO7tL6EeXl
         8jeTb8Q6cAiUa55Ph7SNNMJGKKbU2JBILJyCjhd4i3N56DHNd0hKGwEdowfWjHLOMf9D
         ykx4RcZ3kWW1GLyr9Zf4MFw5I1lTEormEUjfpn8/ZjKy/qjJYFH8N+l3c2JFDJZrYVnG
         xgV/hEDmHsc93gh6gquOm4Y+zU/3X+LN4rC7eviM9uAP3uU2XShBA0UUmqMKaFrMEROQ
         hYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=0+BaeJGB9w7TwEKYqP2kI6K/O7q13Y6XtCfwTKcRvYI=;
        b=E45Mw19MhaaRv8McNM3ShQ/Dtr8UuuI8343ufFEbYNBBSg4HB524EFjm8R6C05L5+j
         i5+Mg7XZ+eO57qsPA8hno4mAZ2I/J9MqnY/E/i1AYjwV5Ui5aPt7IDDN1611Jqztc4Wc
         sIQFR93okaUowOLqyDngfCH+DuuLDtYQ7/0cm4FIeZpQ+noR50iXJPhZBcmFMpMfb4gB
         Eq1ZK8K/ZTLnLIdsuoUvrMtmZrCIGZgz+bO5Jp7lACM/ZlWh8yaCqFmYH0bENx9gibqE
         RbG3bVpSxtjwBLnhFsY20ic/6E4ycmHOX3TBK6dgSw2MVgVDrlAJLG698QL2baqrYxQl
         vt5A==
X-Gm-Message-State: AOAM532ONWnhpzGFip1S5yLUg+ve9qlwqdqWrLbevd3SK1Tm06Q7nfGZ
	3Z9ONFvSu4i9TaZNAsZ5kAQ=
X-Google-Smtp-Source: ABdhPJyd7hlAYbuPGfk/esBq6ROqIZo/eREbCYxzEVlInxBxEwHeM9Di2THzQw4U9jYPMrL2SUYZUg==
X-Received: by 2002:a1c:7916:: with SMTP id l22mr3357881wme.86.1615288027378;
        Tue, 09 Mar 2021 03:07:07 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id g11sm23473963wrw.89.2021.03.09.03.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 03:07:06 -0800 (PST)
Message-ID: <b67b89bc2866141df9b4baa4cfe4def3afc40113.camel@gmail.com>
Subject: Re: [PATCH v7] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org, Kory Maincent
 <kory.maincent@bootlin.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Tue, 09 Mar 2021 11:07:03 +0000
In-Reply-To: <58bcb66c9e15d4121defef93cb6b34266fd89037.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210305110218.24635-1-luca.boccassi@gmail.com>
	 <58bcb66c9e15d4121defef93cb6b34266fd89037.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149148
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-1nFi/wfn/FQmfDrGtTAS"

--=-1nFi/wfn/FQmfDrGtTAS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-03-08 at 19:29 +0000, Richard Purdie wrote:
> On Fri, 2021-03-05 at 11:02 +0000, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > Recently util-linux gained an (optional) build dependency on libcryptse=
tup.
> > But libcryptsetup build-depends on util-linux for blkid (optional, can =
be disabled)
> > and uuid (mandatory).
> > Split out util-linux-uuid in a different recipe to break the cycle.
> >=20
> > https://github.com/karelzak/util-linux/pull/898
> >=20
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory=
 work
> >     underway as I'm not sure if this is the best approach or if there a=
re
> >     alternatives. Suggestions and comments very welcome. Thanks!
> > v2: changed packages names to reflect old ones (eg: libuuid1 -> util-li=
nux-libuuid)
> >     and leave uuid build enable in main recipe to allow for uuidgen bui=
ld to happen,
> >     as it does not have its own autoconf switch. Delete the library man=
ualy from
> >     the main recipe after build instead, and add dependency.
> >     Might help to break loop python3 -> util-linux -> libselinux -> pyt=
hon3, as it's
> >     only libuuid that is needed, see https://lists.yoctoproject.org/g/y=
octo/message/47570
> > v3: rebased and refactored to have a common util-linux.inc file
> > v4: added RDEPENDS on util-linux-libuuid on various packages to fix QA =
warnings
> > v5: remove RDEPENDS and instead have util-linux RDEPEND on util-linux-u=
uid.
> >     Removed PACKAGES_remove and instead filter out libuuid via the pack=
age generation
> >     regex.
> >     Rebased on util-linux 2.36.2.
> > v6: install libuuid.a in libuuid-dev
> >     change rdepends on uuid to use binary package rather than source
> >     add rdepends on uuid-dev to libuuid-dev
> >     remove rprovides of libuuid-dev from uuid-dev
> > v7: do not use '_append' for RDEPENDS, as it is not supported by BBCLAS=
SEXTEND, use
> >     simply '+=3D'
>=20
> This is looking closer but not there yet I'm afraid. Testing showed:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/3152
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/3188
>=20
> so far.
>=20
> Cheers,
>=20
> Richard

Thank you, these seems to be easy fixes: -staticdev package was missing
(forgot it's separate from -dev) and there's a libx32 directory to take
care of. Will do a quick build test and send v8.

--=20
Kind regards,
Luca Boccassi

--=-1nFi/wfn/FQmfDrGtTAS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBHVtcACgkQSylmgFB4
UWJ6GQf/ZL20oOXO/TF4GgAIHkDOri3ZRHIT32V8Bepsf7/kFyUPa6B6RjFkwbEM
hkZ4xjHtN70utF+lhqW/aLgo3tVjNQ2wjQ1BZoHNvMU+2XQk1QHiDuwNO7Mcbiaw
vIsF0qJJoiLZx7HgaGf0wEBr2BYZ40ZFcsLRgeY0Y+HmxBDfOebIrdIIUThTCFUW
ichVh4WIHkqAl3Y1nXVzOvWpKGYOtWjNlLSc3wSQXPtbZXfBDHWuuUqhC4n2BtGN
MzbDb+YgJtbsQEp1y+grp3yxBHOjYiFYgefK9UL/YL0Zxmw4fCIM0ChL6HdtzYwV
l8c3yWu3ahgBUwLNG2q45wv6Ec+mpg==
=ChT7
-----END PGP SIGNATURE-----

--=-1nFi/wfn/FQmfDrGtTAS--
