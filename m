Return-Path: <ncaidin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728E4C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 13:50:51 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.186862.1698760248478443648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 06:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JJmmtjfS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.44, mailfrom: ncaidin@linuxfoundation.org)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1efa01323b4so2019203fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698760248; x=1699365048; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xr8O6O4ap9gTdEk2pCPB41RQXT3YnQRgx8xZ6XR5N+4=;
        b=JJmmtjfSDsU5ue/iTmfKAVOAa9rnEBJFF6/D/6pSWvuOGD6xTR++rSB6OaCYSEn05z
         Y54uOOuRgkNxSUsyv+pAFm7wXADfgexZLtaCs4zgAOaTiYXin9YplhCNkP8dwWOj2DRZ
         pW6UujPzNGSLBnCEYPMlJfKAZTOv++scNNC8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698760248; x=1699365048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xr8O6O4ap9gTdEk2pCPB41RQXT3YnQRgx8xZ6XR5N+4=;
        b=eNrVrkzcVTywrW6hSwXet6Iya2A/NoEA+WApkrra9cYSTeYNi36qfj/cfKCDPoNMv6
         NdqZKpxAzaagddxz4Dkb0rBpKeilsZNGHO0mmDxq2ngVZcA+8VJ1xLGcTLfkcNtdsLv0
         xIlEwN1RhtS6xHLaaiYh1yKl04E047PivCQoWjJ879CZ/UPTDhXuWK4OsUGbM7iLjCci
         Q7PRpMMt1VtPA0JghZFNTbRjeAnhqAxWQxu/5UtTo+14eT8f9bcD5J9ZB3OKRU/w4Dc+
         UjPzuTYppsDDFj7a42sR8iq8KuCoxV3ARS1Y2qO3nYU1llZ47Fw4qBZno0WZAxHh5z1I
         9i2A==
X-Gm-Message-State: AOJu0YzBIYRxMn6P0Ht/XnHSgtjtPuGjx6m9m+me0Md476CsRbtKWVXS
	641EV36tFltuV7HtEcMUjtAyqtKp027Sj52k29DxEQ==
X-Google-Smtp-Source: AGHT+IFdeO8ahc7Jv2x0LGw5c4gVV8Qrk/K0D/mVYbGY71isgJQh462D6E/45s6vnlJzsQNVrqsk+vozOewCo/1JCoo=
X-Received: by 2002:a05:6870:1316:b0:1f0:18a0:918a with SMTP id
 22-20020a056870131600b001f018a0918amr909835oab.0.1698760246784; Tue, 31 Oct
 2023 06:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAODMxsJ2Wsd6fURK_JLP-YTtOSqVknZnJ87BNN8jVOGQ4J_=Bw@mail.gmail.com>
 <b5624398-79ea-4838-ace2-774fac6f787a@bootlin.com>
In-Reply-To: <b5624398-79ea-4838-ace2-774fac6f787a@bootlin.com>
From: Neal Caidin <ncaidin@linuxfoundation.org>
Date: Tue, 31 Oct 2023 09:50:30 -0400
Message-ID: <CAODMxsLNugbBbjxkDgmAcW3YjDLKU+Mj=YWvjLDrSiG+g_q2mw@mail.gmail.com>
Subject: Re: [yocto] Yocto Project Status 31 October 2023 (WW44)
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	Stephen Jolley <sjolley.yp.pm@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001194f106090371a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 13:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189842

--0000000000001194f106090371a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes! You are correct Michael. This is that strange in-between week. Next
week it goes back to 17:00 CET.

Good catch!

-- Neal

*Neal Caidin*
Program Manager
The Linux Foundation
Durham, NC, U.S.A. - Eastern time zone
+1 (919) 238-9104 (w/h)
+1 (919) 949-1861 (m)
ncaidin@linuxfoundation.org




