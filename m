Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.4934.1602653247530647475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 22:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dhoMz2rl;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id y16so3751327ila.7
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 22:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CXe6i+dCZlIbxQo9sXJLQ6tF956D0UAhMfq6vurwDi8=;
        b=dhoMz2rlGBqFqbhRxih0WntPBCYdkwqfF7r6ospb2M/YFdnmGquDtzniIdJI1CLsSj
         2jweRpCPhaNWpebHcAVXFv/58CvAkNcbSzt4Qacp19sdSYtyocNXoIQniGMfPwjkgSAc
         VC98NpXyciWBii/AWzEJLGnjw1zF7xyThyDFiYFrgm5UfdyJiCoOmKA7KcfzgOavTjGy
         LyNucrx7WP8fXyQw8BoaLJursMIdGroY5U71ahUc5Gq9CqhDHxVPmRCMvZrwXS/p/cRW
         /iy4LcIqL1OhnkjcIEK0mGV51tpCZtF3IahPOwQ4NPnJu7N0Le46qKuHPRz/uVIRwvKs
         vnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CXe6i+dCZlIbxQo9sXJLQ6tF956D0UAhMfq6vurwDi8=;
        b=lsLOuBoAKI1kSCnBbE4nV9HJOH14YKgiEuUrn5Twjvh6f7WWbdcPikh3C1LxGcc15x
         Lo09wYeCz/ka2CKqd7qdRiFc7/5BogBJaiNNgaRXZAeWmCysalsCBIKPT3R9+xC/rglL
         3pDmTNvXNDaF0fMtZxTforY/Xgnp/cYDifN+nbGxviwNgaHeAmNxQwq/fHCjRs8lSAqX
         Ovx1/PjUBHWnluyxhXrRPBTOVV52Wr0NxvuqSxK/whLQOY3vtBL1YErNP3olsz9gx9g3
         6JiRKUBuTcotr7LgpR9UCxKaMAE8gBhKEs6N8n/oqb/w/ah0HeWViEX1diE0v/ib9lNY
         YT3g==
X-Gm-Message-State: AOAM530eE1Ec0tr74W0O9W+oY7WRyIyrTVAFXpV6NvzmRiWQE0O3loeW
	0JaGwazIecpUGVxHd+vQaOIHw86YKZhxSA3OLDI=
X-Google-Smtp-Source: ABdhPJwdDBvr+u5afNgKlOn9FRHgkkfNJ/EgQ1tFUMe6viCWwK7Knq1L7YWw4KX6EyNkIR0PP2EpAfKYo3XaN0qL+LA=
X-Received: by 2002:a92:bb58:: with SMTP id w85mr2737111ili.40.1602653246877;
 Tue, 13 Oct 2020 22:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201011234937.1041597-1-alistair@alistair23.me>
 <CANNYZj82hb4PyrQYd_SWQVkbEvitomqBmkiOpecvM4o=rTyQ7w@mail.gmail.com>
 <CAKmqyKMO_dwh=q5+0kdAPR2a0QhkYSSopvsWbSD-eQMPXybsFw@mail.gmail.com>
 <CANNYZj-zkwn1DrhXZJYZ6-=7AL7U5BLxYpn=dj=BUrJ12Ap97Q@mail.gmail.com> <CAMKF1soucN5ivo2QVOk9UT8LF=ferEeUEeX77_bDgTmo3gwzKg@mail.gmail.com>
In-Reply-To: <CAMKF1soucN5ivo2QVOk9UT8LF=ferEeUEeX77_bDgTmo3gwzKg@mail.gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Tue, 13 Oct 2020 22:15:49 -0700
Message-ID: <CAKmqyKNnB=TPTcGUGOU8tdekCJACkVH_Gj0pYMyFQs8rUGwaSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wayland: Set idle-time to zero
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alistair <alistair@alistair23.me>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 12:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
> These is no one answer some use cases it is perhaps to keep it always on eg kiosk kind of devices and for some it may not be eg video player etc

Exactly!

Also OE has a few defaults that help debugging. I was thinking along
the lines of that.

>
> A nicer solution would be turn it into a knob with default perhaps to keep it default but an easy way to override it when needed perhaps via packageconfig

Agreed. I'll work on that instead.

Alistair

>
>
> On Tue, Oct 13, 2020 at 1:00 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>> It is however the upstream default, so changing it needs a proper explanation. Is it something beneficial for the majority of use cases?
>>
>> Ale
>>
>> On Tue 13. Oct 2020 at 1.22, Alistair Francis <alistair23@gmail.com> wrote:
>>>
>>> On Mon, Oct 12, 2020 at 2:28 AM Alexander Kanavin
>>> <alex.kanavin@gmail.com> wrote:
>>> >
>>> > Why?
>>>
>>> It's really annoying when you are working on something and the screen turns off.
>>>
>>> Alistair
>>>
>>> >
>>> > Alex
>>> >
>>> > On Mon, 12 Oct 2020 at 01:49, Alistair <alistair@alistair23.me> wrote:
>>> >>
>>> >> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>>> >> ---
>>> >>  meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +
>>> >>  1 file changed, 1 insertion(+)
>>> >>
>>> >> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
>>> >> index b48726d59c..d1532236af 100644
>>> >> --- a/meta/recipes-graphics/wayland/weston-init/weston.ini
>>> >> +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
>>> >> @@ -5,6 +5,7 @@
>>> >>  #shell=desktop-shell.so
>>> >>  #gbm-format=xrgb2101010
>>> >>  require-input=false
>>> >> +idle-time=0
>>> >>
>>> >>  #[shell]
>>> >>  #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
>>> >> --
>>> >> 2.28.0
>>> >>
>>> >>
>>> >>
>>> >>
>>
>>
>> 
>>
