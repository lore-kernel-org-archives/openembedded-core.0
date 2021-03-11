Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.7511.1615475427938138615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zkx26oR6;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id j2so2241268wrx.9
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 07:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=z9A0y3c/eWeQ2kcoFOLIWmeSi0AT/UAn57r37H3iy08=;
        b=Zkx26oR6xe9gGb35yCOfrKxW5C3kJGCUlyo0KN7unP9Knf892/2p+3ek9hKHj6hTAE
         Q0kWRcXWO0sb3zeV1adHLO8rzL8TrWoMlGfFNgWbMI01SGRgOZaVR65aUd87b5++jEbZ
         ubJIG33GhXfOWSBw9XUNTqr4H5baD9Fd5KwsCeOLPFavJ8eRdCxqHlWPaV+MgZsH96Td
         2zVXOFFp7gkWbWLJK0ai0WHrNXwWCwLIiSZWftNVHT1gfX6AO/QKY1q2nhBgJ8V6XPTk
         u73BE/UwL7FLDSc11XLtkS9yuPAB9vthbR6HNsHZvdzCaRLIJlduBjjr1uwu3nscQLWD
         Vo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=z9A0y3c/eWeQ2kcoFOLIWmeSi0AT/UAn57r37H3iy08=;
        b=dh7mxwNCkr/7emrNPEV7vpG0IJgehd/TA3nT/UrZuWvwOY67n0cUp7dK4jPCV2dfOZ
         r8cTndkzok5S4ZppmVjkzl/w1C9qCB8ctc+MWQt5SHy2Sjw1YRPJX8StUDIwl/WxwJc0
         BAFMzpZ7x/Z7rIkU7JVVv09RDaKjHTf9wLGx0RJYcIBxVNyBP/k5OYP5aE2Hz4GV3zK1
         dIzsDFhe7K8SJ+Kh52x3lsO1nUGbFXlKn0JWPfWHLYDPl5o1gBXE4lcP3Hv9Wbr8Fmb4
         +BDea6WSaLXy471FcAWwGNZ8gPT8qMT6fYRYpkLBksL89RjqP0oKnePdZf3VHs7KK0I3
         jVAA==
X-Gm-Message-State: AOAM531vodzrU/OsjYWbrcVd3YlJxDoT/3YhcWCnMqg8TKLtSxa+3yxP
	K+Aewl54E13uicanpFsPJYI=
X-Google-Smtp-Source: ABdhPJzPQwQYDbopf/LcSLzpEF9L3fFER3kQN+SBgp2mpeDcG26mU09vC9jbvKvJ0V36AuZdWY635A==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr9333518wru.262.1615475426531;
        Thu, 11 Mar 2021 07:10:26 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id m9sm4271289wro.52.2021.03.11.07.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:10:25 -0800 (PST)
Message-ID: <d115858235187a8af6d9e566d7c3ad54ca51214e.camel@gmail.com>
Subject: Re: [PATCH v10] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Thu, 11 Mar 2021 15:10:24 +0000
In-Reply-To: <f25a7ae612bdb191e436beb726d17581e2ebb628.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311143848.777532-1-luca.boccassi@gmail.com>
	 <f25a7ae612bdb191e436beb726d17581e2ebb628.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149292
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qgo+Ysya6+z8PSi0KQMi"

--=-qgo+Ysya6+z8PSi0KQMi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-03-11 at 14:44 +0000, Richard Purdie wrote:
> On Thu, 2021-03-11 at 14:38 +0000, luca.boccassi@gmail.com wrote:
> > +# dm-verity support introduces a circular build dependency, so util-li=
nux-uuid is split out for target builds
> > +# Need to build libuuid for uuidgen, but then delete it and let the ot=
her recipe ship it
> > +do_install_append () {
> > +	rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${l=
ibdir}/libuuid* ${D}/lib/libuuid* ${D}/libx32/libuuid* ${D}/lib64/libuuid*
> > +}
> > +
>=20
> I think you can replace:
>=20
> ${D}/lib/libuuid* ${D}/libx32/libuuid* ${D}/lib64/libuuid*
>=20
> with=20
>=20
> ${D}${base_libdir}/libuuid*
>=20
> ?

Thanks, seems to work locally, sent v11

--=20
Kind regards,
Luca Boccassi

--=-qgo+Ysya6+z8PSi0KQMi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBKMuAACgkQSylmgFB4
UWLIlAf/fycIuCrRFiz8PWzjLzolTI1DaT+d5nlzu85lSbfssq6JQkej2s5S6M/H
Q9CtbiJlNA2+h+FA5yBdoZwfd3gd+nxTwHUANUsgrDzndA4MeEg+FJ5UmK123F9k
OGlQIiAazXUzXofmbHQhDRSCSJtQHbmO3dxiP1nHEC+JM9UlWec3QaChnenQMoyX
yf+QMK3FCQyNH8rftFlFAqEXLAJdGF4LhQLBiTT8KRx+yV5hG2PkxdqEVquDdvWJ
dL+mKF9nG7SAnLIIr0f3itYUU2myS3gGJaSPnxDCfTAj1Ln++7lQpXAKCs8n0rRV
nuETTmGSWftNAHUKb2b1Ms987T/5Dw==
=Upuy
-----END PGP SIGNATURE-----

--=-qgo+Ysya6+z8PSi0KQMi--
