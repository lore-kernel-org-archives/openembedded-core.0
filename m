Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.35.1602544953242494803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 16:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mw7LZPMz;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id k25so19624493ioh.7
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 16:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yZjHGNV4zMcC1chUpjrmY5LNbDSQ1oz8d37RtKMmfjA=;
        b=Mw7LZPMzYn3pMHcHaeG/MPhI3QTsPZn+BklcZeoXpd5vCnUoEeWj9+cosY0Uhu4fbi
         JBXVYzCfiOeAhg2APmiYA3HTw1ZWdRqwqmgyGWr5pWRiUNfvlHFS+v8XLxd7wTxolXmb
         3pCChcPuf9vNZljYFnGGSIZbDfOfroDQTAIU7uKpQNCdbhoRPCfuaboeCqwvjXx1KULc
         VftjNXr070mfkgWiqZwgtWY6KYMAjXvhPhoFqMOZYLeODW+ZTLrBmnCOodqWqcRtjSHD
         0BVOJGYcTfw82/ENLMSuQkJmpz2l6C413Ha9+yX85YO64KYCSqKqRQwINNvqKsNUBeQJ
         tzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yZjHGNV4zMcC1chUpjrmY5LNbDSQ1oz8d37RtKMmfjA=;
        b=IA8Pg4Fv3Hs8M3jx/Y4wR+XbQnxNMliZP391n3ArcJ/CJAyH2q+NsEisAp+vXrI6kS
         3c3sLXrVjoqNIgRxMFD9yb+6vsuN/0RcWb0cLqNM8/8ISkKC1q0d4ktniHVvvKd+jXwK
         odKJ1LhQDUO1Tbe1p2ovd/VV88+tr9SM4cTlKd047ucAoRoOwNAUNRkF3u6ajiInK0qq
         e4lW/ZEF2qJxjUplDy8EJ0i112vSDSRQMQBhfDCCyZlHUAK1FF90FeUARty7BKq/1h2D
         LO+hpo+PIQbvAkqWFiF3Hn60SgU2XVY0x38MKz72LT+7Lr186WjrZeFFs6Sghvep28fB
         3jnw==
X-Gm-Message-State: AOAM531ct2cK05BDGCWNXVkhfAH4ctEnU70KEQOhB4POWwOTWjqNL6fc
	xitR6PRvGLLP0LmQbucPiaQVYMVenXOFHejK4M4=
X-Google-Smtp-Source: ABdhPJwMzSyIBimsvbI4NUOHER5Gl48bnZtuVpOs/DiIbt68w7FkFJK9X/az4gj82livBkd5vVn81ug6y3auAaTfKkA=
X-Received: by 2002:a02:c956:: with SMTP id u22mr10686240jao.135.1602544952474;
 Mon, 12 Oct 2020 16:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201011234937.1041597-1-alistair@alistair23.me> <CANNYZj82hb4PyrQYd_SWQVkbEvitomqBmkiOpecvM4o=rTyQ7w@mail.gmail.com>
In-Reply-To: <CANNYZj82hb4PyrQYd_SWQVkbEvitomqBmkiOpecvM4o=rTyQ7w@mail.gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Mon, 12 Oct 2020 16:10:57 -0700
Message-ID: <CAKmqyKMO_dwh=q5+0kdAPR2a0QhkYSSopvsWbSD-eQMPXybsFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wayland: Set idle-time to zero
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alistair <alistair@alistair23.me>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 12, 2020 at 2:28 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Why?

It's really annoying when you are working on something and the screen turns off.

Alistair

>
> Alex
>
> On Mon, 12 Oct 2020 at 01:49, Alistair <alistair@alistair23.me> wrote:
>>
>> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>> ---
>>  meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
>> index b48726d59c..d1532236af 100644
>> --- a/meta/recipes-graphics/wayland/weston-init/weston.ini
>> +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
>> @@ -5,6 +5,7 @@
>>  #shell=desktop-shell.so
>>  #gbm-format=xrgb2101010
>>  require-input=false
>> +idle-time=0
>>
>>  #[shell]
>>  #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
>> --
>> 2.28.0
>>
>>
>> 
>>
