Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F05FC87FC9
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 23:22:43 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.8000.1754176958001719300
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 16:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gm4OEbKJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8fe5f3f340so1387027276.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 16:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754176957; x=1754781757; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HR4gRLCnDnlhbChWvJC2thG8fqmuju/hLg2lhf12Fs=;
        b=gm4OEbKJczIXOdAABWP/qHSdzqMelplLSc2ORmDUvcVbuQtbabb5X4Enkr5YxJZjS1
         gZnDMBAKHUNui1qM2o7AGyePIPX6wHG7ldufevy2q4HXq8A41IdAiqSqDyLpGMYlA+Ae
         ONr17g7AYKx26IecvdZ0BHYMgzTILT9sUKxJJSizJSB9nVoHCuqNfdsFvwxAjldafzN9
         DEqZ0QT/mDX63StKdkuROouBtY0/4xgTmHEXU1LK0Ud/W0qZnHQneOXrOp+22zLmhpFO
         w07a6g1ZF7F1sKERIZW8z/4josgjjhLPOl871yTwkJ/4PfC0vCOvsWZ971SfVnGedBV2
         nQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754176957; x=1754781757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HR4gRLCnDnlhbChWvJC2thG8fqmuju/hLg2lhf12Fs=;
        b=ipULthxozBK2/QK3Q424z3jtzjSdfCGZoHC2IMDFesX0xV25Yokt/Yfi9JgFwOSWoL
         drS5mjRMY2EIDo4XO/C/lRhICZiNiYZzbZoS8fluugAmGsBVidWYRKDhMbjTfajWSiaM
         FPHg1dbuqewCI+SFnyWo5YenMLkDQflxLs99IjCdA+shNxpHa4b60Oy8dCi/o3AOgU1Z
         XjPh8XJI9uD+kOE3tuk6JgXzrYo8UfpIlyKlVe+juwH99M8sN0k+IqjazQtFNlXJxX07
         NVo9PRATtaUbqGbKpAOlC3vwmE+DV+BxNbI8iJpfx/v0xICjJbkL6fky91FAnn/m5JVh
         Vf7Q==
X-Gm-Message-State: AOJu0YzfKYc70I2wKb2rghIkYxW15Suq3D3qDP2uBgB58RJAbIyfwoVz
	nnSKCBqj55PED9R7lYWt8QswFSSFwygVFxwDOLtwvx8KtwBRf0V6qa+aEER20hj28KMYEWmM36u
	qgSxxL+/fX0WwKTVgwggxkuzBWSRB448=
X-Gm-Gg: ASbGncsghOE67OnSLsJec/chW9lO/NMHKeCK6O5KWnk7spSAB/Yk3f/HKA0M/rFKJPZ
	wJXEZR49/KDuK5HQ9NoGTtWuIYOC4iEx/UYenPmohf8RuBQ6gxOhgoSLxvzo1KMXf6BpYYXFSpf
	xm3X9AICcQefYeGeA2LW6JBiO/2tY/EmfDyvOw2t8LPmQeBPbP3yxxByVLdDsl8zslVCfj7S0x0
	O9OIcKyA316GohovSEK8cyPl6fKkBq9EoBh/7YL
X-Google-Smtp-Source: AGHT+IHXpHNEWTDH//G00/4C7GsZ9213hJCtxmata1BxdKlefwb/TYfE+1ln0jZAPRCc2J1ZIlYyIxVQcLAv0h74GoY=
X-Received: by 2002:a05:690c:288a:b0:719:f37e:e675 with SMTP id
 00721157ae682-71b7f08dcbfmr43433587b3.17.1754176956920; Sat, 02 Aug 2025
 16:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250802211319.20060-1-anakin@childerhose.ca>
In-Reply-To: <20250802211319.20060-1-anakin@childerhose.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Aug 2025 16:22:10 -0700
X-Gm-Features: Ac12FXxItljeGhWNwHeBR-fUQSBJYhXWudsc_Wan238gBO54w2GXzo5ldkQKGok
Message-ID: <CAMKF1sqU_Pf8n4jQKiQUKFXhq+Ezpq_yjzwc7NQeao25pBadQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Automatically add compile_commands.json to ${S}
To: anakin@childerhose.ca
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 23:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221395

On Sat, Aug 2, 2025 at 2:13=E2=80=AFPM Anakin Childerhose via
lists.openembedded.org <anakin=3Dchilderhose.ca@lists.openembedded.org>
wrote:
>
> To better take advantage of Meson and Cmake's automatic generation of a
> compile_commands.json file for the clangd language server, link the
> ${B}/compile_commands.json to ${S}/compile_commands.json.
>
> I accidentally missed the initial commit which provided the
> compile_commands.bbclass. This corrects the previous submission.
>
> Anakin Childerhose (3):
>   clangd: add compile_commands.bbclass

I do not see a patch adding this bbclass in this series. Did you forget ?

>   cmake.bbclass: inherit compile_commands.bbclass
>   meson.bbclass: inherit compile_commands.bbclass
>
>  meta/classes-recipe/cmake.bbclass            |  2 ++
>  meta/classes-recipe/compile_commands.bbclass | 18 ++++++++++++++++++
>  meta/classes-recipe/meson.bbclass            |  2 +-
>  3 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes-recipe/compile_commands.bbclass
>
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221388): https://lists.openembedded.org/g/openembedde=
d-core/message/221388
> Mute This Topic: https://lists.openembedded.org/mt/114507103/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

