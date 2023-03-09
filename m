Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965D6C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:45:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.16810.1678376700688714962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Umc64wRK;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id h11so2326989wrm.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678376699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7/vcHspet32MJrMk+xrwcKCUNGnl/xOjR4Z4iR5uhbA=;
        b=Umc64wRKXUwgDHFLkpXO9FoNqw1CC2x8GAGsBAKT2R70pJ5eW23tKqrmM6N4JxCmVJ
         WukonCLMomFVQHjEBFaeA459VMWIqRQXTp4zRdxnAJ1A2ewvRJvsLgCUp8lnX037jbkd
         KpSaNPIlP0h9YeuX+anVw0mI23sgh38LLk3ZQrUUO4yPDt1jIiufEz44Urm/F0gdYJyk
         AJkrhJfB8WhhAfP+mOf3QWegCZzp/13kTXd5CXZeseTZMvA2ZqUAWe29iOnlRR6kKukc
         NJMP4+nNe+XFr6NxWsKFdSqha5YQrSX3XyJb6tsEJgkNLEH2PCsVqDb6pd/toFFMWDby
         zl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678376699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/vcHspet32MJrMk+xrwcKCUNGnl/xOjR4Z4iR5uhbA=;
        b=rB1p5BLJbZfzCQ1CM8cecs7oXD8QENQ6gQLPWjGoFL2XMwMJF15OoV3jKXQi9H21oa
         9rkAZZegwGvbo/486+JQOksELNNN9oGLWjeMwh7Bjk661zmGqK9kO3CGIf6Z4DucTAg6
         R93YbwpZpNMjVXKwEnPFgOVhJmaINRTnaA1rbeRkokbF4XwyXAXat503st/phqz9+4/f
         XwhIRSyOK2J8Kag7wudgaaz5xr3XFG0r4BnucsoSLvSuxtTG+beeoo0BvUfozEKLzA8N
         4ckFsfNYN+qFcdkS6oVpWbPrltBP/QhyIKzXqRNNRKpJBDYVOv4f26AhvVQpYQihxPKx
         KZ/A==
X-Gm-Message-State: AO0yUKUuyX8I8fmJ3dgw+45o3MmeMpPh2H4U6Cjw9HhXTXfoPK6jlA+F
	w3VceqRkgD1az+VbLCYCckkVJ8PwFXscdJcnIXg=
X-Google-Smtp-Source: AK7set/Y29JVrHkohsNBF4UNmpig/Bp0+2tUsz+hG91stH5uxKUJImUxB+jGahLtqZaW0sx1Ip93wVEopDWPTMWjWVs=
X-Received: by 2002:adf:ce0c:0:b0:2c7:1d73:d59a with SMTP id
 p12-20020adfce0c000000b002c71d73d59amr2547235wrn.1.1678376699038; Thu, 09 Mar
 2023 07:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20230309151958.3619193-1-alex@linutronix.de> <CANNYZj-qNvbg+ZA4OpW--VQibXOdySfmPEY3vg1A58s2H2CJMw@mail.gmail.com>
In-Reply-To: <CANNYZj-qNvbg+ZA4OpW--VQibXOdySfmPEY3vg1A58s2H2CJMw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Mar 2023 16:44:43 +0100
Message-ID: <CA+chaQcxrsODWQnDXbYo=CsWxzCX0ED9H_FAExyEBXXkkLofmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/26] devtool/upgrade: do not delete the
 workspace/recipes directory
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f20f5305f67986b0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178256

