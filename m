Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 808177F2FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 03:42:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a15so63007676wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 20:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zt0yqzsXNNbw29acC2Zng8NTZX/iM3Ruq75rgmpvrlM=;
	b=dmjeMF3Gk0tsLm0M8NRd4aIWRHGidq6WlEGLfN7qnNTuwDik3OSOK8O9QDdUnS24Ti
	i4v1BC0PY5YFyyxeq60wHoB20r1dC8SqxohlYFNz/RVu4huT2sCZEvgJHaoj+Y0+qQ7B
	XPiz7fNyeEKEyTWUv4bHSfcLXb89GcaqSEwINl6m1754wp7eSboV38x1ecxXKrkRgoEQ
	FaGfWcTdLGIoPbKS4F+58W6bM+OOfV4+8dN1T1KzgI3RBD/Zws8T/bseNBVZQ1clpF+i
	2i+Tu/o3a5m2DzxvByFr1BQESckxtTG1mo+qCvVmOliBcLgUJnBwgkU+Hzb0/wXtUKrT
	6s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zt0yqzsXNNbw29acC2Zng8NTZX/iM3Ruq75rgmpvrlM=;
	b=HYn3YgDCDBqtrbIOY3Ia8yGlQXTpPBpfw1Esr1EulrQ/Xu5GnlbdfRknjPkClr5Sj3
	6HdPI/+8PNgGqGLrcbNgTmgFW97Xnkz4wEArwKeDDDIEl73xf4pV0cVZcuDBGpHCyyMs
	He4c6HigK6HQTSMkCvqTTL+tj33tRbqmuHk+qjLmx5mztjVelfYWGexKb4/T9PT2oHOn
	b3v2UfgiN7DF+jmSwOMm8MrvDh+OyFo1ju0LcS7Vc//PRjyILqvKq5Dly45GsuSagcas
	Pr7xrBSQboiJnBQfgrILzvuwtJq3adBLNMTKHpqvWkfAeTDlqvYCimFTIW94DjCBs8MK
	zmAg==
X-Gm-Message-State: APjAAAVf3T3XRws3cWYHzS3bMsm2O4Bv1QKepjRHe5EHfH0Yai55DN8R
	0h0Z8I/LT1z0C7wlMvP8K8RfyHgL3nt0T3Y1a1s=
X-Google-Smtp-Source: APXvYqxcUbL0SIxUof1nrWindzj8c9KxDNWbulvsJEZla5sKt50Ap3DAEmB3e5idI+LSSXuNesPMGTW0TDEDe2qBPqQ=
X-Received: by 2002:a7b:cf32:: with SMTP id m18mr84899593wmg.27.1564630973987; 
	Wed, 31 Jul 2019 20:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <1564282197-5044-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LYKX_=UjE-6Kd+BvLH+i6Gub3ffqjOQcM4eEx2JDOwRVQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYKX_=UjE-6Kd+BvLH+i6Gub3ffqjOQcM4eEx2JDOwRVQ@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 1 Aug 2019 11:42:43 +0800
Message-ID: <CALatG=5kY2YNraZ10jdpo7ZVT4pAsK8BjdmbObV5EZA4GyOHFA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Ming Liu <ming.liu@toradex.com>, luka.pivk@toradex.com,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] weston: change to use meson build system
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
X-List-Received-Date: Thu, 01 Aug 2019 03:42:53 -0000
Content-Type: multipart/alternative; boundary="00000000000068c0f7058f0609e2"

--00000000000068c0f7058f0609e2
Content-Type: text/plain; charset="UTF-8"

Hi, Ross:

thanks for the review, will double check them and make a V3.

//Ming LIu


