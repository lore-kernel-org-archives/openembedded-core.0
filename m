Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCDBC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 20:39:59 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web12.13831.1641933599214567247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kgxt3amy;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id n12so281652vkc.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g4ClswUXl9F8d+n62Erf++64SfYwX2zR2jsV7EreNd4=;
        b=kgxt3amyF2G9rtNSVRfxMkeks5i1B6EAbA2bedQuGpj+Mnj4tQCu0Aan5lbCqDFzk/
         Z/vF/IPem8qd7qHVZz1qpsH6pzK4L9voNx6F2W+0O19GqLhBedwjRdWr+qQ8qDW7xbPq
         ikoqnzgzHcnlmTFWORJrAENQBUtkT+Kts4Sc7lVm7koGr3XQElburwguAgR3ZS2FOIuQ
         N23v91E9lobEiIx/uNU9EvFppw2CmzqTySeuGCfUXR8B5IufDPXKtyBh4wwbK/HztwKu
         LqMKouT0f+n285fCvOPFgpUNOJSMJ9px8WUS+Q7ykbyHule/z4+GjlTHyGEGPWHTl67U
         IqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4ClswUXl9F8d+n62Erf++64SfYwX2zR2jsV7EreNd4=;
        b=kZSmHELEiX00y3KV5nqvR/voeybjjfRK3NUwEs1hH2vZHnfgNRN0GkxO/CxiCri5Z0
         4LgoKBsuW7fpu2tN/nX/nAZ/3lZG05ZDaibk/Kk3ecCBQUkdUQKufgjno64TlxmZYf7a
         0xoSh8ntC7Lr9O1QHkKmyF+S77m/uMvMAt5iLaRTUpLMuS7yVBXkdd2x8eUcwJm1mXTb
         Up6CYpLCMY3H0ax9gQma4bMh6x8PptbESZkT40nsDKlqw/mJJNBMX4QX7sZ7IDFanuCW
         YAHhgCu1C+bC18iU4jGFIuyB/IRGI/lkh5sd5TutIFj6VjxDqq21qQabturg6d5dZjOk
         VqEg==
X-Gm-Message-State: AOAM533uJLEjZ8vQlLU+J4E1MMQD6R5qEa436oR0j9s9n2ys7GXOs1zj
	v9Kp4gkXkFlRBZF8IwMJGjt6vMhecdgj76bitLo=
X-Google-Smtp-Source: 
 ABdhPJxSArA0DjvvgIC8sewLh9CKFakk93dyGfwISmTN/c8LWTIL7eHSOxrMDW2wfgOCmCI5Vu2fYP2aevi+Zo6k+Sk=
X-Received: by 2002:a05:6122:2009:: with SMTP id
 l9mr3038483vkd.4.1641933598237;
 Tue, 11 Jan 2022 12:39:58 -0800 (PST)
MIME-Version: 1.0
References: <16C8200D7F471EEB.16815@lists.openembedded.org>
 <9939e5e346e6f543f065a52d06dbfa4e017f0d69.camel@linuxfoundation.org>
In-Reply-To: 
 <9939e5e346e6f543f065a52d06dbfa4e017f0d69.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jan 2022 21:39:46 +0100
Message-ID: 
 <CANNYZj-KNUCPUL0SH5-um4MO04MhZLSv4C9u0WmCefrx-Ekksw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: Only allow network in existing network
 accessing code
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000de291805d554747c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 20:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160462

--000000000000de291805d554747c
Content-Type: text/plain; charset="UTF-8"

I think this is the right way to go. To me, it seems equally easy to
subvert both forms, but with this one, the abuse can be easily seen and
exposed as such.

Alex

On Sat, 8 Jan 2022 at 00:17, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2022-01-07 at 23:15 +0000, Richard Purdie via
> lists.openembedded.org
> wrote:
> > Use the newly added network task flag against tasks where network
> > access is expected. This is do_fetch, do_checkuri, do_testimage,
> do_testsdk
> > and do_testsdkext.
> >
> > We can't disable networking in sstate tasks due to sstate downloads and
> > also so we can report hash equivalence to the server so network access
> > is enabled in sstate tasks.
> >
> > Access within build-appliance do_image is also allowed due to the use
> > of pip, this is a poor example made rather obvious now and needs to be
> reworked.
> >
> > Network access anywhere else in any other task isn't allowed.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/base.bbclass                                | 1 +
> >  meta/classes/sstate.bbclass                              | 2 ++
> >  meta/classes/testimage.bbclass                           | 1 +
> >  meta/classes/testsdk.bbclass                             | 2 ++
> >  meta/classes/utility-tasks.bbclass                       | 1 +
> >  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 ++
> >  6 files changed, 9 insertions(+)
>
> This patch (and corresponding bitbake patches) does the opposite of the
> previous
> version, it uses a network flag which allows network access in a task and
> network access is otherwise disabled. I've shared it since several people
> requested this form of patch instead of the other.
>
> I think this version may be easier to "abuse". It does highlight the
> rather poor
> design choices to support toaster in build-appliance.
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160272):
> https://lists.openembedded.org/g/openembedded-core/message/160272
> Mute This Topic: https://lists.openembedded.org/mt/88273730/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000de291805d554747c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this is the right way to go. To me, it seems =
equally easy to subvert both forms, but with this one, the abuse can be eas=
ily seen and exposed as such.</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat=
, 8 Jan 2022 at 00:17, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2022-01-07 a=
t 23:15 +0000, Richard Purdie via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
wrote:<br>
&gt; Use the newly added network task flag against tasks where network<br>
&gt; access is expected. This is do_fetch, do_checkuri, do_testimage, do_te=
stsdk<br>
&gt; and do_testsdkext.<br>
&gt; <br>
&gt; We can&#39;t disable networking in sstate tasks due to sstate download=
s and<br>
&gt; also so we can report hash equivalence to the server so network access=
<br>
&gt; is enabled in sstate tasks.<br>
&gt; <br>
&gt; Access within build-appliance do_image is also allowed due to the use<=
br>
&gt; of pip, this is a poor example made rather obvious now and needs to be=
 reworked.<br>
&gt; <br>
&gt; Network access anywhere else in any other task isn&#39;t allowed.<br>
&gt; <br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1 +<br>
&gt;=C2=A0 meta/classes/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
+<br>
&gt;=C2=A0 meta/classes/testimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 meta/classes/testsdk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++=
<br>
&gt;=C2=A0 meta/classes/utility-tasks.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 meta/recipes-core/images/<a href=3D"http://build-appliance-image=
_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15.0=
.0.bb</a> | 2 ++<br>
&gt;=C2=A0 6 files changed, 9 insertions(+)<br>
<br>
This patch (and corresponding bitbake patches) does the opposite of the pre=
vious<br>
version, it uses a network flag which allows network access in a task and<b=
r>
network access is otherwise disabled. I&#39;ve shared it since several peop=
le<br>
requested this form of patch instead of the other.<br>
<br>
I think this version may be easier to &quot;abuse&quot;. It does highlight =
the rather poor<br>
design choices to support toaster in build-appliance.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160272): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160272" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160272</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88273730/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88273730/1686489</a><br>
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

--000000000000de291805d554747c--

