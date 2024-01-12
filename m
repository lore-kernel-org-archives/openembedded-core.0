Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74714C47258
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 14:59:54 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.9063.1705071589391432449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 06:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=RX5lSePQ;
 spf=pass (domain: snapchat.com, ip: 209.85.208.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-555e07761acso7907763a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 06:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705071587; x=1705676387; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WIehM6CPPWLuyFRislMXToPILXAawKqMgQS9/csR4Dk=;
        b=RX5lSePQjdd2tI3bkoHAWt8lqm3jXFvMr91nYhSpTn2EhmfhnkC+Ch4ZCZBfrb6WtB
         6NR6k1+QWSnuDelzmFfbg2+ImZdn3SfxeIBa+LuONAYYD9lV0ExoDgZtZSZEih752dvQ
         vDxzgBRs8L5ov/WSeS7WlD0vpsf884FqscA4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705071587; x=1705676387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIehM6CPPWLuyFRislMXToPILXAawKqMgQS9/csR4Dk=;
        b=UUafdbx2JllW2Tp9MAizV2EOMDiFGaSiHlIkWcwVIK8StLn9zBzmAollf9zNuqdOmG
         gpFM7i/xWNgnFAkcda19U1j07F/1McsdKQnORoXfwEw1omgauI6j/o6GIUiiRgbu49Z3
         VSBA1Iu8oNP0a6/tVBjORgJwj6SImvl3422fAijSclVhc3KZcMeIVJ1wKRk7G6LOut33
         ZLG9wcMXUTd/f2tMYrxZzruIltYP1VrTKa0ZkprGfqAR8wUXXFSLcFbMI7XmilgHFJcZ
         52Fkys0iNQWLFyFQ/aS4jQDcJd8EH4t+RzqjrBv6dQX2p4Gv93AIpAZLdI4tGLskst0O
         B1VQ==
X-Gm-Message-State: AOJu0Yx7t/QF020iRO0vuthSgMmQU73CXdKAoGvj6HRc/aA6Q/McH/jm
	AqTAJBBY1kSKrCV59GlU7cxfjTHC3G/QfEknxE8WBhJek2nKrQ==
X-Google-Smtp-Source: AGHT+IHx4iiFUnWHoQmws96HQGMb5j04Zf7tjH0a8Q7vFMLtO6xp82eZwdt7LF5N68SVNS7NRQXAAMBAZdtPjQJPfso=
X-Received: by 2002:a17:907:2089:b0:a29:906e:b8f4 with SMTP id
 pv9-20020a170907208900b00a29906eb8f4mr457461ejb.46.1705071587375; Fri, 12 Jan
 2024 06:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20240112135252.1871340-1-ecordonnier@snap.com> <CANNYZj-XOhSovVABwVAmLYEmjbq+rvsyYzbfw+41L1eFCij0QQ@mail.gmail.com>
In-Reply-To: <CANNYZj-XOhSovVABwVAmLYEmjbq+rvsyYzbfw+41L1eFCij0QQ@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 12 Jan 2024 15:59:36 +0100
Message-ID: <CAHUKmYYEm7T7NmFPdRc+bq2ahhxZjKTjJj1rpi5ijRTK0Cp8FA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.py: fix Darwin support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Dominik Schnitzer <dominik@snap.com>
Content-Type: multipart/alternative; boundary="00000000000048ebb6060ec0ea24"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 14:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193585

--00000000000048ebb6060ec0ea24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Alex,
as far as I know, universal_newlines=3DTrue is always required when executi=
ng
commands which produce text. I'll send an updated commit, but it's already
used a lot in the code-base, so I didn't think it needed an explanation.
See this example:

>>> p =3D subprocess.Popen(['ls', '-l'], stdout=3Dsubprocess.PIPE,
stderr=3Dsubprocess.PIPE)
>>> stdout, stderr =3D p.communicate()
>>> print(stdout)
b'total 32\ndrwxrwxr-x  2 ecordonnier ecordonnier 4096 Sep 19 13:43
classes\ndrwxrwxr-x  3 ecordonnier ecordonnier 4096 Aug 31 17:32
conf\n-rw-rw-r--  1 ecordonnier ecordonnier 1023 Jun 23  2022
COPYING.MIT\n-rw-rw-r--  1 ecordonnier ecordonnier 1946 Sep 19 13:43
README\ndrwxrwxr-x  5 ecordonnier ecordonnier 4096 Jun 23  2022
recipes-core\ndrwxrwxr-x 13 ecordonnier ecordonnier 4096 Aug 31 17:32
recipes-devtools\ndrwxrwxr-x  3 ecordonnier ecordonnier 4096 Aug 31 17:32
recipes-extended\ndrwxrwxr-x  5 ecordonnier ecordonnier 4096 Aug 31 17:32
recipes-support\n'

>>> p =3D subprocess.Popen(['ls', '-l'], stdout=3Dsubprocess.PIPE,
stderr=3Dsubprocess.PIPE, universal_newlines=3DTrue)
>>> stdout, stderr =3D p.communicate()
>>> print(stdout)
total 32
drwxrwxr-x  2 ecordonnier ecordonnier 4096 Sep 19 13:43 classes
drwxrwxr-x  3 ecordonnier ecordonnier 4096 Aug 31 17:32 conf
-rw-rw-r--  1 ecordonnier ecordonnier 1023 Jun 23  2022 COPYING.MIT
-rw-rw-r--  1 ecordonnier ecordonnier 1946 Sep 19 13:43 README
drwxrwxr-x  5 ecordonnier ecordonnier 4096 Jun 23  2022 recipes-core
drwxrwxr-x 13 ecordonnier ecordonnier 4096 Aug 31 17:32 recipes-devtools
drwxrwxr-x  3 ecordonnier ecordonnier 4096 Aug 31 17:32 recipes-extended
drwxrwxr-x  5 ecordonnier ecordonnier 4096 Aug 31 17:32 recipes-support

On Fri, Jan 12, 2024 at 3:06=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> The universal_newlines=3DTrue changes need to be explained in the commit
> message. Why are they added?
>
> The need for hostos.startswith("darwin") is easier to guess, but that
> too, needs an explanation.
>
> Alex
>
> On Fri, 12 Jan 2024 at 14:53, Etienne Cordonnier via
> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
> wrote:
> >
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > Signed-off-by: Dominik Schnitzer <dominik@snap.com>
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  meta/lib/oe/package.py | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> > index 9a465eaa09..635efc9763 100644
> > --- a/meta/lib/oe/package.py
> > +++ b/meta/lib/oe/package.py
> > @@ -1615,7 +1615,7 @@ def process_shlibs(pkgfiles, d):
> >                      sonames.add(prov)
> >          if file.endswith('.dylib') or file.endswith('.so'):
> >              rpath =3D []
> > -            p =3D subprocess.Popen([d.expand("${HOST_PREFIX}otool"),
> '-l', file], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE)
> > +            p =3D subprocess.Popen([d.expand("${HOST_PREFIX}otool"),
> '-l', file], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE,
> universal_newlines=3DTrue)
> >              out, err =3D p.communicate()
> >              # If returned successfully, process stdout for results
> >              if p.returncode =3D=3D 0:
> > @@ -1624,7 +1624,7 @@ def process_shlibs(pkgfiles, d):
> >                      if l.startswith('path '):
> >                          rpath.append(l.split()[1])
> >
> > -        p =3D subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-L',
> file], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE)
> > +        p =3D subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-L',
> file], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE,
> universal_newlines=3DTrue)
> >          out, err =3D p.communicate()
> >          # If returned successfully, process stdout for results
> >          if p.returncode =3D=3D 0:
> > @@ -1686,7 +1686,7 @@ def process_shlibs(pkgfiles, d):
> >                  soname =3D None
> >                  if cpath.islink(file):
> >                      continue
> > -                if hostos =3D=3D "darwin" or hostos =3D=3D "darwin8":
> > +                if hostos.startswith("darwin"):
> >                      darwin_so(file, needed, sonames, renames, pkgver)
> >                  elif hostos.startswith("mingw"):
> >                      mingw_dll(file, needed, sonames, renames, pkgver)
> > --
> > 2.36.1.vfs.0.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193581):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_193581&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DbC-1l9s8NypI08MIH0GkVOLZuK5GhN-8HKGWDd14XzEPV0hokRSMnQool8P_UxeE&s=3D3np=
-oDcl19G26iJYYe4LYKJh8dR8GfPupB3gN-3ePOc&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103682827_1686489&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DbC-1l9s8NypI0=
8MIH0GkVOLZuK5GhN-8HKGWDd14XzEPV0hokRSMnQool8P_UxeE&s=3D2J7mVEMxvnhNr7-F0or=
RggogqKQzpe1eSjFnvgmGeVU&e=3D
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DbC-1l9=
s8NypI08MIH0GkVOLZuK5GhN-8HKGWDd14XzEPV0hokRSMnQool8P_UxeE&s=3DiGAXfy_qbvat=
Fl0SoKFI9C8WHypiYGpcAvA1eaP4F8Q&e=3D
> [alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000048ebb6060ec0ea24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi Alex,<br>as far as I know, universal_newlines=3DTrue is=
 always required when executing commands which produce text. I&#39;ll send =
an updated commit, but it&#39;s already used a lot in the code-base, so I d=
idn&#39;t think it needed an explanation. See this example:<br><br>&gt;&gt;=
&gt; p =3D subprocess.Popen([&#39;ls&#39;, &#39;-l&#39;], stdout=3Dsubproce=
ss.PIPE, stderr=3Dsubprocess.PIPE)<br>&gt;&gt;&gt; stdout, stderr =3D p.com=
municate()<br>&gt;&gt;&gt; print(stdout)<br>b&#39;total 32\ndrwxrwxr-x =C2=
=A02 ecordonnier ecordonnier 4096 Sep 19 13:43 classes\ndrwxrwxr-x =C2=A03 =
ecordonnier ecordonnier 4096 Aug 31 17:32 conf\n-rw-rw-r-- =C2=A01 ecordonn=
ier ecordonnier 1023 Jun 23 =C2=A02022 COPYING.MIT\n-rw-rw-r-- =C2=A01 ecor=
donnier ecordonnier 1946 Sep 19 13:43 README\ndrwxrwxr-x =C2=A05 ecordonnie=
r ecordonnier 4096 Jun 23 =C2=A02022 recipes-core\ndrwxrwxr-x 13 ecordonnie=
r ecordonnier 4096 Aug 31 17:32 recipes-devtools\ndrwxrwxr-x =C2=A03 ecordo=
nnier ecordonnier 4096 Aug 31 17:32 recipes-extended\ndrwxrwxr-x =C2=A05 ec=
ordonnier ecordonnier 4096 Aug 31 17:32 recipes-support\n&#39;<br><br>&gt;&=
gt;&gt; p =3D subprocess.Popen([&#39;ls&#39;, &#39;-l&#39;], stdout=3Dsubpr=
ocess.PIPE, stderr=3Dsubprocess.PIPE, universal_newlines=3DTrue)<br>&gt;&gt=
;&gt; stdout, stderr =3D p.communicate()<br>&gt;&gt;&gt; print(stdout)<br>t=
otal 32<br>drwxrwxr-x =C2=A02 ecordonnier ecordonnier 4096 Sep 19 13:43 cla=
sses<br>drwxrwxr-x =C2=A03 ecordonnier ecordonnier 4096 Aug 31 17:32 conf<b=
r>-rw-rw-r-- =C2=A01 ecordonnier ecordonnier 1023 Jun 23 =C2=A02022 COPYING=
.MIT<br>-rw-rw-r-- =C2=A01 ecordonnier ecordonnier 1946 Sep 19 13:43 README=
<br>drwxrwxr-x =C2=A05 ecordonnier ecordonnier 4096 Jun 23 =C2=A02022 recip=
es-core<br>drwxrwxr-x 13 ecordonnier ecordonnier 4096 Aug 31 17:32 recipes-=
devtools<br>drwxrwxr-x =C2=A03 ecordonnier ecordonnier 4096 Aug 31 17:32 re=
cipes-extended<br>drwxrwxr-x =C2=A05 ecordonnier ecordonnier 4096 Aug 31 17=
:32 recipes-support<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Jan 12, 2024 at 3:06=E2=80=AFPM Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
he universal_newlines=3DTrue changes need to be explained in the commit<br>
message. Why are they added?<br>
<br>
The need for hostos.startswith(&quot;darwin&quot;) is easier to guess, but =
that<br>
too, needs an explanation.<br>
<br>
Alex<br>
<br>
On Fri, 12 Jan 2024 at 14:53, Etienne Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com=
@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Dominik Schnitzer &lt;<a href=3D"mailto:dominik@snap.co=
m" target=3D"_blank">dominik@snap.com</a>&gt;<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oe/package.py | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
&gt; index 9a465eaa09..635efc9763 100644<br>
&gt; --- a/meta/lib/oe/package.py<br>
&gt; +++ b/meta/lib/oe/package.py<br>
&gt; @@ -1615,7 +1615,7 @@ def process_shlibs(pkgfiles, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sonames.add(prov)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if file.endswith(&#39;.dylib&#39;) o=
r file.endswith(&#39;.so&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpath =3D []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subprocess.Popen([d.e=
xpand(&quot;${HOST_PREFIX}otool&quot;), &#39;-l&#39;, file], stdout=3Dsubpr=
ocess.PIPE, stderr=3Dsubprocess.PIPE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subprocess.Popen([d.e=
xpand(&quot;${HOST_PREFIX}otool&quot;), &#39;-l&#39;, file], stdout=3Dsubpr=
ocess.PIPE, stderr=3Dsubprocess.PIPE, universal_newlines=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out, err =3D p.communi=
cate()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If returned successf=
ully, process stdout for results<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.returncode =3D=3D=
 0:<br>
&gt; @@ -1624,7 +1624,7 @@ def process_shlibs(pkgfiles, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if l.startswith(&#39;path &#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rpath.append(l.split()[1])<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subprocess.Popen([d.expand(&quot;${=
HOST_PREFIX}otool&quot;), &#39;-L&#39;, file], stdout=3Dsubprocess.PIPE, st=
derr=3Dsubprocess.PIPE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subprocess.Popen([d.expand(&quot;${=
HOST_PREFIX}otool&quot;), &#39;-L&#39;, file], stdout=3Dsubprocess.PIPE, st=
derr=3Dsubprocess.PIPE, universal_newlines=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out, err =3D p.communicate()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If returned successfully, process =
stdout for results<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.returncode =3D=3D 0:<br>
&gt; @@ -1686,7 +1686,7 @@ def process_shlibs(pkgfiles, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 soname =
=3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cpath=
.islink(file):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hostos =3D=
=3D &quot;darwin&quot; or hostos =3D=3D &quot;darwin8&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hostos.sta=
rtswith(&quot;darwin&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 darwin_so(file, needed, sonames, renames, pkgver)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif hos=
tos.startswith(&quot;mingw&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mingw_dll(file, needed, sonames, renames, pkgver)<br>
&gt; --<br>
&gt; 2.36.1.vfs.0.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#193581): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_messa=
ge_193581&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DbC-1l9s8NypI0=
8MIH0GkVOLZuK5GhN-8HKGWDd14XzEPV0hokRSMnQool8P_UxeE&amp;s=3D3np-oDcl19G26iJ=
YYe4LYKJh8dR8GfPupB3gN-3ePOc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_message_193581&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&amp;m=3DbC-1l9s8NypI08MIH0GkVOLZuK5GhN-8HKGWDd14XzEPV0hokRSMnQool=
8P_UxeE&amp;s=3D3np-oDcl19G26iJYYe4LYKJh8dR8GfPupB3gN-3ePOc&amp;e=3D</a> <b=
r>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_103682827_1686489&amp;d=3DDwIBaQ&amp=
;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&amp;m=3DbC-1l9s8NypI08MIH0GkVOLZuK5GhN-8HKGWDd14X=
zEPV0hokRSMnQool8P_UxeE&amp;s=3D2J7mVEMxvnhNr7-F0orRggogqKQzpe1eSjFnvgmGeVU=
&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103682827_1686489&amp=
;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhk=
bNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DbC-1l9s8NypI08MIH0GkVOLZuK=
5GhN-8HKGWDd14XzEPV0hokRSMnQool8P_UxeE&amp;s=3D2J7mVEMxvnhNr7-F0orRggogqKQz=
pe1eSjFnvgmGeVU&amp;e=3D</a> <br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIBaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DbC-1l9s8NypI08MIH0GkVOLZuK5GhN-8HKGWDd=
14XzEPV0hokRSMnQool8P_UxeE&amp;s=3DiGAXfy_qbvatFl0SoKFI9C8WHypiYGpcAvA1eaP4=
F8Q&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore=
_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&a=
mp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DbC-1l9s8NypI08MI=
H0GkVOLZuK5GhN-8HKGWDd14XzEPV0hokRSMnQool8P_UxeE&amp;s=3DiGAXfy_qbvatFl0SoK=
FI9C8WHypiYGpcAvA1eaP4F8Q&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:alex.kanavi=
n@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000048ebb6060ec0ea24--

