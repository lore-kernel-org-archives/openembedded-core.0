Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id E806461961
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 20:41:09 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id o42so2884807uad.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 12:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wfKEcR2mPpo8MCjeIyNPGoGcvN1PPQTxINk4eFcAsp4=;
	b=chIO8X/Pbh2IaZ0DVROqQaHQEmJ9xaCoVy5QpU4qggw2uvsFMXO8gc6tDKYxo4klxm
	Dl3SlgINhkdt+Nx/DxuvEyItZ4tLoAvi0W0cHeePILkfjBWLUCM1yjs2eg31xed28AvC
	onl3n7ZHY+N8cNhywStP+dMFfoBls+lS26BYVr15/NpV5LSZ3lrHGMl8QJ+9Mx2fRlfN
	wgLGjYFqECVH0K22tSRoF4shWqDO7T5bcfoOZgZ3KLRrEQID8+d5YqgBB+qoyXx5Db+I
	t3TdbQZcNzufsE4DuZ6nPsbFVjCpiO7hHftAei8VUCU7Xc+zcx0ZDWw5rx/ajroCeBc7
	kLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wfKEcR2mPpo8MCjeIyNPGoGcvN1PPQTxINk4eFcAsp4=;
	b=I2sH0yqDbfBglE0jC4GKl77GiGUR8DdjOKlZKvLMP0o/3iYVDdweVHBJq/GJceCdlM
	T3yIcn6IEdPARvOZN6oF+i7aJG0/awlqj2Bn/OygDq2L1ZNH1fw8Zryk+jfFSUVrXnmI
	yQndbrjIto3k6+kRcY7YJFoArJfmxIMFh18aizIV2jIT0epkoi0kkrSCou232tCc9oWR
	loKNgWleZipMy3GSWm6PrwYEgVhil/ZRCAItG3Uy106Q54LwTEqLCSYveU/shalTxBXz
	zCAxRBRX84NXyYXzWaYLwT4N0GQaWgsoeN13iW1cf/2fvoxdp8NA8xFFKXlPOHXB805/
	xgBw==
X-Gm-Message-State: ANhLgQ1th9jH55bm/WzYfTq5Cb3KC9sZvsRPCyL3bapfaUzENgq4iMRy
	BmvitLjRMPqWmhxCHSKvva7N4QSHfD1/elJtgXs=
X-Google-Smtp-Source: ADFU+vu8wwUX1XsNouImNngXl97nF6HZrOdL3CiFB9aYti+tCV0R+Q+jL9Ne7lJINMs+JHAycP2w1GtV7AZuqs338sY=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr7072687uae.89.1583095270063; 
	Sun, 01 Mar 2020 12:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20200301131353.3470253-1-otavio@ossystems.com.br>
	<CANNYZj_MpJZKA5Nch_QVa64y7Oe_Q+BQgR37dn8n7bmwvbh8Pg@mail.gmail.com>
In-Reply-To: <CANNYZj_MpJZKA5Nch_QVa64y7Oe_Q+BQgR37dn8n7bmwvbh8Pg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 1 Mar 2020 21:40:58 +0100
Message-ID: <CANNYZj_sFrRzxgy5JYHfs4DhF1nJtKLKjx1TWwZb-W179_f5-A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] easysplash: Add recipes for 1.0.0 release
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
X-List-Received-Date: Sun, 01 Mar 2020 20:41:10 -0000
Content-Type: multipart/alternative; boundary="00000000000037c104059fd1173a"

--00000000000037c104059fd1173a
Content-Type: text/plain; charset="UTF-8"

Oh, and: testing this somehow would be nice. Can you add it to the virgl
selftest?

Alex

On Sun, 1 Mar 2020 at 21:39, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sun, 1 Mar 2020 at 14:14, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>
>> +++ b/meta/recipes-core/easysplash/
>> easysplash-bootanimation-default_1.0.bb
>> @@ -0,0 +1,12 @@
>> +SUMMARY = "O.S. Systems default boot animation for easysplash"
>> +LICENSE = "CLOSED"
>>
>
> CLOSED?
>
>
>> +PACKAGECONFIG[mesa-gbm] = "-DDISPLAY_TYPE_GLES=TRUE
>> -DEGL_PLATFORM_GBM=TRUE,,virtual/libgles2 mesa libdrm udev"
>>
>
> This I think should also be enabled by default subject to opengl in
> DISTRO_FEATURES.
>
> Alex
>

--00000000000037c104059fd1173a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Oh, and: testing this somehow would be nice. Can you =
add it to the virgl selftest?</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun=
, 1 Mar 2020 at 21:39, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin=
@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Sun,=
 1 Mar 2020 at 14:14, Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystem=
s.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt; wrote:<br></div=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">+++ b/meta/recipes-core/easysplash/<a href=3D"http://easysplash-bootanim=
ation-default_1.0.bb" rel=3D"noreferrer" target=3D"_blank">easysplash-boota=
nimation-default_1.0.bb</a><br>
@@ -0,0 +1,12 @@<br>
+SUMMARY =3D &quot;O.S. Systems default boot animation for easysplash&quot;=
<br>
+LICENSE =3D &quot;CLOSED&quot;<br></blockquote><div><br></div><div>CLOSED?=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">+PACKAGECONFIG[mesa-gbm] =3D &quot;-DDISPLAY_TYPE_GLES=3DTRUE -DEGL_PLATF=
ORM_GBM=3DTRUE,,virtual/libgles2 mesa libdrm udev&quot;<br></blockquote><di=
v><br></div><div>This I think should also be enabled by default subject to =
opengl in DISTRO_FEATURES.</div><div><br></div><div>Alex<br></div></div></d=
iv>
</blockquote></div>

--00000000000037c104059fd1173a--
