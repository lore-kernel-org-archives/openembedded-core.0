Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D4EC433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 22:01:53 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.1579.1633298512293713460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 15:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o6cYAJGd;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id g41so63170963lfv.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 15:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UDH7cdmfqqtEwLYSYhUALba3+74Bz3/WJY2XwVA3hNw=;
        b=o6cYAJGd68GPfsH3F/61Mr498PAM7B+IMcasDCIYxjVyL3puN17SbLupMNHjmOkAHZ
         ouY2NxXOafoN52s49PdpJ+n2O37/yJPYfjyOGr3O8x3i68MIFa9H+suHQMzJswTNhl1K
         ASkhGPj/JHnO0WNx+pu0Ks2S64nJnyeq+MAWC1Hm2UGyBMBc9Xe7lCrYish5iUd7OHcj
         yWJxaqebV5tIvRTtBNKVaQ+U8IH6IJ3e9ronnxvODSa58PW6vJmRpKCPRM6nN5Bl+CuB
         HiMik2BcLKa0KNVs2zw1M1D44mukceqPnlkGrPJy11IXDm+grY9+oMhL6FGLZgafsmEO
         MCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UDH7cdmfqqtEwLYSYhUALba3+74Bz3/WJY2XwVA3hNw=;
        b=aaqemVSONSvyP0CriQQoJRiIIWaZX5ulWWjU2iz6AqrRoeoPKCA7U39aLQ0/SJ56zp
         Ph7XtjP+bhYsjNITqHywDz/hk5v93m5CM09VKDFgJ7KUBefMw6SJX+yORQgZKTibkaZU
         dEGF1l4iNWXg/c4oPbnDMDvApGn3NLVxfkokwb8EZ1tvFYwtCvfbjVwyLUB+TyMOyJf0
         No5cYVBJ4Mjl8ZcdBmGVElVwb5786hlGedGsTAqUXLKa3iQz99Z7jeSt/sRPFmjS+ys2
         tx6l0a6Ixwj1kLg/G3QIA0mfhjZ1yrWDYdizQwrVtBYo7AM0xt36BJ3LyL/ytXA8WgGl
         M8Pg==
X-Gm-Message-State: AOAM530LqZD07KtxTemSMp2gdwSTPredlPiUtEWfPm+QKF9XR0YCdMuS
	MwoEaxF4xazFTIOL8M9/E0lyVP04TueSbSZRD0U=
X-Google-Smtp-Source: 
 ABdhPJwMUydMvbL2Dmx9q4rPUMwJSbTY37zNHu/WfiIdmKH+ZXIU4QHJXep6EArih1f5Vzn/0GkFyJJDuIwcugq4X/U=
X-Received: by 2002:a2e:22c3:: with SMTP id
 i186mr11591298lji.255.1633298510328;
 Sun, 03 Oct 2021 15:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210919205112.183447-1-quaresma.jose@gmail.com>
 <YUm3SyaxRMR/JMwZ@piout.net>
In-Reply-To: <YUm3SyaxRMR/JMwZ@piout.net>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sun, 3 Oct 2021 23:01:42 +0100
Message-ID: 
 <CANPvuRmgqLeuc5twXrbomYEq9WSOv+8ia84j4Lvp2H9ffJL9PA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] sstate.bbclass: track found files on
 mirrors with a counter
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008535a005cd79f1a6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 22:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156564

--0000000000008535a005cd79f1a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Alexandre Belloni <alexandre.belloni@bootlin.com> escreveu no dia ter=C3=A7=
a,
21/09/2021 =C3=A0(s) 11:43:

