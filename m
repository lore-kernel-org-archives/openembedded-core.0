Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2221.1794960444936428573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qA7NV27Z;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3acec6677so660604c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 16:07:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794960444; cv=none;
        d=google.com; s=arc-20260327;
        b=pgNo1SdcC2lsU/XDQl/pm1VoiXhD8G+S3Ai6oMAudoJCjsYKzdaEdOMNdt2cguSwVm
         0Hd8EajcWyETHQ7ZTnR9mY6VpR3Sk88xpjJt9laYrsK9KiPamWR6ylOPPg8fz4Jz5X57
         iChgPQKHgMhLf10OOOhkjFyqKW6ZPvu3ytdnxQWEfgQI1dgMwAngP3Cw4BrMB17FWu9r
         63dlu48ED7evT1K4SCPrIyftqTGLCxq2m0Uro6XfMBSfaDAFpmFx3wy3QQijqukkg7hi
         cxDUBX2QO67YP5gAx6OKCa4Vg7I0yhVxV8XhZ7dkk/A90udtr+qQNuCunei4Ba5mvUKa
         SPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kk7VBawG4zmL9Usg3nrOLuvU7avB3XTBpJXfkB5DXtE=;
        fh=srfrS0oyusEsmm2WC6IXuO7AnSd3U8HR5dQ88Xv8kQ8=;
        b=rHxKl8wJUvis7IvLMJaKjGAY9DdWNNSOHe9tGuz0nY6nedUaensyTgH+/fnYqTSB7Y
         N/UHzIjNDyBSiobfUYWEpV6OzAxSAuOf6+QNj71CpH9L8Hz7Jc5xaNDcGkJqWtey0Ef5
         FzUJsAkaDfA0OmMRgyrczd0wx5iJHqKnrTPfCyMytL70AuR8LFXAUp5hnmSZUTve1cDK
         ssah+zirD/zXryN+U0TbWZV4uyiFqQ6lJ9A7eRcFOTeK/aktVKioVjJR/jpWehd13FQp
         Y/tNapiXuen5Or6yPDvfOzEIwRbVJ7qSiiT2tajtimp8HJCKkPtjNH1lmdrIBZSR1vNz
         VODg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960444; x=1795565244; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kk7VBawG4zmL9Usg3nrOLuvU7avB3XTBpJXfkB5DXtE=;
        b=qA7NV27ZsFEFZCfqKcB2RP9cBwQlrVEd7FBGHizWAMk39Jj/pie8liYkjzHwZyk042
         nK2JOkQKwLgWb4cpi9+R8x8fXAln3tHIgqR7Vbjra2zxIPFOzbjAMoXCOKN1NvefmGBS
         uC2jR0eNr3szx7hf50zF6rcU+26wx9T/C5PaQiRld4YJQTHN5IrfPAKX4ylOto36TY6+
         ymGOgEvbUlA/8CZV9wr+EYWROu6QwDtz2OuAXq1DrjIxEodvHO1skXtFsdd1BfdGJwai
         bGlBGbohyO2Z0hujUts2zFXrT/d02U3OIa5MKvoBbWxCHAL+UAm3OTQrYJ/mPRGkuIBc
         blBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960444; x=1795565244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kk7VBawG4zmL9Usg3nrOLuvU7avB3XTBpJXfkB5DXtE=;
        b=ghZFJrBEHrSx63q/CKixxSjwwLWOd8AdYiDIIhRMoucy9cgfr/RjEBjY3EQDyt+9yL
         uDB/7F+cV/1HGcjGiGx2wufqkjcIGwH0gTuQv6QkGLncynzva7b5iSo55xQMFyahaEAB
         KckUDKPSy/bUySMw82yQcpuAp0/mU6WakMKQ9tyEXML4SuFZJu9M8OB9Zqd9kjO2ojyb
         KGM9cDGw0TmcTpKh9CmhXPFMMmour68Ubg0J+NGBUn1z7UkINHEzIwvzpfnLgiANkvyo
         7Ayfnk0DCrtJZk53V6LNcPCYRmqMfPKRvFEIe94foWLquuG4hjklN/r1EocK+8DgLdYq
         WgbQ==
X-Gm-Message-State: APuU4Z8rSHrQ1iK0+KJ4q5XyaXKb8RuJSisrFgrEt4tUETvcBEiWs8/w
	NTkvqOdQrPDLPLY8QxhikG9/PvJh92YFRZnQtLk6XR5Z44uME3jXs7ANSq6Zhrc93PVvNIaphq0
	gtdfq+YQjGwA2dWsJ7/X5zCM9WXQZys0=
