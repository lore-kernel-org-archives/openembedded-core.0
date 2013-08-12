Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEF86B2C7;
	Mon, 12 Aug 2013 15:46:50 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id a11so8452864iee.36
	for <multiple recipients>; Mon, 12 Aug 2013 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=X+144xxl3QtsCV6nykrWOB7yiP6FzbOXjvwWQjcXtaM=;
	b=oIltmQ0MYA62AEVrIG/bS8cEwm0Mni0UCLfhM/BL3SRJcC2bJOM9po9hK/ebbHSdwB
	xPoJ/9N+m45zTeBSiYKRPxCZ5wryphoPAqJjic3mY9nUvcM6N8y4pjfUJ2AYb2hU1V+y
	lNycyTNZLnT+9vrFS4MDbmrhKpAbqUa2RyAaMLVROG3ZzVxK6uFmECq5dVooUEDEPp8L
	MABSAPHjrlcvaJpQprFJTd+4iBJS0/aZzKN6CQu2Eax1c76rTi8uJdNblME/zBW2k0tx
	ajKYpzmvQc/emXmHiRtLQ7WsITwjRQYB/mDMrCt2PUHnheZOU1C6BemsfTCesY2Zqbb7
	6LeA==
X-Received: by 10.50.103.3 with SMTP id fs3mr8470767igb.39.1376322410523; Mon,
	12 Aug 2013 08:46:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.137 with HTTP; Mon, 12 Aug 2013 08:46:19 -0700 (PDT)
In-Reply-To: <20130811114403.GG17945@jama>
References: <20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Aug 2013 08:46:19 -0700
Message-ID: <CAMKF1spL2cNoQNLKHC585guY8C3UDT1CBkTnWN6Bg+J2uFc-CA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 12 Aug 2013 15:46:51 -0000
Content-Type: multipart/alternative; boundary=047d7b2e15d760371004e3c20811

--047d7b2e15d760371004e3c20811
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2013 at 4:44 AM, Martin Jansa <martin.jansa@gmail.com>wrote=
:

> On Fri, Aug 09, 2013 at 12:54:19AM +0200, Martin Jansa wrote:
> > On Thu, Jul 25, 2013 at 06:23:41PM +0200, Martin Jansa wrote:
> > > On Sat, Jun 22, 2013 at 08:16:56PM +0200, Martin Jansa wrote:
> > > > On Tue, Jun 11, 2013 at 06:04:34PM +0200, Martin Jansa wrote:
> > > > Last week hero Khem, sent many world fixes, but it seems like some
> fixes weren't enough
> > > > (tk, packagekit are still failing - I hope I haven't missed some
> other vN)
> > > > qemuarm: Summary: 11 tasks failed:
> > > >
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130620_105211.log/
> > > >
> > > > qemux86: Summary: 14 tasks failed:
> > > >
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130621_023143.log/
> > > >
> > > > qemux86_64: Summary: 15 tasks failed:
> > > >
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130621_181258.log/
> > > >
> > > > common (9):
> > > >   openembedded-core/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb,
> do_compile
> > > >   openembedded-core/meta/recipes-core/base-files/
> base-files_3.0.14.bb, do_package
> > > >   meta-openembedded/meta-oe/recipes-connectivity/samba/
> samba_3.6.8.bb, do_package
> > > >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/
> qcanobserver_svn.bb, do_compile
> > > >   meta-openembedded/meta-oe/recipes-devtools/packagekit/
> packagekit_0.5.6.bb, do_compile
> > > >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb,
> do_compile
> > > >   meta-openembedded/meta-gnome/recipes-gnome/eds/
> evolution-data-server_git.bb, do_compile
> > > >   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/
> gcalctool_5.32.0.bb, do_compile
> > > >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/
> xbmc_git.bb, do_compile
> > > >
> > > > qemuarm (2):
> > > >   openembedded-core/meta/recipes-devtools/qemu/qemu_1.5.0.bb,
> do_compile
> > > >   meta-openembedded/meta-oe/recipes-connectivity/gnuradio/
> gnuradio_git.bb, do_compile
> > > >
> > > > qemux86* common (4):
> > > >   openembedded-core/meta/recipes-graphics/xorg-driver/
> xf86-video-intel_2.21.9.bb, do_compile
> > > >   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> > > >   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb,
> do_configure
> > > >   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb,
> do_compile
> > > >
> > > > qemux86 (1):
> > > >   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/
> xf86-video-geode_2.11.14.bb, do_compile
> > > >
> > > > qemux86-64 (2):
> > > >   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb,
> do_compile
> > > >   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/
> libimobiledevice_1.1.4.bb, do_configure
> > >
> > > This time only qemuarm build:
> > >
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130724_125425.log/
> > >
> > > Summary: 8 tasks failed
> > >   openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb=
,
> do_package
> > >   meta-openembedded/meta-gnome/recipes-gnome/eds/
> evolution-data-server_git.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb,
> do_compile
> > >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/
> qcanobserver_svn.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb=
,
> do_compile
> > >   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/
> gcalctool_5.32.0.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb,
> do_compile
>


