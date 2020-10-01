Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.8466.1601544129066945838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 02:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b938hErp;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id z13so5827824iom.8
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 02:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p9P89KV0/f6fQ5zdLjtNLLixh2mpYGooozU0dJFcxds=;
        b=b938hErpkminqE32fzvsrvEmMTJKDpwsrrwRLHDzSD9FHR5kXm8eZW6wbIZVJhcDIX
         rtYQPl+2EjF310xEByExWqaz/EkmrmD5kPE/2e9A2I/+5bFJ3vUcD9CfBRbZzq+HwBHn
         C2krNNpNMF0QZr8gUZolIQCYnZ1YCT3xAn9uVK98ull417YIMdwAejZBiqMaLHtuF2eu
         vzc8kB2bLY0j3lAuuYhggJbdPhPB+ZUe3MlgLx38uuNKrT5OnTOw2SjlHmKZCTlD7OUC
         2YLYs8L9evZEFsIKJepnu6oW1zRPNgvIlo9Z+STOIxT6wjy/wUZJbAJzD9z8p2fuUsKo
         UjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p9P89KV0/f6fQ5zdLjtNLLixh2mpYGooozU0dJFcxds=;
        b=eb6mVgI9nEobY4ImLdh+mXswToqXGaOH+AOjyoo4iEQt5dBKw9jSSERKl7hxWCIiZC
         aeY1UC0MzFw8ZpQ8y866/lsN3gC7vOFaSn/aQbIq+p8V7/mrhMWTeDMepIB5SfeXYNrc
         kbByaJ1IB5I46Jk+tAWSlEazBsEv6RpqbQ4XaGbCZZWRygEF4tEU3tTenkISa+DyXlIf
         e30ohijVregHHNzPbBCdhaT47l2jbS4vLNDVU6snzoybaB8T7QGpzSOROrwcp4kX9T0Y
         zVlP1QNw1eHhaHGZio7UquH3r0zeDX/jjVp0Bi89z3C4d3qFbzZ7EQyXpZIqM38BcS6l
         IJ7g==
X-Gm-Message-State: AOAM530dBTnYiV9J0yYLBl6K85Hcl6ZXPiCgTLoDN+p01XBVYc+HR7bH
	gop3q9MsFg6RXFvxu0YBCT+93JFS3zlYhkmRNj8=
X-Google-Smtp-Source: ABdhPJxzdi9y8PCkF9B3MpjL7yxF/v1YOAwORIdK+1TW5RN/ubMY3owSZGj7NPGFQMh0L3ah77LsuSwc0U4oFRZESZM=
X-Received: by 2002:a5d:9355:: with SMTP id i21mr4588250ioo.199.1601544128274;
 Thu, 01 Oct 2020 02:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200930150545.3882859-1-ayaka@soulik.info> <CANNYZj85ymSHGvm5E7Axtrs6B6-V4nQGCFzcCVJKCM0=wsPtkg@mail.gmail.com>
 <34ad6791-d6db-4f37-a804-36df55b3472e@soulik.info>
In-Reply-To: <34ad6791-d6db-4f37-a804-36df55b3472e@soulik.info>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 1 Oct 2020 11:21:57 +0200
Message-ID: <CANNYZj_o=iZkZc51088ACJXGkDFeaCTCxGoETzCakh3HJZ-snA@mail.gmail.com>
Subject: Re: [PATCH] meson: add sysroot property
To: ayaka <ayaka@soulik.info>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dba32e05b0988c70"

--000000000000dba32e05b0988c70
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2020 at 06:15, ayaka <ayaka@soulik.info> wrote:

> It is the nativesdk meson has this problem, that is what cross build
> requests for.
>
> You can try the Intel MediaSDK, I reported this issue to Gstreamer for
> this but it comes to the issue of OE.
>
> Or you mean the native meson for the target system ? I don't think they
> need a cross build file.
>

native meson does use a cross file when building target packages, and
things work without sysroot property, including using pkg-config:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/meson.bbclass

So I worry that your patch is fixing a symptom and not the problem.

Alex

--000000000000dba32e05b0988c70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 1 Oct 2020 at 06:15, ayaka &lt;<a=
 href=3D"mailto:ayaka@soulik.info">ayaka@soulik.info</a>&gt; wrote:<br></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">It is the nativesdk meson has this problem, that is what cross build <b=
r>
requests for.<br>
<br>
You can try the Intel MediaSDK, I reported this issue to Gstreamer for <br>
this but it comes to the issue of OE.<br>
<br>
Or you mean the native meson for the target system ? I don&#39;t think they=
 <br>
need a cross build file.<br></blockquote><div><br></div><div>native meson d=
oes use a cross file when building target packages, and things work without=
 sysroot property, including using pkg-config:</div><div><a href=3D"http://=
git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/meson.bbclass">ht=
tp://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/meson.bbclas=
s</a></div><div><br></div><div>So I worry that your patch is fixing a sympt=
om and not the problem.</div><div><br></div><div>Alex<br> </div></div></div=
>

--000000000000dba32e05b0988c70--
