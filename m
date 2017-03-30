Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA8377B41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:54:36 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id 3so6067082ybc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I7K/43Y09TxlWtJRW2juYM5oseyRQgnYbL9NtLepYws=;
	b=ob2hkaK/CvBj4orlVfEgfpbS0Nw64DxhXG8PcP07scYUQzzbM1u69FQGwel9n4N5+y
	lXBZCbGoDMi/KLQRIOeD5KIAbZ9T3LwAi3Uc6SlthnZ/+xV43KTgVkPzOcPK6EoLG8d5
	OXww6iJSsBPgqBKY7FoYRvMsKBlQMwp6B5yoSmgAcDzTnb8z3mLyVLLrjo0Cx3EaO9CI
	PV0Q5KwCtGsb1YxmGaUESUd7siamKOo/Pzj0hAYWc9Sm298+yDvGA6XBjkuSXjlCvNqE
	0NZ0WUAeiqUu+yMEB4i6vBbBdJecODlfXETDPKMbAi6nq4M14u4gPHzPeGsveaS1b4qQ
	LJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I7K/43Y09TxlWtJRW2juYM5oseyRQgnYbL9NtLepYws=;
	b=G0nJnRXIJi0Rpwx54K0DixmC2SfmQtChcmPNTuVSp+nu7108QESVXcoH56XzMU+rh2
	FCEQ+s8bXpjGgBo88yf6qL8JfF4D63jFB7Mr5X8TO8tnbRpw1imF06bkmn7mx4TuJ3lh
	jRBSmRnCBMbHqzU/qAAHsWE9Nhm1LI8eVF2C+KwR7zyqY3Gz3fzHm1675UOah/MUJ7yV
	6HhKy7MII4A4B5IeajXJJeMEo9Ugf5/f8Y5i0k14BMW4VlvEfBaYvLCIpJNWVhc4xqK3
	liLaeVv7pifHWRkzRKXUsovC7YhEFqlMd5u743+tYMnBlPQRqMafMBGy2+a3eh8qX/Aj
	oytA==
X-Gm-Message-State: AFeK/H1ctVIQlnH+fNdVLmP73DNf0wUF7Zn5DeIpMQFj45chtb835b5zYve/Kxx+J4aiWRW/GKJ9gMA3dAP12cWW
X-Received: by 10.37.170.36 with SMTP id s33mr5875025ybi.189.1490864078183;
	Thu, 30 Mar 2017 01:54:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Thu, 30 Mar 2017 01:54:07 -0700 (PDT)
In-Reply-To: <CAAQYJAsVvf+=jvrX0NEnypsEZDJkfFzZVbbri+-DW82o6oeSxw@mail.gmail.com>
References: <cover.1490717618.git.chris_larson@mentor.com>
	<f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
	<CAAQYJAvnEY2=jHs6dkjk0aSR74s6+4xYLEQMsp4yVXjngsWQ4g@mail.gmail.com>
	<CABcZAN=vQzdwxd6F=nGBq0TWhOjx8kw0_MZfPpN82V=pbntF5g@mail.gmail.com>
	<CAAQYJAsVvf+=jvrX0NEnypsEZDJkfFzZVbbri+-DW82o6oeSxw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 30 Mar 2017 11:54:07 +0300
Message-ID: <CAHiDW_FWJtRLWNPSwgxM+MsVOHTjLJjzM4xvnQ3yrbm9FnXrTA@mail.gmail.com>
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
X-List-Received-Date: Thu, 30 Mar 2017 08:54:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c000ceac9eca9054beed797

--94eb2c000ceac9eca9054beed797
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30 March 2017 at 00:08, Andrea Adami <andrea.adami@gmail.com> wrote:

