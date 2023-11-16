Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B8AC54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 13:54:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.6956.1700142840572120953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 05:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W9I3FiUC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40a4d04af5cso6035485e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 05:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700142839; x=1700747639; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YKHGegDdCFnptP2iIZuiZkrYa1p6N9PRWfMtJMDuVDQ=;
        b=W9I3FiUCEGCN+k607lh7/BbbqzwKrN+bOH6GnvEiUXMEhbCtYTaDFwgr5zR6iqd1bZ
         1Bh1YJc9MoZHGz2zGNUaDso9uX5YPmtShM1UmVZe0viVBk4nw1TyBVeMeDB4eMn9vwU5
         ZxZFtzYJVdx2xyzC55idsPbiFTwqPaiJbabcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142839; x=1700747639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKHGegDdCFnptP2iIZuiZkrYa1p6N9PRWfMtJMDuVDQ=;
        b=mfyoXUhaZFphw3IYT8ag40emA3MQ1iad7SQsk+kJbk+ameS/QqG30o4ZsPAt4KlYAV
         +ejbC4EQkO/4WtnG7SCxxUlJKSsr4iQLVqPmCRzjosMOcUWTNu8qQguffEF3JJqAiGWQ
         B7k3mzILDPouht90pYJYh7w46cvAt+vAJfepofQqv5WgdmUOmWyACBt3ccFMVOl9tVEl
         fuUzSEeW7TqUldOgmqyOCtGD5kaPLPpJkPfTKhEaVunClERG/UiX8vLA1rIRuHh3JEA7
         PqhXIodGwXHLa9DcNEYpYe08X/Y7lQOOaHn5PbqKQmLYhkKpaCqEeJ/1xOZxhUjWOd6k
         S4Ig==
X-Gm-Message-State: AOJu0Ywq8PsEyWaoDgwVG9NWqXAel6To5OJVuVYObYJt3oCflw6LhJWu
	J0DvEufw3geUv5TeL0pPnz/PCA==
X-Google-Smtp-Source: AGHT+IFmJfbiViIPY0SR0geBLfcppfPIV75xqBtF+iN1tljYo/o9sg1yjpxMiRJmg0w1itnh2p1QAQ==
X-Received: by 2002:a05:600c:3b94:b0:408:5a1c:9de7 with SMTP id n20-20020a05600c3b9400b004085a1c9de7mr14159591wms.7.1700142838640;
        Thu, 16 Nov 2023 05:53:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952? ([2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952])
        by smtp.gmail.com with ESMTPSA id h4-20020adff4c4000000b0031ad5fb5a0fsm13697190wrp.58.2023.11.16.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:53:58 -0800 (PST)
Message-ID: <d0ce7354a1f78365b3305e1d90aea5525cf48b24.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] meta/recipes: Remove empty
 ${PN}/DEV_PKG_DEPENDENCY workarounds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann CONGAL <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Fawzi KHABER
	 <fawzi.khaber@smile.fr>
Date: Thu, 16 Nov 2023 13:53:57 +0000
In-Reply-To: <CAMSfU+4sT86jrae0GDCAwA+R2ERb0CT7WWe5JRMoeRyaQ_x6cA@mail.gmail.com>
References: <20230928215640.2683961-1-yoann.congal@smile.fr>
	 <20230928215640.2683961-3-yoann.congal@smile.fr>
	 <1ab344acaa97212f14044d48623d03b9a93c2ed4.camel@linuxfoundation.org>
	 <CAMSfU+4sT86jrae0GDCAwA+R2ERb0CT7WWe5JRMoeRyaQ_x6cA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 13:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190796

