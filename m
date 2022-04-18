Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD83C64E77
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.36082.1650259884744758068
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 22:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=asD0GDDw;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id r18so15769892ljp.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 22:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Pvv0cqzzGAAOp+wG7a890nrYkYJe+UAkLzc/YvqIKM=;
        b=asD0GDDwZnj0/CLBHjuHvXHZ91w9Uw3ohM1f9IueyUvKgPGCqS7BQxBBm+CNA2+oo9
         hPnzBeTaftpepnnsJnvzfk4vUoqS/EIEl7JEJcTV7o4SuxtT29meCVjDqj4WmCizeEeW
         G3CrjGMfapiCrm/4Ebn+T+hM7gvj9B6p0GjMYtvBmG1y+lYZ07w/iuMof78Thco+Cj0R
         4DkMVkzbvDPfTqfEo4CEMHAHV73OZd6z1/CNnPg0PbrlhxI10B2Ffp2zHtjHRYPqpGe4
         rHWdaH9yk0b7sWuVhgfe0K5XyNOuX5yyPcNQI2njBtTSMpwrgymWb6GElGgfig8A/rYF
         5zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Pvv0cqzzGAAOp+wG7a890nrYkYJe+UAkLzc/YvqIKM=;
        b=ADjmiZOgiiG+IWauShgkKBDfjb/CVxQHBvm6KmttlEj46EGMULarS7Dn1zw0HccMUJ
         u1rxQ450XoXW7N/fOBODCtZCsWRZvlRsdESx5HMbzZtWNh76WL2S8qThmhXzAJ48ilww
         3ZUItU9dLPjlMEG8/DlVfFVn0517fIJgoYh/wV/sMm8IMMs+bipL6DfZsVFcirgIP0s8
         tv/ftudkhH0TvQuryyolvlHWSmUugZ8InE94KxtXqDxN1h8pYILCNQJQcxhZEmJAmRCz
         twknKaxuOpD0R+//OG4ITQT7UBwT2FgVKGhcd75e110mJrFUAJ0XhNYjo6Mffu+XpzeR
         NI4A==
X-Gm-Message-State: AOAM531KOe//G/uqx8tIfoKY147cW2zS05cJ5JZ2P0I8CcXXTTEoXWPD
	FA5yCQ4bshy1Mbl5VWPPffqgNxZRHMOCuFfbpRk=
X-Google-Smtp-Source: 
 ABdhPJy0DnPHK7NnqoenCe5m0v7largJZn9Ugn0GUXQRAyefy3otjUI/x1l8/Eqv0rbr2cGkFpkoA/XGYwOsJIKOHrM=
X-Received: by 2002:a05:651c:1195:b0:24d:9b82:acfa with SMTP id
 w21-20020a05651c119500b0024d9b82acfamr6399837ljo.409.1650259882793; Sun, 17
 Apr 2022 22:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220416222846.219151-1-quaresma.jose@gmail.com>
 <16E6B2AF3CEA40C4.19917@lists.openembedded.org>
 <16E6B2C69CA37E19.11564@lists.openembedded.org>
 <16a5b5cab9bba7226528febe5489d60ff5b90214.camel@linuxfoundation.org>
In-Reply-To: 
 <16a5b5cab9bba7226528febe5489d60ff5b90214.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 18 Apr 2022 06:31:11 +0100
Message-ID: 
 <CANPvuRmg-+GsBi_LCCkF9pQXw-+cHzow9Lj0NDW4_2NOn=VrNA@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH v2 1/4] sstate: add a LockedSet class as
 python set() is not thread safe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000019e0c105dce71286"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164582

--00000000000019e0c105dce71286
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
domingo, 17/04/2022 =C3=A0(s) 21:09:

