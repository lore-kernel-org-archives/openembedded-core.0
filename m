Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF36CEB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 06:48:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.10430.1687934893776624075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 23:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=E1Z//Csy;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-312824aa384so4836196f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687934892; x=1690526892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwUoD/0w9f6xoWUw4Wq85jC9K6VNUNnl13hTD5cmZ+g=;
        b=E1Z//CsyC8hAioftO8zV7hISanb0qf6RaLK+oPMvH8MpoRLqlfrEAwZMGHbkx2fFyP
         zsRoW8y34S3lFITCB+KE+/ClL5sSsnWRYpg0BL+kR8qU3SXPHq8cnsnWBTM7a5w1VDlj
         I+PjI2/1JK8BxJ61CTDjb/NuYTlu2wa4wf9uSGLJ0EynXP32GgUv+KtTURfuJlRelWAk
         AEQ8laz2eTxEzXTbOv61MQLq4CX+jVc9YPoFe2gDFNCoDm4wSAaKq7yJwfmDfIkIsmZ9
         21f/bXbIE9gBlDcUxVHCDpqLKPQhcDuXh4TqEQn6ajMXUchl5ot1tGCHWJjLN7+76DpB
         9F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687934892; x=1690526892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwUoD/0w9f6xoWUw4Wq85jC9K6VNUNnl13hTD5cmZ+g=;
        b=WQffSw9tGqPNomIpXUkq8s4+t0wS3iSci3AEsBeuuitPz7NpRp/58SSgC053pPHwnM
         8MIbUIvS6NduEnw6NSFxKsZf3LDrGjmRihh47hY0LkjJOUBeaoujH13dbeBTIMhvrrKN
         DFsbmN7oQ52eDIj+M4sYFbRg4Io2ThTbUK88Pyq2WQmGCXGO6a97WAZ35FWOrccPFmsT
         ggWEDP5Nid3Mq+dNS0Y4ZYN8sUg/g5eFLZSDKiCvBlor97EXRwefflVb+/q/9buT0OjR
         ERNmyFEBZttBTWE4T+fPi6xH8MWv8oJG0whCZODY5RbepfLmf3hKxq2IRP26nw37kZcw
         ecjA==
X-Gm-Message-State: AC+VfDz1lBxLDD02kNsu2XMKuvVg5qBa8dwujsMjapshwSzigKJvjpmo
	0lam0bPxb8JCnsRnTUZmLI13ft1q2ciiGdTV9ME=
X-Google-Smtp-Source: ACHHUZ5eDv0VRG8NWVmQcB8tzFukL+XcxSulqm9t90jJVFfKNJ4qpEWJgjPmqfxnGIHyQtmGwr4H49O7KcYpL7M/ZBw=
X-Received: by 2002:adf:e5d2:0:b0:314:4db:e0b0 with SMTP id
 a18-20020adfe5d2000000b0031404dbe0b0mr2054328wrn.14.1687934891876; Tue, 27
 Jun 2023 23:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230623093323.4058529-1-Martin.Jansa@gmail.com> <35c96621a643bc6ef527eed83cc420eba85075ca.camel@linuxfoundation.org>
In-Reply-To: <35c96621a643bc6ef527eed83cc420eba85075ca.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 28 Jun 2023 08:47:44 +0200
Message-ID: <CA+chaQeqdgaNNTmRTjR=eO=yEbWtsvJQD7ebQ+OApS_O+X5mQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uninative: call patchelf-uninative only when needed
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a2639a05ff2af7bf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 06:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183542

