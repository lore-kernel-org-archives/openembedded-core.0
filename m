Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0FA6067D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:56:42 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id mw1so75184050igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 06:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XyzekembliZ9Th/qBjETZor/VRcTSTvK2bQxv6e/WRQ=;
	b=N9zqZ4zsuuJ6+rA/KkenDAUZMRJiu6jcHGKVlDik/NiZgYLDuLCHor6Uk3CtVTg1uZ
	84MoGYPJms77hIUT2zyXMX4UI4ZECzAdY/DfrxqH20BYkIXaeke3AbLLC2yC+2+3EzjO
	w+1bRQe+INI/iT6Kb0XVotOu7TDYdxv6FLVI6Nlj22622AIKQSOQpVd1XwIMoRKNQuAB
	eecrG9U9WJDDxKLToZu+IMePIIUIh+eKTPgi/j8T7bIWmCD0JRxoHzqQH9kbhp5+YYqH
	GkNiEsDOpNY6D0bfhW8zyiQBnZ0C7W/O7azjNnYK8txRyHZ0WflB10K9rWHHBaNPsiJM
	Kbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XyzekembliZ9Th/qBjETZor/VRcTSTvK2bQxv6e/WRQ=;
	b=V3vi5rBK56HPS2CvYQI4XYz+y4YLF326SfYqBY/ZTw6fJJlkY1LAQCtlA4lzU4Z133
	Yd5KI9NHkihyTU9igMVmTKtbRcQU8P3JGzV2fs3feP+z4lrnhLgrICf5vC97yQ8IVzaV
	UhpufmRDDi1z0GxiF/4LzI+GtsnSwwFEOnv0CCjedNfXWAvG4OCpBtJ/BS/zONhz+GKr
	hc6ouUS4ZLbticeMiXAwhbMQ0vWpy1yls5IMI5ryr1qCFRH/bPKjikzWUWd2CnlYMC6l
	LsJtQWXRBzK70vJ0GWPpCoOonhRPncmVSo5OyYpCFYGSzhjyLaD8EgWDMIXMfR2Eqz/a
	PfVQ==
X-Gm-Message-State: ALoCoQlJZ78qn2bsb3AN1NOCeE7Zk8ihodGntq1qnHIrdBebwE6cX3rcGeR5Iom9WlYlmne64+bmivitrwC3iidPISdPSf42th25N1MlzQdaTfGdch3zDac=
X-Received: by 10.50.55.4 with SMTP id n4mr15007085igp.64.1452265002831; Fri,
	08 Jan 2016 06:56:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 06:56:23 -0800 (PST)
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 14:56:23 +0000
Message-ID: <CAJTo0Laga86qGDjuxoApENiqRS_j0-8cPLNfhs5J=QSdTZWOyg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 14:56:45 -0000
Content-Type: multipart/alternative; boundary=e89a8f3b9b499d2f020528d3cb1c

--e89a8f3b9b499d2f020528d3cb1c
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 10:19, Khem Raj <raj.khem@gmail.com> wrote:

> This set of fixes let core-image-full-cmdline build with musl along with
> core-image-sato
> and core-image-weston
>

The postinst intercepts that are ran at rootfs time using user-mode qemu
don't work with musl:

NOTE: Running intercept scripts:
NOTE: > Executing update_font_cache intercept ...
/lib/ld-musl-i386.so.1: No such file or directory
/data/poky-master/tmp/work/qemux86-poky-linux-musl/core-image-sato/1.0-r0/rootfs/usr/bin/fc-cache:
Invalid ELF image for this architecture
WARNING: The postinstall intercept hook 'update_font_cache' failed (exit
code: 255)! See log for details!
WARNING: The postinstalls for the following packages will be postponed for
first boot: liberation-fonts
NOTE: > Executing update_icon_cache intercept ...
NOTE: > Executing update_pixbuf_cache intercept ...
/lib/ld-musl-i386.so.1: No such file or directory
/data/poky-master/tmp/work/qemux86-poky-linux-musl/core-image-sato/1.0-r0/rootfs/usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders:
Invalid ELF image for this architecture

Ross

--e89a8f3b9b499d2f020528d3cb1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 10:19, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex"><div id=3D":4tc" class=3D"" style=3D"overflow:hid=
den">This set of fixes let core-image-full-cmdline build with musl along wi=
th core-image-sato<br>
and core-image-weston<br></div></blockquote></div><div class=3D"gmail_extra=
"><br></div>The postinst intercepts that are ran at rootfs time using user-=
mode qemu don&#39;t work with musl:</div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_extra">NOTE: Running intercept scripts:</div><div class=3D=
"gmail_extra">NOTE: &gt; Executing update_font_cache intercept ...</div><di=
v class=3D"gmail_extra">/lib/ld-musl-i386.so.1: No such file or directory</=
div><div class=3D"gmail_extra">/data/poky-master/tmp/work/qemux86-poky-linu=
x-musl/core-image-sato/1.0-r0/rootfs/usr/bin/fc-cache: Invalid ELF image fo=
r this architecture</div><div class=3D"gmail_extra">WARNING: The postinstal=
l intercept hook &#39;update_font_cache&#39; failed (exit code: 255)! See l=
og for details!</div><div class=3D"gmail_extra">WARNING: The postinstalls f=
or the following packages will be postponed for first boot: liberation-font=
s</div><div class=3D"gmail_extra">NOTE: &gt; Executing update_icon_cache in=
tercept ...</div><div class=3D"gmail_extra">NOTE: &gt; Executing update_pix=
buf_cache intercept ...</div><div class=3D"gmail_extra">/lib/ld-musl-i386.s=
o.1: No such file or directory</div><div class=3D"gmail_extra">/data/poky-m=
aster/tmp/work/qemux86-poky-linux-musl/core-image-sato/1.0-r0/rootfs/usr/li=
b/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders: Invalid ELF image for this archi=
tecture</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div></div>

--e89a8f3b9b499d2f020528d3cb1c--