> On Wed, Mar 29, 2017 at 10:40 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
> >
> > On Wed, Mar 29, 2017 at 1:33 PM, Andrea Adami <andrea.adami@gmail.com>
> > wrote:
> >>
> >> On Tue, Mar 28, 2017 at 6:14 PM, Christopher Larson <kergoth@gmail.com=
>
> >> wrote:
> >> > From: Abdur Rehman <abdur_rehman@mentor.com>
> >> >
> >> > update_gio_module_cache intercept creates file:
> >> > $D${libdir}/gio/modules/giomodule.cache
> >> >
> >> > Change ownership of this file to root:root to avoid user contaminati=
on
> >> > by host.
> >> >
> >> > Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
> >> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >> > ---
> >> >  scripts/postinst-intercepts/update_gio_module_cache | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/scripts/postinst-intercepts/update_gio_module_cache
> >> > b/scripts/postinst-intercepts/update_gio_module_cache
> >> > index fe468092cf..92092f2144 100644
> >> > --- a/scripts/postinst-intercepts/update_gio_module_cache
> >> > +++ b/scripts/postinst-intercepts/update_gio_module_cache
> >> > @@ -5,3 +5,5 @@ set -e
> >> >  PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E
> >> > LD_LIBRARY_PATH=3D$D${libdir}:$D${base_libdir} \
> >> >          $D${libexecdir}/${binprefix}gio-querymodules
> >> > $D${libdir}/gio/modules/
> >> >
> >> > +chown root:root $D${libdir}/gio/modules/giomodule.cache
> >> > +
> >> > --
> >> > 2.11.1
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >>
> >> Hello,
> >> There must be something wrong with this patch.
> >> After fresh pull of an hour ago I git:
> >>
> >> andrea@ThinkPad-T520:/oe/oe-core/build$ bitbake core-image-base
> >> Loading cache: 100% |############################################|
> Time:
> >> 0:00:00
> >> Loaded 2095 entries from dependency cache.
> >> NOTE: Resolving any missing task queue dependencies
> >>
> >> Build Configuration:
> >> BB_VERSION        =3D "1.33.2"
> >> BUILD_SYS         =3D "x86_64-linux"
> >> NATIVELSBSTRING   =3D "ubuntu-16.04"
> >> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> >> MACHINE           =3D "c7x0"
> >> DISTRO            =3D "nodistro"
> >> DISTRO_VERSION    =3D "nodistro.0"
> >> TUNE_FEATURES     =3D "arm armv5 thumb dsp"
> >> TARGET_FPU        =3D "soft"
> >> meta              =3D "master:c187326afcf1e9d781c1bd0923e1362a6f50f613=
"
> >> meta-handheld     =3D "master:f88f5bc546ec18de232a91dc1c8185ad242c45f7=
"
> >> meta-oe
> >> meta-initramfs    =3D "master:225e64d95bc41077782815f3dceb6f2d1a42b167=
"
> >>
> >> Initialising tasks: 100% |#######################################|
> Time:
> >> 0:00:08
> >> NOTE: Executing SetScene Tasks
> >> NOTE: Executing RunQueue Tasks
> >> WARNING: core-image-base-1.0-r0 do_rootfs: The postinstall intercept
> >> hook 'update_gio_module_cache' failed (exit code: 1)! See log for
> >> details! (Output: b'')
> >> WARNING: core-image-base-1.0-r0 do_rootfs: The postinstalls for the
> >> following packages will be postponed for first boot: libglib-2.0-0
> >> NOTE: Tasks Summary: Attempted 3440 tasks of which 3427 didn't need to
> >> be rerun and all succeeded.
> >
> >
> > Odd, we=E2=80=99ve been running with this applied for ages. Is there an=
ything
> useful
> > in do_rootfs? I=E2=80=99ll attempt to repro here. Thanks, and sorry for=
 the
