Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 724F06C1C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 13:56:05 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 107so9330253otj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 06:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KpBf2j8Fx32MWKsrYOZ2JYSk2wEk3wPp+EzPagXpz0o=;
	b=blawH516N19mx5gcbgqZlN1cY1LEiXPnexd2PdMz38lMdMSNw/Z8UDBcAdofMQVwUi
	dAmL5QKEC62DSqXSdu62oZG4ks/8xZ2tsANeUtY/dX3PGUNJRURTbCu1eogkhU0XNwZT
	fSaMWOvrXdwsJuE9QrDwPWHgbplrYduJdgURa/QKY8sjo9Pe6uFaPiIYSJtKIpSDqEXs
	j8nBmwm8JBwaKwUNLeRx5STH1oeJFK46lzgOtNuqZAX1goKTLF1qeGYqjL5ts2LeevYj
	K+wLF3S6DjTsF9ELzcJVp3l/6OHVah4p3z5tjSaGDd7jJULduS/DIvzgpQW0Ue6YjPb3
	IM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KpBf2j8Fx32MWKsrYOZ2JYSk2wEk3wPp+EzPagXpz0o=;
	b=GnIvcNRiQa4GijlHEubOG7S+AGj0rbF1fMOWHG3+NQp3FnmwhOvghY7PQ9/l4eStRO
	nEHN3ar5T5OKz2vup3W06ZEw7A8DcG+/2jQ4t/Ja075yc2XT/nVppdaCDWuoheARwp4q
	yyuBKu2ckt/Ukk/UblXyTmSO6uuMVm/hWz1Fj5PvJqPtz3Z3sIGD8H8HQf05oy2QpVhz
	8ZmtzbXq3KeEgKRUVntFflJ5krfjpDqb1/b0EKfJaxCviC9L856OWTUD9GZXfTKLNVCd
	Fv5dUzNLlgpFzWY5C6pe56VdDLIomvr1GK8ABzStB4A20VGcT487cHK9pdK8Gp19ekBR
	PNkQ==
X-Gm-Message-State: APjAAAXKOsgv3BcRFIpARfmLeTe/fV9IOJzVlVcfbQqGl3PME9xUCES9
	NjOm+u5SsPuvk20XVMi3z1NKdioyoSrSX7zZFIY=
X-Google-Smtp-Source: APXvYqyw1ZVUYsa6r2hhWe21q8r5J6yZbJgfgcxj9zFC/CuamGDTVFNgpF+cwgbGg15qDjJyVrL1OC4xEIWBTjEpDz8=
X-Received: by 2002:a9d:d87:: with SMTP id 7mr56049109ots.263.1560779766310;
	Mon, 17 Jun 2019 06:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190616215711.C0049440001@auh.yoctoproject.org>
	<48329790d8a30441a45d5ca11d46f4e635f97938.camel@linuxfoundation.org>
In-Reply-To: <48329790d8a30441a45d5ca11d46f4e635f97938.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jun 2019 15:55:54 +0200
Message-ID: <CANNYZj9rVD4cZ-AN7rvF=0fuc4d99brU_Tt_wQeRMGm=L83M2w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] lttng-ust: upgrading to 2.10.4 FAILED
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
X-List-Received-Date: Mon, 17 Jun 2019 13:56:05 -0000
Content-Type: multipart/alternative; boundary="0000000000008b2eef058b855bbd"

--0000000000008b2eef058b855bbd
Content-Type: text/plain; charset="UTF-8"

Yes, it's another one of those recipes which includes a different recipe
with its version number (which breaks when devtool upgrades one but not the
other).

I have a fix queued:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=00eb5952479370553756dface4cf6c81f51b9e8f

Alex

On Mon, 17 Jun 2019 at 14:34, <richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2019-06-16 at 14:57 -0700, auh@auh.yoctoproject.org wrote:
> > Hello,
> >
> > You are receiving this email because you are the maintainer
> > of *lttng-ust* recipe and this is to let you know that the automatic
> > attempt
> > to upgrade the recipe to *2.10.4* has Failed(get_env).
> >
> > Detailed error information:
> >
> > Empty environment returned
> > ERROR: ParseError at /home/auh/build/workspace/recipes/libnewt-python/
> libnewt-python_0.52.21.bb:1: Could not include required file
> recipes-extended/newt/libnewt_0.52.21.bb
> > WARNING: Layer workspacelayer should set
> LAYERSERIES_COMPAT_workspacelayer in its conf/layer.conf file to list the
> core layer names it is compatible with.
> > NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
>
>
> A parse error in libnewt-python/libnewt-python_0.52.21.bb causes lttng-
> ust upgrade to fail?
>
> Sounds like something went a little wrong :(
>
> Cheers,
>
> Richard
>
>

--0000000000008b2eef058b855bbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, it&#39;s another one of those recipes which incl=
udes a different recipe with its version number (which breaks when devtool =
upgrades one but not the other).</div><div><br></div><div>I have a fix queu=
ed:</div><div><a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/=
commit/?h=3Dakanavin/package-version-updates&amp;id=3D00eb5952479370553756d=
face4cf6c81f51b9e8f">http://git.yoctoproject.org/cgit.cgi/poky-contrib/comm=
it/?h=3Dakanavin/package-version-updates&amp;id=3D00eb5952479370553756dface=
4cf6c81f51b9e8f</a></div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 17 Jun 2=
019 at 14:34, &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sun, 2019-06-16 at 14:57 -0700, <a href=
=3D"mailto:auh@auh.yoctoproject.org" target=3D"_blank">auh@auh.yoctoproject=
.org</a> wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; You are receiving this email because you are the maintainer<br>
&gt; of *lttng-ust* recipe and this is to let you know that the automatic<b=
r>
&gt; attempt<br>
&gt; to upgrade the recipe to *2.10.4* has Failed(get_env).<br>
&gt; <br>
&gt; Detailed error information:<br>
&gt; <br>
&gt; Empty environment returned<br>
&gt; ERROR: ParseError at /home/auh/build/workspace/recipes/libnewt-python/=
<a href=3D"http://libnewt-python_0.52.21.bb:1" rel=3D"noreferrer" target=3D=
"_blank">libnewt-python_0.52.21.bb:1</a>: Could not include required file r=
ecipes-extended/newt/<a href=3D"http://libnewt_0.52.21.bb" rel=3D"noreferre=
r" target=3D"_blank">libnewt_0.52.21.bb</a><br>
&gt; WARNING: Layer workspacelayer should set LAYERSERIES_COMPAT_workspacel=
ayer in its conf/layer.conf file to list the core layer names it is compati=
ble with.<br>
&gt; NOTE: Bitbake server didn&#39;t start within 5 seconds, waiting for 90=
<br>
<br>
<br>
A parse error in libnewt-python/<a href=3D"http://libnewt-python_0.52.21.bb=
" rel=3D"noreferrer" target=3D"_blank">libnewt-python_0.52.21.bb</a> causes=
 lttng-<br>
ust upgrade to fail?<br>
<br>
Sounds like something went a little wrong :(<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000008b2eef058b855bbd--
