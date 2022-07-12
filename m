Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF542C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 17:16:40 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.12038.1657646198413931303
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 10:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S0O1FRPH;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id j22so15527778ejs.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 10:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vebi80wCSUgDE3a8qN6f267Scy8V1h5kiDp2l8Q9YXE=;
        b=S0O1FRPHPLB1l7VIkaWDn9uYZQSJ8MlZvCKwl/ugMc6F8Z3XeZsNNrbUJs89HM6b3V
         NY9ICGgh981Xnip+n3wDUxpqTaTOzm0tGP081apK1hqQGb+9NhXv+FJNPtFr7gy6HDT0
         W4N9iLbymX3CKBkW7iDUwRbxDWWecbeSZot+eifDe4K81CGW7pBoQFHhDb4k8OPkycGV
         DDGDf/k8chv+rtthkfLA0bCALz4Yn4Gu+nPwEduUF93r0b0xuvi51JshVqbvEBtGjJBt
         ku9ufUWl179hP5xWuOe6H0vVuwm0wKPcQZ5RkO/qugqwtx/LghzrZWXwm+xIfxsjY/W4
         CHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vebi80wCSUgDE3a8qN6f267Scy8V1h5kiDp2l8Q9YXE=;
        b=1z1kRNWODcNOx6g1ZDCyyZ6G4MbJMqssTqaDUQiH+8G2+xaTPqL+qRaJtX/3QWE+Gg
         CzxuTmsMo0fpj15/gpTsZqUyNwvlF28ESmnzKdqPsXPT6sCaHnbqigwN2D16dBgn6JDg
         yvEidHgJ5RXG5JXyIeflj1vJZc9YyOoLCnRUCtEKR92jNomlSEWqhb+i3isKm5MFS3y9
         DcHOqy7vom/TDKg5hZ9Yi+YSYwlqaCGD33m/pHRWF4/8r5du85AcN/z4rQhx+rN9BlQ1
         zALa4l35cUJa36iC0+t9Gwn81tz5XRfNUHZEvYSris4acucvC5Wbx53ItZpHRZm/9blb
         ktJQ==
X-Gm-Message-State: AJIora+MkEfG0KR8MtlCgB6vx++22wRgVRd3EmUwT/iYDE7fhMG0wHI4
	2IqJfddUGbxFD7IJ6jM+iC6Nqj++9EoRTWTQ+d4=
X-Google-Smtp-Source: 
 AGRyM1sF5FfYI1On1NVgvBUqvJTJS73d+mnyPX1kbFqiFJ02QuMn6/o8tpEgYhWzSZJFhlrJgBKm7a72TMVSBSUWxes=
X-Received: by 2002:a17:907:1c8f:b0:6e8:f898:63bb with SMTP id
 nb15-20020a1709071c8f00b006e8f89863bbmr25435385ejc.721.1657646196834; Tue, 12
 Jul 2022 10:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <ba078de5f59105d61daed5b8abc69cd1e15bc43e.camel@linuxfoundation.org>
In-Reply-To: 
 <ba078de5f59105d61daed5b8abc69cd1e15bc43e.camel@linuxfoundation.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Tue, 12 Jul 2022 18:16:25 +0100
Message-ID: 
 <CAMw=ZnRwkp6nkZzqw69Xc83xDp0QRCZ+MNwHx=QiTdmncZ5L3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 17:16:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167939

On Mon, 11 Jul 2022 at 23:06, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-07-11 at 21:29 +0100, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >
> > Support for unmerged-usr is deprecated upstream, taints the system and will be
> > removed in the near future.
> > Enforce building merged-usr images when using systemd.
> >
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > We intend to deprecate unmerged-usr at some point, and we are doing the
> > rounds ensuring distros are moving along so that there are no surprises
> > when the time comes.
> >
> > See:
> > https://lists.freedesktop.org/archives/systemd-devel/2022-April/047673.html
> >
> >  meta/recipes-core/systemd/systemd.inc | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> > index b8dbe2263a..f9e109bba4 100644
> > --- a/meta/recipes-core/systemd/systemd.inc
> > +++ b/meta/recipes-core/systemd/systemd.inc
> > @@ -21,3 +21,8 @@ SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${S
> >  "
> >
> >  S = "${WORKDIR}/git"
> > +
> > +# unmerged-usr support is deprecated upstream, taints the system and will be
> > +# removed in the near future. Fail the build if it is not enabled.
> > +inherit features_check
> > +REQUIRED_DISTRO_FEATURES = "usrmerge"
>
> Given none of our systemd testing on the autobuilder is done under
> usrmerge and we've never mentioned this requirement to any of our
> userbase before, this is going to come as a bit of a surprise to
> people. The above change will break the autobuilder as things stand :(.

Yes I was expecting there would be these kind of issues, the purpose
of sending this was mainly to find out about them.
So where are these configurations stored? How can we get them updated?
Also is a deprecation notification needed? How is it handled usually?

Aside from process details, I assume there's no problem with doing the
change in principle?

Thanks!

Kind regards,
Luca Boccassi