On Tue, Oct 31, 2023 at 9:33=E2=80=AFAM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Greetings,
>
> On 31.10.23 at 13:29, Neal Caidin wrote:
> >
> > Current Dev Position: YP 4.3 M4 (Feature Freeze)
> >
> > Next Deadline: 2nd October 2023 YP 4.3 M4 build date
> >
> >
> > Next Team Meetings:
> >
> >  *
> >
> >     Bug Triage meeting Thursday November 2, 7:30 am PDT
> >     (https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09
> >     <https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09=
>)
> >
> >  *
> >
> >     Weekly Project Engineering Sync Tuesday October 31st at 8 am PDT
> >     (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
> >     <https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09=
>)
> >     <https://zoom.us/j/990892712>
> >
>
> Reminder: this week 8:00 PDT translates to 16:00 CET if I understood
> correctly. That's one hour earlier because daylight saving time changes
> happen in Europe 1 week earlier than in the USA.
>
> Michael.
> --
>
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000001194f106090371a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes! You are correct Michael. This is that strange in-betw=
een week. Next week it goes back to 17:00 CET.<div><br></div><div>Good catc=
h!</div><div><br></div><div>-- Neal</div><div><br clear=3D"all"><div><div d=
ir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><span><font color=3D"#888888"><div dir=
=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><b style=3D"color:rgb(136,136=
,136)"><font color=3D"#666666"><font color=3D"#888888">Neal Caidin</font></=
font></b><br><div style=3D"color:rgb(136,136,136)"><span style=3D"border-co=
llapse:collapse"><div><font color=3D"#666666"><font>Program Manager=C2=A0</=
font></font></div><div><font color=3D"#666666"><font>The Linux Foundation</=
font></font></div><div><font color=3D"#666666"><font>Durham, NC, U.S.A. - E=
astern time zone</font></font></div><div><font color=3D"#666666">+1 (919) 2=
38-9104 (w/h)<br>+1 (919) 949-1861 (m)</font></div><div><font color=3D"#666=
666"><a href=3D"mailto:ncaidin@linuxfoundation.org" target=3D"_blank">ncaid=
in@linuxfoundation.org</a></font></div><div><br></div><div><br></div></span=
></div></div></div></div></div></div></div></div></div></div></font></span>=
</div></div></div></div></div><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at 9:33=E2=80=
=AFAM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.c=
om">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Greetings,<br>
<br>
On 31.10.23 at 13:29, Neal Caidin wrote:<br>
&gt;<br>
&gt; Current Dev Position: YP 4.3 M4 (Feature Freeze)<br>
&gt;<br>
&gt; Next Deadline: 2nd October 2023 YP 4.3 M4 build date<br>
&gt;<br>
&gt;<br>
&gt; Next Team Meetings:<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Bug Triage meeting Thursday November 2, 7:30 am PDT=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa=
2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" rel=3D"noreferrer" target=3D"_blank">https://z=
oom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://zoom.us/j/454367603?pwd=3DZG=
xoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" rel=3D"noreferrer" target=3D"_blank">https:=
//zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</a>&gt;)<br>
&gt;<br>
&gt;=C2=A0 *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Weekly Project Engineering Sync Tuesday October 31s=
t at 8 am PDT<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1M=
jhoM2x6ck81bkcrYjRrcmJsUT09" rel=3D"noreferrer" target=3D"_blank">https://z=
oom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://zoom.us/j/990892712?pwd=3DcH=
U1MjhoM2x6ck81bkcrYjRrcmJsUT09" rel=3D"noreferrer" target=3D"_blank">https:=
//zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</a>&gt;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://zoom.us/j/990892712" rel=3D"=
noreferrer" target=3D"_blank">https://zoom.us/j/990892712</a>&gt;<br>
&gt;<br>
<br>
Reminder: this week 8:00 PDT translates to 16:00 CET if I understood <br>
correctly. That&#39;s one hour earlier because daylight saving time changes=
 <br>
happen in Europe 1 week earlier than in the USA.<br>
<br>
Michael.<br>
-- <br>
<br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--0000000000001194f106090371a8--

