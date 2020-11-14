Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.10396.1605381256956953993
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 11:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AGB5vwgm;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id cq7so14563745edb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2020 11:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GbF47/JThNINzsNa6OvxF0zPMNa7cb2KzIHD8lo9gp0=;
        b=AGB5vwgmnqRz1DoDQYSz7i2Yvk/wl/xEYToJqQPXngxsx7u692kc5AToy+JarJVAGm
         4MakOOEOQSHZTDBSJ9lgVqDxnJKOgNd/1vTzlxnqYajtsJ8olqjSB2bxQCI6gsFm32oG
         91udJsJWL3jr3LRAuOYfN0w1ApJPKOYuMwU23DhB5N+drayAD3QqFsJzoVW15PUL1glP
         KzPN5WHK1fQfU8fBq+T6+MwzKlee82sYulTnKfV8JEw5w2UCOZSAiMS3t2rcJPklQw2B
         BMwVsKXbEP+y93DeqZAFONPCO21qHkcyQMcDaIinQ/1L+zNpiwvN2FkYGg2msgy/+uYk
         HS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GbF47/JThNINzsNa6OvxF0zPMNa7cb2KzIHD8lo9gp0=;
        b=qgOgM6pXGsYmAvoCWwoO97+y1jTNzTtx9+pV0O7qszYUkKVWoy+14V0AACxWRAZk3T
         AE+HWza+urfk9EGrlRlXZKGIQAE7gmDyG8K5WLGggo/taX6mWMLrf/1kzY3cFXVFLxJm
         n6QkENtXGYLneR8eYgHsF1pYiOVrV0jzwatEUKXaa01kfzFLcPmmZZcqfZbNYn5oVI8u
         yP8gys9QfZ4ntI375sETj/+o21Kgbj4uDxS3uS/a94DIgDNdQAXpamEHfiG4EMPPsPLy
         XMZRJ93aVW+zFwkNs8f5CC36SfVMlwcGkVWgaFPHZJItzFTijdpzaPep1ujcw2vhaehS
         MXew==
X-Gm-Message-State: AOAM532at2OK1VlozcZwwGfWt321LTJ/Zap+iT5b6ZX3Oa8CddYP5tHV
	lwnvWcEchEpbM2dKAv448W4ciqCR7Q8lfis6Tltoxw==
X-Google-Smtp-Source: ABdhPJyH1YvlZtRZ/Lpy7vfuyz8QA+pHiMcevlQInVMfukRv+MvbCmGm6hpd2fZ9RqkL0EauMn3ujq7D2f6w026Z0zk=
X-Received: by 2002:aa7:d8c4:: with SMTP id k4mr8485386eds.248.1605381255407;
 Sat, 14 Nov 2020 11:14:15 -0800 (PST)
MIME-Version: 1.0
References: <cc5225a182325f116b5028e26027d3e6cef1f6a8.camel@gmail.com>
In-Reply-To: <cc5225a182325f116b5028e26027d3e6cef1f6a8.camel@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sat, 14 Nov 2020 09:14:04 -1000
Message-ID: <CAOSpxdZ6iBztWxwa=Fy8dT85sEUqzugCMOT+osOARAJWuxTPLQ@mail.gmail.com>
Subject: Re: dunfell update reproducible_build.bbclass
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 11:56 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Hi Steve
>
> We are on Dunfell LTS branch and have a small problem with reproducible
> builds. The problem is already solved for gatesgarth. So it would help
> us if the following three patches were picked to dunfell. They apply
> straight forward and update the reproducible_build.bbclass to paritiy
> with gatesgarth.

Will do, thanks!

Steve

> - classes/reproducible: Move to library code
>   371dcc688c3b7ec4493669226bc3dd75877c9db2
> - lib/oe/reproducible: Fix error when no git HEAD
>   3acfd33fa9c56ac69423af8f222a13be365fb29b
> - lib/oe/reproducible.py: Fix git HEAD check
>   ada41f184961fa62f2e87cbba82b446373faf4ac
>
> Thank you.
> Regards,
> Adrian
>
