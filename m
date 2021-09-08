Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9462.1631095694736996417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 03:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=RJU6tcIE;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id b6so2383679wrh.10
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G4IZFrzQnDaW/z7CHLZzUcxnWDK3UfRvvsg2hHTxmf4=;
        b=RJU6tcIExhCCNxvoMiVTKlCU1ELUga7pXaUCjqtLPExVYUmkKac9NhtXJys26bdk/2
         p7kUycMh99zn5KqrNVSYE5EuNR6MGV81G2sWiYuePEkkxTGSUjdg5CRV7B69u3HYFMTa
         QV2cscqkgNVfWGjGjlfTzVGy5qQJBSo9qcGlFnsF/sCgMLuarhQaAECf8gYkU/bOaD6s
         hgUm+MKddIvXCDp2VyHfjm9jrDiiUdvr9z1S5yzGyyCdc1qg6lKdkqfLa61cqkOFAd/6
         o9G5XsM/CIHAq2Xtnb951oIVb7yP/nT6YVW3t5xhw3+f9AqWGYrRGNYwHtRt0eZy0zXa
         rMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G4IZFrzQnDaW/z7CHLZzUcxnWDK3UfRvvsg2hHTxmf4=;
        b=0l7PSnw70BGY6VCPKfeRdghbjt3spArdPgxIP5rVOMHWVesr5b0YdEzaTX7IIHSHS3
         2YdnMTlpsKGr9TZNnfgsFaY9oWFePyHfxY+9tB9TASc3zC7i7qRHYCv4msfnCrXrRGen
         xrT9RRwReyB98i+QZ6KuCmmApvAui/xOmfoP2ZA0w4QaKprfSUCZw3N0kne8sUcfL34p
         vCpEGzbk30mbIST3SuBbUi8OnM/akakV+yTrs8aA5OVn3g3mTDErtCR9jsndl3XLeCAm
         MeVUDWObBunLfGuSb2T1Vdk7zOcxcFU2jMVTHD7BJoYVaOJIkUgaPnH78uxT5Oy69cWx
         WS0w==
X-Gm-Message-State: AOAM530/uNLChylLY4GZJEQaM+3Do/N9YJaC5/JJrIjTpPuOIiDbJk4H
	/g8sY16r9eWEyuEfiAJERrfbH2dG8A3OkdnKsXCdaw==
X-Google-Smtp-Source: ABdhPJylsPFrCOm9hzQIFsC0Q54NE3KkG9S/1GX4pxCL0bhgEvxbuu6QYw6j+FN+c8ul/u4N6LegsTK2GYe0dnF+N4g=
X-Received: by 2002:adf:cd92:: with SMTP id q18mr3067081wrj.211.1631095692860;
 Wed, 08 Sep 2021 03:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <ed036834262a67e88a58001d20c719bed37d50f5.1631006167.git.liezhi.yang@windriver.com>
 <945b8038-97c7-1264-594f-e3b424695c22@windriver.com> <CANNYZj_6j9W0KKuR68KjRk+=MTQx_EOcuWnH3Zt1aKZHJZzvHA@mail.gmail.com>
In-Reply-To: <CANNYZj_6j9W0KKuR68KjRk+=MTQx_EOcuWnH3Zt1aKZHJZzvHA@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 8 Sep 2021 11:08:02 +0100
Message-ID: <CAAnfSTu2fs=tG7NEW6w5PxLXsczTB5g3cm9_Y5jPgugA+-mc=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] assimp: Remove it
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Robert Yang <liezhi.yang@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Sept 2021 at 13:50, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> I'm not sure why layerindex says otherewise, but neither vulkan nor anything in meta-qt5 actually depend on assimp.
> qt5/6 has an option, off by default, to use external assimp, vulkan has no dependency at all.
>
> This leaves basically meta-ros, so carrying assimp for the benefit of a single layer is dubious at best.

I thought Vulkan needed assimp so dug into the history.  vulkan-demos
used to need it, but that was replaced with vulkan-samples which does
not.

So, I say we drop assimp from core and move it to meta-oe.

Ross
