Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A71F17E466
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 08:37:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so1596063wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fawDZPsDCS5iOmi+9mUvGZ0APEy3aBpQ+tLuUTgluNo=;
	b=PLdJ82Dq6yMwWgCqRaFfg8y7hOnestUitaP0eaCkXfQtS2SOJtkhngxOlruwhT9KSB
	bL5Iyytg0XHcz3WAbgztowbS2x4TslPGcPyWIimu70UOOz0za7HrZQ/3Wuq8R/FkI+DC
	WgD9ph9VbZMGg1F01sRYVMwifkuF12TEV8jKOx3kvm3mYG+VK06hpi/XfjhWZInMPfcj
	jxwN/E7ZDQh9U/TGlWsoMPv0+KXPrNcdrCw3SQVm1jNJeoS7d1KpkOu5laVTMu+zTdA9
	nngwFWhjWvK6VxHnTUZXqmJkvnFyDInktuk/yyZU+zA/9EzS5fa/NnFtMwXmApzrBQ+C
	2gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fawDZPsDCS5iOmi+9mUvGZ0APEy3aBpQ+tLuUTgluNo=;
	b=qIFrHDv0XXR+TJT9Bj0QrTJbsO/72x4eBlP3I8/4oqLg2mu9xWnN2z2nwtMmAg/NNm
	eQlbn6T2Zk7y1ACHgT21gS7qdli3WNKWaEPHtA3lgaPuYFJIQ9N4xXQZYVBoTLFRElvP
	9huwWIJudpVtvjzq95+DvryUJkD3hMCtvACtQciwFEgusn/1bm45UHqwfE7n9iR2av+O
	qDayoUGImpxOMlBBaW1P8fx9CHyWujorDZDu1VJ2VTHtvzEbdhHVlzZJdlxu830Ftm/m
	tY7JRUMtVQVQfsrPd+lzzVnFmtEQDpfZBf1OP1VZr6nUvIP7pu7tGoArA3pvHskoyYvl
	dXNQ==
X-Gm-Message-State: APjAAAXLEi7F05DiEYDhM8nvgJxCannSJkZz9LobgHUJ10PYum95XBaa
	IVkCNrbHOUCUTO2HcABQyD8UKmntxxViCAGM2+o=
X-Google-Smtp-Source: APXvYqyvk6QXdWlGMrveji/AzbFa/y1bIeDrWDZuPCB3TRHTLrx8+dZmTAF4XZIez3EPnzU2xKRIBtsKOqVIvJeYG9s=
X-Received: by 2002:adf:9267:: with SMTP id 94mr36484638wrj.338.1560415034390; 
	Thu, 13 Jun 2019 01:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <1557087292-30921-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LaskMp781L1nraafVxf49Zmz8qsJ=KR0XegdoAUtSRQqw@mail.gmail.com>
In-Reply-To: <CAJTo0LaskMp781L1nraafVxf49Zmz8qsJ=KR0XegdoAUtSRQqw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 13 Jun 2019 10:37:03 +0200
Message-ID: <CALatG=7Zxd35Ryzx+6HvH9EdfnehwmXbbri4hAs3Ju2bnNtXaw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: gerard.salvatella@toradex.com, Luka Pivk <luka.pivk@toradex.com>,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/2] Split out libx11-locale from libx11
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
X-List-Received-Date: Thu, 13 Jun 2019 08:37:15 -0000
Content-Type: multipart/alternative; boundary="000000000000d3bdca058b306f8f"

--000000000000d3bdca058b306f8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI, Burton:

Thanks for the comments, will do a V3.

the best,
thank you

Burton, Ross <ross.burton@intel.com> =E6=96=BC 2019=E5=B9=B46=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:47=E5=AF=AB=E9=81=93=EF=BC=9A

