Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.7106.1620826592819383305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 06:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uWVPLdb+;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id t4so35098998ejo.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1O6znpU8f705l0nIzB2W3vqWn//a+M4QR5xXhJtsImc=;
        b=uWVPLdb+/cwUwQdi7o0ZoFlHB0HiJ0uOsQfiEuUjnWmr7bY3yoRfVExNMINclLQZpj
         OeCRvqKc/Kxq1Sz0RFbw2Cptfoh+TlnMTbr7pGcr8txGH/kvIKYwnGanezuarbpDomiN
         nRFcuy/gFssplZx8KTvdT5ldEID++0h87us1dFN8BtVas48Q0C3q+S1e8GTko1w9vidz
         /gKZx+edACYwvTf1Wk5UUsI6R21r14UDVSiu5Cwmrn4GUTZq9i5kY8t4gxqVbQo9lwwH
         4HHaKFxXGNbi/104N9+S33JUZa6u5QltylcfkmxTdIXRmpNfQfCy0uTMlFzqvOukOvp8
         YhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1O6znpU8f705l0nIzB2W3vqWn//a+M4QR5xXhJtsImc=;
        b=A9dC9YuhqBr/5lQ9X4ZBI4m3RCQBQQuD6njAwFm+7I8WPOThupHKVo/f/ZX0dRY1zC
         XjX27m7FyPAE++CFwZmw6pXUHRk1hrjaLJevO+ROe8x/b/UWqcP1k1GFn/gIEJknx2U/
         PvP4JUciEE6I/2OP9sh/eG7O2ksAdl/AVi8O0lXRCCNtozf9DO8b+6c54YEtQxkdtcZG
         QmHz0yqHT7PYGiPwwcxbvymbHfbp6MTVJfDQSDtPxe7eJlk4N4cQz9Q+ONeCevMp4Y29
         WCDkK1LyGrCA4O5x0NPyJXugKZNI55BbSEI19WZQ8tsqx+3P6YOnnmbVkUuAkW8oQVIN
         Uw1w==
X-Gm-Message-State: AOAM530yymY32CVx5SHLywMFmV6YI0xFu7ugYrDowj7HfeNoxOkuMFY6
	oWZVOrSRRrp7wyW0q1KEkPM=
X-Google-Smtp-Source: ABdhPJwJEO9SxRsoXzZ9ZS7BUEokhCRJvkhaBYkuam4E8NMj1ub68xj8pZW5FXzvnWOpL1P2OI+pzQ==
X-Received: by 2002:a17:906:cc5d:: with SMTP id mm29mr37100511ejb.362.1620826591236;
        Wed, 12 May 2021 06:36:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i8sm12939890ejj.68.2021.05.12.06.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:36:30 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 12 May 2021 15:36:30 +0200
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: backport DWARF-5 support
Message-ID: <20210512133630.aqqp7ocfbz4wgh2e@jama>
References: <20210512124221.61985-1-Martin.Jansa@gmail.com>
 <CANNYZj-wzHbziSLMPVh40qpnHntcRyqxpTa+g+p9JtqSeZv42g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-wzHbziSLMPVh40qpnHntcRyqxpTa+g+p9JtqSeZv42g@mail.gmail.com>
X-Groupsio-MsgNum: 151635
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mgwh5rrcbbv7tkp6"
Content-Disposition: inline

--mgwh5rrcbbv7tkp6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 12, 2021 at 03:21:53PM +0200, Alexander Kanavin wrote:
> The patch backports dwarf-5 support to gold linker (presumably from an
> upcoming version of binutils?), which does not quite match the title or
> description?

gold linker is part of binutils, so what doesn't match with title or
description?

And yes it's backport from newer binutils as the Upstream-Status shows:

Upstream-Status: Backport [5cde809b7b9 Add DWARF 5 support in gold.]

And you can easily find it here:
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5cde809b7b9

--mgwh5rrcbbv7tkp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYJvZ3AAKCRA3VSO3ZXaA
HG/GAJ451c9lk3NWSoii9uBBb+g9TWcU8wCcCaVc2Vbfp5F50E/Qd5Bwb3aFMqs=
=Qkss
-----END PGP SIGNATURE-----

--mgwh5rrcbbv7tkp6--
