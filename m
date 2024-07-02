Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25153C3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 09:15:28 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.20354.1719911724537636028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 02:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FzlkfkF/;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e8cdc6a89so1778531e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719911722; x=1720516522; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mPkwstL3ZKr0iLx3sZUBcLo62sQQIMxbTz9yGeMcjv0=;
        b=FzlkfkF/Y99L5qCWMmDRXIaRz5qhbPXehQ+uacvnvEmzudFfnLC1Q4s26+0r3k+X1V
         +esj9g5+xM32U0ait2+RTboEzEsOTsgxwEeXa+vilw22KydgV/xRmIGSuHiHbQUYaBd3
         PyeJAhrayvoLRveAneZ4Ncc6gW8Grma9wADXpdlLbT2wpVxbjqTc1mpp/8kqSX4h9Blh
         LzMDHScSWh/bbQSUqGMOoWk0pZDcDgQbVI+HguL1zQPM6XJIof2khunaLidK1dVv0bdz
         bhkBh3Ybbg2HH5M8PLuiVz0eK6d74OBUSDp8CGHecxKihlCRzrCJSKxk9fInrrFkhT4y
         SGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719911722; x=1720516522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPkwstL3ZKr0iLx3sZUBcLo62sQQIMxbTz9yGeMcjv0=;
        b=Wp3uNSHUnwj9b6b7JOkJ6eghvr1QUpty3PvLJ4R3l3NUj2qEqIBeLY2tQaHiVpR3xv
         HojcMpbWhQDY04jpP7IbCJPbN0jwY+D4G/7L7AEgUKcZYD+eSSGTx67ojfIjOUO4wRPm
         e2QfaK/W1zEIJPM0xwerqIXqjTg/6JuF51fpM0j00a9CoZ8GnYpARsB7oaJrCzgyMiNR
         mEKhFUPq0qXHUKV0sDP9zYufnYVC9HAU0GZ/1Kck+ZSGxnfT7zi1lmXD9FaJDfGWv9oy
         fTnaYi8WbH+3GY0LHcUSzdG/+m81JY5JLaAiVmOMpIFBgAhZQ6fdYnZWtvQNbWIYbY28
         MLGg==
X-Gm-Message-State: AOJu0YzBn1dSvjXUiOOshlYMMicyjO78M4Y0K//MDt3DB0kGdM79Z8QV
	6rR+teZPZzzTIWsFX1tR0S5JM36dDHsCLpMzY3KyZS3fkuKKeLmvAMJDag==
X-Google-Smtp-Source: AGHT+IGZUaHb3TxCtZ4VlSq9aXgq+CHQiY6nsoW/ED6WADBuhRcXh0D42L6sJRX89/aGRvIu99emuA==
X-Received: by 2002:a05:6512:31d2:b0:52c:881b:73c0 with SMTP id 2adb3069b0e04-52e826790a1mr5276369e87.17.1719911721892;
        Tue, 02 Jul 2024 02:15:21 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3f7basm1718239e87.305.2024.07.02.02.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 02:15:21 -0700 (PDT)
Date: Tue, 2 Jul 2024 11:15:19 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>, kweihmann@outlook.com
Subject: Re: [PATCH v5 0/2] image-bootfiles: new class
Message-ID: <ZoPFJ4vZsZMUccHv@gmail.com>
References: <20240619123853.2144538-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nkyj0TiARwNmoSbU"
Content-Disposition: inline
In-Reply-To: <20240619123853.2144538-1-marcus.folkesson@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 09:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201419


--nkyj0TiARwNmoSbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,


On Wed, Jun 19, 2024 at 02:38:51PM +0200, Marcus Folkesson wrote:
> The image-bootfiles class is used to put all files listed in
> IMAGE_BOOT_FILES into the root filesystem.
>=20
> IMAGE_BOOT_FILES is used by the bootimg-partition wic plugin to put the
> files into a boot partition.=20
> Be able to list files as "boot files" in e.g. your .conf or image files
> instead of install those in every recipe is a good thing.
>=20
> It is not always desired to have a separate boot partition for boot
> files. Sometimes it could be good to have them as a part of the root
> filesystem.
>=20
> For example, if a double copy strategy is used for update the system,
> then you probably want to update both the boot files and root filesystem
> at the same time as there may be dependencies.
>=20
> v2:
>     - Removed the documentation from the patch series (will be submitted =
later)
>     - Break out the parts in bootimg-partition that is used by
>       image-bootfiles to a common library
>     - Make the destination directory in root filesystem configurable
> v3:
>     - See changelog in patches
>=20
> v4:
>     - See changelog in patches
>=20
> v5:
>     - See changelog in patches
>=20
> Marcus Folkesson (2):
>   bootimg-partition: break out code to a common library.
>   image-bootfiles.bbclass: new class, copy boot files to root filesystem
>=20
>  meta/classes/image-bootfiles.bbclass          | 41 +++++++++++++
>  meta/lib/oe/bootfiles.py                      | 57 +++++++++++++++++++
>  .../wic/plugins/source/bootimg-partition.py   | 39 +------------
>  3 files changed, 100 insertions(+), 37 deletions(-)
>  create mode 100644 meta/classes/image-bootfiles.bbclass
>  create mode 100644 meta/lib/oe/bootfiles.py
>=20
> --=20
> 2.45.1
>=20

Any more thoughts about these patches?

Thank you,
Marcus Folkesson

--nkyj0TiARwNmoSbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmaDxSIACgkQiIBOb1ld
UjJnTg/8C2ZCMzbfuUeTYbexMfWblkR9DHw7RYhULQgATHQCa5uKJU2z4DNL7pmL
8N506DzDB6t5dZU1Bz/N5iBOdaxMscW6fbrMcVhVgJNJN9NAMagb6ySqgdq/5j4w
hwvnTLHPOBQxN3iW7RpPq9hsGOPKC5FHLIpw7HLnnX82iY3QfwGfLnC5ThY1u9bG
DUQG1SMkyhMrzNQp8fegPwqf4vui9Tm88dbeZf4WJhxhalEeNiXf+g6c6n6Cf72E
j/K3ODuguR9lhFYVrl9qqdkq0fMsARIq5Gh9dSg0gMZ8XBztmRjIS6VV4VsbMOBS
lNYPGzNQDl7VcBqR7ku5/xbGdQ+56+fWU0rSC7xD8hBC7OVy+c5x/IDN9GzWddmT
M8EeLFmLPr4vPdmD5eBH1mR1zl1nxNiOBbZxrCcIy86McV4HCui9qejVhpOasNAm
uvw7DBm1VnTvWTk7Pf6fiftPEga7NTYEISDDPx6HtiFEBWMPk7DroVJsUpdu+3Vl
v3l3Z6mciT6xQuJ6GoHi4EWyC9U5H4TnLYuIzsjyVCbTU9qT8CyftV4m/ShvWXBI
Z1zYIVmfGxd2YqdHheCBqTQA95cJAcwT24NKa/0bh+zi4ur/rHVn6SJFKqX+T4+X
7QOnR+i2xGniEHYg2QD0VhisPUk/2q1o/3aDKFf1sjNgbDpCjY4=
=uBRs
-----END PGP SIGNATURE-----

--nkyj0TiARwNmoSbU--

