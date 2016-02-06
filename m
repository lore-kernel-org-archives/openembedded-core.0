Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A9F506FF73
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 17:32:18 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id p63so65944135wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 09:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lJyNh8fveM7OB5yMv4pAyNvfUoyYKHemPIY0PcnkhO8=;
	b=AijcP3dfwfq2l0+nF6/3Ve/2Z3B4qzXq949qIFlJEJP8ERDc7ZB+fUVIZI75qgph7V
	NPzwwDd6zSt2V75/JKhOOTGQec4CyXMBlzvH349fBYhWeZVdRcBF11uwLZZoAJqx7Hjq
	t2PnKE0JGkjhcSIFr30Qquf4g6nIAdScTH830n/iHqBGo+pExqwoyYMPDGuYCAOLARD5
	yWpU7sGbINNFo53xMX5rVuYrErvodWCNrmwoG9lSQ8aDo5ctyX3C03AaFXQCe83L2SwQ
	jZdIGgnYidl3ZZvuOiwAip8TqIxOKownzQ9UaPlZem4Wh6wphdXF5E8+/AH8WvDY3Uu0
	BMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=lJyNh8fveM7OB5yMv4pAyNvfUoyYKHemPIY0PcnkhO8=;
	b=kLiHPbR8ymZRaAiZk85dEtqRDQTv0KAF5n4V1jfgZGKEGb15wBi6DpBBkOHKbkzxLE
	1xrqgBC94/dUfEUw5HZ/FvH9y0pShFQhCpFX0cK/ouCS4/P/EPxHwYtBYa9vjB4dwjF1
	82QnxI38i91o6+2Q/CF+5IRSx+0h3fr0Lbe752Vja8LXXAHbDKKZEqk7Zb2PsLOKkntK
	4aOyMhTeooaXfBXD3zj7iwB41eWRCE7XuhkXfhWkKQ5J7X8R2NvG5X6JG/WL8nQsWbEB
	77ofxeCrev9ioHrbX0jsXibG80XDaepDtUnYMHz6GqHMbUMfuYIVcotCno6KJwblV7tp
	eOhA==
X-Gm-Message-State: AG10YOQp1O5IXjgLH357Hxjejs/C80U4l/R4t3ek+w7nbW9KdSqfIX9yYQkg8hzMQsZAQukdhMdxxH1NQTzTnQ==
MIME-Version: 1.0
X-Received: by 10.28.21.19 with SMTP id 19mr40591080wmv.43.1454779938573; Sat,
	06 Feb 2016 09:32:18 -0800 (PST)
Received: by 10.194.67.168 with HTTP; Sat, 6 Feb 2016 09:32:18 -0800 (PST)
In-Reply-To: <20160202161726.GC2607@jama>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202161726.GC2607@jama>
Date: Sat, 6 Feb 2016 18:32:18 +0100
Message-ID: <CA+chaQdGzUm96SViWvLW8xinxSLrjZbZxi843A282geN+T5Ffw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Sat, 06 Feb 2016 17:32:21 -0000
Content-Type: multipart/alternative; boundary=001a1145b64c771a1d052b1d59b4

--001a1145b64c771a1d052b1d59b4
Content-Type: text/plain; charset=UTF-8

Last world build with this change included (not the other fixes for
oe-core sent later) shows:


Summary: 30 tasks failed:
  virtual:native:/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/pigz/pigz_2.3.3.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb,
do_package
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/dmidecode/dmidecode_3.0.bb,
do_package
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/stat/stat_3.3.bb,
do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb,
do_compile
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/ed/ed_1.9.bb,
do_package
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-support/invensense/invensense_git.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/soci/soci_3.2.2.bb,
do_configure
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb,
do_compile
  virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb,
do_compile
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/pigz/pigz_2.3.3.bb,
do_compile
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb,
do_compile
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb,
do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/ckermit/ckermit_302.bb,
do_install
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb,
do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb,
do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb,
do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-support/pimd/pimd_2.1.8.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb,
do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/mg/mg_20110905.bb,
do_compile
Summary: There were 33 WARNING messages shown.
Summary: There were 65 ERROR messages shown, returning a non-zero exit code.


