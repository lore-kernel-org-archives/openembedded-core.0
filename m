Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 159F5734B8;
	Wed, 26 Aug 2015 22:24:07 +0000 (UTC)
Received: by lbbsx3 with SMTP id sx3so833343lbb.0;
	Wed, 26 Aug 2015 15:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+XO6hccmfX3YO4uCg6EhDmA9I77ZoN3uyu22tK6vXfk=;
	b=xjTw1KcslCAWcIpbFzv03NT2DQiloRXBngT0mIE5JHi7Bq0FBNDDWmthX4SqvzgRD3
	5HYslF5qcXtyNMun89SC4RFTix1VvBrHcyY3Im74eKlC6UwoTIMBTL1Se1/z+y7Vt1Hm
	8VwZLAyq3yxXc4zoZ3Z526UZQ+dXxhSeiqrO47/vRzXhDd0uSEpLY0xmwWDYmVSv/3+k
	2ke9bBmhI6eT8LX2HuFgwTq5NWYkP8cpJxm4yOogzE7oJmBPFReGFVd5v8Fc+ZWZwUKv
	2cFNs9Ar+K7DFHu4++2EVHAFLKcY7jndC3Q8XRvbEbN8TiTTaBadJR0pUwn1gIq20d2Q
	GFZg==
MIME-Version: 1.0
X-Received: by 10.112.52.2 with SMTP id p2mr955051lbo.8.1440627846487; Wed, 26
	Aug 2015 15:24:06 -0700 (PDT)
Received: by 10.25.89.74 with HTTP; Wed, 26 Aug 2015 15:24:06 -0700 (PDT)
In-Reply-To: <20150826135604.GA2449@jama>
References: <20150826135604.GA2449@jama>
Date: Wed, 26 Aug 2015 15:24:06 -0700
Message-ID: <CANx9H-BF76n0yD2xisT1R3TDHgUfC019Y=pKyvFKWZO=DFn4Vg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2015-08-24
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
X-List-Received-Date: Wed, 26 Aug 2015 22:24:09 -0000
Content-Type: multipart/alternative; boundary=001a11c3bb3e0b23e6051e3e4f64

--001a11c3bb3e0b23e6051e3e4f64
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 6:56 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Time for even more PNBLACKLISTs..
>
<snip>

> == Failed tasks 2015-08-24 ==
>
> INFO: jenkins-job.sh-1.3.1 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150825_231149.log
>
> === common (7) ===
>     * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/
> mkvtoolnix_git.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/
> vlc_2.2.1.bb, do_compile
>
I am working on a patch for this. This one is difficult for me to replicate.


