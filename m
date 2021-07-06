Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.5289.1625574630482184031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 05:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YHD0ORWv;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id y2so6185416pff.11
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 05:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8rmNSxa6O7D84CpTqja7aSxlaVrWwlEPZekff/TfudY=;
        b=YHD0ORWvhOIAEa27J31A2NezqpI/jBvdveetIKofg+69MRogC3KSDrqsmls9Ajdc1V
         VT2D2uFJFMP/EVkcs9YD2aQ38XMdatf6wUz7v1h+X7GP0aFDgyATnEMV3aVPxZJhKAwx
         vRe2KHsW76NPiXR3ASuA41kZFLJw0zmbgcJyxkPUKx1PUWQ6HQm82omrKPysHoFpJo+T
         Ok8/5oiQSQKqu9uhkkR8YBOxOZKi+Dvt2V8OKKRxMBcWhtccdAy2BR3TjiHtVrnf+5Qu
         C+Xkq+1WHgRYi2jfwTDz6MldEuGiXD8mr3I/JsiO9AScLuB9sF5ALFrvsN5Q75Xrb7V3
         H4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8rmNSxa6O7D84CpTqja7aSxlaVrWwlEPZekff/TfudY=;
        b=lOQoHvdHQWiMv33L4EgFVVhH4qnQJycq5xUeP+jF+fwYeEXHRR8lvbKi5xRCjiVlmt
         0nMkLnsyW2sIwZi0/27IuEF+CzY139vBiFLKCFwG/9m8LuzdWahNAu12Hh2htKvS6g9b
         OSwAizyGuejlpvbXSrZ0UKiRQaO1VkC097HlU0S6N3qeiRZjbyco4rF+LaLO5zggZAVR
         MNtSSfBFAl6nZ//h8HTbfJrvcpPWKHToS48PFZNMiyaykqEO3J646EKN1mfmgSbJKVei
         LAKyV+dLPkA4KYGY/5siP2WHpVNy2kBPr42pSinJot1i//biTLN/Foh+ayxU+AK2QUzQ
         voWQ==
X-Gm-Message-State: AOAM531tEvRV+cTqkmiS8zgm7sLvXvbVphC0/CgweTtt8ewtNkI2o3mC
	zgvaotPSL7jIckNF0YvGNoiuusTIEaizL6PYbTk=
X-Google-Smtp-Source: ABdhPJwWNBgddLFg0yFBU6lWSzwael3dhiXMM1jLRTmYJAorejKiFYO/Yl3LB5SiP5A/0kxRXNCWVphoPVcfI/nR/S4=
X-Received: by 2002:aa7:9d1a:0:b029:30f:df6a:77aa with SMTP id
 k26-20020aa79d1a0000b029030fdf6a77aamr19567428pfp.35.1625574629949; Tue, 06
 Jul 2021 05:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210627221213.14667-1-changhyeok.bae@gmail.com>
In-Reply-To: <20210627221213.14667-1-changhyeok.bae@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 6 Jul 2021 14:30:17 +0200
Message-ID: <CALbNGRQn6Nso7s4SstWG4DbocfM7EWWwZ64ZKO6tS8HTUTJsag@mail.gmail.com>
Subject: Re: [OE-core][PATCH] iputils: Update to 20210202
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 12:09 AM Changhyeok Bae
<changhyeok.bae@gmail.com> wrote:
>
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../iputils/{iputils_s20200821.bb => iputils_20210202.bb}       | 2 +-
By this version went backwards. What is preferred Bump PE or re-add 's'?

Andreas
