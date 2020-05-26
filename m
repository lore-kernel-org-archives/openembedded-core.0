Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.281.1590525873723942221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 13:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G/poh///;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id g9so18790061edw.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 13:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K49h5MJkssKSUGqPsDHakiKT+yIUM24FJ0jB0A2Wv/c=;
        b=G/poh///S2BUPe3RgNnQVYYCo5fcNkIHu04GZHRf2aIJu8kHsSGpZY9m4zUsuKdhnZ
         dG0rBpvz+rsl3ODkBp9kY2xzsckJC8dXCNNx0v/oeKrzt2S8+cYhfE0FxirFJAika2ek
         /mNTD+nAoKmm7t68R9VxoP7D3ePfWQrMhOfmmNtzXg7elZzeYrcNVpm96PqCLwIGDYvc
         GvawTz1RY0pvPrxJE1OGGDB+0LawCXohOqBQfr81mrnDO0ZdNwRGzS5/lmNsDFvhmrXS
         2vOzxw2EkFfQI01hOti3Y/PLnhFyUTILzWE40m+2eJmsuwJpG2+vtCZqS1j5G6Is+/wL
         cZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K49h5MJkssKSUGqPsDHakiKT+yIUM24FJ0jB0A2Wv/c=;
        b=JeC4hLAoJJb8+Wy2CgI1gydWgI/MDc9Ws5ckcGp6B/+kyMcH9eDo6mszsnfE3VYDTA
         zpN+oPj8YqgQtg8NgQieG4/4qNPQ/kXVf6UWBue3hCa/Dmh22B1y3qy6uMkE87Oqpp+T
         Jyf0YLOl7Njoa1LaLlVyNpygqnBNHdc8kMKTYoDcIIc+4meLrbsLZd5JaJEe4XMz3mNy
         Xx4fMXG+wmYjiisP96GcMZX8RvqFZal0U1/v+aQNyyZ40eOImef7ADy5w+FvXIG95GLB
         KWm/cLxiO87YUd1uleC/ULwRMc/gXhZ8VSuA9wfcS7VJWD02+vH8lHbQV+aOdDDcrVy4
         Cigg==
X-Gm-Message-State: AOAM533bePv5zpGgz40P0sO8agw8oqaivYXXwdWfqBXNdSm4k0zBnfZA
	k6oS/G0ee18W9TPo/l+Vs0k=
X-Google-Smtp-Source: ABdhPJxch6hwEQDU/3Yt0n4sAYWRQcjOnlzDzzLiG20ZB/mtm2rhagZW2wses12DtIYO3ceCKaXcjg==
X-Received: by 2002:a05:6402:c0f:: with SMTP id co15mr21090501edb.286.1590525872209;
        Tue, 26 May 2020 13:44:32 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id on20sm691668ejb.70.2020.05.26.13.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 13:44:31 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 May 2020 22:44:30 +0200
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/6] perf: drop 'include' copy
Message-ID: <20200526203944.czx4xbpjblwnfdgf@jama>
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
 <eb27cbf9e4e86187a79967546674a0156d722c16.1571688520.git.bruce.ashfield@gmail.com>
 <20191021202444.GB1500@jama>
 <CADkTA4O1v-GZi-mkt866dpazowHsGZPrjwPuLi_Ry8vxZn8aqA@mail.gmail.com>
 <CAHtQpK7g400jDAUx+tYedCF6c654OQhCT+wZtKm7x3+_Gkr9SQ@mail.gmail.com>
 <CADkTA4PV6-Oh=s3TTnqCTMfAOytU+=rMWCAqSPpHgieZ7HcLDg@mail.gmail.com>
 <CAHtQpK5bDbibVfHytO5D2ksc-=93pHuSEdYY7+GJzdXFPwGmUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHtQpK5bDbibVfHytO5D2ksc-=93pHuSEdYY7+GJzdXFPwGmUw@mail.gmail.com>
X-Groupsio-MsgNum: 138739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tbdnhxdahydl7oe4"
Content-Disposition: inline

--tbdnhxdahydl7oe4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 10:22:07PM +0200, Andrey Zhizhikin wrote:
> Kernel 4.4 is also LTS and has (had) a very long time span, so I
> believe there are some people out there who might still have it in
> their Products (industrial applications are pretty conservative guys).
> I have to admit that Yocto 3.1 + Kernel 4.4 is a rather strange
> combination, but it also has a valid reason to exist.
>=20
> I guess reverting this patch is not really an option, but this topic
> deserves then a bit of documentation somewhere so people can look this
> up and have a quick fix for themselves. The question is: where to put
> this information?
>=20
> Honestly, it didn't take me long to find the commit that solved the
> build, it took me rather long to figure out why I didn't see changes
> from it on the [dunfell]...
>=20
> >
> > What exactly was the build error that you saw ?
>=20
> Exactly what JaMa had and fixed with his commit, namely a multitude of:
> <bitops> error: #include nested too deeply
>=20
> and some of:
>=20
> <snip>/perf/1.0-r9/perf-1.0/tools/include/linux/list.h:5:10: fatal
> error: ../../../include/linux/list.h: No such file or directory

But this isn't your only issue with perf on 4.4 kernel, right?

I still carry whatever is needed in a .bbappend, for dunfell I have
also:

# The tools/lib/api in kernels older than 4.8 don't respect WERROR env
# variable exported by perf.bb
EXTRA_OEMAKE +=3D "EXTRA_CFLAGS=3D'-ldw -Wno-error=3Dstringop-truncation'"

# scripting PACKAGECONFIG is now using python3, but perf in kernel
# supports python3 only with 4.17-rc1 and newer kernel (here we are
# currently using 4.4.84), see:
# http://lists.openembedded.org/pipermail/openembedded-core/2019-September/=
286902.html
PACKAGECONFIG_remove =3D "scripting"

Maybe some of it got already resolved elsewhere, this bbappend just
collects whatever tweaks are needed when it gets broken and I very
rarely have time to go back through them to re-check if it's still
needed (with newer oe-core revision or slightly newer 4.4 kernel).

Cheers,

--tbdnhxdahydl7oe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXs1/rQAKCRA3VSO3ZXaA
HN5HAJ46EARE60SdRFHL/lKgpxRmBNWIcgCgtzPSmFF72iC1LspbUFOXPE6ZC1Q=
=XgwW
-----END PGP SIGNATURE-----

--tbdnhxdahydl7oe4--
