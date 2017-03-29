Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id F1F0D77C3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 20:40:38 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id b187so2015961oif.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rrd8y+xBqeaQPPcgOwesIFPwE0ubNiOnMYZLTowahaE=;
	b=RCqZWw34TDxL9WOKTbXVqgvkuRPbhRPYM5yea89TbkA8mtxwDL6TGOyyx6x3xhTwaE
	H/k29+0gTVDbRvVDlsCE25R+tvUD8VC9BwXye1CAz6gk8cNblZljMkAsnM8CcTGug9pf
	YK3UPvoufv2HhoB+vdwe3G/EOg+jUYm1Fp/Ivt9kSyV9hbQK0UEaZCSfmTS6NFbwLvA5
	9KPguOPvqsd1Q2zV/9ANCjAQSnsrTYhCdOXBDL5dKZUJTt/4Y8pJBBpWzULt3ogWyMWb
	Y+SzTCsYqBp/0uzdOM8qD5gUOsts6UV/5fWaMxC9AYLwsurz3LZJTmibx/MhnCNw5Vu0
	r6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rrd8y+xBqeaQPPcgOwesIFPwE0ubNiOnMYZLTowahaE=;
	b=gSEODBJKE3JjoQM6dfoekykqkr8jurlEOQWWpdrqpZAL5V9G/TI/ODq9vzRlxNEz1U
	dPtV3QOH/PvmKC8fAn9+tlwnw1oPS0zmhvgysqgRxG1akOqKzX6Vs2o1WF7LTD3OQnec
	N4eWyVMC8BREjBH6PcEaZtGWQO6/7i7RUs4evxGbzdBiRNJyxqy9/t0uuXj5E3c53j7K
	Ugh2MPX2/MBH6344AUWHKpVQRYl2YirY8IKHl5J6jsfMiNEKuuYpPvhvnt3N9KI5DoBR
	g/TfCDNCTAiW+EmuLK1/c+oH339r1IxH/GImUTlfxX4elOr6rs0jEfCELtLkLWEaEp/V
	YgVg==
X-Gm-Message-State: AFeK/H0th96FVFXLH9CdzBhteyXeSJIzrpN/n8z+Jx/YGPBOvEkUuG3tvfuD6SQxl0LQBNGNeeFfcXIil6Z8ow==
X-Received: by 10.202.240.213 with SMTP id o204mr1462002oih.146.1490820040008; 
	Wed, 29 Mar 2017 13:40:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.32.161 with HTTP; Wed, 29 Mar 2017 13:40:19 -0700 (PDT)
In-Reply-To: <CAAQYJAvnEY2=jHs6dkjk0aSR74s6+4xYLEQMsp4yVXjngsWQ4g@mail.gmail.com>
References: <cover.1490717618.git.chris_larson@mentor.com>
	<f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
	<CAAQYJAvnEY2=jHs6dkjk0aSR74s6+4xYLEQMsp4yVXjngsWQ4g@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 29 Mar 2017 13:40:19 -0700
Message-ID: <CABcZAN=vQzdwxd6F=nGBq0TWhOjx8kw0_MZfPpN82V=pbntF5g@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] update_gio_module_cache: fix host user contamination
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
X-List-Received-Date: Wed, 29 Mar 2017 20:40:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c0931d6e8aed6054be49632

--94eb2c0931d6e8aed6054be49632
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 1:33 PM, Andrea Adami <andrea.adami@gmail.com>
wrote:

> On Tue, Mar 28, 2017 at 6:14 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
> > From: Abdur Rehman <abdur_rehman@mentor.com>
> >
> > update_gio_module_cache intercept creates file:
> > $D${libdir}/gio/modules/giomodule.cache
> >
> > Change ownership of this file to root:root to avoid user contamination
> > by host.
> >
> > Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  scripts/postinst-intercepts/update_gio_module_cache | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/scripts/postinst-intercepts/update_gio_module_cache
> b/scripts/postinst-intercepts/update_gio_module_cache
> > index fe468092cf..92092f2144 100644
> > --- a/scripts/postinst-intercepts/update_gio_module_cache
> > +++ b/scripts/postinst-intercepts/update_gio_module_cache
> > @@ -5,3 +5,5 @@ set -e
> >  PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D${libdir}:$=
D${base_libdir}
> \
> >          $D${libexecdir}/${binprefix}gio-querymodules
> $D${libdir}/gio/modules/
> >
> > +chown root:root $D${libdir}/gio/modules/giomodule.cache
> > +
> > --
> > 2.11.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> Hello,
> There must be something wrong with this patch.
> After fresh pull of an hour ago I git:
>
> andrea@ThinkPad-T520:/oe/oe-core/build$ bitbake core-image-base
> Loading cache: 100% |############################################| Time:
> 0:00:00
> Loaded 2095 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        =3D "1.33.2"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "ubuntu-16.04"
> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> MACHINE           =3D "c7x0"
> DISTRO            =3D "nodistro"
> DISTRO_VERSION    =3D "nodistro.0"
> TUNE_FEATURES     =3D "arm armv5 thumb dsp"
> TARGET_FPU        =3D "soft"
> meta              =3D "master:c187326afcf1e9d781c1bd0923e1362a6f50f613"
> meta-handheld     =3D "master:f88f5bc546ec18de232a91dc1c8185ad242c45f7"
> meta-oe
> meta-initramfs    =3D "master:225e64d95bc41077782815f3dceb6f2d1a42b167"
>
> Initialising tasks: 100% |#######################################| Time:
> 0:00:08
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: core-image-base-1.0-r0 do_rootfs: The postinstall intercept
> hook 'update_gio_module_cache' failed (exit code: 1)! See log for
> details! (Output: b'')
> WARNING: core-image-base-1.0-r0 do_rootfs: The postinstalls for the
> following packages will be postponed for first boot: libglib-2.0-0
> NOTE: Tasks Summary: Attempted 3440 tasks of which 3427 didn't need to
> be rerun and all succeeded.


