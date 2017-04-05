Return-Path: <vlsireddy@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 59B8560806
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:37:11 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id t20so27823360wra.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 11:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+Bnt5iAgYyiNSW0MMSU/wixuPsfHktCJCv7AZCSJLmA=;
	b=NHj1gRk98+/v2dofocJAuaOXVEEFGiEh//5sAZB8Vw4JS3TVx12DM8rSJp0RibcjJv
	Jeu27nYtZcxoomQv5QEa/jv+DlvvOLklcAnt+QEIzPxOncRgBeMGHfcYkYT/W4q4iQcf
	vdGX+5LPRQ1GpEq1voG3mRwRE/aeK1NZ3pnGzKR8Kn6vbnUekv/DH9H09Zr9M6+ut7Ia
	azK1Wrv43TrsDgfF42l8P/B93LdP29Sv/ra5cSTg9s6iAZHKHIYDQn8HiQetSXDquqBZ
	uMfYuDgn0lWFsHNf65oKx3DBPqMsGaNPE6rDGKGLmLgCu1xt2D/tH9GwTop5TYMbc9Go
	yfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+Bnt5iAgYyiNSW0MMSU/wixuPsfHktCJCv7AZCSJLmA=;
	b=NDRHhE9BeTTnHLGwfuxuJcEIcH1qrJkiwvF89Wg8gw10IThWM2ikGihD47HEUo3PEv
	W0xzPC7AfAFvMbPaZTyp4BZxeLikvnTggQEIcJ2cp6OjR2P2QaZjcZKcBuGcBdvEbcag
	4LLTWRH9eXwqVvBAgW+4l59LyC+mbhXUptsUNDj2pNaIi0AL7kYIIxwI6JoY7gTWU05A
	ugmY/HUMb5Q/m1ETtPS1XTpIWu861vOjq7T9lMuTlcxJkstdkh+mUhbog5g9Z+ITWao3
	JGKGtwrG7AABJ4g5414FwG19Wn6wsId4f+dnv3TyyUb4878coCKzaCfESCVczkKQSWuM
	AUng==
X-Gm-Message-State: AFeK/H3snLDZkEnst7HLphyQSa3PrDBdYKWjP+NOw1FSEVe2LzWjXucS
	y94LLHX+IqovxId56+kyf53LRZ5HHA==
X-Received: by 10.28.28.69 with SMTP id c66mr21054301wmc.28.1491417428521;
	Wed, 05 Apr 2017 11:37:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.35.214 with HTTP; Wed, 5 Apr 2017 11:37:07 -0700 (PDT)
In-Reply-To: <CAEsOVNcN6=XAt8b7_PN288yHs8syzV08LreRkwSf2Mxpeb8Cgw@mail.gmail.com>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
	<CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
	<CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
	<1491407333.17200.22.camel@linuxfoundation.org>
	<CAGQ4JX1DGeQuO3WhhpHZbJFsUpOg1uHmOou1fcQvgBy+hJpjOQ@mail.gmail.com>
	<CAGQ4JX12JDMaffLGYO16626BhXCSAQ3wzVEzN21wzcrZ7mwJ5A@mail.gmail.com>
	<CAEsOVNcN6=XAt8b7_PN288yHs8syzV08LreRkwSf2Mxpeb8Cgw@mail.gmail.com>
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Wed, 5 Apr 2017 14:37:07 -0400
Message-ID: <CAGQ4JX1ibcWeYV7NfYSB8cCOYH=83XEON1=sf4U9S378A16p8w@mail.gmail.com>
To: Matthew McClintock <msm-oss@mcclintock.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe [patch] modification to generate a static library instead of shared library
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
X-List-Received-Date: Wed, 05 Apr 2017 18:37:11 -0000
Content-Type: multipart/alternative; boundary=001a1144fba409fa4a054c6fae3e

--001a1144fba409fa4a054c6fae3e
Content-Type: text/plain; charset=UTF-8

Hi,
     is this what you are talking about

