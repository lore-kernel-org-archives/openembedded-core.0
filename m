Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.3851.1588850727598696685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 04:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A+U9Fp2U;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: bartlomiej.burdukiewicz@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id b26so4161358lfa.5
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version;
        bh=y1cHNQQlPISMxq3a8uQ8V7Z/9XZKspYkh/iN/fjt99Y=;
        b=A+U9Fp2UjrYbNxShBEYIKK6uW4dSQWdos9+MKqYLjwnPf88Hf9BLI2GGs1x8EGIIIr
         LxLDqBZ796TyXxHqrdEmLwiXcXIID7eh49+xGQr+DA1zlkISd6ZUf4NBomLHabkXvPLW
         u5BKijRTDQAHcyqvpuHxMCwrmpp5bl++sv7+tYcisilD9sq0iK5hB48cd7IgHyZgFNXR
         VFviVQqFtzCBS/UVfDCfdF2FQhnKVMKpFYZYERKveRvG8Wanfs19dA44EJHLDEXQkpV3
         ji2nWtVd7sYuniHomwormHYjYMKVnvfxVjG9kHxdYyGc3UiI/7M9qtulir4dPK5rF0eF
         3M6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version;
        bh=y1cHNQQlPISMxq3a8uQ8V7Z/9XZKspYkh/iN/fjt99Y=;
        b=WBmlHnbJacicvih59oeKOoMD2nhi/SVRt0rDcxOHx1pKpI2dfXXGR+xSPA1PRf+0wy
         AjPICd3Ger+nmi8znqlDGJiwv6AeoHBoTsqulY3+jjWV6DCqV1O77hcnuzadl0UBjZer
         C6HGq1+2shFhJwV+FnkhAXVVtAcKXgtH6Ou074CuvSL4+bx+p3Z9Q5d43416n6YX0Cea
         frgMWln7TORr89fYbuQ1s/OR/iRXEGd/FhTq8Ixk/iM4As/Tl7A1HSvXru5ImZ0AtjqQ
         dfp6ZqpiMSFrGacj4qubX0fw02XTfePErSDqCV7xntX17IF4nlayeL37u5VZnhoBXTAk
         QhJg==
X-Gm-Message-State: AGi0PuZF0xyMEl0fOVGANjanIhgakxWVqFHveNdtc9eYobgXS8FobKVn
	pWvBXhjWxTEP8mwF2FxouMZo6Pym
X-Google-Smtp-Source: APiQypJ6pBurc8mGA+B1fGlXtELQG+nS3xwWYwrEMdsP8LTdaQFgL30tcJyGutzxbWGu5h36Wql9Fg==
X-Received: by 2002:a05:6512:310d:: with SMTP id n13mr8701382lfb.205.1588850725331;
        Thu, 07 May 2020 04:25:25 -0700 (PDT)
Return-Path: <bartlomiej.burdukiewicz@gmail.com>
Received: from navi.localnet (dynamic-78-8-70-40.ssp.dialog.net.pl. [78.8.70.40])
        by smtp.gmail.com with ESMTPSA id y16sm2903374lfe.17.2020.05.07.04.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 04:25:24 -0700 (PDT)
From: =?UTF-8?B?QmFydMWCb21pZWogQnVyZHVraWV3aWN6?= <bartlomiej.burdukiewicz@gmail.com>
To: =?ISO-8859-1?Q?openembedded=2Dcore=40lists=2Eopenembedded=2Eorg=2CB=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@pr.hu>
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
Date: Thu, 07 May 2020 13:25:17 +0200
Message-ID: <4268468.LvFx2qVVIh@navi>
In-Reply-To: <44fb22eb-a3ea-15cb-f93e-c0ff4503705b@pr.hu>
References: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com> <44fb22eb-a3ea-15cb-f93e-c0ff4503705b@pr.hu>
MIME-Version: 1.0
X-Groupsio-MsgNum: 138013
Content-Type: multipart/signed; boundary="nextPart2192802.ElGaqSPkdT"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2192802.ElGaqSPkdT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wednesday, 6 May 2020 14:41:25 CEST B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n wrote:
> 2020. 04. 24. 17:01 keltez=C3=A9ssel, Bart=C5=82omiej Burdukiewicz =C3=AD=
rta:
> > Mesa can be compiled with libva support, in order to avoid recursive
> > dependency between mesa and libva, virtual/mesa must be removed
> > from libva recipe.
>=20
> This is why this patch series was created, to break the
> circular dependency in a clean way:
> https://patchwork.openembedded.org/series/22976/#
>=20
> The libva-initial recipe was introduced that doesn't need
> mesa, then mesa can be built with vaapi state tracker enabled,
> finally libva can be built with dependency on mesa so its
> GLX support is enabled.
>=20
> What happened to it?
>=20
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi

Was those patches merged upstream?
Never seen them before.

Cheers,
Bart=C5=82omiej Burdukiewicz

--nextPart2192802.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEhZwkVUCmwRFjZfunQ+DhhJwr0RgFAl6z8B0ACgkQQ+DhhJwr
0RjAgAgA07HaFTmiaedUuBuEhWsxHa5nqC2tZdCM3/3IL4cOJdZzm5TDy0fvdHpD
xN7jMZtwVNOrN+McCWq/2wbB4DG6v5PJet5N5LashitBIajKIMf/yQanhJZJwQgl
QUERD7Ubz3/fQVRL4r5TRa6huvjml/IZHq8ts0M54vocudLlDXSZKCAr8a6bjqo9
HcxE4xpWsTxDG3SOyR+XUA5ch53kZnlP7UNJDm1tzKW9zbbUInRSf+/XxD/VRvJr
naNoiPUQeMALPHJG4vS9id7jZ6D3Pjk+wnaM/9pxQARvNZZ3+JoaqLxQ+crN6Dgp
gS/NYo4tzhOhziFL7unUG46TyjT6cg==
=NA1N
-----END PGP SIGNATURE-----

--nextPart2192802.ElGaqSPkdT--