X-Gm-Gg: AZFdTZfGVxwnzjcorPLpjFPFT6RRD2JhLaQL7ljo/JYqtq739lxOuPYNhImi9CuczcT
	J8K07/rER3rXJkG4tqlQY7aVzwP532xrhivLzXdUNzFXvW6nQ10bofTvgoweotoyyL03JtYe9of
	AbTkbOreFfqwqSzb0rv0hTC1AnQPUQRHNaaLbDyN8L45OMaAHkfwFwV5o9npl/3DrfJBDAMSrie
	8n2j+Ocpfhm51tOOCxJGL5mmTzNHwR5Ls1A8jJaRdrHaGLOGO16MXdbM8/ztvY2Al/QmHqKfkp7
	OaKHgETws4OWF9BsyEWfXy8TuycxdGrOGFERtUWBmDTnQUjv35E197okjVBCuRQvzXMyPKZMiwG
	PGU/k1hOD+jPwNbH4sGOY4z/7xfWTFPcaomZqQi7+
X-Received: by 2002:a05:693c:8344:b0:36a:7b3c:4e0a with SMTP id
 5a478bee46e88-38281fe2c53mr939014eec.24.1794960444071; Tue, 17 Nov 2026
 16:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20261002071557.74249-2-jaipaul.cheernam@est.tech>
 <20261117024644.2849146-1-ragaprasanth@gmail.com> <DMXJ1DVWTK13.TBQ9AVC1R0J5@bootlin.com>
In-Reply-To: <DMXJ1DVWTK13.TBQ9AVC1R0J5@bootlin.com>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Wed, 18 Nov 2026 09:06:47 +0900
X-Gm-Features: Aa3M54rXSrOeyBx5c56m_E5csV3U653g2dJfhEv60BG1RdYnSQEqxZhVePN4i2s
Message-ID: <CAG7eodF38_bJX98kkotiRb_244Y=atHhf_joWZhKP9SwUaW0tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libjitterentropy: upgrade 3.6.3 -> 3.7.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, jaipaul.cheernam@est.tech, 
	ross.burton@arm.com
Content-Type: multipart/alternative; boundary="000000000000a7a345066081cb98"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 00:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250503

--000000000000a7a345066081cb98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks for the feedback.

That comment was my own addition to explain why the struct has to be in the
header,
I'll send a v3 that drops the comment and updates the commit message.

Thanks,
Prasanth

