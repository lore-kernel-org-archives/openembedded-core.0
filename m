Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.1410.1606852172122325731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 11:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wwd8Jz3s;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id cm17so138239edb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 11:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7q2HbZEfRc0x++Ss+YQHrs8RpYER21X8CvuabjLrlIQ=;
        b=wwd8Jz3s7h6H13E0OUGjy3ZucotG37z22cH1DkLgO8I4wYBEChpe2xNZ5fb7vciMRn
         2usERJK5LD3zucEyQq4vaZEOrOD+2vqgpA5AMPTHLr2nubIyRZ/ko2nWcImGYyRakfI5
         1ZNnmjQPqb4CtKpOLhXgGk12ZLmCe8IzxFar62LOOxPMnRfUFZYmb6VtEQsEr9X08uwC
         qgzYWljjcUUr0M2j779mDjQFLB4RIH4V2AVfAgyR4svmPAnFf8znpOagNWH+0JXY139P
         F9dSy+DvBMGtvOVAa3mlI3zetprBZ7krra6BDZTVxGBIZeI5cPZmanDwlLFpX7+hnCGB
         v3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7q2HbZEfRc0x++Ss+YQHrs8RpYER21X8CvuabjLrlIQ=;
        b=gv4EPrlYiyYRSFWr5ZYofTq/kNNhQ8L2ISSItrLMv0BvxsX1Wr8xexjioPEvbNHEpj
         QGGUKxavS5LQFJeq76AhueicbV8tTiyiKpdg4AZ8qQGQ14dsdP2eSLcczpFnMevqp6+4
         9UC1TP/vtiiaaBvcZtdUmNXuoNgzGU2+Puehkkql+2KNb60YIy//6PmPNWfQf4joSiR2
         7QvyTnl02cpZLN3gWpb/Ad0y/BBKjjIO8MespywE7czVFvVL4RBQXu3xMnTlqwGBKJF7
         FvYW+HqUVOgU+lnM0xGsMFJ8jjsRICB+sXTZ7FSGTXDQGmEvr0O+ptenlWWeMdGyoZ3A
         +9zw==
X-Gm-Message-State: AOAM531N2R0sw/s28v8fnmS5UAOL13mNwCGEz8lcEKq/IWFIXNqU975m
	JXDzaoUcGM8ZFDgp8s1IBriXO5lGA/yZ3iH/BB1+Uw==
X-Google-Smtp-Source: ABdhPJwTizKSAt4NHwhjtvrMcEacjU9PiUzuDvkh0LAmrAlGs1pNFIv6LsB+C0inHrUEBiAwCdoAiql0xXdMNBtkvZo=
X-Received: by 2002:aa7:c542:: with SMTP id s2mr4700686edr.205.1606852170375;
 Tue, 01 Dec 2020 11:49:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606848593.git.steve@sakoman.com> <5ebd147ecb59a8b3b9919c5c96ebc1dd66fefa36.1606848593.git.steve@sakoman.com>
 <f9fbab0-c335-e2c-fcc7-1aa40259d1@crashcourse.ca>
In-Reply-To: <f9fbab0-c335-e2c-fcc7-1aa40259d1@crashcourse.ca>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 1 Dec 2020 09:49:19 -1000
Message-ID: <CAOSpxdYe6p=2r1SH7ipKnDXg-sHckz3+8LS16u2DSxNap_z8JA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/16] roofs_*.bbclass: fix missing vardeps for do_rootfs
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 1, 2020 at 8:59 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   "roofs_*.bbclass"

Typos come along for free with a cherry-pick ;-)

Steve
