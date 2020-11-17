Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web08.11925.1605636567544723489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 10:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=byQH8SWH;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id b16so16174883qtb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 10:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIJFbhbsIwWnjLPU4DYs64vvxcwvlApkv2/THJW0uRE=;
        b=byQH8SWHIhOZbokyVN1p3Ln+hrLp3pRpr3aiAnU/nVvs6AilEg251K0rwxH1c+dWvm
         1KGgBcnv1RC8azVcolRwK3n4B5Zz+HmCexoMvrY4TOmbed+IT0hEUgKUV+EX+/U4Jg3f
         Zeeh3CzTbEfy57Rfr8xyeTjKwXwz7XVkretw/YrPSHeslLuQ+9ZBKx3JZ/YN8V3y2qUY
         /31C2wDfSORlMwMA91rEiPgu6mUQO5XL/PdK1lhNm8fN8GTcyxT5iMMyCY0us0V0DIsk
         fhF6fTiJFu03G1f1ll1mRbsUUd3tTwBOWAwku3VtIUXp7gATJQK2L8hdJQ0ypefWDGAN
         ww7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIJFbhbsIwWnjLPU4DYs64vvxcwvlApkv2/THJW0uRE=;
        b=C94Rll+kUjfKzbBDdwi0YSURYLck0Glxg2fxSbsRp0meYq+zLCYEvtOxrMSBNRoXVo
         ukNwBSwxWmNMme2Tz6WZG/3aA4qd6rIS2E2E1xdNgffgz9k0y8hCBOs1qvP7gT+WFwc4
         /2/poB6b55spObIeUclmN7nS8VM4TH1SIVJU5yGvJ/lhcgwN7ClODrrheOD1cVt/r+8b
         v3UxXLMAtIqAGt8RNuiBq0itO3p3OIy/W2xOICTBN4m/3SIO5dBBoKZy5yr6bR/wawn8
         VCl7dRWVibuqDmBz7KJJVWldQSpcmtygbf3Zasrs71sf5/ud2nYya6Fowe7aSGk7k9RU
         wxEw==
X-Gm-Message-State: AOAM531SfrtHGVzpfe+QcsFea7llLVdQK4KKzZG9mtfaqKCaL+IKdmjk
	h/lteiaR7ZjlKHGJURJVuCDw1VTYM2HkbA9wChk=
X-Google-Smtp-Source: ABdhPJwtMREdrZlQDbjUvhoj4+Gf5T0a7Te3IvmP6Q5pVpTe7w1jAIKT6upWMQ0OApzdwqqTWWjsLEsMdv1epVT08SY=
X-Received: by 2002:ac8:3805:: with SMTP id q5mr931891qtb.53.1605636565984;
 Tue, 17 Nov 2020 10:09:25 -0800 (PST)
MIME-Version: 1.0
References: <20201117065508.1575532-1-raj.khem@gmail.com> <CANNYZj-mVEE0vD8tpJQTPvA_+0Ny7JNk0co97xU5gs+U=PbUOg@mail.gmail.com>
 <CA+chaQcyh_i92pMt32-iiehDsxr1TyhF5pNKiRQstwPz7UVArQ@mail.gmail.com>
 <CANNYZj-SwsznTXvooSHeVijaUPVPgBBN_gFfKednZCe-OGcdow@mail.gmail.com>
 <CAMKF1sqzEw8sAhzsUvPz6rB1OR=i8Cg7-2WUtpjW8tmS3HGF_Q@mail.gmail.com> <CANNYZj_Eu38-cpsb767mdgqLn6SEXjdfiJKdQheRWuZv47FYAQ@mail.gmail.com>
In-Reply-To: <CANNYZj_Eu38-cpsb767mdgqLn6SEXjdfiJKdQheRWuZv47FYAQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Nov 2020 10:08:59 -0800
Message-ID: <CAMKF1sq77HcFtdxMODMk231BfW0=vqCV+BL4vOTpcKcAMVTBoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 9:33 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 17 Nov 2020 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Nov 17, 2020 at 1:19 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Yes - and if python3-scons-native is the only such recipe we can find, I think it's better to merge the recipe with the target one.
>> >
>> python3-scons-native is just a manifestation of a larger problem which
>> is a regression and this suggestion compounds the problem by setting
>> an unequal rule where non-python packages can
>> have a native-recipe and recipe but python ones can not, therefore we
>> need to fix this properly in core classes instead.
>
>
> If non-python native-only recipes inherit something that DEPENDS on a target item, they will have the exact same problem. This is what needs fixing - but not by special-casing DEPENDS in every class where it happens, or might happen.
>

keep this issue aside and think in a generic way about how recipes can
be written regardless of native or not. behavior has to be consistent

> I'd rather convert all native-only recipes to target ones + BBCLASSEXTEND, so it works the same way everywhere, and minimizes surprises.
>

that's wishful, there are a lot of layers that will have to also
change, and we have to change the semantics of native recipes where
BBCLASSEXTEND is the only way to do them.


> Alex
>