--000000000000f20f5305f67986b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Major ffmpeg upgrade might not be risky for components in oe-core (as
you've already patched gst-libav).

But considering how many other projects are still using ffmpeg-4, because
upgrade to ffmpeg-5 api is far from simple, I don't think it's good fit to
merge ffmpeg during feature-freeze - already said the same to Randy.

e.g. gentoo tracker for ffmpeg-5 update:
https://bugs.gentoo.org/showdependencytree.cgi?id=3D831437&hide_resolved=3D=
1

Cheers,

On Thu, Mar 9, 2023 at 4:32=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> Just to make sure: this set (like all of my big patchsets) did get an
> all-clear from a-full test matrix, so I believe it's not particularly
> risky to take in, despite the feature freeze.
>
> Alex
>
> On Thu, 9 Mar 2023 at 16:20, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > If it exists, there is no need to delete it, and if it does not,
> > devtool prints an ugly traceback.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  scripts/lib/devtool/upgrade.py | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/scripts/lib/devtool/upgrade.py
> b/scripts/lib/devtool/upgrade.py
> > index 967d157077..6c4a62b558 100644
> > --- a/scripts/lib/devtool/upgrade.py
> > +++ b/scripts/lib/devtool/upgrade.py
> > @@ -125,11 +125,8 @@ def _write_append(rc, srctreebase, srctree,
> same_dir, no_same_dir, rev, copied,
> >      return af
> >
> >  def _cleanup_on_error(rd, srctree):
> > -    rdp =3D os.path.split(rd)[0] # recipes folder
> >      if os.path.exists(rd):
> >          shutil.rmtree(rd)
> > -    if not len(os.listdir(rdp)):
> > -        os.rmdir(rdp)
> >      srctree =3D os.path.abspath(srctree)
> >      if os.path.exists(srctree):
> >          shutil.rmtree(srctree)
> > --
> > 2.30.2
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178254):
> https://lists.openembedded.org/g/openembedded-core/message/178254
> Mute This Topic: https://lists.openembedded.org/mt/97497957/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f20f5305f67986b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Major ffmpeg upgrade might not be risky for components in =
oe-core (as you&#39;ve already patched gst-libav).<div><br></div><div>But c=
onsidering how many other projects are still using ffmpeg-4, because upgrad=
e to ffmpeg-5 api is far from simple, I don&#39;t think it&#39;s good fit t=
o merge ffmpeg during feature-freeze - already said the same to Randy.</div=
><div><br></div><div>e.g. gentoo tracker for ffmpeg-5 update:</div><div><a =
href=3D"https://bugs.gentoo.org/showdependencytree.cgi?id=3D831437&amp;hide=
_resolved=3D1">https://bugs.gentoo.org/showdependencytree.cgi?id=3D831437&a=
mp;hide_resolved=3D1</a><br></div><div><br></div><div>Cheers,</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Mar 9, 2023 at 4:32=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Just to make sure: this set (like=
 all of my big patchsets) did get an<br>
all-clear from a-full test matrix, so I believe it&#39;s not particularly<b=
r>
risky to take in, despite the feature freeze.<br>
<br>
Alex<br>
<br>
On Thu, 9 Mar 2023 at 16:20, Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; If it exists, there is no need to delete it, and if it does not,<br>
&gt; devtool prints an ugly traceback.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/devtool/upgrade.py | 3 ---<br>
&gt;=C2=A0 1 file changed, 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgr=
ade.py<br>
&gt; index 967d157077..6c4a62b558 100644<br>
&gt; --- a/scripts/lib/devtool/upgrade.py<br>
&gt; +++ b/scripts/lib/devtool/upgrade.py<br>
&gt; @@ -125,11 +125,8 @@ def _write_append(rc, srctreebase, srctree, same_=
dir, no_same_dir, rev, copied,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return af<br>
&gt;<br>
&gt;=C2=A0 def _cleanup_on_error(rd, srctree):<br>
&gt; -=C2=A0 =C2=A0 rdp =3D os.path.split(rd)[0] # recipes folder<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if os.path.exists(rd):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(rd)<br>
&gt; -=C2=A0 =C2=A0 if not len(os.listdir(rdp)):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rmdir(rdp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 srctree =3D os.path.abspath(srctree)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if os.path.exists(srctree):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(srctree)<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178254): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178254" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178254</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97497957/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97497957/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f20f5305f67986b0--

