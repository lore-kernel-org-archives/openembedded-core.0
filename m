Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.3191.1620767014190196824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 14:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=n+ivE6rr;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.46, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f46.google.com with SMTP id v18so825649qvx.10
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 14:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=enEvV7Wu/e43bj6Q1BmYcQFN2nXdZrPNGwMsyEAU2+I=;
        b=n+ivE6rrP2K1byDpD+inLWcGcg6KlHAOiD10a5XESUwUhsTTp1FYC9hHFE2dUgtpzw
         K41M0qMg2Aa2blRjcRn/eJ16sw4eyqyywNxDrMKzT+JcOCCXQESWjY0zZGSMimLR6XxX
         BdV+hRK2CzvXNGYff1peQqPOlC4QvfVmSkFnhjCwn1BJl/9947xANMRE6UOwNCNc96xX
         bxSzZQ68s5XXFhV27vRFFRdEsr/qGwTAf19PB1ZZWhKg2Ek/5aGLyfN80w8egaTtRpA8
         9Okdn3lbA8jupZ1Gl3X69mGY8O6oO6lTRby/vqAhtF0NFFhOdoOMOqgWYOMducGSiakk
         r8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=enEvV7Wu/e43bj6Q1BmYcQFN2nXdZrPNGwMsyEAU2+I=;
        b=tOee8BAaKYneYCxiqUUX+XeRq+AemzM2b74GN00nT5BeH44FbGoOHmtn5FmIuNGQOq
         j/poThCnrtMeWFJB0QJ5k9qoytKA+MVSuOz2tWj7xaB1eLOi1+dOMBg7njyiNIeD1oS6
         5BsZ3idiJI5vw2QgQNXqvXU7ISj3tzyZCrYxX7+PoqYJCFR/UDyb8FXW0wxBlr3zygSg
         CtRQ3a1GQ0PyjvQUFoWy9bHslaQRN16U0N2Vi0pVSeBrhRhWb8B/H4PZ/DAUoQfWAAPJ
         LVBueL79swrmMsNxzguoZmxxAgYxNrMpFI21k9cYja/l52j4ol1TcXDrxtsS67VDN6hV
         9++Q==
X-Gm-Message-State: AOAM530c5qr+OCvrSOCAtmjIzWjYu2khmIyQ07ju7OW88PeGoTFRvYuM
	CeI04zZtAqmxvAfCUOnPPjYi75dsmAtXvFu8
X-Google-Smtp-Source: ABdhPJz7j3ofKPHZdQNd3IoKFwHK87on6ytoMsdj/m/xZvuFi/XfThIb3BWxlfOetxtgm7/g61uXXg==
X-Received: by 2002:a05:6214:2b0:: with SMTP id m16mr31972242qvv.4.1620767013108;
        Tue, 11 May 2021 14:03:33 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id n17sm1703235qke.14.2021.05.11.14.03.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 14:03:32 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f173.google.com with SMTP id c10so5909810qtx.10
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 14:03:32 -0700 (PDT)
X-Received: by 2002:ac8:5748:: with SMTP id 8mr10300780qtx.233.1620767012250;
 Tue, 11 May 2021 14:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAP9ODKqJhiss1VOz8KF-cfQ5Hpq2MvOddMyd7ARvxBo6qkccYA@mail.gmail.com>
In-Reply-To: <CAP9ODKqJhiss1VOz8KF-cfQ5Hpq2MvOddMyd7ARvxBo6qkccYA@mail.gmail.com>
Date: Tue, 11 May 2021 18:03:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrdLBZNoEVMEmtG0xLQByHn1sD_fyLqunVS_VTFBx7XaQ@mail.gmail.com>
Message-ID: <CAP9ODKrdLBZNoEVMEmtG0xLQByHn1sD_fyLqunVS_VTFBx7XaQ@mail.gmail.com>
Subject: Re: OpenEmbedded generated toolchain fail to build latest Linux
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Andrey Zhizhikin <andrey.z@gmail.com>, "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 2 de mai. de 2021 =C3=A0s 21:04, Otavio Salvador
<otavio@ossystems.com.br> escreveu:
> While doing the upgrade of our Linux recipe to 5.12[1] we found that
> we are unable to fully build it using the generated toolchain.
>
> 1. https://github.com/Freescale/meta-freescale/pull/756
>
> We could improve it, adding the nativesdk-gmp and nativesdk-gmp-dev to
> the toolchain however I ended facing another issue:
>
> cc1: error: cannot load plugin
> ./scripts/gcc-plugins/arm_ssp_per_task_plugin.so:
> ./scripts/gcc-plugins/arm_ssp_per_task_plugin.so: undefined symbol:
> _ZN8opt_pass14set_pass_paramEjb
> cc1: error: cannot load plugin
> ./scripts/gcc-plugins/arm_ssp_per_task_plugin.so:
> ./scripts/gcc-plugins/arm_ssp_per_task_plugin.so: undefined symbol:
> _ZN8opt_pass14set_pass_paramEjb
> make[1]: *** [scripts/Makefile.build:271: scripts/mod/empty.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: *** [scripts/Makefile.build:116:
> scripts/mod/devicetable-offsets.s] Error 1
> make: *** [Makefile:1234: prepare0] Error 2
>
> I tried that on an Ubuntu 20.04 and an Arch Linux system and it failed
> on both cases. For now, I ended disabling the GCC_PLUGIN support and
> moved on but it does not seem to be a good long term solution.

Anyone found it? On OE-Core environment it works but fails on the SDK/Toolc=
hain.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
