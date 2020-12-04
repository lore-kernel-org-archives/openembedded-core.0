Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.663.1607120302263263737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 14:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=l/ORV9sb;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id lt17so10914090ejb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 14:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YHHvVSXiw6S5FF4V6geNLBZu099SCi7PnJZfAszWWT4=;
        b=l/ORV9sbUJJtonYHqH6Vmj5SHJcctmj1o9QkqmYCrgxrQCLeU9PXAu2Ax/mq5lPk0t
         wG1b0vKvyAkG7XRCb2fuUxcZ0R+OGaZZQq4wiUbYpGANY41Ulh6bgdBlvVGZWn9ntd4X
         R9KdRDa5oQjIK/I7T17loF7Pxheh32Y6J0LEpUOvf5wX9hNy7ahP4TvhotHp/qLGskLr
         n9Gbdg7CzR8kvZl7tD3R1eB7BGtqJQuBObinGir96VYdJ8HQxcnbfReXuLF9REFzKzKe
         DtI0xik7Z01u7+eNsR+hIqBtc+VJQlvy8Tfe28Lsj/v4PkfXBO8fRTKEC0H3koyD/hGy
         GB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YHHvVSXiw6S5FF4V6geNLBZu099SCi7PnJZfAszWWT4=;
        b=MCsr+ZRpYbpZ3DAfEaqH0iL5Zir39id00WlTKNrI3V117gHuBu2wdR5X7ELFDF+FiW
         vFIGWQ/yipgqp+pDcGQJ8Bka0KaeNBxbk1B1m1me2/v8R52ZqmjMOmg2vF8ANO1yJvw7
         rLhGHo/TtY9E7YtMyQIGnZE0ubRTSgUjmuJhDl1FLp3xcxrx3LKSyOv3j0hYwI0bLuAH
         vc454nwahIAB6ipN4VG7wN6axXT0+UmTndOhKOjhJPUSGex13nQJGGLpvWtiACvhbLOm
         BOCYVlGi3DjlpzmGUAWPclpU/arA2ZcaI0dp8rZkRe/CcIoDGMFICKVQO6PwmAc9LdKB
         aCgQ==
X-Gm-Message-State: AOAM532R6XFJvMyUNUVoxBRR/+GMHtY0byLpOH/km1Qa/R1NzwlOkUK3
	8+tKujN5LdrbDZ6JjD/8AX9lubjuI5CqP6gKoc7OTA==
X-Google-Smtp-Source: ABdhPJy6Ba0zC/bzVsAFjsIpzNCHIINKPH6zeNa/N+/xF0Duc9v9iloANQAbKTniQjyBMGz4Wn0kxxnBaIHcDTQAbNw=
X-Received: by 2002:a17:906:7ac7:: with SMTP id k7mr9020144ejo.454.1607120300727;
 Fri, 04 Dec 2020 14:18:20 -0800 (PST)
MIME-Version: 1.0
References: <8a9e9b68-8fc3-824e-a6aa-7556945cea59@ti.com>
In-Reply-To: <8a9e9b68-8fc3-824e-a6aa-7556945cea59@ti.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 4 Dec 2020 12:18:09 -1000
Message-ID: <CAOSpxdZFBi_3aOMUkzGR3juc_xfNb1EeMV6-oXmvEV2LEkw1JQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC]Backport of a patch from master to dunfell
To: dmurphy@ti.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I sent a pull request yesterday for a series that includes this patch.

Richard will probably merge it to dunfell in the next day or two.

Steve

On Fri, Dec 4, 2020 at 11:30 AM Dan Murphy via lists.openembedded.org
<dmurphy=ti.com@lists.openembedded.org> wrote:
>
> Hello
>
> How do we get this patch below backported to dunfell?
>
> https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?h=gatesgarth&id=d9e327063f63193186822d958706081d64ec8139
>
> We at TI are seeing similar issues with Dunfell and cryptodev modules on
> 5.10 builds.
>
> Dan
>
>
>
> 
>