On Tue, Nov 17, 2026 at 10:40=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue Nov 17, 2026 at 3:46 AM CET, prasanth via openembedded-core wrote:
> > 3.7.0 locks the collector memory with mlock(), changes the startup to
> > meet NTG.1, replaces the SHA3-256 output with XDRBG-256 and adds
> > jent_status(). LICENSE only changes the copyright year.
> >
> > Two fixes are needed:
> >
> > - 3.7.0 uses C11 threads on Linux and makes struct jent_notime_ctx
> >   private, so rng-tools fails to build. Backport the Linux part of the
> >   upstream fix.
> > - The Makefile now uses -std=3Dc11, which hides clock_gettime() on arm,
> >   mips and riscv. Build with -D_DEFAULT_SOURCE.
> >
> > This picks up Jaipaul Cheernam's earlier upgrade patch [1].
> >
> > [1]
> https://patchwork.yoctoproject.org/project/oe-core/patch/20261002071557.7=
4249-2-jaipaul.cheernam@est.tech/
> >
> > AI-Generated: Uses Claude
> > Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> > ---
>
> Hi Prasanth,
>
> Thanks for the update.
>
> The backported patch is quite different from what we have upstream. I
> can understand this is probably because master evolved and I believe the
> result is fine, but choices could have been described a bit more in the
> commit message.
>
> > --- /dev/null
> > +++
> b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-pthread=
s-on-Linux-and-make-struct-jent_notime_ct.patch
> > @@ -0,0 +1,75 @@
> > +From 1bc2ca956d4c64b765c2f19751614949ebe3734d Mon Sep 17 00:00:00 2001
> > +From: Prasanth R <ragaprasanth@gmail.com>
> > +Date: Tue, 17 Nov 2026 10:12:23 +0900
> > +Subject: [PATCH] Use pthreads on Linux and make struct jent_notime_ctx
> public
> > +
> > +3.7.0 switched Linux to C11 <threads.h> and moved struct jent_notime_c=
tx
> > +out of jitterentropy.h. This breaks callers that install their own
> > +thread handler with jent_entropy_switch_notime_impl(), such as
> > +rng-tools: the start callback no longer takes a pthread start routine,
> > +and the context is an incomplete type.
> > +
> > +Use pthreads on Linux again and define the pthread context in the
> > +public header, as upstream did in commit a038d0c ("threads: always use
> > +pthreads on Linux, add a native Win32 backend"). Only the Linux part
> > +of that commit is taken.
> > +
> > +Upstream-Status: Backport [
> https://github.com/smuellerDD/jitterentropy-library/commit/a038d0c372f83a=
ba10f3850c5b122dc5ff8cdc8c
> ]
> > +Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> > +
> > +---
> > + jitterentropy.h           | 15 ++++++++++++++-
> > + src/jitterentropy-timer.c |  8 +-------
> > + 2 files changed, 15 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/jitterentropy.h b/jitterentropy.h
> > +index f935c09..3ab1ba3 100644
> > +--- a/jitterentropy.h
> > ++++ b/jitterentropy.h
> > +@@ -154,10 +154,23 @@ extern "C" {
> > + #endif
> > + #endif
> > +
> > +-#if defined(__MINGW32__) || defined(__APPLE__) || defined(__OpenBSD__=
)
> || defined(__FreeBSD__) || defined(__NetBSD__)
> > ++#if defined(__MINGW32__) || defined(__APPLE__) || defined(__OpenBSD__=
)
> || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__linux__)
> > + #define JENT_PTHREAD
> > + #endif
> > +
> > ++#ifdef JENT_PTHREAD
> > ++#include <pthread.h>
> > ++/*
> > ++ * Context handed to the jent_notime_thread handlers. It is part of
> the API:
> > ++ * a caller that installs its own handler with
> > ++ * jent_entropy_switch_notime_impl() has to create and join the threa=
d.
> > ++ */
>
> Where does this comment come from? I can't see that in the original
> commit, nor anywhere in master commit?
>
> > ++struct jent_notime_ctx {
> > ++    pthread_attr_t notime_pthread_attr;     /* pthreads library */
> > ++    pthread_t notime_thread_id;             /* pthreads thread ID */
> > ++};
> > ++#endif
> > ++
> > + /* Forward declaration of opaque value */
> > + struct rand_data;
> > +
> > +diff --git a/src/jitterentropy-timer.c b/src/jitterentropy-timer.c
> > +index 77f732e..2c974f5 100644
>
> Again, I believe the overall result is fine: we are just moving a
> structure here.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000a7a345066081cb98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr">Hi Mathieu,<br><br>Thanks for the=
 feedback.<br><br>That comment was my own addition to explain why the struc=
