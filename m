Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.10646.1624884312491464970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 05:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dmy6iPvW;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id v20so11192936eji.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6SZ/6rLsf1NutvLEdJj6PToCB6XQXSOaSmQUq9k744=;
        b=Dmy6iPvWgirv4qVeM0MX5xLpn7J4Byy+mIwQQpuh9hmseIe/mO0JVnume45syzkzT1
         Y9M5rZAKN3TiIy3yzJ1puySLvt3pr2Tqd/NRT+pbOVJjrEOmhRBvZG/NpmShbvFe1lld
         WGnm4SydeZjW8t21CGW2pHhcRkR85GKch5mhc0DM/cuLt8QDQuIZB4H5UnnKTw5Cvu6T
         lC8ZzYaDUKuLZJlq0mqq62rTf6nB48WgDmA0d9XaHaiMDglVn1viWkbg/zgBqcxYIUqq
         /dUqb2HxQZ2qGjzUy55yMTMoIZ9nVC5h1hMzyoB67CVzw8EGbU9qVcn3Frlki/oR7tKx
         Aqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6SZ/6rLsf1NutvLEdJj6PToCB6XQXSOaSmQUq9k744=;
        b=pcFCGWp7b14ylY7YR2s5zzqNs7UROIyfm8FTRrQCvj252s6Y8GJ16NNdcLxJMGymfL
         vqWJiSelxmESIZvRCjvyH9q22gr99KhFeQpxkfjHm1+t5Yh2YDc+BBhTfEXdD40AjfpZ
         lSY6LDkaX3VOHEV517/GBLWUfZ3v6/WdjKMgAaqLFdmhTStZDwqWSIi2qwV3FUPnntpq
         oOmiArwSafAQj6Fqnmq2CwoA8s5e5aWBHnYmtH8vARivobZyMld7lO+XI4HiT84Tph3F
         HOXc+sqWfGByZoV7DNnuXh5ajceVKAyC8LfskZJGHbFJu8Kz3Ai09q2gNHjlRUDFpOFE
         QFPg==
X-Gm-Message-State: AOAM533e7cW8PwauIdAMmp0Qqkmvnl4lUmkWssrZEJtqntSd0etCs+FV
	GeKMwMpOmt628r13Gpm6vPX8jQ9VzqzQ9YmjU4E=
X-Google-Smtp-Source: ABdhPJwwgkNQTFyYZOwDYBW890/DKmwyZm6TZlcbr8C/4vVYfMiA6GCruEixk7gaetebZCVhr7NL/0hbtA8qNpyz3l0=
X-Received: by 2002:a17:907:2d07:: with SMTP id gs7mr23903976ejc.375.1624884310408;
 Mon, 28 Jun 2021 05:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <CANNYZj_yZHkpbGKPaec_x4AQDQ8jR_rLk1mroBZxn6JCpQ9WbQ@mail.gmail.com>
 <CAAQYJAspv72aL7J_fYri+vk_OfL=PDNCvGk9C6O=CisB3dEPeg@mail.gmail.com> <CANNYZj-XL7NB0S=3bTv9DMvhbMTmUfJFK627YAqQ4for3QMDqA@mail.gmail.com>
In-Reply-To: <CANNYZj-XL7NB0S=3bTv9DMvhbMTmUfJFK627YAqQ4for3QMDqA@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Mon, 28 Jun 2021 14:44:59 +0200
Message-ID: <CAAQYJAvGNSy2CAD6Dwk2-LYz-KGUp-pFjXtOLKD_1iD4SOaghQ@mail.gmail.com>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 2:36 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> What I am saying is, can you discuss this with upstream first please?

Sorry, no, I'm not in the position to do that.
Besides, I am dispatching my armv4/armv5te Zaurus hardware so I will
not be able to test anymore.

My point here is, for this pulseaudio 14.x release (in Honister) we
could do an effort and patch the damn file.
I write this because this is the only failing recipe for
core-image-sato for armv4 and this arch is still supported in oe-core
(thank you so much Khem).

So I'd say as long as armv4 and armv5t are supported we need to patch
the recipe.

With next pulseaudio 15.x the older arm will maybe lose support, I
don't know now.

My 2 cents
A.A.



>
> Alex
>
> On Mon, 28 Jun 2021 at 14:08, Andrea Adami <andrea.adami@gmail.com> wrote:
>>
>> On Mon, Jun 28, 2021 at 1:00 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Seems like an upstream problem rather than a Yocto one?
>>
>> Indeed,
>>
>> from
>> https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/14.0/
>> "
>> One difference from Autotools is that the --disable-neon-opt option
>> for disabling NEON optimizations doesn't have a counterpart in Meson
>> due to how Meson's NEON detection works. NEON will always be enabled
>> if the compiler supports it, but even if the target machine doesn't
>> support NEON, that shouldn't be a problem, because PulseAudio disables
>> NEON at run-time if the processor doesn't support it.
>> "
>> Upstream *thinks* this is not an issue because all will be fine at runtime :)
>>
>> Cheers
>> A.A:
>>
>> >
>> > Alex
>> >
>> > On Mon, 28 Jun 2021 at 12:02, Andrea Adami <andrea.adami@gmail.com> wrote:
>> >>
>> >> Hello,
>> >>
>> >> during a core-image-sato build for armv4 I got one single build
>> >> failure with pulseaudio.
>> >>
>> >> This happens after commit 80bbea0 pulseaudio: switch build system from
>> >> Autotools to Meson. In the commit text it is evidenced:
>> >>
>> >> "
>> >> With Meson there's no option for disabling Neon optimizations if the
>> >> compiler supports Neon. If -mfpu is set in CC or CFLAGS, it's ignored,
>> >> because the build system adds -mfpu=neon at the end of the compiler
>> >> command line, overriding any earlier -mfpu options. This shouldn't be
>> >> a problem, because PulseAudio detects at runtime whether the CPU
>> >> supports Neon instructions.
>> >> "
>> >>
>> >> At the moment to build pulseaudio for armv4/5 I have reverted to using
>> >> autotools.
>> >>
>> >>
>> >> There was around a patch but has not been merged.
>> >> https://lists.openembedded.org/g/openembedded-core/message/146375
>> >>
>> >> Maybe a v2 will be accepted?
>> >>
>> >> Cheers
>> >> A.A.
>> >>
>> >> 
>> >>
