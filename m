Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.4848.1608264095623634390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 20:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yqc6FVlL;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id q22so1235743eja.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 20:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Iim9/Knbky4Qj8BYZAe3OlYFBvGDaMsVkaQtDhUdLMo=;
        b=Yqc6FVlLw6IMe0zDqHvQ3nh1AHzrph+TgvATfbvwoX8+fh74+FBGLWfZIw4Uvxr6AU
         uCOC1xZGTFcfFBzRnnCiMOqq1tqlJs4Q/IKqlmMFZfFqOupY2H4ojj3uKcSrkjtHtx5B
         NzvUVX4cpniQKPwlF8hLOGmKk1adUvT7rL+3s5q1IHCJjBKN2MAxnk9ambIZ11sI6VXb
         3WC0X+rLxvAVy8B92yIjAO36ldqS5SZfjpofeX+90WPb7zCMZB/HNdZDUXkCmyuD1bwa
         GzBRbFKPTIeXVhpgw4hxKPlVYKYdzhMJ+DV/MSFrSx+pTeOMiAL412ck2GsUy8j3Rjfj
         iakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Iim9/Knbky4Qj8BYZAe3OlYFBvGDaMsVkaQtDhUdLMo=;
        b=AoBYJwOhiBnK0bfXVpt1TA0hF7aYfqW79BJV5oQo9L64Sm2HRAepA+ffERv2irTwsR
         SziRhkBqPWDJxOdXlx82d7YDd0CDhNP3qaBLM1zSQ62NeoAVMCU1yw0t+y7tqox7Cg+k
         jD7DAUqe1kLclyyp2SAohWcu+4gkFApv0ZcteSG+AEjquSC3t6jbXuTKt2UEGpAVn/bV
         mwMi5Dd3mHVb4ZgDBwr6N4Z56e/biPtSD+3ZOo3aUo6UE62uMSJeuYJT5suPHk31fUar
         Jrno5vs/RMc61hTmLWqzP6FW2gh+ri112yvMyTD20+r6bYztBdlGTGovsh8Y5HRbNMSM
         fptw==
X-Gm-Message-State: AOAM531wI/MQ2NC5RObaHQKF/B03UHHSnaBqcbqm9B9y+GMplCTzMClx
	bj3R8m+VAORXcxBh59RS93dS13DO/aHiWXZVzHcHCEvP1WQ=
X-Google-Smtp-Source: ABdhPJxT8tSL1WQ7K2gttXhvnRi0j20KPM1dvSh4ebJjyrcqwtg59A01xLvlmphSRESKs+bp8CPSI6r0TJFfT1FcuRw=
X-Received: by 2002:a17:906:d101:: with SMTP id b1mr2188265ejz.80.1608264094107;
 Thu, 17 Dec 2020 20:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20201218035749.9850-1-dbaryshkov@gmail.com>
In-Reply-To: <20201218035749.9850-1-dbaryshkov@gmail.com>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Fri, 18 Dec 2020 07:01:23 +0300
Message-ID: <CALT56yOe5ZHuQpMwm6vrz6siNK_oiCqSh9q73sHCfFqTj9Ckew@mail.gmail.com>
Subject: Re: [dunfell][PATCH] systemd: Fix reallocarray check
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

=D0=BF=D1=82, 18 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 06:57, Dmitry Bary=
shkov <dbaryshkov@gmail.com>:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Musl brought this latent issue to fore
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Please ignore this email, it was sent by mistake.


--=20
With best wishes
Dmitry