> hassle.
> > --
>
> There is just a laconical message:
>
> NOTE: Running intercept scripts:
> NOTE: > Executing update_gio_module_cache intercept ...
> chown: cannot access
> '/tmp/build/tmp-glibc/work/c7x0-oe-linux-gnueabi/core-
> image-base/1.0-r0/rootfs/usr/lib/gio/modules/giomodule.cache':
> No such file or directory
>
> Here the permissions:
> andrea@ThinkPad-T520:/tmp/build/tmp-glibc/work/c7x0-oe-
> linux-gnueabi/core-image-base/1.0-r0/rootfs/usr/lib/gio$
> ls -al
> total 0
> drwxr-xr-x 3 andrea andrea   60 mar 29 21:33 .
> drwxr-xr-x 6 andrea andrea 1660 mar 29 22:51 ..
> drwxr-xr-x 2 andrea andrea   40 mar 29 21:33 modules
>

Can you check if usr/lib/gio/modules/giomodule.cache really exists or not?
And if it does not, what the gio-querymodules call looks like in
temp/run.do_rootfs?

Jussi

--94eb2c000ceac9eca9054beed797
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 30 March 2017 at 00:08, Andrea Adami <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrea.adami@gmail.com" target=3D"_blank">andrea.adami@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEn=
Zb"><div class=3D"h5">On Wed, Mar 29, 2017 at 10:40 PM, Christopher Larson =
&lt;<a href=3D"mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; On Wed, Mar 29, 2017 at 1:33 PM, Andrea Adami &lt;<a href=3D"mailto:an=
drea.adami@gmail.com">andrea.adami@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Mar 28, 2017 at 6:14 PM, Christopher Larson &lt;<a href=3D=
"mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; From: Abdur Rehman &lt;<a href=3D"mailto:abdur_rehman@mentor.=
com">abdur_rehman@mentor.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; update_gio_module_cache intercept creates file:<br>
&gt;&gt; &gt; $D${libdir}/gio/modules/<wbr>giomodule.cache<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change ownership of this file to root:root to avoid user cont=
amination<br>
&gt;&gt; &gt; by host.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Abdur Rehman &lt;<a href=3D"mailto:abdur_rehma=
n@mentor.com">abdur_rehman@mentor.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris=
_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 scripts/postinst-intercepts/<wbr>update_gio_module_cach=
e | 2 ++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/scripts/postinst-intercepts/<wbr>update_gio_modu=
le_cache<br>
&gt;&gt; &gt; b/scripts/postinst-intercepts/<wbr>update_gio_module_cache<br=
>
&gt;&gt; &gt; index fe468092cf..92092f2144 100644<br>
&gt;&gt; &gt; --- a/scripts/postinst-intercepts/<wbr>update_gio_module_cach=
e<br>
&gt;&gt; &gt; +++ b/scripts/postinst-intercepts/<wbr>update_gio_module_cach=
e<br>
&gt;&gt; &gt; @@ -5,3 +5,5 @@ set -e<br>
&gt;&gt; &gt;=C2=A0 PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E<br>
&gt;&gt; &gt; LD_LIBRARY_PATH=3D$D${libdir}:$<wbr>D${base_libdir} \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $D${libexecdir}/${binprefix=
}<wbr>gio-querymodules<br>
&gt;&gt; &gt; $D${libdir}/gio/modules/<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +chown root:root $D${libdir}/gio/modules/<wbr>giomodule.cache=
<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.11.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt; There must be something wrong with this patch.<br>
&gt;&gt; After fresh pull of an hour ago I git:<br>
&gt;&gt;<br>
&gt;&gt; andrea@ThinkPad-T520:/oe/oe-<wbr>core/build$ bitbake core-image-ba=
se<br>
&gt;&gt; Loading cache: 100% |#############################<wbr>###########=
####| Time:<br>
&gt;&gt; 0:00:00<br>
&gt;&gt; Loaded 2095 entries from dependency cache.<br>
&gt;&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;&gt;<br>
&gt;&gt; Build Configuration:<br>
&gt;&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.33.2&quot;<br>
&gt;&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&=
quot;<br>
&gt;&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;ubuntu-16.04&quot;<br>
&gt;&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-oe-linux-gnuea=
bi&quot;<br>
&gt;&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;c7x0&quo=
t;<br>
&gt;&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;nodistro=
&quot;<br>
&gt;&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;nodistro.0&quot;<br>
&gt;&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv5 thumb dsp&quo=
t;<br>
&gt;&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;soft&quot;<br>
&gt;&gt; meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;mas=
ter:<wbr>c187326afcf1e9d781c1bd0923e136<wbr>2a6f50f613&quot;<br>
&gt;&gt; meta-handheld=C2=A0 =C2=A0 =C2=A0=3D &quot;master:<wbr>f88f5bc546e=
c18de232a91dc1c8185<wbr>ad242c45f7&quot;<br>
&gt;&gt; meta-oe<br>
&gt;&gt; meta-initramfs=C2=A0 =C2=A0 =3D &quot;master:<wbr>225e64d95bc41077=
782815f3dceb6f<wbr>2d1a42b167&quot;<br>
&gt;&gt;<br>
&gt;&gt; Initialising tasks: 100% |#############################<wbr>######=
####| Time:<br>
&gt;&gt; 0:00:08<br>
&gt;&gt; NOTE: Executing SetScene Tasks<br>
&gt;&gt; NOTE: Executing RunQueue Tasks<br>
&gt;&gt; WARNING: core-image-base-1.0-r0 do_rootfs: The postinstall interce=
pt<br>
&gt;&gt; hook &#39;update_gio_module_cache&#39; failed (exit code: 1)! See =
log for<br>
&gt;&gt; details! (Output: b&#39;&#39;)<br>
&gt;&gt; WARNING: core-image-base-1.0-r0 do_rootfs: The postinstalls for th=
e<br>
&gt;&gt; following packages will be postponed for first boot: libglib-2.0-0=
<br>
&gt;&gt; NOTE: Tasks Summary: Attempted 3440 tasks of which 3427 didn&#39;t=
 need to<br>
&gt;&gt; be rerun and all succeeded.<br>
&gt;<br>
&gt;<br>
&gt; Odd, we=E2=80=99ve been running with this applied for ages. Is there a=
nything useful<br>
&gt; in do_rootfs? I=E2=80=99ll attempt to repro here. Thanks, and sorry fo=
r the hassle.<br>
&gt; --<br>
<br>
</div></div>There is just a laconical message:<br>
<br>
NOTE: Running intercept scripts:<br>
NOTE: &gt; Executing update_gio_module_cache intercept ...<br>
chown: cannot access<br>
&#39;/tmp/build/tmp-glibc/work/<wbr>c7x0-oe-linux-gnueabi/core-<wbr>image-b=
ase/1.0-r0/rootfs/usr/<wbr>lib/gio/modules/giomodule.<wbr>cache&#39;:<br>
No such file or directory<br>
<br>
Here the permissions:<br>
andrea@ThinkPad-T520:/tmp/<wbr>build/tmp-glibc/work/c7x0-oe-<wbr>linux-gnue=
abi/core-image-base/<wbr>1.0-r0/rootfs/usr/lib/gio$<br>
ls -al<br>
total 0<br>
drwxr-xr-x 3 andrea andrea=C2=A0 =C2=A060 mar 29 21:33 .<br>
drwxr-xr-x 6 andrea andrea 1660 mar 29 22:51 ..<br>
drwxr-xr-x 2 andrea andrea=C2=A0 =C2=A040 mar 29 21:33 modules<br></blockqu=
ote><div><br></div><div>Can you check if usr/lib/gio/modules/giomodule.cach=
e really exists or not? And if it does not, what the gio-querymodules call =
looks like in temp/run.do_rootfs?<br></div><div><br></div><div>Jussi</div><=
/div></div></div>

--94eb2c000ceac9eca9054beed797--
