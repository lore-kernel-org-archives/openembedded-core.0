Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5E0C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 21:55:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.15054.1657662947873757908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 14:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZUxje686;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id bk26so12965299wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 14:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=2Ulp2j01Ei1tZ0/oovMTQVWOeRjxRcq5d3SXkdZn67k=;
        b=ZUxje686o8X3fE3m8WBpAnXbgB59VTAQYVbr07FQ7ZVr9Dmgzpbbxwl4Zv5FBmgW6V
         +Ma68Fhv1k//8RMZmEaL3m7nrevIuuBilVlICLThM6KuqhjMIb41Hc7TQzLi6QdzstMN
         3CMLiUa8+k1ZuCemrP/d1bb7vIWf2AfwXvCco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=2Ulp2j01Ei1tZ0/oovMTQVWOeRjxRcq5d3SXkdZn67k=;
        b=HKKiLD7hQXCfeQW4jOKHk+kLP82TAuUUZQVUaPM4jOPJOOCupWOu6QBZ39yhWMR1P1
         puCoTcTXNRjHhXAsWi7m6c2ietf+McHU9n14nLEu3hQyM8XulqfrBmKdK+x0iz1V009u
         lH6suGM++M/0HNRtdsOsSCOi1v01ZXhdHiAlYnowZNXqgPYx0XC/0w/dFz20yLT7XJvl
         /oJAP+x+CnW1DdoQKSXUF2lGjfwC38uGdIQltYbZnuBSCXlGYvMAan4ubX99ylajRl1Q
         9/PWn1Tf7OCsOABjc/97OvW9Lm5yCn4VHwwBj8Pk57L9V+TpDP1UbTilUXyJSVxIRgPK
         Ixig==
X-Gm-Message-State: AJIora97aQxlsldjGy0SHamJL7Yw13TtEozQza4/pd4gUox1Z2FSD048
	iQHbInyUZHuPDpbVIf8WvJeJxQ==
X-Google-Smtp-Source: 
 AGRyM1swlzVSJ66Orxe+h3TceWJLMiup7hioYL05NDKhhrUNdi+nAcP8luxFwYedmMmYvPzxP4fUag==
X-Received: by 2002:a5d:6da6:0:b0:21d:ac61:ba55 with SMTP id
 u6-20020a5d6da6000000b0021dac61ba55mr61934wrs.683.1657662945996;
        Tue, 12 Jul 2022 14:55:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527?
 ([2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527])
        by smtp.gmail.com with ESMTPSA id
 s14-20020adfeb0e000000b0021d7fa77710sm9241088wrn.92.2022.07.12.14.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 14:55:45 -0700 (PDT)
Message-ID: 
 <d4dd373c6d1718f6fd417c8484a057268df6d495.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Paul Eggleton
	 <paul.eggleton@microsoft.com>
Date: Tue, 12 Jul 2022 22:55:42 +0100
In-Reply-To: 
 <CAMw=ZnRwkp6nkZzqw69Xc83xDp0QRCZ+MNwHx=QiTdmncZ5L3A@mail.gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
	 <ba078de5f59105d61daed5b8abc69cd1e15bc43e.camel@linuxfoundation.org>
	 <CAMw=ZnRwkp6nkZzqw69Xc83xDp0QRCZ+MNwHx=QiTdmncZ5L3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 21:55:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167943

On Tue, 2022-07-12 at 18:16 +0100, Luca Boccassi wrote:
> On Mon, 11 Jul 2022 at 23:06, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2022-07-11 at 21:29 +0100, Luca Bocassi wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >=20
> > > Support for unmerged-usr is deprecated upstream, taints the system an=
d will be
> > > removed in the near future.
> > > Enforce building merged-usr images when using systemd.
> > >=20
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > > We intend to deprecate unmerged-usr at some point, and we are doing t=
he
> > > rounds ensuring distros are moving along so that there are no surpris=
es
> > > when the time comes.
> > >=20
> > > See:
> > > https://lists.freedesktop.org/archives/systemd-devel/2022-April/04767=
3.html
> > >=20
> > >  meta/recipes-core/systemd/systemd.inc | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-cor=
e/systemd/systemd.inc
> > > index b8dbe2263a..f9e109bba4 100644
> > > --- a/meta/recipes-core/systemd/systemd.inc
> > > +++ b/meta/recipes-core/systemd/systemd.inc
> > > @@ -21,3 +21,8 @@ SRC_URI =3D "git://github.com/systemd/systemd-stabl=
e.git;protocol=3Dhttps;branch=3D${S
> > >  "
> > >=20
> > >  S =3D "${WORKDIR}/git"
> > > +
> > > +# unmerged-usr support is deprecated upstream, taints the system and=
 will be
> > > +# removed in the near future. Fail the build if it is not enabled.
> > > +inherit features_check
> > > +REQUIRED_DISTRO_FEATURES =3D "usrmerge"
> >=20
> > Given none of our systemd testing on the autobuilder is done under
> > usrmerge and we've never mentioned this requirement to any of our
> > userbase before, this is going to come as a bit of a surprise to
> > people. The above change will break the autobuilder as things stand :(.
>=20
> Yes I was expecting there would be these kind of issues, the purpose
> of sending this was mainly to find out about them.
> So where are these configurations stored? How can we get them updated?

The configuration is yocto-autobuilder-helper but the best place to
start is probably the poky-altcfg distro config.

Once we change that we'll have to run through the testing, see how much
breaks and then find someone to try and fix any issues if/as needed.
There is a lot of work just in pulling things together for testing and
triaging the result and I'm depressed it will probably end up on my
plate when I personally disagree with the decision.=20

I was asked earlier today if we should just make the systemd include
files force usrmerge on. The challenge is that OE/YP give users choice
to configure their system how they wish, we don't just force
configurations upon them. Or only real option is therefore to throw
errors and have them decide what to do (which basically amounts to
submitting to the upstream decision).

> Also is a deprecation notification needed? How is it handled usually?

Do we have time for such a notification or are we in the situation
where we just throw errors to the user and let them agree to the
usrmerge change? The timescale is unclear but if the systems are
already throwing deprecation warnings at runtime, this isn't a good
experience for our users.

> Aside from process details, I assume there's no problem with doing the
> change in principle?

There is, but it appears a done deal which we just have to accept so
I'm trying not to start a discussion which I don't think can go
anywhere productive. If this isn't a done deal, then let me know as
that would be different.

Cheers,

Richard

