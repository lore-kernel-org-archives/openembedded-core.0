Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B82C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 23:37:09 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.1039.1645054628217655814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JxYg1Twx;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id d23so6716227lfv.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S4UP55r4Gbb6rChwiQO4895vjOboQEx+Pw2TmeZej64=;
        b=JxYg1TwxuYEu0Tx77OJDnG1jpStkmBAYOgAkVWRDfpmWoRNdLll8S0DBZcs78rrG6C
         TXeeS60YPnhn6jJ8eeAUI1aVq3hDNxEcAabwBOoXVsMwqou844qi2V7GogH7eeURW5At
         17pXAeAE3lm42opQBWPdXIpFx4/qvpc0TQg68DxcJWzKj4mlckBpd4PvALuAFCRQd+0B
         68txaIiDz4krkGZTzs3McC9KVHr25xBWSCuEMG1cLhmtuRrE0ygv9bLMhuJWvcoNKRQ0
         x4QyMlADhO5x0xYfQ/wdZmJKJ+dvQJ9BU06VIesurM8/k4vKFPunPdnpZA5waJgCTeph
         hC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S4UP55r4Gbb6rChwiQO4895vjOboQEx+Pw2TmeZej64=;
        b=k6CXy9p9I2dsHMyHOWuzHuYe75Hn0T3ct1EijxPJFevsokY3IAfvSenVgzarDu1Ebn
         aLTqcUsAqNJl/cRLszt5ISqZY9dvFLZavHuZnB9xl9c8LC3OqzcpZIhxqZA+utTUvr5x
         LU3ThMQR9wNZdl5Lfg7RQVqBrSNEfnSGtx0fSFeGzlGWxHef9JnqSybGVpUHoL/Ug3xF
         ke+0UtQimi/jwfg395fuZdY3LFfiE2DTZyOmqjgPxMUqQvhXqROc3dx6ipJf6/zVIJA5
         /zkxODAA5R8EniloMSMMw3/vyjV6hQemQXpjGhihEJmx6BTVC+a6ZZB8C4Z4v5x3cqvX
         ogJg==
X-Gm-Message-State: AOAM531UYwu2TB8RXEP1pJtK8ihdlrvuPtEaRtU/LHxFZRgQmXW46bGS
	ZTfLdJJ51WmEue5yeC2CJnd3zxLCh2pj3KWXm0Q=
X-Google-Smtp-Source: 
 ABdhPJzX/srvWfvViLMZnL9SKY2NYkkHgOpZYUqPG0so8KG5LRzw7TUZrc/mMXNsz8MtEDEI4PDAlmfVd/UyA5Ocyt8=
X-Received: by 2002:ac2:4855:0:b0:443:888e:5982 with SMTP id
 21-20020ac24855000000b00443888e5982mr247113lfy.447.1645054626235; Wed, 16 Feb
 2022 15:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
 <20220207010823.143664-7-quaresma.jose@gmail.com>
 <dcb645fd99ba4e2ebdda348373486076@axis.com>
In-Reply-To: <dcb645fd99ba4e2ebdda348373486076@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 16 Feb 2022 23:36:55 +0000
Message-ID: 
 <CANPvuRmq_w6NwwSE0rDpMOAdWp_j4bk0D2xA5Sc_F5OEarBGqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a20e2c05d82b20f2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 23:37:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161787

--000000000000a20e2c05d82b20f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia quarta,
9/02/2022 =C3=A0(s) 19:09:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Jose Quaresma
> > Sent: den 7 februari 2022 02:08
> > To: openembedded-core@lists.openembedded.org
> > Cc: Jose Quaresma <quaresma.jose@gmail.com>
> > Subject: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
> >
> > - License update:
> >   The code actually is LGPLv2.1 but the COPYING file is wrong.
> >
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce1=
75b167611a4cb019599d9017042
>
> Since the COPYING file for the GStreamer sub-projects now states
> that the used license is LGPL-2.1, shouldn't the LICENSE for these
> recipes be updated to say "LGPL-2.1-or-later"?
>
> As for -bad and -ugly, they should really have individual LICENSE:foo
> for each generated package, so that only the packages that are affected
> by the GPL license includes it, and the others only specify LGPL.
>
> //Peter
>
>
I have sent a patch for that with your suggestion.
I change the LICENSE_FLAGS based on the new gpl as well.
https://patchwork.yoctoproject.org/project/oe-core/patch/20220216232803.186=
8265-1-quaresma.jose@gmail.com/

Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a20e2c05d82b20f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjelle=
rstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; escreveu no dia quarta=
, 9/02/2022 =C3=A0(s) 19:09:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Jose Quaresma<br>
&gt; Sent: den 7 februari 2022 02:08<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" targe=
t=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -&gt; 1.=
20.0<br>
&gt; <br>
&gt; - License update:<br>
&gt;=C2=A0 =C2=A0The code actually is LGPLv2.1 but the COPYING file is wron=
g.<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstrea=
mer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042" rel=3D"noreferrer" t=
arget=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commi=
t/d157b23fb0ce175b167611a4cb019599d9017042</a><br>
<br>
Since the COPYING file for the GStreamer sub-projects now states <br>
that the used license is LGPL-2.1, shouldn&#39;t the LICENSE for these <br>
recipes be updated to say &quot;LGPL-2.1-or-later&quot;?<br>
<br>
As for -bad and -ugly, they should really have individual LICENSE:foo <br>
for each generated package, so that only the packages that are affected <br=
>
by the GPL license includes it, and the others only specify LGPL.<br>
<br>
//Peter<br>
<br>
</blockquote></div><div><br></div><div>I have sent a patch for that with yo=
ur suggestion.</div><div>I change the=C2=A0LICENSE_FLAGS based on the new g=
pl as well.</div><div><a href=3D"https://patchwork.yoctoproject.org/project=
/oe-core/patch/20220216232803.1868265-1-quaresma.jose@gmail.com/">https://p=
atchwork.yoctoproject.org/project/oe-core/patch/20220216232803.1868265-1-qu=
aresma.jose@gmail.com/</a><br></div><div><br></div>Jose<br clear=3D"all"><d=
iv><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></div>

--000000000000a20e2c05d82b20f2--

