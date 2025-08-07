Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825EFC87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 20:18:33 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.5898.1754597912738155977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 13:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bold1uNi;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e8fd38cb2abso1237267276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754597912; x=1755202712; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VISUNiWsulAeQfEh7UR7v8ApOUQ3mCDjIPzf4/Oelbg=;
        b=Bold1uNiq65xDhLZLAfuGc+HzyLTdj0VpZrKIDbcvzbp7uJxs0Hxz7DERXB8biA9J3
         H69LBsFinr4Wb8pqVtWA4Tsp59EaM3Q76FcRuirsnKMhWLTjf4kpQ609G9Mvj5VRck1Z
         61evxqbW38Df1b1ZFqWnh7kYwjkNO7IndAF0j6/R5wN/ZiL/wIinkKO3nXiuW9EYwglE
         cKmBVDzo6pH5ZfF/e+tzfYf9jz6gY50OmfyXPqnewPyQX8eihRs2LCkyjdB+jBHePHRc
         KwMIAdJRWUj3jxIk/o8B3UGdKrYJyYAseC4noBK0oUV16esagESUpQ1DNT5jNiSKNGIa
         3q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754597912; x=1755202712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VISUNiWsulAeQfEh7UR7v8ApOUQ3mCDjIPzf4/Oelbg=;
        b=ql4TByGtuiQG4XzyaBQo3aqh7HWsp3R3dr7Jtbt9owSvQYI14NpSQTNIyCrmDy8utA
         tHOe/yUfI+Rq9NAEOXEyyN/n5iVvDcKXg7nuihVa0uKvmFbbGQA6ORvEUzlZ5+scZpJv
         D7i6o94X5d99aKIeNNfjFNXvqIjxWpZ4qE2wPLvvq+shHzU5O2HPE6AAAvZsaGXgY7wL
         MiXFmx/FUCiF1EF9xiuIh/qAGCqGMeIiIQc7aoqjZXwZlMzuiCu1Nbcmi9Gp68J+ZT8X
         zinPwSCgSCset7hJUj0YhI9kUjLb/eTXQGH58dOm6sucYwFhphCGwKdC/HGra2g0w9nH
         ozDg==
X-Gm-Message-State: AOJu0Ywoyk1fEWCnbF0m1ooE4zWQZEgAY2Efy8+2FwQwlmfUpV3Jj/Fi
	tF2o4t6+UwquBlvEeVVPH2MfvSzyxKd4H5ErgbjAOsU69n2Z4dXNNAW0grFwCozjqpd+ufyYCVs
	ojovFjyanlgDD/2lhDLnLJth8arVKqng=
X-Gm-Gg: ASbGnctBFXPlmHsYPZ2yCleou69uUKsmcLHAMqwVGqc47xfC/9M8SgJohDb3MjY8LPy
	Kyry1k8sYpGKzKW/P5QNxfHnUl87vzL2XB8CWv1JgisRRYKMh9Co1U1cZrSRpCO1ARfLcoaKRKw
	gkKaoGX8EFgPu2Fg114/R+9ah3UAz0aOKVnuXbZw36T6jVz6/ocl3oeot4Oz/rxdYANrDj3qn3R
	uvbn3+SHsGhEzKJG2Hgv+z761EfF3nO9Aj0
X-Google-Smtp-Source: AGHT+IFSVtIxVW28ZI3N0fdZlu/1T1yt74T42tGtQdhiTcYSgVlufoxzFidVmWZekVx5zpJwXEvqMACZc3EaFPPGWGo=
X-Received: by 2002:a05:6902:6c12:b0:e90:39b7:6085 with SMTP id
 3f1490d57ef6-e904b57acdfmr686761276.17.1754597911296; Thu, 07 Aug 2025
 13:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250801042242.3076232-1-raj.khem@gmail.com> <20250801042242.3076232-3-raj.khem@gmail.com>
 <CANNYZj_aGce4mmz2P+LUHZdDYGVYQ1sOSkdcOdn6-mTY_USk2A@mail.gmail.com>
In-Reply-To: <CANNYZj_aGce4mmz2P+LUHZdDYGVYQ1sOSkdcOdn6-mTY_USk2A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Aug 2025 13:18:04 -0700
X-Gm-Features: Ac12FXz3SYp3OImfN6Gidn44PzeKZDARA-nRR117itk3F-n-rnOAwnPbmDbRmCk
Message-ID: <CAMKF1spXxqp=U+430dTzHnTiQzJg5M4TWXGBeyuM51rOaPv88A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/7] libxcrypt: Allow undefined symbols in
 version scripts with lld linker
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 20:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221585

On Thu, Aug 7, 2025 at 2:57=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> On Fri, 1 Aug 2025 at 06:22, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Unlike GNU ld, LLD defaults to erroring about undefined version symbols
> > add commandline parameter to sush lld here
> >
> > Fixes
> > | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRY=
PT_2.0' to symbol 'crypt_gensalt_r' failed: symbol not defined
> > | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRY=
PT_2.0' to symbol 'xcrypt' failed: symbol not defined
> > | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRY=
PT_2.0' to symbol 'xcrypt_gensalt' failed: symbol not defined
> > | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRY=
PT_2.0' to symbol 'xcrypt_gensalt_r' failed: symbol not defined
> > | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRY=
PT_2.0' to symbol 'xcrypt_r' failed: symbol not defined
> > | x86_64-yoesdk-linux-clang: error: linker command failed with exit cod=
e 1 (use -v to see invocation)
>
> > +LDFLAGS:append:toolchain-clang =3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
>
> Wait. Why is there an undefined symbol error in the first place?
> Shouldn't we address the error, rather than silence it?

LLD has stricter defaults and strict symbol versioning enforcement.
LLD requires that all symbols
referenced in version scripts actually exist in the object files being
linked Same errors/behavior can be
seen with GNU linker as well if we add -Wl,--undefined-version to LDFLAGS
GNU linker chooses to be a bit lenient with defaults. It is a common
pattern with new vs old tools.

libxcrypt uses version scripts to manage symbol versioning, but LLD
requires that all symbols referenced
in version scripts actually exist in the object files being linked.
The symbols might be:

- Conditionally compiled out based on configuration
- Defined with different names/prefixes
- Missing due to build configuration issues

Having LLD to lower its barrier does not change the output it
produces, it's the same as GNU ld,
There is no difference - both .so files work identically at runtime
since the symbols are exported into .dynstr sections so old binaries
needing these versioned symbols can still
link to them at runtime.

Should the version script be fixed ? maybe, I am not sure where all
libxcypt is used in legacy systems
to qualify this. Current assumption is to have these symbols. This
patch makes LLD behave like GNU LD
does.

Hope this helps you understand what's going on. Feel free to ask if
you have more doubts.

>
> The same question stands for similar patches for libtirpc, gzip and
> binutils-cross-canadian.

They all have the same issue underneath.

>
> Alex

