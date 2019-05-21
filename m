Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7599C7E259
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:27:32 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b18so18335315wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uFzIgsGUgRfU/lh6DCaUitDrSXnzqX0elIIO/Q4U7DU=;
	b=jyB10cGgkV7fd6XZUvE3d9FEUhnMr23LiE5je3obcoqyhaMz3LiuWSUlE4MDUrR9Ea
	9utKPUhRfp7L1n9jc4BD67dRPvyvh3jxZqLzo10BZhWV299ktsA3UEg+94hvfNB08sRM
	6tAi7SIYLdVjpyh5PRaVtBro/vN+0Z3sAJ1AJYf/B6l6M7sTCvneMiixvEmvpifrTPIy
	IwEe7Xft/dZq5q0Qz/Myst9fbBnHjB9Yo9rXb3VvY72SUez3rt9/Tv1YMoarFc5tMItw
	26mf4aHjYlnSMO9RU9VNIBEMF5b5MVSrS77jmmCjKYnJkvPOBM6JUVrPzqSY35xi5VKO
	J6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uFzIgsGUgRfU/lh6DCaUitDrSXnzqX0elIIO/Q4U7DU=;
	b=oqVpI05dQsE3J4/vqFmPId8TcjDqaSnd5XUFmkayOGvxuKkQD4C6Cr1bmS7397jm80
	9oueNXmpsFD/DSGPu2Eci3XpcMsWUjelDbvpisbh/4RHrrLeWIYza2/lXR2ECIqGmDbc
	NWCsE+zJgkM3tBZhyW0DyHu+KxZkf+cw3KACoRQvlMMX0nNHgnKGSN4tlOubzfJQhYjK
	f+mAgDVWnatwpI1jW/H2qYJn0gud7zHH7Miy9ThJR07RzJrkIIbsRX5A/WwLTkqGX/OM
	XgL9LMR7ANnfkVV8ywARGgCB5dIsWRcx0Qnr0Q1AKb9oprei4vF4wa5QY+txd3ylgOUY
	ushA==
X-Gm-Message-State: APjAAAWuetL9YBdEZU9xGq03KWHEoiwrJsObKUi640w0FOhiMx3F6xEL
	n0PV2sVtSn0ADRZYN9WyI7i09h0l
X-Google-Smtp-Source: APXvYqyKST9bLKuj9YmMVd5V1eyx8gn0CtmDgZmsgaZoKCYwAGBqaF/lnMj6ZxWKDLUTTtgubiFcKg==
X-Received: by 2002:adf:8306:: with SMTP id 6mr37292943wrd.155.1558441652891; 
	Tue, 21 May 2019 05:27:32 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	h188sm5421963wmf.48.2019.05.21.05.27.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 05:27:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 21 May 2019 14:27:40 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20190521122740.GB23597@jama>
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
	<CA+chaQc=0udH-S+KDne=EEy73aUt1boJX7+2Ah3Q9v048aomMA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQc=0udH-S+KDne=EEy73aUt1boJX7+2Ah3Q9v048aomMA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Tue, 21 May 2019 12:27:32 -0000
X-Groupsio-MsgNum: 124786
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline

--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2019 at 02:02:10PM +0200, Martin Jansa wrote:
> Thanks all, I think the discussion made it clear that we shouldn't change
> the default yet.
>=20
> Makes it easier for me as I'll need this PACKAGECONFIG backported to
> warrior as well (and we shouldn't change the default there for sure).
>=20
> RP: please take this for some next master-next.

Ping?

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXOPuuwAKCRA3VSO3ZXaA
HHDpAJ94aSypsu00ZFdeYPFQnRf7nlzuOACgr5EcyIaspYBRQ2fB4PNwqxraDT0=
=k9n1
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
