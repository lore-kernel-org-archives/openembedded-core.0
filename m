Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804CBC3DA6D
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 15:48:05 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.16080.1747324077327743585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 08:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ubqn3htN;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-606668f8d51so910765eaf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747324076; x=1747928876; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZuvASjf/L5G3hoQSqkp24PvB4oq6KrIwIXTncjvauc=;
        b=Ubqn3htNTavHAq58hLFOOl7Bvfk8dsH5RhQTr6oSFJSsWGBAxsGSsaL0e8jNT5kRkj
         0zh98iK0XhzAJ2CoP4pKumlMKnJkFemAvCv2bdOIUjKQEIcN0S7ReRdZTrOzPNg866oD
         JRbCndnzCH9pZowLvRHUuRQeOXbCj9on/WRS24zvHIp5KacwxvX/dQLrmu4g/2JlxtSW
         oVvqDGaqNOUV1HREEXx30Ak7n9la+6GSmZFBMP/B0aClSKMwt95BTIzD895FFnmO6ND0
         VmvefX9dENZ4K4QCh9htvv7tuBHFUInrJ8avTpZkaYLoDqI3wlCTGer1YsCnnSuC06a0
         tf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324076; x=1747928876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZuvASjf/L5G3hoQSqkp24PvB4oq6KrIwIXTncjvauc=;
        b=wyul4kmEqfnR5N4V0Hynx2KpguLwwW7OsmmFnfRuiqbB+KrimMyOKm4fpDCRQKrO4P
         T5QoH2Ygr98nueqWMMmYAjvlbUxoSr9sbJat+17PR44tHoJnX3nkobEBR9WosBFqr71L
         WWSYgQZo6idpIMo7gwHLGtp4+lV8UMGEn7dvqRk3KDjR4mpTY/7ZI6aCpmlF27XIc1TO
         uYyxhWiliaDqGaw3+iredE459X7JbP1XKQ42DztLetEoq/n2kvIkt/iB/rWVV8UYRx2n
         Q43O4vEh7mS1xvwnsMtu6dRbllGafCMXRw7U3tb6sFwK3Hwo1Pa/U8AXnVZCJZ28uD8t
         K7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWq2A9VULib/xCE2Uk5Rp2XQUAXJ9qmGWOSXTI0aUOI0lkjZOIzH2HT/LvUofu4lsY/r6N2oIMbA8hUkusHwgSHsg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFIvZ0iY2t+HC5y0bNg/bpv4ftvKqUrjKSjXV/ePVJ0VlrBOI5
	BKeJibNZIFwTgNdt2xBkQ3auZZnvuNeA5hR1V6yiUZ47uO4ug/V1EeFPj6ZyJwuJVSo8OmdltY3
	yFIkww1oh3ku/0WjLb/YvD0bq2w4=
X-Gm-Gg: ASbGncubYMjGXce1S8NAe6BdY2AVV3sccQPnXa8BZeZ3gZCHUd0pghIlUx9grUJd/xN
	xr5yWlwXFLL1CbLvbcPsVsWbiemu4p4PEh7Tv7wc1G2g7O0LPhlWMdFPQ6hacny11Wsv0VwVsHB
	BM4xwlNW9MzyIIB0DGpTzUIWOEDUN7h2lQ
X-Google-Smtp-Source: AGHT+IGskV6DlY3tZfx25foeYhZggrpvJNCTOWNbjFgwXhvv9wsbJoZMeMfFDup32+jmp8/dML83J79Z6cAGKteOGx0=
X-Received: by 2002:a05:6820:2107:b0:606:3abb:1934 with SMTP id
 006d021491bc7-609ea121973mr2545160eaf.2.1747324076518; Thu, 15 May 2025
 08:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
 <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com> <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
 <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com>
In-Reply-To: <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 May 2025 08:47:29 -0700
X-Gm-Features: AX0GCFu3a0aczYDr40JvDRpb3tb0Oqfzl3MELFxg6nPnSgldjfsHwK9lqSNgHPg
Message-ID: <CAMKF1sr68GCyfXRMuS4cUBRL4jCEd4RUZ4GZrKN84R01w_gfSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
To: luca.fancellu@arm.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 15:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216691

On Thu, May 15, 2025 at 6:52=E2=80=AFAM luca fancellu via
lists.openembedded.org <luca.fancellu=3Darm.com@lists.openembedded.org>
wrote:
>
> Hi Alex
>
> > On 15 May 2025, at 14:38, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
> >
> > On Thu, 15 May 2025 at 15:36, Luca Fancellu <Luca.Fancellu@arm.com> wro=
te:
> >>> Why? Can that be a PACKAGECONFIG?
> >>
> >> I used the same approach as lldb, why do you think we should use a dif=
ferent approach?
> >
> > The request was to explain why this is beneficial, and should be
> > always enabled. What is the use case specifically in clang?
>
> ok I see what you mean, the module will use some python bindings for libc=
lang, so I guess
> some recipe could switch the feature on if using the module, otherwise it=
 should stay off
> by default.
>
> Make sense, I=E2=80=99ll try to implement in that way

Just measure build times before and after this change, my guess is it
is not adding a significant amount, but do measure it.

>
> Cheers,
> Luca
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216680): https://lists.openembedded.org/g/openembedde=
d-core/message/216680
> Mute This Topic: https://lists.openembedded.org/mt/113126509/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

