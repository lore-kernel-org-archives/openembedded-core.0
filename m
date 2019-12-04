Return-Path: <anibal.limon@linaro.org>
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48])
	by mail.openembedded.org (Postfix) with ESMTP id 18B177F7E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 20:51:28 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id z17so349134uac.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 12:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ls8afcB0Strdi2cMPWDhTzXhu56je5h5s6ewZTCW2BQ=;
	b=z0eaYA/goCM5/Th3fgLVlXrJPb/RTSOpxmJxZtv0NO1UJOGh70PJWWM4y7QOJDfhZP
	5DvoQD22+bhgoq7Id9bvHghTN5DYmq1AHng2aS+bViOGPp/5UbDIIZ8DlUVtd4+eFLzM
	fLU2z8ISIJ3W03A/t0HM+KVvBG9PnMWWhd1PXr2igPopZupEPkMxFt7IGhBpwpwAabVf
	iVKhltZDWuSiMW81PVObMVv5Wilydu3KrGApjtAxg65Qbzp9+D9HVyqJ2/6RBFQv1rt5
	7dJGErdqCNyc87GOjfjl3MvU4dBnMtoMeGF20T/yIooyxtBIb+VO75x8tMD9JOYakMaa
	1lZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ls8afcB0Strdi2cMPWDhTzXhu56je5h5s6ewZTCW2BQ=;
	b=UEQpyDZl8Z+AtDFysjskkjiI4J9Eec27rb+/XRfKpmUWH4vJOJOJn3IJpxEkh3bDmx
	gVhg0yVmrmbvhF9Hi+G07Tr7TcVx+e4PKb1wJF4se9LAEotF3Mq5fYijVdYaC1XyRgGq
	e2p+nSm8859aiMYsNEok7UF8fJ91Rtw6YajrdtCk7o69qfqAacO6ncKmr3VS6/1SVzm6
	zTRHcZCdHV7RqrR+zbhdwqzMUl5oi4e8o/j7PrTJd2NwO7KzDPUXiSKGy+58C1mJ9+nF
	1J95bvcxECjjvraO1bJBJ75WLK+nB/5eDLlG3krVzUsBTqZH2EGYGSmOAXRf0N0hNb2t
	5jTQ==
X-Gm-Message-State: APjAAAWeeckID3kDabZImLMp+OFFfT/NEUdl9HsSkNvzVb0zNKPlwOyg
	1b6djqRMYeJwZniNo5jmGLk86Aim55BntvtDG3Q1cQ==
X-Google-Smtp-Source: APXvYqxOb9y23exhzXZYi+4Pus5MnrrKXbG4nf8BsBWYkmrSAobbIKbq7apYG00cbiEkhgcnqFTTCg8WkXrd+MGI5vg=
X-Received: by 2002:ab0:7219:: with SMTP id u25mr4239376uao.10.1575492689726; 
	Wed, 04 Dec 2019 12:51:29 -0800 (PST)
MIME-Version: 1.0
References: <20191204184028.14813-1-anibal.limon@linaro.org>
	<CANNYZj8dQGgwgOCg_NohqU4H5eLwAK-aFowLa-ywFpf7-YU3ZQ@mail.gmail.com>
In-Reply-To: <CANNYZj8dQGgwgOCg_NohqU4H5eLwAK-aFowLa-ywFpf7-YU3ZQ@mail.gmail.com>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Wed, 4 Dec 2019 14:51:18 -0600
Message-ID: <CA+_Aqitgf4Q+p2C3n7t_GCo=zygsmC5zMEjJnCT3=QDs5Nq8wg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] meta/recipes-graphics/waffle: Add inherit setuptools
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
X-List-Received-Date: Wed, 04 Dec 2019 20:51:29 -0000
Content-Type: multipart/alternative; boundary="0000000000001e29570598e6faab"

--0000000000001e29570598e6faab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Dec 2019 at 13:15, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Wed, 4 Dec 2019 at 20:04, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.=
org> wrote:
>
>> -inherit meson features_check lib_package bash-completion
>> +inherit meson setuptools3 features_check lib_package bash-completion
>>
>
> I don't think you actually need setuptools3 here, just target python3
> dependency is enough.
>

Actually doesn't need python3 it needs python3-native with setuptools, not
need to depend of python3 for the target.

Anibal


>
> Alex
>

--0000000000001e29570598e6faab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 4 Dec 2019 at 13:15, Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Dec 2019 at 20:04, An=C3=ADb=
al Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org" target=3D"_bla=
nk">anibal.limon@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">-inherit meson featur=
es_check lib_package bash-completion<br>
+inherit meson setuptools3 features_check lib_package bash-completion<br></=
blockquote><div><br></div><div>I don&#39;t think you actually need setuptoo=
ls3 here, just target python3 dependency is enough.</div></div></div></bloc=
kquote><div><br></div><div>Actually doesn&#39;t=C2=A0need python3 it needs =
python3-native with setuptools, not need to depend of=C2=A0python3=C2=A0for=
 the target.</div><div><br></div><div>Anibal</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gm=
ail_quote"><div><br></div><div>Alex<br></div></div></div>
</blockquote></div></div>

--0000000000001e29570598e6faab--
