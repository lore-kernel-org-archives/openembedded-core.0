Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2400BC27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:35:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.9771.1718112906976510606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=ZO+2ueO8;
 spf=pass (domain: snapchat.com, ip: 209.85.218.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f177b78dcso301173766b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1718112905; x=1718717705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CZqnTYcP1roySkn7iOsrToYsVQ6/4YTuQbFJQVubYTU=;
        b=ZO+2ueO8Xhc2oQKDXGzB8CGRcwuePbUhWhg4/PcnRDFxyUQ+oP1h6ZcegiSRq8phjn
         5+/GjoWZQaK/XmmWOdK1fpRjCRMjM6Ro/Lld3dW1+DdLi9twzoL9J/sml4S4Wmc1fY53
         d0B3d1ZVKPAtbLO3QmRFEvg3kBZPdgyhQO9oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112905; x=1718717705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZqnTYcP1roySkn7iOsrToYsVQ6/4YTuQbFJQVubYTU=;
        b=e0cDxskKIofJffQ/zfnKOjlXAqapvCPrNNB3r8UBVziguJSIO0qK33ozm11yMZXA4N
         XYT+UD0AN5Sc2zc4D4DZQQuupw02e6VcN0Ybamt1jPSCS1GUe4oE/rtou85eIeH4wEur
         OBxCt/5HGCi278W2WBlQy1EhSZueaqlIdZusB3nC/p95EFjUzboN0x0Ktm36O9t38Q+B
         n4n62VDtBU+bd4uvNRQD8oljbw6gS5dBE1rTcbkEQXEjAhpSrc7WXpn10R04Nz1vbFBD
         XSnpCgMavfPXcfsx3elKKPA5j6z2VLRIL2kToDd/5Z5Qg6UL+CJVIBe5QxdGYNqKd/Nr
         eTiQ==
X-Gm-Message-State: AOJu0YxlJ0fv8AqV5xBnD+mK1O9S9f3AXuWem4gEBeAp526P2k9H1itr
	zrnpCkVEC/WdPiVIJH7hsDOrO4LSq0Rho48liimlp28esYYf31QerdZ+7OFx8yLPxnu7pWL9CND
	dGUm/nFgVccz4uYLschI/5eEkCmLBna1XpKqG4g==
X-Google-Smtp-Source: AGHT+IE+ltSHHL62lvw6L+lS2UyujmYg07T7Xon5BhCaANiw7Uisxdsy+znbQezh3jWFgdqPPT/8z37NcQWbD4lu3Co=
X-Received: by 2002:a17:907:9728:b0:a6f:1641:da55 with SMTP id
 a640c23a62f3a-a6f1641e656mr500808766b.46.1718112905272; Tue, 11 Jun 2024
 06:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240610161642.257051-1-ecordonnier@snap.com> <D10F0112-192B-46C1-A9B3-6ED3F4F346D1@arm.com>
In-Reply-To: <D10F0112-192B-46C1-A9B3-6ED3F4F346D1@arm.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 11 Jun 2024 15:34:54 +0200
Message-ID: <CAHUKmYZoDBhGHXRNC=sSZDODXqGS8TbD5uKdQH9undyxw10VaQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] oeqa/runtime: fix race-condition in
 minidebuginfo test
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000674c62061a9d55ee"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200523

--000000000000674c62061a9d55ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,
OK, I addressed your feedback. On a side note, coredumpctl matches based on
process names are really confusing when used with symlinks. I used a
match based on pid to avoid the confusion:
"
# coredumpctl list
TIME                         PID UID GID SIG     COREFILE EXE
   SIZE
Tue 2024-05-21 05:36:50 GMT 3442   0   0 SIGSEGV present
 /usr/bin/coreutils 109.0K

# coredumpctl list coreutils
No coredumps found.

# coredumpctl list sleep
TIME                         PID UID GID SIG     COREFILE EXE
   SIZE
Tue 2024-05-21 05:36:50 GMT 3442   0   0 SIGSEGV present
 /usr/bin/coreutils 109.0K
"


On Tue, Jun 11, 2024 at 12:47=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> =
wrote:

