Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web10.5321.1602526837642142671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 11:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nkMpBwDI;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: andrey.z@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id f8so9630553vsl.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 11:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b3vSqdwkyFA5LY2NHF7I1ag4u6lpHif40tzskyizgbc=;
        b=nkMpBwDI7cTlMuHUtmflKDYIIYldhYwfaJMqraWXSOGwyyXiElCTdTM46TecokOK9a
         q/S5S1z1a8N3CYxkIysg5D80Yc0uiGzd/AqP1cBSUPQkE1D085SyMJi5ZC4geGV7YN90
         6ZNSd4ocqH5fICv7sCASLuNlcX3md3BW1Qxqu5bI2SWkEowQFuu+YxsVbJSQuhVOsloP
         UDkYWKFj57Y1J6Kknn4b+LOJPsqfmp/QkHac9rGp9SwuoJROqbhjWhYP6/oaXF7HOzPe
         dvnAkCotKdJqx0NmZen6Edgp60JDZd3f24sKtPWkwIjH8NXB3/uBXlrEJVxBEreDYegn
         oaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b3vSqdwkyFA5LY2NHF7I1ag4u6lpHif40tzskyizgbc=;
        b=cFgH56S97XjYYXB9TlOJ4zPkqWVlk2UnzLwG/B11aiidehfyvhJWwpWHWt0AVV/aTl
         nvHcdKpSMSvwMwBZTeAOgP7vA5tveD265DXCaI3T1//IsuoXEEFyxhtkV6K7bHo3+3/0
         /WEgNoi6GrkTQ0aZw2bLJxye/lCy9AxByS+VoKDOHINzzzMtM9zWVfczTOIRJQyz2Z4L
         LkvsNHe1XVuIgJfze84JTSGMHhHDI8z+znTTUIkTF8wfjX3xJ5kt3MSoQz7sesPrgHiO
         cwY1HfQxen3hJlqAqe+y/TMGput78JWVKdE/qt7AJiC8T9LreVGZ3yH03rW1LUgR43Ah
         UT8g==
X-Gm-Message-State: AOAM5330GD8jntPGew+/fxcuark2iynKyVxDWNC4UtrDuE91disZfZQf
	AnnFR/v+kDXdlP4esU7rZRJK3OhDW5zeGb0kFsg=
X-Google-Smtp-Source: ABdhPJwLCR0r5ydMR30F1ciiOISTwZRhgIEI6Z09OgOXLWgRpl+yQVrLzqpEk6pvzqe59Vs1kvcJSM09LLDbHfMDjKk=
X-Received: by 2002:a67:fdc6:: with SMTP id l6mr15460017vsq.31.1602526836858;
 Mon, 12 Oct 2020 11:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
 <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
 <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com> <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com>
In-Reply-To: <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Mon, 12 Oct 2020 20:20:23 +0200
Message-ID: <CAHtQpK7T7rqfACB7MSnTh701yPbPy2B51Em924-FueriejFXOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 12, 2020 at 8:13 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 12 Oct 2020 at 20:05, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>>
>> That has been addressed in meta-freescale-distro layer
>> (https://github.com/Freescale/meta-freescale-distro/commit/01c87325571e5ee91ecc575c863fb693fc1c9955).
>> There has been a similar native dependency required for GPU SDK build
>> with Vulkan support, hence the recipe for glslang has been introduced.
>>
>> Should this be maybe ported to OE-Core?
>
>
> I think the provided links indicate that gstreamer currently does not actually support this, and requires a different tool by google? And gstreamer upstream seems to have conflicting opinions on which one they want to require.

What I meant to point out was - there is a dependency in Vulkan on
glslang, irrespective whether it is compiled standalone or as a
dependency of another package. I believe this Vulkan <- glslang
dependency should be solved first before Vulkan can be included
anywhere further.

As I know, it is currently solved locally in meta-freescale-distro
layer, hence it was my question on whether it should be moved to
OE-Core to solve the Vulkan dependency altogether?

>
> Alex
>
>


-- 
Regards,
Andrey.
