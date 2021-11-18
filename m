Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F39C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 11:17:51 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web09.280.1637234270461777371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 03:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TzceBT4k;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id d130so3598092vke.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cDEB/qv6CucTmHQNgDydVo2oFrcDhLlN2KoAFcQJBnM=;
        b=TzceBT4klqr2hxojAxZGu+GIOOLTJZMlHRsm15aQSzPQJe8hofnma5ViLaMGbSn8L1
         Oh0qhCM2jcsd43Nyc8CJuniyP+yHWQCYUd2n/M1SqxrLMFXFKLurx4Wag3EcuVs2esS2
         PfznKQpwvH4tnpXivrdAyJpyx7repec1QSC4spBn/1AYtMQqImJFDD54CLVde5nDtdpu
         5Xx2INCD62wlhlWCkypzxbrUiLLb+97o8r/KsosoREsj0+ey2kYQELq3el2GLZPg2OL+
         SmGDKRfNDZCWVk+/SZX2/ncgkqKwgSaE9kY/rN0Hz2LO218sZkVj1PmxWzeNi1gT5Wh/
         4EsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDEB/qv6CucTmHQNgDydVo2oFrcDhLlN2KoAFcQJBnM=;
        b=G873obXllhGfs55ClvW/TeKHRBRmavqvZnLXmww8qfA67gYQvMawJLl4Hl7rzOTUGK
         AIYj7niN/AUI0BSzuF33w5kovYY1u71dwN4jbp8je/Qii+x1jNIasmLUdKEAAAa6Ieky
         mKlcLZq4hQ3S5aK9BSK2Rkqnm4JIeqQxcD3VA/Xl1bl/iYBd0GXQrABY46puxbSZHs4l
         5dxE34ODXNk4wjed+BGqrZ651D6OshTMlxsQ+jm6qeWZvEInA3AF7B3yMsSWD7k80n+m
         T6Uh4+SLyNBXT3a5nSWLQ/65HbYnXisdu122s67rHOAwSyUmUOH/E0l9FdVUvxq2CGn9
         QLDw==
X-Gm-Message-State: AOAM533a1HowlxLdNKdQUqk1uR3YhjmAVCL4ituF8kYPbhTuIN4FNGo1
	h0ZswM7rKR2BmdNABjIoi4dAZdoIqLEStCCJ0gQ=
X-Google-Smtp-Source: 
 ABdhPJzQtdfXaEb+0FiA42Wg0VZDlBQQago/bYn54qmVEk6Eg8n4Dk9Ry/4Xscd1k/qMbfB4CYP6ypMBt4Z0Wl3RHnQ=
X-Received: by 2002:a05:6122:907:: with SMTP id
 j7mr103566150vka.12.1637234269499;
 Thu, 18 Nov 2021 03:17:49 -0800 (PST)
MIME-Version: 1.0
References: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
 <CAAnfSTvfHM0eBoA8N48=UVBcDPnGUrfkHt21VseMWFOMMe5YwQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvfHM0eBoA8N48=UVBcDPnGUrfkHt21VseMWFOMMe5YwQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Nov 2021 12:17:38 +0100
Message-ID: 
 <CANNYZj_2c2ADAdcavRbOeZk8UZKB9DNM+x-4G-59Jy_bDaovYg@mail.gmail.com>
Subject: Re: [OE-core] how to "prune" dead sstate-cache?
To: Ross Burton <ross@burtonini.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000c331005d10e4f76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 11:17:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158475

--0000000000000c331005d10e4f76
Content-Type: text/plain; charset="UTF-8"

There is a caveat here. This will touch all sstate that is needed to
construct an image, but won't touch sstate needed to build components that
go into the image. So target packages are guaranteed to be kept, but native
items may be deleted - I've seen this with e.g. java compiler that is used
for few specific, rarely changing items.

Alex

On Thu, 18 Nov 2021 at 12:11, Ross Burton <ross@burtonini.com> wrote:

> If you can say that you've touched all the sstate you'll need then the
> find trick is sufficient.  I use it on our CI to prune any sstate that
> hasn't been touched in a month, for example.
>
> The script is more powerful and can selectively save or destroy
> things, but can potentially be more complicated than just nuking
> anything old.
>
> Ross
>
> On Thu, 18 Nov 2021 at 10:38, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
> >
> >
> >   assuming my (correct) understanding of sstate-cache is that, as time
> > goes by, it just gets larger and larger, it will increasingly contain
> > content that is of little value anymore, what is the simplest way to
> > purge or prune entries that are no longer involved in any desired
> > builds?
> >
> >   i'm guessing a simple way to do that is to first delete tmp/, then
> > build any current targets/images, immediately followed by something
> > like:
> >
> >   $ find sstate-cache -type f -atime +1 -delete
> >
> > is there anything fancier than that?
> >
> > rday
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158474):
> https://lists.openembedded.org/g/openembedded-core/message/158474
> Mute This Topic: https://lists.openembedded.org/mt/87140377/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000000c331005d10e4f76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">There is a caveat here. This will touch a=
ll sstate that is needed to construct an image, but won&#39;t touch sstate =
needed to build components that go into the image. So target packages are g=
uaranteed to be kept, but native items may be deleted - I&#39;ve seen this =
with e.g. java compiler that is used for few specific, rarely changing item=
s.</div><div dir=3D"ltr"><br></div><div>Alex<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 18 Nov 2021 at 12:1=
1, Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
If you can say that you&#39;ve touched all the sstate you&#39;ll need then =
the<br>
find trick is sufficient.=C2=A0 I use it on our CI to prune any sstate that=
<br>
hasn&#39;t been touched in a month, for example.<br>
<br>
The script is more powerful and can selectively save or destroy<br>
things, but can potentially be more complicated than just nuking<br>
anything old.<br>
<br>
Ross<br>
<br>
On Thu, 18 Nov 2021 at 10:38, Robert P. J. Day &lt;<a href=3D"mailto:rpjday=
@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0assuming my (correct) understanding of sstate-cache is tha=
t, as time<br>
&gt; goes by, it just gets larger and larger, it will increasingly contain<=
br>
&gt; content that is of little value anymore, what is the simplest way to<b=
r>
&gt; purge or prune entries that are no longer involved in any desired<br>
&gt; builds?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0i&#39;m guessing a simple way to do that is to first delet=
e tmp/, then<br>
&gt; build any current targets/images, immediately followed by something<br=
>
&gt; like:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0$ find sstate-cache -type f -atime +1 -delete<br>
&gt;<br>
&gt; is there anything fancier than that?<br>
&gt;<br>
&gt; rday<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158474): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158474" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158474</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87140377/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87140377/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000c331005d10e4f76--

