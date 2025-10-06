Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FA9CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 21:28:38 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.4019.1759786108744435054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 14:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fC/6Mimu;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71d60157747so60861007b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 14:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759786108; x=1760390908; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAHeH8hry1JcNuuQBDumYuN4ZNxEgMGc932KDf23cUM=;
        b=fC/6MimuBhmMzZU/CRsZ2j3EyzYKKLCv9rRcLEKNdizDBEURfiDGaWxirGw5nJRr30
         Uw/hfZAhFANnmNKkqlfRFlMr+vpDxDwm8rCPs9QzLjk6fIF1OkBaB/pDuiSGj9+ltHTB
         aXmJpd1yo84viCqiKZqdxcawMMYWSmA/Vhm/yghkuEzZhpe25fO9TgRbGK0G6wSwilAo
         tWv7VRL/MtmgzJPM67OuB6J7Utg+IDk/TSQrb/sjS+4Rp9yesRLa5H8Fa0pqgn8NXx+N
         M6RCj2ZuyrlmgXZX2lywjSVPRZyMYfSXEO7G8hkt/H1jAyBfefVSID/Z8Pki8zAm8k+o
         4emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759786108; x=1760390908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAHeH8hry1JcNuuQBDumYuN4ZNxEgMGc932KDf23cUM=;
        b=rNdb7j0VTOKkWTpnuwm72fGEYkMn/GP+HUyACN4L7TAS8/px1N1QChSAns8RN6Ya2q
         KppPQeYyGT6OfCJ40adViJk7HXWfNu8Tvmd+x5Gb+f5goI+yJjRAbqrPnYXcFRbqozn1
         B/42dVkxhnFWCXbKqQqlUSivENAI+skD1qjaGtPpicw05aEQUIfvWwjH+iaK9Uo3Gb2B
         ja9l87ftJsMAothjD/DMj2lnbzVEgTmY0ry4PrEPWHG+JUXW5TGgZMvx9myha9kIeqjY
         adoHCmDpEE8VEEWqyLcvWPd1OyVv5/xRBF4zVoH8XxqMVfOrpi7zoNGHCB+xpajxtJN+
         yjzw==
X-Forwarded-Encrypted: i=1; AJvYcCUGScSDqiAxkoSQ0uFIwCOUKJS4eGffqZMqZ4k4YgF2MTB8X78XdgWricfPspovOnjxj8Rzv2oGCuS/6JjT4/VYsw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxwBBTs12lB4ynK1JpCXWUMFN+Na8BZMEgxv4dhdqxdK/n2F7n
	hjXYqc35FIZryXkKE1AVDftw5BgrDEggwnKaxVJZIXmU1Wio55In4PmkwvZDmjNNRJlx9lEmaoj
	GTyBPaUpgKR5D3XI4Moir1u3VLtiHGQI=
X-Gm-Gg: ASbGncvXtbtbI+25FTyWlnKEbCazHqLiyhgE3XEl97WRk/RX+saT77JsSnx2qI3m/1z
	HzjSbbcnCe71+zx455syWA+/UvrxZ7O7Xisz73oLEOR2sFfGfEN+2V69bPZ2duiPCQpsHxRuU/q
	OyJnZYIwkJXStxfB5QUROBprsu5FQi7QDRNZBp3XU7ISd4ukyLmgcIc1Kc3SDDIB3PbBGZ+cDAi
	rL8Rpxkj7t6XcrlX4jaY0wLPyzrqLJtxU0OQ9uFcZi4AZyc2/8qtKpkF8lui/maPpgafGO/HYuG
	SOE5IcUqcYA2yAj/acBtHJdny/0dm2LDsBobaot1vK8HW2rYHArvUbBbXyWmtJlbQijfH1yLRDq
	mmJwXQg==
X-Google-Smtp-Source: AGHT+IGnutryjvxOOpvcrG6tjzuV9EtGfAzdCae2VzpjvTyCQ8oE4ifu/kQ+YnYElyOtZwEEBUw33guTFLhL8GjUUfI=
X-Received: by 2002:a53:c40e:0:b0:635:4ed0:570d with SMTP id
 956f58d0204a3-63b9a11dbebmr10277620d50.39.1759786107594; Mon, 06 Oct 2025
 14:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251001160212.2588471-1-Adam.X.Nilsson@axis.com> <FF7BA9D0-A09D-4D43-9CBB-5CA991E825BF@arm.com>
In-Reply-To: <FF7BA9D0-A09D-4D43-9CBB-5CA991E825BF@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Oct 2025 14:28:01 -0700
X-Gm-Features: AS18NWAILQsXr4gHovP2aPTJQklCI2lUip7fCZpZ3d9qhDykiUZ8ChqJ_S6qsU0
Message-ID: <CAMKF1sp1hb6ZSr=B6iAThoXcRQFD+h7vKxVcmPq2RoqeF2in0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
To: ross.burton@arm.com
Cc: "Adam.X.Nilsson@axis.com" <Adam.X.Nilsson@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Adam Nilsson <adamni@axis.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 21:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224506

On Mon, Oct 6, 2025 at 1:10=E2=80=AFPM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 1 Oct 2025, at 17:02, Adam Nilsson via lists.openembedded.org <Adam.X.=
Nilsson=3Daxis.com@lists.openembedded.org> wrote:
> >
> > From: Adam Nilsson <adamni@axis.com>
> >
> > Add a zsh-completion-pkgs image feature to install *-zsh-completion
> > packages into an image. This is similar to the existing
> > bash-completion-pkgs feature.
>
> By my count there=E2=80=99s just three recipes in core that have -zsh-com=
pletion packages.  Until it=E2=80=99s more common, I=E2=80=99d suggest putt=
ing the COMPLEMENTARY_GLOBS assignment in your own image recipe if you want=
 to use it.

It does help people using zsh as default shell and working with yocto SDKs.

>
> Cheers,
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224503): https://lists.openembedded.org/g/openembedde=
d-core/message/224503
> Mute This Topic: https://lists.openembedded.org/mt/115536491/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

