Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2497EF18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 14:40:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l2so44971244wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0gxhC6WOYEKWuxQS5crH6LHUltGsE2DSN5OwvEi5tBc=;
	b=vJ/UI0BDzm78WiEJSZC4XRrY8k42EOiQZJZ38vfR7pp2XWTYn7Xi4gbkD+og0vsoAB
	zlTwq02EX1zmuwUzcV4rql28zWgoWeSiWfY8O60lfssIDArozTJfhSYmxmcUihBS3Qmm
	9WVuTjo+vPEiRCZAI7z6dSQmlPrqdS1/23No5JjLhA1iiKPzBzSgIbSSRLzfQgfJE/70
	REguCcaDxPlQedj3zrb73qZOgvh9rEANz0j9nbH6cTqwT9PMxik6E6VJgIjS0m4lr9jh
	88Fu7adfCwB0n+BCbnpsVOzMchI5qDSRhJbGUgb6mgEiGz2rcM8+n9dIxO+d9/MA1T4e
	mgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0gxhC6WOYEKWuxQS5crH6LHUltGsE2DSN5OwvEi5tBc=;
	b=WpT5fQxGF2cPK/L0QmehNtfhXoa+CzE04rta4f1XWoMeiKRPlQVzOeKUoxobkwAjFU
	BaS0g3/BPtdao3oNMTx5Yle/S7rV4UHYTmUbBVo5VJuxQ+oxCIuws9OdUhIOdFRsUTp1
	ggRRlW3af2oAYTGpfjNRpcGIjA4nHXBPlB6XBG9gEwDXgGHVN6rFI5sL6jI1dosodQUp
	VOZjReUwe2si5he8oTJRq7zgvsqcodDTrLvk16Pdc026+a1DrDPhULeGt2NnILf1T94e
	Mw/c2O22nxOBNj1rXTP/EYc9tYWq4zyzDj8rnMryVDF29vlkhGX1qBfsmJdldS6eOAVl
	s1CA==
X-Gm-Message-State: APjAAAXvXZDiCLztleCMzMTJcsc9v1Xcb5PEzYgWfT3kpeXEVUK70oHC
	tUN0XzTQ0dJdDD9zawd7iyLVEmQ02lYfrgcjRfQ=
X-Google-Smtp-Source: APXvYqz5uhitK53+CAnUOuqd+eHT5oFx6nWaa4FqwX/amofoWaqcmSWcDaqFavxUfHQvvO4tOGe5SC4Grz0K/3MuMlQ=
X-Received: by 2002:a05:600c:23cd:: with SMTP id
	p13mr73948993wmb.86.1564065608133; 
	Thu, 25 Jul 2019 07:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <1564054891-8168-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LZas-J9VBo1UyHOatWQXi0TKsSydBB21H=L3wEXCvk1Aw@mail.gmail.com>
In-Reply-To: <CAJTo0LZas-J9VBo1UyHOatWQXi0TKsSydBB21H=L3wEXCvk1Aw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 25 Jul 2019 22:39:57 +0800
Message-ID: <CALatG=6TgEG7_Zf0ZKc-S2k4Jd_zuMgOjhhnovET=Bdx6GQsUQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 25 Jul 2019 14:40:07 -0000
Content-Type: multipart/alternative; boundary="000000000000fa7039058e8266a8"

--000000000000fa7039058e8266a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I did not describe it correctly, as Stefan said, it=E2=80=99s not a =
build
issue with meson, but we need explicitly set the remoting option on or off
 , or else we will have a gstreamer dependency missing issue. I will change
the commit message here in V2.

//Ming Liu

On Thu, 25 Jul 2019 at 12:42, <liu.ming50@gmail.com> wrote:
> > - Introduce remoting package config, without it meson would run into a
> >   build error.
>
> Did you tell upstream about this?
>
> Ross
>

--000000000000fa7039058e8266a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Sorry, I did not describe it correctly, as Stefan sa=
id, it=E2=80=99s not a build issue with meson, but we need explicitly set t=
he remoting option on or off =C2=A0, or else we will have a gstreamer depen=
dency missing issue. I will change the commit message here in V2.</div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">//Ming Liu</div><div><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Thu, 25 Jul 2019 at 12:42, &lt;<a href=3D"mailt=
o:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrot=
e:<br>
&gt; - Introduce remoting package config, without it meson would run into a=
<br>
&gt;=C2=A0 =C2=A0build error.<br>
<br>
Did you tell upstream about this?<br>
<br>
Ross<br>
</blockquote></div></div>

--000000000000fa7039058e8266a8--
