Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.14356.1598516481221249605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 01:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=IUwPKlqp;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id h19so5412446ljg.13
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 01:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p6Mwgu0Qh/RIGZfi/N3NvD4WdyGzjeC6HXtre76bmp0=;
        b=IUwPKlqpQtaKBFl9vivCp5Qj92hCp2Q2zlwdorLVG4CgGwf5fWXOCyXkQQuEc5KCbM
         DnlfYYnQnxpcoDa2liW3E7rWerMbagfiRYIaOzwTAFqznFXw950G1bMMpiOkgowzm7nN
         dSETvb5VCAMSF9gGCSSgLxNQEF+QRMlrelW7lSrA53SfJBPbdft6zue17zNd+w5z67xp
         On3tq7lQLQzqrmShYo+YxWvNovqbeAw0c5DXTsuG4FMQBQFPaHijKYG9rTUL9++WGHhX
         vRhb2n8Cda4d2vyxXaOTVxLpeB/1NtDzxXbhDC1Wb6cBpu7J3lf8f11TTcmCtzTIwFbi
         gjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p6Mwgu0Qh/RIGZfi/N3NvD4WdyGzjeC6HXtre76bmp0=;
        b=eQbDE33qFmfQXDBZ/ssKTksmfgKMl54Cow/jwMwxNixLxw8ktNlIXbqQTfPY3RkMQM
         I6iF0lPV9GN+1qfuwi80290tlnNkxQLsecbWELWMpA+hLitxSljUnJlWc4+UonjiZkyC
         ywN83vR1gGfETnHFLlQ78LRYtcDHwMVA3FGnFXPq3tT+B5Y4ZZu2oa+IidF1HdrirfH5
         Y+c8oJwypFULxm/nsEyDYDGeBxPb9PNE9Ccv9rRO1RrYlLNt5wrst/9vwySsrYcpwcsh
         AigfnQAlJReUhZzr0dArNCK2/uQeoXB3p2G0v9Kpmsa9laPMTn1KJO7IHaGh2JQCHPiM
         ruWw==
X-Gm-Message-State: AOAM5318b8HS+qUewQ6txzQKyJu3yND5tA3m3e72WbOiYlMg9I+e+BEN
	mf2AQ0rsPidAzuERz0z9ESShECmaHWYxulB0pGJZ2w==
X-Google-Smtp-Source: ABdhPJxdHRfsPQBFwEZIseYPOpuVc+Lc0M4nCd3goyIYnfWJ7wQGPVJnYwA69UaeIMW7UBFzjBCdlRaHStpPgl9dr7c=
X-Received: by 2002:a2e:1311:: with SMTP id 17mr1280749ljt.397.1598516479080;
 Thu, 27 Aug 2020 01:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200826054101.856417-1-raj.khem@gmail.com> <20200826140046.GJ1638231@joraj-alpa>
 <94a29731-4335-5ab3-ae62-740f29c7627b@gmail.com>
In-Reply-To: <94a29731-4335-5ab3-ae62-740f29c7627b@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 27 Aug 2020 09:21:08 +0100
Message-ID: <CAAnfSTuhGz+wyguPojV_0YYE7VzPS4BZcBqXFu-=FjQAU2emmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-tools: Do not build for riscv64
To: Khem Raj <raj.khem@gmail.com>
Cc: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2020 at 03:17, Khem Raj <raj.khem@gmail.com> wrote:
> > LTTng does not have a hard requirement on lttng-modules (on paper), when kernel modules
> > (tracer) is not present kernel tracing is disabled and only userspace tracing is
> > available.
> >
> > Was there any report that lttng-ust (userspace tracing) is not working as
> > intended on riscv64?
>
> No, but lttng-tools have this as rdep for ptest packages which is not
> controlled via packageconfig or something.

Make it a recommends instead?

Ross
