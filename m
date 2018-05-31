Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B19374F7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 19:35:14 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id c23-v6so9249739uan.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 12:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HxOOaIX30fzRJ93e0S2aul8UTzj3qMH8t77LjwFO1Rk=;
	b=h4Buqh3mFYe9/H+SCaZTFJrYntNV/fFLqNxjfX6Ag45nAKKWPDWc/TXXLcj+GBr9z2
	tkxxINawVeX4UIIuWFiZ+PI8v/qnO+vdN/2nXXiZQsHN2Ptkb6HzqHL/S4S/qFeLjn76
	pG9H2RmuvK2f67iOtVW/jQx+4IViVms3vdOgzC9oKIG7t2c4oCgnumX/ACcwPuOozgjV
	E+jHAJ+boqKvdQFqJUxIEsYEyGSTwIf7nLeUX3UrGXfbBaRBY90LcBMAVU7TSYwWR5z8
	6zvoB6zc4tLwwAle0fshgflyj6VtmKImFxVWWD10h5INy5xS+tysNpE/9+/AxcgCMRfx
	l7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HxOOaIX30fzRJ93e0S2aul8UTzj3qMH8t77LjwFO1Rk=;
	b=JWk3Yt6Cq1uIPfVwxu9o23ZuGH6FWqR/c9kFpdCDRKrMgUMD2vvAt6TnYGDVjRtSHj
	dl/f9Q1TbEhgXH/Qytm+1VViB41BSZK/q/caZsQgQDeePKehQJxjfQ3ackkTt24Q5H4Q
	pD2d0eP32/VcE/lU16NIfUqAfnjGHLo6D3nV+YcePvGI4kkGIk3q2svaXFcDw+5W7c3O
	MRy8l5cqvl3H7rwyaxMz6RdTt3fE6nLdpOAmoMvM20qwaoIJDXwtfzIGzGxcnMp5mCIk
	Unndx6uI+AY8yL+WWwQscn18uHBHpDPLYW7ydiaL7FCgcK/EAaI/USpudbT9SAwkVXKH
	i0vg==
X-Gm-Message-State: ALKqPwc910jkzhJoTRerxoGC61R2Yfs6DzGV18QEE7R4JSTeZr/inVGb
	0aGkZ+NXck/UcyrcQYOe6cmPJiWcYcLxFua/gzA=
X-Google-Smtp-Source: ADUXVKJooLa7HheXl3qShYzQKHhDoNZ2513TUn098EdnXB/Z8zn5eyrg9KlBzqsPRik7yqQFLDoVv5Uc4ToyPgFqAtg=
X-Received: by 2002:a9f:3a47:: with SMTP id r7-v6mr5464005uag.44.1527795315802;
	Thu, 31 May 2018 12:35:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:4b48:0:0:0:0:0 with HTTP; Thu, 31 May 2018 12:35:15
	-0700 (PDT)
In-Reply-To: <CAJ86T=UsqCs=O8SqTaS5qrKcShkzr0emc_i0W+OcSsvT_pNskQ@mail.gmail.com>
References: <1527756958-16824-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=UsqCs=O8SqTaS5qrKcShkzr0emc_i0W+OcSsvT_pNskQ@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 31 May 2018 21:35:15 +0200
Message-ID: <CALatG=7zaFi0c6+9z+DR3hTA=RpmUYDZjtR6wM87nfRh94wHZQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devicetree.bbclass: replace KERNEL_IMAGETYPE_FOR_MAKE with KERNEL_IMAGETYPE
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
X-List-Received-Date: Thu, 31 May 2018 19:35:15 -0000
Content-Type: multipart/alternative; boundary="00000000000016877a056d85911a"

--00000000000016877a056d85911a
Content-Type: text/plain; charset="UTF-8"

Hi, Andre:

Thanks for the review, will do that.

//Ming Liu

2018-05-31 20:00 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:

> On Thu, May 31, 2018 at 1:55 AM,  <liu.ming50@gmail.com> wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > It should be KERNEL_IMAGETYPE rather than KERNEL_IMAGETYPE_FOR_MAKE to
>
> KERNEL_IMAGETYPE is a legacy variable, in the process of being
> replaced by KERNEL_IMAGETYPES. You should probably use the new
> variable if possible.
>
> > be handled in do_install and do_deploy tasks, since we are having some
> > special logic in kernel-uimage.bbclass and kernel-fitimage.bbclass to
> > replace the real kernel image types during do_compile, like:
> > in kernel-uimage.bbclass: uImage -> vmlinux
> > in kernel-fitimage.bbclass: fitImage -> Image/bzImage/zImage...
> >
> > but the final images to be installed/deployed should still be uImage or
> > fitImage.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes/kernel-devicetree.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel-devicetree.bbclass
> b/meta/classes/kernel-devicetree.bbclass
> > index 4f80cc6..04e6321 100644
> > --- a/meta/classes/kernel-devicetree.bbclass
> > +++ b/meta/classes/kernel-devicetree.bbclass
> > @@ -63,7 +63,7 @@ do_install_append() {
> >                 DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> >                 DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> >                 install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${
> DTB_BASE_NAME}.${DTB_EXT}
> > -               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> > +               for type in ${KERNEL_IMAGETYPE}; do
> >                         symlink_name=${type}"-"${
> KERNEL_IMAGE_SYMLINK_NAME}
> >                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >                         ln -sf ${DTB_BASE_NAME}.${DTB_EXT}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
> > @@ -82,7 +82,7 @@ do_deploy_append() {
> >                 DTB=`normalize_dtb "${DTB}"`
> >                 DTB_EXT=${DTB##*.}
> >                 DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> > -               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> > +               for type in ${KERNEL_IMAGETYPE}; do
> >                         base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
> >                         symlink_name=${type}"-"${
> KERNEL_IMAGE_SYMLINK_NAME}
> >                         DTB_NAME=`echo ${base_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000016877a056d85911a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Andre:<div><br></div><div>Thanks for the review, will =
do that.</div><div><br></div><div>//Ming Liu</div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">2018-05-31 20:00 GMT+02:00 Andre McC=
urdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D=
"_blank">armccurdy@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span class=3D"">On Thu, May 31, 2018 at 1:55 AM,=C2=A0 &lt;<a href=3D"=
mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@=
gmail.com</a>&gt;<br>
&gt;<br>
&gt; It should be KERNEL_IMAGETYPE rather than KERNEL_IMAGETYPE_FOR_MAKE to=
<br>
<br>
</span>KERNEL_IMAGETYPE is a legacy variable, in the process of being<br>
replaced by KERNEL_IMAGETYPES. You should probably use the new<br>
variable if possible.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; be handled in do_install and do_deploy tasks, since we are having some=
<br>
&gt; special logic in kernel-uimage.bbclass and kernel-fitimage.bbclass to<=
br>
&gt; replace the real kernel image types during do_compile, like:<br>
&gt; in kernel-uimage.bbclass: uImage -&gt; vmlinux<br>
&gt; in kernel-fitimage.bbclass: fitImage -&gt; Image/bzImage/zImage...<br>
&gt;<br>
&gt; but the final images to be installed/deployed should still be uImage o=
r<br>
&gt; fitImage.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">li=
u.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-<wbr>devicetree.bbclass | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-<wbr>devicetree.bbclass b/meta/classe=
s/kernel-<wbr>devicetree.bbclass<br>
&gt; index 4f80cc6..04e6321 100644<br>
&gt; --- a/meta/classes/kernel-<wbr>devicetree.bbclass<br>
&gt; +++ b/meta/classes/kernel-<wbr>devicetree.bbclass<br>
&gt; @@ -63,7 +63,7 @@ do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=
=3D`get_real_dtb_path_<wbr>in_kernel &quot;${DTB}&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_=
NAME=3D`basename ${DTB} .&quot;${DTB_EXT}&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -=
m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${<wbr>DTB_BASE_NAME}.${DTB_EXT=
}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${=
KERNEL_IMAGETYPE_FOR_MAKE}; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${=
KERNEL_IMAGETYPE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${<wbr>KERNEL_IMAGE_=
SYMLINK_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/=
${MACHINE}/${DTB_BASE_NAME}<wbr>/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGED=
EST}/<wbr>devicetree-${DTB_SYMLINK_NAME}<wbr>.${DTB_EXT}<br>
&gt; @@ -82,7 +82,7 @@ do_deploy_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`no=
rmalize_dtb &quot;${DTB}&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_EXT=
=3D${DTB##*.}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_=
NAME=3D`basename ${DTB} .&quot;${DTB_EXT}&quot;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${=
KERNEL_IMAGETYPE_FOR_MAKE}; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${=
KERNEL_IMAGETYPE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0base_name=3D${type}&quot;-&quot;${KERNEL_<wbr>IMAGE_BAS=
E_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${<wbr>KERNEL_IMAGE_=
SYMLINK_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0DTB_NAME=3D`echo ${base_name} | sed &quot;s/${MACHINE}/=
${DTB_BASE_NAME}<wbr>/g&quot;`<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--00000000000016877a056d85911a--