>     * /meta-openembedded/meta-oe/recipes-support/libdbi/
> libdbi-drivers_0.8.3-1.bb, do_compile
>     * /meta-openembedded/meta-python/recipes-devtools/python/
> python-pyopenssl_0.15.1.bb, do_populate_sysroot
>     * /meta-openembedded/meta-xfce/recipes-art/rodent-icon-theme/
> rodent-icon-theme_5.0.bb, do_populate_sysroot
>     * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb,
> do_compile
>
> === common-x86 (6) ===
>     * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb,
> do_compile
>     * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/
> inetutils_1.9.4.bb, do_fetch
>     * /meta-openembedded/meta-networking/recipes-kernel/netmap/
> netmap-modules_git.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-support/gd/gd_2.1.1.bb,
> do_compile
>     * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile
>     * /meta-qt5/recipes-qt/qt5/qtwebkit_git.bb, do_compile
>
> === qemuarm (2) ===
>     * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/
> inetutils_1.9.4.bb, do_patch
>     * /meta-openembedded/meta-python/recipes-extended/python-pyparted/
> python-pyparted_3.10.5.bb, do_compile
>
> I have a patch for this (and raised an issue upstream
https://github.com/rhinstaller/pyparted/pull/15 ). It is an indirect cause
of the parted_1.8.6 recipe. python-pyparted_3.10.5 requires libparted >=
2.3 (so the 3.% in core will work). The '1.8.6' string is not being cast
properly by float().


> === qemux86 (1) ===
>     * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/
> xf86-video-geode_2.11.16.bb, do_compile
>
> === qemux86_64 (2) ===
>     * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure
>     * /meta-openembedded/meta-oe/recipes-extended/collectd/
> collectd_5.5.0.bb, do_compile
>
> === Number of failed tasks (38) ===
> {| class=wikitable
> |-
> || qemuarm      || 9     ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150824_114047.log//
> || http://errors.yoctoproject.org:80/Errors/Build/8163/
> |-
> || qemux86      || 14    ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150824_134017.log//
> ||
> |-
> || qemux86_64   || 15    ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150824_225042.log//
> ||
> |
>
<snip>

--Tim

--001a11c3bb3e0b23e6051e3e4f64
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 26, 2015 at 6:56 AM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Time for even =
more PNBLACKLISTs..<br></blockquote><div>&lt;snip&gt;=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
=3D=3D Failed tasks 2015-08-24 =3D=3D<br>
<br>
INFO: jenkins-job.sh-1.3.1 Complete log available at <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world/log.report.20150825_231149.log" rel=3D"=
noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/log.report.20150825_231149.log</a><br>
<br>
=3D=3D=3D common (7) =3D=3D=3D<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-efl/recipes-efl/efl/<a href=3D"http=
://epdf_svn.bb" rel=3D"noreferrer" target=3D"_blank">epdf_svn.bb</a>, do_co=
mpile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/<=
a href=3D"http://mkvtoolnix_git.bb" rel=3D"noreferrer" target=3D"_blank">mk=
vtoolnix_git.bb</a>, do_compile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/<=
a href=3D"http://vlc_2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">vlc_2.2=
.1.bb</a>, do_compile<br></blockquote><div>I am working on a patch for this=
. This one is difficult for me to replicate.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
=C2=A0 =C2=A0 * /meta-openembedded/meta-oe/recipes-support/libdbi/<a href=
=3D"http://libdbi-drivers_0.8.3-1.bb" rel=3D"noreferrer" target=3D"_blank">=
libdbi-drivers_0.8.3-1.bb</a>, do_compile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-python/recipes-devtools/python/<a h=
ref=3D"http://python-pyopenssl_0.15.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python-pyopenssl_0.15.1.bb</a>, do_populate_sysroot<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-xfce/recipes-art/rodent-icon-theme/=
<a href=3D"http://rodent-icon-theme_5.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">rodent-icon-theme_5.0.bb</a>, do_populate_sysroot<br>
=C2=A0 =C2=A0 * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/<a h=
ref=3D"http://luna-next.bb" rel=3D"noreferrer" target=3D"_blank">luna-next.=
bb</a>, do_compile<br>
<br>
=3D=3D=3D common-x86 (6) =3D=3D=3D<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-efl/recipes-efl/webkit/<a href=3D"h=
ttp://webkit-efl_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">webkit-efl=
_1.11.0.bb</a>, do_compile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-networking/recipes-connectivity/ine=
tutils/<a href=3D"http://inetutils_1.9.4.bb" rel=3D"noreferrer" target=3D"_=
blank">inetutils_1.9.4.bb</a>, do_fetch<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-networking/recipes-kernel/netmap/<a=
 href=3D"http://netmap-modules_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>netmap-modules_git.bb</a>, do_compile<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-oe/recipes-support/gd/<a href=3D"ht=
tp://gd_2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">gd_2.1.1.bb</a>, do_=
compile<br>
=C2=A0 =C2=A0 * /meta-qt5/recipes-qt/qt5/<a href=3D"http://qtwebengine_git.=
bb" rel=3D"noreferrer" target=3D"_blank">qtwebengine_git.bb</a>, do_compile=
<br>
=C2=A0 =C2=A0 * /meta-qt5/recipes-qt/qt5/<a href=3D"http://qtwebkit_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">qtwebkit_git.bb</a>, do_compile<br>
<br>
=3D=3D=3D qemuarm (2) =3D=3D=3D<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-networking/recipes-connectivity/ine=
tutils/<a href=3D"http://inetutils_1.9.4.bb" rel=3D"noreferrer" target=3D"_=
blank">inetutils_1.9.4.bb</a>, do_patch<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-python/recipes-extended/python-pypa=
rted/<a href=3D"http://python-pyparted_3.10.5.bb" rel=3D"noreferrer" target=
=3D"_blank">python-pyparted_3.10.5.bb</a>, do_compile<br>
<br></blockquote><div>I have a patch for this (and raised an issue upstream=
 <a href=3D"https://github.com/rhinstaller/pyparted/pull/15">https://github=
.com/rhinstaller/pyparted/pull/15</a> ). It is an indirect cause of the par=
ted_1.8.6 recipe. python-pyparted_3.10.5 requires libparted &gt;=3D 2.3 (so=
 the 3.% in core will work). The &#39;1.8.6&#39; string is not being cast p=
roperly by float().</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=3D=3D=3D qemux86 (1) =3D=3D=3D<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/<a =
href=3D"http://xf86-video-geode_2.11.16.bb" rel=3D"noreferrer" target=3D"_b=
lank">xf86-video-geode_2.11.16.bb</a>, do_compile<br>
<br>
=3D=3D=3D qemux86_64 (2) =3D=3D=3D<br>
=C2=A0 =C2=A0 * /meta-browser/recipes-browser/chromium/<a href=3D"http://ce=
f3_280796.bb" rel=3D"noreferrer" target=3D"_blank">cef3_280796.bb</a>, do_c=
onfigure<br>
=C2=A0 =C2=A0 * /meta-openembedded/meta-oe/recipes-extended/collectd/<a hre=
f=3D"http://collectd_5.5.0.bb" rel=3D"noreferrer" target=3D"_blank">collect=
d_5.5.0.bb</a>, do_compile<br>
<br>
=3D=3D=3D Number of failed tasks (38) =3D=3D=3D<br>
{| class=3Dwikitable<br>
|-<br>
|| qemuarm=C2=A0 =C2=A0 =C2=A0 || 9=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150824_114047.log//" =
rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/buildlogs/=
oe/world//log.world.20150824_114047.log//</a> || <a href=3D"http://errors.y=
octoproject.org:80/Errors/Build/8163/" rel=3D"noreferrer" target=3D"_blank"=
>http://errors.yoctoproject.org:80/Errors/Build/8163/</a><br>
|-<br>
|| qemux86=C2=A0 =C2=A0 =C2=A0 || 14=C2=A0 =C2=A0 || <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world//log.world.20150824_134017.log//" rel=
=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/buildlogs/oe/=
world//log.world.20150824_134017.log//</a> ||<br>
|-<br>
|| qemux86_64=C2=A0 =C2=A0|| 15=C2=A0 =C2=A0 || <a href=3D"http://logs.nslu=
2-linux.org/buildlogs/oe/world//log.world.20150824_225042.log//" rel=3D"nor=
eferrer" target=3D"_blank">http://logs.nslu2-linux.org/buildlogs/oe/world//=
log.world.20150824_225042.log//</a> ||<br>
|<br></blockquote><div>&lt;snip&gt;=C2=A0</div><div><br></div><div>--Tim</d=
iv></div></div></div>

--001a11c3bb3e0b23e6051e3e4f64--
