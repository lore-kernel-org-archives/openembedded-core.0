Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.1265.1620067343554920960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 11:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=os2FBc9K;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id x2so9529414lff.10
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 11:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQVuRU6eoa+tTNNOornp7VKyU1uRWalaG2+5pLpHl+Q=;
        b=os2FBc9KhHvoW5MhAyn220U7Z0OxUVZBu7Iw8ZfaxaYT3rL0+RzM8moE+V0nCijCON
         3rFCWlO2pbHS6NRd5q+qGKScY+fzbI+s2+CiPBlMOcnNm56S79d9/X9m09yuuYRpUdJG
         5T0++Ufx+Tbl+5syyeo9ipUyriwL4gHY7J8RbsyTiu/iFvC4sL2EOkJblSmSAKzafFqm
         C8NQ/QL5x4VCkFGV3vq2nLKMQ9BCpPqRbCH7x+w/XjwgXUXuWkGtfR8kNEOyZOy1Hf7Q
         7Dl74tcjH++meCujECgJhVzi6T3mjF84+UjnjDNuEiR6yYf4MGc1+D9uwhe4MRVhtfGL
         eQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQVuRU6eoa+tTNNOornp7VKyU1uRWalaG2+5pLpHl+Q=;
        b=X3KqYa/vrf+QnqteqZYx+vF8pICe3pR/lhFMSb/xErhB9DQ6SC6ZqMGV3Om8NxWBbr
         L0tPka0fK6UirShd+nYppAvudevIYnQX6XSe2HpjJZdQg8Gt1BBfuBDYfG83BbPzj7A0
         CdfYFI1PzqqvFhdOMmwIpWeKVFeBOx+JQC1TBF6sUuh8SCi6nL6qwDe5TRtoYX+AdBBI
         ExRyv/XNursc5PLjbVJ7WJBzoBjZjhRSWf+nLN5OqrmZdQZhjBXiA5LoQRV/KSZ7+dSW
         NxXmTbY8kqA142McyfASWon8ad2HhVKrwLXY1roWUNcQgggntA/CpZHzbo127NZeOSOt
         30rA==
X-Gm-Message-State: AOAM530yYahv43zbcAoNUHlM+1n9U1dtKCoLHZx8PrvPQMixqQWIrVEY
	cSq9jzkhlW8ZvjKBhHd36625KxpVnlUxWJM6RqM=
X-Google-Smtp-Source: ABdhPJzg5fUOB1IZZ9IIJBfL8SF2EAN3P6fBfrZ+ANvZq7r6zCSje4mlxExwVaO6IuI9wdWdkdSu46GPLT3niec1RsI=
X-Received: by 2002:ac2:528d:: with SMTP id q13mr5753223lfm.73.1620067341388;
 Mon, 03 May 2021 11:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <14306152-1445-7a44-523-beb73a6dbda@crashcourse.ca>
In-Reply-To: <14306152-1445-7a44-523-beb73a6dbda@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 3 May 2021 11:42:09 -0700
Message-ID: <CAJ86T=WaeNQCJr4ednad1znvq8LV3P6wYvPwrzZh4rHWUDma-A@mail.gmail.com>
Subject: Re: [OE-core] how to add a "-dev" package to host SDK?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 3, 2021 at 7:55 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   colleague asks a simple question (and i'm not in front of my dev box
> at the moment so i can't verify what i'm about to suggest): how to add
> the header files in a given "-dev" package to the host component of
> the SDK?

The implication of that is that you want to use a header file from a
host component of the SDK to be able to compile additional tools etc
to run on the host after the SDK has been created?

Normally the SDK tools etc which run on the host are all compiled as
part of creating the SDK, not afterwards.

>   i haven't spent a lot of time messing with SDKs (that is about to
> change), but as i read it, if one wants to add the contents of any
> given development package to the host SDK, it would look like:
>
>   TOOLCHAIN_HOST_TASK_append = " nativesdk-fubar-dev"
>
>   i have no idea what the rationale is here, i'm just trying to
> address the question, which in addition asks, "if you add something
> like that to the host side, is it automatically added to the target
> side?"

It's not.

>   i'm pretty sure it isn't, but i can check that after i log in. i
> have no idea what they're up to here, i just want to answer the
> question.
>
> rday
>
> 
>
