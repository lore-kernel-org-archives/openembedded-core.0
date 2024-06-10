Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEE8C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 16:11:22 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.23599.1718035874577679915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 09:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=BPbPtlqc;
 spf=pass (domain: snapchat.com, ip: 209.85.167.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52bd48cf36bso3281829e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1718035873; x=1718640673; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iQUs+/xmpXi139icRloOYTZAp4dXt+8C3pTgA+OYbDs=;
        b=BPbPtlqcfkNU6RcDUdK0edFaJH0t1WZbo1syHXpzdhrU6YFVPPErMrToOus7rpPTuE
         QuYwEpzmZte8KkoGvKBMzBpjocwbUht1ZQ+CIHQ1UGYhLSSb9UtTnBqf1br82AmIM1nN
         Fz3BE5EDRdSE1ArelZMiCUwIu8yivFF7Iz5SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718035873; x=1718640673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQUs+/xmpXi139icRloOYTZAp4dXt+8C3pTgA+OYbDs=;
        b=itg4Z9RYKADz5QEvI1OKff+ZO4HLfkCpPxLzyB3PlB9WxKO79EWmKnTtCwu/Qafx2r
         UV4/jM/pebyoGy0OFME6oVOUxKOP74hCAlnCKlWacNMAw1X/9/iKGzLP5eE2dNXs0ebP
         nmyF0cRw7H1+kgCcvNsqBFgAzdvfbevlKYVSpwaxWPWupTfgQE2nRy9+erUyR39JzWEK
         oZdgSemCpfELdTPzh1cFfaMP8kQnMZ8YjP8QEcj4cK9AW1ju6JsYAPn+ivbmHpCFS+yp
         jE4fUF8lXfdpiHa79DP0qJksp4rl8sn81mrN7i6dpWmW8XL6Ee3BmWOOxPBcy5eLKZy4
         pu+Q==
X-Gm-Message-State: AOJu0YzLNbR5Or5Q4O7YPvy+iIWO9gltKmVLIgLuTI4UcIbScBtdNTTf
	1z8YDpGSAeujEtjfBENVYwFmo1QHh5jTqUTCWsFofSayv5O3+KT6A5vfLIoq8LzTcu2dROdYciV
	ZnexJN05F4BUP+nnECM3iz2SO/qjpSoWa0hhmbHFrQzSTLKuM
X-Google-Smtp-Source: AGHT+IG5NJhgxvTHqrVY1aYp9WxRi3V/BMbK22iUv3QDWfQsXiXhx8v+VPQ/CQmeIEf9HaNakkJQqbs6LcBwZm06wIU=
X-Received: by 2002:ac2:51d5:0:b0:52c:8a37:6cf4 with SMTP id
 2adb3069b0e04-52c8a376e71mr2371781e87.14.1718035872642; Mon, 10 Jun 2024
 09:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240610123935.2102248-1-ecordonnier@snap.com> <53a06013f89900cf0942eb6dca0962e5ee924b5c.camel@linuxfoundation.org>
In-Reply-To: <53a06013f89900cf0942eb6dca0962e5ee924b5c.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 10 Jun 2024 18:11:01 +0200
Message-ID: <CAHUKmYbOETvMmdV8X63DiE0ZZha_t0tr5c48g+XdVMy887DrQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: fix race-condition in
 minidebuginfo test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e6e7f6061a8b6504"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 16:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200480

--000000000000e6e7f6061a8b6504
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
I sent a second version of the patch which shouldn't be racy. I have
implemented it slightly differently from your suggestion because I think it
is also a bit racy (if we start checking whether systemd-coredump@.service
is running in one thread only after it has already finished processing the
coredump in the other thread, then we'll be stuck in a retry loop until the
overall timeout).

=C3=89tienne

On Mon, Jun 10, 2024 at 2:53=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2024-06-10 at 14:39 +0200, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > Fix this error where 'coredumpctl info' warns that the coredump is stil=
l
> being
> > processed:
> >
> > ```
> > AssertionError: 1 !=3D 0 : MiniDebugInfo Test failed: No match found.
> > -- Notice: 1 systemd-coredump@.service unit is running, output may be
> incomplete.
> > ```
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  meta/lib/oeqa/runtime/cases/systemd.py | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/systemd.py
> b/meta/lib/oeqa/runtime/cases/systemd.py
> > index 80fdae240a..17fa660ace 100644
> > --- a/meta/lib/oeqa/runtime/cases/systemd.py
> > +++ b/meta/lib/oeqa/runtime/cases/systemd.py
> > @@ -155,6 +155,9 @@ class SystemdServiceTests(SystemdTest):
> >          self.target.run('kill -SEGV %s' % output)
> >          self.assertEqual(status, 0, msg =3D 'Not able to find process
> that runs sleep, output : %s' % output)
> >
> > +        # Give some time to systemd-coredump@.service to process the
> coredump
> > +        time.sleep(1)
> > +
> >          (status, output) =3D self.target.run('coredumpctl info')
> >          self.assertEqual(status, 0, msg=3D'MiniDebugInfo Test failed: =
%s'
> % output)
> >          self.assertEqual('sleep_for_duration (busybox.nosuid' in outpu=
t
> or 'xnanosleep (sleep.coreutils' in output,
> >
>
> Specific sleep values like this are a red flag, it all depends on how
> much load systems are under and we've had a lot of problems with these
> kinds of things.
>
> Instead, you should probably detect "systemd-coredump@.service unit is
> running" in the command output and retry if that is the case with an
> overall timeout/error in case it never completes.
>
> Cheers,
>
> Richard
>

--000000000000e6e7f6061a8b6504
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>I sent a second version of the patch which =
shouldn&#39;t be racy. I have implemented it slightly differently from your=
 suggestion because I think it is also a bit racy (if we start checking whe=
ther systemd-coredump@.service is running in one thread only after it has a=
lready finished processing the coredump in the other thread, then we&#39;ll=
 be stuck in a retry loop until the overall timeout).<br><br>=C3=89tienne</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Jun 10, 2024 at 2:53=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Mon, 2024-06-10 at 14:39 +0200, Etienne Cordonnier via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a> wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; Fix this error where &#39;coredumpctl info&#39; warns that the coredum=
p is still being<br>
&gt; processed:<br>
&gt; <br>
&gt; ```<br>
&gt; AssertionError: 1 !=3D 0 : MiniDebugInfo Test failed: No match found.<=
br>
&gt; -- Notice: 1 systemd-coredump@.service unit is running, output may be =
incomplete.<br>
&gt; ```<br>
&gt; <br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oeqa/runtime/cases/systemd.py | 3 +++<br>
&gt; =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/ru=
ntime/cases/systemd.py<br>
&gt; index 80fdae240a..17fa660ace 100644<br>
&gt; --- a/meta/lib/oeqa/runtime/cases/systemd.py<br>
&gt; +++ b/meta/lib/oeqa/runtime/cases/systemd.py<br>
&gt; @@ -155,6 +155,9 @@ class SystemdServiceTests(SystemdTest):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run(&#39;=
kill -SEGV %s&#39; % output)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(stat=
us, 0, msg =3D &#39;Not able to find process that runs sleep, output : %s&#=
39; % output)<br>
&gt; =C2=A0<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Give some time to system=
d-coredump@.service to process the coredump<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 time.sleep(1)<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D =
self.target.run(&#39;coredumpctl info&#39;)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(stat=
us, 0, msg=3D&#39;MiniDebugInfo Test failed: %s&#39; % output)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(&#39=
;sleep_for_duration (busybox.nosuid&#39; in output or &#39;xnanosleep (slee=
p.coreutils&#39; in output,<br>
&gt; <br>
<br>
Specific sleep values like this are a red flag, it all depends on how<br>
much load systems are under and we&#39;ve had a lot of problems with these<=
br>
kinds of things.<br>
<br>
Instead, you should probably detect &quot;systemd-coredump@.service unit is=
<br>
running&quot; in the command output and retry if that is the case with an<b=
r>
overall timeout/error in case it never completes.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000e6e7f6061a8b6504--

