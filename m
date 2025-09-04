Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613EECA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 17:36:00 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.905.1757007351231588154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 10:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h1IjFhvg;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60504bf8so13389277b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757007350; x=1757612150; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxyOSF4jCUUmYvhBnwKok7bxqiaWNzjRYk2gs5aecPw=;
        b=h1IjFhvguuTU8kUNMyg/LHM+K39EkdR558YUzgkirr7itF5wHzia+wqhtGbHEW6AnA
         SwXNV8HUDZyQqmb8S2Ow7hAlqy4YHYkeWgrYM0D6qmZsmngYifkFHZSrPARjRjHT7ucg
         X3okVvTXIec7ScHyyMpkC6RAx7sM2x9tTtuKNNKnoDozRIoeYqsVFiwhp6xZekHX+FiE
         RuXnkbh0sFZITWQgbljJxkwg8RpqztolPTT9NojAUL7y1O+R/C5vY75g0xpIeo23Mr+j
         C68o3nHUrid8GVoORARo9a5/CvAPXRvYqQcoC3hV9nWO4oqI6elW9mD1XgbaKt/06REp
         gKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757007350; x=1757612150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxyOSF4jCUUmYvhBnwKok7bxqiaWNzjRYk2gs5aecPw=;
        b=rsRb1xYE9AETN4GbPGd/buk54qg4Kch1sC5B5zcEdk8+zB0rx09W+5htRjvKs3sLf9
         kPWmiEdAeZ2Pe9ccPjMgLhD/6hMDXONLX9mJ7FF6gpgnbIDn+TVSaldymW9UQFv1l1HW
         pjbGVmJx4DbP/12PucSiIAmeQ1bTcXFpI117kmsaB2XxDjwLb9zsR6S+vxkVXK6se09h
         ICtkfd874TVoc1pwDzpB8e13r1Gg+IBfZ7BjDtiaZAm32ywXaaFfyytpHlrYGxM4YU/0
         FR1Sb4OS06Z2HARFi64bQY2mCV6Xe3gSCGo6o1qgDdp8N4OcauY91uY4lDGFHkX/ZD4K
         G3eg==
X-Gm-Message-State: AOJu0YwlcpmoA5vuSpV40rvO8UlA1UanCwp44XK596A3DyvVYBqcN8yp
	z11/OHG8zqyn39DcQ46a0xAOd0LPK1y4UY9ZqOaV4lm5d76Ff7VG0pEJYBPm4QBAYmGjFYicJzj
	W2o+zAjpMs/j9kUXJl96eqeVGovdn6Z1BuqLl+TE=
X-Gm-Gg: ASbGncvSF/mUOKRWDXuMi6ieI+WXasBeUYgTR8Ux9LL2HCIsaBWxwmh0bflbRKb46Dp
	qwZLblXn3OrACQVZwAEWdU/fyibTehGV6rzBUkQRcJVQ2A1q4inIBEERYbCf9syOKt6KRW0p3i8
	S1ZURP9cnWgIIvOqd++0pzQQq5pRalxF4kgWqa7Y4G3XZIa5tPeyXMNjy8NSxEg0pmdeo2YcaBx
	pUIjxjwY+cui/j87rS3/rL2lWOT6UChE0EW20Qe6rjR0SdujlgI3Z58TCrZf4h3G/wda8vmPDjr
	DtORAXuIts3dENxyZfYqLa4bmwsNm39hZ2jiHw2viKOPbeRgNUtF7w==
X-Google-Smtp-Source: AGHT+IFhAGAteHnk8hdgWvyjpyW81YNIHc9KlV982FIef9K3dxi0I3zDGZy4VWsh33xF5UEr3vXnID1j6MgNz0wtC8Y=
X-Received: by 2002:a05:690c:c85:b0:71f:efa8:5881 with SMTP id
 00721157ae682-72276512bbamr245636877b3.30.1757007350206; Thu, 04 Sep 2025
 10:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250902022119.3497724-1-raj.khem@gmail.com> <31C35016-F8EA-4763-8274-4C229DF73079@arm.com>
In-Reply-To: <31C35016-F8EA-4763-8274-4C229DF73079@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Sep 2025 10:35:24 -0700
X-Gm-Features: Ac12FXzQUNkTISp_Ck2FxP6T82yZUXRypAKVG5vmWkl2MiZQXXJfHq11xeD7Du4
Message-ID: <CAMKF1spvoC1tT3Etmr7=8vxOhJhk9nszUa52nJw8YYur-8sGVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python: Correct the upstream status in NODEV patch
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 17:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222963

On Thu, Sep 4, 2025 at 5:22=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 2 Sep 2025, at 03:21, Khem Raj via lists.openembedded.org <raj.khem=3D=
gmail.com@lists.openembedded.org> wrote:
> >
> > Ensure it is reflecting correct information and status of patch
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > .../python/python3/test_posix_nodev_disable.patch           | 6 +++++-
> > 1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/python/python3/test_posix_nodev_disa=
ble.patch b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.p=
atch
> > index 85767e1e898..df60302520e 100644
> > --- a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.pat=
ch
> > +++ b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.pat=
ch
> > @@ -1,7 +1,11 @@
> > Disable part of test_posix.test_makedev that depends on the NODEV
> > macro being defined (missing on musl).
> >
> > -Upstream-Status: Submitted [https://github.com/python/cpython/pull/317=
94]
> > +See https://github.com/python/cpython/pull/31794 where NODEV
> > +handling is introduced.
> > +
> > +Upstream-Status: Inappropriate [Musl-Specific]
>
> Can you file at least a ticket for the issue that the tests don=E2=80=99t=
 work on musl?  (I see that alpine also has this patch)
>

right, I have already added to the issue which caused the problem,
hopefully that is a better place to call it out.

https://github.com/python/cpython/pull/31794#discussion_r2314773987

> Ross

