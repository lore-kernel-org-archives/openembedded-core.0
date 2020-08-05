Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.7925.1596636845149105905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rTkNYuNe;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.67, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f67.google.com with SMTP id c15so22972899edj.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ghV89hGpfMHZu1kA6dkMs6QBHGmK3bD+5iQfDuHZEeo=;
        b=rTkNYuNe0VlA08DDB2ZJ/jHisa7rPE0vFBJlcicj+d4emRRm63gaeijMePFx0Ky2iO
         Wag47QkHXdmsvexKXgJPX7fLNLKZjxK3eNL9mTiybdWllalQDYcRfMrs6PoMqLb1AJ23
         GOZUi7xQnUIHdYz4s6qiPD6aXUPby4IvoOh6XUfwMUqScewZ6+QeBe3WPLEvE7yLmYKT
         QJBuk6DkmSUCln/HYWC/JGRii9HF32rRcnQcK9S4ZG79rUmzJMJpoSH2/73CV/oH3XkT
         YZeRtWh5Wf86ssbnRaqt7ELwzypgSmQXJXiSyya0hO+A55hFikI6lm8fAWaQd+G0y5yK
         PYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghV89hGpfMHZu1kA6dkMs6QBHGmK3bD+5iQfDuHZEeo=;
        b=ThW0mjOrwxrQMsN8N1dISjnlmlYL4ofQGasegpSERT27Q1n+mAteX2lkt864pam5EN
         3Gskwm7KUgxAw8jIgWbzS7kFCJ8kBA8MwAcvkoD9iaqyjA/KoUxgSphLhW6Qb733Pusy
         WwZXOTypHjTOWFkzPxAxMz7sDIvlC07jiJlGCSacqK7yhUROcUaDm8HFFOWO/YiFJPvk
         wZwwm8Ktivys+zFfmA3vOYV3WlQv5SNUSH08n6sjyMCIQo+7d5UZ92hE7J2mluQbc2/L
         e7nBow8zWEcTTaOdZs97ivLXaBpmau/qgqRSJzBLDySUOnYDri/cnTDGJaRfHOiANBVE
         Ylrg==
X-Gm-Message-State: AOAM532H6CgdXCCIqVswe4+34wyqJbgHZTUakCYYjr9UYfd5TAhOOGW/
	XnbSI1eaqKdFh+WU8xKAE9jW2UsiTi3qTb8XUDyy/lXBDeU=
X-Google-Smtp-Source: ABdhPJxGyG9tVC7K/WxJFheLw8PvS6c8giAQ+ED7KMpGwdfTBshj2PBzs3xD4LtL3g4l+RiEldukxWhhhDk4MXjCepM=
X-Received: by 2002:a05:6402:1a54:: with SMTP id bf20mr3000626edb.217.1596636843089;
 Wed, 05 Aug 2020 07:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596464561.git.steve@sakoman.com> <0a664b963c116786382fbba6f3386a7105a01122.1596464561.git.steve@sakoman.com>
 <a6cd8adae83c5cbe1aabc48fc2a613bc03f93f4e.camel@linuxfoundation.org>
 <CA+chaQdKyvwfSnMj6G=obKiUADNyVDKm20SJbhYopmDqWrqJsQ@mail.gmail.com> <CAMKF1sqFi_pHcxKSe-RGHmBHPuKLNB6E=UckNd5dj7taZKKxbw@mail.gmail.com>
In-Reply-To: <CAMKF1sqFi_pHcxKSe-RGHmBHPuKLNB6E=UckNd5dj7taZKKxbw@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 5 Aug 2020 04:13:51 -1000
Message-ID: <CAOSpxdYzZpdEd5vkOteF8uNUV+oJTH6b407TBaLP1TV7jhEz5g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 05/12] layer.conf: fix adwaita-icon-theme signature change problem
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 4, 2020 at 8:18 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 4, 2020 at 10:59 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> >
> > We did the gtk-icon-cache.bbclass backport in:
> > https://git.openembedded.org/openembedded-core/commit/meta/classes/gtk-icon-cache.bbclass?h=dunfell&id=e921edd27e71af00f07e3f1e973d2b0c6c777bf4
> > but this fix, is only for adwaita-icon-them and other recipes using gtk-icon-cache might need identical fix as mentioned by Khem in review of this work around in master:
> > https://lists.openembedded.org/g/openembedded-core/message/140910
> >
> > I guess it would be better to just revert e921edd27e71af00f07e3f1e973d2b0c6c777bf4 in dunfell and find better solution for master first.
> >
>
> +1

OK, sounds like a plan.  WIll revert
e921edd27e71af00f07e3f1e973d2b0c6c777bf4 and drop this patch.

Steve


> > View/Reply Online (#141192): https://lists.openembedded.org/g/openembedded-core/message/141192
> > Mute This Topic: https://lists.openembedded.org/mt/75966624/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub  [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
