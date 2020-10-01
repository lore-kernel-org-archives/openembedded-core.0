Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.5071.1601526849750765589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 21:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o90ctbMB;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id cr8so2249772qvb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 21:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZWExO9KTGyoHp/eA60Dw2gdLLBHzDnuPa5pWAynMQuY=;
        b=o90ctbMBsv8eNZ892nVh2W8Gha7yER1Y3BZqwli6Hv69B1oPDLtcREVnW5bdxQ3FxA
         BVHindHOKdlI9nTnmaYtn1XyS5thIqRuHjppIPxGO5Pmhf7fKRTFdzsJChuk7cFf1Nuq
         a/DiPG5zS1c22tVb729DJF9WfVWsiZLoXCeTNx3VvHLkofafzNy21jXCMMLS63Cd9vZU
         vaDxcg/4vf+J50c43RnmxQtno1fvubB+CNvjJbnsaUTXS274zXwNQc84/bVKsiuch7Rp
         UoEMaTRvzERZ1LkzHmHoHuzWH+JKkycVPC6nrRW/cpmgEy49Uh73m2QM+dNwAjogzCmT
         sOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZWExO9KTGyoHp/eA60Dw2gdLLBHzDnuPa5pWAynMQuY=;
        b=qbCN0IO8xkTqbfHMd60AefhES6v/5GqpxyhFF9nCz1BDdljA/U30MzRjEHw9DOOlzl
         J6nkRvghJIEZITrlW92BGy1ikkro752ZTU8f33pXyGKjHyvv7j0N81Qo6iPirw+y0wUN
         Yxb4E0r1HF9hL2b+We8SR4FRU0DOAA4p0tkdWT7/SRmu8WjQb31WTgK48xb75O1a3yNA
         B3PPidEaRnKDs8uDvph6cwSvGGPsn4Q0ZtzNHwv62visMbQXTcYyXkzbHJFLwjmQV9vi
         QUlcG2GkMjiwTy0yhil6aM3QS3wBI/bjdljvur3ILlktZ3zxa5vQ9VULTtq/pPn5BZ7/
         bGEg==
X-Gm-Message-State: AOAM530Uf3GrCoJxhibnCFFmfkZ6BYzVP6lcMJKrMGnEYv/Ghh7Z4DrC
	86hDZ0jQeoVj0ChhdkjHh7bUz3ucMAZPDpfRC/0=
X-Google-Smtp-Source: ABdhPJxi37o69bbqewIh/k0bc3BEQ4k/MHZsXtJTtvzLdOLfmqwhSrMho3TGQBXYoYEbNa6nnScwaYT9MMjjT9SquCI=
X-Received: by 2002:a05:6214:7a1:: with SMTP id v1mr5957074qvz.19.1601526848779;
 Wed, 30 Sep 2020 21:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200930150545.3882859-1-ayaka@soulik.info> <CANNYZj85ymSHGvm5E7Axtrs6B6-V4nQGCFzcCVJKCM0=wsPtkg@mail.gmail.com>
In-Reply-To: <CANNYZj85ymSHGvm5E7Axtrs6B6-V4nQGCFzcCVJKCM0=wsPtkg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 30 Sep 2020 21:33:42 -0700
Message-ID: <CAMKF1sqxqb=Np9VN-oy1B6WE=SW0hsPVA19q+yd45GYhtbtLqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: add sysroot property
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ayaka <ayaka@soulik.info>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 30, 2020 at 9:40 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Wait, how does it work in native meson then?
>

native technical is not cross compiled but nativesdk is in a way same
as building a target package.

> Alex
>
> On Wed 30. Sep 2020 at 17.06, ayaka <ayaka@soulik.info> wrote:
>>
>> I know the environment setup script would set PKG_CONFIG_PATH,
>>
>> but the meson won't take that env when translate the includedir
>>
>> property from the pkg-config.
>>
>>
>>
>> Signed-off-by: ayaka <ayaka@soulik.info>
>>
>> ---
>>
>>  meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb | 1 +
>>
>>  1 file changed, 1 insertion(+)
>>
>>
>>
>> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>>
>> index 67add2c25e..7fdc4c86d9 100644
>>
>> --- a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>>
>> +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>>
>> @@ -40,6 +40,7 @@ c_args = @CFLAGS
>>
>>  c_link_args = @LDFLAGS
>>
>>  cpp_args = @CPPFLAGS
>>
>>  cpp_link_args = @LDFLAGS
>>
>> +sys_root = @OECORE_TARGET_SYSROOT
>>
>>
>>
>>  [host_machine]
>>
>>  system = '${SDK_OS}'
>>
>> --
>>
>> 2.25.4
>>
>>
>>
>
> 
>