On Sun, 28 Jul 2019 at 03:50, <liu.ming50@gmail.com> wrote:
> > The changes include:
> > - Drop all autotools related patches.
> > - Move weston-launch setuid-install to do_install task since it's not
> >   supported yet by meson build.
> > - Drop cairo-glesv2 package config, it's not supported by meson build,
> >   the recommended value is hard-coded to cairo-image for now in weston
> >   source.
> > - Introduce remoting package config, to give this option a explicit
> >   value, or else the build would run into gstreamer missing error since
> >   it defaults to be true but gstreamer is not in depends list.
>
> There's more undocumented changes:
>
> packages/corei7-64-poky-linux/weston/weston-dbg: RRECOMMENDS: removed
> "zlib-intel-dbg libxcb-shape-dbg"
> packages/corei7-64-poky-linux/weston/weston-dev: FILELIST: removed
> "/usr/include/libweston-6/compositor-headless.h
> /usr/include/libweston-6/compositor-rdp.h"
> packages/corei7-64-poky-linux/weston/weston-dev: RRECOMMENDS: removed
> "zlib-intel-dev libxcb-shape-dev"
> packages/corei7-64-poky-linux/weston/weston-src: FILELIST: added
> "/usr/src/debug/weston/6.0.1-r0/weston-6.0.1/compositor/systemd-notify.c
> /usr/src/debug/weston/6.0.1-r0/weston-6.0.1/compositor/screen-share.c"
> packages/corei7-64-poky-linux/weston/weston-xwayland: RDEPENDS:
> removed "glib-2.0 (['>= 2.60.5']) libxkbcommon (['>= 0.8.4'])
> zlib-intel (['>= 1.2.11.1']) libxcb-shape (['>= 1.13.1']) libinput
> (['>= 1.13.4'])"
> packages/corei7-64-poky-linux/weston/weston: FILELIST: directory
> renamed /usr/share/weston/protocols -> /usr/share/libweston/protocols,
> added "/usr/lib/weston/systemd-notify.so
> /usr/lib/weston/screen-share.so"
>
> Some bits have been turned off, others turned on.
>
> Ross
>

--00000000000068c0f7058f0609e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi, Ross:</div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">thanks for the review, will double check them and make a V3.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">//Ming LIu</div><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Sun, 28 Jul 2019 at 03:50, &lt;<a href=
=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>=
&gt; wrote:<br>
&gt; The changes include:<br>
&gt; - Drop all autotools related patches.<br>
&gt; - Move weston-launch setuid-install to do_install task since it&#39;s =
not<br>
&gt;=C2=A0 =C2=A0supported yet by meson build.<br>
&gt; - Drop cairo-glesv2 package config, it&#39;s not supported by meson bu=
ild,<br>
&gt;=C2=A0 =C2=A0the recommended value is hard-coded to cairo-image for now=
 in weston<br>
&gt;=C2=A0 =C2=A0source.<br>
&gt; - Introduce remoting package config, to give this option a explicit<br=
>
&gt;=C2=A0 =C2=A0value, or else the build would run into gstreamer missing =
error since<br>
&gt;=C2=A0 =C2=A0it defaults to be true but gstreamer is not in depends lis=
t.<br>
<br>
There&#39;s more undocumented changes:<br>
<br>
packages/corei7-64-poky-linux/weston/weston-dbg: RRECOMMENDS: removed<br>
&quot;zlib-intel-dbg libxcb-shape-dbg&quot;<br>
packages/corei7-64-poky-linux/weston/weston-dev: FILELIST: removed<br>
&quot;/usr/include/libweston-6/compositor-headless.h<br>
/usr/include/libweston-6/compositor-rdp.h&quot;<br>
packages/corei7-64-poky-linux/weston/weston-dev: RRECOMMENDS: removed<br>
&quot;zlib-intel-dev libxcb-shape-dev&quot;<br>
packages/corei7-64-poky-linux/weston/weston-src: FILELIST: added<br>
&quot;/usr/src/debug/weston/6.0.1-r0/weston-6.0.1/compositor/systemd-notify=
.c<br>
/usr/src/debug/weston/6.0.1-r0/weston-6.0.1/compositor/screen-share.c&quot;=
<br>
packages/corei7-64-poky-linux/weston/weston-xwayland: RDEPENDS:<br>
removed &quot;glib-2.0 ([&#39;&gt;=3D 2.60.5&#39;]) libxkbcommon ([&#39;&gt=
;=3D 0.8.4&#39;])<br>
zlib-intel ([&#39;&gt;=3D 1.2.11.1&#39;]) libxcb-shape ([&#39;&gt;=3D 1.13.=
1&#39;]) libinput<br>
([&#39;&gt;=3D 1.13.4&#39;])&quot;<br>
packages/corei7-64-poky-linux/weston/weston: FILELIST: directory<br>
renamed /usr/share/weston/protocols -&gt; /usr/share/libweston/protocols,<b=
r>
added &quot;/usr/lib/weston/systemd-notify.so<br>
/usr/lib/weston/screen-share.so&quot;<br>
<br>
Some bits have been turned off, others turned on.<br>
<br>
Ross<br>
</blockquote></div></div>

--00000000000068c0f7058f0609e2--
