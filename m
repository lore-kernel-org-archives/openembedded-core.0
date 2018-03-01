Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 957557822B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 09:38:06 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id l187so7115728ith.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kZ/bTWopnFBgGyBGt4pNyyEyyyuZZsmV3puYeoafJnM=;
	b=UWogfrS0sLy0dNu5I+toJK1r6V6m9RDpO5bmrDXjN42Tmpzn1tw4XyTjOEzzM53GEO
	9MI3X2uQgf1wkNyIKac50knH0ABIsLM/YQGkaLjploibpMC4ORpJwuTa6+fWoy9mSIWo
	nTI5VXv7OGfpt4vIvoJug5SJg3vMOtGUNDcVKKZlrryvKSTncVO/0M0zS5a3eMk3Eo9a
	Hi9MCDVcc3+dUvxvrT6709HNqWJ1DPspdUrPXJcnAW9Ss4MpK2LPQbkhPGNPR9fV6jsc
	Yl4hdboxS6T3Cs5hqL3XeiEpP7gmnXtRWt1OpGzgv9EraNJJM7ZxY/fr6eAkQXJ8611q
	a6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kZ/bTWopnFBgGyBGt4pNyyEyyyuZZsmV3puYeoafJnM=;
	b=Epa/Nj2Wo7AZiBoWrW41NYMRnP80+gfSIiR3+Zr0SpGPcxOSdzI89snF8S8LBMfl4Q
	/RVaYyvlAlCLvcNISObTlOlqoy5455ERAm2Oy2NeAUTBc20akjTv8eDEJs5j67xO9Wkm
	EpK50dptC+hDSfCI01mhZWk7LHkN37jCZE/j9zFJuwe2Bk23Aud0QHWRUrrCSsGlR4zH
	X94Q5MFtXrOWVYSjzNSshS+vJ/gyLYq5HrPvYkL9ZNeShUpB0jjQ0epQRtupHbKcLrTD
	XMQWq4j9vr9Fy4OOuGlVUmLwW8JIwhWqoAp91MVuKMLZMPu5/kCsvJeuq+vrsLVq3nFM
	+PVw==
X-Gm-Message-State: APf1xPD6sxu4F8VfXGGSahA226pfefk3t8fBPcPPgCMzVlo2YpeXYlVI
	dC3CM9ULFiqJkQmH+uqTLI8T/pc6LO7L+iTB5ZsfhQ==
X-Google-Smtp-Source: AG47ELsMvAD4K+ZQRmaFj/uOwK8sEEHfDpJ+gfApxE9Sio/GYK/R+sAcV4sK2etP0+GM40DXCFTQ87U68UrCBrhcFRg=
X-Received: by 10.36.185.24 with SMTP id w24mr1795798ite.127.1519897087755;
	Thu, 01 Mar 2018 01:38:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 1 Mar 2018 01:37:47 -0800 (PST)
In-Reply-To: <20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Mar 2018 09:37:47 +0000
Message-ID: <CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 01 Mar 2018 09:38:06 -0000
Content-Type: multipart/alternative; boundary="f403045d9a500332750566569e12"

--f403045d9a500332750566569e12
Content-Type: text/plain; charset="UTF-8"

Also fails on musl:

ERROR: Nothing RPROVIDES 'glibc-utils' (but
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/meta/recipes-kernel/linux/
kernel-devsrc.bb RDEPENDS on or otherwise requires it)

Ross

On 1 March 2018 at 08:28, Maxin B. John <maxin.john@intel.com> wrote:

