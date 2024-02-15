Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C33C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 14:49:47 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.15688.1708008581670715378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 06:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QBVVxfTJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d10d2da73dso12342911fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 06:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708008580; x=1708613380; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ncSF6ogzJS7JqEhw8uhydc0Zgqw//+KcK5XxA69FHCI=;
        b=QBVVxfTJPDuAkmCKac25u9A/kg/3bL6v41z6lvPofBGGxlflK6G+M8YBliAZtwWbLH
         ynsX+/VA+R+0118HJnAgm8dUamDs7Ti72t5XuaJJJiamJzIPqLbZ2OcAEUaMyxVKbksk
         eEUkVpcqQrI5+mH/mgT4zELFj07mQ1QvN6yd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708008580; x=1708613380;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncSF6ogzJS7JqEhw8uhydc0Zgqw//+KcK5XxA69FHCI=;
        b=KFvA92wXSO0HIYDMCqQhHV/FS9YajGiMXEUjTHc+xBh5GK0tDWQhmJ/NPgWzsJ1xYz
         nCaTE8DQYpG+SpliUXygkgJpEhc+9wTZTByK+wOPzA3yCtfpVXSurQnpa6nA5SZIhtKT
         2O6pPGwC5oiZUkTw4PrvCJl2T8Qedt14hxR30vn+6ZjarWtJTEbm6IkHZh60UQWFikuA
         AwssTDJ+F8eNLdGnEgrnzNzz9fbBD5uEaNubyA5pJWv2fezadi7k8SUjimfLrUkYfxQY
         OkMpPm+B5Er4ELDY4iuoNCf6+GFOIQd83xPHrxUvgMU5d2I/nc0/6MDCAPqN1RGVBuJ0
         68dA==
X-Forwarded-Encrypted: i=1; AJvYcCVH5T1/gKoENc2JqXvGN+Tgj/V1JSXXTyrdO6dhu6yflGH/ezfeKO9BlJjajx47pt4umb1oCtkI//drUUgYB+3mUKd5YevXMyGGG/mrq1672gIFpwLHdez2
X-Gm-Message-State: AOJu0YyT/25jGkThxnNhiKSNGpy03WQGa1BSXH/mOkwW2Wk+737R1PIc
	o2yfWpXcSIT80gk2uQwvzRTsZNU/b7eKNzqJ/eRl9mKOgK50FSWYzDGhq6Z6Mqw=
X-Google-Smtp-Source: AGHT+IGBRLIIwUPdC5dJ7oqg+riSN9SsgkE+6Dt7b6HqOelwoubcdATvk/rarL169nVNL5DnOtZQng==
X-Received: by 2002:a2e:b70e:0:b0:2d0:e666:5b4d with SMTP id j14-20020a2eb70e000000b002d0e6665b4dmr1687340ljo.21.1708008579676;
        Thu, 15 Feb 2024 06:49:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:506:d04:fb88:63ff? ([2001:8b0:aba:5f3c:506:d04:fb88:63ff])
        by smtp.gmail.com with ESMTPSA id co14-20020a0560000a0e00b00337d5cd0d8asm333602wrb.90.2024.02.15.06.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:49:39 -0800 (PST)
Message-ID: <3e2be36df5700bcc5c72e494b50a8ad5114c75d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] gcc: Oe-selftest failures analysis - x86-64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>, "Moodalappa, Shivaprasad"
 <Shivaprasad.Moodalappa@windriver.com>, "Kallapa, Umesh"
 <Umesh.Kallapa@windriver.com>, "Gowda, Naveen" <Naveen.Gowda@windriver.com>
Date: Thu, 15 Feb 2024 14:49:38 +0000
In-Reply-To: <PH0PR11MB565801BE2CF2136D644719F9EF4D2@PH0PR11MB5658.namprd11.prod.outlook.com>
References: 
	<PH0PR11MB565801BE2CF2136D644719F9EF4D2@PH0PR11MB5658.namprd11.prod.outlook.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195516

On Thu, 2024-02-15 at 10:29 +0000, Sadineni, Harish via
lists.openembedded.org wrote:
>=20
> Hi all,
>=20
> We are analysing the test failures reported by the autobilder athttps://a=
utobuilder.yocto.io/pub/non-release/20240204-3/testresults/qemux86-64-tc/te=
stresults.json
> The autobuilder result summary as follows:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> qemux86-64 PTest Result Summary
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -----------------------------------------------------------------------
> Recipe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Passed=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Failed=C2=A0=C2=A0=C2=A0 | Skipped=
=C2=A0 |
> -----------------------------------------------------------------------
> gcc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 124420=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 37=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23809=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
> gcc-g++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 196231=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 39=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=
7314=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> gcc-libatomic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 27=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> gcc-libgomp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3407=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 1981=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 |
> gcc-libitm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =C2=A0 24=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> gcc-libstdc++-v3=C2=A0 =C2=A0| 9705=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5464=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> =C2=A0
> We started with 'gcc.dg' module failures(13 failues, listed below) report=
ed inhttps://autobuilder.yocto.io/pub/non-release/20240204-3/testresults/te=
stresult-report.txt.
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/analyzer/data-model-4.c (test f=
or excess errors)
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c=
=C2=A0=C2=A0 -O0=C2=A0 (test for excess errors)
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c=
=C2=A0=C2=A0 -O1=C2=A0 (test for excess errors)
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c=
=C2=A0=C2=A0 -O2=C2=A0 (test for excess errors)
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c=
=C2=A0=C2=A0 -O2 -flto -fno-use-linker-plugin -flto-partition=3Dnone=C2=A0 =
(test for excess errors)
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c=
=C2=A0=C2=A0 -O3 -g=C2=A0 (test for excess errors)
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c=
=C2=A0=C2=A0 -Os=C2=A0 (test for excess errors)
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/pr56837.c scan-tree-dump-times =
optimized "memset ..c, 68, 16384.;" 1
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/vect/vect-ifcvt-18.c scan-tree-=
dump vect "vectorized 3 loops"
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/vect/vect-simd-clone-10.c (test=
 for excess errors)
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/vect/vect-simd-clone-16f.c scan=
-tree-dump-times vect "[\\n\\r] [^\\n]* =3D foo\\.simdclone" 2
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/vect/vect-simd-clone-17f.c scan=
-tree-dump-times vect "[\\n\\r] [^\\n]* =3D foo\\.simdclone" 2
> =C2=A0=C2=A0=C2=A0 ptestresult.gcc.gcc.dg/vect/vect-simd-clone-18f.c scan=
-tree-dump-times vect "[\\n\\r] [^\\n]* =3D foo\\.simdclone" 2
> =C2=A0
> Out of these, except 'gcc.gcc.dg/vect/vect-simd-clone-10.c' all others ar=
e fialed in gcc upstream.
>=20
> We've analyzed the failed case 'vect-simd-clone-10.c' and find the root c=
ause, it is the bug is in gcc test suite.
> GCC Bug raised -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D113899
>=20
> We are working on other module failures (g++,libatomic...), keep you post=
ed here.

This looks like a good start, thanks for working on this!

Cheers,

Richard

