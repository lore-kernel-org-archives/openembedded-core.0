Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.7032.1600148693980014272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 22:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hStkSaFn;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id i22so3212887eja.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 22:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=UrGRTHdc5v4PsNxDQSNrRbrBXOURVyji8RUSyDcm/aE=;
        b=hStkSaFncQjtL9KGD753k7qLjtggHUYcf1UUiX/5Jj5cK+rUBwtebT09wgRaVa5+h0
         a9oKhM57sbblTJAzAuq41fS9lIn3EQDfnQVOi4lj7ZNjcsb0In/f4PayPebQg2Z5/U42
         d5NtY9FDuLZH+VnDeDMhH2jTAs+qv2JuiHeRhfMzpn/q477oUMe4V2w97l10l+2yh3Mm
         +5UMKlPDlAkhoLae0afUx5KGROvUDgkNEmFTbd4cADzAsPEzF0aieAEvXkQA/tRzfw2P
         F0PnjspvNGYuMWAc/JC1Ksbe8p46qXMQkfAxAy7/V01UXp6egiB7Xywscr1Kit+1Ivv9
         7K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=UrGRTHdc5v4PsNxDQSNrRbrBXOURVyji8RUSyDcm/aE=;
        b=p+/ExRAR1N33Cb2p1YdXI/6cqIDGXDduj/cW7mPp3Xtp+oruP+jj4etpEDNwMnj5qD
         i3MBcSsGtyK0TWZGf3lCC1CNAcc3eNieQpSSWzOcbFLBjtOYXTMZTjNcPsY9dlS3i0mP
         ADqxNZmluXihDJrX0gjCViNuQCbAcSNGn+2wd+b5tiQvhGqznNBVLYRPODJl9qBDaGNS
         r2fQW7ihI2nRjtrhDXMuiWzd944U7tXpmQZ3UX3v46h1wpG5FSIu3hEggNLA3SxTGDHB
         PE7wcRZjNYnnHCCvjKW96HeDnI7AGRl8kcbXSp8h1W7KL9ukqlcfLA30W45FZBWq5a3A
         IL0g==
X-Gm-Message-State: AOAM5338O603rGIRVvMPkYzFCVGJxa8STx93ctHmatR1a+VFrDSppbWj
	SblTnfKeYQajvGkNP+loPyM=
X-Google-Smtp-Source: ABdhPJwq897VC6dbs+73Lt3/7bx21SS7/+Z/4BNeLbLUoMvtS6LaVh5bqr+7CJX3n7/us8x7PgjMuA==
X-Received: by 2002:a17:906:390d:: with SMTP id f13mr17937015eje.86.1600148692214;
        Mon, 14 Sep 2020 22:44:52 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p5b25b0d4.dip0.t-ipconnect.de. [91.37.176.212])
        by smtp.gmail.com with ESMTPSA id x6sm9341726ejf.59.2020.09.14.22.44.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2020 22:44:51 -0700 (PDT)
From: "Jens Rehsack" <rehsack@gmail.com>
Message-Id: <486E178E-DCB8-4B23-B199-63231267196E@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [OE-core] [PATCH 6/6] lttng-modules: backport patches from 2.12.x to fix 5.4.64+ and 5.8.9+ builds
Date: Tue, 15 Sep 2020 07:44:50 +0200
In-Reply-To: <ced4f4ad5252bcc989f40b54341c0d7a5835bfce.1600122415.git.bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
 <ced4f4ad5252bcc989f40b54341c0d7a5835bfce.1600122415.git.bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Groupsio-MsgNum: 142575
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9D1670F4-3FD7-4DBB-836A-E4D76CFEF17F";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_9D1670F4-3FD7-4DBB-836A-E4D76CFEF17F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 15.09.2020 um 00:34 schrieb Bruce Ashfield =
<bruce.ashfield@gmail.com>:
>=20
> From: Jens Rehsack <sno@netbsd.org>
>=20
> Backporting the 10 patches since the lttng 2.12.2 release. We'll drop
> them once .3 is released, but for now, we need the fixes to build

Yet another question: there is a stable-2.12 branch ... wouldn't it be =
reasonable to use this one as upstream source instead of the tarball?

> against the latest 5.4, 5.8 and 5.9 kernels.
>=20
> We also bump the devupstream SRCREV to pickup the same changes.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_9D1670F4-3FD7-4DBB-836A-E4D76CFEF17F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl9gVNIACgkQRJmWrtzl
Cp0ARRAAguJGBHutOkXAXRSnyLNU+mdYte/Z5zTikSLFbHBjoOb//xsbtf/J5Qbn
zKfuWRCml19GWoJLD72tlxZoADKTCk7/0tdMgoAyXuUEQL/OaV6s4XE9BatLiJ7m
W0CmEc+ODsObjtFSaDQBcVN/3L1Txnh8DIoxsZRviMRgjTfDeLIj4wRXcyS2x/6D
a512IduMwamqDBjnHAbeUiwrrv8/jpThZn31tKWJV7ZQs50yVCmAiVNdgVPeAFQE
n8+tkMa+W5VXibyLa7Z3yHOAg6P5GizSPS9nedHhj1YrE0T3FCUmaTffkhpO3Q6M
gWj/4TvEIuEjU6wK4UrKG9yvv9UDJezyX41a/ZhRnghN5JKdJhWGaP/1SHhhmxwz
k2br0+Es77aF0oSXJWHMpNxTqL3jB3b9W9+iaPPDNYc4e93v0xh+7zTKk5mHRvQ1
6NamyZQbrBNyH/uBh7vpf4W0EThFNPqvgfCKdRwcMk7njlSlYmsZ6BYDefOllgTv
jCRmlVfUpmtZhNJnR4Pf0fkLmwy4w0/amyIgRa3OVVPfLj+3t4Y1hODWYEgqRPNg
D90CYeUTp4c51nMknoYnwrAYZy28bYuyPdPwXsHkglDMQnFKQlEBOfOyEVjCat1i
C59JQ/FreGvORnFs+JAI+zH+x7wRc5WKzhuo2i2LZK3N7PGZQgI=
=dazU
-----END PGP SIGNATURE-----

--Apple-Mail=_9D1670F4-3FD7-4DBB-836A-E4D76CFEF17F--
