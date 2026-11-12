Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12958.1794489633405545775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 05:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=z4kFThTZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b2d14968c9so46445117b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:20:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489632; cv=none;
        d=google.com; s=arc-20260327;
        b=RidpmmLscOBvtsky231j+yE0CpVSgTuoDQLJ/8vCJoi59AQPPcflDRwenEjlmy3oJV
         Hncwzq5KFtKsLHcecbBS43lfn5+nsmeb6UKE5hCPZTYoIAYFAA7K/9zlXvlByEC0pU+k
         ljLwHp+3P6kz9MwGumL+/EAE8UoVwWdDdi5AnxNAGOvEJxCd7c2ewwbiFkSp1buxVJfI
         AmWSKjVUFBzoFuJwitpRONzIPuZsBlDDIileKLnJRdLXIQd8uQm93fwQzAxAR/9Fj/bj
         ZBn2caWc291zTN5WlAeBfPPslYGVtY3qPXa4n3ekdQUxqHgSNNlwVspGRgmlvBwJ3l68
         Ggeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bOQmmybAAxsuTigReJgNzAMrWn/AusnQr5gsz3bSCR4=;
        fh=FxPQcvcPQCuYv5p+cTI4sfqaVBcM23gFaSmq5pfnDY4=;
        b=fFD4ocICWzhu7AyrUHDwnM07efm8VYRzkKt/NvVsYoRVzv8yRu+VJQwkFS+uzsWc1r
         GxDW1DDY11VWHvFKHwjRVrZ4noapZCgj3iA96JFG3gVdjwwUMrLzakj6msNDyBY3MpFK
         G8gECiwSIy1TOsWmXSCpnao5pmkxWNbirs4ZWuB8Eq/3wxiOEaVD3oIx335qnux+bx3/
         AqDoQjd8V39I9QPFDTYm9BdQg3fOI2PrN0f2OBYqMjfvy+b9YHGkwCT1/3j3U1piCEkR
         BIEADBbVKCcVtLDnqEGKXJOZrfZGLvQTbgTot1OUWEV6/agMLVx5RJ0XJcM6XrHl+Vxf
         aOtg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489632; x=1795094432; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOQmmybAAxsuTigReJgNzAMrWn/AusnQr5gsz3bSCR4=;
        b=z4kFThTZ2na3FwbN2jq+lL0hQNcMbH/rXPLzoT8XoKo9zhJCP37pFvG1/KsTr9I1nA
         ZAkdSN+jLLg1qitB/SDM6usQPJaw3TarYf0TvmbcjR0seoHTxj3nhaFmCey87n+p2CE8
         4DehJZqcChjxytTp0sHetCyLRpYNUllrq90Tc4X7VkQUf6BGhRePuyLnCS6vMRnW5Y67
         jHK2oPSoJKKDUvlTCcDWxMuBvsDZUOIjtMBMH9sHztt+ZyIznET7f/VbM4IoYH10YgMu
         qytT0MyFeMg7SnrRVvz/C5fQ5nxzkClA0+y0MGeTBbY/qXTPeoRdS2BQYvtKrscHf8KH
         pO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489632; x=1795094432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bOQmmybAAxsuTigReJgNzAMrWn/AusnQr5gsz3bSCR4=;
        b=oKhKeKH/VGnUtXqmsnjScs2PRj1YlUxYVUfVEb/BENC/WOn9uZ44pIR2ZjIuVWLJyE
         Wx0gBYWyPUGYNOq+dgE+OZxLNRI0w/4kZbVIsB0hjSNs+vVuH1CpEaKAOl9eJ9fA+t/V
         PVy1AkJcXl1VJisv90v5SX7gFSdi91Ta7XwihxObBg1f+fONHVSX598XpK0gB1bkDvSL
         X7GlXUxYpCiEStMrgX/aP7IKX8ff2hBRGlwSPAF2tJ4ufiFGDORDszEYKlOtmZhouC+v
         loGOfXVi8isY3dVsI43Ch5t0SUG5mxQ1EpqvaC1hWO589CfsggV6Enj5qyHDFPeDy0rg
         91kQ==
