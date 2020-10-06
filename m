Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.2777.1602013564285097903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=1GYSa/tv;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id c21so3127208ljn.13
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 12:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jB5U+88vmdwMm9/TS6hSgZqIxWu5ub7PdfKO2gaJprw=;
        b=1GYSa/tvhwUjIWKTEQT7LiQvZtzdhtgAwu/S6GmJk5X87csfDm+1+x31QOBIZrVj18
         aQKFOpXOmEyIJRSuXPIck8FI9gRv/UzlPrT+zFVkgqG3iL913YChShVWqAyCpq+TWgJ7
         b+vkYsMx4ZGeMhf7+DuekrfwhYkmC+yK0BUyusBbgLy5BXvtKfJ2toae9n0mz7ex3zBC
         zb7hjwWxcOP6kbZjmwjUIx6ZT4n20Rw5caF8XmBfUz0oxtHqdSOBGjs/I+noqnklD4YU
         9pI2IKeqg8FZSn/VzhlR6IOgbrapfyvyEgd4kCdjyrpiNrJEGvJY2Ky0AM9ITtNiaWTh
         G5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jB5U+88vmdwMm9/TS6hSgZqIxWu5ub7PdfKO2gaJprw=;
        b=m+KWz0W571QaicMo/7ME4cxPSMo+hb4jZoXlXXvFlIiBxj03uIIdV4S27CML1lo6eH
         uNkXSYMf92OUEOkmZRfgHhk9uCBsjBCuKF/qzDBnSXtMFGpNquvkdZOIJkmvhONxftkf
         GcJBy5fEuUPfxyhUiSqJqGpAK7PzlCApqTT1wJ3Ci3K6lo4SPqEq2Ik3XrRJLUkLXsTb
         TeUm44LBwKCJ8PyYQ7JYSo56faWLuvcRLNEF7bJGCW/oMv+dWsDSMFHlDuo4xrtzDYZn
         KDohqNqsu1OLBLWLXQ3xnilfHZWlYV9IE9U3V7OfcIdj79h/TABxjI7t3841PoXRXXmj
         0FzQ==
X-Gm-Message-State: AOAM533LsiTaKF4rpbXplWLA4Lp8TKzoc9UcTvlVRKbAupID+4uN3Izx
	YB8sSBPHZeiDmstzi8kVUVudSDl6Hu35T0KoLs0QEQ==
X-Google-Smtp-Source: ABdhPJzXYRxtQ+eGKcCZ+gC8IFlsMJTT7DSEID4mSj2kJcIRyUtJZMNewBvCpvubV0h0Uo10gwItAPHErjy3WKn3KuU=
X-Received: by 2002:a2e:b80a:: with SMTP id u10mr2541497ljo.22.1602013562358;
 Tue, 06 Oct 2020 12:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201006111444.3952584-1-ross.burton@arm.com> <20201006111444.3952584-2-ross.burton@arm.com>
 <CAMKF1spSQo7vi9qVN5TMHJ4QrcLj2sw4VJXMxcM0sSiFf9OvaQ@mail.gmail.com>
In-Reply-To: <CAMKF1spSQo7vi9qVN5TMHJ4QrcLj2sw4VJXMxcM0sSiFf9OvaQ@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 6 Oct 2020 20:45:51 +0100
Message-ID: <CAAnfSTv44odADoSgCQXgYRO-yiHXejRwwe47VrhWZiwj7wYL3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] boost: don't specify gcc version
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2020 at 17:14, Khem Raj <raj.khem@gmail.com> wrote:
> does it probe the version from cross compiler now and not the host compiler ?

I shall triple check :)

Ross