=E2=80=8BI will see into tcltk and if time permits some more.=E2=80=8B

--047d7b2e15d760371004e3c20811
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">On Sun, Aug 11, 2013 at 4:44 AM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On F=
ri, Aug 09, 2013 at 12:54:19AM +0200, Martin Jansa wrote:<br>
&gt; On Thu, Jul 25, 2013 at 06:23:41PM +0200, Martin Jansa wrote:<br>
&gt; &gt; On Sat, Jun 22, 2013 at 08:16:56PM +0200, Martin Jansa wrote:<br>
&gt; &gt; &gt; On Tue, Jun 11, 2013 at 06:04:34PM +0200, Martin Jansa wrote=
:<br>
&gt; &gt; &gt; Last week hero Khem, sent many world fixes, but it seems lik=
e some fixes weren&#39;t enough<br>
&gt; &gt; &gt; (tk, packagekit are still failing - I hope I haven&#39;t mis=
sed some other vN)<br>
&gt; &gt; &gt; qemuarm: Summary: 11 tasks failed:<br>
&gt; &gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches/log.world.20130620_105211.log/" target=3D"_blank">http://logs.=
nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130620_105211=
.log/</a><br>


&gt; &gt; &gt;<br>
&gt; &gt; &gt; qemux86: Summary: 14 tasks failed:<br>
&gt; &gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches/log.world.20130621_023143.log/" target=3D"_blank">http://logs.=
nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130621_023143=
.log/</a><br>


&gt; &gt; &gt;<br>
&gt; &gt; &gt; qemux86_64: Summary: 15 tasks failed:<br>
&gt; &gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches/log.world.20130621_181258.log/" target=3D"_blank">http://logs.=
nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130621_181258=
.log/</a><br>