> I didn't make myself clear.  To reduce the amount of moving parts and
> changes I propose:
>
> 1) libx11 and libx11-diet are untouched
> 2) New recipe libx11-compose-data which just ships the compose data,
> assuming that is all that is needed by xkeyboard-config's Compose
> handling.  Refuses to build if x11 is in DISTRO_FEATURES
> 3) xkeyboard-config depends on either libx11 or libx11-compose-data,
> depending whether x11 is in DISTRO_FEATURES
>
> Ross
>
> On Sun, 5 May 2019 at 21:15, <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Changes in V2:
> > 1 As suggested by Ross Burton, split out libx11-locale from libx11
> > as a standalone recipe.
> >
> > Ming Liu (2):
> >   libx11: split out libx11-locale
> >   libxkbcommon: RDEPENDS on libx11-locale
> >
> >  .../recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb |  1 -
> >  .../libx11-locale/0001-Drop-x11-dependencies.patch | 86
> ++++++++++++++++++++++
> >  .../xorg-lib/libx11-locale_1.6.7.bb                | 32 ++++++++
> >  meta/recipes-graphics/xorg-lib/libx11.inc          |  8 +-
> >  .../xorg-lib/libxkbcommon_0.8.4.bb                 |  4 +
> >  5 files changed, 129 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta/recipes-graphics/xorg-lib/libx11-locale/0001-Drop-x11-dependencies.p=
atch
> >  create mode 100644 meta/recipes-graphics/xorg-lib/
> libx11-locale_1.6.7.bb
> >
> > --
> > 2.7.4
> >
>

--000000000000d3bdca058b306f8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI, Burton:<div><br></div><div>Thanks for the comments, wi=
ll do a V3.</div><div><br></div><div>the best,</div><div>thank you</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Bur=
ton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.co=
m</a>&gt; =E6=96=BC 2019=E5=B9=B46=E6=9C=8812=E6=97=A5 =E9=80=B1=E4=B8=89 =
=E4=B8=8B=E5=8D=885:47=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">I didn&#39;t make myself clear.=C2=A0 To =
reduce the amount of moving parts and<br>
changes I propose:<br>
<br>
1) libx11 and libx11-diet are untouched<br>
2) New recipe libx11-compose-data which just ships the compose data,<br>
assuming that is all that is needed by xkeyboard-config&#39;s Compose<br>
handling.=C2=A0 Refuses to build if x11 is in DISTRO_FEATURES<br>
3) xkeyboard-config depends on either libx11 or libx11-compose-data,<br>
depending whether x11 is in DISTRO_FEATURES<br>
<br>
Ross<br>
<br>
On Sun, 5 May 2019 at 21:15, &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Changes in V2:<br>
&gt; 1 As suggested by Ross Burton, split out libx11-locale from libx11<br>
&gt; as a standalone recipe.<br>
&gt;<br>
&gt; Ming Liu (2):<br>
&gt;=C2=A0 =C2=A0libx11: split out libx11-locale<br>
&gt;=C2=A0 =C2=A0libxkbcommon: RDEPENDS on libx11-locale<br>
&gt;<br>
&gt;=C2=A0 .../recipes-graphics/xorg-lib/<a href=3D"http://libx11-diet_1.6.=
7.bb" rel=3D"noreferrer" target=3D"_blank">libx11-diet_1.6.7.bb</a> |=C2=A0=
 1 -<br>
&gt;=C2=A0 .../libx11-locale/0001-Drop-x11-dependencies.patch | 86 ++++++++=
++++++++++++++<br>
&gt;=C2=A0 .../xorg-lib/<a href=3D"http://libx11-locale_1.6.7.bb" rel=3D"no=
referrer" target=3D"_blank">libx11-locale_1.6.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 ++++++++<br>
&gt;=C2=A0 meta/recipes-graphics/xorg-lib/libx11.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 +-<br>
&gt;=C2=A0 .../xorg-lib/<a href=3D"http://libxkbcommon_0.8.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">libxkbcommon_0.8.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +<br>
&gt;=C2=A0 5 files changed, 129 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-locale/=
0001-Drop-x11-dependencies.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-lib/<a href=3D"htt=
p://libx11-locale_1.6.7.bb" rel=3D"noreferrer" target=3D"_blank">libx11-loc=
ale_1.6.7.bb</a><br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</blockquote></div>

--000000000000d3bdca058b306f8f--
