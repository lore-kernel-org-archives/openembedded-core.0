Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74702C7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 10:18:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.55338.1686565129366853083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 03:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Bw9rIPt9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f6255ad8aeso4856421e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686565127; x=1689157127;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4h18cctkxkgX89tPTwKqTr4PuEtyE5ryL+1CGJFgUxU=;
        b=Bw9rIPt9GQ7Xj2Q28euSaaJOoQeYxQ8pa1bBWbLmc95ZuLTJwPUnbVProR1lFILnMD
         VYl58dSVmMwbdjr1sg3sT8oPz3RmXwDq0yD79CYcW41GWwsnxyyTvqX/3luSRXypNCyP
         5bFhXgbuiU7b1MVlto3Oe6NMrW2rbtPslqq5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686565127; x=1689157127;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4h18cctkxkgX89tPTwKqTr4PuEtyE5ryL+1CGJFgUxU=;
        b=kO2V7dCJNm4lLS3l5nOuhrmTVZ4B7aOvuafBfzARm2KHbW8FKPLj1OUCLQ2RvMFBlN
         dC2gvLKh6c+DOyQaayceDInEOdC32JY1947GO/ASRrfFC0srxH/mmO8BBxRLejXGadLL
         0cRGLjAIItZFb9LxxTSR9q0P5akf/DXESAEYqJLNY5JfMyuao53UiJh0m1WzMxj9BeUw
         uKrSzj/ex962xKE2nKjlO6rHQUHuTiCBjSQKD1fqBUipym4Y5/qBQMoS7vELrfC90DsF
         SUQWdjIdAGMetIAMm6sgB+2wZW+7SLGHagMEjMggREBvMSHqhdLtTb5nFOJViNyHIDNL
         kDuQ==
X-Gm-Message-State: AC+VfDzYX93Eljn6+5lhNMyFbwhhXykTsi7jWkDJN9hJpPHPqriBQDOh
	v/hLhAKDyhAC5Iquq8ilAcQHDg==
X-Google-Smtp-Source: ACHHUZ4r+KyBAE9rpESg7kKzCkZPu5XRbhDVZ4Dp5lIKJRrymvW81oA8JF+mNvpQBKJ/Zi2u3lBj3Q==
X-Received: by 2002:a05:6512:3107:b0:4f4:b38c:1f8a with SMTP id n7-20020a056512310700b004f4b38c1f8amr3223042lfb.53.1686565127397;
        Mon, 12 Jun 2023 03:18:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e434:f350:fcac:dcf2? ([2001:8b0:aba:5f3c:e434:f350:fcac:dcf2])
        by smtp.gmail.com with ESMTPSA id g9-20020a7bc4c9000000b003f7f249e7dfsm11113359wmk.4.2023.06.12.03.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:18:46 -0700 (PDT)
Message-ID: <ff2e585ac1948a36bc0ae59626e97b54cd62fdc0.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] qemux86/conf: TEST ONLY. Drop smp boot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2023 11:18:46 +0100
In-Reply-To: <ZIUspsqML9XJtx7P@windriver.com>
References: <20230608193901.363242-1-bruce.ashfield@gmail.com>
	 <3871317432553f8027c3c0d6aabcc186d6f32b07.camel@linuxfoundation.org>
	 <CADkTA4OGDBUgFhmeV9BkHoWv8aPu9Y6A2B2iPRBTEhB3ny0eSw@mail.gmail.com>
	 <ZIUspsqML9XJtx7P@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 10:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182663

On Sat, 2023-06-10 at 22:08 -0400, Paul Gortmaker wrote:
> [Re: [PATCH 1/2] qemux86/conf: TEST ONLY. Drop smp boot] On 09/06/2023 (F=
ri 10:08) Bruce Ashfield wrote:
>=20
> > On Fri, Jun 9, 2023 at 2:06???AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
>=20
> [...]
>=20
> > > FWIW, this patch didn't change much. With it applied we still see:
> >=20
> >=20
> > ok. so at least we can rule out it being specific to secondary cpu star=
tup.
>=20
> I'll own some of that.  I was looking forward in the dmesg where
> secondary CPU init was, and ignoring looking backwards.
>=20
> I have a new thought.  I still could be completely off base.  I updated
> the case with my theory.
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15138
>=20
> Might totally be another wild goose chase.  Who knows...

I was leaning toward leaving these on as it tests things as most users
would end up using them. Whether this is the right thing to do, not
sure.

As an extra data point, we have this failure with 6.1.28:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5262/step=
s/14/logs/stdio

which means the issue is probably between 6.1.26 and 6.1.28. I'm
testing with 6.1.27 and haven't seen it there yet.

Cheers,

Richard

