Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.3105.1586288584512982215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 12:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=AFX+HBvX;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.171, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f171.google.com with SMTP id y3so664376qky.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 12:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=EjYAosYFtpu1q6AXgHjzZnWl9Poe3ib7OeVZklVPLfM=;
        b=AFX+HBvXLbkymQVXzhfCtrDj4a3sbhuenyzrae+eaChDw9++5iqaVdw2PyvyVevNBQ
         +p5Q5YRbso9k8Z8Lw/ulC0uY8182VeOx0fqyQfBlRbseTl1tmmZmJOZg57gW5Psg9x4i
         uhzcZ2w2JUn0lVdadszBZ1p/ZEv65g4z2l4oLckDzZCxz8Ku+gYUcgYiv1KC0SWDzLuZ
         nNdra3vs4uyEIxEZezRRrmslbAQHduSd/CTZ7eeYzfFHQ66g0M/wYFzNSpyHL9s6mmJ4
         bE5MG0mpC9Z+mxMYqxsNJsVbNGOchQQQCZRxEaMfAaBW4ts+w5S6Yf21LztXuuZB4kRv
         cfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=EjYAosYFtpu1q6AXgHjzZnWl9Poe3ib7OeVZklVPLfM=;
        b=Ugt3wATbnrw1/fihmUHgtiqbjTaG/UQKIpwQY+sfl8hJnV3jhvTnVygylvmk5k3Nbt
         j0QtBrefZtUjR2brkgpcEVTDYA3LFHVLwx+JAZcu59DCjO5CeylOk8m3MkvP/IeQbznL
         /GfiJl07U/Sg63Vl61nqSg4rOyHux1Np6FlSr8NewVm+wS93AZT7RPl1D7NWO62EvuzO
         yc1OFttgES7R8fErrhV8aP3OtkWOs9dl3Sh3u/F5vSRJ8MVpSg0gd1THTYmizRvFSELQ
         /t4/p82oLPUjuQbDMXn8Xl9OjThKzMTRHjaTk6B2AsFvIXFdf1cWeamyOE6DyTdOc7B9
         ckdA==
X-Gm-Message-State: AGi0PuZfkS7OdMDtkplaCeTxehIe3XXERYOXX2HzeHmJ2FpVZAAv7glX
	l6xrZRQRUUCTREwynwsYIpK9CKWHevyzLg==
X-Google-Smtp-Source: APiQypJyrhLQOwTmM7mW1/qJu/HzM0Q1lpGZ84S8ho2bGKhiWRQfRFHdSiLtIR/cFXvO+6W8eKlkwA==
X-Received: by 2002:a05:620a:484:: with SMTP id 4mr3976638qkr.203.1586288583279;
        Tue, 07 Apr 2020 12:43:03 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id g67sm17420359qkf.96.2020.04.07.12.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 12:43:02 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f175.google.com with SMTP id 13so645628qko.10
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 12:43:02 -0700 (PDT)
X-Received: by 2002:a37:b1c6:: with SMTP id a189mr4085775qkf.26.1586288582075;
 Tue, 07 Apr 2020 12:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200407180501.9505-1-max.krummenacher@toradex.com>
In-Reply-To: <20200407180501.9505-1-max.krummenacher@toradex.com>
Date: Tue, 7 Apr 2020 16:42:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoFHFABma3PazPYjzUZf-7jX-ZAiUhj0ZcWXfX9FMTp_g@mail.gmail.com>
Message-ID: <CAP9ODKoFHFABma3PazPYjzUZf-7jX-ZAiUhj0ZcWXfX9FMTp_g@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch] libubootenv: update to latest git hash
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>, Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"

Max,

On Tue, Apr 7, 2020 at 3:06 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
> This adds the missing feature 'negative offsets' which was present
> in the orginal U-Boot based tools.
>
> git change log:
> * f4b9cde Allow negative offsets
> * 45bf92a Detect sector size if not found in config
> * 9f59db6 uboot_env: remove unused variables
> * 65d243e README: libubootenv is now in oe-core
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Thanks for sending this.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
