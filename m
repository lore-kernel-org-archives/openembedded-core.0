Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.11806.1612988459733010705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LRaEcu6A;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id j19so4751123lfr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 12:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NzWjcqHUbQc0MVT2XIyctG2J5aQQikkmkvBlUgeUlF8=;
        b=LRaEcu6AmWYqpoQjz/Bk4cF4LE5iM6VtsFjVnBWSCcVkkgY2o9IkNJx34nE8mFAYJO
         RpT+Oo8uZXuOakIsGdc6VbrjspnL/CyokCOqar0/msvd7GMLcl5QW8Jy9R8vKZAcKzhi
         /P5RI0Vm4pixZT0a6dgxakqCMfWxzLWE16SudjXOzTh0RsRU99FpUpnFHLt0MsZP26mm
         Bu46SQQOZznA8Zok7sreAeCJg5hA1Mr8AHCrqXrAAz4Y94ibav8+XvBVC/u5wowMxs2W
         6W+hAeZas3JnIVvzsCsrZmgJ2HdwIxcIfI/U2RTbtjMFN62eMcwaljt4WcCSuFIPzLhw
         9uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NzWjcqHUbQc0MVT2XIyctG2J5aQQikkmkvBlUgeUlF8=;
        b=PJ38O/yZIoQFvYbR9lKuR0j5Zd6p3Vl137ORsGETGCg2IG0s4kUU7cMizzdOeaTAVo
         s1b8qXIFocLJZUHWQuKw5+2z0F2+iCf2mDOYu3SkttvW2VP/rOQtauWU28o79kTb+LgL
         nfHYXaunRUv9bTbPTOSbR+fUKFcfkZzgPgUfyxxx1FbkDpuTENahG71uewTVKGwoKaH2
         ZUSiBNm9eLZ6JVXU1KbVXPmMQo7wjGqnBclpisTmMp9x7DQQPrPhl9H9bx5UqTOAeuw6
         y/a9pnkaa1PFsFLxXTlK216DRw9uQd+ENN3qg2TowlbNNeK4td8I1U8DLbrRfSb+4/sN
         /Usw==
X-Gm-Message-State: AOAM531kI3jfDIYIKiCDR6p0WSEXpIOfsWG1GIuawBJKCwxFe7Eed8gO
	4ejm4LhfRrdElDsKb8g8w1ukIVhlAbBPf3SZjuA=
X-Google-Smtp-Source: ABdhPJxous66UXaHXu5bxECZepNCZlmMvOVqxGRRj7skHrXO7vvgpwQImGBuDuqio197u5OdTjURV5gQzoV+qwcDr9E=
X-Received: by 2002:a05:6512:36d0:: with SMTP id e16mr2466061lfs.45.1612988457699;
 Wed, 10 Feb 2021 12:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20210210111113.17318-1-raymsmithuk@gmail.com> <CAP9ODKqqrhboqgEGa_7MRprs2OZhE8GMRFCS3K77Jt2-4G9KKw@mail.gmail.com>
 <CAHS1ALKpm9+5Fa+roQ8ZJ3m3jGa3m=yymWpG8ftfEkVdAk+RqA@mail.gmail.com>
In-Reply-To: <CAHS1ALKpm9+5Fa+roQ8ZJ3m3jGa3m=yymWpG8ftfEkVdAk+RqA@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 10 Feb 2021 21:20:46 +0100
Message-ID: <CAHtQpK7rFBrGHUJ2TG-Xke4V-kZc2jJF4hZgO5LtdGef4vNQfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
To: Ray Smith <raymsmithuk@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ray,

On Wed, Feb 10, 2021 at 3:41 PM Ray Smith <raymsmithuk@gmail.com> wrote:
>
> On Wed, Feb 10, 2021 at 1:26 PM Otavio Salvador <otavio.salvador@ossyste=
ms.com.br> wrote:
>>
>>
>> I didn't understand what you mean here. Could you elaborate this?
>>
>
> If you try to build mesa with PACKAGECONFIG "egl gles dri" you get an er=
ror:
> ../mesa-20.3.2/meson.build:144:4: ERROR: Problem encountered: building O=
penGL ES without OpenGL is not supported.
>
> This means that in practice you can't get a GLES-only build of mesa, so =
mesa always provides OpenGL (ignoring Vulkan). But for an abstract graphics=
 driver that's not true - many drivers provide GLES but not OpenGL. I'd arg=
ue that this is an implementation detail (and maybe a minor bug) of mesa. I=
f mesa internally requires code from its OpenGL support to build GLES, it s=
hould silently include that if it's been configured for GLES-only.
>
> I only mention it to be clear that in general "GLES requires OpenGL" is =
not true, even though mesa's build system enforces that.

Should this be clarified with Mesa folks upfront? If you believe that
this limitation is rather "artificial", then there has to be a proper
explanation from Mesa developers why OGL is provided when OGLES-only
is built.

>
>=20
>


--=20
Regards,
Andrey.
