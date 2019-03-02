Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 83F9F7CCBD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 09:15:46 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w17so298991wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 01:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gUaDfJ/4+QTKnjbvubFg4h/EPFk1bBTKHE5RNi7dn4A=;
	b=HKS1+Wjq9/Mbf0rsRa0BudIIA5ydK5fFSgHNy/a3RSJdPwF7WPFgrc+Zj54pXvJkMT
	/7N37wlsJkiHg5YAymIy3j3iWqRivAnVJrscS3oFv/StfgnOb7smnlzmG81f9lgEKzF6
	RC7GgXUzt13BVB8onxBVaD4oNuhCODOHugzlN5QczRwFId7fX8HEJkr/lwDKBZUSotNB
	cx5frlJfOFj16CkEV9P0HExpdiZkgEuIk1H8cpZgxPYKoi5A1yBHJoep+KLLjWuqO7+v
	4xemUDame/uFdYVw4CJQKOw+KIxwc/eBxda47POJ1OBTnI38qJHqOjm+OxrDvLQ2fpjE
	caWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gUaDfJ/4+QTKnjbvubFg4h/EPFk1bBTKHE5RNi7dn4A=;
	b=lmch+VoYmkAYP/W0sB8Wc3gDd7gPRHaQgStFq4hU8n/DDViLa5Cll3tNRXnuZhpZt4
	/uW7bRG3dgUn0uh9iTkTgodeXnqEqN4E01o1W3OCstQwv3yFnNla/SKa2to7J+S4Wdcx
	DyTpkFnCHWi9Ohgtv/UndF//dw6UNBvovLHSMtGcEVpy7O2l9UvtHyHJT96UzyoM8Wwg
	0uxFnYDoLKcud9jHMtTKNIvTZtWTzsTG+3vgNEpnI9x7cC+Es8uoITHtSEXs/h7OX00N
	2nmDdg3huPk4ISiLYJ7ge+WHJANcjNSHNE41G1G7RXm0AHbytqjEO6m8a0qAJjYeXiZV
	tBcA==
X-Gm-Message-State: APjAAAWgb0aSs6fG+TZJCqqnxM2x8fYCFOVY+EAirgrasxg1VDc7lFG4
	8I4fpJQYGBqpl3mYnceoXVNgAF6D
X-Google-Smtp-Source: APXvYqwknAbj0wGowy5lRscB7JQtMQl+4KHJPVCAs6dYWrq5hGjAgq+2jvGAHHW59p1Ikw0eaqU7NA==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr6260167wrn.191.1551518147188; 
	Sat, 02 Mar 2019 01:15:47 -0800 (PST)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id o30sm882310wro.57.2019.03.02.01.15.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 02 Mar 2019 01:15:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 2 Mar 2019 10:15:48 +0100
To: Tom Rini <trini@konsulko.com>
Message-ID: <20190302091548.GE1503@jama>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-2-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1551479212-28944-2-git-send-email-trini@konsulko.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] vim: Import version 8.1.0347
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
X-List-Received-Date: Sat, 02 Mar 2019 09:15:46 -0000
X-Groupsio-MsgNum: 121823
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lkTb+7nhmha7W+c3"
Content-Disposition: inline

--lkTb+7nhmha7W+c3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2019 at 05:26:49PM -0500, Tom Rini wrote:
> In order to have a stand-alone editor in oe-core, bring in vim from
> meta-openembedded/meta-oe.  This imports the recipes as of git commit:
> commit 7b48bd2be97408107c0dd3c74b1e28f042268457
> Author: Ovidiu Panait <ovidiu.panait@windriver.com>
> Date:   Fri Feb 1 10:07:20 2019 +0200
>=20
>     vim: Enable GUI support for x11 DISTRO_FEATURES

This isn't the latest vim commit in meta-oe, you're missing:

commit c4db3971ab88dc8c012256e987f73ccd4459b400 (HEAD -> jansa/master, cont=
rib/jansa/master)
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Fri Feb 8 22:57:02 2019 +0000

    vim: use empty PACKAGECONFIG for vim-native

it's currently in master-next, but it should be imported as well.

Regards,

--lkTb+7nhmha7W+c3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXHpJxAAKCRA3VSO3ZXaA
HDqzAJ9X84MzVYKWCIy9oqiwLPLJggbUXwCgjiOmqK6IhUpKOMNxkBhbiBt1u64=
=xFyZ
-----END PGP SIGNATURE-----

--lkTb+7nhmha7W+c3--
