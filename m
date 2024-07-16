Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97303C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:43:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.7040.1721123014290918134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 02:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J+C9qbbX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4266ea6a412so36345115e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721123012; x=1721727812; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8a2MUrWUEQdbj422NgIjbW3iyUVHkxFJrLD839ZIocA=;
        b=J+C9qbbX/VU76LaiarviLPCps+tMEl5Yrs4ZGABl3wDm7/A14ZsCaMwRuZkhM+Ll4N
         em7cD6x1+yu+hx4rntFxFp9eiB4PhZxat4wuqGFDiuNdy/WS9idf/9pBe1Zv3lbO/Mu2
         Zy+lMPy5Mbv0RNBinscGhJLYaE/DSazQZV9/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721123012; x=1721727812;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8a2MUrWUEQdbj422NgIjbW3iyUVHkxFJrLD839ZIocA=;
        b=wCVHtZuzVtmh0uEm/Llx3MS1Il3r7754mFC9vstCXC9RdlB+hO2Sft/7m6WBkZnwr+
         xeE0s/c+jH2cm3QMfbdvCYmDwi0J6jJK2iJYCFHToYRelISqi89j7TFbdh5iudseyklN
         ufImU7ROzewqnEh4Wa6Hoc1UxnP8qUfSH/5ndD1Zc39Hc8X0jDvRcJ41XHqXTY/430od
         HpFHcvPVzY/xsdJxD0tDX99tGsYB3oI8ottxiQaGGAocv+UJZINn0OjdpOc3PIRo5ynQ
         7+ilUk4kJQBv/vpnpUr4athw9QXurDHK9WK3GuRvNiA/Ul0lm6fWCV92wGOGE6BgibDn
         r8IA==
X-Gm-Message-State: AOJu0Yx8SXm327MMnJ8F0tPFruW30fsC3wUyAw+wDF29vhGQrxRZEGO+
	2+uCT0TWit/ofAQW11xa3vnSLS+t5pNPLusDkOOhb8Sg6C7OENJOcZEdPr076WI=
X-Google-Smtp-Source: AGHT+IEs89wIJHgDeT0cAr8YES8g4Bi/BNzdr/KXSf2LspYlqNXj5l0AnYLGrfip6bRAgOutNnwmsA==
X-Received: by 2002:a5d:6188:0:b0:367:9816:b071 with SMTP id ffacd0b85a97d-3682633ba18mr921025f8f.45.1721123012218;
        Tue, 16 Jul 2024 02:43:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:86a0:3ee3:878:91c7? ([2001:8b0:aba:5f3c:86a0:3ee3:878:91c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb449sm116871845e9.35.2024.07.16.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:43:31 -0700 (PDT)
Message-ID: <00175de6706930b66c14679de7d6fcfa6633ab92.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] package: Add support for INSANE_SKIP for
 incompatible-license
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2024 10:43:30 +0100
In-Reply-To: <17E2A5EE047FA37E.16356@lists.openembedded.org>
References: <20240715190738.32206-1-reatmon@ti.com>
	 <CANNYZj9DXbuFwHLHZa2p8asasehxkDaGYoH+PuMWEbfiHFx20g@mail.gmail.com>
	 <17E2A5EE047FA37E.16356@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202094

On Tue, 2024-07-16 at 10:00 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2024-07-16 at 09:57 +0200, Alexander Kanavin via
> lists.openembedded.org wrote:
> > On Mon, 15 Jul 2024 at 21:07, Ryan Eatmon via
> > lists.openembedded.org
> > <reatmon=3Dti.com@lists.openembedded.org> wrote:
> > >=20
> > > With the move to make more warnings into errors it is inevitable
> > > that we
> > > will need more hooks to skip the errors on a recipe by recipe
> > > basis.
> > > This patch just adds INSANE_SKIP support for the incompatible-
> > > license check.
> >=20
> > I do not think this is a good idea. This was a warning before, the
> > warning was never fixed, and now, instead of addressing the issue,
> > the
> > error should be suppressed so that it's *never* going to be fixed?
> >=20
> > You can still revert to a warning if you so wish, but in general,
> > global INCOMPATIBLE_LICENSE is essentialy deprecated in favour a
> > per-image one, is there a reason you are still using that?
>=20
> The ERROR_QA change is going to take a bit of adjustment for people.
> There are some things in there which recipes will need to tweak for
> various reasons (e.g. pre-built binaries). After much thought, I (and
> others) concluded it was better to have recipes marked up with the
> issues rather than have it as some "random" warning in the build
> people
> ignored. I therefore think it is the right move but we need to
> support
> people in marking up the recipes (and ultimately ideally fixing some
> of
> the issues).
>=20
> With regard to the patch, I think the key question is whether we want
> to add INSANE_SKIP support to every call site (potentially) or
> whether
> there is some better function abstraction we can use.
>=20
> The implementation in do_package_qa is:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 skip =3D set((d.getVar('INSANE=
_SKIP') or "").split() +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (d.getVar('INSANE_SKIP:' + package) or
> "").split())
>=20
> which shows the first issue with this patch - INSANE_SKIP itself
> isn't
> looked at (for a recipe wide disable).
>=20
> So I think we need a new common function alongside
> oe.qa.handle_error()
> which adds the pkg option and checks accordingly?

I'd also note this:

# Add the package specific INSANE_SKIPs to the sstate dependencies
python() {
    pkgs =3D (d.getVar('PACKAGES') or '').split()
    for pkg in pkgs:
        d.appendVarFlag("do_package_qa", "vardeps", " INSANE_SKIP:{}".forma=
t(pkg))
}

since people do want things to rebuild correctly when you set/unset one
of these options :/.

That does complicate things a lot for the issue at hand.

Cheers,

Richard

