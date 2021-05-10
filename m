Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.30209.1620644898233650865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 04:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=aoY9KLKz;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id m9so16183231wrx.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SuZ2hGI4kvpKXl5TxISpIa9sfR+b5RkoDhos9kc5Sp0=;
        b=aoY9KLKzNhRDeH7DFMqJ9JOfj8BlbiXfottYaf2AlojlzRcvcj1SqtctriO+dysws6
         PzpJKz0IL2arJ4hjCz7cCYjj5Hf1ezNa4juk2AY0kezuImdBCewEZCTZ+09Iywr70hz5
         GUEaZHX7qCK/KPXeqylpZWSPttzuU2FkIEDjhIDgi2IzZScwlcyGxr/C14HjEaefU7sZ
         TR+qSAasZ160xRx37TBItRYD11hKvYc4hycnsZJmnjb31opIXjDty4h3nrOnspz8UvVP
         v4VU7/SodZGIU9q0nfCTwraCJnJ7gEMT5eQSPMKkEmjUJcbXOW45qHgMUVeCf7G9g9B/
         Ne7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SuZ2hGI4kvpKXl5TxISpIa9sfR+b5RkoDhos9kc5Sp0=;
        b=E7uIUYmkLDkxheEJmQnq575IUi8UDnx472192zQBxy6/I91sAA9UlwFCom3AhzVBE5
         eblq3Yb5hRi4tKyqyfn4rh+rgob0pU/AqModQDdAIU4zaD/Lk6uoX3s+9AwaDaZNJL90
         jqXVr/fgRXFA8Shb8zv9GOhGgO0hF0jCk/OLEF9WAx8AIuV81SimVAEvSXQk7ptDURMe
         InhdVVsxFhbjX5pJcbA3tonvCqDa4v2IkC8vCTGFsKQWI3mbNiLADDRC4kD7CoTEfre/
         Uc8Tg7tywz/g5EMjo/jsHTz3o2R2bPqMEljJ9saqGYssTQwGBGakeiyqsf9R7ZfggSOP
         hhdw==
X-Gm-Message-State: AOAM532JBdg/QIBZgF1AjMmptBm06OhuXkfbsASbVex6pjOlJlEuehNH
	8e0P8ZHdw6EoYSIHjaavRyArOr2/4db0RMCHgJVw/g==
X-Google-Smtp-Source: ABdhPJysolE0M6sc6Uk1mQg73bXwViNjBVTTrkMu7TrcuXAKDaqFDx8Z7Uzxad/21MbXAcYoIBE96tgpi6+tZfu9+Fc=
X-Received: by 2002:a5d:4c8a:: with SMTP id z10mr30117394wrs.395.1620644896806;
 Mon, 10 May 2021 04:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
 <20210423180254.706537-4-alex.kanavin@gmail.com> <CAAnfSTsz5L60dtRGqCAam_1DCV3Lhb40GZ+8HMvEGC8RitwgKA@mail.gmail.com>
 <CANNYZj8p6061c24KP=0QxrXsAq+Qp0oAGSyaYzr10=Zq=BtvZw@mail.gmail.com>
In-Reply-To: <CANNYZj8p6061c24KP=0QxrXsAq+Qp0oAGSyaYzr10=Zq=BtvZw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 10 May 2021 12:08:06 +0100
Message-ID: <CAAnfSTtOtEMXhYZBaf23GCr+DCR_t+bFp3PgNJ8-82kNSXszCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/7] oeqa/selftest: transition to weston images
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

The only-x11 target is close but it should drop the opengl distro feature too.

Ross

On Tue, 4 May 2021 at 19:04, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 4 May 2021 at 19:01, Ross Burton <ross@burtonini.com> wrote:
>>
>> Hi Alex,
>>
>> First, I love to see this. :)
>>
>> However, using this as a convenient starting point: if both nodistro
>> and Poky have OpenGL enabled then there's no test cases for the non-GL
>> configuration anymore, which is important for headless systems, of
>> which there are many.  Whilst I agree that graphical systems that
>> don't support modern rendering in some way are on the way out, this
>> trend isn't across all of our target platforms.
>>
>> Can you add a configuration to the autobuilder along the like of
>> poky-altconfig that does at least one build without GL?
>> core-image-base as a *minimum* but a core-image-sato should continue
>> to work.
>
>
> I already have a companion patchset for the autobuilder:
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/log/?h=contrib/akanavin/transition-to-weston
>
> I don't think it has the non-opengl build yet, but I could easily add that. Can you take a look at the patches and maybe propose something specific to add? I can simply add a patch to my set if you write one.
>
> Alex
>
>
>
