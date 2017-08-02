Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5F2A780B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 09:36:14 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id i133so1916683vka.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qISgpx6LwNZt4QF7xHXyrV72d8zlmK3AHogGwbcv8EY=;
	b=BWCCVDWAZ16l+oiHH7SEbwyGVKRkGDzzw4UjrBfKGcROj6cCNu6VktFx+DfqdvCnsb
	duMIp5tjqsva1KfwkeFRua4/Zn1OqkCMlJQjqCnGFy8LpGRghXoBnSGXLf7a8SyU3Lk1
	j9odcHjDrchij0FHz7gGkC3gE48GR+wg24oohi1k0kKybOENSXCp4wCRB1JFZeiITJVr
	cyOskxg1FdUz9DLX1nFSgZ2me21Xybq0u4lYXIWDuV/9U1bEu272Qd9GQhhaAfCFbVw1
	3uLVccA25exY3NZ2LSfRGSIQm3d0P1vtSfzz9NJULJ9zRnToOG+WI/Y8dz7PQ0s5k9No
	Yfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qISgpx6LwNZt4QF7xHXyrV72d8zlmK3AHogGwbcv8EY=;
	b=W3nlY9NruQrBHFl2npjUonWG3+YgjZCT22MvrWkXkaBgWDUMYTNwTZZv5ObKuwHv/m
	S2sgEmw/20k4+ZPp2kJspe+pcUIJZFih7mLrPugNraWrcVy0OIzXjXGXPuJj57saCNqO
	PvmpG0VWUvAI6FaNUOMjDDz9NeWWbQmG8u4Oq6ecs9bMLWT0i6Pvh/wH4AIKCECHMeAg
	t6SfS7fbb/NbJqc5uqdMFfSFS6248S5hjzD+JPWVkYNkvJzmNXSVjhvewOIJQ9F02WQD
	LhOj1kmV8DNDJ2lDvpMMZyoZcCS/r0tE6QKOJlM/98Jwgjvf3uOuFzoXAHIxJ2CE5OgK
	I6Nw==
X-Gm-Message-State: AIVw111oY/pmn+qCXBIAP8WqUFgaMWm9F9LIxzNNGQbJM9rrdzhEKYiF
	qmKljCpJshZcFTXbBy8TtOA2TEZJLw==
X-Received: by 10.31.92.2 with SMTP id q2mr13996589vkb.170.1501666575908; Wed,
	02 Aug 2017 02:36:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Wed, 2 Aug 2017 02:36:15 -0700 (PDT)
In-Reply-To: <20170802083531.GB2944@linux.intel.com>
References: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
	<1501607630-30241-4-git-send-email-liu.ming50@gmail.com>
	<20170802083531.GB2944@linux.intel.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 2 Aug 2017 11:36:15 +0200
Message-ID: <CALatG=4NsTRmmEEcVDOfA8QGn7ES762iXOijEyt=q60GgmaAdA@mail.gmail.com>
To: ed.bartosh@linux.intel.com
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] qemux86.conf: drop do_image_wic task dependencies
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
X-List-Received-Date: Wed, 02 Aug 2017 09:36:15 -0000
Content-Type: multipart/alternative; boundary="001a114d44d2d404670555c1febd"

--001a114d44d2d404670555c1febd
Content-Type: text/plain; charset="UTF-8"

Hi, Ed:

OK, understood. So the intention is to let WKS_FILE_DEPENDS contain the
packages needed by a specific WKS file only, while my purpose was to remove
the 'do_image_wic[depends]' way of maintaining the dependencies, use
WKS_FILE_DEPENDS
instead. Will send a V2.

//Ming Liu

2017-08-02 10:35 GMT+02:00 Ed Bartosh <ed.bartosh@linux.intel.com>:

