Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A76C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 15:23:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.11909.1646320983912311357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:23:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eBNz0Bgt;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id j7so9091302lfu.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YC4/LlK9IyMJx+ZOfVuMvavko2DMXegU1/YnvPziMuo=;
        b=eBNz0Bgtre9y4mVPJUML6DKW1T7mUFkEa/OYafemeGInbl3A42fSWfDd38DxLG0gAY
         PAbpjQS94jI1qNh3VKUfDkTLlpDREVqOpFdTcmU7oa6qEmaVbs+MvgKQWcJoYctERia0
         FPLZcH3jQfF9zSr3HRe4kY/WNG3DzLxbhu2lZOyRS5F8GTpuxNvhLeyULmO8pC/ufWSA
         WBpiCtezvxxUcPRydJsLb5vws5N0bL8PS3NAMabHgRjISIwyG109nqQI9rsCjwI4dv7x
         yJ1e/MJrm7QLW0Kpd3mNPLSzh9GyvqJAQUIQlNsBH3yAxqGL4BoKfaoXyt0rZNlem+jK
         773A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YC4/LlK9IyMJx+ZOfVuMvavko2DMXegU1/YnvPziMuo=;
        b=vPygcb6dKOqtllAyIIs+Mh1dMWTjsWb3x0M+9bBwHvge1BGYzoJRomL0Y4daGC07dX
         2gzGqLTUmvvpO+K9A1maO8JfgKRNoVuIsjTEPIbgsiHIpxs8cCB7xoVLONsVuC9ZuL/g
         CyyFD4xr5ru9d6lbj1uOkt0ohqZboLH22LFoSLweoeScSMrlictO1ROjSo80j7J8DBBd
         mgEm4+R4R+zTFKib5PTOru3kohHnCt/81S5Obdl3UAkdOQjFWHddyp9OHMtpd77mk0qW
         L14yXmAb9Tfx8TOuXFTaWWNRrXejspwEH5zPihg3UOGxzJ+fKq4UR7Z16E4pVFbDpLIK
         S4xg==
X-Gm-Message-State: AOAM530/vzUYo73Y0BV+JJLxZj7g0mgzOAazoM0J0OMZQQ13kItyg4J6
	gTMEAkNBk0Z+gAKdXHfUbDyOUd997yHVJngExxXNzXyE
X-Google-Smtp-Source: 
 ABdhPJwgllvDSv8MbwBgFCBQ2rT6zscba0gYBMU0FZEP23zTn2n6JXnIIgV3IowT7/C44O+JvOxoySBLes1YHi3fOUY=
X-Received: by 2002:a05:6512:511:b0:443:3f9f:5d5c with SMTP id
 o17-20020a056512051100b004433f9f5d5cmr20931408lfb.94.1646320981996; Thu, 03
 Mar 2022 07:23:01 -0800 (PST)
MIME-Version: 1.0
References: <16D869D532B5A22D.25756@lists.openembedded.org>
 <CANPvuRk2wx+yXfviZADt8AoF-zR+H89Spj8NcQzAgsFL2LLCfQ@mail.gmail.com>
 <CAOSpxdYz=saGTeRm48L+C_RgB51eOdQC6GgAo3j5ZrifWPuXYg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYz=saGTeRm48L+C_RgB51eOdQC6GgAo3j5ZrifWPuXYg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 3 Mar 2022 15:22:50 +0000
Message-ID: 
 <CANPvuRnzTHDiN1NG5C+=HoH1qU5Eaztkb7FDAJwETCfYAd0g0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] buildhistory.bbclass: create the
 buildhistory directory when needed
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000051771c05d951f95f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 15:23:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162660

--00000000000051771c05d951f95f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, thanks!

Steve Sakoman <steve@sakoman.com> escreveu no dia quinta, 3/03/2022 =C3=A0(=
s)
14:49:

