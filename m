Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.26139.1607898055819558623
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 14:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=lWJ+rF2m;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id a9so25442064lfh.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 14:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1IohrxMO+R8LA5eEK8T9gu2MF1zgTB9nq1Zk4ymFEvM=;
        b=lWJ+rF2mf06jlR0WQoIFbM+fLXGE54LN4HJdUT0olrsU7nVi+33HAAJoYuak0SfNiL
         YHFH4/7qwoZWT4ERPN5uuC7Xdp2Fs8txK/V8fldHKxEP/Tw9gnf58mdKNyxJPLeHyn3j
         dsRO8V51CCrhIaXXBSX4wRF+F43Vc7n4koQAkDWWJb8lyoBB1fUIqHfImHYKrofmijf4
         +RMAMMBtM/zYcZiQWWrp4XcK3I11mD7sX4dOYbkDhiePwsRX6mvrvU6fx4lkLteFIRLQ
         xYn+O/j4u/2OipNxxlUEHLuCKK1VpQBj9ZY2/L/m54W/iovWzPz+0kO0QhJ2twV4pxKd
         rQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1IohrxMO+R8LA5eEK8T9gu2MF1zgTB9nq1Zk4ymFEvM=;
        b=K3cU8uXBpnXw7+uinafgcw2CuOQPOxag2tJf4MZguysbMIwZbUKJwZFEi967RLlNIX
         Q5NDtQyX6ONTDxsUb3vSUiQhZFVANLJ4b/w8CswV/JTGM2LCUlvQ3W0nllMbNpWH0pJr
         rOU+Gp8bU7AQJ/xEMFzXDhZ4qJaBqw+j9Vo21bS2CVPN46PAoSzxTj4ppeMcQCjsP/mR
         6vyr47KH9oGa+H+U+J7mqsgOJbFiQaY9cqKfnOoSEVHuN2FdmayrdOxBMhY7mKqLG1qI
         wwnd6PI8QvrCfZpBpxHvHezdyzsUv29v4Wg10niTO7/dTCMkYLUEJllY5bk9N+4nSWFs
         Estw==
X-Gm-Message-State: AOAM532GuC56E/ETMLag4Oiu05lwudOoT7hF7sFBWT5vR+fWFypV+zNd
	aDvGa1KGs3UFt1xgM6pTh1f+SljxnQqXneQ6LOXVwA==
X-Google-Smtp-Source: ABdhPJyDULHxCC1fscPJe58pes4TGfmjpELYKdOJ5D9Gi25NVdVBFrAwH6tK+AbUs1a9dQjYobl9or+dRCfGLgxGKqQ=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr9330747lja.24.1607898052631;
 Sun, 13 Dec 2020 14:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20201211160922.4125554-1-ross.burton@arm.com> <51192976-54f1-a6dc-6be0-0780c3006338@gmail.com>
In-Reply-To: <51192976-54f1-a6dc-6be0-0780c3006338@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Sun, 13 Dec 2020 22:20:41 +0000
Message-ID: <CAAnfSTvfQZWGXCjduUU_1M4ae=vnmqLO95JBsS-ZeNrHf6KbEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: set COMPATIBLE_HOST to *-linux
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Dec 2020 at 16:53, Khem Raj <raj.khem@gmail.com> wrote:

> > +COMPATIBLE_HOST = ".*-linux"
>
> does this cover linux-gnueabi and such tuples too ?

Maybe?  Depends on the matching in anchored.  If it does by accident
then explicitly matching would be better.  What machine has a triple
like that for testing?

Ross