> Hello Jose,
>
> On 19/09/2021 21:51:11+0100, Jose Quaresma wrote:
> > We don't need extra python collections to count the found files
> > on the sstate cache and sstate mirrors.
> > The main found collections provides all the files that were found,
> > then we only need to count the files on sstate mirror
> >
>
> I believe this is the cause of:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/3999
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4039
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4019
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/3338
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/4012
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/4004
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/4009
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/4004
>
> I removed both patches and all the builds passed
>
>
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 29679e6a5e..fc156ac81a 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -893,8 +893,6 @@ BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
> >
> >  def sstate_checkhashes(sq_data, d, siginfo=3DFalse, currentcount=3D0,
> summary=3DTrue, **kwargs):
> >      found =3D set()
> > -    foundLocal =3D set()
> > -    foundNet =3D set()
> >      missed =3D set()
> >
> >      def gethash(task):
> > @@ -927,12 +925,12 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e,
> currentcount=3D0, summary=3DTrue,
> >          if os.path.exists(sstatefile):
> >              bb.debug(2, "SState: Found valid sstate file %s" %
> sstatefile)
> >              found.add(tid)
> > -            foundLocal.add(tid)
> >              continue
> >          else:
> > -            missed.add(tid)
> >              bb.debug(2, "SState: Looked for but didn't find file %s" %
> sstatefile)
> > +            missed.add(tid)
> >
> > +    foundMirrors =3D 0
> >      mirrors =3D d.getVar("SSTATE_MIRRORS")
> >      if mirrors:
> >          # Copy the data object and override DL_DIR and SRC_URI
> > @@ -972,8 +970,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
> >
> connection_cache=3Dthread_worker.connection_cache)
> >                  fetcher.checkstatus()
> >                  bb.debug(2, "SState: Successful fetch test for %s" %
> srcuri)
> > +                foundMirrors +=3D 1
>

After looking again at that patch I think the problem may be here as
it increments the counter inside of the thread pool without any lock.
I sent a new version that uses a different approach to count the files
that was found on sstate mirror.

https://lists.openembedded.org/g/openembedded-core/topic/patch_sstate_bbcla=
ss_count/86052575?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,86052575,=
previd=3D1633298061762412833,nextid=3D1633195213330301948&previd=3D16332980=
61762412833&nextid=3D1633195213330301948


> >                  found.add(tid)
> > -                foundNet.add(tid)
> >                  if tid in missed:
> >                      missed.remove(tid)
> >              except:
> > @@ -1034,7 +1032,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e,
> currentcount=3D0, summary=3DTrue,
> >          match =3D 0
> >          if total:
> >              match =3D len(found) / total * 100
> > -        bb.plain("Sstate summary: Wanted %d Local %d Network %d Missed
> %d Current %d (%d%% match, %d%% complete)" % (total, len(foundLocal),
> len(foundNet),len(missed), currentcount, match, complete))
> > +        bb.plain("Sstate summary: Wanted %d Local %d Mirrors %d Missed
> %d Current %d (%d%% match, %d%% complete)" %
> > +            (total, len(found)-foundMirrors, foundMirrors, len(missed)=
,
> currentcount, match, complete))
> >
> >      if hasattr(bb.parse.siggen, "checkhashes"):
> >          bb.parse.siggen.checkhashes(sq_data, missed, found, d)
> > --
> > 2.33.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156164):
> https://lists.openembedded.org/g/openembedded-core/message/156164
> > Mute This Topic: https://lists.openembedded.org/mt/85726949/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008535a005cd79f1a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alexandre,<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Alexandre Belloni &lt;<a=
 href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.co=
