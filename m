Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 777086025F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 13:30:57 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id x49so265258wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 05:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=B5JWrw5Y8MWQFMW/WoT+H6E+zUM/L6A9Hgr8P6+Yb4k=;
	b=VugSdPQyGnMHg9O4XkiGaJTkFOhYvm+lxcjuHX6bV3G2YtHEiLW1Rvhem0s8LGedV7
	XXX4Z49VQnAZWaE02278vI29p2fDV1ISKxxmOn9WkJPr5IhEDwEyponBRwW+BPM1Qg0c
	uMDXtIw+MiY1sWHpKGQqRR+PxenuXNM7ax22ViqGumCrhZ/UfnTSffy+gHDcSiVx+07j
	13IlQgbH0zHEBGFYoU+aCFe+4HHVeEmSREYTlxh9nKUa6wC+daX1Q0a5FyOqNB09UDqO
	+rbSp/bJudJJv9d2VI+vCWDHE17yhtpCafC37uIDFuBCpKh7T2aQVskRX5xcQYpDYnda
	vbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=B5JWrw5Y8MWQFMW/WoT+H6E+zUM/L6A9Hgr8P6+Yb4k=;
	b=IPSKqDiDloWYbPfjZlz1lXvqA80z5aSD75fbYC1jP2VifYvhjaOj0fLfmPopaArUIe
	GC2uyAqtol02QQ+YYozh3CYirSNTrCVow9xWHXMr2E8QZHZFsqy/ZgMG0J5VtGOcIov6
	1dCzsAu6TWIiGYs5hMQHhtTfMirnwj2M5eJqgVPtVEf+ZRjkQ06wwoWVbr6YOozKhtuv
	duOD2QRyQ9keOMFPvSuA9MyuExNS52WII++F0hHi17XXuFzUBRdjWmgQdQEv3NDsEdNG
	up5taB71FASNEUdceOuPcPIckffPkk7jlLXxkWQPpARbo/KBVXFlNeGjAnlGP/igM3q7
	7u4A==
X-Gm-Message-State: AJaThX6y2XI0Qzi3463rmScChpY9haVcxs1T61k5OIWbqnobQ/3EeeTW
	mQ1mwxUHKnAx4HediOi+C4A=
X-Google-Smtp-Source: AGs4zMYi7ZxPLsVJcYM9zntdaWQ2wPIbi6r18fwXTCPGYNW9M25+3ATroCxYYc8vRvFaiAryiH/8Hw==
X-Received: by 10.223.158.203 with SMTP id b11mr15696874wrf.256.1512480658119; 
	Tue, 05 Dec 2017 05:30:58 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d23sm469449wma.48.2017.12.05.05.30.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Dec 2017 05:30:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 Dec 2017 14:31:02 +0100
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20171205133102.GB4220@jama>
References: <cover.1512256681.git.akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <cover.1512256681.git.akuster@mvista.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: akuster@mvista.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/131] Rocko-next pull request
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
X-List-Received-Date: Tue, 05 Dec 2017 13:30:57 -0000
X-Groupsio-MsgNum: 105873
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline

--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2017 at 03:19:39PM -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> conver letter only.
>=20
> please concider these changes for Rocko next.
> Clean AB build.
>=20
>   go: Fix build with PIE on musl

Is this change (or similar one) needed in master branch?

master is using newer version of go-dep since:
http://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools?=
id=3D0fff29b79f7763223d2fe3ebafd315d030ef6e8f

so maybe this change doesn't apply there or isn't really needed, I've
noticed only because with rocko I'm now seeing:
ERROR: QA Issue: ELF binary 'work/qemux86-oe-linux/go-dep/0.3.0-r0/packages=
-split/go-dep/usr/bin/dep' has relocations in .text
and I don't see this in builds with master branch.

Regards,

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWiaflAAKCRA3VSO3ZXaA
HCkoAJ46HA50h8qCWpDAo38D4fBb6ICKXwCdEfZfCkHP9j0m6se73BmJN7y2has=
=rmkw
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
