Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DF5C433FE
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 01:48:58 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web08.31681.1637977737255640720
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 17:48:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mHyg56/4;
 spf=pass (domain: gmail.com, ip: 209.85.166.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id i9so10815263ilu.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 17:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cgltqvwXjmVBnksZ2mDB3g7F204mCbOrxpIrcSsYeec=;
        b=mHyg56/42VLcMbFGZziS7WCOdF21jA4DgnnA5mwCmSIoZfZsZI4UFXWKoFmxRZHcvC
         c01gqvW49EAEZSzaMnBcqk6vlwpFkEwEyxyCf5hAfPQr0Rh5w+//iiK1xYIq0yTVsVj5
         awNSj29myzdUFXRewA1Ww2cPbrtfTXXgCBK8VOLqsXOg608ugqmqfiSpMk6vTVl7r8py
         BPgP67YCWN0dxJ5l/ypZTQmrbtKxGXq7SshHKS/jjyYqCOClg2IF02kj2uQ+Ltj+KY96
         wVWHBo0KPBqm2dQ2o5PFroVdw5EKoZ0bzrmJ2/D+MsBS9lfAECzAyGfOO4Ot/YH3lA6H
         m08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cgltqvwXjmVBnksZ2mDB3g7F204mCbOrxpIrcSsYeec=;
        b=ZUY4coAj9BYZFbDPmLy0PO/N70+z+SqC7rmb6iNOr5nE/bJ25pUgxT0okCvGMUoi+H
         aCl8MiNwcXarb/wfxdI7qltUKgM2tcHEeCcwu86SUwQm33yOgS+4L5v/CrgPyPVrex73
         Xf0uT+2HIcAxFwxfhmTjsI0oEYgTTlHGktRhgzwub+3sIiiTEnpaKDt1HSexLTFD6oSF
         oNTqPwcXQJt5Ra/kvyG3gRml/1myw9MESWwg0GIHzny83/idQZubSamdELmDxrbMVhlR
         OrmAqbmDqyX1G8wT0NupiO6Rlfy5injtmQuBdKLy2dY/qVtUKvxj1S3KRUm0oAKHAa8/
         t9zA==
X-Gm-Message-State: AOAM531NvBuXwwyc1JnQ3CCKSlDmrvZcjV5bR78Qifxgo8/bxTXlYotB
	F7rtP8vKvJfADitsLAP/lI/WyeXZw14hHLTMcVkvB67q
X-Google-Smtp-Source: 
 ABdhPJyZKMVUINGGNdbUeC+OteMLHQLx17OJPnoN0hmNmZqJy5HkFvPyNMkmIQPMKEz5lIcE5bzc622hgo760AEWJtw=
X-Received: by 2002:a05:6e02:b45:: with SMTP id
 f5mr41151775ilu.118.1637977736450;
 Fri, 26 Nov 2021 17:48:56 -0800 (PST)
MIME-Version: 1.0
References: <16BAEC7B11896AEA.23256@lists.yoctoproject.org>
 <CAA=hcWSA8-8TCJDD8_Zib11Vaizok-xZvQMqSevjKJLrQ+GuhA@mail.gmail.com>
In-Reply-To: 
 <CAA=hcWSA8-8TCJDD8_Zib11Vaizok-xZvQMqSevjKJLrQ+GuhA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 26 Nov 2021 17:48:45 -0800
Message-ID: 
 <CANx9H-AzEuCp3YessG73ArQh0mXdRJV7MzHoRTfRC0TqZrmubQ@mail.gmail.com>
Subject: Re: [OE-core] How to create connman_1.40.bbappend to enable and to
 build connman with iwd?
To: JH <jupiter.hce@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Armin Kuster <akuster808@gmail.com>,
	Daniel Wagner <wagi@monom.org>, comman <connman@lists.linux.dev>,
	oe-core <openembedded-core@lists.openembedded.org>,
	yocto <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000002199ac05d1bb6981"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 01:48:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158845

--0000000000002199ac05d1bb6981
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 10:26 PM JH <jupiter.hce@gmail.com> wrote:

> Hi,
>
> Given the high profile of iwd and advocating connman with iwd, I
> believe someone have already built Yocto connman and iwd,
> surprisingly, I could not even find an iwd recipe in
> https://github.com/openembedded/openembedded/tree/master/recipes, nor
> can I find connman document and instructions to replace wpa_supplicant
> by iwd, what could I be missing here?
>

Please look at the layer index for recipes:
https://layers.openembedded.org/layerindex/branch/master/layers/

I don=E2=80=99t have any advice for building it however.


> Appreciate your kind advice.
>
> Thank you.
>
> Kind regards,
>
> - jh
>
>
> On 11/26/21, JH via lists.yoctoproject.org
> <jupiter.hce=3Dgmail.com@lists.yoctoproject.org> wrote:
> > Hi,
> >
> > Please correct me, but it seems to me the connman is moving to a
> > direction to ditch out wpa_supplicant and to use iwd, but the Honister
> > still configure connman with wpa_supplicant by default, appreciate
> > your advice:
> >
> > - Is connman with iwd stable enough?
> >
> > - How can I create a connman_1.40.bbappend  to replace wpa_supplicant
> > by iwd configure?
> >
> > - Where are the documents for configuring and building connman with
> > iwd? Where is the operational guidance to run connman with iwd? Can I
> > use the same connman dbus APIs or are there any dbus API changes to
> > run connman with iwd?
> >
> > My apology for FAQs.
> >
> > Thank you very much.
> >
> > Kind regards,
> >
> > - JH
> >
>
>
> --
> "A man can fail many times, but he isn't a failure until he begins to
> blame somebody else."
> -- John Burroughs
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158824):
> https://lists.openembedded.org/g/openembedded-core/message/158824
> Mute This Topic: https://lists.openembedded.org/mt/87314752/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002199ac05d1bb6981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 25, 2021 at 10:26 PM JH &lt;<a href=3D"mailto:j=
upiter.hce@gmail.com">jupiter.hce@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Hi,<br>
<br>
Given the high profile of iwd and advocating connman with iwd, I<br>
believe someone have already built Yocto connman and iwd,<br>
surprisingly, I could not even find an iwd recipe in<br>
<a href=3D"https://github.com/openembedded/openembedded/tree/master/recipes=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/open=
embedded/tree/master/recipes</a>, nor<br>
can I find connman document and instructions to replace wpa_supplicant<br>
by iwd, what could I be missing here?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Please look at t=
he layer index for recipes:</div><div dir=3D"auto"><div><a href=3D"https://=
layers.openembedded.org/layerindex/branch/master/layers/">https://layers.op=
enembedded.org/layerindex/branch/master/layers/</a></div><br></div><div dir=
=3D"auto">I don=E2=80=99t have any advice for building it however.</div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Appreciate your kind advice.<br>
<br>
Thank you.<br>
<br>
Kind regards,<br>
<br>
- jh<br>
<br>
<br>
On 11/26/21, JH via <a href=3D"http://lists.yoctoproject.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.yoctoproject.org</a><br>
&lt;jupiter.hce=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" targe=
t=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Please correct me, but it seems to me the connman is moving to a<br>
&gt; direction to ditch out wpa_supplicant and to use iwd, but the Honister=
<br>
&gt; still configure connman with wpa_supplicant by default, appreciate<br>
&gt; your advice:<br>
&gt;<br>
&gt; - Is connman with iwd stable enough?<br>
&gt;<br>
&gt; - How can I create a connman_1.40.bbappend=C2=A0 to replace wpa_suppli=
cant<br>
&gt; by iwd configure?<br>
&gt;<br>
&gt; - Where are the documents for configuring and building connman with<br=
>
&gt; iwd? Where is the operational guidance to run connman with iwd? Can I<=
br>
&gt; use the same connman dbus APIs or are there any dbus API changes to<br=
>
&gt; run connman with iwd?<br>
&gt;<br>
&gt; My apology for FAQs.<br>
&gt;<br>
&gt; Thank you very much.<br>
&gt;<br>
&gt; Kind regards,<br>
&gt;<br>
&gt; - JH<br>
&gt;<br>
<br>
<br>
--<br>
&quot;A man can fail many times, but he isn&#39;t a failure until he begins=
 to<br>
blame somebody else.&quot;<br>
-- John Burroughs<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158824): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158824" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158824</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87314752/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
87314752/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002199ac05d1bb6981--