> On Wed, Mar 2, 2022 at 2:07 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > Can this patch be backported to dunfell?
>
> I've added it to my test queue.
>
> Steve
>
> >
> > Jose
> >
> > Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu no dia quarta, 2/03/2022 =C3=
=A0(s)
> 00:47:
> >>
> >> When the BUILDHISTORY_RESET is enabled we need to move the
> >> content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but
> >> when we start a clean build in the first run we don't have the
> >> BUILDHISTORY_DIR so the move of files will fail.
> >>
> >> | ERROR: Command execution failed: Traceback (most recent call last):
> >> |  File "/xxx/poky/bitbake/lib/bb/command.py", line 110, in
> runAsyncCommand
> >> |    commandmethod(self.cmds_async, self, options)
> >> |  File "/xxx/poky/bitbake/lib/bb/command.py", line 564, in buildTarge=
ts
> >> |    command.cooker.buildTargets(pkgs_to_build, task)
> >> |  File "/xxx/poky/bitbake/lib/bb/cooker.py", line 1481, in buildTarge=
ts
> >> |    bb.event.fire(bb.event.BuildStarted(buildname, ntargets),
> self.databuilder.mcdata[mc])
> >> |  File "/xxx/home/builder/src/base/poky/bitbake/lib/bb/event.py", lin=
e
> 214, in fire
> >> |    fire_class_handlers(event, d)
> >> |  File "/xxx/poky/bitbake/lib/bb/event.py", line 121, in
> fire_class_handlers
> >> |    execute_handler(name, handler, event, d)
> >> |  File "/xxx/poky/bitbake/lib/bb/event.py", line 93, in execute_handl=
er
> >> |    ret =3D handler(event)
> >> |  File "/xxx/poky/meta/classes/buildhistory.bbclass", line 919, in
> buildhistory_eventhandler
> >> |    entries =3D [ x for x in os.listdir(rootdir) if not
> x.startswith('.') ]
> >> | FileNotFoundError: [Errno 2] No such file or directory:
> '/xxx/buildhistory'
> >>
> >> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >> ---
> >>  V2: remove the check to see if the directory exists
> >>
> >>  meta/classes/buildhistory.bbclass | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> >> index 49797a6701..8db79a4829 100644
> >> --- a/meta/classes/buildhistory.bbclass
> >> +++ b/meta/classes/buildhistory.bbclass
> >> @@ -896,6 +896,7 @@ python buildhistory_eventhandler() {
> >>                  if os.path.isdir(olddir):
> >>                      shutil.rmtree(olddir)
> >>                  rootdir =3D e.data.getVar("BUILDHISTORY_DIR")
> >> +                bb.utils.mkdirhier(rootdir)
> >>                  entries =3D [ x for x in os.listdir(rootdir) if not
> x.startswith('.') ]
> >>                  bb.utils.mkdirhier(olddir)
> >>                  for entry in entries:
> >> --
> >> 2.35.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#162587):
> https://lists.openembedded.org/g/openembedded-core/message/162587
> >> Mute This Topic: https://lists.openembedded.org/mt/89491842/5052612
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> quaresma.jose@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000051771c05d951f95f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, thanks!=C2=A0<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Steve Sakoman &lt;<a href=3D"mailt=
o:steve@sakoman.com">steve@sakoman.com</a>&gt; escreveu no dia quinta, 3/03=
/2022 =C3=A0(s) 14:49:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, Mar 2, 2022 at 2:07 PM Jose Quaresma &lt;<a href=3D"mailto:q=
uaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; Can this patch be backported to dunfell?<br>
<br>
I&#39;ve added it to my test queue.<br>
<br>
Steve<br>
<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.=
com@lists.openembedded.org</a>&gt; escreveu no dia quarta, 2/03/2022 =C3=A0=
(s) 00:47:<br>
&gt;&gt;<br>
&gt;&gt; When the BUILDHISTORY_RESET is enabled we need to move the<br>
&gt;&gt; content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but<br>
&gt;&gt; when we start a clean build in the first run we don&#39;t have the=
<br>
&gt;&gt; BUILDHISTORY_DIR so the move of files will fail.<br>
&gt;&gt;<br>
&gt;&gt; | ERROR: Command execution failed: Traceback (most recent call las=
t):<br>
&gt;&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/command.py&quot;, line=
 110, in runAsyncCommand<br>
&gt;&gt; |=C2=A0 =C2=A0 commandmethod(self.cmds_async, self, options)<br>
&gt;&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/command.py&quot;, line=
 564, in buildTargets<br>
&gt;&gt; |=C2=A0 =C2=A0 command.cooker.buildTargets(pkgs_to_build, task)<br=
>
&gt;&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/cooker.py&quot;, line =
1481, in buildTargets<br>
&gt;&gt; |=C2=A0 =C2=A0 bb.event.fire(bb.event.BuildStarted(buildname, ntar=
gets), self.databuilder.mcdata[mc])<br>
&gt;&gt; |=C2=A0 File &quot;/xxx/home/builder/src/base/poky/bitbake/lib/bb/=
event.py&quot;, line 214, in fire<br>
&gt;&gt; |=C2=A0 =C2=A0 fire_class_handlers(event, d)<br>
&gt;&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/event.py&quot;, line 1=
21, in fire_class_handlers<br>
&gt;&gt; |=C2=A0 =C2=A0 execute_handler(name, handler, event, d)<br>
&gt;&gt; |=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/event.py&quot;, line 9=
3, in execute_handler<br>
&gt;&gt; |=C2=A0 =C2=A0 ret =3D handler(event)<br>
&gt;&gt; |=C2=A0 File &quot;/xxx/poky/meta/classes/buildhistory.bbclass&quo=
t;, line 919, in buildhistory_eventhandler<br>
&gt;&gt; |=C2=A0 =C2=A0 entries =3D [ x for x in os.listdir(rootdir) if not=
 x.startswith(&#39;.&#39;) ]<br>
&gt;&gt; | FileNotFoundError: [Errno 2] No such file or directory: &#39;/xx=
x/buildhistory&#39;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@g=
mail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 V2: remove the check to see if the directory exists<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/classes/buildhistory.bbclass | 1 +<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buil=
dhistory.bbclass<br>
&gt;&gt; index 49797a6701..8db79a4829 100644<br>
&gt;&gt; --- a/meta/classes/buildhistory.bbclass<br>
&gt;&gt; +++ b/meta/classes/buildhistory.bbclass<br>
&gt;&gt; @@ -896,6 +896,7 @@ python buildhistory_eventhandler() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if o=
s.path.isdir(olddir):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 shutil.rmtree(olddir)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root=
dir =3D e.data.getVar(&quot;BUILDHISTORY_DIR&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.=
mkdirhier(rootdir)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entr=
ies =3D [ x for x in os.listdir(rootdir) if not x.startswith(&#39;.&#39;) ]=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.u=
tils.mkdirhier(olddir)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for =
entry in entries:<br>
&gt;&gt; --<br>
&gt;&gt; 2.35.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#162587): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/162587" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/162587</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/8949=
1842/5052612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/89491842/5052612</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--00000000000051771c05d951f95f--