&gt; &gt; &gt;<br>
&gt; &gt; &gt; common (9):<br>
&gt; &gt; &gt; =C2=A0 openembedded-core/meta/recipes-qt/qt4/<a href=3D"http=
://qt4-embedded_4.8.4.bb" target=3D"_blank">qt4-embedded_4.8.4.bb</a>, do_c=
ompile<br>
&gt; &gt; &gt; =C2=A0 openembedded-core/meta/recipes-core/base-files/<a hre=
f=3D"http://base-files_3.0.14.bb" target=3D"_blank">base-files_3.0.14.bb</a=
>, do_package<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-connectivity/samba/=
<a href=3D"http://samba_3.6.8.bb" target=3D"_blank">samba_3.6.8.bb</a>, do_=
package<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-qt/qcanobserver/<a =
href=3D"http://qcanobserver_svn.bb" target=3D"_blank">qcanobserver_svn.bb</=
a>, do_compile<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-devtools/packagekit=
/<a href=3D"http://packagekit_0.5.6.bb" target=3D"_blank">packagekit_0.5.6.=
bb</a>, do_compile<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-devtools/tcltk/<a h=
ref=3D"http://tk_8.6.0.bb" target=3D"_blank">tk_8.6.0.bb</a>, do_compile<br=
>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-gnome/recipes-gnome/eds/<a hre=
f=3D"http://evolution-data-server_git.bb" target=3D"_blank">evolution-data-=
server_git.bb</a>, do_compile<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-gnome/recipes-gnome/gcalctool/=
<a href=3D"http://gcalctool_5.32.0.bb" target=3D"_blank">gcalctool_5.32.0.b=
b</a>, do_compile<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-multimedia/recipes-mediacentre=
/xbmc/<a href=3D"http://xbmc_git.bb" target=3D"_blank">xbmc_git.bb</a>, do_=
compile<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; qemuarm (2):<br>
&gt; &gt; &gt; =C2=A0 openembedded-core/meta/recipes-devtools/qemu/<a href=
=3D"http://qemu_1.5.0.bb" target=3D"_blank">qemu_1.5.0.bb</a>, do_compile<b=
r>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-connectivity/gnurad=
io/<a href=3D"http://gnuradio_git.bb" target=3D"_blank">gnuradio_git.bb</a>=
, do_compile<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; qemux86* common (4):<br>
&gt; &gt; &gt; =C2=A0 openembedded-core/meta/recipes-graphics/xorg-driver/<=
a href=3D"http://xf86-video-intel_2.21.9.bb" target=3D"_blank">xf86-video-i=
ntel_2.21.9.bb</a>, do_compile<br>
&gt; &gt; &gt; =C2=A0 openembedded-core/meta/recipes-bsp/grub/<a href=3D"ht=
tp://grub_2.00.bb" target=3D"_blank">grub_2.00.bb</a>, do_package<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-support/ode/<a href=
=3D"http://ode_0.9.bb" target=3D"_blank">ode_0.9.bb</a>, do_configure<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-support/emacs/<a hr=
ef=3D"http://emacs_23.4.bb" target=3D"_blank">emacs_23.4.bb</a>, do_compile=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; qemux86 (1):<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-graphics/xorg-drive=
r/<a href=3D"http://xf86-video-geode_2.11.14.bb" target=3D"_blank">xf86-vid=
eo-geode_2.11.14.bb</a>, do_compile<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; qemux86-64 (2):<br>
&gt; &gt; &gt; =C2=A0 meta-browser/recipes-mozilla/firefox/<a href=3D"http:=
//firefox_10.0.11esr.bb" target=3D"_blank">firefox_10.0.11esr.bb</a>, do_co=
mpile<br>
&gt; &gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-connectivity/libimo=
biledevice/<a href=3D"http://libimobiledevice_1.1.4.bb" target=3D"_blank">l=
ibimobiledevice_1.1.4.bb</a>, do_configure<br>
&gt; &gt;<br>
&gt; &gt; This time only qemuarm build:<br>
&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-b=
ranches/log.world.20130724_125425.log/" target=3D"_blank">http://logs.nslu2=
-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130724_125425.log/=
</a><br>


&gt; &gt;<br>
&gt; &gt; Summary: 8 tasks failed<br>
&gt; &gt; =C2=A0 openembedded-core/meta/recipes-core/base-files/<a href=3D"=
http://base-files_3.0.14.bb" target=3D"_blank">base-files_3.0.14.bb</a>, do=
_package<br>
&gt; &gt; =C2=A0 meta-openembedded/meta-gnome/recipes-gnome/eds/<a href=3D"=
http://evolution-data-server_git.bb" target=3D"_blank">evolution-data-serve=
r_git.bb</a>, do_compile<br>
&gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-navigation/monav/<a href=
=3D"http://monav_0.3.bb" target=3D"_blank">monav_0.3.bb</a>, do_compile<br>
&gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-qt/qcanobserver/<a href=
=3D"http://qcanobserver_svn.bb" target=3D"_blank">qcanobserver_svn.bb</a>, =
do_compile<br>
&gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-qt/qt-creator/<a href=3D=
"http://qt-creator_2.8.0.bb" target=3D"_blank">qt-creator_2.8.0.bb</a>, do_=
compile<br>
&gt; &gt; =C2=A0 meta-openembedded/meta-gnome/recipes-gnome/gcalctool/<a hr=
ef=3D"http://gcalctool_5.32.0.bb" target=3D"_blank">gcalctool_5.32.0.bb</a>=
, do_compile<br>
&gt; &gt; =C2=A0 meta-openembedded/meta-oe/recipes-devtools/tcltk/<a href=
=3D"http://tk_8.6.0.bb" target=3D"_blank">tk_8.6.0.bb</a>, do_compile<br></=
div></div></blockquote><div><br></div><div><br></div><div><div style=3D"fon=
t-family:&#39;courier new&#39;,monospace;font-size:small" class=3D"gmail_de=
fault">

=E2=80=8BI will see into tcltk and if time permits some more.=E2=80=8B</div=
><br></div><div>=C2=A0</div></div><br></div></div>

--047d7b2e15d760371004e3c20811--
