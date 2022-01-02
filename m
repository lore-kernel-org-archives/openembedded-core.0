Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440A7C433F5
	for <webhook@archiver.kernel.org>; Sun,  2 Jan 2022 18:14:05 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web09.16470.1641147243668298584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 10:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z0tSaUoK;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id j11so17625115uaq.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 10:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xPSHR1EJ443uG6AnMQkruvpv+UXXxkz32t8uTFZSseA=;
        b=Z0tSaUoKau3wB1OVmFx1ndhdl9KKhU7nwXS2IhHE7dhpU/flSD5eCfvIvZ2Wr/snz2
         U2t2zZPSDI/JLgLOHLXoeow4Aa7FmDWaYsLkaL5TCbOxLAw3tHfgHPKbKk7M8hC22pSj
         FB76ZW3IG+1t+CMAnM+NaW9sWWII+ZR4ATGPRoUqik9B78NC0+1VY8nKABpSqjp+vpC7
         pQbwvf9MeMHo/0E23bg9DWYeSGiXBA9FDQcfh5dD8R6EHUSU9hP8EcQlpGXu+iQ00kKa
         yVMR6Kl+H3B4h9IR/A3VsqGi3fXsMSlo9JkiRKSNEDsXPt3fzDScz8pvQP/1uKzq75PD
         fVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xPSHR1EJ443uG6AnMQkruvpv+UXXxkz32t8uTFZSseA=;
        b=WYFJV55a9esxRlFXe9MSmXZrJx4ThCV2QVkRaN0xi98iQRj9s6NcN8+Nt/Z76A3oAF
         2vr4l1ZNObVGHwC2FgxFla57mD4j7dUFR0lQbHh6WjPWayGNWkfryAT3FJfq8o/9oSLQ
         dCs9McJ4Y1fbhUgmu6+u8x4gPkiXEgNhpifjMPkgymmmUEc70iTLVXPwyCE4++7Izwmo
         bof6jWy3vwthQgl9Kce41GO5cwaH1/3KbQ6YSuHINEHeZCW4QKjzLKHQOfV2uBvVBDRi
         X8j/37x+NAnkvqrxB2d3JXMtJrqmEAoHoBrnT93eZoEErX1BBhPZHSZM8bfwgtIlwYfD
         XWyg==
X-Gm-Message-State: AOAM532uuCvAkmcFjZtw1gCcUuySSFgS9mazbayrQTbr+Rv3mUj0jSGx
	EiR7/U0iQyGc534BvO4ma5hdJZQnbGhbZ3+ahZY=
X-Google-Smtp-Source: 
 ABdhPJyUIvCUeldXrdGhwwZBUQxHBYFLVMvCzkj6SCKvSSVG0SQoNM1XRvnOydqwNhYtZPLlNQdcUxrtMuz9/V38srQ=
X-Received: by 2002:a67:c81c:: with SMTP id u28mr12531178vsk.38.1641147242739;
 Sun, 02 Jan 2022 10:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20220101112959.1866747-1-alex@linutronix.de>
 <20220101112959.1866747-4-alex@linutronix.de>
 <CAGgRHJogKK0dDsu9vE9jVOYMdqUO_frmCkLLRVvDSFJmxs954Q@mail.gmail.com>
 <16C6811541A7227F.5913@lists.openembedded.org>
In-Reply-To: <16C6811541A7227F.5913@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 2 Jan 2022 19:13:50 +0100
Message-ID: 
 <CANNYZj_TeiuHScY3O-q9Zx42kcki3iVa2UY252hshJE1akGckA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] go-runtime.inc: do not make installation
 set dependent on host
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Matt Madison <matt@madison.systems>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000006d795905d49d5edd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jan 2022 18:14:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160107

--0000000000006d795905d49d5edd
Content-Type: text/plain; charset="UTF-8"

Thanks, I have dropped the patch.

Alex

