Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3473CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 07:38:28 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.22422.1697701104553770245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 00:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QjoFnyBZ;
 spf=pass (domain: baylibre.com, ip: 209.85.208.46, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53f6ccea1eeso2137640a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697701103; x=1698305903; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSNokLqZiJPY2mpjsHJ9aQHP59BfnRWmA+p3vHJw6n4=;
        b=QjoFnyBZUf/hg0R6HDW6N/hq3C9F1eL0iNmzuj93RhS+rckGpnnpm0cE9paNsLeikD
         FjCBU2tDz5eufG0x9hXzXZo/tIu+E7ykBbfQ8SVPM12FArtB80Whoq7E9w2oGAziyFAV
         lhMuaJNRkZ1LidVEQf24wwJpCawxeytHr+l2Dntx3pi8JKPk2RIARokSwlVsVtXiKL1L
         v1LYe48VCV4/hTKcHoGQl9ssMkh1w6tNldpfV4+Ma+ITcCk359LeukqfE6XrkAMduYYy
         za1KGrMbNNldTVmq5RKHxQySlLfSQZctHCm2xw0+KGBHoKcHL7ZiUreWfRWF/Hb6SBYv
         H3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701103; x=1698305903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSNokLqZiJPY2mpjsHJ9aQHP59BfnRWmA+p3vHJw6n4=;
        b=ZT3ZnJF9zcyRA+Hc2MnkOH+hXQ4F2tvwTHGOv4zXbuCVWqirmfUAwJMT5SzEP89TRy
         vbBdtsbdna6UXt0QMpDckD3Zm1US2090NR8XF6iz/ECHoL9cTkiL0Fqd7QMxQeIKKFqu
         proSwdDhSRCDUPixKCArcY86410t6hAoQp8T104Boa3s4PuMpoXWTmoe+DnrYDnAL4E2
         DrKt+BAzcvi2KaA5JSi0arVpe2dE0Fq0ycHKXoIQso57jMBKz2nTJ1psAx5Oq2gZA6w9
         7HqsLzEcY9mhyPwGY2Bb3VhCqb6ZH1zx5wKLDEFv2gJZKsREq3Z/dTAzL3wtUaTFxmLF
         AYoA==
X-Gm-Message-State: AOJu0YyK/Z9fZor/Ob3Ef1J7KYT1JNHpkjXt/UXQxBvmw/lA90LU1Esg
	dHpYftCZWkYhaXZTnoR4M8SHR8NYHir0PR3KxYSQInjsG2fQ90hHf2o=
X-Google-Smtp-Source: AGHT+IEAuzJkc5ayW6ADVke6FLi+BFGbKp/eiXW7XwfKAh97XK52i5LiQvwWORH4ixzKTghUeiRXslpqd6xyJKwCyEE=
X-Received: by 2002:a05:6402:524b:b0:53e:3584:d393 with SMTP id
 t11-20020a056402524b00b0053e3584d393mr855406edd.26.1697701102985; Thu, 19 Oct
 2023 00:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231018120114.1222475-1-jstephan@baylibre.com> <2023101819581237082c3d@mail.local>
In-Reply-To: <2023101819581237082c3d@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 19 Oct 2023 09:38:11 +0200
Message-ID: <CAEHHSva2xUB2eftjjAPTTyrjUzTFEz7F6yWucUr_wydJojVb_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] scripts:recipetool:create_buildsys_python:
 fix license note
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 07:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189432

Le mer. 18 oct. 2023 =C3=A0 21:58, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Hello,
>
> On 18/10/2023 14:01:11+0200, Julien Stephan wrote:
> > License field of setup is not always standardized, so we usually use th=
e
> > classifier to determine the correct license format to use in the recipe=
.
> >
> > A warning note is added above the LICENSE field of the create recipe
> > in case a license is provided in setup. But when the plugin is called,
> > "LICENSE =3D" is not yet present so we can never display this note.
> > Replace the "LICENSE =3D" condition with "##LICENSE_PLACEHOLDER##"
> > to actually be able to display the note message
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  scripts/lib/recipetool/create_buildsys_python.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts=
/lib/recipetool/create_buildsys_python.py
> > index 92468b22546..d2c7e251bf7 100644
> > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > @@ -254,7 +254,7 @@ class PythonRecipeHandler(RecipeHandler):
> >
> >          if license_str:
> >              for i, line in enumerate(lines_before):
> > -                if line.startswith('LICENSE =3D '):
> > +                if ine.startswith('##LICENSE_PLACEHOLDER##'):
>
> I doubt this parses at all, ine is not declared ;)

Hello,

:O I completely messed up my rebase, good catch! Fixed in v2.

Thank you alexandre

Cheers
Julien

>
> >                      lines_before.insert(i, '# NOTE: License in setup.p=
y/PKGINFO is: %s' % license_str)
> >                      break
> >
> > --
> > 2.41.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189385): https://lists.openembedded.org/g/openembed=
ded-core/message/189385
> > Mute This Topic: https://lists.openembedded.org/mt/102037342/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

