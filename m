Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.3359.1630536061955245195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 15:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jMxozWGo;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.47, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f47.google.com with SMTP id 192-20020a1c04c9000000b002f7a4ab0a49so64761wme.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 15:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xlgwJ18mv3Q0QqnPWKcvd7vZRIT+EBiQWDhYxoAr2M8=;
        b=jMxozWGowRqHuxjNavhopb7kwg36GTBUBqAAHSxUQ6L3e3Xj3z+p2TgWEMZgtERvY/
         ZZM18W/qKmil32xm9mvisGYJUr/vGHkBBUUZjwb+0DcwVrQuxjIwBb8/HRegJXEPNW4R
         l2otDzVx7T744viJDnM8htF5EKn6hks8BnTo/0XGJ/49zrXw+9MqRTWWv1Jnn/pStXBu
         JXSREy+0F9lDFthNJjPYADORU0wnLnI1qq5ytB+tUjjlu87faECu8dhpDaeobQPF2QKU
         ftyOwE3SXbnhkX2bBolICu6vcsz65qi6ocueWuYCBFjcL5WjS8J9th5rxayD5iPqWM6o
         /Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xlgwJ18mv3Q0QqnPWKcvd7vZRIT+EBiQWDhYxoAr2M8=;
        b=s6iqfLW2aQXcJcdThlgwiME/GPqSNqliy+hziLvDllYcy56hhtw9W922jpqN38gBFn
         TRTdsCLPJJ0CSQi2VXgPc8YcKXunm0N/VL1q4f7wPm7nPYY2VhvcDkXIie7kXMw9g+/Y
         baAPiDiqxPHS/C5230PTRGU+dogZ1CQBti8Sf7vY7Eijxfy5JWQxp7XzaEgL2ht/JTZr
         LOyWn7MUEML94ULpF7BAkTC+qfjQxcbZg3/LBetXJgq8MgvQlxUEDso5bRJpurNnXu9R
         Yk4/U3iGf1Ii7FwzTHVTtzeb44VX4fIHWz8pXaHIVgRB7hUcVY8hq0NwwLK1SpMe+L9g
         wUXQ==
X-Gm-Message-State: AOAM532FzPvWrDaX6Us76v/9JiHC67UjllzNGCximJVn7WAkul5+u11p
	w/R8BcaVaG1tGyqcJGL1x/SziH3vMxOB1n/fJglzgA==
X-Google-Smtp-Source: ABdhPJz/YFlI0aX1N99809SAgwM4CLXd5s7L7ktjNbcuaFj2eot/+dxMk1ycY00NXDJvO1zXgZHQSf/O/kFwrmykXmg=
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr190370wmj.4.1630536060383;
 Wed, 01 Sep 2021 15:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <CABcZANmpKqEvz+yzjp9mLRhgLo8bU=JiSJhTjFhKR-wMhS0WeQ@mail.gmail.com>
In-Reply-To: <CABcZANmpKqEvz+yzjp9mLRhgLo8bU=JiSJhTjFhKR-wMhS0WeQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 1 Sep 2021 12:40:49 -1000
Message-ID: <CAOSpxdbDS3DJtF6K1YTwrkCH05L6OXAy7YN8AdkOjez0p1u1uQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell backport request] layer.conf: fix syntax error in PATH setting
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <sakoman@gmail.com>, "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 12:19 PM Christopher Larson <kergoth@gmail.com> wrote:
>
> Hey Steve,
>
> I'd like to request that this commit be cherry-picked to dunfell:
>
> 2e753a12cf layer.conf: fix syntax error in PATH setting <Matt Madison>

OK, will add to my testing queue.

Steve

>
> This issue is generating syntax warnings/errors from python which can be concerning to customers.
>
> Thanks!
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>
> 
>