On Tue, Feb 2, 2016 at 5:17 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Feb 02, 2016 at 04:01:14PM +0000, Richard Purdie wrote:
> > On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
> > > bitbake.conf currently contains:
> > >
> > > EXTRA_OEMAKE = "-e MAKEFLAGS="
> > >
> > > Back in November[1] I submitted a patch that allowed this default
> > > value to be overridden without affecting anything else that was
> > > appended to it. I received feedback that the default value was no
> > > longer useful and that it would be good to get rid of it.
> > >
> > > So, this patch series fixes the two recipes that still appear to be
> > > relying on the previous default and then makes the default
> > > EXTRA_OEMAKE = "". After these changes core-image-sato builds
> > > successfully for me (although I have not run it.)
> > >
> > > Mike.
> > >
> > > [1] http://lists.openembedded.org/pipermail/openembedded-core/2015-No
> > > vember/112393.html
> >
> > This is a pretty major change and we likely need a bit more of an idea
> > of impact.
> >
> > Which architectures did you test? Often, x86 is a bad choice here and
> > we'd need something cross (arm/mips/ppc) to ensure it really is doing
> > the right things. We also need to assess a bit more than just sato. We
> > can run this up on the autobuilder and see what happens.
> >
> > A post to the architecture list is probably needed so everyone knows
> > this is happening (or at least being considered).
> >
> > I do worry how much of meta-oe may be affected by this.
> >
> > Martin: Any opinion on this?
>
> I can give it a shot in next rounds of jenkins builds, but the state is
> already quite bad, so it will be hard to spot new issues.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a1145b64c771a1d052b1d59b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"" style=3D"white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:13p=
x">Last world build with this change included (not the other fixes for oe-c=
ore sent later) shows:</pre><pre class=3D"" style=3D"white-space:pre-wrap;w=
ord-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fo=
nt-size:13px"><br></pre><pre class=3D"" style=3D"white-space:pre-wrap;word-=
wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-s=
ize:13px">Summary: 30 tasks failed:
  virtual:native:/home/jenkins/oe/world/shr-core/openembedded-core/meta/rec=
ipes-extended/pigz/<a href=3D"http://pigz_2.3.3.bb">pigz_2.3.3.bb</a>, do_c=
ompile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-core/ll=
vm/<a href=3D"http://llvm3.3_3.3.bb">llvm3.3_3.3.bb</a>, do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/recipes-=
devtools/klibc/<a href=3D"http://klibc_2.0.4.bb">klibc_2.0.4.bb</a>, do_pac=
kage_qa
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/u=
nzip/<a href=3D"http://unzip_6.0.bb">unzip_6.0.bb</a>, do_package
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/d=
midecode/<a href=3D"http://dmidecode_3.0.bb">dmidecode_3.0.bb</a>, do_packa=
ge
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/s=
tat/<a href=3D"http://stat_3.3.bb">stat_3.3.bb</a>, do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes=
-mkv/libebml/<a href=3D"http://libebml_1.3.0.bb">libebml_1.3.0.bb</a>, do_c=
ompile
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/e=
d/<a href=3D"http://ed_1.9.bb">ed_1.9.bb</a>, do_package
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/s=
ysklogd/<a href=3D"http://sysklogd_1.5.1.bb">sysklogd_1.5.1.bb</a>, do_pack=
age_qa
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-supp=
ort/invensense/<a href=3D"http://invensense_git.bb">invensense_git.bb</a>, =
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support=
/soci/<a href=3D"http://soci_3.2.2.bb">soci_3.2.2.bb</a>, do_configure
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-extended/iscsitarget/iscsitarget_1.4.20.3+<a href=3D"http://svn502.bb">svn=
502.bb</a>, do_compile
  virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/=
