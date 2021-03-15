Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.6994.1615805058561712284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 03:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vA0Z5i2E;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 12so2796235wmf.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=A7Pr++gSv4JBwvTLtgnIcRUU/5NTl0rPuwKiErGU04E=;
        b=vA0Z5i2ElYC82sCvmRj6TSNuhsY1odEB3rwly7AjJGtXJBKKqDVcVEtUTQMOXX5WbC
         WrlwRqBqbg/Jbs3wQvowcBehCLsd6f6v/W6zxYbA76Q/A+MKMSJUfUVD9J3Sd7TcxB/B
         QI3N7Z86zND1yVuyBRYp5X6c23um7HHZKMKiTMotmxb8FyLWTLLWhfzaCMvG58MlbSyf
         Dl+1DvD6oo9NidXqSJoHxfaXjjAmEH1jYPL0qayHQVzVS8zE6iLhx0LYAA9saSdsyB9E
         d2F6QLKeKm3+MYL40GPcEE/TE8q3W8FKeiHn3sA+LjdngF8uiVnr5tCX/KTfRqwyIhbz
         DqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=A7Pr++gSv4JBwvTLtgnIcRUU/5NTl0rPuwKiErGU04E=;
        b=hqKE62QuldfgXBYVFYlyKr7URPyuJxld/HyRozwkUhPrIRMO50CkyZc1/8ouRp4xmk
         puZP4g2duIMWYK1tm3q+SWBjmgnAJCDxVYI+lX53SJjxKuDr0eZysHhi1Ywv98oYedCi
         rCMKPYx1V3TECwlO1VUvH/Kzgra1o1O799cisaUK4spOsA3CgE/W945HW77aFH6XIGHH
         Jb2lq47rJb1GIQ8PFBmoKgjvJdCfgyUkJI2KDqfVIOHS3foch3T+bdQcTrDm+uCBZKvE
         PlFuhiLPjq65T9QZh9VJMDPdVdHKAW3tTLAeRM6+/earOIVqydquXyrfN4GXSsB/SERW
         zs9w==
X-Gm-Message-State: AOAM532YyE2uuh+vYUBieEpxIfAqjRj/J3+lxsrT4CUmNWjfeZzn1xFW
	0V1+t4n3Lu8PSVgrcf1u5j0=
X-Google-Smtp-Source: ABdhPJxcYrTeQzBLnPNtIwPU5zyM1KvqIAVfwkV9WPmSpXBc9LrEJfuPumnBt8YuxZ6E4L6Z0h5g1w==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr25419158wmk.101.1615805056287;
        Mon, 15 Mar 2021 03:44:16 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id s11sm12633436wme.22.2021.03.15.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 03:44:14 -0700 (PDT)
Message-ID: <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
Subject: Re: [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Mon, 15 Mar 2021 10:44:12 +0000
In-Reply-To: <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
	 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149450
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZClFE+V9rvX0GE5S/KDu"

--=-ZClFE+V9rvX0GE5S/KDu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2021-03-14 at 22:10 +0000, Richard Purdie wrote:
> On Thu, 2021-03-11 at 15:09 +0000, luca.boccassi@gmail.com wrote:
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
>=20
> Unfortunately I noticed we had a performance regression in buildtimes in=
=20
> recent changes. The closest I have this narrowed down to so far:
>=20
> https://autobuilder.yocto.io/pub/non-release/20210314-14/testresults/buil=
dperf-ubuntu1604/perf-ubuntu1604_master_20210314181831_d42487bf52.html
>=20
> suggests it may be this change. I have more tests queued to confirm
> that definitively, if so we'll have to figure out why as this shouldn't
> really happen, its an 8% regression :(.
>=20
> Cheers,
>=20
> Richard

Hi,

Very strange that a single recipe could do that - is there something
wrong in the new .bb that I missed and could cause this?

--=20
Kind regards,
Luca Boccassi

--=-ZClFE+V9rvX0GE5S/KDu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBPOnwACgkQSylmgFB4
UWKZzwgAmVXBZ5JpwrzGop9DqpRDdjKGdHiEwRigjZhrZb9LLpXvgHgwOjCIIK8w
yAdnZxHsMbjRpXXr6tt8Y4gY+IOQbqHtf8ScQBx9TtjbDWpHVNPqVGt4PlgLIvkf
cHsRHNhWKrW9tTJDKwzAKXVRM3if0BdHnvqVoIPKLp82PetHD14oBNjwU2DZsO7o
sH4l90OG6a7kUyEQ7Qhtn4QxvFTXtpzjfEsNIrmy9NJrGb9A2zdilbiqvswr0cY1
6r4Hfn3NZSwDvZ6ciorAOiwssdejGqNyK7gEfNAmEnywg62U22N4DL3MyVDU+/2k
+5pq8+VAnGtflRKtCosx1gkv6lqz1w==
=YQcX
-----END PGP SIGNATURE-----

--=-ZClFE+V9rvX0GE5S/KDu--