> On Sun, 2022-04-17 at 14:41 +0100, Richard Purdie via
> lists.openembedded.org
> wrote:
> > On Sun, 2022-04-17 at 14:39 +0100, Richard Purdie via
> lists.openembedded.org
> > wrote:
> > > On Sat, 2022-04-16 at 23:28 +0100, Jose Quaresma wrote:
> > > > With this LockedSet python class we can call the 'add' and 'remove'
> > > > safely inside the ThreadedPool.
> > > >
> > > > This piece of code is taen from the stackoverflow
> > > >
> https://stackoverflow.com/questions/13610654/how-to-make-built-in-contain=
ers-sets-dicts-lists-thread-safe
> > > >
> > > > Fixes [YOCTO #14775] --
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775
> > > >
> > > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > > > ---
> > > >  meta/classes/sstate.bbclass | 24 ++++++++++++++++++++++--
> > > >  1 file changed, 22 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/classes/sstate.bbclass
> b/meta/classes/sstate.bbclass
> > > > index 1c0cae4893..a3ba748a1e 100644
> > > > --- a/meta/classes/sstate.bbclass
> > > > +++ b/meta/classes/sstate.bbclass
> > > > @@ -918,8 +918,28 @@ sstate_unpack_package () {
> > > >  BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
> > > >
> > > >  def sstate_checkhashes(sq_data, d, siginfo=3DFalse, currentcount=
=3D0,
> summary=3DTrue, **kwargs):
> > > > -    found =3D set()
> > > > -    missed =3D set()
> > > > +    #
> https://stackoverflow.com/questions/13610654/how-to-make-built-in-contain=
ers-sets-dicts-lists-thread-safe
> > > > +    import threading
> > > > +    class LockedSet(set):
> > > > +        """A set where add(), remove(), and 'in' operator are
> thread-safe"""
> > > > +        def __init__(self, *args, **kwargs):
> > > > +            self._lock =3D threading.Lock()
> > > > +            super(LockedSet, self).__init__(*args, **kwargs)
> > > > +
> > > > +        def add(self, elem):
> > > > +            with self._lock:
> > > > +                super(LockedSet, self).add(elem)
> > > > +
> > > > +        def remove(self, elem):
> > > > +            with self._lock:
> > > > +                super(LockedSet, self).remove(elem)
> > > > +
> > > > +        def __contains__(self, elem):
> > > > +            with self._lock:
> > > > +                super(LockedSet, self).__contains__(elem)
> > > > +
> > > > +    found =3D LockedSet()
> > > > +    missed =3D LockedSet()
> > > >
> > > >      def gethash(task):
> > > >          return sq_data['unihash'][task]
> > >
> > >
> > > The series blew up on the autobuilder:
> > >
> > > testsdkest:
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5079/st=
eps/17/logs/stdio
> > > oe-selftest:
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3461/st=
eps/15/logs/stdio
> > > and many more, see:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/353=
5
> >
> > That last one should be:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3539
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 7a18d9d554..99d125b8c5 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -1058,7 +1058,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>                  connection_cache_pool =3D Queue(nproc)
>                  checkstatus_init()
>                  with
> concurrent.futures.ThreadPoolExecutor(max_workers=3Dnproc) as executor:
> -                    executor.map(checkstatus, tasks)
> +                    executor.map(checkstatus, tasks.copy())
>                  checkstatus_end()
>                  bb.event.disable_threadlock()
>
> fixes things.
>
> Cheers,
>
> Richard
>
>
Thanks for testing and fixing, this can be because the tasks collection has
been changed inside the thread pool.
I'll wait a few more days to see if there are any more comments and I hope
to be able to finish during this week.

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000019e0c105dce71286
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia domingo, 17/04/2022 =C3=A0(s) 21:09:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Sun, 2022-04-17 at 14:41 +0100,=
 Richard Purdie via <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a><br>
wrote:<br>
&gt; On Sun, 2022-04-17 at 14:39 +0100, Richard Purdie via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a><br>
&gt; wrote:<br>
&gt; &gt; On Sat, 2022-04-16 at 23:28 +0100, Jose Quaresma wrote:<br>
&gt; &gt; &gt; With this LockedSet python class we can call the &#39;add&#3=
9; and &#39;remove&#39;<br>
&gt; &gt; &gt; safely inside the ThreadedPool.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This piece of code is taen from the stackoverflow<br>
&gt; &gt; &gt; <a href=3D"https://stackoverflow.com/questions/13610654/how-=
to-make-built-in-containers-sets-dicts-lists-thread-safe" rel=3D"noreferrer=
" target=3D"_blank">https://stackoverflow.com/questions/13610654/how-to-mak=
e-built-in-containers-sets-dicts-lists-thread-safe</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Fixes [YOCTO #14775] -- <a href=3D"https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D14775" rel=3D"noreferrer" target=3D"_blank">http=
s://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.=
jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/classes/sstate.bbclass | 24 +++++++++++++++++++++=
+--<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 22 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/ssta=
te.bbclass<br>
&gt; &gt; &gt; index 1c0cae4893..a3ba748a1e 100644<br>
&gt; &gt; &gt; --- a/meta/classes/sstate.bbclass<br>
&gt; &gt; &gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; &gt; &gt; @@ -918,8 +918,28 @@ sstate_unpack_package () {<br>
&gt; &gt; &gt;=C2=A0 BB_HASHCHECK_FUNCTION =3D &quot;sstate_checkhashes&quo=
t;<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 def sstate_checkhashes(sq_data, d, siginfo=3DFalse, cu=
rrentcount=3D0, summary=3DTrue, **kwargs):<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 found =3D set()<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 missed =3D set()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 # <a href=3D"https://stackoverflow.com/questi=
ons/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe" =
rel=3D"noreferrer" target=3D"_blank">https://stackoverflow.com/questions/13=
610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe</a><br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 import threading<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 class LockedSet(set):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;A set where a=
dd(), remove(), and &#39;in&#39; operator are thread-safe&quot;&quot;&quot;=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def __init__(self, *args, **kwa=
rgs):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._lock =3D th=
reading.Lock()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super(LockedSet, =
self).__init__(*args, **kwargs)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def add(self, elem):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with self._lock:<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sup=
er(LockedSet, self).add(elem)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def remove(self, elem):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with self._lock:<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sup=
er(LockedSet, self).remove(elem)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def __contains__(self, elem):<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with self._lock:<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sup=
er(LockedSet, self).__contains__(elem)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 found =3D LockedSet()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 missed =3D LockedSet()<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 def gethash(task):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return sq_data[&#39;unihas=
h&#39;][task]<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; The series blew up on the autobuilder:<br>
&gt; &gt; <br>
&gt; &gt; testsdkest:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/53/builds/5079/steps/17/logs/stdio" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5079/step=
s/17/logs/stdio</a><br>
&gt; &gt; oe-selftest:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/79/builds/3461/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3461/step=
s/15/logs/stdio</a><br>
&gt; &gt; and many more, see:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/83/builds/3535" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/83/builds/3535</a><br>
&gt; <br>
&gt; That last one should be:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/=
builds/3539" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/83/builds/3539</a><br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 7a18d9d554..99d125b8c5 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -1058,7 +1058,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connection_ca=
che_pool =3D Queue(nproc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkstatus_i=
nit()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with concurre=
nt.futures.ThreadPoolExecutor(max_workers=3Dnproc) as executor:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec=
utor.map(checkstatus, tasks)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec=
utor.map(checkstatus, tasks.copy())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkstatus_e=
nd()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.event.disa=
ble_threadlock()<br>
<br>
fixes things.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><div><br></div>Thanks for testing and fixing, this can b=
e because the tasks collection has been changed inside the thread pool.<div=
><div>I&#39;ll wait a few more days to see if there are any more comments a=
nd I hope to be able to finish during this week.</div><div><br></div>-- <br=
><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<=
div><br>Jos=C3=A9 Quaresma</div></div></div></div></div>

--00000000000019e0c105dce71286--

