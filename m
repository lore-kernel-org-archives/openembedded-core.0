Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A28C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:04:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.177403.1698249859014411691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 09:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=GRizSYaz;
 spf=pass (domain: baylibre.com, ip: 209.85.208.46, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso9268633a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698249857; x=1698854657; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JC5PVBfeEmrKE6wpCX8EAG7Vl4g9ZmygWpBbtGKWNw=;
        b=GRizSYazKTdZEnHPm9eZwvWR2tmYwBoZn5aTU00OAvmZ+Skz2jMcxatK7ufdARVIRj
         WH9UIHwWzMtaJvT1xtShvYkli0Sx/CRODf0h+friKz7K1OciUd/ANkGI5Zjuj2WwS/Gb
         VR+ZnIZM7LL3OlIP+Xdxht5498iEWeqIIQnup8lKr9yklmwiNuYGrss5w8qcreXbfrU5
         rHV9O94kv6V3/CqVShhRvGNPj0lJ+HHN7Om1v1LmKqAdiVYpmhAHSHJsrMBkgxUnIGSF
         55OCU1371oge/McM5B2NIjhaLyfsMqXEA5a2hzRLBgQ2QLmkiLCveSl4k1WzTaBNUSui
         +Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698249857; x=1698854657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JC5PVBfeEmrKE6wpCX8EAG7Vl4g9ZmygWpBbtGKWNw=;
        b=dvxbazun+2lLBHVDuiyGXoH6anuK1YTokLq73+UQpru7131t8qWBlC52IU1uVmsYm6
         Sy+m7sXqJGM7FuIHNYynBqJs2ePchMUN3Tn/ZInIoMsxj4/6pNGe5SPxMu7/a81fyz6/
         UxKQPj657hpjGypIOjNCFaIfn3BYe+wB+sbK+p/O53QxvVHB+2neZgpV57qjl0UGtCg/
         9hmINOsJwcrGdpCYXp4aGnj/6aYbeZ6nszOaVr43KSibEADZQbwOnZXNbvD5fBqpY0Mm
         y9CJD3CpJNuHrbMn4MQUNvTm4oGgVofDT4B6Bg4h7Ls79c+bM0Yx4nkWgnZ8nmqtdIjN
         h/BA==
X-Gm-Message-State: AOJu0Yw147P1FUbWyeANOCGL+CO6xvOzqYi7ZJolatyCrrVrLSr1bUP3
	BYGO0ygMsHSmyu/C66k7YAoeH2itMqQsk6HYmekUvA==
X-Google-Smtp-Source: AGHT+IH+hUD4qS8yVHB/0gtbY0C1nnooGBL8dP0CxIAowvBe3NTIOgwHxpEx/jo16UqSGasu/I+XTiEnmEwZSyI2cnY=
X-Received: by 2002:a05:6402:5186:b0:53f:9045:8cbe with SMTP id
 q6-20020a056402518600b0053f90458cbemr12377713edd.26.1698249857463; Wed, 25
 Oct 2023 09:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231024141754.1528786-1-jstephan@baylibre.com>
 <20231024141754.1528786-2-jstephan@baylibre.com> <20231025170144.70459a2d@booty>
In-Reply-To: <20231025170144.70459a2d@booty>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 25 Oct 2023 18:04:04 +0200
Message-ID: <CAEHHSvbgby_sJ=Y1PUvTaJp8j1XTrZvYgGyHQLV+cLtajG-=1A@mail.gmail.com>
Subject: Re: [OE-core] [RESEND PATCH 2/2] oeqa/selftest/devtool: remove spaces
 on empty line
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 16:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189691

Le mer. 25 oct. 2023 =C3=A0 17:01, Luca Ceresoli
<luca.ceresoli@bootlin.com> a =C3=A9crit :
>
> Hello Julien,
>
> On Tue, 24 Oct 2023 16:17:54 +0200
> "Julien Stephan" <jstephan@baylibre.com> wrote:
>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/se=
lftest/cases/devtool.py
> > index c36b1efa78b..b5c488be8e8 100644
> > --- a/meta/lib/oeqa/selftest/cases/devtool.py
> > +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> > @@ -575,7 +575,7 @@ class DevtoolAddTests(DevtoolBase):
> >          checkvars['S'] =3D '${WORKDIR}/MarkupSafe-%s' % testver
> >          checkvars['SRC_URI'] =3D url
> >          self._test_recipe_contents(recipefile, checkvars, [])
> > -
> > +
>
> This patch does not apply due to the '-' line above having no spaces
> after '-'. Perhaps your mailer mangled the content removing training
> whitespace (which, ironically, is what the patch itself aims at doing!).
>
> Using 'git send-email' is usually the best way to send patches without
> this sort of issues.
>

Hi Luca

My editor mangled it.. I just resent it again.

Thank you

Cheers
Julien
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

