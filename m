Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 72AFB7F380
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 23:25:30 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id p5so1650907qtq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 15:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=28sxVMl/6MeaT0E+0OWxsKLzineiESa4yPGhepcgT6k=;
	b=ZcA7IpWQsEJL+LSW5VGlx0c24eom74TVjE8NiA707G8SKVA+cPBjzK0VH7rHMTUPxZ
	hTJiqlURGYmlHfl/fWU6SJaj+vinnltTE4iT/RsN/6KsxGsxcWzO12sSQLHiAVtwzJw+
	L6FRkYL1hJeX2J3+HBUOpai443b4RyCrFiAMjXFygKxP/aGe84kKe2DO6NNFPXx4z+tJ
	PL7yE969ijB1nlLNau6OL1fJoIQ+6PoNggUrspGy3tPP7bOZPjQTZTwF9M4L6/Ta+r0O
	UkmZ0gNPyPGFdo8CuAn8VC1GUh2kui3tqVlvw3cgZY/eu0krK2W1G+kw7x6ayaK4ZqM5
	maZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=28sxVMl/6MeaT0E+0OWxsKLzineiESa4yPGhepcgT6k=;
	b=aws6p9RusBx9lF/502sMnjhRw3S2196EIaur/raomeSSCZQzTO647cbJKeHed9a/k4
	qX1jbc8Nuq/9z+xlIysysN7renyVq04fk8FsLFL9zeQ7GOkfYrs+EkQNLp6+FVquUmgO
	6IEQpDbTx+65nVwkwUqDTjC53sr9ybHWwzJ6RuCzPVQPGao62r+7Y2QMfNNIhIu2HgwL
	6VbQP1Dc6hTTKqcgwpHt3DUlFCqwjptxHLjHG93SB0l8d+sNdHKyn7VbkevbwxQr7nXa
	/TfzypAE4IbYg5XYwGMi65bbXARb1PRSTPitkA8/gfFiSxmInW40vjfEyGEppnf+tkmF
	DcLg==
X-Gm-Message-State: APjAAAVu+52G9IYjs02Vu4EQ9ZWcK5JxPl54hR7yLst/cu9KrPVqLwRC
	WFS+gu0GZZxvf5e+L0SNJn1XP0Fkkfi6JnH8Pp8=
X-Google-Smtp-Source: APXvYqwiLR6ukArY9GxVyFj4ZYT6I4PZLMFHe4Rj6r4jwnw1Qp4k/Vwi0ittsccXKPwWqJbAzS1DNGDt3AnrLuboYnU=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr2185549qtj.80.1575329130957; 
	Mon, 02 Dec 2019 15:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-2-alex.kanavin@gmail.com>
	<33182b29-de6e-f918-2915-df016b854e81@intel.com>
	<20191202151051.GC1581@localhost>
	<CANNYZj-VDVRB4qQDRG9+uHk0+QSm4d+Af-U2DNyb8QjyAj+o=w@mail.gmail.com>
	<CAMKF1soeGLC48o0nsn=hZ2p89L43edF3SKuqXUP18-U=1=g99g@mail.gmail.com>
	<20191202225523.GA26056@localhost>
In-Reply-To: <20191202225523.GA26056@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Dec 2019 15:25:04 -0800
Message-ID: <CAMKF1srR8-rdqhJ6FtCdmgkWBL29rydKxvsKgXWitwdQvP2_sA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/15] libdnf: upgrade 0.28.1 -> 0.38.1
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
X-List-Received-Date: Mon, 02 Dec 2019 23:25:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2019 at 2:55 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Dec 02, 2019 at 02:44:47PM -0800, Khem Raj wrote:
> > On Mon, Dec 2, 2019 at 7:25 AM Alexander Kanavin <alex.kanavin@gmail.co=
m> wrote:
> > >
> > > It's using -std=3Dc++11. I'm not sure if switching to gnu flavour wou=
ld have made a difference with gcc 4.8 provided in centos 7 and gcc 4.9 fro=
m Debian 8 - is it worth trying? Newer gcc versions don't complain and buil=
d this without error while still using -std=3Dc++11.
> > >
> > > I'm leaning towards taking out the dnf/libdnf updates until these dis=
tros are retired from the supported distro list.
> >
> > try adding #include <atomic> in libdnf/dnf-context.cpp
>
> Same failure.

#include <atomic>
int foo(){
  std::atomic_flag cfgMainLoaded =3D ATOMIC_FLAG_INIT;
}

does above example compile fine with
 g++-4.8 -c -std=3Dc++11

>
> cu
> Adrian

