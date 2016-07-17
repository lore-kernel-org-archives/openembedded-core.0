Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 064B060589
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 19:22:38 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id f6so54744882ith.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3SLiFcYSH9q66+MOo1KCGXrz5VYM3gFhn51m/dyEi10=;
	b=Bj7iZMTIclj/uivlU3BGjSmJFpKNfNYxBlcWrRhwxDrbEpNuBLy72CK5dMMlF7KgZ5
	Hy8hbEDNuBRZX8Q7I6825ppmXWmmGyg8L/PxmxlPWnq3wuhFlBv0ol24jA0N1hCEyksF
	77FWkbEe3FxIktxdV96/JWvyJnjGS+IWpYabqgPsuJy45EDVZQ+5YIODuG2c5uS6Yjoi
	I5ulY4MCga7gNGI6iBSnC3tCgNnVAaSPKHJl1U7iEyYdC2mGV6cGtindvTK28lsygZGg
	6qFyX9nuL/bk4+dKb8/2JBqm4qk9f87uhw+Xli3plgwumjGCItffDLgUJsJHeNfBe1/y
	qWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3SLiFcYSH9q66+MOo1KCGXrz5VYM3gFhn51m/dyEi10=;
	b=Y9TsxPw13YJxx5KZ7b8C8WT/Dgxy82SGaiul5foJdDurjSx1wbo1z+Bnkr3DwUDbzh
	dyME7Q0Hx5ghjMHpjvUzXZj2MHtoaf8vvJE1Wa/fGi2qvTuzwduwJUdS1SDAgIqIG8ri
	M9DEEJZKPfQjaBO0AZSZYJl1CcxapfjkXDVqC3jDy+nqMAczdB+SHhcIUL12g8Ye1FK8
	0JvBh/E5erIC2NNqpq4/2lYPi3OPJ0LUVk57MhSCOwPBVjDmMdWRDXNPyJpZ9Rj9j5Kw
	fQmFs78vLmQavio4xR72JtOu62x2lR10b9vG1BW6tieldhS7CiMIvNxhnn3SCkArP9dt
	DdWw==
X-Gm-Message-State: ALyK8tKggasYP84mpjkGeMu/fGxDkNXoRs95Q1l3fTp6it6IR9l5KiYXpFHLMk+1+hQxa0L3/WG82qsB0qsGndcg
X-Received: by 10.36.131.194 with SMTP id d185mr40894460ite.38.1468783359476; 
	Sun, 17 Jul 2016 12:22:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Sun, 17 Jul 2016 12:22:20 -0700 (PDT)
In-Reply-To: <CAHiDW_EyU1Xc2ch6__EZRAZd8-9CBcy=-ibTuv95OcSAV8YYhw@mail.gmail.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
	<8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
	<CAJTo0LY+whG89qBDKHYmk8j1q1UJb2oH6Y+8d6=ffNCXHw9HRw@mail.gmail.com>
	<CAHiDW_EyU1Xc2ch6__EZRAZd8-9CBcy=-ibTuv95OcSAV8YYhw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 17 Jul 2016 20:22:20 +0100
Message-ID: <CAJTo0LaGmkXKWWGYwXneinHGkEmiLEJtH9kChKhkcHCPE9PawA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] mesa: Upgrade 11.2.2 -> 12.0.1
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
X-List-Received-Date: Sun, 17 Jul 2016 19:22:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c04965264d76d0537d9c658

--94eb2c04965264d76d0537d9c658
Content-Type: text/plain; charset=UTF-8

On 17 July 2016 at 10:41, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Based on a quick look:
> * mesa-demos needs GL/gl.h but the recipe does not depend on virtual/libgl
> * for some reason mesa 11.2.2 builds glx even when configured not to
>   (--disable-glx used, configure log says "GLX: no", /GL/* headers end up
> in sysroot)
>
> So X11-free builds may have been not as X11-free as advertised?
>

Yeah that's pretty much what I'd guessed.  I wonder what mesa 11.2 was
installing as gl.h...

Hopefully it's simple to fix mesa-demos not to depend on GL/gl.h unless
it's actually using it - ie the X11 demos are selected.

Ross

--94eb2c04965264d76d0537d9c658
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 July 2016 at 10:41, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Based on a qui=
ck look:</div><div>* mesa-demos needs GL/gl.h but the recipe does not depen=
d on virtual/libgl</div><div>* for some reason mesa 11.2.2 builds glx even =
when configured not to</div><div>=C2=A0 (--disable-glx used, configure log =
says &quot;GLX: no&quot;, /GL/* headers end up in sysroot)</div><div><br></=
div><div>So X11-free builds may have been not as X11-free as advertised?<br=
></div><div></div></blockquote></div><br>Yeah that&#39;s pretty much what I=
&#39;d guessed.=C2=A0 I wonder what mesa 11.2 was installing as gl.h...</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Hopefully=
 it&#39;s simple to fix mesa-demos not to depend on GL/gl.h unless it&#39;s=
 actually using it - ie the X11 demos are selected.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c04965264d76d0537d9c658--