root@polar:~/zcu_yocto/poky/build/tmp/sysroots/zcu102-zynqmp/pkgdata/runtime#
ls -ltr *libxml*
-rwxrwxrwx 2 root root      0 Nov 21 14:05 libxml2-ptest.packaged
-rwxrwxrwx 2 root root 463307 Nov 21 14:05 libxml2-ptest
-rwxrwxrwx 2 root root    933 Nov 21 14:05 libxml2-staticdev
-rwxrwxrwx 2 root root      0 Nov 21 14:05 libxml2-dbg.packaged
-rwxrwxrwx 2 root root  10526 Nov 21 14:05 libxml2-dbg
-rwxrwxrwx 2 root root      0 Nov 21 14:05 libxml2-dev.packaged
-rwxrwxrwx 2 root root   3836 Nov 21 14:05 libxml2-dev
-rwxrwxrwx 2 root root      0 Nov 21 14:05 libxml2-doc.packaged
-rwxrwxrwx 2 root root  17476 Nov 21 14:05 libxml2-doc
-rwxrwxrwx 2 root root    638 Nov 21 14:05 libxml2-locale
-rwxrwxrwx 2 root root      0 Nov 21 14:05 libxml2.packaged
-rwxrwxrwx 2 root root   4164 Nov 21 14:05 libxml2
-rwxrwxrwx 2 root root    628 Nov 21 14:05 libxml2-utils
-rwxrwxrwx 2 root root      0 Nov 21 14:05 libxml2-python.packaged
-rwxrwxrwx 2 root root   2910 Nov 21 14:05 libxml2-python
root@polar
:~/zcu_yocto/poky/build/tmp/sysroots/zcu102-zynqmp/pkgdata/runtime#
root@polar
:~/zcu_yocto/poky/build/tmp/sysroots/zcu102-zynqmp/pkgdata/runtime#
root@polar
:~/zcu_yocto/poky/build/tmp/sysroots/zcu102-zynqmp/pkgdata/runtime#
root@polar
:~/zcu_yocto/poky/build/tmp/sysroots/zcu102-zynqmp/pkgdata/runtime#

if not, then sorry, i didnt get you when you say "static dev packages"

Thanks


On Wed, Apr 5, 2017 at 2:26 PM, Matthew McClintock <msm-oss@mcclintock.net>
wrote:

