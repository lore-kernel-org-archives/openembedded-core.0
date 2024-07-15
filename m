Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361A9C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 10:00:17 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.34605.1721037612497673469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 03:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h1/VVRpp;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e9c6b5a62so4246723e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721037610; x=1721642410; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nq7UhJDDUlBiQ+g9m+FY59D5KfP9gvU451WuRXsSSGk=;
        b=h1/VVRppebxdk8i0kaPWaYOVPF8BnAHCHyBfBhNmDQhG1O9JypLjLvxwByhVmA0ScQ
         1sEPs8SQ5dIQvkmxbI6BwG4Qzoq4OF0kxFDjD6LZHEJpm5xWrcgd1JMCT+ASVxGYhSqC
         Dtjb90jJ7+R5musexdkXXtiyUuTPP/lEhRbSuaEhb3jOj/celkLBiCKaeOgmk9tPpHTp
         2KDxcDUPFP1gA2tkdjqHn9+jANN38ZYwo/YdLRkjbegONX0vFjA3tnyGGuX0tzwL6t2h
         9axTFc0ficA+gDvHf90uwaZ+1lvWaXqPYuEOyDLtWQeuum3tDjKxQsVK2TaNCIRoh+Y2
         N2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721037610; x=1721642410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq7UhJDDUlBiQ+g9m+FY59D5KfP9gvU451WuRXsSSGk=;
        b=HWtYxKs7NGD2l3oZbF8Bhzn4ycAE/URgpbHw7ZLnRxJ7PpnSmqlCXVeX4hHXv9L7/K
         RHgv5dSUbYJs8O3Fy70ohpBgVM6YEh5NuBK/mZEe2gnPane6n3iSD5X22Rf2IzHJbXxs
         F+v3n1NNatOTmecFgTqGvBTq/0STABfFGyIdzF1N0Tb9OIWyhv3YLIpRO8MxtgNcwPA5
         DuiSS6rkLRrT3Y4a4zs5MAfUmEXaTJfPtbUfnqhnOlhcMtAl9wJANPxKwOW5U5pL/gZc
         OSoHafZOAM0nLzswlJb4U2jfxao+l8SuW+49s7Lk1J5efJh0HRFxL3kBTxLaOfmDqBT/
         gIMw==
X-Gm-Message-State: AOJu0YwAE0PsPA4tjHgSJJBOQhLaUHsZknsLw8tlVgwD6By0XBgCtRoM
	07wzg/rh5oF8qHdsJRzNqOSv9R+lobVOwU2lzNk9v7wBEhyHrIQCpxeG4w==
X-Google-Smtp-Source: AGHT+IFPS96roVc+R2dAbzf0pWcjLw6HXUMPRfNcR7Y4djCPswkUKg6Au0xeN5YJ1tjoYuAJ1J21Yg==
X-Received: by 2002:ac2:55b2:0:b0:52c:f12a:d0e0 with SMTP id 2adb3069b0e04-52eb999c2admr10268138e87.28.1721037609957;
        Mon, 15 Jul 2024 03:00:09 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e2988sm807386e87.49.2024.07.15.03.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:00:09 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:00:07 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>, kweihmann@outlook.com
Subject: Re: [PATCH v6 0/2] image-bootfiles: new class
Message-ID: <ZpTzJ5Qkid1oy8AT@gmail.com>
References: <20240710085310.147425-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qaN+pjmDlG1PWKDy"
Content-Disposition: inline
In-Reply-To: <20240710085310.147425-1-marcus.folkesson@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 10:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201905


--qaN+pjmDlG1PWKDy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 10, 2024 at 10:53:08AM +0200, Marcus Folkesson wrote:
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
> v6:
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

I think this is ready to be merged unless someone has any objections.
It has been under review since June 19, v6 that I sent out just under a
week ago just adds Reviewed-by tags to the commit messages.

Thanks,
Marcus Folkesson


--qaN+pjmDlG1PWKDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmaU8yIACgkQiIBOb1ld
UjLNaQ//dUKB44M26SvUaoAkHIlb8+iVwz2Guv4DsrCYDys2iSxCI7QrVExxZ65S
8O2DKYpoNJtLfsjDSJDnVkbjKikQDWwc7Hb8wcH9hgu0fxzsCf8pcIWTKO/9oeak
DobIQ6c2oGCmKn7CGt+LkAWjH8A6voO/1g0UjhlHcBBgDj7cs/JZELwvvDBhCYR/
kz6q+Q5pmJiq4jNLIDiJ2GeCsvd5dw93sa3hNJ/NSyRBH7HMvIRC4z45sjQO04lx
2hSC1uJTk78mH037L35/3gvHsSqGChCQi9TTLukgjCgKC0RTxFiCB0euV/1ZGX1y
aGwVR0aWMMlMNqFMRbVIHOuEdzC7E2tqN1Gc9eeqIslRTisBTPJuFF1ns9e2B+uX
u6ouYril7B+l+epU7/rOoi90nzDrnbb1SmXNWIPDs7wZVbFvNLIm+XRUAZsBCUx0
YJp2nrEB8wZaeNZadY10HHHm4tmsQu/H4nNl8F5Iwl1/jdX5h40TZERrJG0vtMIj
eSFb2OSlYvkT+P/A0YqEoCw33a5eZumbUaaEkKRM+980rfmvqf58Xxz9piEq8Pf9
t1Js8gCGTtOEvPeJr8globzaAjRmxV/IEl791niJR0Kokf17gzGiEQyLcl43p4mD
6zfCEg1zp18hnLjOQUUZJ4xA6uhP+GcoNIYJ91G9daAakLqMUfY=
=SPy0
-----END PGP SIGNATURE-----

--qaN+pjmDlG1PWKDy--

