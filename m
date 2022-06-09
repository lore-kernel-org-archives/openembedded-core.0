Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3494C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 16:21:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.15609.1654791661203349067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 09:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VuthPihd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id p10so33098539wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=dOgVWJy+1AA/ozGZjNkreLTRFnWetOTA3/16Z1h2eQk=;
        b=VuthPihdaGApSakrjcjOtpTkt3sAvEBCycVUO27lzRtegDtvhUNeOO4BZEpOZ9bNXd
         M52yyeUWm5ZMPhXGkxRct8bL/wYgNiuMALbpwXlY/GK/RwvJA3UuYthqcN9xejq/2UOq
         f3FsMiIla9tn1LzvJ8V1kejJEGeX0tnHTXCXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=dOgVWJy+1AA/ozGZjNkreLTRFnWetOTA3/16Z1h2eQk=;
        b=UJhZ87Wg4GSyCRS6PThV1K2I0lHxkRCqSE0o3EPYmv9Ddrf7E0npwcqj4RUs0AnccO
         zQx1J/9AdnlUGoMla6fRNdFMvPlFJWuITe1GUvt12yOuZr+VGt9r7iIsZdfJRwA6UgM3
         TH61JMvShDjVzesRKKrchp3U2tFsKbhcGaxLYMX+PuJ+6/be08Kmu31uIsggpMH9sX7O
         qoGO0s8qOcxta9FI3mN+TP4hVQsM4JxKHtJaM1UW13QoA37My+0F/KrYT553QIQuIUgK
         0+kJcqr+f8VwZC9c89BeV3R4SQ/ThsIlLbvxmWmahmhfpl22RlSQtFyql00JPoOGDyE9
         zr4A==
X-Gm-Message-State: AOAM530wYV4uCTw+2GlPPpHdediDu6I+FmfCprqm6xm6zFdgRTkJQAS6
	8YqY8r6VETh+CJ35UjGmm9YFtw==
X-Google-Smtp-Source: 
 ABdhPJyv/X5fXisBs+VIBeTvIezZjBWXE/95prS9VHVgkgm4Nf6HR2SHd+FMqauDZbR/tRuiopbzig==
X-Received: by 2002:a05:6000:1861:b0:216:4519:18a1 with SMTP id
 d1-20020a056000186100b00216451918a1mr29065570wri.293.1654791659519;
        Thu, 09 Jun 2022 09:20:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2888:8172:672a:5175?
 ([2001:8b0:aba:5f3c:2888:8172:672a:5175])
        by smtp.gmail.com with ESMTPSA id
 m189-20020a1c26c6000000b0039c6ce32a2dsm2614942wmm.33.2022.06.09.09.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 09:20:58 -0700 (PDT)
Message-ID: 
 <f5cea24f326b0450d8c5ae14a1edb8a10b2526d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 18/21] perl: update 5.34.1 -> 5.36.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 09 Jun 2022 17:20:58 +0100
In-Reply-To: 
 <CA+chaQfAtrfQttR6rEVgMCV7CrXzRDUyVcW=ujFSc9uic-3CFQ@mail.gmail.com>
References: <20220606120126.3381438-1-alex@linutronix.de>
	 <20220606120126.3381438-18-alex@linutronix.de>
	 <CA+chaQfAtrfQttR6rEVgMCV7CrXzRDUyVcW=ujFSc9uic-3CFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 16:21:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166782

On Thu, 2022-06-09 at 14:44 +0200, Martin Jansa wrote:
> On Mon, Jun 6, 2022 at 2:02 PM Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> > =C2=A0.../{perlcross_1.3.7.bb =3D> perlcross_1.4.bb}=C2=A0 |=C2=A0 2 +-
> > =C2=A0.../perl/files/perl-configpm-switch.patch=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-
> > =C2=A0.../perl/files/perl-dynloader.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-
> > =C2=A0.../perl/files/perl-rdepends.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 49 ++++++++++++-------
> > =C2=A0.../perl/{perl_5.34.1.bb =3D> perl_5.36.0.bb}=C2=A0 =C2=A0|=C2=A0=
 2 +-
> > =C2=A05 files changed, 35 insertions(+), 22 deletions(-)
> > =C2=A0rename meta/recipes-devtools/perl-cross/{perlcross_1.3.7.bb =3D> =
perlcross_1.4.bb} (92%)
> > =C2=A0rename meta/recipes-devtools/perl/{perl_5.34.1.bb =3D> perl_5.36.=
0.bb} (99%)
> >=20
>=20
>=20
> Have anyone else seen perl.do_install getting stuck with this new shiny v=
ersion as well?
>=20
> =C2=A0690770 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 10020 =C2=A03700 =C2=
=A03196 S =C2=A0 0.0 =C2=A00.0 =C2=A00:00.00 =E2=94=82 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=E2=94=94=E2=94=80 /bin/sh /OE/build/poky/build-st/tmp/work/x86_64-l=
inux/perl-native/5.36.0-r0/temp/run.do_install.690768
> =C2=A0690771 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 99860 =C2=A01948 =C2=
=A01364 S =C2=A0 0.0 =C2=A00.0 =C2=A00:00.00 =E2=94=82 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =E2=94=94=E2=94=80 make -j 40 DESTDIR=3D/OE/build/poky/build=
-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/image install
> =C2=A0690816 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 =C2=A0 99M =C2=A03340=
 =C2=A01428 R 102.1 =C2=A00.0 =C2=A03h06:44 =E2=94=82 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80 make install.man=C2=A0

I've seen perl and the kernel hang in make for some versions, I did try
and put a warning about the known Fedora issue. Was this with the
recent make-native dependency added? If so that would indicate it is
potentially a bug in the current make version :(

Cheers,

Richard