On Sun, 2 Jan 2022 at 17:30, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> Right, I'll take a closer look at this.
>
> Alex
>
> On Sun, 2 Jan 2022 at 13:40, Matt Madison <matt@madison.systems> wrote:
>
>> On Sat, Jan 1, 2022 at 3:30 AM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>> >
>> > This cannot be right: what we install for the target should not
>> > depend on what host it's being built on. If this was fixing
>> > some problem, there needs to be a different solution.
>>
>> IIRC, I added this because the go toolchain doesn't really do
>> host/target separation like gcc does. The runtime packages for both
>> host and target get populated during the compilation, and if the
>> target architecture matches the build host's architecture, you'd get
>> just one copy in the tree. And back then, at least, the go-runtime
>> package needed those files, so the check was there to make sure they
>> didn't get deleted just because the two architectures were the same.
>>
>> That's the way things were 5 years ago, though, and the toolchain has
>> changed a lot since then. It might not be needed any more.
>>
>> -Matt
>>
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >  meta/recipes-devtools/go/go-runtime.inc | 6 ++----
>> >  1 file changed, 2 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/recipes-devtools/go/go-runtime.inc
>> b/meta/recipes-devtools/go/go-runtime.inc
>> > index a08d44dd3a..106017bd89 100644
>> > --- a/meta/recipes-devtools/go/go-runtime.inc
>> > +++ b/meta/recipes-devtools/go/go-runtime.inc
>> > @@ -43,10 +43,8 @@ do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin
>> ${B}/pkg"
>> >  do_install() {
>> >         install -d ${D}${libdir}/go/src
>> >         cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
>> > -       if [ "${BUILD_GOTUPLE}" != "${TARGET_GOTUPLE}" ]; then
>> > -               rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
>> > -               rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
>> > -       fi
>> > +       rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
>> > +       rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
>> >         rm -rf ${D}${libdir}/go/pkg/tool
>> >         rm -rf ${D}${libdir}/go/pkg/obj
>> >         rm -rf ${D}${libdir}/go/pkg/bootstrap
>> > --
>> > 2.20.1
>> >
>> >
>> >
>> >
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160105):
> https://lists.openembedded.org/g/openembedded-core/message/160105
> Mute This Topic: https://lists.openembedded.org/mt/88071321/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006d795905d49d5edd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I have dropped the patch.</div><div><br></div=
><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sun, 2 Jan 2022 at 17:30, Alexander Kanavin via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alex.k=
anavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div>Right, I&#39;ll take a closer look =
at this.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 2 Jan 2022 at 13:40=
, Matt Madison &lt;matt@madison.systems&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Sat, Jan 1, 2022 at 3:30 AM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This cannot be right: what we install for the target should not<br>
&gt; depend on what host it&#39;s being built on. If this was fixing<br>
&gt; some problem, there needs to be a different solution.<br>
<br>
IIRC, I added this because the go toolchain doesn&#39;t really do<br>
host/target separation like gcc does. The runtime packages for both<br>
host and target get populated during the compilation, and if the<br>
target architecture matches the build host&#39;s architecture, you&#39;d ge=
t<br>
just one copy in the tree. And back then, at least, the go-runtime<br>
package needed those files, so the check was there to make sure they<br>
didn&#39;t get deleted just because the two architectures were the same.<br=
>
<br>
That&#39;s the way things were 5 years ago, though, and the toolchain has<b=
r>
changed a lot since then. It might not be needed any more.<br>
<br>
-Matt<br>
<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-runtime.inc | 6 ++----<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-de=
vtools/go/go-runtime.inc<br>
&gt; index a08d44dd3a..106017bd89 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-runtime.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-runtime.inc<br>
&gt; @@ -43,10 +43,8 @@ do_compile[cleandirs] +=3D &quot;${GOTMPDIR} ${B}/b=
in ${B}/pkg&quot;<br>
&gt;=C2=A0 do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/go/src<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp --preserve=3Dmode,timestamps -R ${=
B}/pkg ${D}${libdir}/go/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${BUILD_GOTUPLE}&quot; !=3D &qu=
ot;${TARGET_GOTUPLE}&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${l=
ibdir}/go/pkg/${BUILD_GOTUPLE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${l=
ibdir}/go/pkg/obj/${BUILD_GOTUPLE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPL=
E}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GO=
TUPLE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/tool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/obj<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/bootstrap=
<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160105): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160105" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160105</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88071321/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88071321/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000006d795905d49d5edd--