Odd, we=E2=80=99ve been running with this applied for ages. Is there anythi=
ng
useful in do_rootfs? I=E2=80=99ll attempt to repro here. Thanks, and sorry =
for the
hassle.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--94eb2c0931d6e8aed6054be49632
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Mar 29, 2017 at 1:33 PM, Andrea Adami <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrea.adami@gmail.com" target=3D"_blank">andrea.adami@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEn=
Zb adM"><div class=3D"h5">On Tue, Mar 28, 2017 at 6:14 PM, Christopher Lars=
on &lt;<a href=3D"mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote=
:<br>
&gt; From: Abdur Rehman &lt;<a href=3D"mailto:abdur_rehman@mentor.com">abdu=
r_rehman@mentor.com</a>&gt;<br>
&gt;<br>
&gt; update_gio_module_cache intercept creates file:<br>
&gt; $D${libdir}/gio/modules/<wbr>giomodule.cache<br>
&gt;<br>
&gt; Change ownership of this file to root:root to avoid user contamination=
<br>
&gt; by host.<br>
&gt;<br>
&gt; Signed-off-by: Abdur Rehman &lt;<a href=3D"mailto:abdur_rehman@mentor.=
com">abdur_rehman@mentor.com</a>&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/postinst-intercepts/<wbr>update_gio_module_cache | 2 ++<=
br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/scripts/postinst-intercepts/<wbr>update_gio_module_cache =
b/scripts/postinst-intercepts/<wbr>update_gio_module_cache<br>
&gt; index fe468092cf..92092f2144 100644<br>
&gt; --- a/scripts/postinst-intercepts/<wbr>update_gio_module_cache<br>
&gt; +++ b/scripts/postinst-intercepts/<wbr>update_gio_module_cache<br>
&gt; @@ -5,3 +5,5 @@ set -e<br>
&gt;=C2=A0 PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D${lib=
dir}:$<wbr>D${base_libdir} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $D${libexecdir}/${binprefix}<wbr>gio=
-querymodules $D${libdir}/gio/modules/<br>
&gt;<br>
&gt; +chown root:root $D${libdir}/gio/modules/<wbr>giomodule.cache<br>
&gt; +<br>
&gt; --<br>
&gt; 2.11.1<br>
&gt;<br>
</div></div>&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
<br>
Hello,<br>
There must be something wrong with this patch.<br>
After fresh pull of an hour ago I git:<br>
<br>
andrea@ThinkPad-T520:/oe/oe-<wbr>core/build$ bitbake core-image-base<br>
Loading c<span class=3D"aBn" tabindex=3D"0"><span class=3D"aQJ">ache: 1</sp=
an></span>00% |#############################<wbr>###############| Time: 0:0=
0:00<br>
Loaded 2095 entries from dependency cache.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.33.2&quot;<br>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;ubuntu-16.04&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-oe-linux-gnueabi&quot;<=
br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;c7x0&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;nodistro&quot;<br=
>
DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;nodistro.0&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv5 thumb dsp&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;soft&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:<wbr>=
c187326afcf1e9d781c1bd0923e136<wbr>2a6f50f613&quot;<br>
meta-handheld=C2=A0 =C2=A0 =C2=A0=3D &quot;master:<wbr>f88f5bc546ec18de232a=
91dc1c8185<wbr>ad242c45f7&quot;<br>
meta-oe<br>
meta-initramfs=C2=A0 =C2=A0 =3D &quot;master:<wbr>225e64d95bc41077782815f3d=
ceb6f<wbr>2d1a42b167&quot;<br>
<br>
Initialis<span class=3D"aBn" tabindex=3D"0"><span class=3D"aQJ">ing tas</sp=
an></span>ks: 100% |#############################<wbr>##########| Time: 0:0=
0:08<br>
NOTE: Executing SetScene Tasks<br>
NOTE: Executing RunQueue Tasks<br>
WARNING: core-image-base-1.0-r0 do_rootfs: The postinstall intercept<br>
hook &#39;update_gio_module_cache&#39; failed (exit code: 1)! See log for<b=
r>
details! (Output: b&#39;&#39;)<br>
WARNING: core-image-base-1.0-r0 do_rootfs: The postinstalls for the<br>
following packages will be postponed for first boot: libglib-2.0-0<br>
NOTE: Tasks Summary: Attempted 3440 tasks of which 3427 didn&#39;t need to<=
br>
be rerun and all succeeded.</blockquote></div><br>Odd, we=E2=80=99ve been r=
unning with this applied for ages. Is there anything useful in do_rootfs? I=
=E2=80=99ll attempt to repro here. Thanks, and sorry for the hassle.<br>-- =
<br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail do=
t com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Eng=
ineer, Mentor Graphics</div></div></div></div>
</div></div>

--94eb2c0931d6e8aed6054be49632--
