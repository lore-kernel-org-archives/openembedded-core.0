Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.17907.1604519289533381117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 11:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r4cjXnpd;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id t8so9347283vsr.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 11:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eQKH3oK5igF+d/BRoN7PQMHo+Gqhirc7A5dABHTRt0w=;
        b=r4cjXnpdHDgprXJFOeu1FrklHEzxBjd4fk1NMCp+NTQwUIJMn8RIwqaFyB4FMLMCh5
         ma0p182FL9/M18pYMT2iPeXB6EvAq08Ytx374pUB4s1I0EaYMzd43ZPFfEN9J+V9SMS6
         zAGPGC47ugoMtmdXgX2fliY1pbisvmVSXmrk+nmo481oRGGkvwKi6n5yDTVn3diJ5uB5
         er4PkJ8F7S4UNIiO5+zKVDN0tSTP2moNBP0EkwX9b46zJpWqMRAQg3MlNcE6unnv9/hU
         BadF3C/CRp9S1C4SuAQ/vshbuUKYEKYNHYX+znwFS0x0H9lEVxUHIyQ7UXpRP4FLW50Y
         hYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eQKH3oK5igF+d/BRoN7PQMHo+Gqhirc7A5dABHTRt0w=;
        b=UTfue5agA/QpjyirPRyzY80sED4c5iRqJQK2jUxmlhAU7OBP8hlaqUW9EmUG6XL3Wj
         /lEBe66kNE+T37VXSnPerjC/5YxqbwmTJmeFBHxLBcxeMi6oNS7wSTOhrePg4A1T8XpD
         iy2/OUoA9CQUqVwwVNJY4C5ltw0i7rXHg3Ak+8JYf82hkzzZhaoETDjId7P9CL8+rgJb
         WqcI+5ZzUOVj1t6r4ofTyA+HTzIPolJ1YUIjJyOGGniwMLwL0uayXF6A/6OJbM5mqn1k
         guwe0RsAg7mJYeuUWSYUsrREIQRYJ7HgNAclCL4jU5IbnGnc2XBYVXmhrwXpFA1h2aJX
         TuCQ==
X-Gm-Message-State: AOAM5336Rfgl75LKqwL56ZS2odpElcunYcT0fKBlW/0/fcCym8OMShuR
	1k0x9BWVi0sLixqHsv28dj1S515HkmokhgspHXM=
X-Google-Smtp-Source: ABdhPJykA0QbGbTL5H/v7WHdTyfGsPxroa80T3javcN4RQZma0eA7YUbSUOSA9x78RNhKkMOBSUXr/kQdp5NUq8rLZE=
X-Received: by 2002:a67:fe12:: with SMTP id l18mr24978750vsr.35.1604519288532;
 Wed, 04 Nov 2020 11:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20201104121217.4013924-1-ross.burton@arm.com> <20201104121217.4013924-3-ross.burton@arm.com>
In-Reply-To: <20201104121217.4013924-3-ross.burton@arm.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 4 Nov 2020 11:48:05 -0800
Message-ID: <CAJ86T=VuUjZzWwetPZsQYmFMDDJ9VtDqfqP9mbGGx024ktfzoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] setuptools3: use DEPENDS_append instead of +=
To: Ross Burton <ross@burtonini.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2020 at 4:12 AM Ross Burton <ross@burtonini.com> wrote:
>
> To help people who inherit setuptools3 and then assign DEPENDS with =.

It looks like there are other classes which could benefit from a
similar fix. Maybe it's good to try to standardise and update all of
them?

> Signed-off-by: Ross Burton <ross.burton@arm.com>> ---
>  meta/classes/setuptools3.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
> index 8ca66ee708e..4e6a9343d77 100644
> --- a/meta/classes/setuptools3.bbclass
> +++ b/meta/classes/setuptools3.bbclass
> @@ -1,4 +1,3 @@
>  inherit distutils3
>
> -DEPENDS += "python3-setuptools-native"
> -
> +DEPENDS_append = " python3-setuptools-native"
> --
> 2.25.1
>
>
> 
>
