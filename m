Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.14707.1604068910021675145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 07:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L4fb8py7;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id t25so8885367ejd.13
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 07:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WkX1ATW2UkqZ/niAFEtAw+OljjXzBSjrF7wik/VzVIo=;
        b=L4fb8py7J+Zi87sbiHHoEZTBRkKQ2hJX5lkBcMY33FhwylF+gGF3s4f4a32X6gCrRr
         Z35GaaUoJj7fNVrrlmN0XG7hfRhLyEBsI60LAA9WiOB2NVTsRbsHxMyq1tWJw0S8a7nf
         XReTZEoW2gcoRQxqvTlYSltpFN+5hNw+dvxfbc15Dx8U62zvj5TBI9buajn7y0nB+gnJ
         43QHSXxhK5kZrPFtf4mF/nmHn3JpT6YaCZ5djkXKqSQDGQUd0ENGLGh18xWQsQ7xVL3p
         NKop+7QMRGGB+hZdfdS4diBfK1kcHAggKM/tcHb6SeYxVAYppfF2qNOTlETG+VQ7gf3Z
         mGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WkX1ATW2UkqZ/niAFEtAw+OljjXzBSjrF7wik/VzVIo=;
        b=pHvS4H7O9NcM+SCmAcXWRyxVLanj0jNduq+FkbDqLVnbMCksOuswcH++jfgPYepcI4
         3ehnybq+mhLUKdXSudEtBIWXZ2VsirX2FcYVaNAjjSkkzO3XFMo50iiN4HHSMD/v36YG
         6V6MlECYTaSNoIwu8RhiT2di9GeE8yLnwY0gk/7rFAUXB7yxETjP19hfaVzaxFB5VWPR
         DoxX0kzBoOqepOtjBSwRgwTQGCYBCBKHjSwK3mLnxVJIWOuLCH049JZiIJnUlAqJNvPA
         wrjtbZhLu8CrUCa3uFz7IoBEAXPWFjkULTFSRWdwCDotjc5otZsF8r9w+YU1u/4NsDFJ
         hdHQ==
X-Gm-Message-State: AOAM533TPHszH3g3CeIBVJqLg9FQlIjJ6VR0EchRiobNygYtjjmn9uFn
	xiTZFM5Bv1/8YXR5J0hOL0E=
X-Google-Smtp-Source: ABdhPJyq9ikCfgPKpdgWW2WRxkaB0pZvEYorKJ27qmBA5CNOHVVb1xdkS7KRaKoC/rjD48CJsD7jQw==
X-Received: by 2002:a17:906:a4b:: with SMTP id x11mr2898464ejf.11.1604068908501;
        Fri, 30 Oct 2020 07:41:48 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bk13sm3054165ejb.58.2020.10.30.07.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 07:41:47 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 30 Oct 2020 15:41:47 +0100
To: Steve Sakoman <steve@sakoman.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell 00/14] Pull request (cover letter only)
Message-ID: <20201030144147.twjh5a7czbr6pezy@jama>
References: <cover.1603760941.git.steve@sakoman.com>
 <20201027092433.mtsr6bucqhzitixf@jama>
 <CAOSpxdYOG8USSc3s4gwMpAbPHff+pXbzLOR_qVf71inXg5A7=A@mail.gmail.com>
 <CA+chaQfvFbARW_qpspY7pLiV8Y6ZkU7_Q=OOvC+iJBp+Dbv+rg@mail.gmail.com>
 <16422E7547289A57.31237@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <16422E7547289A57.31237@lists.openembedded.org>
X-Groupsio-MsgNum: 144003
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="675q3gio4jko6qr3"
Content-Disposition: inline

--675q3gio4jko6qr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 03:31:25PM +0100, Martin Jansa via lists.openembedd=
ed.org wrote:
> The script just finished, I've uploaded the results here:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa=
/tune-test-dunfell&id=3Dc87f58e4235fc5c2fe31037917fd999bf4142dca
>=20
> There is a lot of changes compared to master, but mostly because I didn'=
t
> have ARM_INSTRUCTION_SET set to thumb in this run.
>=20
> That helped to reveal one issue in
> meta/conf/machine/include/tune-arm9tdmi.inc
> which most likely exists in master as well (wasn't detected before just
> because ARM_INSTRUCTION_SET).
> https://git.openembedded.org/openembedded-core-contrib/diff/scripts/tune=
/log.fake-arm9tdmi.arm9tdmi?h=3Djansa/tune-test-dunfell&id=3Dc87f58e4235fc5=
c2fe31037917fd999bf4142dca
>=20
> And the meta/conf/machine/include/tune-supersparc.inc is failing like it
> did in master before removal in:
> https://git.openembedded.org/openembedded-core/commit/?id=3D861519337b6e=
5e986c3c4b8ba253e8339caf0805
> which you probably intentionally didn't backport to dunfell.
> https://git.openembedded.org/openembedded-core-contrib/diff/scripts/tune=
/log.fake-supersparc?h=3Djansa/tune-test-dunfell&id=3Dc87f58e4235fc5c2fe310=
37917fd999bf4142dca
>=20
> I'll trigger it once more with thumb enabled to better show what's the
> difference from master.

test with thumb enabled finished and looks OK
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/t=
une-test-dunfell&id=3Dc8a0a19b8585661c39e1ba7e16d061d0ae2afc74

There is a lot of changes compared to results from master, but those are
expected.

The arm9tdmi issue I mentioned before is reproducible in master as well,
I've sent fix for master:
https://lists.openembedded.org/g/openembedded-core/message/144002
it could be backported later.

Cheers,

>=20
> Cheers,
>=20
> On Tue, Oct 27, 2020 at 4:34 PM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>=20
> > Hi Steve,
> >
> > it's from this branch:
> >
> > https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/=
tune-test
> >
> > I've already started it on top of dunfell with these fixes backported,
> > will report back when it's finished (will take at least rest of today =
to
> > finish).
> >
> > Cheers,
> >
> > On Tue, Oct 27, 2020 at 3:03 PM Steve Sakoman <steve@sakoman.com> wrot=
e:
> >
> >> Hi Martin,
> >>
> >> On Mon, Oct 26, 2020 at 11:24 PM Martin Jansa <martin.jansa@gmail.com=
>
> >> wrote:
> >>
> >> > Did you run tune/test.sh script with these on dunfell or do you wan=
t me
> >> to?
> >>
> >> No, I didn't.  I'm not familiar with that script.  Can you point me i=
n
> >> the right direction?
> >>
> >> > It looks OK, but would be good to confirm that it fixes all issues
> >> > currently in dunfell.
> >>
> >> Agreed!
> >>
> >> Steve
> >>
> >

>=20
>=20
>=20


--675q3gio4jko6qr3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCX5wmKQAKCRA3VSO3ZXaA
HAEnAJ925FS01qpoC2jWvH0xejUTGVVlwwCgsD4q/m5c3qD3oDJpUWIgGPmkmTI=
=y8bI
-----END PGP SIGNATURE-----

--675q3gio4jko6qr3--