m</a>&gt; escreveu no dia ter=C3=A7a, 21/09/2021 =C3=A0(s) 11:43:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hello Jose,<br>
<br>
On 19/09/2021 21:51:11+0100, Jose Quaresma wrote:<br>
&gt; We don&#39;t need extra python collections to count the found files<br=
>
&gt; on the sstate cache and sstate mirrors.<br>
&gt; The main found collections provides all the files that were found,<br>
&gt; then we only need to count the files on sstate mirror<br>
&gt; <br>
<br>
I believe this is the cause of:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/63/build=
s/3999" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/63/builds/3999</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/53/build=
s/4039" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/53/builds/4039</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/42/build=
s/4019" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/42/builds/4019</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/97/build=
s/3338" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/97/builds/3338</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/60/build=
s/4012" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/60/builds/4012</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/74/build=
s/4004" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/74/builds/4004</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/59/build=
s/4009" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/59/builds/4009</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/73/build=
s/4004" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/73/builds/4004</a><br>
<br>
I removed both patches and all the builds passed<br>
<br>
<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/sstate.bbclass | 11 +++++------<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass=
<br>
&gt; index 29679e6a5e..fc156ac81a 100644<br>
&gt; --- a/meta/classes/sstate.bbclass<br>
&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; @@ -893,8 +893,6 @@ BB_HASHCHECK_FUNCTION =3D &quot;sstate_checkhashes=
&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def sstate_checkhashes(sq_data, d, siginfo=3DFalse, currentcount=
=3D0, summary=3DTrue, **kwargs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 found =3D set()<br>
&gt; -=C2=A0 =C2=A0 foundLocal =3D set()<br>
&gt; -=C2=A0 =C2=A0 foundNet =3D set()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 missed =3D set()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def gethash(task):<br>
&gt; @@ -927,12 +925,12 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFal=
se, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(sstatefile):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;SSta=
te: Found valid sstate file %s&quot; % sstatefile)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found.add(tid)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 foundLocal.add(tid)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missed.add(tid)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;SSta=
te: Looked for but didn&#39;t find file %s&quot; % sstatefile)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missed.add(tid)<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 foundMirrors =3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mirrors =3D d.getVar(&quot;SSTATE_MIRRORS&quot;)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 if mirrors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy the data object and override =
DL_DIR and SRC_URI<br>
&gt; @@ -972,8 +970,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse=
, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache=3Dthread_worker.connect=
ion_cache)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetcher.=
checkstatus()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug=
(2, &quot;SState: Successful fetch test for %s&quot; % srcuri)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 foundMirrors =
+=3D 1<br></blockquote><div><br></div><div>After looking again at that patc=
h I think the problem may be here as</div><div>it increments the counter in=
side of the thread pool without any lock.</div><div>I sent a new version th=
at uses a different approach=C2=A0to count=C2=A0the files</div><div>that wa=
s found on sstate mirror.</div><div><br></div><div><a href=3D"https://lists=
.openembedded.org/g/openembedded-core/topic/patch_sstate_bbclass_count/8605=
2575?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,86052575,previd=3D1633=
298061762412833,nextid=3D1633195213330301948&amp;previd=3D16332980617624128=
33&amp;nextid=3D1633195213330301948">https://lists.openembedded.org/g/opene=
mbedded-core/topic/patch_sstate_bbclass_count/86052575?p=3D,,,20,0,0,0::rec=
entpostdate/sticky,,,20,2,0,86052575,previd=3D1633298061762412833,nextid=3D=
1633195213330301948&amp;previd=3D1633298061762412833&amp;nextid=3D163319521=
3330301948</a><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found.ad=
d(tid)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 foundNet.add(=
tid)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tid i=
n missed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 missed.remove(tid)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; @@ -1034,7 +1032,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFal=
se, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if total:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D len(found) /=
 total * 100<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;Sstate summary: Wanted %d =
Local %d Network %d Missed %d Current %d (%d%% match, %d%% complete)&quot; =
% (total, len(foundLocal), len(foundNet),len(missed), currentcount, match, =
complete))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;Sstate summary: Wanted %d =
Local %d Mirrors %d Missed %d Current %d (%d%% match, %d%% complete)&quot; =
%<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (total, len(found)-foundMir=
rors, foundMirrors, len(missed), currentcount, match, complete))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if hasattr(bb.parse.siggen, &quot;checkhashes&quot=
;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.parse.siggen.checkhashes(sq_data,=
 missed, found, d)<br>
&gt; -- <br>
&gt; 2.33.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#156164): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/156164" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/156164</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85726949=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/85726949/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000008535a005cd79f1a6--

