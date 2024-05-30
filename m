Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DF0C27C43
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 15:24:07 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.12349.1717082638551762348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 08:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=DligFPC4;
 spf=pass (domain: snapchat.com, ip: 209.85.167.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52a6ef5e731so1572413e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 08:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717082636; x=1717687436; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=phxbDoF/OTXt3d+hsKIvj3GEHk48SMbE4s67IgSW3PM=;
        b=DligFPC4fM+1dXXdytBNMlHpxKJw+DEOVWS8rk1y9TOMoikentbd/bE6YenWQpQgXF
         4xP7+WrClPUjBqMqs2mDVumH7uf/V4a0QHGCSgTMn7WNK5WCajYvEJOrVKaMUJOG+Btf
         Tj2Y2d6uvHbhMJ+GqKB80r8FRRfdLTytFTgIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717082636; x=1717687436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phxbDoF/OTXt3d+hsKIvj3GEHk48SMbE4s67IgSW3PM=;
        b=Vixkc7MPXd+9laf4oK6uAFY9CFUSRq3j46MPSnn2cvyWDRlPIpwYU+IvrvJDNk3gpl
         uVbtQLJPXBlSgWUc0o+rf3iZkli7zaorqXopvo9D5S4i/N6QIJXC4BADWUaoQudwNfSO
         BMv6QS3fVk4B66NkqiSX97hXEWxfz8WqjPxPo1YFr0N9upDCPTTHG0Zf8K+4ZnZ4EFoC
         hYSi1KnsfUrHbXy2UVX758erdk8QO3nWSwbVVcCeJ+vZB940ZF23LnvwddFTG7pJe83D
         cjpuNmMucbAyPSlSLV8E9iHa/Ac3V9m+Q19KdgzOAV4qwspjv1wkqV6syHlQgn6IA8jH
         1mcA==
X-Gm-Message-State: AOJu0YzHWZizKyPHWsts2Uar1bhPetyLS1abnw9x20gw9/JY+VZLXLHX
	JIemoPZdiVnGsMCY2tC4TXWziKSf3ubFHTzvtgGkdRfdj/l7MdjbSLCXntW0B/PqAicVKHk7pLF
	PXRASaxHi4R4oC/VxhMl6/prrKA6nfsZDFgswxg==
X-Google-Smtp-Source: AGHT+IFyMaxqI3OX+G+FI0rafHJzCIGbj1SfiuR3JJh6tKi408nLirz9a3R4/yfmsEXmCcyL03/iL/4fJfmLJfHHrfM=
X-Received: by 2002:ac2:54a4:0:b0:529:b634:bed1 with SMTP id
 2adb3069b0e04-52b7d48c4cfmr1560176e87.58.1717082636392; Thu, 30 May 2024
 08:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240529100853.1162640-1-ecordonnier@snap.com> <80be0806edba87cb67f7f5711fb9c83516fb860d.camel@linuxfoundation.org>
In-Reply-To: <80be0806edba87cb67f7f5711fb9c83516fb860d.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 30 May 2024 17:23:45 +0200
Message-ID: <CAHUKmYbN9=2dML4_zZPhERNnkMuEPcFdijoXAeDSrYvW1sPAbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: fix regression in minidebuginfo test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000098168a0619ad74eb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 15:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200026

--00000000000098168a0619ad74eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
I thought it was OK because systemd requires usrmerge, but I've sent a new
version of the patch using "env sleep" instead of "/usr/bin/sleep" in order
to be safe. I hope this also fixes the test failure which was happening on
CI.
One reason this could be failing in CI is that this functionality currently
requires user-namespaces enabled in the kernel (e.g. core-image-sato does
have CONFIG_USER_NS, thus it works with this image). This is not really by
design, and I'm working on changing this in the upstream systemd:
https://github.com/systemd/systemd/pull/33043 . I can then backport this on
scarthgap if the change is merged upstream.

=C3=89tienne

On Wed, May 29, 2024 at 4:54=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2024-05-29 at 12:08 +0200, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > The builtin command "sleep" was getting executed instead of the busybox
> binary.
> > Hence "pidof sleep" was empty and the test was failing.
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  meta/lib/oeqa/runtime/cases/systemd.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/systemd.py
> b/meta/lib/oeqa/runtime/cases/systemd.py
> > index 5481e1d840..a2229848e7 100644
> > --- a/meta/lib/oeqa/runtime/cases/systemd.py
> > +++ b/meta/lib/oeqa/runtime/cases/systemd.py
> > @@ -145,7 +145,7 @@ class SystemdServiceTests(SystemdTest):
> >          Verify that call-stacks generated by systemd-coredump contain
> symbolicated call-stacks,
> >          extracted from the minidebuginfo metadata (.gnu_debugdata elf
> section).
> >          """
> > -        t_thread =3D threading.Thread(target=3Dself.target.run,
> args=3D("ulimit -c unlimited && sleep 1000",))
> > +        t_thread =3D threading.Thread(target=3Dself.target.run,
> args=3D("ulimit -c unlimited && /usr/bin/sleep 1000",))
> >          t_thread.start()
> >          time.sleep(1)
>
> I get a bit nervous about hardcoding paths like "/usr/bin",
> particularly in the context of some distros liking to move things
> around. We may want to put a shutil.which("sleep") call in instead (and
> an import shutil if needed)?
>
> Cheers,
>
> Richard
>
>

--00000000000098168a0619ad74eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>I thought it was OK because systemd require=
s usrmerge, but I&#39;ve sent a new version of the patch using &quot;env sl=
eep&quot; instead of &quot;/usr/bin/sleep&quot; in order to be safe. I hope=
 this also fixes the test failure which was happening on CI.<br>One reason =
this could be failing in CI is that this functionality currently requires u=
ser-namespaces enabled in the kernel (e.g. core-image-sato does have CONFIG=
_USER_NS, thus it works with this image). This is not really by design, and=
 I&#39;m working on changing this in the upstream systemd:=C2=A0<a href=3D"=
https://github.com/systemd/systemd/pull/33043">https://github.com/systemd/s=
ystemd/pull/33043</a> . I can then backport this on scarthgap=C2=A0if the c=
hange is merged upstream.<br><br>=C3=89tienne</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 29, 2024 at 4:54=
=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Wed, 2024-05-29 at 12:08 +02=
00, Etienne Cordonnier via <a href=3D"http://lists.openembedded.org" rel=3D=
"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; The builtin command &quot;sleep&quot; was getting executed instead of =
the busybox binary.<br>
&gt; Hence &quot;pidof sleep&quot; was empty and the test was failing.<br>
&gt; <br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oeqa/runtime/cases/systemd.py | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/ru=
ntime/cases/systemd.py<br>
&gt; index 5481e1d840..a2229848e7 100644<br>
&gt; --- a/meta/lib/oeqa/runtime/cases/systemd.py<br>
&gt; +++ b/meta/lib/oeqa/runtime/cases/systemd.py<br>
&gt; @@ -145,7 +145,7 @@ class SystemdServiceTests(SystemdTest):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Verify that call-stac=
ks generated by systemd-coredump contain symbolicated call-stacks,<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extracted from the mi=
nidebuginfo metadata (.gnu_debugdata elf section).<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;<br=
>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t_thread =3D threading.Thr=
ead(target=3Dself.target.run, args=3D(&quot;ulimit -c unlimited &amp;&amp; =
sleep 1000&quot;,))<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t_thread =3D threading.Thr=
ead(target=3Dself.target.run, args=3D(&quot;ulimit -c unlimited &amp;&amp; =
/usr/bin/sleep 1000&quot;,))<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t_thread.start()<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 time.sleep(1)<br>
<br>
I get a bit nervous about hardcoding paths like &quot;/usr/bin&quot;,<br>
particularly in the context of some distros liking to move things<br>
around. We may want to put a shutil.which(&quot;sleep&quot;) call in instea=
d (and<br>
an import shutil if needed)?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000098168a0619ad74eb--

