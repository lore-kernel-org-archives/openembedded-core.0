Return-Path: <gizero@gmail.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id AA9F3780C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 14:23:23 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id x125so11184652ywa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 07:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=McKNhrRqas+g0BDkQjH0E9h/ih1/zYSeEXe6qEn5ntQ=;
	b=rcAWmBiVLcLebjv9HBj5TdFYD4k0Ws2NBCv+fWYpXPx7kMmMGzCFqRWPxqAfqqghCH
	eQfAzJT/iVsAY4cpGCc4iWtj3ES07YGxjnBOKPv253Vh9h1Cpz6znv/avoEIZzN5hUu+
	TQTslm9xaexMctR6Bc/IHWpHtcehXGF30jE1rQiDqFNFPvDOdTL/1Q2sgjk/TpIFXTNe
	JYUUfCgNKlBKGRbrTA/Ceik0bmQmv+jfkTK17XFMuWdKzc4GuRBDfsDK/avP+5CBQGWY
	j8HPZckulexuRwJ6SlDfyUlkHB0xPZiaMF5wwwqR2zBMB5kePlRb7PaEF92HFyRV7xUi
	ZZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=McKNhrRqas+g0BDkQjH0E9h/ih1/zYSeEXe6qEn5ntQ=;
	b=AZ8EW/06hqmzwko+GXfRSXpba5SPB6kmRn503pRmehQHQ0DvD03kkRaNqZpqA1EvK9
	IaK0laYThIrcVIh8001wuBwtBVzhgNS26dJ62wVVEG27W6HG3tD6mCqqY4zgqmucgMyv
	oAqgG0rn0w52NDOPZhe94iwVTetzRRxbveSGwReOyAEC26ib23rNQGBKnHVfQB65xRAP
	CZqDfcouTnUj9Ssnuqyl311CeLHvWRfx7DGjvAY53vFDI2X0pep8UcfqLWhsPkGsGR7l
	23y/3h48eZxTwA4S6rkI4bTG1cr+GW9lZLnMkqmP2Gq/AItuK1rTVglKcTAzkGy/eR6E
	i2NQ==
X-Gm-Message-State: AIVw112GmIGHuPucI0ORgKuvPLHPoEvczsK1qV3jKSfN5xq11RHXHzo3
	hSZ/jXw93qTm4MJ6/wkFJLevdo4ZTA==
X-Received: by 10.129.83.5 with SMTP id h5mr2563342ywb.51.1499869404088; Wed,
	12 Jul 2017 07:23:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Wed, 12 Jul 2017 07:23:23 -0700 (PDT)
Received: by 10.13.200.129 with HTTP; Wed, 12 Jul 2017 07:23:23 -0700 (PDT)
In-Reply-To: <cover.1499860838.git.jussi.kukkonen@intel.com>
References: <cover.1499860838.git.jussi.kukkonen@intel.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 12 Jul 2017 16:23:23 +0200
Message-ID: <CAC+thW1v+OOdrpzLbbbq1qHXsNXO-n-D1QJSfqLK3ZYidgmUXA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] mesa: Improve Khronos header handling
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
X-List-Received-Date: Wed, 12 Jul 2017 14:23:25 -0000
Content-Type: multipart/alternative; boundary="001a114d8b380a66d405541f8fcf"

--001a114d8b380a66d405541f8fcf
Content-Type: text/plain; charset="UTF-8"

Il 12 lug 2017 2:11 PM, "Jussi Kukkonen" <jussi.kukkonen@intel.com> ha
scritto:

Andrea: can you please confirm if this fixes the issue with
meta-raspberrypi (the second patch is just cosmetic)?


I'll give it a spin as soon as I find some spare cycles! BTW, thank you
guys for looking into it!


This should fix mesa-gl and RPi userland conflict by not installing
khrplatform.h in mesa-gl. I decided to do an actual mesa patch instead
of a do_install_append() based on positive comments from upstream.

As a side note: the header is now installed in libegl-mesa-dev which
is not really correct. I'll see about fixing this in a later patch.

Cheers,
  Jussi

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/khr-headers
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/khr-headers

Jussi Kukkonen (2):
  mesa: Avoid installing khrplatfrom.h when not needed
  mesa-gl: Clean recipe

 ...ly-install-khrplatform.h-with-EGL-or-GLES.patch | 52
++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb       |  4 --
 meta/recipes-graphics/mesa/mesa_17.1.4.bb          |  1 +
 3 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-mapi-Only-install-
khrplatform.h-with-EGL-or-GLES.patch

--
2.1.4

--001a114d8b380a66d405541f8fcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">Il 12 lug 2017 2:11 PM, &quot;Jussi Kukkonen&quot; &lt;<a href=3D=
"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; ha scrit=
to:<br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Andrea: can you please=
 confirm if this fixes the issue with<br>
meta-raspberrypi (the second patch is just cosmetic)?<br></blockquote></div=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll give it=
 a spin as soon as I find some spare cycles! BTW, thank you guys for lookin=
g into it!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
This should fix mesa-gl and RPi userland conflict by not installing<br>
khrplatform.h in mesa-gl. I decided to do an actual mesa patch instead<br>
of a do_install_append() based on positive comments from upstream.<br>
<br>
As a side note: the header is now installed in libegl-mesa-dev which<br>
is not really correct. I&#39;ll see about fixing this in a later patch.<br>
<br>
Cheers,<br>
=C2=A0 Jussi<br>
<br>
The following changes since commit 81498aac9560fbeaeb58eaada32ce8<wbr>0e0ea=
51628:<br>
<br>
=C2=A0 yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100=
)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/<wbr>poky-contrib</a> jku/=
khr-headers<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Djku/khr-headers" rel=3D"noreferrer" target=3D"_blank">http://git.yoctopr=
oject.org/<wbr>cgit.cgi/poky-contrib/log/?h=3D<wbr>jku/khr-headers</a><br>
<br>
Jussi Kukkonen (2):<br>
=C2=A0 mesa: Avoid installing khrplatfrom.h when not needed<br>
=C2=A0 mesa-gl: Clean recipe<br>
<br>
=C2=A0...ly-install-khrplatform.h-<wbr>with-EGL-or-GLES.patch | 52 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_17.1.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 --<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">mes<wbr>a_17.1.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A03 files changed, 53 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/<wbr>files/0001-mapi-On=
ly-install-<wbr>khrplatform.h-with-EGL-or-<wbr>GLES.patch<br>
<font color=3D"#888888"><br>
--<br>
2.1.4<br>
<br>
</font></blockquote></div><br></div></div></div>

--001a114d8b380a66d405541f8fcf--
