Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web09.2157.1614540096606867866
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J6qzNqLS;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id i27so799212vkp.9
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2op1/WycYsuaOaRIrUZw/fB6I0S1ZoNzwuPwZphbq6g=;
        b=J6qzNqLSQp2RPg9eBLfKa8k8NG5AcvfQwQI6QmHh/l4WJX5J5euWEZK4q1XlxP6i7T
         IefBfeBXswlm/Q/+hs6lZ5OIwbSishPuYd+Iukg7f7nE9yb96oXvHxpEyGI+W00XF+Sn
         TtWjT+9LcCMQLWRHxkCvYqG23FauXkkhU3KEjWqP2w7+fFIZtreUn08NCGRIBjxjKyG/
         fF/x6uUR/j4Gfx7p6gbHPLRRsl9qwvGde1u8omvUEvlXM0eBEo3ectaiHnUCmdSd8m9q
         RzuvU5eZC26zsdaks1A8zHdJoxrD7b73EjMjeso0UotIvT05vgrMnE/vfdPeJR+tUPza
         13LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2op1/WycYsuaOaRIrUZw/fB6I0S1ZoNzwuPwZphbq6g=;
        b=StNwqCkbnh9O/D1rQEnNOUeHVfeN6QhZOlJWyXqK6MtcowX6bjiRzZl8rFH5BO8SEu
         1fMK2AjqV5M9QKdEtRyjS6Z3MG6tJmqS9mGquifKYZbc0LHygniDG9Q3J7dWaBlU4Gn3
         Q1BfnbFbT+kZDZjgEdx2MlD9Kg668VS2aEYW2zTuGz5HnbbrYGFM1IpW1wiVUBPFoXeM
         Aex/amKmQozdj9Ie93FoRvd1hWLB1n/uqLxEUJ+fo/lq00iCmoyuN+iJxnBD02g0U+NK
         Rdw6NdVJGCxk0Nv9OQBB1k2vx6b24bRCPZ96otVwe8pmA+Cm64N1ThW4Gh3F/PAYkrBj
         yDxA==
X-Gm-Message-State: AOAM532dRHiF3zkiQ28KUsK1ulnVJJnk7Hp8gMNLG6LgvZlvIRkhSn8g
	fbNXvycwcOYITY3ydu9gJW4sq9atFBxd9BGs3uQ=
X-Google-Smtp-Source: ABdhPJxTL8HiAOW9jirTYxJUkBcvTk2Z9tcSmMSmCTWkgMQZPgNMeQBBz/Z5d5rZh0/19uYR6y2Uax/aYZdymYpeBCA=
X-Received: by 2002:a1f:c786:: with SMTP id x128mr6397456vkf.10.1614540095612;
 Sun, 28 Feb 2021 11:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-22-alex.kanavin@gmail.com> <ec22836e-0dd1-1238-d49a-2871b507b697@gmail.com>
In-Reply-To: <ec22836e-0dd1-1238-d49a-2871b507b697@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 28 Feb 2021 20:21:24 +0100
Message-ID: <CANNYZj9gTX1MRR0WVnp3ZvCB18z616PVWyb0f+asziuWv6_w4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 22/24] scripts/lib/wic/partition.py: do not set FAT size
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dfe8b005bc6a6886"

--000000000000dfe8b005bc6a6886
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Feb 2021 at 20:16, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 2/28/21 7:37 AM, Alexander Kanavin wrote:
> > Modern dosfstools automatically determines the appropriate size
> > and will error out if something that doesn't make sense is
> > supplied on the command line.
>
> leaving it to tool seem to make it non-deterministic, is there any
> disadvantage of using a manual fallback default
>

It is fully deterministic and depends on the filesystem size. Also it's an
internal filesystem detail no one cares about as all sizes are nowadays
supported by all FAT drivers.

Alex

--000000000000dfe8b005bc6a6886
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 28 Feb 2021 at 20:16, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
On 2/28/21 7:37 AM, Alexander Kanavin wrote:<br>
&gt; Modern dosfstools automatically determines the appropriate size<br>
&gt; and will error out if something that doesn&#39;t make sense is<br>
&gt; supplied on the command line.<br>
<br>
leaving it to tool seem to make it non-deterministic, is there any <br>
disadvantage of using a manual fallback default<br></blockquote><div><br></=
div><div>It is fully deterministic and depends on the filesystem size. Also=
 it&#39;s an internal filesystem detail no one cares about as all sizes are=
 nowadays supported by all FAT drivers.</div><div><br></div><div>Alex</div>=
<br></div></div>

--000000000000dfe8b005bc6a6886--