recipes-extended/libwmf/<a href=3D"http://libwmf_0.2.8.4.bb">libwmf_0.2.8.4=
.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtool=
s/iptraf/<a href=3D"http://iptraf_3.0.0.bb">iptraf_3.0.0.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/p=
igz/<a href=3D"http://pigz_2.3.3.bb">pigz_2.3.3.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/apmd/<=
a href=3D"http://apmd_3.2.2-15.bb">apmd_3.2.2-15.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-support/pt=
est-runner/<a href=3D"http://ptest-runner_2.0.bb">ptest-runner_2.0.bb</a>, =
do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support=
/ckermit/<a href=3D"http://ckermit_302.bb">ckermit_302.bb</a>, do_install
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-connectivity/vlan/<a href=3D"http://vlan_1.9.bb">vlan_1.9.bb</a>, do_compi=
le
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support=
/pngcheck/<a href=3D"http://pngcheck_2.3.0.bb">pngcheck_2.3.0.bb</a>, do_co=
mpile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-benchma=
rk/nbench-byte/<a href=3D"http://nbench-byte_2.2.3.bb">nbench-byte_2.2.3.bb=
</a>, do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtool=
s/cunit/<a href=3D"http://cunit_2.1-3.bb">cunit_2.1-3.bb</a>, do_populate_s=
ysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multime=
dia/v4l2apps/<a href=3D"http://yavta_git.bb">yavta_git.bb</a>, do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtool=
s/serialcheck/<a href=3D"http://serialcheck_1.0.0.bb">serialcheck_1.0.0.bb<=
/a>, do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-protocols/pptp-linux/<a href=3D"http://pptp-linux_1.7.2.bb">pptp-linux_1.7=
.2.bb</a>, do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-support/pimd/<a href=3D"http://pimd_2.1.8.bb">pimd_2.1.8.bb</a>, do_compil=
e
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-irc/znc/<a href=3D"http://znc_git.bb">znc_git.bb</a>, do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extende=
d/rarpd/<a href=3D"http://rarpd_ss981107.bb">rarpd_ss981107.bb</a>, do_pack=
age
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support=
/libtinyxml2/<a href=3D"http://libtinyxml2_git.bb">libtinyxml2_git.bb</a>, =
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support=
/mg/<a href=3D"http://mg_20110905.bb">mg_20110905.bb</a>, do_compile
Summary: There were 33 WARNING messages shown.
Summary: There were 65 ERROR messages shown, returning a non-zero exit code=
.</pre></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On T=
ue, Feb 2, 2016 at 5:17 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><=
div class=3D"h5">On Tue, Feb 02, 2016 at 04:01:14PM +0000, Richard Purdie w=
rote:<br>
&gt; On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:<br>
&gt; &gt; bitbake.conf currently contains:<br>
&gt; &gt;<br>
&gt; &gt; EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&quot;<br>
&gt; &gt;<br>
&gt; &gt; Back in November[1] I submitted a patch that allowed this default=
<br>
&gt; &gt; value to be overridden without affecting anything else that was<b=
r>
&gt; &gt; appended to it. I received feedback that the default value was no=
<br>
&gt; &gt; longer useful and that it would be good to get rid of it.<br>
&gt; &gt;<br>
&gt; &gt; So, this patch series fixes the two recipes that still appear to =
be<br>
&gt; &gt; relying on the previous default and then makes the default<br>
&gt; &gt; EXTRA_OEMAKE =3D &quot;&quot;. After these changes core-image-sat=
o builds<br>
&gt; &gt; successfully for me (although I have not run it.)<br>
&gt; &gt;<br>
&gt; &gt; Mike.<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"http://lists.openembedded.org/pipermail/openembedd=
ed-core/2015-No" rel=3D"noreferrer" target=3D"_blank">http://lists.openembe=
dded.org/pipermail/openembedded-core/2015-No</a><br>
&gt; &gt; vember/112393.html<br>
&gt;<br>
&gt; This is a pretty major change and we likely need a bit more of an idea=
<br>
&gt; of impact.<br>
&gt;<br>
&gt; Which architectures did you test? Often, x86 is a bad choice here and<=
br>
&gt; we&#39;d need something cross (arm/mips/ppc) to ensure it really is do=
ing<br>
&gt; the right things. We also need to assess a bit more than just sato. We=
<br>
&gt; can run this up on the autobuilder and see what happens.<br>
&gt;<br>
&gt; A post to the architecture list is probably needed so everyone knows<b=
r>
&gt; this is happening (or at least being considered).<br>
&gt;<br>
&gt; I do worry how much of meta-oe may be affected by this.<br>
&gt;<br>
&gt; Martin: Any opinion on this?<br>
<br>
</div></div>I can give it a shot in next rounds of jenkins builds, but the =
state is<br>
already quite bad, so it will be hard to spot new issues.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br></div>

--001a1145b64c771a1d052b1d59b4--
