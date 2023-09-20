Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848AACD13CF
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:20:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.2954.1695248435142985830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LKENu2sw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3200bc30666so290393f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695248433; x=1695853233; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qca/QXeApF9S5BJk2QK2jQZz7YXX2e/OIrnVx5T3DYk=;
        b=LKENu2swHp+nb8MBDDdsIWp1/V5LqLvYDWQCUnJ9usPQCYIgFa+1dMVEeB4+H+/B7m
         jUXBpqyADOMcGcH71DV/hlaWhdGlu3t6FfgG/0y/yhiNoI++DikfbVemzwOB/GElD1gu
         zPJn+Oj1b8c8+2v9EdzFUQdwMO6KhTb3216r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695248433; x=1695853233;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qca/QXeApF9S5BJk2QK2jQZz7YXX2e/OIrnVx5T3DYk=;
        b=aDYVJ1Chn2ajm/e18UrS9ZMNPIvrk3VLIHTIo0kVDa6vpnhYTH+gf7BwVCAOMzw8zG
         Qnyz5x3+PjEZWpC64EfyzgwQgDjzuLn+6g1I+saLQyj36LabGkF32eCraLPcDLfKmQCp
         eU6wG04nCT3llBSwYLb8b5M56fQjS5G2Wuz/SA9kAH16+dbT/iT9EYkmzrgNyP1QlI58
         8fJuWXVxTrjdieR4cTX11SUKRXsDgGHnkXVlAyEQr+q5+Isca3lO0ghwSFA3OSYKOG6m
         Jp45SktN7Cs7Qwjd0jJI5TESzlXl5U3MuB1AunfhNi3oKWXT1YU/Ae/IhVl77VOokJCx
         LQAw==
X-Gm-Message-State: AOJu0YztllHeNkmQfzBN4O+C5xqJRz/S+2y68TPyunKYFdIi6Az2c9C3
	bxcPd2FRr+/JKMI9D+Fyx0GnKg==
X-Google-Smtp-Source: AGHT+IFfWMKn/dZpM99rN1K+QNg1trg5iE9vb+cjmtY+4N+LgAhFaHs16bPiWW0B1TswZZlr4BGxaw==
X-Received: by 2002:adf:e98c:0:b0:31f:f94f:e13f with SMTP id h12-20020adfe98c000000b0031ff94fe13fmr3437795wrm.19.1695248433472;
        Wed, 20 Sep 2023 15:20:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a109:22f2:cbec:fa4e? ([2001:8b0:aba:5f3c:a109:22f2:cbec:fa4e])
        by smtp.gmail.com with ESMTPSA id x5-20020adfdcc5000000b0031c6581d55esm11424wrm.91.2023.09.20.15.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:20:33 -0700 (PDT)
Message-ID: <8020b725b64f722d6eded90a5b92b38c758da0c9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] curl: Update from 8.2.1 to 8.3.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Joslyn <robert.joslyn@redrectangle.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2023 23:20:32 +0100
In-Reply-To: <27cb51c4-b2f5-42bf-b9d4-b951300be586@redrectangle.org>
References: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
	 <a91ac1e923426bcd1848a54f8aeec34155ffa13a.camel@linuxfoundation.org>
	 <919339d4-a7cf-44b1-952e-d37cdd972075@redrectangle.org>
	 <c9df2926bf3f14a8f89eefe110171b500a8e85c3.camel@linuxfoundation.org>
	 <27cb51c4-b2f5-42bf-b9d4-b951300be586@redrectangle.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187947

