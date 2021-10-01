Return-Path: <champagne.guillaume.c@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7321C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 22:55:12 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.4490.1633128911376560003
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 15:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gLeYcL3D;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id f130so10699155qke.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 15:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=06QTTDXXX3NT9mBM21VsmApASRdTM23URItz87xQOkQ=;
        b=gLeYcL3D+w3cTHoILWbC35ScEzCP9oHToJ3NhjLflhxK309ohu6lf66YWsMbJknsit
         PyHdq5nUr20SFppLbD9YBllJJV1CaMUzDvY+U7Lld5FnNuFLaB0lUnG0uvAJVce8jQZl
         9lg1PFHi/uDlG9gLe4HtKCIEsKoHoT5iKZaxCVBRtm62g/7li519WSTLfysvoOL4BIlf
         cvfAZUGuCyw4wwHm1pqtGEthFziaqLHV12UDtsYNMtVjE+HjE/rRUeJcn0SzK+N5btNs
         x5+1tb253gt8Uki3C/9FTRN1Fyi30R2K/+VF5s2OmURIgn3rZFMU7SWilu1I3OpXl5ll
         NXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=06QTTDXXX3NT9mBM21VsmApASRdTM23URItz87xQOkQ=;
        b=uCx4KneUdzN7sjfihHYrrTFkacTVjN9WJ0qweDC4jH7gVKUiJn4lW2qmxZAWD0Isl3
         bjkCXMomxyjs6wYbFMJA2it4rgutLcJ6ZuPnyjbMPu+NQNouHoN0Nh3V319Cp9f2F+Yn
         fLk/8KtNJtXjUEPP6XfHXh8b5OmQth0JVnIttnvBnJhGeyMrfgIZ4ESVCv+hm92GQTWS
         DbYFaX/ZrEklgCO5mgvfqKnCMvK8+vm7VhQi4kBXjv5MusRIfFKe6AVtzbOLkqQGu+Kx
         9lgy4UmQk6zIHSeWx5cZGIQJbf/4l04vW29OKlngTaMtanO3+mRYck0mCo2gpL1pr2qt
         fYoQ==
X-Gm-Message-State: AOAM531q0tcPvCun/X7JwOeUJk1pgh0L09SGYmS2iv33b6a9lX/WbG9o
	0SPc7ck1R2bjuOjLkFxEO4aYwlcRZWTlBUmrpic=
X-Google-Smtp-Source: 
 ABdhPJxgEB/LcuAZO3Y4KECjzcUrGzYIpQgH4hA7gIAMclk2GaZic1SgdzuUcUVcIIowrsBFX0ZD7rgoL0M2BdUZvOY=
X-Received: by 2002:a37:8e07:: with SMTP id q7mr478845qkd.287.1633128910516;
 Fri, 01 Oct 2021 15:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211001180429.6069-1-champagne.guillaume.c@gmail.com>
 <36d941eba37cb262bc5e6463c1fedc8464aa7585.camel@linuxfoundation.org>
In-Reply-To: 
 <36d941eba37cb262bc5e6463c1fedc8464aa7585.camel@linuxfoundation.org>
From: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Date: Fri, 1 Oct 2021 18:54:59 -0400
Message-ID: 
 <CAHSN6OdS7coyEOOOt_tQog7CReA+GJHdW9d_+BfQt+EOC5mMoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] fix pod2man errors in binutils-cross
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 22:55:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156534

Le ven. 1 oct. 2021 =C3=A0 17:22, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Fri, 2021-10-01 at 14:04 -0400, Guillaume Champagne wrote:
> > Hi,
> >
> > when building binutils-cross-x86_64 on hardknott, do_compile fails with=
:
> > make[4]: Entering directory
> > '/builds/project/tmp/work/x86_64-linux/binutils-cross-x86_64/2.36.1-r0/=
git/build.x86_64-linux.x86_64-dist-linux/ld/po'
> > make[4]: *** No rule to make target 'all'.  Stop.
> >
> > Seems like it's caused by error:
> > /bin/bash: pod2man: command not found
> >
> > which appears multiple time in the log. The following patch inherits
> > perlnative in binutils to make pod2man available.
>
> The question is why/how is this working for everyone else?

You're right. I re-tested with poky & meta-oe only with
MACHINE=3Dqemux86_64. It works.
FWIW binutils-cross-x86_64 log.compile still prints: "pod2man: command
not found"
a bunch, but it compiles fine. My issue is somewhere else. Thanks for
the heads up!

>
> Cheers,
>
> Richard
>

