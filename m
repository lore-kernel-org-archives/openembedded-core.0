Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.9304.1586175616687470068
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 05:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jMKPP004;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id a5so12526227qtw.10
        for <Openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=INPPoRLRUtu+wA4PUu9iSk7iqDOMF5ZE84uqoxsRrXk=;
        b=jMKPP004sMcVk6ulr5eqs/4oI7pLJtD6K8u4RDNBJGInKhoh1c1ipg1FJO+6AZw6nG
         Rf0sWI+GwZmrWbcA6SkjwjG4llQbwA7UeMwxJ86rC4XxiV7CvX8JhGzkPfJQ73JWLuvS
         NUZ1ajEmZgK8VXvA6n4frnysOmuappNy162A1E+PRVrC9NhpoHlOuFgexFplL1PbKnDF
         Ajtcx7ghC726yOAxtPpn20FzpwpcgfFVhgRQll0YWKhFvkuKatCOvByjPC3X6a93+28u
         pFg1X1B9rTLFsz77+WjBjyIBVC26DVFY4OhQtUxpL77pXZCcY89MyOAYnZrmNc1v1EsJ
         ckxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=INPPoRLRUtu+wA4PUu9iSk7iqDOMF5ZE84uqoxsRrXk=;
        b=ERB3c6PmwQVFLKjC9IEV3Emq1ff6f9QFXeRUiYuHgyP2aNoSJw5Xd+8tUdSFv5JPKy
         EtLBdHaFXvLQnzyOFKZjkG1AvrM2zUEBk+DNVYR9L9vOF38mjlwvQlwV3FQKwe4SBcdz
         20160N8mNzVNQF3VGb5driAkvVExRX6gxRmk9jxhd+YFVpbwC1LWgDye69DgojZHl9QI
         UUi5HqaSxHpqn7fb/31NmXv86n0WMlyYJ3RNE5B7B5eK5wLw3Rwuex8p0c/3TcFH8iXw
         b+86FTlxjnp030P4Tdprns2KSwaRAPwSeroy8aDL6X4stVA7i4cH4HyYAYAMmKAI2QPw
         e8eg==
X-Gm-Message-State: AGi0PuYG5NulaW08lR98CufTYGe8ClMICKiRxAOtu6RpDaW1Q/NKgbDr
	d4goRLQVlIj0frayMp4NAN9hsM5cMa88hXxybPg=
X-Google-Smtp-Source: APiQypJ4EK54q/sSdxvpyXMvhsKVHhL1nzOcVnyZBRNBLCKXLC1plfK+LDLR97D0vdd4T1X+Q3vi8L8A+O5fNjtb6XA=
X-Received: by 2002:ac8:1b97:: with SMTP id z23mr8342475qtj.294.1586175615678;
 Mon, 06 Apr 2020 05:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVyxL9c3x0z9cv6EYads+LGeYL4ccwFbnnvyA_gkx9MXg@mail.gmail.com>
 <CANNYZj8uEXS9GwmZj4rONX_FodL1J8Wj0VKcL6v77pco8rEAEA@mail.gmail.com>
In-Reply-To: <CANNYZj8uEXS9GwmZj4rONX_FodL1J8Wj0VKcL6v77pco8rEAEA@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 6 Apr 2020 17:50:04 +0530
Message-ID: <CANUMPcWxfvpZ3OVgaRiphqGsob6zEq96nd4Yu0PMoqjEeBvGZQ@mail.gmail.com>
Subject: Re: [OE-core] librsvg-2.46.4 recipe build failure.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"

I confirmed by below steps,

If we consider only  "inherit cargo gettext" in librsvg-2.46.4.bb
run.do_compile contain "cargo_do_compile".

When we use  gnomebase as  "inherit cargo gettext gnomebase" librsvg
run.do_compile generated with "autotools_do_compile" in it and it
comes through autotools.bbclass

Regards,
Vinay

On Mon, Apr 6, 2020 at 1:58 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> The upstream tree still uses auto tools for the build, so the issue you are seeing is probably caused by something else?
>
> Ale
>
> On Mon 6. Apr 2020 at 9.00, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Hi,
>>
>> Regarding, https://github.com/meta-rust/meta-rust/issues/264
>>
>> As per my analysis the
>> "openembedded-core/meta/classes/autotools.bbclass" inherited through
>> "openembedded-core/meta/classes/gnomebase.bbclass" from  seems to be
>> overriding the "meta-rust/classes/cargo.bbclass" from meta-rust.
>>
>> $cat openembedded-core/meta/classes/gnomebase.bbclass
>>
>> GNOMEBASEBUILDCLASS ??= "autotools"
>> inherit ${GNOMEBASEBUILDCLASS}  pkgconfig
>>
>> The "librsvg" configure  and compile  scripts in "temp" directory
>> contains "autotools_do_compile" with "inherit cargo", it should be
>> "cargo_do_compile".
>>
>> Reference:
>> "bitbake rust-hello-world" builds without any error ( with "inherit cargo").
>>
>> Is there any way to disable "autotools" for "gnomebase.bbclass"
>> through "librsvg-2.46.4.bb"  ?
>>
>> Regards,
>> Vinay
>> 