> Do you have the staticdev packages in your TMPDIR? E.g.
>
> tmp/work/cortexa15t2hf-neon-rdk-linux-gnueabi/libxml2/2.9.
> 4-r0/deploy-ipks/cortexa15t2hf-neon/libxml2-staticdev_2.9.4-r0_
> cortexa15t2hf-neon.ipk
>
> -M
>
> On Wed, Apr 5, 2017 at 1:09 PM, Ravi chandra reddy <vlsireddy@gmail.com>
> wrote:
> > Hi,
> >     Let me thank you guys for quick reply.
> > let me put my  email in correct steps
> >
> > 1. below local/local.conf changes makes bitbake fail.
> >
> >                             IMAGE_INSTALL_append = "lib32-glibc
> lib32-libgcc
> > lib32-libstdc++ libedit libxml2-staticdev"
> >
> > error:=============
> > ================================== i get the following
> > errors==================================
> > ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> > ERROR: Logfile of failure stored in:
> > /home/polar/zcu_yocto/poky/build/tmp/work/zcu102_zynqmp-
> poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.17721
> > ERROR: Task 9
> > (/home/polar/zcu_yocto/poky/meta/recipes-core/images/core-
> image-minimal.bb,
> > do_rootfs) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn't need to be
> > rerun and 1 failed.
> > ===================================
> >
> > 2.  without staticdev changes [in local/local.conf], it
> > [bitbake-core-image-minimal] goes through and it builds [but there is
> only
> > .so [dynamic library] generated]
> >
> > IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
> > libxml2"
> >
> >
> > 3. i ran the search and found that all "no-static" lines are commented
> >
> > bitbake -e | grep static-libs
> >
> >
> > and all the "no-static-libs.inc" are commented [#]
> >
> > Thanks
> > RC
> >
> > On Wed, Apr 5, 2017 at 2:04 PM, Ravi chandra reddy <vlsireddy@gmail.com>
> > wrote:
> >>
> >> Hi,
> >>        in local/local.conf it [bitbake core-image-minimal] fails, if i
> use
> >> libxml2-staticdev
> >>
> >>   # Specify the 32-bit libraries to be added to all images
> >> IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
> >> libxml2-staticdev"
> >>
> >> ================================== i get the following
> >> errors==================================
> >> ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> >> ERROR: Logfile of failure stored in:
> >> /home/polar/zcu_yocto/poky/build/tmp/work/zcu102_zynqmp-
> poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.17721
> >> ERROR: Task 9
> >> (/home/polar/zcu_yocto/poky/meta/recipes-core/images/core-
> image-minimal.bb,
> >> do_rootfs) failed with exit code '1'
> >> NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn't need to
> be
> >> rerun and 1 failed.
> >> ===================================
> >>
> >> if i use as below, there is no issue. however there is no .so
> >>
> >> # Specify the 32-bit libraries to be added to all images
> >> IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
> >> libxml2"
> >>
> >> i ran
> >>
> >> bitbake -e | grep static-libs
> >>
> >> and all the "no-static-libs.inc" are commented [#]
> >>
> >> Thanks
> >> RC
> >>
> >>
> >>
> >> On Wed, Apr 5, 2017 at 11:48 AM, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >>>
> >>> On Wed, 2017-04-05 at 10:33 -0500, Matthew McClintock wrote:
> >>> > On Wed, Apr 5, 2017 at 10:18 AM, Ravi chandra reddy <vlsireddy@gmail.
> >>> > com> wrote:
> >>> > >
> >>> > > Hi All,
> >>> > >           I am using meta-oe to generate libxml2 library using
> >>> > > AARCH64
> >>> > > compiler. However it generates shared object [.so] library.
> >>> > >
> >>> > > is there any setting in recipe to modify this, to generate static
> >>> > > library
> >>> > > [instead of shared library]
> >>> > >
> >>> > > if so, please point me to the recipe/file to change.
> >>> > >
> >>> > > if not, i will try to add it as patch, plz point me to appropriate
> >>> > > files to
> >>> > > change
> >>> > Is the ${PN}-staticdev package getting generated for you?
> >>>
> >>> Its possible you have conf/distro/include/no-static-libs.inc included
> >>> in your build (bitbake -e would tell you).
> >>>
> >>> If so, you could remove that include or set:
> >>>
> >>> DISABLE_STATIC = ""
> >>>
> >>> as it would currently be set to this if that include file is included:
> >>>
> >>> DISABLE_STATIC = " --disable-static"
> >>>
> >>> We tend not to build static libraries as they're a waste of space/time
> >>> on the most part.
> >>>
> >>> Cheers,
> >>>
> >>> Richard
> >>
> >>
> >
>

--001a1144fba409fa4a054c6fae3e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>=C2=A0 =C2=A0 =C2=A0is this what you are talking a=
bout</div><div><br></div><div><div>root@polar:~/zcu_yocto/poky/build/tmp/sy=
sroots/zcu102-zynqmp/pkgdata/runtime# ls -ltr *libxml*</div><div>-rwxrwxrwx=
 2 root root =C2=A0 =C2=A0 =C2=A00 Nov 21 14:05 libxml2-ptest.packaged</div=
><div>-rwxrwxrwx 2 root root 463307 Nov 21 14:05 libxml2-ptest</div><div>-r=
wxrwxrwx 2 root root =C2=A0 =C2=A0933 Nov 21 14:05 libxml2-staticdev</div><=
div>-rwxrwxrwx 2 root root =C2=A0 =C2=A0 =C2=A00 Nov 21 14:05 libxml2-dbg.p=
ackaged</div><div>-rwxrwxrwx 2 root root =C2=A010526 Nov 21 14:05 libxml2-d=
bg</div><div>-rwxrwxrwx 2 root root =C2=A0 =C2=A0 =C2=A00 Nov 21 14:05 libx=
ml2-dev.packaged</div><div>-rwxrwxrwx 2 root root =C2=A0 3836 Nov 21 14:05 =
libxml2-dev</div><div>-rwxrwxrwx 2 root root =C2=A0 =C2=A0 =C2=A00 Nov 21 1=
4:05 libxml2-doc.packaged</div><div>-rwxrwxrwx 2 root root =C2=A017476 Nov =
21 14:05 libxml2-doc</div><div>-rwxrwxrwx 2 root root =C2=A0 =C2=A0638 Nov =
21 14:05 libxml2-locale</div><div>-rwxrwxrwx 2 root root =C2=A0 =C2=A0 =C2=
=A00 Nov 21 14:05 libxml2.packaged</div><div>-rwxrwxrwx 2 root root =C2=A0 =
4164 Nov 21 14:05 libxml2</div><div>-rwxrwxrwx 2 root root =C2=A0 =C2=A0628=
 Nov 21 14:05 libxml2-utils</div><div>-rwxrwxrwx 2 root root =C2=A0 =C2=A0 =
=C2=A00 Nov 21 14:05 libxml2-python.packaged</div><div>-rwxrwxrwx 2 root ro=
ot =C2=A0 2910 Nov 21 14:05 libxml2-python</div><div>root@polar:~/zcu_yocto=
/poky/build/tmp/sysroots/zcu102-zynqmp/pkgdata/runtime#=C2=A0</div><div>roo=
t@polar:~/zcu_yocto/poky/build/tmp/sysroots/zcu102-zynqmp/pkgdata/runtime#=
=C2=A0</div><div>root@polar:~/zcu_yocto/poky/build/tmp/sysroots/zcu102-zynq=
mp/pkgdata/runtime#=C2=A0</div><div>root@polar:~/zcu_yocto/poky/build/tmp/s=
ysroots/zcu102-zynqmp/pkgdata/runtime#=C2=A0</div></div><div><br></div><div=
>if not, then sorry, i didnt get you when you say &quot;static dev packages=
&quot;</div><div><br></div><div>Thanks</div><div><br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 5, 2017 at 2:26=
 PM, Matthew McClintock <span dir=3D"ltr">&lt;<a href=3D"mailto:msm-oss@mcc=
lintock.net" target=3D"_blank">msm-oss@mcclintock.net</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Do you have the staticdev packages in yo=
ur TMPDIR? E.g.<br>
<br>
tmp/work/cortexa15t2hf-neon-<wbr>rdk-linux-gnueabi/libxml2/2.9.<wbr>4-r0/de=
ploy-ipks/<wbr>cortexa15t2hf-neon/libxml2-<wbr>staticdev_2.9.4-r0_<wbr>cort=
exa15t2hf-neon.ipk<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-M<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
On Wed, Apr 5, 2017 at 1:09 PM, Ravi chandra reddy &lt;<a href=3D"mailto:vl=
sireddy@gmail.com">vlsireddy@gmail.com</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Let me thank you guys for quick reply.<br>
&gt; let me put my=C2=A0 email in correct steps<br>
&gt;<br>
&gt; 1. below local/local.conf changes makes bitbake fail.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_INSTALL_append =3D &quot;lib32-glib=
c lib32-libgcc<br>
&gt; lib32-libstdc++ libedit libxml2-staticdev&quot;<br>
&gt;<br>
&gt; error:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D i get the following<br>
&gt; errors=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs=
<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/polar/zcu_yocto/poky/<wbr>build/tmp/work/zcu102_zynqmp-<wbr>poky=
-linux/core-image-minimal/<wbr>1.0-r0/temp/log.do_rootfs.<wbr>17721<br>
&gt; ERROR: Task 9<br>
&gt; (/home/polar/zcu_yocto/poky/<wbr>meta/recipes-core/images/<a href=3D"h=
ttp://core-image-minimal.bb" rel=3D"noreferrer" target=3D"_blank">core-<wbr=
>image-minimal.bb</a>,<br>
&gt; do_rootfs) failed with exit code &#39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn&#39;t nee=
d to be<br>
&gt; rerun and 1 failed.<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D<br>
&gt;<br>
&gt; 2.=C2=A0 without staticdev changes [in local/local.conf], it<br>
&gt; [bitbake-core-image-minimal] goes through and it builds [but there is =
only<br>
&gt; .so [dynamic library] generated]<br>
&gt;<br>
&gt; IMAGE_INSTALL_append =3D &quot;lib32-glibc lib32-libgcc lib32-libstdc+=
+ libedit<br>
&gt; libxml2&quot;<br>
&gt;<br>
&gt;<br>
&gt; 3. i ran the search and found that all &quot;no-static&quot; lines are=
 commented<br>
&gt;<br>
&gt; bitbake -e | grep static-libs<br>
&gt;<br>
&gt;<br>
&gt; and all the &quot;no-static-libs.inc&quot; are commented [#]<br>
&gt;<br>
&gt; Thanks<br>
&gt; RC<br>
&gt;<br>
&gt; On Wed, Apr 5, 2017 at 2:04 PM, Ravi chandra reddy &lt;<a href=3D"mail=
to:vlsireddy@gmail.com">vlsireddy@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 in local/local.conf it [bitbake core-im=
age-minimal] fails, if i use<br>
&gt;&gt; libxml2-staticdev<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0# Specify the 32-bit libraries to be added to all imag=
es<br>
&gt;&gt; IMAGE_INSTALL_append =3D &quot;lib32-glibc lib32-libgcc lib32-libs=
tdc++ libedit<br>
&gt;&gt; libxml2-staticdev&quot;<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D i get the following<br>
&gt;&gt; errors=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_ro=
otfs<br>
&gt;&gt; ERROR: Logfile of failure stored in:<br>
&gt;&gt; /home/polar/zcu_yocto/poky/<wbr>build/tmp/work/zcu102_zynqmp-<wbr>=
poky-linux/core-image-minimal/<wbr>1.0-r0/temp/log.do_rootfs.<wbr>17721<br>
&gt;&gt; ERROR: Task 9<br>
&gt;&gt; (/home/polar/zcu_yocto/poky/<wbr>meta/recipes-core/images/<a href=
=3D"http://core-image-minimal.bb" rel=3D"noreferrer" target=3D"_blank">core=
-<wbr>image-minimal.bb</a>,<br>
&gt;&gt; do_rootfs) failed with exit code &#39;1&#39;<br>
&gt;&gt; NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn&#39;t=
 need to be<br>
&gt;&gt; rerun and 1 failed.<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; if i use as below, there is no issue. however there is no .so<br>
&gt;&gt;<br>
&gt;&gt; # Specify the 32-bit libraries to be added to all images<br>
&gt;&gt; IMAGE_INSTALL_append =3D &quot;lib32-glibc lib32-libgcc lib32-libs=
tdc++ libedit<br>
&gt;&gt; libxml2&quot;<br>
&gt;&gt;<br>
&gt;&gt; i ran<br>
&gt;&gt;<br>
&gt;&gt; bitbake -e | grep static-libs<br>
&gt;&gt;<br>
&gt;&gt; and all the &quot;no-static-libs.inc&quot; are commented [#]<br>
&gt;&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt; RC<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Apr 5, 2017 at 11:48 AM, Richard Purdie<br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.=
purdie@<wbr>linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Wed, 2017-04-05 at 10:33 -0500, Matthew McClintock wrote:<b=
r>
&gt;&gt;&gt; &gt; On Wed, Apr 5, 2017 at 10:18 AM, Ravi chandra reddy &lt;v=
lsireddy@gmail.<br>
&gt;&gt;&gt; &gt; com&gt; wrote:<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Hi All,<br>
&gt;&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I am using m=
eta-oe to generate libxml2 library using<br>
&gt;&gt;&gt; &gt; &gt; AARCH64<br>
&gt;&gt;&gt; &gt; &gt; compiler. However it generates shared object [.so] l=
ibrary.<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; is there any setting in recipe to modify this, to ge=
nerate static<br>
&gt;&gt;&gt; &gt; &gt; library<br>
&gt;&gt;&gt; &gt; &gt; [instead of shared library]<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; if so, please point me to the recipe/file to change.=
<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; if not, i will try to add it as patch, plz point me =
to appropriate<br>
&gt;&gt;&gt; &gt; &gt; files to<br>
&gt;&gt;&gt; &gt; &gt; change<br>
&gt;&gt;&gt; &gt; Is the ${PN}-staticdev package getting generated for you?=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Its possible you have conf/distro/include/no-static-<wbr>libs.=
inc included<br>
&gt;&gt;&gt; in your build (bitbake -e would tell you).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If so, you could remove that include or set:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; DISABLE_STATIC =3D &quot;&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; as it would currently be set to this if that include file is i=
ncluded:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; DISABLE_STATIC =3D &quot; --disable-static&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; We tend not to build static libraries as they&#39;re a waste o=
f space/time<br>
&gt;&gt;&gt; on the most part.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cheers,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Richard<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a1144fba409fa4a054c6fae3e--
