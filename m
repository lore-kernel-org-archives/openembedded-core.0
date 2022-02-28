Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C04C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 18:06:23 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.884.1646071581952453339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S/2Tckk7;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id f37so22731887lfv.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=myRIsRg5vpXRDiLNCUFP72lJtZq7xpbnfjnU7L3qfqU=;
        b=S/2Tckk74y8vh1sQD15NBtV/IWd/sSLTRP06mdczap0hnQDstlVPFcMHwiY4NSUOPy
         ZeK1bQ6XlUsvCXH6VDycnF2gfVa+p0ZPQGrwCrXvM2kjAIkJN021YAbe8TInpM4hFB0s
         d0QUBtGg2TI0Cr1/KuijA9uyAqtG86YIBLEQzgjmCO8gZF9+fix1FCJ0NM1ebrVeplr+
         1qg8vFxb7jQ/G3MAcWYGgLjX/sBylx/oGfKDmpYckuYqp7ZjLPJ+apEYOM0Xgcz3nCcO
         lO5N45ETNNz22gmncWdjRD6Xjvb/HG9xYBmuGPfMRyFFuY1AZKCe92NuAYVrUnE60qSZ
         sQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=myRIsRg5vpXRDiLNCUFP72lJtZq7xpbnfjnU7L3qfqU=;
        b=uCUjtpZ6fuo/0Xl18dUW07wvZwHuwrg0rxRuYcik050Mv0Z0KulGr/EyXni3IHNNaZ
         bdmLhmqg7daGY5DY3WUVB5v0cmyKQ4+3917su7hBlSlecwEj/7biwT/WIUVH3l11OWx/
         iQk7KsF5z+xI4GuvGP3qP4IpbY3k+RLugOQGXfB63s7pRKhV1G6MA+eh9ih/7gOa0a9K
         QzQcS9H5s6uY6E8ZRP7o14qkllPDpn1w/WdH8fuhOspLxKFPqFKPVIwh5XMCgAH7rZkP
         4CcukNHPRSNMEc2+W8rmhZ+snjAclPIZC6P90i690Ju21VFljhxvrO8GrN4zZj4AA4k1
         94YA==
X-Gm-Message-State: AOAM530YZaeCeKCwR5IKXZvMYc5lYlJgvC2IL/YBejVGLyUUOTghd8fy
	3V40P8RlQee27KMXLp48B92hme7zO43teWZtblg=
X-Google-Smtp-Source: 
 ABdhPJwzmqXxtfvLcpBXdXT+3P3vP+VI0XiXNnfK3tSDVtp0JHMVkbznQDMLErQjlWvF+nqMdykE1Y7cwVrt6IGhNzc=
X-Received: by 2002:ac2:4855:0:b0:443:888e:5982 with SMTP id
 21-20020ac24855000000b00443888e5982mr13143418lfy.447.1646071580134; Mon, 28
 Feb 2022 10:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20220228160600.42164-1-quaresma.jose@gmail.com>
 <CAMKF1soU_PaiWrsQ32grZmbSEUe90TUbj+fJ1sPOz4saEi=yZQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soU_PaiWrsQ32grZmbSEUe90TUbj+fJ1sPOz4saEi=yZQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 28 Feb 2022 18:06:08 +0000
Message-ID: 
 <CANPvuRne4_JgzWAAdN_tr_cAzSZ5yui9X5yC5EDNYN+WyfAiXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: create the buildhistory
 directory when needed
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cf133505d917e748"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 18:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162512

--000000000000cf133505d917e748
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia segunda, 28/02/2022 =C3=A0(s)
17:12:

> On Mon, Feb 28, 2022 at 8:06 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > When the BUILDHISTORY_RESET is enabled we need to move the
> > content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but
> > when we start a clean build in the first run we don't have the
> > BUILDHISTORY_DIR so the move of files will fail.
> >
> > | ERROR: Command execution failed: Traceback (most recent call last):
> > |  File "/xxx/poky/bitbake/lib/bb/command.py", line 110, in
> runAsyncCommand
> > |    commandmethod(self.cmds_async, self, options)
> > |  File "/xxx/poky/bitbake/lib/bb/command.py", line 564, in buildTarget=
s
> > |    command.cooker.buildTargets(pkgs_to_build, task)
> > |  File "/xxx/poky/bitbake/lib/bb/cooker.py", line 1481, in buildTarget=
s
> > |    bb.event.fire(bb.event.BuildStarted(buildname, ntargets),
> self.databuilder.mcdata[mc])
> > |  File "/xxx/home/builder/src/base/poky/bitbake/lib/bb/event.py", line
> 214, in fire
> > |    fire_class_handlers(event, d)
> > |  File "/xxx/poky/bitbake/lib/bb/event.py", line 121, in
> fire_class_handlers
> > |    execute_handler(name, handler, event, d)
> > |  File "/xxx/poky/bitbake/lib/bb/event.py", line 93, in execute_handle=
r
> > |    ret =3D handler(event)
> > |  File "/xxx/poky/meta/classes/buildhistory.bbclass", line 919, in
> buildhistory_eventhandler
> > |    entries =3D [ x for x in os.listdir(rootdir) if not x.startswith('=
.')
> ]
> > | FileNotFoundError: [Errno 2] No such file or directory:
> '/xxx/buildhistory'
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/buildhistory.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> > index 49797a6701..d416512f6d 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -896,6 +896,8 @@ python buildhistory_eventhandler() {
> >                  if os.path.isdir(olddir):
> >                      shutil.rmtree(olddir)
> >                  rootdir =3D e.data.getVar("BUILDHISTORY_DIR")
> > +                if not os.path.exists(rootdir):
> > +                    bb.utils.mkdirhier(rootdir)
>
> I wonder if the check is needed. Is there any downside if we did not
> check for it pre-existing ?
>
>
The mkdirhier uses the python os.makedirs so it works like 'mkdir -p'
but there are more places in the class that check if the directory exists
before creating it.
Use the os.path.exists is more consistent with what exists in class but
I can send a v2 without the check.

Jose

>                  entries =3D [ x for x in os.listdir(rootdir) if not
> x.startswith('.') ]
> >                  bb.utils.mkdirhier(olddir)
> >                  for entry in entries:
> > --
> > 2.35.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162508):
> https://lists.openembedded.org/g/openembedded-core/message/162508
> > Mute This Topic: https://lists.openembedded.org/mt/89453662/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cf133505d917e748
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia segunda, 28/02/202=
2 =C3=A0(s) 17:12:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Mon, Feb 28, 2022 at 8:06 AM Jose Quaresma &lt;<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; When the BUILDHISTORY_RESET is enabled we need to move the<br>
&gt; content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but<br>
&gt; when we start a clean build in the first run we don&#39;t have the<br>
&gt; BUILDHISTORY_DIR so the move of files will fail.<br>
&gt;<br>
&gt; | ERROR: Command execution failed: Traceback (most recent call last):<=
br>
&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/command.py&quot;, line 110=
, in runAsyncCommand<br>
&gt; |=C2=A0 =C2=A0 commandmethod(self.cmds_async, self, options)<br>
&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/command.py&quot;, line 564=
, in buildTargets<br>
&gt; |=C2=A0 =C2=A0 command.cooker.buildTargets(pkgs_to_build, task)<br>
&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/cooker.py&quot;, line 1481=
, in buildTargets<br>
&gt; |=C2=A0 =C2=A0 bb.event.fire(bb.event.BuildStarted(buildname, ntargets=
), self.databuilder.mcdata[mc])<br>
&gt; |=C2=A0 File &quot;/xxx/home/builder/src/base/poky/bitbake/lib/bb/even=
t.py&quot;, line 214, in fire<br>
&gt; |=C2=A0 =C2=A0 fire_class_handlers(event, d)<br>
&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/event.py&quot;, line 121, =
in fire_class_handlers<br>
&gt; |=C2=A0 =C2=A0 execute_handler(name, handler, event, d)<br>
&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/event.py&quot;, line 93, i=
n execute_handler<br>
&gt; |=C2=A0 =C2=A0 ret =3D handler(event)<br>
&gt; |=C2=A0 File &quot;/xxx/poky/meta/classes/buildhistory.bbclass&quot;, =
line 919, in buildhistory_eventhandler<br>
&gt; |=C2=A0 =C2=A0 entries =3D [ x for x in os.listdir(rootdir) if not x.s=
tartswith(&#39;.&#39;) ]<br>
&gt; | FileNotFoundError: [Errno 2] No such file or directory: &#39;/xxx/bu=
ildhistory&#39;<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/buildhistory.bbclass | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhis=
tory.bbclass<br>
&gt; index 49797a6701..d416512f6d 100644<br>
&gt; --- a/meta/classes/buildhistory.bbclass<br>
&gt; +++ b/meta/classes/buildhistory.bbclass<br>
&gt; @@ -896,6 +896,8 @@ python buildhistory_eventhandler() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.pa=
th.isdir(olddir):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 shutil.rmtree(olddir)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootdir =
=3D e.data.getVar(&quot;BUILDHISTORY_DIR&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.pat=
h.exists(rootdir):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bb.utils.mkdirhier(rootdir)<br>
<br>
I wonder if the check is needed. Is there any downside if we did not<br>
check for it pre-existing ?<br>
<br></blockquote><div>=C2=A0</div><div>The mkdirhier uses the python=C2=A0<=
span class=3D"gmail-pl-s1"><span class=3D"gmail-pl-token">os</span></span>.=
<span class=3D"gmail-pl-en"><span class=3D"gmail-pl-token">makedirs so it w=
orks like=C2=A0</span></span>&#39;mkdir -p&#39;</div><div>but there are mor=
e places in the class that check if the directory exists</div><div>before c=
reating it.</div><div>Use the os.path.exists is more consistent with what e=
xists in class but</div><div>I can send a v2 without the check.</div><div><=
br></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entries =
=3D [ x for x in os.listdir(rootdir) if not x.startswith(&#39;.&#39;) ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils=
.mkdirhier(olddir)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for entr=
y in entries:<br>
&gt; --<br>
&gt; 2.35.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#162508): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/162508" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/162508</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89453662=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89453662/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000cf133505d917e748--

