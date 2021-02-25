Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.763.1614274681396829380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 09:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aMWKmnPG;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id d2so7937094edq.10
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 09:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=spU6yf3fZY7DvTPVrdRQ1gOk+LKT9VfiTh8kDsLBxmw=;
        b=aMWKmnPGmmGDuEf78ucTgLwdBiS1nmPEhESeEJU+5YoVyWUpDle2kQOdyDdDHxsbnV
         /iHj0ZFwRa4MvSu+tRQPKyuG5yAE/QZhbFZxMu9o3VdUvztRTh4Z6omeIlF8HlZIdyEi
         cf2cmBCPmkF1IDLS4QXw4AzraLyz3NDM42rh07hCvnYkK35OVzK4QqSEr5ZyZXH+yJrE
         09uCzyIEi3LbSIP+F8/Qx240huPln2IZ0tjyWRt7pKwRky7yXfMqlSWXX/OVEHnoUQfX
         wYeeha14uWvWxrwR5cUN7a4Wo22DhPSpMU2IujVNyj+l13y1jNDjOMJNT9snonRPwtf8
         IOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=spU6yf3fZY7DvTPVrdRQ1gOk+LKT9VfiTh8kDsLBxmw=;
        b=EVLFuDpLriOb1ldvVVVWKQW9O2n0p8wmcvTP/nWo/JZpTXVn6suDY0O1L6N8CqAarv
         X/78WFu3Mxd0FEc5OUhext+9WC47uE/d+/jyKJ3Exv6SVnBBEhC0Ew4TarcCT4REXq0K
         KQkMMvceK/xk+gShvC1ODHR4zNj5nrAscSgRdPI5brfukch6xQ+yDuTsgz7tWvOj8Z2h
         KvlomfH1WOYh5kcwp+NHldgj+DBeqy+ffyNstkAKGeT9EjCa78ZKuNCdD5fx5fpPwNuK
         /ksu346DW7FyW9dirI+zYWRlXyouRRe9h/yoBJDmOAkNa4aqX/WQmNfanii+TfQhvnGE
         byQQ==
X-Gm-Message-State: AOAM531eDDcglOoUnr7ZWgQqB9lEh1BcZJqzXnTFIhIflIsQJ58i10Al
	bJlWSfuOJBb8AvTnkgAasY4=
X-Google-Smtp-Source: ABdhPJzFilZ68tSqpz5MruW6fKECU4EFrkevYwfhcqRHfmm9iYMfYcsNCVpBNF/itnGxAPZdMEUAFQ==
X-Received: by 2002:aa7:c044:: with SMTP id k4mr4117904edo.47.1614274679680;
        Thu, 25 Feb 2021 09:37:59 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cr20sm3089459ejc.57.2021.02.25.09.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 09:37:59 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Feb 2021 18:37:58 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [v2] Merge meta-rust to oe-core
Message-ID: <20210225173758.ao34u4demrbahfz2@jama>
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
 <20210225014823.397741-1-Randy.MacLeod@windriver.com>
 <ad16b82158c2fa88c01b8b0962cc0455595b5b64.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ad16b82158c2fa88c01b8b0962cc0455595b5b64.camel@linuxfoundation.org>
X-Groupsio-MsgNum: 148610
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aq3f5m7a7fdeh7ki"
Content-Disposition: inline

--aq3f5m7a7fdeh7ki
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 04:55:43PM +0000, Richard Purdie wrote:
> On Wed, 2021-02-24 at 20:48 -0500, Randy MacLeod wrote:
> > Added or updated these commits:
> >=20
> > =A0=A0=A086109491bc maintainers: Add myself as maintainer for rust pkg=
s
> > =A0=A0=A0...
> > =A0=A0=A0b411e322b3 rust: remove container build scripts used by meta-=
rust
> > =A0=A0=A0c646d47ebc rust: update the README to conform to being in oe-=
core
> > =A0=A0=A0e19d823567 meta-rust: merge commits
> >=20
> > The last commit update was just squashing a new commit from meta-rust:
> > =A0=A0=A0f8b9103 Remove checks for Rust versions we don't build anymor=
e.
> >=20
> >=20
> > To Do List
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > 1) cargo-bitbake - the README suggest adding this using desktop
> > =A0=A0=A0cargo but once we get the SDK merged, it should be added ther=
e.
> > =A0=A0=A0Someone suggested using devtool for this rather than cargo-bi=
tbake.
> >=20
> > 2) Fix the SDK libcrypto, libstdc++ glibc-2.33 problem. I'm running a
> > git bisect using poky, meta-oe/master, meta-rust+SDK patches.
> >=20
> > 3) Add a test case to either:
> > =A0=A0=A0- just build rust-hello-world or
> > =A0=A0=A0- run it in qemu
> >=20
> > N) Fix *some* of the remaining bugs in:
> > =A0=A0=A0=A0=A0=A0https://github.com/meta-rust/meta-rust/issues
>=20
> I put this into master-next to see how it looked. The build hasn't compl=
eted
> yet but so far:
>=20
> rust-native doesn't build on debian8:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/40/st=
eps/13/logs/stdio
>=20
> oe-selftest:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1855/s=
teps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1887
> (others will likely show the same issues)
>=20
> which is basically three tests failing:
>=20
> oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs
> oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs

Not sure how to read these, but it might be fixed in upstream by:
https://github.com/meta-rust/meta-rust/commit/920328c8d8dd553e69309733d874=
229af4fa159f
the sstate-diff-machines.sh doesn't show with an issue for rust-native wit=
h this one applied.

And it did show an error without it:
 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwe=
en qemux86 and qemuarm =3D=3D=3D
ERROR: rust-native different signature for task do_populate_sysroot.sigdat=
a between qemux86 and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile: OE/cache/prserv.sqlite3, IP: 127.0.0.1=
, PORT: 46469, PID: 57036
Hash for dependent task rust/rust_1.49.0.bb:do_install:virtual:native chan=
ged from 7334d76a4757c1b893a8c2b8c85ada005788b3adeff5a33fe509c43f994d91c1 t=
o 162ccf6462851630b0816fdb5fbe68f6b158b81f4ce3ed45ec4c1f258f93212c
Unable to find matching sigdata for virtual:native:OE/meta-rust/recipes-de=
vtools/rust/rust_1.49.0.bb:do_install with hashes 7334d76a4757c1b893a8c2b8c=
85ada005788b3adeff5a33fe509c43f994d91c1 or 162ccf6462851630b0816fdb5fbe68f6=
b158b81f4ce3ed45ec4c1f258f93212c

ERROR: 1 errors found in BUILD/sstate-diff/1614274412/signatures.qemuarm.d=
o_populate_sysroot.sigdata.log

> oe-selftest -r distrodata.Distrodata.test_maintainers
>=20
> so the maintainers entries aren't quite right which is easy to fix and=
=A0
> the sstate signatures aren't behaving correctly which may be more fun,
> depends what is wrong. Those tests explain they're broken (which is what
> we have the tests for) but more investigation would be needed to=A0
> understand how/why.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20

>=20
>=20
>=20


--aq3f5m7a7fdeh7ki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYDfgdAAKCRA3VSO3ZXaA
HG08AJsFbkdUhs4ZbgxLWg/OXSpJZMjM/ACfRAJvUcJ20uDDN/ZATt3VUR1ie+4=
=JlFw
-----END PGP SIGNATURE-----

--aq3f5m7a7fdeh7ki--