> On Tue, Aug 01, 2017 at 07:13:49PM +0200, liu.ming50@gmail.com wrote:
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > They are being controlled by WKS_FILE_DEPENDS_DEFAULT, the code here
> > is redundant and incomplete as well.
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> >  meta/conf/machine/qemux86.conf | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.
> conf
> > index c26dda2..f0bebbf 100644
> > --- a/meta/conf/machine/qemux86.conf
> > +++ b/meta/conf/machine/qemux86.conf
> > @@ -29,4 +29,3 @@ MACHINE_FEATURES += "x86"
> >  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
> >
> >  WKS_FILE ?= "directdisk.wks"
> > -do_image_wic[depends] += "syslinux:do_populate_sysroot
> syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot
> dosfstools-native:do_populate_sysroot"
>
> -1
>
> WKS_FILE_DEPENDS_DEFAULT is a termporary setting aimed to easy
> transition from using wic-tools to using WKS_FILE_DEPENDS. It contains
> the whole set of packages that is not usually needed.
>
> Please, consider setting WKS_FILE_DEPENDS with the minimum set of packages
> required by directdisk.wks. This will faster the build as unneeded
> packages will not be built.
>
> You may want to look at "image_types_wic: set default WKS_FILE_DEPENDS"
> commit for further details.
>
> --
> Regards,
> Ed
>

--001a114d44d2d404670555c1febd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Ed:<div><br></div><div>OK, understood. So the intentio=
n is to let=C2=A0<span style=3D"font-size:14px">WKS_FILE_DEPENDS contain th=
e packages needed by a specific WKS file only, while my purpose was to remo=
ve the &#39;do_image_wic[depends]&#39; way of maintaining the dependencies,=
 use=C2=A0</span><span style=3D"font-size:14px">WKS_FILE_DEPENDS instead. W=
ill send a V2.</span></div><div><span style=3D"font-size:14px"><br></span><=
/div><div><span style=3D"font-size:14px">//Ming Liu=C2=A0</span></div></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-08-02 10:35=
 GMT+02:00 Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailto:ed.bartosh@li=
nux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;</span>:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Aug 01, 2017 at=
 07:13:49PM +0200, <a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail=
.com</a> wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.c=
om">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt;<br>
&gt; They are being controlled by WKS_FILE_DEPENDS_DEFAULT, the code here<b=
r>
&gt; is redundant and incomplete as well.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atl=
ascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/machine/qemux86.conf | 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine/qemux86.<wbr>conf b/meta/conf/machine/q=
emux86.<wbr>conf<br>
&gt; index c26dda2..f0bebbf 100644<br>
&gt; --- a/meta/conf/machine/qemux86.<wbr>conf<br>
&gt; +++ b/meta/conf/machine/qemux86.<wbr>conf<br>
&gt; @@ -29,4 +29,3 @@ MACHINE_FEATURES +=3D &quot;x86&quot;<br>
&gt;=C2=A0 MACHINE_ESSENTIAL_EXTRA_<wbr>RDEPENDS +=3D &quot;v86d&quot;<br>
&gt;<br>
&gt;=C2=A0 WKS_FILE ?=3D &quot;directdisk.wks&quot;<br>
&gt; -do_image_wic[depends] +=3D &quot;syslinux:do_populate_sysroot syslinu=
x-native:do_populate_<wbr>sysroot mtools-native:do_populate_<wbr>sysroot do=
sfstools-native:do_populate_<wbr>sysroot&quot;<br>
<br>
</span>-1<br>
<br>
WKS_FILE_DEPENDS_DEFAULT is a termporary setting aimed to easy<br>
transition from using wic-tools to using WKS_FILE_DEPENDS. It contains<br>
the whole set of packages that is not usually needed.<br>
<br>
Please, consider setting WKS_FILE_DEPENDS with the minimum set of packages<=
br>
required by directdisk.wks. This will faster the build as unneeded<br>
packages will not be built.<br>
<br>
You may want to look at &quot;image_types_wic: set default WKS_FILE_DEPENDS=
&quot;<br>
commit for further details.<br>
<br>
--<br>
Regards,<br>
Ed<br>
</blockquote></div><br></div>

--001a114d44d2d404670555c1febd--