On Thu, 2023-11-16 at 14:10 +0100, Yoann CONGAL wrote:
> Hi Richard,
>=20
> Le jeu. 16 nov. 2023 =C3=A0 13:13, Richard Purdie
> <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> > On Thu, 2023-09-28 at 23:56 +0200, Yoann Congal wrote:
> > > From: Fawzi KHABER <fawzi.khaber@smile.fr>
> > >=20
> > > Remove superfluous DEV_PKG_DEPENDENCY =3D "" previously used to bypas=
s
> > > ${PN}-dev package RDEPENDS on empty&non-built ${PN}. DEV_PKG_DEPENDEN=
CY
> > > applies RRECOMMENDS now, all workarounds are not needed anymore.
> > >=20
> > > Related to [YOCTO #6839] and [YOCTO #8222]
> > >=20
> > > Signed-off-by: Yoann CONGAL <yoann.congal@smile.fr>
> > > Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
> > > ---
> > >  meta/recipes-connectivity/bind/bind_9.18.19.bb                | 1 -
> > >  meta/recipes-core/musl/bsd-headers.bb                         | 1 -
> > >  meta/recipes-core/musl/libssp-nonshared.bb                    | 1 -
> > >  meta/recipes-core/newlib/newlib_git.bb                        | 3 --=
-
> > >  meta/recipes-devtools/gcc/libgcc-common.inc                   | 4 --=
--
> > >  meta/recipes-devtools/python/python3_3.11.5.bb                | 1 -
> > >  meta/recipes-graphics/mesa/libglu_9.0.3.bb                    | 3 --=
-
> > >  meta/recipes-graphics/mesa/mesa.inc                           | 3 --=
-
> > >  meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb        | 1 -
> > >  meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb                | 1 -
> > >  meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb          | 1 -
> > >  meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb          | 3 +-=
-
> > >  meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb         | 3 +-=
-
> > >  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 -
> > >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb  | 1 -
> > >  meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb | 1 -
> > >  16 files changed, 2 insertions(+), 27 deletions(-)
> >=20
> > Firstly, sorry for taking as long to get to this.
>=20
> That is fine! This was sent really late in the dev cycle wrt the release.=
..
>=20
> > The patch 1/2 looks
> > good and I'm happy to merge that. It does set us on the patch I
> > outlined originally so I think we're good there.
>=20
> Awesome, thanks!
>=20
> > I'm less sure about this second one. It appears to remove variables
> > which do actively change things and once they are removed, warnings
> > from the previous patch show up.
> >=20
> > I therefore think the second patch is incorrect and doesn't move us in
> > the direction we want?
>=20
> I would need to look into it to to confirm this but from your plan :
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6839#c7
> a) was to make warnings appear
> b) fixing the warnings
>=20
> We are now between a) and b) : warnings but no fix.
>=20
> Since the patch I finally integrated the fact that the CI must be warning=
 free.
> So I guess, I'll come back with a series with this patch (a) _and the
> fixes (b)_.
> Does that sound good?

Yes. I think the changes in 2/2 actually create warnings where we don't
currently have any and you'd need to revert 2/2 to help with the fixes
in step b) above.

I did also do a bit more testing of 1/2 and it also needs a bit more
work unfortunately, it is the right direction but not quite there yet.

Firstly, it shows warnings like:

perl-modules rrecommends perl-module-warnings but perl-module-warnings won'=
t be built

which is because it is an RPROVIDES:

recipes-devtools/perl/perl_5.38.0.bb:RPROVIDES:${PN} +=3D "perl-module-stri=
ct perl-module-vars perl-module-config perl-module-warnings \

so we need to teach the check how to resolve and ignore those.

Secondly, it is only handling "self referencing" rrecommends.

That can be changed by updating the constraint to something like:

        if not rrec_data or "FILES_INFO" not in rrec_data or (rrec_data["FI=
LES_INFO"] =3D=3D "{}"
                and not bb.utils.to_boolean(rrec_data.get("ALLOW_EMPTY", "0=
"), False)):
            oe.qa.add_message(messages, "rrecommends-non-existent", "{0} rr=
ecommends {1} but {1} won't be built".format(pkg, rrecommend))

but then a lot more warnings appear.

I think a lot of the new warnings would be fixed if the RPROVIDES issue
is accounted for.

So things are heading the right way but need a little work. I'd be
happy to merge 1/2 when it is ready since we can enable the warnings on
a per layer basis now once we fix the issues. 1/2 isn't quite ready yet
though, we need to fix the RPROVIDES issue.

Cheers,

Richard