On Wed, 2023-09-20 at 14:50 -0700, Robert Joslyn wrote:
> On 9/19/23 5:54 AM, Richard Purdie wrote:
> > On Tue, 2023-09-19 at 05:40 -0700, Robert Joslyn wrote:
> > > On 9/18/23 4:59 AM, Richard Purdie wrote:
> > > > On Sun, 2023-09-17 at 18:57 -0700, Robert Joslyn via
> > > > lists.openembedded.org wrote:
> > > > > NSS support was removed, so adjust PACKAGECONFIG options.
> > > > >=20
> > > > > The --enable-crypto-auth option was removed and split into separa=
te
> > > > > options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
> > > > > negotiate-auth, and aws. Enable basic, bearer, digest, and negoti=
ate by
> > > > > default as these are probably the most common.
> > > > >=20
> > > > > Disable test 1279 since this requires libcurl and hangs the tests=
.
> > > > >=20
> > > > > Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> > > > > ---
> > > > >    meta/recipes-support/curl/curl/disable-tests       |  1 +
> > > > >    .../curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb}          | 14 ++++=
+++++-----
> > > > >    2 files changed, 10 insertions(+), 5 deletions(-)
> > > > >    rename meta/recipes-support/curl/{curl_8.2.1.bb =3D> curl_8.3.=
0.bb} (88%)
> > > > >=20
> > > > > diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/=
recipes-support/curl/curl/disable-tests
> > > > > index b687b2bb76..fdac795662 100644
> > > > > --- a/meta/recipes-support/curl/curl/disable-tests
> > > > > +++ b/meta/recipes-support/curl/curl/disable-tests
> > > > > @@ -21,6 +21,7 @@
> > > > >    # This test is scanning the source tree
> > > > >    1222
> > > > >    # These CRL tests need --libcurl option to be enabled
> > > > > +1279
> > > > >    1400
> > > > >    1401
> > > > >    1402
> > > > Thanks for the patch. Unfortunately there were warnings generated o=
n
> > > > the autobuilder test run for this:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5=
452
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5=
631
> > > I'm not very familiar with the autobuilder infrastructure, but it loo=
ks
> > > to be running something like "bitbake core-image-ptest-curl -c
> > > testimage". When I run this, I do get a warning:
> > >=20
> > > WARNING: core-image-ptest-curl-1.0-r0 do_testimage: There were failin=
g
> > > ptests.
> > Running with -v might help show a touch more information.
> >=20
> > > Unfortunately, I don't see any failing tests. When running the tests
> > > manually (called runqemu, then ptest-runner curl in the VM) there are
> > > some tests that print an error about not finding a library and get
> > > skipped. I removed those test cases as well, but I still get the warn=
ing
> > > about failing ptests.
> > >=20
> > > What's the ptest code looking for to trigger a test failure? I should
> > > have some more time to look at this later today, I'm probably just
> > > missing something obvious.
> > Commands like:
> >=20
> > resulttool report ./tmp/log/oeqa/
> >=20
> > resulttool log --dump-ptest ./output-logs ./tmp/log/oeqa/
> >=20
> > Might help amd/or have a look at the testimage log in core-image-ptest-
> > curl's WORKDIR/temp/log.do_testimage
> >=20
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
> In running this a few times, on my machine it's not curl but other tests=
=20
> that fail. The autobuilder output only showed a curl failure, so I'm not=
=20
> sure what's different in my environment. This is what resulttool shows:
>=20
> s.robert@hezmana ~/yocto/poky-master/build $ resulttool report=20
> ./tmp/log/oeqa/
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -------------------------------------------------------------------------=
-------------------------------------
> Test Series | ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
> Passed=C2=A0=C2=A0=C2=A0=C2=A0 | Failed | Skipped
> -------------------------------------------------------------------------=
-------------------------------------
> oeqa | runtime_core-image-ptest-curl_qemux86-64_20230920012443 | 4725=20
> (91%) | 7 (0%) | 448 (9%)
> -------------------------------------------------------------------------=
-------------------------------------
> Total | 1 | 4725=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 448
> -------------------------------------------------------------------------=
-------------------------------------
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> qemux86-64 PTest Result Summary
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -------------------------------------------------------------------------=
-------------------------------------
> Recipe=C2=A0=C2=A0=C2=A0=C2=A0 | Passed=C2=A0=C2=A0=C2=A0=C2=A0 | Failed =
| Skipped=C2=A0 | Time(s)
> -------------------------------------------------------------------------=
-------------------------------------
> attr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> bash=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 78=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 107
> busybox=C2=A0=C2=A0=C2=A0 | 619=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 88=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 7
> curl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 847=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 188
> openssh=C2=A0=C2=A0=C2=A0 | 81=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 712
> openssl=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 0
> perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2570=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 192=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 549
> util-linux | 524=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 166=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36
> zlib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> -------------------------------------------------------------------------=
-------------------------------------
>=20
>=20
>=20
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Failed test cases (sorted by testseries, ID)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -------------------------------------------------------------------------=
-------------------------------------
> testseries | result_id : oeqa |=20
> runtime_core-image-ptest-curl_qemux86-64_20230920012443
>  =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-array
>  =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-execscript
>  =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-intl
>  =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-read
>  =C2=A0=C2=A0=C2=A0 ptestresult.bash.run-shopt
>  =C2=A0=C2=A0=C2=A0 ptestresult.perl.cpan/ExtUtils-Constant/t/Constant
>  =C2=A0=C2=A0=C2=A0 ptestresult.util-linux.mount:_complex
> -------------------------------------------------------------------------=
-------------------------------------
>=20
>=20
> I posted the output from a manual ptest-runner call here:
>=20
> https://gist.github.com/bobolopolis/e02401a87d1d6b2f48ca2d70998f13c1

If you delete or move tmp/log/oeqa/ out the way, you effectively reset
the state so if you do that, then just run the curl ptest the result
should be clearer.

I did go back and look up the autobuilder failure and tried to dig up
more logs:

http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemux86-=
64-ptest/curl.log
http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemux86-=
64-ptest/core-image-ptest-curl/log.do_testimage.4047690.20230918105238

http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemuarm6=
4-ptest/curl.log
http://autobuilder.yocto.io/pub/non-release/20230918-9/testresults/qemuarm6=
4-ptest/core-image-ptest-curl/log.do_testimage.59151.20230918103439

so it was test 1964 that failed in both cases. I know know why though
:/

Cheers,

Richard