--000000000000a2639a05ff2af7bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 12:18=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2023-06-23 at 11:33 +0200, Martin Jansa wrote:
> > mke2fs.real, mkfs.ext2.real, mkfs.ext3.real, mkfs.ext4.real are
> indentical
> > binary with multiple hardlinks and we end calling patchelf-uninative 4
> > times even when the interpreter is already set correctly from the build
> >
> > To avoid corrupted binaries created by patchelf-0.18.0 when
> set-interpreter
> > is called multiple times (on some systems like ubuntu-18.04 this leads =
to
> > segfaults elsewhere just ldd complains that the executable is no longer
> > dynamically linked, but doesn't fail when executed).
> >
> > The issue was reported upstream with mkfs.ext4.real as possible
> reproducer:
> > https://github.com/NixOS/patchelf/issues/492#issuecomment-1602862272
> > alternatively we can revert
> >
> https://github.com/NixOS/patchelf/commit/65cdee904431d16668f95d816a495bc3=
5a05a192
> > and create new uninative release with update patchelf-uninative, but
> > better to wait a bit for upstream to have a look and possibly backport
> > proper fix later, until then this change fixes the mkfs.ext4 issues I w=
as
> > seeing in kirkstone, mickledore, nanbield since uninative-3.9 upgrade, =
as
> > reported in:
> > https://lists.openembedded.org/g/openembedded-core/message/182862
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes-global/uninative.bbclass | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes-global/uninative.bbclass
> b/meta/classes-global/uninative.bbclass
> > index 366f7ac793..b54acdd542 100644
> > --- a/meta/classes-global/uninative.bbclass
> > +++ b/meta/classes-global/uninative.bbclass
> > @@ -175,7 +175,12 @@ python uninative_changeinterp () {
> >              if not elf.isDynamic():
> >                  continue
> >
> > -            os.chmod(f, s[stat.ST_MODE] | stat.S_IWUSR)
> > -            subprocess.check_output(("patchelf-uninative",
> "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f),
> stderr=3Dsubprocess.STDOUT)
> > -            os.chmod(f, s[stat.ST_MODE])
> > +            current =3D subprocess.check_output(("patchelf-uninative",
> "--print-interpreter", f),
> stderr=3Dsubprocess.STDOUT).decode('utf-8').split('\n')[0]
> > +            if current !=3D d.getVar("UNINATIVE_LOADER"):
> > +                bb.debug(2, "Changing interpreter from %s to %s with
> %s" % (current, d.getVar("UNINATIVE_LOADER"), ("patchelf-uninative",
> "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f)))
> > +                os.chmod(f, s[stat.ST_MODE] | stat.S_IWUSR)
> > +                subprocess.check_output(("patchelf-uninative",
> "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f),
> stderr=3Dsubprocess.STDOUT)
> > +                os.chmod(f, s[stat.ST_MODE])
> > +            else:
> > +                bb.debug(2, "Interpreter was already set to %s in %s" =
%
> (d.getVar("UNINATIVE_LOADER"), f))
> >  }
>
> I know why you've done it this way but ideally we should make patchelf
> handle this internally? It would be nice to avoid fork calls if we can
> in the long run.
>

yes, but that would require new uninative tarball to be built and applied
in master, mickledore, kirkstone, dunfell, so I was waiting for feedback
from upstream first before changing patchelf and using this as work around
to be able to use uninative 3.9 and 4.0 until patchelf is fixed properly.

--000000000000a2639a05ff2af7bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jun 23, 2023 at 12:18=E2=80=AFPM =
Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2023-06-=
23 at 11:33 +0200, Martin Jansa wrote:<br>
&gt; mke2fs.real, mkfs.ext2.real, mkfs.ext3.real, mkfs.ext4.real are indent=
ical<br>
&gt; binary with multiple hardlinks and we end calling patchelf-uninative 4=
<br>
&gt; times even when the interpreter is already set correctly from the buil=
d<br>
&gt; <br>
&gt; To avoid corrupted binaries created by patchelf-0.18.0 when set-interp=
reter<br>
&gt; is called multiple times (on some systems like ubuntu-18.04 this leads=
 to<br>
&gt; segfaults elsewhere just ldd complains that the executable is no longe=
r<br>
&gt; dynamically linked, but doesn&#39;t fail when executed).<br>
&gt; <br>
&gt; The issue was reported upstream with mkfs.ext4.real as possible reprod=
ucer:<br>
&gt; <a href=3D"https://github.com/NixOS/patchelf/issues/492#issuecomment-1=
602862272" rel=3D"noreferrer" target=3D"_blank">https://github.com/NixOS/pa=
tchelf/issues/492#issuecomment-1602862272</a><br>
&gt; alternatively we can revert<br>
&gt; <a href=3D"https://github.com/NixOS/patchelf/commit/65cdee904431d16668=
f95d816a495bc35a05a192" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/NixOS/patchelf/commit/65cdee904431d16668f95d816a495bc35a05a192</a><br>
&gt; and create new uninative release with update patchelf-uninative, but<b=
r>
&gt; better to wait a bit for upstream to have a look and possibly backport=
<br>
&gt; proper fix later, until then this change fixes the mkfs.ext4 issues I =
was<br>
&gt; seeing in kirkstone, mickledore, nanbield since uninative-3.9 upgrade,=
 as<br>
&gt; reported in:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
182862" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/182862</a><br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-global/uninative.bbclass | 11 ++++++++---<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-glob=
al/uninative.bbclass<br>
&gt; index 366f7ac793..b54acdd542 100644<br>
&gt; --- a/meta/classes-global/uninative.bbclass<br>
&gt; +++ b/meta/classes-global/uninative.bbclass<br>
&gt; @@ -175,7 +175,12 @@ python uninative_changeinterp () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not elf.isDynamic()=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(f, s[stat.ST_MODE]=
 | stat.S_IWUSR)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output((&q=
uot;patchelf-uninative&quot;, &quot;--set-interpreter&quot;, d.getVar(&quot=
;UNINATIVE_LOADER&quot;), f), stderr=3Dsubprocess.STDOUT)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(f, s[stat.ST_MODE]=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 current =3D subprocess.chec=
k_output((&quot;patchelf-uninative&quot;, &quot;--print-interpreter&quot;, =
f), stderr=3Dsubprocess.STDOUT).decode(&#39;utf-8&#39;).split(&#39;\n&#39;)=
[0]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if current !=3D d.getVar(&q=
uot;UNINATIVE_LOADER&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &=
quot;Changing interpreter from %s to %s with %s&quot; % (current, d.getVar(=
&quot;UNINATIVE_LOADER&quot;), (&quot;patchelf-uninative&quot;, &quot;--set=
-interpreter&quot;, d.getVar(&quot;UNINATIVE_LOADER&quot;), f)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(f, s=
[stat.ST_MODE] | stat.S_IWUSR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.ch=
eck_output((&quot;patchelf-uninative&quot;, &quot;--set-interpreter&quot;, =
d.getVar(&quot;UNINATIVE_LOADER&quot;), f), stderr=3Dsubprocess.STDOUT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(f, s=
[stat.ST_MODE])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &=
quot;Interpreter was already set to %s in %s&quot; % (d.getVar(&quot;UNINAT=
IVE_LOADER&quot;), f))<br>
&gt;=C2=A0 }<br>
<br>
I know why you&#39;ve done it this way but ideally we should make patchelf<=
br>
handle this internally? It would be nice to avoid fork calls if we can<br>
in the long run.<br></blockquote><div><br></div><div>yes, but that would re=
quire new uninative tarball to be built and applied in master, mickledore, =
kirkstone, dunfell, so I was waiting for feedback from upstream first befor=
e changing patchelf and using this as work around to be able to use uninati=
ve 3.9 and 4.0 until patchelf is fixed properly.</div></div></div>

--000000000000a2639a05ff2af7bf--