> Hi,
>
> On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
> > The existing kernel-devsrc package starts with a full copy of the kernel
> > source and then starts to strip out elements that are not required.
> >
> > This results in extra time (I/O) and extra space being taken up in the
> > final package. The main purpose of the kernel-devsrc package has been to
> > build modules against the running kernel, not to include a full copy of
> > the source code for re-building the kernel. The end result was a
> > 600M kernel-devsrc package.
> >
> > This restructuring of the package uses an approach similar to other
> > distros, where the kernel-devsrc package is for building against the
> > running kernel and uses a curated set of copied infrastructure, versus
> > a mass copy of the entire kernel.
> >
> > The differences in this approach versus other is largely due to the
> > architecture support and the split build/source directory of the
> > kernel.
> >
> > The result is a kernel-devsrc package of about 10M, which is capable
> > of running "make scripts" and compiling kernel modules against the
> > running kernel.
> >
> > Along with the changes to the copying of the infrascture, we also
> > have the following changes:
> >
> >  - a better/more explicit listing of dependencies for on-target
> >    builds of "make scripts" or "make modules_prepare"
> >
> >  - The kernel source is installed into /lib/modules/<version>/build
> >    and a symlink created from /usr/src/kernel to the new location.
> >    This aligns with the standard location for module support
> >    code
> >
> >  - There is also a symlink from /lib/modules/<version>/source -> build
> >    to reserve a spot for a new package that is simply the kernel
> >    source. That package is not part of this update.
> >
> > [YOCTO #12535]
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> >
> >  v2: fix arch/arm devsrc builds
>
> Noticed one kernel-devsrc build failure in autobuilder (qemuarm) :
>
> https://autobuilder.yocto.io/builders/nightly-arm/builds/
> 876/steps/BuildImages/logs/stdio
>
> ERROR: kernel-devsrc-1.0-r0 do_install: Function failed: do_install (log
> file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-arm/build/build/tmp/work/qemuarm-poky-linux-
> gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-arm/build/build/tmp/
> work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/
> temp/log.do_install.25822
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['/home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/binutils/
> binutils-cross_2.30.bb:do_populate_sysroot', 'virtual:native:/home/
> pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
> build/meta/recipes-extended/xz/xz_5.2.3.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-arm/build/meta/recipes-devtools/
> pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/
> pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
> build/meta/recipes-support/lzop/lzop_1.03.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/
> recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/
> recipes-devtools/gcc/gcc-runtime_7.3.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/
> recipes-devtools/gcc/gcc-cross_7.
>  3.bb:do_populate_sysroot', 'virtual:native:/home/
> pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
> build/meta/recipes-devtools/bison/bison_3.0.4.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-arm/build/meta/recipes-devtools/
> pseudo/pseudo_1.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-arm/build/meta/
> recipes-core/glibc/glibc_2.26.bb:do_populate_sysroot',
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/
> recipes-kernel/kmod/kmod-native_git.bb:do_populate_sysroot',
> 'virtual:native:/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-arm/build/meta/recipes-extended/bc/bc_1.06.bb:
> do_populate_sysroot', '/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-arm/build/meta/recipes-devtools/quilt/quilt-native_0.65.bb:
> do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-arm/build/meta/recipes-connectivity/openssl/openssl_
> 1.0.2n.bb:d
>  o_populate_sysroot']
> | NOTE: Installed into sysroot: ['pkgconfig-native', 'lzop-native',
> 'kern-tools-native', 'pseudo-native', 'kmod-native', 'bc-native',
> 'openssl-native', 'gtk-doc-native', 'lzo-native', 'makedepend-native',
> 'cryptodev-linux-native', 'util-macros-native', 'xproto-native']
> | NOTE: Skipping as already exists in sysroot: ['binutils-cross-arm',
> 'xz-native', 'gcc-runtime', 'gcc-cross-arm', 'bison-native', 'glibc',
> 'quilt-native', 'gettext-minimal-native', 'gnu-config-native',
> 'automake-native', 'autoconf-native', 'libtool-native',
> 'linux-libc-headers', 'libgcc', 'zlib-native', 'texinfo-dummy-native',
> 'flex-native', 'libmpc-native', 'gmp-native', 'mpfr-native', 'm4-native']
> | DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-autobuilder/yocto-
> worker/nightly-arm/build/build/tmp/work/qemuarm-poky-
> linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot-native/:g'
> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-arm/build/build/tmp/sysroots-components/x86_64/pkgconfig-native/fixmepath
> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-arm/build/build/tmp/sysroots-components/x86_64/openssl-native/fixmepath
> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-arm/build/build/tmp/sysroots-components/x86_64/gtk-doc-native/fixmepath
> | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:/home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-arm/build/build/tmp/
> work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot:g;
> s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-
> poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot-native:g' -e
> 's:FIXME_COMPONENTS_DIR:/home/pokybuild/yocto-autobuilder/y
>  octo-worker/nightly-arm/build/build/tmp/sysroots-components:g' -e
> 's:FIXME_HOSTTOOLS_DIR:/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-arm/build/build/tmp/hosttools:g' -e
> 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-arm/build/build/tmp/pkgdata/qemuarm:g' -e
> 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-arm/build/build/tmp/
> work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/pseudo/:g' -e
> 's:FIXME_LOGFIFO:/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-
> poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/fifo.25822:g'
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | cp: with --parents, the destination must be a directory
> | Try 'cp --help' for more information.
> | WARNING: /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-arm/build/build/tmp/work/qemuarm-poky-linux-
> gnueabi/kernel-devsrc/1.0-r0/temp/run.do_install.25822:1 exit 1 from 'rm
> -rf $kerneldir/build/include'
> | ERROR: Function failed: do_install (log file is located at
> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-arm/build/build/tmp/work/qemuarm-poky-linux-
> gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)
> NOTE: recipe kernel-devsrc-1.0-r0: task do_install: Failed
> ERROR: Task (/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-arm/build/meta/recipes-kernel/linux/kernel-devsrc.bb:do_install)
> failed with exit code '1'
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045d9a500332750566569e12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Also fails on musl:<div><br>ERROR: Nothing RPROVIDES &#39;=
glibc-utils&#39; (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightl=
y-musl/build/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb">=
kernel-devsrc.bb</a> RDEPENDS on or otherwise requires it)</div><div><br></=
div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 1 March 2018 at 08:28, Maxin B. John <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<div><div class=3D"h5"><br>
On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:<br>
&gt; The existing kernel-devsrc package starts with a full copy of the kern=
el<br>
&gt; source and then starts to strip out elements that are not required.<br=
>
&gt;<br>
&gt; This results in extra time (I/O) and extra space being taken up in the=
<br>
&gt; final package. The main purpose of the kernel-devsrc package has been =
to<br>
&gt; build modules against the running kernel, not to include a full copy o=
f<br>
&gt; the source code for re-building the kernel. The end result was a<br>
&gt; 600M kernel-devsrc package.<br>
&gt;<br>
&gt; This restructuring of the package uses an approach similar to other<br=
>
&gt; distros, where the kernel-devsrc package is for building against the<b=
r>
&gt; running kernel and uses a curated set of copied infrastructure, versus=
<br>
&gt; a mass copy of the entire kernel.<br>
&gt;<br>
&gt; The differences in this approach versus other is largely due to the<br=
>
&gt; architecture support and the split build/source directory of the<br>
&gt; kernel.<br>
&gt;<br>
&gt; The result is a kernel-devsrc package of about 10M, which is capable<b=
r>
&gt; of running &quot;make scripts&quot; and compiling kernel modules again=
st the<br>
&gt; running kernel.<br>
&gt;<br>
&gt; Along with the changes to the copying of the infrascture, we also<br>
&gt; have the following changes:<br>
&gt;<br>
&gt;=C2=A0 - a better/more explicit listing of dependencies for on-target<b=
r>
&gt;=C2=A0 =C2=A0 builds of &quot;make scripts&quot; or &quot;make modules_=
prepare&quot;<br>
&gt;<br>
&gt;=C2=A0 - The kernel source is installed into /lib/modules/&lt;version&g=
t;/build<br>
&gt;=C2=A0 =C2=A0 and a symlink created from /usr/src/kernel to the new loc=
ation.<br>
&gt;=C2=A0 =C2=A0 This aligns with the standard location for module support=
<br>
&gt;=C2=A0 =C2=A0 code<br>
&gt;<br>
&gt;=C2=A0 - There is also a symlink from /lib/modules/&lt;version&gt;/sour=
ce -&gt; build<br>
&gt;=C2=A0 =C2=A0 to reserve a spot for a new package that is simply the ke=
rnel<br>
&gt;=C2=A0 =C2=A0 source. That package is not part of this update.<br>
&gt;<br>
&gt; [YOCTO #12535]<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@win=
driver.com">bruce.ashfield@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt;=C2=A0 v2: fix arch/arm devsrc builds<br>
<br>
</div></div>Noticed one kernel-devsrc build failure in autobuilder (qemuarm=
) :<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-arm/builds/876/ste=
ps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yocto.io/<wbr>builders/nightly-arm/builds/<wbr>876/steps/BuildImag=
es/logs/<wbr>stdio</a><br>
<span class=3D""><br>
ERROR: kernel-devsrc-1.0-r0 do_install: Function failed: do_install (log fi=
le is located at /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>n=
ightly-arm/build/build/tmp/<wbr>work/qemuarm-poky-linux-<wbr>gnueabi/kernel=
-devsrc/1.0-r0/<wbr>temp/log.do_install.25822)<br>
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-<wbr>autobuilder=
/yocto-worker/<wbr>nightly-arm/build/build/tmp/<wbr>work/qemuarm-poky-linux=
-<wbr>gnueabi/kernel-devsrc/1.0-r0/<wbr>temp/log.do_install.25822<br>
Log data follows:<br>
</span>| DEBUG: Executing python function extend_recipe_sysroot<br>
| NOTE: Direct dependencies are [&#39;/home/pokybuild/yocto-<wbr>autobuilde=
r/yocto-worker/<wbr>nightly-arm/build/meta/<wbr>recipes-devtools/binutils/<=
wbr>binutils-cross_2.30.bb:do_<wbr>populate_sysroot&#39;, &#39;virtual:nati=
ve:/home/<wbr>pokybuild/yocto-autobuilder/<wbr>yocto-worker/nightly-arm/<wb=
r>build/meta/recipes-extended/<wbr>xz/xz_5.2.3.bb:do_populate_<wbr>sysroot&=
#39;, &#39;virtual:native:/home/<wbr>pokybuild/yocto-autobuilder/<wbr>yocto=
-worker/nightly-arm/<wbr>build/meta/recipes-devtools/<wbr>pkgconfig/pkgconf=
ig_git.bb:do_<wbr>populate_sysroot&#39;, &#39;virtual:native:/home/<wbr>pok=
ybuild/yocto-autobuilder/<wbr>yocto-worker/nightly-arm/<wbr>build/meta/reci=
pes-support/<wbr>lzop/lzop_1.03.bb:do_populate_<wbr>sysroot&#39;, &#39;/hom=
e/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-arm/build/meta=
/<wbr>recipes-kernel/kern-tools/<wbr>kern-tools-native_git.bb:do_<wbr>popul=
ate_sysroot&#39;, &#39;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/=
<wbr>nightly-arm/build/meta/<wbr>recipes-devtools/gcc/gcc-<wbr>runtime_7.3.=
bb:do_populate_<wbr>sysroot&#39;, &#39;/home/pokybuild/yocto-<wbr>autobuild=
er/yocto-worker/<wbr>nightly-arm/build/meta/<wbr>recipes-devtools/gcc/gcc-<=
wbr>cross_7.<br>
=C2=A03.bb:do_populate_sysroot&#39;, &#39;virtual:native:/home/<wbr>pokybui=
ld/yocto-autobuilder/<wbr>yocto-worker/nightly-arm/<wbr>build/meta/recipes-=
devtools/<wbr>bison/bison_3.0.4.bb:do_<wbr>populate_sysroot&#39;, &#39;virt=
ual:native:/home/<wbr>pokybuild/yocto-autobuilder/<wbr>yocto-worker/nightly=
-arm/<wbr>build/meta/recipes-devtools/<wbr>pseudo/pseudo_1.8.2.bb:do_<wbr>p=
opulate_sysroot&#39;, &#39;/home/pokybuild/yocto-<wbr>autobuilder/yocto-wor=
ker/<wbr>nightly-arm/build/meta/<wbr>recipes-core/glibc/glibc_2.26.<wbr>bb:=
do_populate_sysroot&#39;, &#39;/home/pokybuild/yocto-<wbr>autobuilder/yocto=
-worker/<wbr>nightly-arm/build/meta/<wbr>recipes-kernel/kmod/kmod-<wbr>nati=
ve_git.bb:do_populate_<wbr>sysroot&#39;, &#39;virtual:native:/home/<wbr>pok=
ybuild/yocto-autobuilder/<wbr>yocto-worker/nightly-arm/<wbr>build/meta/reci=
pes-extended/<wbr>bc/bc_1.06.bb:do_populate_<wbr>sysroot&#39;, &#39;/home/p=
okybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-arm/build/meta/<w=
br>recipes-devtools/quilt/quilt-<wbr>native_0.65.bb:do_populate_<wbr>sysroo=
t&#39;, &#39;virtual:native:/home/<wbr>pokybuild/yocto-autobuilder/<wbr>yoc=
to-worker/nightly-arm/<wbr>build/meta/recipes-<wbr>connectivity/openssl/ope=
nssl_<wbr>1.0.2n.bb:d<br>
=C2=A0o_populate_sysroot&#39;]<br>
| NOTE: Installed into sysroot: [&#39;pkgconfig-native&#39;, &#39;lzop-nati=
ve&#39;, &#39;kern-tools-native&#39;, &#39;pseudo-native&#39;, &#39;kmod-na=
tive&#39;, &#39;bc-native&#39;, &#39;openssl-native&#39;, &#39;gtk-doc-nati=
ve&#39;, &#39;lzo-native&#39;, &#39;makedepend-native&#39;, &#39;cryptodev-=
linux-native&#39;, &#39;util-macros-native&#39;, &#39;xproto-native&#39;]<b=
r>
| NOTE: Skipping as already exists in sysroot: [&#39;binutils-cross-arm&#39=
;, &#39;xz-native&#39;, &#39;gcc-runtime&#39;, &#39;gcc-cross-arm&#39;, &#3=
9;bison-native&#39;, &#39;glibc&#39;, &#39;quilt-native&#39;, &#39;gettext-=
minimal-native&#39;, &#39;gnu-config-native&#39;, &#39;automake-native&#39;=
, &#39;autoconf-native&#39;, &#39;libtool-native&#39;, &#39;linux-libc-head=
ers&#39;, &#39;libgcc&#39;, &#39;zlib-native&#39;, &#39;texinfo-dummy-nativ=
e&#39;, &#39;flex-native&#39;, &#39;libmpc-native&#39;, &#39;gmp-native&#39=
;, &#39;mpfr-native&#39;, &#39;m4-native&#39;]<br>
| DEBUG: sed -e &#39;s:^[^/]*/:/home/pokybuild/<wbr>yocto-autobuilder/yocto=
-<wbr>worker/nightly-arm/build/<wbr>build/tmp/work/qemuarm-poky-<wbr>linux-=
gnueabi/kernel-devsrc/1.<wbr>0-r0/recipe-sysroot-native/:g&#39; /home/pokyb=
uild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-arm/build/build/tmp/<=
wbr>sysroots-components/x86_64/<wbr>pkgconfig-native/fixmepath /home/pokybu=
ild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-arm/build/build/tmp/<w=
br>sysroots-components/x86_64/<wbr>openssl-native/fixmepath /home/pokybuild=
/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-arm/build/build/tmp/<wbr>=
sysroots-components/x86_64/<wbr>gtk-doc-native/fixmepath | xargs sed -i -e =
&#39;s:FIXMESTAGINGDIRTARGET:/<wbr>home/pokybuild/yocto-<wbr>autobuilder/yo=
cto-worker/<wbr>nightly-arm/build/build/tmp/<wbr>work/qemuarm-poky-linux-<w=
br>gnueabi/kernel-devsrc/1.0-r0/<wbr>recipe-sysroot:g; s:FIXMESTAGINGDIRHOS=
T:/home/<wbr>pokybuild/yocto-autobuilder/<wbr>yocto-worker/nightly-arm/<wbr=
>build/build/tmp/work/qemuarm-<wbr>poky-linux-gnueabi/kernel-<wbr>devsrc/1.=
0-r0/recipe-sysroot-<wbr>native:g&#39; -e &#39;s:FIXME_COMPONENTS_DIR:/home=
/<wbr>pokybuild/yocto-autobuilder/y<br>
=C2=A0octo-worker/nightly-arm/build/<wbr>build/tmp/sysroots-components:<wbr=
>g&#39; -e &#39;s:FIXME_HOSTTOOLS_DIR:/home/<wbr>pokybuild/yocto-autobuilde=
r/<wbr>yocto-worker/nightly-arm/<wbr>build/build/tmp/hosttools:g&#39; -e &#=
39;s:FIXME_PKGDATA_DIR:/home/<wbr>pokybuild/yocto-autobuilder/<wbr>yocto-wo=
rker/nightly-arm/<wbr>build/build/tmp/pkgdata/<wbr>qemuarm:g&#39; -e &#39;s=
:FIXME_PSEUDO_LOCALSTATEDIR:<wbr>/home/pokybuild/yocto-<wbr>autobuilder/yoc=
to-worker/<wbr>nightly-arm/build/build/tmp/<wbr>work/qemuarm-poky-linux-<wb=
r>gnueabi/kernel-devsrc/1.0-r0/<wbr>pseudo/:g&#39; -e &#39;s:FIXME_LOGFIFO:=
/home/<wbr>pokybuild/yocto-autobuilder/<wbr>yocto-worker/nightly-arm/<wbr>b=
uild/build/tmp/work/qemuarm-<wbr>poky-linux-gnueabi/kernel-<wbr>devsrc/1.0-=
r0/temp/fifo.25822:<wbr>g&#39;<br>
| DEBUG: Python function extend_recipe_sysroot finished<br>
<span class=3D"">| DEBUG: Executing shell function do_install<br>
| cp: with --parents, the destination must be a directory<br>
| Try &#39;cp --help&#39; for more information.<br>
| WARNING: /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly=
-arm/build/build/tmp/<wbr>work/qemuarm-poky-linux-<wbr>gnueabi/kernel-devsr=
c/1.0-r0/<wbr>temp/run.do_install.25822:1 exit 1 from &#39;rm -rf $kerneldi=
r/build/include&#39;<br>
| ERROR: Function failed: do_install (log file is located at /home/pokybuil=
d/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-arm/build/build/tmp/<wbr=
>work/qemuarm-poky-linux-<wbr>gnueabi/kernel-devsrc/1.0-r0/<wbr>temp/log.do=
_install.25822)<br>
</span>NOTE: recipe kernel-devsrc-1.0-r0: task do_install: Failed<br>
ERROR: Task (/home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>night=
ly-arm/build/meta/<wbr>recipes-kernel/linux/kernel-<wbr>devsrc.bb:do_instal=
l) failed with exit code &#39;1&#39;<br>
<br>
Best Regards,<br>
Maxin<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--f403045d9a500332750566569e12--
