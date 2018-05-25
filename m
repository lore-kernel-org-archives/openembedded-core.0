Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9251174D03
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 05:25:09 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 94-v6so6934182wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 22:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iuOzpdx9g3nvKU6ynxq0DTSwqYWmfpG1LBx63Cgd930=;
	b=BQSZrgA8jw/cxXim2Dg4KREsjkCwjumj/RjnxhTMo4bIMpDeNrkWY4Ktr9gSejtiUx
	/hC60FnFNz29mpD7qJIsVOkLyt4qtnyAdASyRDXRsQXUyv5VRqXE+awV8SJ8R6L0mkIR
	fLBdOvBVbrwU4qSgIM1tEVtwoNxHMAY+o1CTbhVKCAMAZbxxWa4bSoMVkPEzSVTnO63k
	bl66+rP0n+PNLQ0Uid1vSzPHtYeSF98BA6ALIcevaNQjPzh5BkA2WJvZXAmz7rsyIZyy
	3MQNJYcgez/Xpv2rC9eVpXSFmBVGiWPNB06rwGJwkdg9VKXV4xYAv4x8b8ax5lWUzFZu
	LMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iuOzpdx9g3nvKU6ynxq0DTSwqYWmfpG1LBx63Cgd930=;
	b=tTcgbNcY1zTiZkdJqKNp/7Iuacy9rvuB+4B8bYdvCxVjh++953ccWXIv5B5oFgJFFz
	RflhQXLEUSNsN2OFMwWed3kpumLkz9iS6sOEh8EctbgUsOtePayuG2atgO4v0kA5MbP8
	I3Lgg0LWsu8NMaz3fZlPHemOIOJb9RjO+dIRZgu3PDvsnYR1JA9PSCIKYCFx8ECNJaek
	Yi/yYwSzYGt46O8MaFx1f5MhnhblTvaGk7+A3gPfZLit8D25uXAh8o6sYZEmP3REdPos
	lmBoLYjIk5kcqo1EfYg1EsrkYoEybHJVP2xsqXHiiNOqV1L3S6dOZ5p4gZguL8515eGT
	lvPA==
X-Gm-Message-State: ALKqPwfugAaSPlxH/YbZJ3+1YcS350Sy7KBjcIGBRgDDK2hYcybeGG9w
	IfI/GiVRThAddTRcYL7CzFLTZw==
X-Google-Smtp-Source: AB8JxZpEAfypUARHt2xSU00+973cUht5+ETMia2eMVu2/S3Rb/pK7QwigvLBonMig8HoTRyt99GJWA==
X-Received: by 2002:adf:800c:: with SMTP id 12-v6mr780300wrk.45.1527225910731; 
	Thu, 24 May 2018 22:25:10 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b14-v6sm359934wrn.57.2018.05.24.22.25.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 May 2018 22:25:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 May 2018 07:25:18 +0200
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20180525052518.GD1395@jama>
References: <1527194374-2490-1-git-send-email-daniel.diaz@linaro.org>
	<CAHUNapS-0876NrNQB8=hwNSOHz3GSAFxZ2MkkovhvseSQgdPAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapS-0876NrNQB8=hwNSOHz3GSAFxZ2MkkovhvseSQgdPAg@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: bump to release 20180515
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
X-List-Received-Date: Fri, 25 May 2018 05:25:10 -0000
X-Groupsio-MsgNum: 111739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W5WqUoFLvi1M7tJE"
Content-Disposition: inline

--W5WqUoFLvi1M7tJE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 24, 2018 at 05:38:22PM -0400, Trevor Woerner wrote:
> On Thu, May 24, 2018 at 4:39 PM, Daniel D=EDaz <daniel.diaz@linaro.org> w=
rote:
>=20
> > Patches are still fresh as the meadows.
> >
>=20
> meaning.... ?

I think it means that he didn't test it very well, because just renaming
the file without updating SRCREV didn't bump anything and the old
patches still apply cleanly.

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W5WqUoFLvi1M7tJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWweeFwAKCRA3VSO3ZXaA
HDz6AJ9gsjxgmLfQsU8ZX8RPAG3kl2EsnwCfTVlBQ3fU6ojH04oHU5ERxxtwTqY=
=G51r
-----END PGP SIGNATURE-----

--W5WqUoFLvi1M7tJE--
