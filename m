Return-Path: <danismostlikely@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 082EA79D57
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 16:38:12 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id a28-v6so12422889ljd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 09:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=j+d7wjarKfLygZVb9cdrp0eCFyQY48VqN2elG22PGiw=;
	b=sKhUKHIACSRbmGMmzNkXkbo0/KFztBUv4EUWS/DzJW70luH4iWYjPXVU1K4HIF2rc+
	tZhAEd06VJddoHW7Em9T06qSTPkjeAqWVZS1UW96GeL7fIKcJCVNhgREiKZ83VuNP2OA
	as1PkEDnq/6LOD46Vpqae2Z5t8YWY2A+yepEayeOfQdavHSKZWZvAL+kYiI9qVTvUw6F
	lgA7URoINfeV5vbwThinPesHvrl63nJ7tLFjYHG9r70QCALuv5A9xev2fftHowcin+8+
	FE9Or0t9IrBdE36L0FtYrfSA7HVdalzmElSSiZtfbtdRybJ9aCq/gdQmQ2CKbp8DL8Ug
	cvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=j+d7wjarKfLygZVb9cdrp0eCFyQY48VqN2elG22PGiw=;
	b=AMtX9SuZOy8b76W56rQSIS57aATL53dhWgwRnxxJQp6mYzfEsGduYL6hb62xewEf4R
	rHjb/uej/tKFgK5Y5DGs9rWL31/orCTXBsJzqopa+Vn+HquAmbIND4hNqyq6tg4RVl8f
	GUychMqUseU22VITKA2y3NFfxjHBqus/NGv/iM3piYo0bzKSXiLOL4ITqnvYRzcUlbM5
	AgUf6C03nrCwwUyAj+OxzZsx0cf/flifJn9jc8t3bp8YhASLQdOIo7FdGQUCjAjygAz2
	1yosjr2bN7P9TY/XOla7AWQhOgRpSAp7VOKr6RWiLQxDhJLZSv1Cc8P1Cy2BGm1zCl9X
	D/zQ==
X-Gm-Message-State: AGRZ1gIO5PUwX57gja/7KnYbpUU89BxuHEL0YJPGBk77PPbdnngIP5WW
	wtPRk81GtUAJ4tVccQQtx+KTHuGyiReqE/FG5/RjoA==
X-Google-Smtp-Source: AJdET5e06uRGBV7XJVnSBn1/wAg9WgP9zC2OxGTRV0NqBhE3ZB/6Xe9Q480VPevJ17gm5jffaCJY9tYh0FgkkZ3Gc0U=
X-Received: by 2002:a2e:9c59:: with SMTP id
	t25-v6mr2762893ljj.107.1541003893444; 
	Wed, 31 Oct 2018 09:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20181019152214.1600-1-o.mandel@menlosystems.com>
	<CACS+7ZTTdXs4WuMqBede2KPrsxWu-By1CvZ8t8SvLzRUU-Z6RA@mail.gmail.com>
	<6d4e8838-01fc-1452-0676-e6657b428fca@menlosystems.com>
In-Reply-To: <6d4e8838-01fc-1452-0676-e6657b428fca@menlosystems.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 31 Oct 2018 10:38:00 -0600
Message-ID: <CACS+7ZQk2k0-xc0P1mkjf_690CepGvynJoTck_Ggn5dUMaaRkw@mail.gmail.com>
To: o.mandel@menlosystems.com
Cc: marex@denx.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] npm: change install directory to upstream default
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
X-List-Received-Date: Wed, 31 Oct 2018 16:38:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Oct 2018 at 04:39, Olaf Mandel <o.mandel@menlosystems.com> wrote=
:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hello Dan,
>
> Am 26.10.2018 um 19:46 schrieb Dan McGregor:
> > On Fri, 19 Oct 2018 at 09:29, Olaf Mandel
> > <o.mandel@menlosystems.com> wrote:
> >> -NPM_INSTALLDIR =3D "${D}${libdir}/node_modules/${NPMPN}"
> >> +NPM_INSTALLDIR =3D "${D}${libdir}/node/${NPMPN}"
> >
> > =C3=8F realise this has already gone =C3=AEn, but should this be
> > ${nonarch_libdir}, or does it use /usr/lib64 or /usr/libx32
> > correctly?
> >
> For me, libdir resolves to /usr/lib, so I didn't notice any problems.
> And the "lib"-part is hardcoded in NodeJS (lib/module.js:
> path.resolve(prefixDir, 'lib', 'node')).
>
> So if ${nonarch_libdir} is always ${prefix}/lib even if ${libdir}
> isn't, then that should be changed.

Okay, that makes sense. The behaviour of nonarch_libdir is as you
described, sp on certain targets (ie x86_64 or aarch64) with multilib
enabled ${libdir} would resolve to /usr/lib64.

>
> Best regards,
> Olaf Mandel
> -----BEGIN PGP SIGNATURE-----
>
> iQEzBAEBCAAdFiEErGOsr28GGMKRE/TmVL2dtGJSHf8FAlvW43UACgkQVL2dtGJS
> Hf8gLAf/aIQ5z219f1Tqtp5Oc1mBr4IN3T/Uzk6MlKKtqfQGS2KBF7CqWLUKNXT2
> /eKa/v7H55yTWC6PSlJjx7HMzJK9mhwZ84LwAQ4rpj6ZBn1RYjv4DBdgPxlQN+1N
> 4kAoWklpgBut0eNtb9hniwf2VhF7rkI8eLVdNcL1SR7JroDahSnjVGozuE/asxK0
> yJHHaz3cbe6QooYKeyi4y6lM1wJfP5Wny0rOCMh3rWvsexf7G7itki0MoRU7dNVv
> C2zK+/KVjhYbLWSRijSYjGRFpMzKb9AddBxkpIZ4z7vjAlbbbYN1iw3RdPoiPYhP
> rwvtSk3Wwe4McsVUjRaEFxwcdCPQQQ=3D=3D
> =3D1BcQ
> -----END PGP SIGNATURE-----

