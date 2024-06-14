Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2149FC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 20:19:12 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.3837.1718396348998737613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 13:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GpymRkTL;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c94cf4c9bso3079110e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 13:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718396347; x=1719001147; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOmQ5wwDWHUsLksKCS4S9VM4iCbRrRvnwxDeVaWE2b0=;
        b=GpymRkTLTziPRs2Zd7FcNSqOYWqIaZYs1fHszchaTz+v2J+33XQV8T6epyWkWXsSAt
         ya5S7diXzmYQnLzDesIoYs1JnuYsXcs8lKysOVnac7a6yxjwdc54KRgp8kMjXORYXNvo
         4lOeecDKnOPtxKlTKwb4GtdUpKB10WvdqmBu01nRgu2S46OCf4Udz95ItNQtqmTaWrYM
         CPDoHDDoyqsOCzuos33qFmc/sFcrpZFJiDqXwC5sG/fsbGDlKxLlfc+ioiTohdDsWTZF
         Y3U6SWuBhiOTPxUjc467+0FciP0W4eV1kiNm5j2eF4WgC4ybzoS42pMuxusm+OJfNlZW
         VjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718396347; x=1719001147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOmQ5wwDWHUsLksKCS4S9VM4iCbRrRvnwxDeVaWE2b0=;
        b=gDzBluOwF2GCY5HHuuWB4iN81dRsghNoE0fqq+57OO4cOtZ11WoEGh0AOu/F9++8rI
         tqwSFJaj3fJKbtb5s9POpbLsnjDICe40JqS+MxabEkwGljGjQNZYDg31uyBCYCDYdk97
         bGH4Xh0lJTAusd3tXpw13yTqz6kycVjKw8vrG1oU/4lVM/X2YiXT26zavuEuYnRkWXOD
         29EvdO2PvOHp7WsdqRP9GqJRIOpy9GzpQYK6oU3CenwWPUNjrXZbuz86i+vFXrUMcKiB
         2buxvS8/b2zNgYXvoOthN7eOo+Jo8pUrhvq3mwjEaUuY3R4C63/u6RsqEZEfAUmnH35o
         JBDg==
X-Gm-Message-State: AOJu0YysKfJ3GUrAtEkZd1YnUqzSKNbUJQiIP6t8u7ZvG9dHr8JoIJHs
	tDlM6cg/E5Y3EAHZ2dmuM/kzyRzPggjSL1y7a60SMuFoGJrVkoAUzqBshw==
X-Google-Smtp-Source: AGHT+IHeth7y5Ws9AvKg7vJ0s59uL3rGu9TXqP99/5wP6m7r80vlM7Od+WF8cQrSazCOQNX/dQRPPA==
X-Received: by 2002:a05:6512:5c9:b0:520:ed4e:2203 with SMTP id 2adb3069b0e04-52ca6e562bfmr3175049e87.8.1718396346226;
        Fri, 14 Jun 2024 13:19:06 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825aedsm588180e87.30.2024.06.14.13.19.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 13:19:05 -0700 (PDT)
Date: Fri, 14 Jun 2024 22:25:19 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 0/2] image-bootfiles: new class
Message-ID: <ZmynL5Cl8rWu-Swg@gmail.com>
References: <20240530095314.407638-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wt0sWWjfIuo4fNg4"
Content-Disposition: inline
In-Reply-To: <20240530095314.407638-1-marcus.folkesson@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 20:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200659


--Wt0sWWjfIuo4fNg4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello

On Thu, May 30, 2024 at 11:53:12AM +0200, Marcus Folkesson wrote:
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

I have received some feedback on this, but I would appreciate it if more
people could share their thought about it.

I still think this is a feature we should add, even though the way
this (and bootimg-partition) works has some drawbacks in terms of design.

Since the codebase is now shared between image-bootfiles
and bootimg-partition, I imagine that both are redone in a potential
re-design.

Best regards,
Marcus Folkesson


--Wt0sWWjfIuo4fNg4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmZspysACgkQiIBOb1ld
UjK71w//R29CPO402Cp6lVZYpLc00AIIKO/wYwS2oaZfutraSgR/lS6VOl9wvoit
wpUefRJ8+0xhcioawbiQh+EtA1ozMBvcmOD4vWwtYKlRkxdkDUfXNTwArFM2jogs
MyO7eRuMEKppglgUkgP+Jj6NECGB/kKxNM9aeiC5D2LEjBlgV6JBij204rLpvPF3
+tLULepp+P6SmJYvJW1XkGzu3bwMP+0E+y0INlKuw1wNcLUCDBiI7f86AFSw+kKD
+RTOzDeF2plcn7BiHRNUKuwpMMARH9oLpww/R8xwNmqFZLcN2QjCUbz/SQrCbfs2
ZPIX9uY9NrTFjBODzX+zTye+gvhm4JAbihfC5xSc269ZOZ5gvVkCkbjKMoPJqyqR
2FcoUdLiJIrY2Ml/Vto0UHaMDcOnkJWlZ6VNo4IsbH1cMg51/Ou+QT3bZtEg3lbQ
vEEJZZTFF7e3FroDM1Ip9e/S82JaHjX7Qk+aKpvYVL9GeeaYfllzLl6VhhRcoAc+
g/RDGn2oNIokErIwX49pkHuWj/S/DqLaVEMgZabvJPUxnJzbd8ft+EjbyZttX+aD
hE3BQ8iMhSSckZLYApvx9OcF/Awckt4pmygRqJBY50cTvD5wJ8ojqPFMlBb/S+pf
eIjBYeqWRzAtEINNQid7UYGbSjeu04jAZ0GQtNVsyMyoEI8u0hY=
=UV1C
-----END PGP SIGNATURE-----

--Wt0sWWjfIuo4fNg4--

