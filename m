Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id 601957CCC0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 12:16:15 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id f2so10137130edy.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 04:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fFkK2ow+uR81NN58j4ZwiHRdVgqpGccPV0jiJ+s4L+I=;
	b=pKoew/Nzp+OfjlN7BgxJtmX/iT5C4tywLmls1MQ4ZriDrmRufhe3Q8BB8FiG6I9vSb
	EmfEskQSY59HaHyaT7THViFdsNUrO2f40WSOEgVsrziRQCQGA22W6nOjtrGdGbgOzN9t
	2kZrYb6Z15qTkKOky3g16o6HcZHQVM5tjU/W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fFkK2ow+uR81NN58j4ZwiHRdVgqpGccPV0jiJ+s4L+I=;
	b=L+oSyFYNIH8E65ucDYB3nW+tfxlvpwtRlU+qLiQfsPsFj2kONBeWI+wGFfhH6UidAy
	MBYy/dhPL0aItlAobeoTerPZSlo2dlF/ydhPXGAk0Dc+cKPpDD2FLwpKbbbvmLabY1Yx
	ZVdSkaOs5zYNkEN4YhNKsFUM3cxVSAcDe2dnnzXjk3szm59SdC3R5eklG3V6+omBv4vf
	bWSzZpsp9YcqMe0fyRTvGEUP9LOeYvZqpiiWDX2CFGdWq39zXSWbMFzGRudFBwubs8mk
	r2Ew5U+aRyYhnna+dytUk87oR1P647AV19cWG8SmubN/BzKwvkXHZvLtgzd74GN8fWZI
	X1FQ==
X-Gm-Message-State: APjAAAUlBn/a9YxAuuC4dvjPKDalcrnfoQNbo0htyppIA+Efunt52TL1
	VML4R3Al8DSX285t/V9sNmfOrA8IfJMTRg==
X-Google-Smtp-Source: APXvYqyXgXYQUHZqCDSP9zA/zhgh7e8bDetSAb3xKX05TSj3HzcJODh/W92cyiycIonqBVMLzwj7zA==
X-Received: by 2002:a50:b699:: with SMTP id d25mr23909161ede.110.1551874575874;
	Wed, 06 Mar 2019 04:16:15 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-159-4081-9338-CA43.dyn6.twc.com.
	[2606:a000:1401:880d:159:4081:9338:ca43])
	by smtp.gmail.com with ESMTPSA id m30sm405190eda.84.2019.03.06.04.16.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 04:16:14 -0800 (PST)
Date: Wed, 6 Mar 2019 07:16:10 -0500
From: Tom Rini <trini@konsulko.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190306121610.GP5026@bill-the-cat>
References: <20190306075901.13177-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190306075901.13177-1-bunk@stusta.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind-utils: Install nslookup
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
X-List-Received-Date: Wed, 06 Mar 2019 12:16:15 -0000
X-Groupsio-MsgNum: 121995
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rdbbj4JunmnVtKq/"
Content-Disposition: inline

--rdbbj4JunmnVtKq/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2019 at 09:59:01AM +0200, Adrian Bunk wrote:

> nslookup was undeprecated 15 years ago,
> and installing bind-utils should replace the busybox version.
>=20
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Thanks, I have this locally too but got side-tracked so I haven't posted
my v2 series, I should get to that today.

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--rdbbj4JunmnVtKq/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcf7oKAAoJEIf59jXTHXZSQLgQALpLju4yAJvqOWwNymA3eB3/
TUaxdEVvZS5q490TVw38D7mAdYqrlGrmfWUonzZrzdZzY6+KjQ8aCUgD+e7a0K+q
0Rqk+7j5uMkj7h+tVUR4jdq11Y7p1YfqKmqEgQdc7VslNBdymWtJpE3uVmjqDcMK
uG576lpH/uof6XvBMPKdkj9Hxw6rI9zNHRCUljEuV1Ncf52/iPCkmy/QpblOWwi9
zexfSrYUjrIoj5Tt3oWOeHzIHri47ip579itMc8fRU+IxPXQheqSL1gUCpZIvYNP
QjGV4wLRnEVC4TJTEuv9IFV6HsFuQ0P63e7X1Y73heIK+PjRlB2FWQ8vQA+pSiSY
fxtg9N0c3daoMjRiNC/mYpBhg0lJRDb6qGhl7J8PetOa1u3U3Ni6fd65AlJ9HnKw
MRP7AKyzJSs+dUO1Iejsgg1740gHHWeojA749nC3zg0l8ElY25zWJLxvunnKIe9D
RJUL9iRsjQwRz3NZYJw3asdzGgldduIc9KHzuMw6tYlvosHu7wQMN7ISBbpUcZ6H
IDyq3e3pyoc8zfirQv5nTZvxg2SMIByzoY+x2EiM1IJwX/hhOa0juy3Z/zx8XLKn
42TWC9tGpCwEUzspcgDrYD1yaRzJL7Z21CCvLnkE1ECBa6VKm/RmsBdrI8AC4VD6
h+Fi5j0Wvgo2SRaPTCzw
=oLHG
-----END PGP SIGNATURE-----

--rdbbj4JunmnVtKq/--
