Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8714C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 22:18:55 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.40.1685571531055631751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 15:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NoArlkbq;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7770c1570a6so10582139f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 15:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685571530; x=1688163530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POiDNJx7XnzdgQP6QOfdOLHIsFG6qYjiElAZkBbMkzg=;
        b=NoArlkbqaWkQUqBhK53NChIwP3WUXm96rt5N08Vhg7PzcgNXAjv8pv93F9WI0CQJAg
         TaxawOvEoZp0B4oMrqdPs3qjE95ziW32MLTKBnJxGGRhTqjqvVYIJoCp91QyEnOneaA6
         9t75xtz8Jo+UdbwM4dkq0pEcYR+XOc+wPscO8HwtprbpktufLJa7dc5KKJu/6gy4+8A/
         bTjg4IVLW9QCiIT27aqQCxlev8LIZxRphVJVCxv1/ktc3h84zP2cwMzVxRQLM0/2zCf0
         tqgJoAKzCiNv5NWFw6Gk9PxWOiHiZ1Pa+/y6pv2aYBX+09tw5UerEExwmWiDSlabsNEg
         cX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685571530; x=1688163530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POiDNJx7XnzdgQP6QOfdOLHIsFG6qYjiElAZkBbMkzg=;
        b=Zk35DxZsR/kyIOnlj5uL/EYa8Y+B6W566LLPI9TP6Oo9gnGEuD9xq7nIBzH35W0HM4
         9JER8qkxysns6iASPHQusU1mlzitALC4cI1MnfVPbP5769OPMhcCGReqtn0CAdMkkMN0
         CORoo87cyz7bhV67eYDu2iGDbMC2Gf+ILVVjzbXxnLi8eb/jGILGTlBKTTqfCYAWYg7H
         H7c+EE7+JisZMRhwVhgdKPpr0W3s3OCETHf5FpJPMED0ici3TQlIrQ0khFrHEW2VTwWs
         nIP7dV/Fd2G4kRotZCINvNA1ux0rtC3Dbemnrgcwd9j2/MBiuOkb36HFm8wBDFireF3s
         xa2Q==
X-Gm-Message-State: AC+VfDwK/M0tHu0xWXYqdpD4bON/qSXIR/ydHSvADCFjxbJxTGLHSndY
	higDb//XQUSZpw9IQ7HjknhoPLOZbwoL08dpIl8=
X-Google-Smtp-Source: ACHHUZ5FPGX8x/kni64NT8FTeUj855egeXkhKOW3GFy8lnVNX/n1minXJU3cjnoHS+Wg1ch0Qvpw1zqsawOME+vSPlo=
X-Received: by 2002:a6b:dd15:0:b0:770:8:caa0 with SMTP id f21-20020a6bdd15000000b007700008caa0mr4448691ioc.1.1685571530206;
 Wed, 31 May 2023 15:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685558432.git.bruce.ashfield@gmail.com> <14b5ba3f7ba79aa1cfa5c50f8458596951adcfb1.camel@linuxfoundation.org>
In-Reply-To: <14b5ba3f7ba79aa1cfa5c50f8458596951adcfb1.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 May 2023 18:18:39 -0400
Message-ID: <CADkTA4OTDrugNWkFYqDXZy7ruZ+6Qd2EGsQUx+JvSnskoHSCyw@mail.gmail.com>
Subject: Re: [PATCH 0/9] kernel/linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 22:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182039

On Wed, May 31, 2023 at 6:03=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Wed, 2023-05-31 at 14:48 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's my consolidated queue. I've had some of these in testing for qui=
te
> > a while, as I didn't want to send them right before release or before m=
y
> > vacation last week.
> >
> > Most are -stable updates to 6.1 and finally bumping the -dev recipe to
> > show that we've been testing 6.4 for quite some time.
> >
> > The make-mod-scripts rmwork fix was discussed at lenght on the list, an=
d
> > has been tested by myself and people seeing the issues. But with all th=
e
> > races and issues we've seen in that area for years, I'll keep a close e=
ye
> > out for AB issues.
> >
> > I've factored things a bit around enabling PAHOLE, I don't expect it
> > to cause issues since it isn't on by default .. but you never know with
> > these sorts of changes.
> >
> > I also have a bump for the refernece BSPs (sent to the appropriate
> > list shortly) and a documentation commit for the PAHOLE tweaks (also
> > sent to that list shortly, once we agree on the this change).
>
> Thanks for the updates!
>
> I put these in for testing (along with some other changes) and there
> was an issue, probably the same thing showing up but I've not dug into
> it:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7159
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7197
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6093/s=
teps/11/logs/stdio
>

That's odd:

ERROR: core-image-sato-sdk-1.0-r0 do_testimage: File
/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy/images/q=
emux86/core-image-sato-sdk-qemux86.testdata.json
not found ([Errno 2] No such file or directory:
'/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy/images/=
qemux86/core-image-sato-sdk-qemux86.testdata.json').

It shouldn't be the kernel updates, so I'm assuming something with
make-mod-scripts. I'll have a look at it on Thursday.

Bruce

> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

