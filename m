Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.100200.1597879013398113647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 16:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=HOSYg9gn;
 spf=softfail (domain: sidebranch.com, ip: 209.85.222.179, mailfrom: leon@sidebranch.com)
Received: by mail-qk1-f179.google.com with SMTP id x69so91197qkb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=nvlghr+opgcxmFmgvgBJuHtsjGMxSzRUChMADnhlcC4=;
        b=HOSYg9gnsGqyXaFpJJqsq5hxQ4iwC8VYiWOyBftGalFDYzBNAw5i2ChLWNnsfk9Xo4
         l9yhErJcMc6+7PVY8ufHIUsfYDP6bjdd6c3mlGNK8NsDeN7Cb2BLm15+Pg4rs+vUpaZ/
         Yth8bIR7mePKQue7g9gaH9cv+IOkl+H8A4mGTPoK2bMEFccsAPcghFuE6HkJjtz/LjTo
         /CsPhSqeTsMb5gdzWoOMoJm6jQH80ShCRQR5QU7B2n4zICzzJ36eGY6qrBuCerzrxcqi
         TwaYettYdx/OCk6FD2jpvr7MZF4gYa9hby2N/k1M588+7vlHEyUtHX+r15Jrxbj4vYGB
         umKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=nvlghr+opgcxmFmgvgBJuHtsjGMxSzRUChMADnhlcC4=;
        b=H/BNhx+Dh5p+J7BOeUrl57ysb5JY81Sw1+zKUN5tiJD40I2cIlUH2pqXMuBL0TlKRU
         4Ec8PO+8KozbwYUjJSiiGSXkDHaHzHbq7kft1HA2vM0z5RVOlqpVtoAkhydz/MV6wM98
         9dWTkUwH8nTLZhFS0miYU/QvmAjgg+EmHZN3mARXiafuv1tBSOvaIxUmo5I1R5AoxmjG
         niymEEfYLUrxxJQ0RnZxgMNgZz+qrN/dzAosu50x1SEXCRVuvN9/Jd7e1tQmLBr8bjsv
         7v1faqzHj6rTwwIBHSkL8ZcjN/r4e7xCVr4o9pW8tNWj9Fn5rZa7NmgBI0gkgskkXjn8
         in8Q==
X-Gm-Message-State: AOAM530/LEXk6QTJiz31O24BYQlwJJpeRoAjvF/vbM2xjM+LKrEycvWP
	ifglfIhQTSM7j55Kr8Dmf7i+QbigpK3J80AjKcUlY+LKHzSc4A==
X-Google-Smtp-Source: ABdhPJyK6bDJDGDe4p4Zzd2DOcw2HQXSKb8HvHJao8LDQJwP0O1TyEQK5T5sTAiOTOfKL7s9Ckn3ENxeL/mOR6E+AMk=
X-Received: by 2002:a05:620a:12bb:: with SMTP id x27mr352407qki.202.1597879012344;
 Wed, 19 Aug 2020 16:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <162C17C3E9BAC6AE.7353@lists.openembedded.org> <CAMjhiJhwiAH4Wuvdom5VkD1aL=2wAEHg1n9Pb-QVsaO=qk6cQw@mail.gmail.com>
 <94e7e62a-7589-4914-aa8c-1cf394343812@www.fastmail.com>
In-Reply-To: <94e7e62a-7589-4914-aa8c-1cf394343812@www.fastmail.com>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Thu, 20 Aug 2020 01:16:43 +0200
Message-ID: <CAMjhiJiE61DZyNS4TPkrhTk2y8f4fiEkoq6kQYCYQUs7y385hA@mail.gmail.com>
Subject: Re: [OE-core] -mmusl missing in SDK / CMake MUSL toolchain
To: Fred Baksik <fdk17@ftml.net>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Fred,

> This append at the top of toolchain-script.bbclass is thus without effect:
> TARGET_CC_ARCH_append_libc-musl = " -mmusl"
>
> This works:
>
> TARGET_CC_ARCH_append_linux-musl = " -mmusl"
>
> FYI,
> Sounds like you ran into the SDK / musl problem
>
Thanks, I have updated
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13459 with my
findings so far.

Regards,

Leon.
