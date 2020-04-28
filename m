Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web12.2742.1588102109574235346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 12:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nSAcBzmx;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id a7so14728691uak.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 12:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dUhGBZlTBbLb4pMhzagZk9j6BGmxhce+ocMqRnFO4fI=;
        b=nSAcBzmxLZVu30fl0G/dlHGtzcKO9fGpBXKIPpFmEAc4VN36q2oMREglfrnndWL+1e
         Z+lPJ3CSjZn+q86GIh/nk6EUyYffbov49AgzCEOCqJSDouj8xXIFoXxX+liwkVE1sufD
         N0djoZej0X9qtZusZoORdfe0jhNR5LhWhR0T2snyvKlS+zLdUoVYM9hkFQK/HBvvk80c
         vBiSl0QxGywS93dNdFWELrjFr6guf7CE/iHC8D0xpBO9c9qpXVnq89S51FwrZ63JaI9T
         ga0V+S6qrVpE/cf8B6JRTsHUvvtDi5p/ioBSyysXrtERmx9S3tFhJ0sy3Hi0+bxtLPTN
         Fkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dUhGBZlTBbLb4pMhzagZk9j6BGmxhce+ocMqRnFO4fI=;
        b=JaXJYUGYBBoON8M463lrkfXe79A2hfs5WEa0RGNChc+pmPyvAVj+BXA6EpIHypicdR
         oz46Zx1duDtZjwvvB3TAvxwILhj2zZJQfDDRFMGcOStLMi/luaIMAze4rnjgtQvd8OT6
         CjDk9Z0xJ3sSvWsyJd/FESwMLX8aCf7ELxnsYBJ6e/VuTVVMh5P7qSGyuqp228wcUtBi
         Cdx8BdrDmz3op/9KoxwV/vTu4WvqYnj6kZsA13/njAB3f6ipr0UzVAY/CeCVBMRe5ak9
         EHV9E84m7Kr6D722knVdKentndbUfNJpMjFO9quUKfCjFRmR5azrqWwwV17u5kupK8bU
         FWqw==
X-Gm-Message-State: AGi0PuaRapSu5SA8WTgaffx9xGiH6McbaJNHzy3zbVRf8WiOBQtlK4RR
	COE1+v+bY9OydZca9g7Eo5wXcd5zgWKThD2DLJY=
X-Google-Smtp-Source: APiQypJCqg7XSyN6/s0oFpEwKEbWss8Et4gPbxKLy9qbD1sIbKy6BcMoKFbKFxzQh9G9mDvSLtCgEuDYoiKhp2Pkj+Y=
X-Received: by 2002:a67:8b46:: with SMTP id n67mr22172296vsd.35.1588102108674;
 Tue, 28 Apr 2020 12:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587841042.git.alex.kanavin@gmail.com> <05d961392eb30920f441731f662ba0dd6a6bd5db.1587841042.git.alex.kanavin@gmail.com>
 <CAMKF1sopu5jZ_obZ7Qkt6vzCvaHyvbnSKEdLioTzmo87D7bZYw@mail.gmail.com> <CANNYZj-5dGKXV45-SfbxopMUy51URsujoyNzQkK_kSyMKD14cA@mail.gmail.com>
In-Reply-To: <CANNYZj-5dGKXV45-SfbxopMUy51URsujoyNzQkK_kSyMKD14cA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 28 Apr 2020 21:28:17 +0200
Message-ID: <CANNYZj8c3Q8EGCTLhSKvQhjbKBFGJnZDEc54vXWAScp79Lgqbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000dfda105a45ed689"

--0000000000000dfda105a45ed689
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Apr 2020 at 10:52, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Good point. I will rework the patches to use 'virgl' DISTRO_FEATURE
> instead. Making it machine specific isn't feasible, because the recipes
> affected are all native ones.
>

Actually, on second thought, a separate DISTRO_FEATURE is not needed. What
I'm going to do is uncouple the native 'opengl' DISTRO_FEATURE from the
target one, so that either can be set independently of the other.

Alex

--0000000000000dfda105a45ed689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 28 Apr 2020 at 10:52, Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr">Good point. I will rework the p=
atches to use &#39;virgl&#39; DISTRO_FEATURE instead. Making it machine spe=
cific isn&#39;t feasible, because the recipes affected are all native ones.=
</div></blockquote><div><br></div><div>Actually, on second thought, a separ=
ate DISTRO_FEATURE is not needed. What I&#39;m going to do is uncouple the =
native &#39;opengl&#39; DISTRO_FEATURE from the target one, so that either =
can be set independently of the other.<br></div><div><br></div><div>Alex<br=
></div></div></div>

--0000000000000dfda105a45ed689--
