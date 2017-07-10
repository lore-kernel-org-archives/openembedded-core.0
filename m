Return-Path: <gizero@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 51B9971993
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 14:43:30 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id l21so5449226ywb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OGIuuxaB2cmGRubW2I4dbEFiFhxOEntyk0RiQQcHTuU=;
	b=gyBPFWtkkGTS4AHaJ35YyR6o+61QClGaP56dNR9+BB2JbuOl2RrItMn2vCBnXooa9E
	xcFAP/lgUdBhTiJDyC6LFCwpV/B7STpc+Stsp1cWXvmvPJUdqaCyUjGhT7fqmQVCpu4U
	cRHUwjp5ccsC3mHiHxZ/JIS6pe6VNT9XV+i/jjlSZaLauYGd1SAGSD+AdbESe4Pf6Xz8
	W/fb9+/cRLaTPq42nSKgIiX6ipgSjXgx2emVOnfq3rrckasLUfYbtj6Dpii2eHJZWSqb
	Dq5wH+MmvPesGH2AjoGipIfUfyhHR98ptGgDJaRRkyYz+im89vwSli94gaR/Az/kp4th
	/BXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OGIuuxaB2cmGRubW2I4dbEFiFhxOEntyk0RiQQcHTuU=;
	b=NXJluV41obFVr8zOEhxukz/iF8waburuKzv67DLJfnlba/StXyAiJ1IS4+DATGbHdb
	V1SbCnDfayRW7DnwPDZak6rCOdemgrYi0cNQwZTu8SjsLsJAfNPPoD83Q8PA0yGm+r4v
	IqViJF8g2nBHJN11C5ksja6YX0x2JjDZhJv7yYGkR7OmmDRF59bjRHkeKcQApEohkW5N
	XKHqoVxvzuRk2LoNQbUYiOLl9bCSeS4AZYneV7sDaLAoURBoIO6XJvUIE8otQfcyxolU
	FtR8EOo64Kn10ZWC7deGTNSmrFc7tGhYI5Agyf9OU62WFqf1QDk/X1bUXJAt0i6mzJQ1
	6T6A==
X-Gm-Message-State: AIVw111eYkAfdCkuj5vrIzVuhJkF9au7hmym3gmCgltxSGs0flsmQx21
	ZL6IU+A7dad5eOZ+VVC87SmZ1Kt96A==
X-Received: by 10.129.125.139 with SMTP id y133mr937500ywc.37.1499697811792;
	Mon, 10 Jul 2017 07:43:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Mon, 10 Jul 2017 07:43:31 -0700 (PDT)
In-Reply-To: <CAP9ODKqs=wFxh=ejUbChSqVqB+HVa08bZ8c517tZ_3HBj5oovQ@mail.gmail.com>
References: <1499687648-44734-1-git-send-email-jussi.kukkonen@intel.com>
	<CAP9ODKqs=wFxh=ejUbChSqVqB+HVa08bZ8c517tZ_3HBj5oovQ@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Mon, 10 Jul 2017 16:43:31 +0200
Message-ID: <CAC+thW04UphJUQ2Fvj2KeryRmaQi1GY6vjve013S-BqxHKtKcg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Split --with-platforms from egl PACKAGECONFIG
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
X-List-Received-Date: Mon, 10 Jul 2017 14:43:32 -0000
Content-Type: multipart/alternative; boundary="001a1149d96e57c23c0553f79b27"

--001a1149d96e57c23c0553f79b27
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 3:32 PM, Otavio Salvador <otavio.salvador@ossystems.
com.br> wrote:

> On Mon, Jul 10, 2017 at 8:54 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
> > Mesa platforms no longer depend directly on egl. Current
> > implementation breaks without egl with x11 (which can happen with
> > mesa-gl).
> >
> > Separate the platform selection. Make drm platform depend on gbm
> > PACKAGECONFIG by default.
> >
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > ---
>
> I tested it here and seems good. Ross please put this on MUT so we can
> merge it soon.
>

I also tested it and solves the issue seen with meta-raspberrypi builds.

--001a1149d96e57c23c0553f79b27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Jul 10, 2017 at 3:32 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.<wbr>com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><span>On Mon, Jul 10, 2017 at 8:54 AM, Jussi Kukkonen<br>
&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kuk=
konen@intel.com</a>&gt; wrote:<br>
&gt; Mesa platforms no longer depend directly on egl. Current<br>
&gt; implementation breaks without egl with x11 (which can happen with<br>
&gt; mesa-gl).<br>
&gt;<br>
&gt; Separate the platform selection. Make drm platform depend on gbm<br>
&gt; PACKAGECONFIG by default.<br>
&gt;<br>
&gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@int=
el.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; ---<br>
<br>
</span>I tested it here and seems good. Ross please put this on MUT so we c=
an<br>
merge it soon.<br></blockquote></div><br></div><div class=3D"gmail_extra">I=
 also tested it and solves the issue seen with meta-raspberrypi builds.<br>=
</div></div>

--001a1149d96e57c23c0553f79b27--
