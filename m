Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.157.1616608334537099827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ArjHK9vs;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id d191so13368080wmd.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 10:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=YKeo56S+KVgjYr2gC19AvbCFhB3zAK6ZGU2M3awttBM=;
        b=ArjHK9vsZlMa16PLZdWz390x1FJjWLyv3yG3hFJsb7JfVL3TEvNgB2nG/OrtMrxCJH
         5DnAC3VF505UIwRKI/lvhbn2AIwFqGp+gHbB9kNHIkaLgoqbbR32dFjVgVuiGNAZkrOC
         n5rEf3HX37DDX+tt99ikJ0/SmWL4JZsQe4w7cNC2Mo39aU+LEmFbUV68Vl2MKyj1O8ig
         zGqija0bB0jSqaqpfp8Xzr/Hz9a/aJNaNkTKBawJkcW1urS6XmQ8tumxUxmccsh9SDC3
         Qh/o23/5N8WXh/Lbl6g2CVsK3UoWdGtndgWKaNnqnpZKWZRJZ3KXUa2ieTfNLqcmTHTJ
         qTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=YKeo56S+KVgjYr2gC19AvbCFhB3zAK6ZGU2M3awttBM=;
        b=rZ8KVTDe8bhCakB5KTAkSmEEe7Crr4qcJyr/0jlWnCnT4P+Oreij8fM6HLQY1EqwYp
         +lf+hQbkzijJ48QWuBys7IkQClK3170zdjZRIIko5d50Fvabqok5odbvpSVwa0nEs0ID
         jMDkLQ1Rbhk+3rI4qHiI5x6QFGBKZHtVtV/hahzEIYnAHeelsK6WIbe5882QRqSGtrQ3
         PwhCUzNGmjnDOntq8xeMIh4jPTdC5XP/5bj1uXO+C06aCfjFnuVSO1IUtP2oBi25suFO
         BIJnwzZa2JcTECvEtDLCdZWoZO1yv7U7JXOk7hR6rNSm5qMeE/3NG77vGFqiIBR+nGax
         q0zQ==
X-Gm-Message-State: AOAM531IA/LyHeGIzln69hZO8Pxlm5o3GXfCOfvX5dljDPf46f7tZtW/
	xkN4fb4Xt3mUHXp/uWF+99Q=
X-Google-Smtp-Source: ABdhPJy5bi/5YDnbWPLP6HDhVgcaWXYyEr+2lLFR08VGGJrlLiKPZCokP0P59Blj3W9afO/j29/GNg==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr4053595wmi.170.1616608332889;
        Wed, 24 Mar 2021 10:52:12 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id x6sm3454848wmj.32.2021.03.24.10.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:52:12 -0700 (PDT)
Message-ID: <b2a8c7f6851012111d2bc27303dbf6104a377b87.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 "scott.branden@broadcom.com" <scott.branden@broadcom.com>,
 "martin.jansa@gmail.com" <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>
Date: Wed, 24 Mar 2021 17:52:10 +0000
In-Reply-To: <cd4ac541b34a1d30dd02797cf5a0ac4d9802c8d5.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
	 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
	 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
	 <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
	 <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
	 <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
	 <20210315135555.hlkwmj4yj5ugw2he@jama>
	 <166C88B2CBAB1BAF.20509@lists.openembedded.org>
	 <eb829949abe227556ae2d4ef8c0e11f6141508d9.camel@linuxfoundation.org>
	 <c9335d1e-e133-1c1c-65f1-13fac6b6b43d@broadcom.com>
	 <999621be325d671cabd9a7b9ef270176a87889b8.camel@microsoft.com>
	 <cd4ac541b34a1d30dd02797cf5a0ac4d9802c8d5.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149898
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-UnrC21HRj7RBOnt6PDy7"

--=-UnrC21HRj7RBOnt6PDy7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-03-24 at 17:37 +0000, Richard Purdie wrote:
> On Wed, 2021-03-24 at 17:03 +0000, Luca Boccassi wrote:
> > On Wed, 2021-03-24 at 09:52 -0700, Scott Branden wrote:
> > > I have not debugged yet, but I suspect this change is causing the fol=
lowing failure if I merge the latest poky into our builds:
> > >=20
> > > ERROR: mc:host:util-linux-uuid-2.36.2-r0 do_package: QA Issue: util-l=
inux-uuid: Files/directories were installed but not shipped in any package:
> > >   /usr/lib/debug
> > >   /usr/lib/debug/usr
> > >   /usr/lib/debug/usr/lib
> > >   /usr/lib/debug/usr/lib/libuuid.so.1.3.0.debug
> > > Please set FILES such that these items are packaged. Alternatively if=
 they are unneeded, avoid installing them or delete them within do_install.
> > > util-linux-uuid: 4 installed and not shipped files. [installed-vs-shi=
pped]
> > > ERROR: mc:host:util-linux-uuid-2.36.2-r0 do_package: Fatal QA errors =
found, failing task.
> > > ERROR: Logfile of failure stored in: /hdd/yocto/genx/poky/build/tmp/w=
ork/core2-64-poky-linux/util-linux-uuid/2.36.2-r0/temp/log.do_package.31753
> > > ERROR: Task (mc:host:/hdd/yocto/genx/poky/build/../meta/recipes-core/=
util-linux/util-linux-uuid_2.36.2.bb:do_package) failed with exit code '1'
> >=20
> > It most certainly is - is /usr/lib/debug configurable or supported?
> > Currently we have:
> >=20
> > FILES_util-linux-libuuid-dbg =3D "/usr/src ${libdir}/.debug"
>=20
> Does it need to be set at all or will the default not cover this?
>=20
> Cheers,
>=20
> Richard

IIRC there were QA failures without it, but I cannot remember exactly.

--=20
Kind regards,
Luca Boccassi

--=-UnrC21HRj7RBOnt6PDy7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmBbfEoACgkQKGv37813
JB4DGQ//dFUggyuQCqj08M6k7ilRHgHIug3y5rSGHkzPfaRm1Z8u466+z3hi52Jm
5sP8wFq1aMAQNTIMLERzPUJsO0oVnW74PoJzw491bk3y8sp761oEGEb6kdd9XCqG
AzHU9MGFmDkGpuQzBt2n8t7Dl3lzlHde2Y3mVmQlxiFjWsmgVwggwUkwqneQB7zu
xxthJLb4glQ+Dmg5FWW3gAKd/dY7k8CDMRAvOiqgaog7CgwaHbGXVxS/El4OUUmU
zkS6zQb3nQgPxSwjbj3onLjzeMmr1X0H1UIoTPUMxJvfwCbD89iYT+yxP0OP8GpE
3Yh0Wn9C8Ki8S36feJzNQ21xmiNflYryxLx98H9l7emODGdegfT7Txzu//jGT2hD
O5gqi+8LBL5lMmcucZVUJVY2lUlRsr6FOBTIga7t1O5smHTIlDsd4/xCP67I5cRr
z1S2qy6zMnWtsPtyNGOkKC70x6Bq5XUO3Iziei/pU0n2RtFBQEfWuZ6tIwZ2IBvP
O0SYtL6hWAhaLgJrF6++LeCn+daDRvRcvrSCcRmrF7OrC7Dn++21Ki/YwyZJPePb
X+bKG3ID0ECO1rEIfGAJJVp45ue+CzPqUswVnGORTXFq8D2aJDJ4B+9d0nY34nw0
kepqsrN6sOLy5snw1DKAneoXmLbfNJrNTt4Sllcti9vEcUN+g24=
=ZlGj
-----END PGP SIGNATURE-----

--=-UnrC21HRj7RBOnt6PDy7--
