Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7757CF88
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 02:44:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s3so49397012wms.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 19:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yzF4BT37hgoI0LZg4JFZYynP3JAf20QuR5bZuKUt5R4=;
	b=Aqa/ERONl5z38asCJOcSUciyfmHeOJM9tMMYDf4K36lLo/PPlduvOw2cgRUxJzniU8
	y1bul/wVGKbQKUHHDNxBtToo9cvFcw1oc+6Vl6WUiWKq2AGBpxUZXlxA7z8RIIoU+lg9
	GoZBpR2HrW9RDCq63UCHIZkPCjIW7E+BsY3FILleNodJRHkxuuZIQvuLEXlv34F8RFzE
	FxVHygssvJhLrui5cflHH7j9v8UvuOfTuEQvcuVGJgnEUEa3pToho+wIRB9lQA5nq9Ym
	ihYq85hfecqIl/Y15jIamJI2VZUA/RLd1poGfLCctD18srG3GPTvIdKupBZQcbQleMCO
	D00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yzF4BT37hgoI0LZg4JFZYynP3JAf20QuR5bZuKUt5R4=;
	b=GwjPJpFxCCwOugIeUGQF1IeywQqC8xVdfdSU+3MnQhnyxcl33Tgk7fOXB6xMr3ZVP9
	Bbmqo5IkJEoVA6x1FfLifRxSov+9F/METTqspfShiydwEq+cHQ02oDbka/Jh0BxGjavz
	XagDQ57met25FTjWdSYRf2wBfSRsOroWYDZxo8xbo6Vw7I+nWp2p5fOswBFhbMLt/8Lk
	yUNYd8rXfSdAtPWhditk8PclgsecxN0mrE/ctTTc2L13AaG/wNo0tbM99hEVTLfORelP
	/NBYYQD6ljQd+6SkcLisc/VaXgUr5r3TwZX8J7IcsZIIF7K3BSeOoxd4Ir/BFghBwOel
	LE6g==
X-Gm-Message-State: APjAAAUeGkTeteNqvOPA2OpugSyAFNLaqqtKnfL1K90id/7kLWlGIMg8
	FMeCzj/vXISy121RtQmGJO1geWRN4+D5gbbhis8=
X-Google-Smtp-Source: APXvYqx0902E4X84coMSsuGRfa6kSAL9DSxQrRy2IsbJaS4XvSXUBsECHTxeQ7lhobVa18uSKe4N5zv/lXmYcsBRTKs=
X-Received: by 2002:a1c:7ec7:: with SMTP id z190mr85593542wmc.17.1564195496438;
	Fri, 26 Jul 2019 19:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <1564054891-8168-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LZas-J9VBo1UyHOatWQXi0TKsSydBB21H=L3wEXCvk1Aw@mail.gmail.com>
	<CALatG=6TgEG7_Zf0ZKc-S2k4Jd_zuMgOjhhnovET=Bdx6GQsUQ@mail.gmail.com>
In-Reply-To: <CALatG=6TgEG7_Zf0ZKc-S2k4Jd_zuMgOjhhnovET=Bdx6GQsUQ@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Sat, 27 Jul 2019 10:44:45 +0800
Message-ID: <CALatG=7vRbyWBUQOAtOG46PgcXLARO-3Kx7LNjQQuSdz_-dvHQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, "denys@ti.com" <denys@ti.com>
Cc: Ming Liu <ming.liu@toradex.com>, luka.pivk@toradex.com,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: change to use meson build system
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Jul 2019 02:44:56 -0000
Content-Type: multipart/alternative; boundary="000000000000ecb256058ea0a441"

--000000000000ecb256058ea0a441
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI,
I have made a V2 patch, but I noticed Denys Dmytriyenko had sent a patch to
upgrade weston from 6.0.0 to 6.0.1, I would like to send out the V2 patch
later after it=E2=80=99s merged.

//Ming Liu


Sorry, I did not describe it correctly, as Stefan said, it=E2=80=99s not a =
build
> issue with meson, but we need explicitly set the remoting option on or of=
f
>  , or else we will have a gstreamer dependency missing issue. I will chan=
ge
> the commit message here in V2.
>
> //Ming Liu
>
> On Thu, 25 Jul 2019 at 12:42, <liu.ming50@gmail.com> wrote:
>> > - Introduce remoting package config, without it meson would run into a
>> >   build error.
>>
>> Did you tell upstream about this?
>>
>> Ross
>>
>

--000000000000ecb256058ea0a441
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">FYI,</div></div><div><div dir=3D"auto">I have made a=
 V2 patch, but I noticed Denys Dmytriyenko had sent a patch to upgrade west=
on from 6.0.0 to 6.0.1, I would like to send out the V2 patch later after i=
t=E2=80=99s merged.</div><div dir=3D"auto"><br></div><div dir=3D"auto">//Mi=
ng Liu</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div><div dir=3D"auto">Sorry=
, I did not describe it correctly, as Stefan said, it=E2=80=99s not a build=
 issue with meson, but we need explicitly set the remoting option on or off=
 =C2=A0, or else we will have a gstreamer dependency missing issue. I will =
change the commit message here in V2.</div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">//Ming Liu</div><div><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Thu, 25 Jul 2019 at 12:42, &lt;<a href=3D"mailto:liu.ming50@gmail.com" targ=
et=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt; - Introduce remoting package config, without it meson would run into a=
<br>
&gt;=C2=A0 =C2=A0build error.<br>
<br>
Did you tell upstream about this?<br>
<br>
Ross<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000ecb256058ea0a441--