> On 10 Jun 2024, at 17:16, Etienne Cordonnier via lists.openembedded.org
> <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
> >
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
> > meta/lib/oeqa/runtime/cases/systemd.py | 7 +++++++
> > 1 file changed, 7 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/systemd.py
> b/meta/lib/oeqa/runtime/cases/systemd.py
> > index 80fdae240a..aed230708e 100644
> > --- a/meta/lib/oeqa/runtime/cases/systemd.py
> > +++ b/meta/lib/oeqa/runtime/cases/systemd.py
> > @@ -155,6 +155,13 @@ class SystemdServiceTests(SystemdTest):
> >         self.target.run('kill -SEGV %s' % output)
> >         self.assertEqual(status, 0, msg =3D 'Not able to find process t=
hat
> runs sleep, output : %s' % output)
> >
> > +        # Give some time to systemd-coredump@.service to process the
> coredump
> > +        for x in range(20):
> > +            status, output =3D self.target.run('coredumpctl --quiet
> --no-pager --no-legend | wc -l')
> > +            if output =3D=3D "1":
> > +                break
> > +            time.sleep(1)
> > +
> >         (status, output) =3D self.target.run('coredumpctl info')
>
> As someone who spent too long staring at mysterious failures in the
> debuginfod tests, I recommend you add an =E2=80=98else=E2=80=99 case to t=
hat loop so that
> you can explicitly fail if the timeout expires without breaking out.
>
> Also it feels like the test could be made more reliably by using matches
> instead of just asking it to list all crashes and expecting it to be one
> (what if something else crashed?), and assuming the latest crash is the o=
ne
> we=E2=80=99re after.   If you use matches then the exit code is set to no=
n-zero if
> the match isn=E2=80=99t found, so you could combine the retry loop and th=
e actual
> test into one.
>
> Ross

--000000000000674c62061a9d55ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<br>OK, I addressed your feedback. On a side note,=
 coredumpctl matches based on process names are really confusing when used =
with symlinks. I used a match=C2=A0based on pid to avoid the confusion:<br>=
&quot;<br># coredumpctl list<br>TIME =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PID UID GID SIG =C2=A0 =C2=A0=
 COREFILE EXE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SIZE<br>Tue 2024-05-21 05:36:50 GMT 3442 =C2=A0 0 =C2=A0 0 SIGSEGV prese=
nt =C2=A0/usr/bin/coreutils 109.0K<br><br># coredumpctl list coreutils<br>N=
o coredumps found.<br><br># coredumpctl list sleep<br>TIME =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PID U=
ID GID SIG =C2=A0 =C2=A0 COREFILE EXE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0SIZE<br>Tue 2024-05-21 05:36:50 GMT 3442 =C2=A0 =
0 =C2=A0 0 SIGSEGV present =C2=A0/usr/bin/coreutils 109.0K<br>&quot;<br><br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, Jun 11, 2024 at 12:47=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto=
:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10 Jun 2024, =
at 17:16, Etienne Cordonnier via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;ecordon=
nier=3D<a href=3D"mailto:snap.com@lists.openembedded.org" target=3D"_blank"=
>snap.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
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
&gt; meta/lib/oeqa/runtime/cases/systemd.py | 7 +++++++<br>
&gt; 1 file changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/ru=
ntime/cases/systemd.py<br>
&gt; index 80fdae240a..aed230708e 100644<br>
&gt; --- a/meta/lib/oeqa/runtime/cases/systemd.py<br>
&gt; +++ b/meta/lib/oeqa/runtime/cases/systemd.py<br>
&gt; @@ -155,6 +155,13 @@ class SystemdServiceTests(SystemdTest):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target.run(&#39;kill -SEGV %s&#3=
9; % output)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 0, msg =3D &=
#39;Not able to find process that runs sleep, output : %s&#39; % output)<br=
>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Give some time to systemd-coredump@.ser=
vice to process the coredump<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for x in range(20):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.tar=
get.run(&#39;coredumpctl --quiet --no-pager --no-legend | wc -l&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if output =3D=3D &quot;1&qu=
ot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status, output) =3D self.target.run(=
&#39;coredumpctl info&#39;)<br>
<br>
As someone who spent too long staring at mysterious failures in the debugin=
fod tests, I recommend you add an =E2=80=98else=E2=80=99 case to that loop =
so that you can explicitly fail if the timeout expires without breaking out=
.<br>
<br>
Also it feels like the test could be made more reliably by using matches in=
stead of just asking it to list all crashes and expecting it to be one (wha=
t if something else crashed?), and assuming the latest crash is the one we=
=E2=80=99re after.=C2=A0 =C2=A0If you use matches then the exit code is set=
 to non-zero if the match isn=E2=80=99t found, so you could combine the ret=
ry loop and the actual test into one.<br>
<br>
Ross</blockquote></div>

--000000000000674c62061a9d55ee--

