Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.1906.1589410131354744479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 15:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XzutnDgq;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id l25so835985vso.6
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 15:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GgOygIHmfnUNkTFOqhiueRnBO4Dk8nICiPmMg2jyvyM=;
        b=XzutnDgqWXckxS0RGjT5aJLURxXqs42CPHkJpcPDfuPaSo7TC72TJqTZDowzN5ajF2
         0PUBjuaor3dA3w4m3OFjk0ocF+0DW7LUur9Q/5A2BH3ishDgYvxbx0htYFMGzAsKXndb
         T2gsoChuGkHn/2Ur52sIGftKILby26TxVG0Z4P8uuvsZJQq3yMs7EpwkqvnCsJNXU517
         kzO2BWY6f2Zrq4oKhZadlbL3ZVawzRSoFXqAKhKWGXIPv+0Hji8qAjN6bX2jjYtEDugV
         RjTtZmyJ16AsjxloNx6fdc8S+NHKZ19erqArCmL9dzsPYyFNx3yRzPQyrjH/CbcXswna
         AZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GgOygIHmfnUNkTFOqhiueRnBO4Dk8nICiPmMg2jyvyM=;
        b=SH+shnweZLYSxvfbNegAWoFe2EF7fPFO4q5tMsXRYAD3/k3hTXVWQDlRKPySXnr5AB
         8TtH8MSMMT9ehlFje7GXHy6B3EVnmF5vtoEVKBY0yWhPzBbj8Mcsy3d6nyc/CDeiXW/f
         p3M5xRKehBQXX/TQiY6iRrjDryuntqGegjtfpmkeIAjYnJwdm1YCoGiAjckzQgvOJSW/
         jZdcj2PMbJsTfWEF9JVwwLQLPrnUi0ANUPVCb8wp8oiF/We8sqo58TT1QZWLkVk9Nd8T
         L6NN/2IV/X0n9RcziE3s+aiS1x5TI363EVx4ruGUlgh9gmrxt2pubbQp8rTuOHqtcBXq
         8Dsg==
X-Gm-Message-State: AOAM533NBVWdjoskGGjL1uDCIovesQZuYwBw3qApcd0ylzvYGeZAsFE1
	ee5GjkJrXXQTaVOpvG3Y7zcdPfhT5UuSPj9mqjs=
X-Google-Smtp-Source: ABdhPJw/wSkS8nZQWbAXUsgnf6fXL3QNZV888idLtfvW3s7oXVSioxfa3DyqhoQtMdAYP5zvvO6/7APJdwdLSm9+OXI=
X-Received: by 2002:a67:fd42:: with SMTP id g2mr1355463vsr.130.1589410130023;
 Wed, 13 May 2020 15:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200512214255.20678-1-pkj@axis.com> <CAJ86T=U-0v06iC5wm8opzJSO5a7k8a_a_NncF4N5ep6BwnBGTw@mail.gmail.com>
 <12d3b34c48784a218feef04fbc1463e4@XBOX03.axis.com> <CAJ86T=Wf5n_PqiB9X8fYjdyYMwh=WakmVHjMfCVETKec4peZbA@mail.gmail.com>
 <764c9a365a510d22a5df20e4e510c4e9e4ab633b.camel@linuxfoundation.org>
In-Reply-To: <764c9a365a510d22a5df20e4e510c4e9e4ab633b.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 13 May 2020 15:48:38 -0700
Message-ID: <CAJ86T=X5=DGSw30e3os8bm=T5V6UXHMhLGPjB=xykyqjY-ijog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] file: Remove unneccessary override of PACKAGECONFIG for native
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 13, 2020 at 2:31 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2020-05-13 at 12:30 -0700, Andre McCurdy wrote:
> > Yes. Unfortunately making recipes robust for users who want to change
> > PACKAGECONFIG values doesn't seem to be a high priority for oe-core.
> > Why else would default PACKAGECONFIG values be assigned with ??=
> > instead of ?= other than as a trap for new users?
>
> I'm not sure I understand that, equally I'm tired so I'll assume I'm
> just missing something.
>
> I will say that there is no intention to make OE-Core hard to use or
> not robust, its only as good a the people contributing make it. In this
> case I'm not sure I understand/see the problem.
>
> If we should be using ?= instead of ??= then I'm open to an explanation
> why and patches to improve things.

If the default is assigned with ??= then trying to add to it with +=
results in the default value being lost. If the default is assigned
with ?= then adding to it with += works as expected.

To robustly enable a new PACKAGECONFIG option, users need to learn to
use PACKAGECONFIG_append (and obviously learn about the leading space
requirement there too) and not to try PACKAGECONFIG +=.

The reference manual does at least have an example which uses _append.
However it doesn't mention that += isn't safe or that _append will
affect native(sdk) and therefore _append_class-target is the safest
approach.

> Unfortunately we do have quite some legacy and ??= vs ?= has been
> troublesome in the many different contexts we have (recipe, class,
> conf, inc and so on).