t has to be=C2=A0in the header,<br>I&#39;ll send a v3 that drops the commen=
t and updates the commit message.<br><br>Thanks,<br>Prasanth</div></div></d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Nov 17, 2026 at 10:40=E2=80=AFPM Mathieu D=
ubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathi=
eu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue Nov 17, 2026 at 3:46 AM CET, prasanth vi=
a openembedded-core wrote:<br>
&gt; 3.7.0 locks the collector memory with mlock(), changes the startup to<=
br>
&gt; meet NTG.1, replaces the SHA3-256 output with XDRBG-256 and adds<br>
&gt; jent_status(). LICENSE only changes the copyright year.<br>
&gt;<br>
&gt; Two fixes are needed:<br>
&gt;<br>
&gt; - 3.7.0 uses C11 threads on Linux and makes struct jent_notime_ctx<br>
&gt;=C2=A0 =C2=A0private, so rng-tools fails to build. Backport the Linux p=
art of the<br>
&gt;=C2=A0 =C2=A0upstream fix.<br>
&gt; - The Makefile now uses -std=3Dc11, which hides clock_gettime() on arm=
,<br>
&gt;=C2=A0 =C2=A0mips and riscv. Build with -D_DEFAULT_SOURCE.<br>
&gt;<br>
&gt; This picks up Jaipaul Cheernam&#39;s earlier upgrade patch [1].<br>
&gt;<br>
&gt; [1] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patc=
h/20261002071557.74249-2-jaipaul.cheernam@est.tech/" rel=3D"noreferrer" tar=
get=3D"_blank">https://patchwork.yoctoproject.org/project/oe-core/patch/202=
61002071557.74249-2-jaipaul.cheernam@est.tech/</a><br>
&gt;<br>
&gt; AI-Generated: Uses Claude<br>
&gt; Signed-off-by: Prasanth R &lt;<a href=3D"mailto:prasanth.r@lineo.co.jp=
" target=3D"_blank">prasanth.r@lineo.co.jp</a>&gt;<br>
&gt; ---<br>
<br>
Hi Prasanth,<br>
<br>
Thanks for the update.<br>
<br>
The backported patch is quite different from what we have upstream. I<br>
can understand this is probably because master evolved and I believe the<br=
>
result is fine, but choices could have been described a bit more in the<br>
commit message.<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libjitterentropy/libjitterentropy/0001-Use-=
pthreads-on-Linux-and-make-struct-jent_notime_ct.patch<br>
&gt; @@ -0,0 +1,75 @@<br>
&gt; +From 1bc2ca956d4c64b765c2f19751614949ebe3734d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Prasanth R &lt;<a href=3D"mailto:ragaprasanth@gmail.com" target=
=3D"_blank">ragaprasanth@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 17 Nov 2026 10:12:23 +0900<br>
&gt; +Subject: [PATCH] Use pthreads on Linux and make struct jent_notime_ct=
x public<br>
&gt; +<br>
&gt; +3.7.0 switched Linux to C11 &lt;threads.h&gt; and moved struct jent_n=
otime_ctx<br>
&gt; +out of jitterentropy.h. This breaks callers that install their own<br=
>
&gt; +thread handler with jent_entropy_switch_notime_impl(), such as<br>
&gt; +rng-tools: the start callback no longer takes a pthread start routine=
,<br>
&gt; +and the context is an incomplete type.<br>
&gt; +<br>
&gt; +Use pthreads on Linux again and define the pthread context in the<br>
&gt; +public header, as upstream did in commit a038d0c (&quot;threads: alwa=
ys use<br>
&gt; +pthreads on Linux, add a native Win32 backend&quot;). Only the Linux =
part<br>
&gt; +of that commit is taken.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/smuellerDD/j=
itterentropy-library/commit/a038d0c372f83aba10f3850c5b122dc5ff8cdc8c" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/smuellerDD/jitterentro=
py-library/commit/a038d0c372f83aba10f3850c5b122dc5ff8cdc8c</a>]<br>
&gt; +Signed-off-by: Prasanth R &lt;<a href=3D"mailto:prasanth.r@lineo.co.j=
p" target=3D"_blank">prasanth.r@lineo.co.jp</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + jitterentropy.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++=
+++++++-<br>
&gt; + src/jitterentropy-timer.c |=C2=A0 8 +-------<br>
&gt; + 2 files changed, 15 insertions(+), 8 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/jitterentropy.h b/jitterentropy.h<br>
&gt; +index f935c09..3ab1ba3 100644<br>
&gt; +--- a/jitterentropy.h<br>
&gt; ++++ b/jitterentropy.h<br>
&gt; +@@ -154,10 +154,23 @@ extern &quot;C&quot; {<br>
&gt; + #endif<br>
&gt; + #endif<br>
&gt; + <br>
&gt; +-#if defined(__MINGW32__) || defined(__APPLE__) || defined(__OpenBSD_=
_) || defined(__FreeBSD__) || defined(__NetBSD__)<br>
&gt; ++#if defined(__MINGW32__) || defined(__APPLE__) || defined(__OpenBSD_=
_) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__linux__)<br>
&gt; + #define JENT_PTHREAD<br>
&gt; + #endif<br>
&gt; + <br>
&gt; ++#ifdef JENT_PTHREAD<br>
&gt; ++#include &lt;pthread.h&gt;<br>
&gt; ++/*<br>
&gt; ++ * Context handed to the jent_notime_thread handlers. It is part of =
the API:<br>
&gt; ++ * a caller that installs its own handler with<br>
&gt; ++ * jent_entropy_switch_notime_impl() has to create and join the thre=
ad.<br>
&gt; ++ */<br>
<br>
Where does this comment come from? I can&#39;t see that in the original<br>
commit, nor anywhere in master commit?<br>
<br>
&gt; ++struct jent_notime_ctx {<br>
&gt; ++=C2=A0 =C2=A0 pthread_attr_t notime_pthread_attr;=C2=A0 =C2=A0 =C2=
=A0/* pthreads library */<br>
&gt; ++=C2=A0 =C2=A0 pthread_t notime_thread_id;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0/* pthreads thread ID */<br>
&gt; ++};<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; + /* Forward declaration of opaque value */<br>
&gt; + struct rand_data;<br>
&gt; + <br>
&gt; +diff --git a/src/jitterentropy-timer.c b/src/jitterentropy-timer.c<br=
>
&gt; +index 77f732e..2c974f5 100644<br>
<br>
Again, I believe the overall result is fine: we are just moving a<br>
structure here.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000a7a345066081cb98--