X-Gm-Message-State: APuU4Z9MZbJdOlVwFT2QTF5MaQrvBxJj/dtoj7coedQcoC6FYdxWAvRC
	P54HqY3WmcYBVqYD3IBH41dJ38Pl/H9wWI6hHRm+67C+Xo1DeQzoMi3vJtJHe6lo4lhQ7O3BngF
	srnIJiFZii964h52kcG8oHxkfPO4EUW0=
X-Gm-Gg: AYBFou3y5uzUCxccXRDJZpLmszjpPPbT3Z8xAJSRXCmVenIhvqbejTiWKu4m73x3x9R
	K8mlLZOvY/nb6KSJeqKSF9a+KxNV67RQtByFlanjobqwN1d8bciAf6mY8F4TK0i+/ZxbcA+BL1o
	HVsMSkHK5Nt9tNiMdmhoaLnKeXE3IQo5PiaMmVahT6AeLnYZU/e1/eXEhgXQg4F9+BjbV3hkNst
	vUOVxh0xgGL4fQI8mMSg3j1lMevZl3pBlSt0DWmRTwjpslJGe4QxPpHlPYPYrVDKEo1bEBRWiSN
	Z8b2WG5HFh2JYmJuELie7LTSnkEXjXmIegpe1Hk/SLq0XzQr3/F3ROCUPdk7hFQwFLPtgw5uNsi
	hq5gkfBKg5ggdjsvOyb8BEank0jtgU1/sT/sEnEfL5H8BDU9ga5huh6iJkSYYiqNxJQzX37o=
X-Received: by 2002:a05:690e:14c1:b0:67c:c1d:e5f9 with SMTP id
 956f58d0204a3-67c67a46423mr3328468d50.0.1794489632349; Thu, 12 Nov 2026
 05:20:32 -0800 (PST)
MIME-Version: 1.0
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com>
 <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com>
 <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com> <CANNYZj-32deiRNk9ZwzvTTFZuj7evLyPB3d_+33eDM+YSzr0og@mail.gmail.com>
 <18E7449543C100DC.893556@lists.openembedded.org> <8ABE57A1-35A3-4E3E-85FB-1CD7E3D27EE6@geanix.com>
 <CANNYZj--_8eu7tQsuwhdNNEZQ+wSh05AGKHgWnX71-wGZ-SKPw@mail.gmail.com> <4D0A9B16-8E0E-46E8-9EAE-73324C6D632D@geanix.com>
In-Reply-To: <4D0A9B16-8E0E-46E8-9EAE-73324C6D632D@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2026 14:20:20 +0100
X-Gm-Features: AclHuK_Kj6Q2-WgD4-AwPCxDSLZBPalvJf4K5Ckq1VH4b1d5xqswM8-jK4fKq2Y
Message-ID: <CANNYZj-CO6Vkuy9xw8sH2HxodF_c4R18X-kta1rO=MCtUzJQCA@mail.gmail.com>
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000016e60c0660142de5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 13:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250094

--00000000000016e60c0660142de5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Nov 2026 at 13:49, Sean Nyekjaer <sean@geanix.com> wrote:

> > Due to that change, the license check should probably be then fixed to
> only run for the target rootfs, and not SDK sysroots. Can you reproduce
> this on plain oe-core/poky master?
> >
>
> Yes, I=E2=80=99m able to reproduce this on oe-core master.
>

A fix would be very appreciated then :) Note that there are tests
in meta/lib/oeqa/selftest/cases/incompatible_lic.py which probably could be
extended to cover SDKs.

Alex

--00000000000016e60c0660142de5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 12 Nov 2026 at 13:49, Sean Nyekja=
er &lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wrote:</d=
iv><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; Due to that change, the license check should probably be then fixed to=
 only run for the target rootfs, and not SDK sysroots. Can you reproduce th=
is on plain oe-core/poky master?<br>
&gt; <br>
<br>
Yes, I=E2=80=99m able to reproduce this on oe-core master.<br></blockquote>=
<br></div><div class=3D"gmail_quote gmail_quote_container">A fix would be v=
ery appreciated then :) Note that there are tests in=C2=A0meta/lib/oeqa/sel=
ftest/cases/incompatible_lic.py which probably could be extended to cover S=
DKs.</div><div class=3D"gmail_quote gmail_quote_container"><br></div><div c=
lass=3D"gmail_quote gmail_quote_container">Alex</div></div>

--00000000000016e60c0660142de5--
