Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97FBC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 15:28:50 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.13505.1721834929135471661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 08:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SAkulfYx;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70448cae1e0so3720416a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721834928; x=1722439728; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1bn8yWPWReq44ezF1EoHApwB0iVFsbCeOokZdqIPEk=;
        b=SAkulfYxke7K7gw8Cse7wVWF4eJM2caJhYL34ZPoQ+XeXAvFSwxJJ1RcCsxvndqyKy
         sVhDrnoVBpPMoqHPrqiyQNGxOY3A1/3kgOjPIQ6OScnPn97tOZWqkmJ6ojHE1kRwO5P8
         mtibByS7VQitUCZ1tH9cSAyiRWsuCbtbk4R3EI2NIpIEq/B8Y9YT/P5v4kVtxF+OcFct
         ben1473QrtfXCuA9FNHjpG+MyityPnelWRfzB04xpsgJHDJCMRH6FhqnOoccB/ezkymN
         NzGk2LisVeMaoFUlTagn2YkGbnE4l/PgU3GqBpbNuhe1ID0ZokVGfvTt3kxGOrL2hdny
         fVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721834928; x=1722439728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1bn8yWPWReq44ezF1EoHApwB0iVFsbCeOokZdqIPEk=;
        b=OEq6mwZauEJ3Wl4QHe7CYJDTWC0NUyM15KA3Yhd2e6hon59aKn3YUrS8IY2u2MpYRN
         bjvAwpRRLSDPcDoHd1dQxS+ZOHQPfe4VqNe2EXB9rzpwjLvrgw/NJvqCXye6auAOZeYf
         oUkWngA9BL0v6bhVlWa5Cm32urF9vhEl07kdmZUAMDIMMPO8ZstDXjjd/H/hYqxTkEws
         XtIstppSsSQ1CoaVdBaNH8Rz1PkJYfAE1nGCVi6ARdEkdL3ndMOB4snaZCYyMtd8rnCK
         tJ5KPLIAfaBMArzb24nxaVDBJ2d6ui/gaBu8hkpzlFSBWdg5Mh3wFeGx2PPBdiq9PYMV
         Jd9w==
X-Gm-Message-State: AOJu0Yy1b85JnIHXk5b9T887s8dX5NAVwdZusvYl6H3fBHXvJcnI98/S
	kkRK0j9EcVUDgmdsgufLdpjaBFTL6+NtwKEPMtkv17KyaWGL0Ub4mJR8XOKbri8mcinev9MtAV4
	Vui8m4Z4cl2h5jIJK8OCoUX/tiis=
X-Google-Smtp-Source: AGHT+IGlYMgmo9bF6kLPN2yC9C2NqYfiy/w38Vo7FaecAakLBGtEfdhpRnW4bGw9deO4sYYctQonfmTKFIYMyx7yMmw=
X-Received: by 2002:a05:6358:528b:b0:1ac:f3df:3bde with SMTP id
 e5c5f4694b2df-1acf89f0d53mr19133655d.5.1721834928144; Wed, 24 Jul 2024
 08:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240718165448.1164-1-jose.quaresma@foundries.io>
 <17E35D00CCAB404F.25516@lists.openembedded.org> <CANPvuRngsusxijoCZ9czY84KqDPEX6cSm8SZnho-zo-V5iX4bA@mail.gmail.com>
 <0900f2b2abc49295eec73e28077df4f53bb57c76.camel@linuxfoundation.org>
In-Reply-To: <0900f2b2abc49295eec73e28077df4f53bb57c76.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 24 Jul 2024 16:28:37 +0100
Message-ID: <CANPvuRmjkb7WfO8mBVBERskYVPZ9bR+An1HozCACzNxM-EraJQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 2/2] openssh: upgrade 9.7p1 -> 9.8p1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000410ad4061dffeffa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 15:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202453

--000000000000410ad4061dffeffa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quarta,
24/07/2024 =C3=A0(s) 16:11):

> On Wed, 2024-07-24 at 15:19 +0100, Jose Quaresma via
> lists.openembedded.org wrote:
> > Gentle ping.
>
> When in the branch, this this causes libssh2 ptest failures. I did try
> just queuing patch 1/2 alone but that caused musl failures without 2/2.
>

Sorry I forgot about the libssh2 ptest.
Tomorrow jump on this again.

Jose


>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000410ad4061dffeffa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (quarta, 24/07/2024 =C3=A0(s) 16:11):<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, 2024-07-24 at 15:19 +0100, Jose =
Quaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Gentle=C2=A0ping.<br>
<br>
When in the branch, this this causes libssh2 ptest failures. I did try<br>
just queuing patch 1/2 alone but that caused musl failures without 2/2.<br>=
</blockquote><div><br></div><div>Sorry=C2=A0I forgot about the libssh2 ptes=
t.<br>Tomorrow=C2=A0jump=C2=A0on this again.<br><br>Jose</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000410ad4061dffeffa--

