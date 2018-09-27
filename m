Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 884EE79889
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 12:13:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3-v6so2303228wrr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4IguCYRVJ7BP35HFsRlhafj4tPEul8XfbB4i/oAsYdE=;
	b=RFENmQ+PoIIM2ULNtdAvFO8BFJl4ti4WknezdjWzWJfhmiQQqDf306PtSVtjYi4Eln
	jQn5IDMJF6yxiBY1sKD14d+ctZ5B7YITnoV5Vhd5XEbQK15LESvHv+3maTxDjgUcxVFT
	T/ITCVOYeoMJYevtj/UitA24IXdoqetVZ8fP8kDYwKyeLYnegIdJ8Kp0NE6pZas2TA36
	u2DVPEfBWK52WQOtnI/0SxEdSFf/eoJcR4fMhlpJXxALRQ2Q1Q6jH02X4mZdzWhIqGuK
	YQWbaKhyt9MbnyRI5ViEzxbCAFKlmtbWM2QSI54dIwD22eq+wU8mU2xVAuiEpDvCafjb
	+V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4IguCYRVJ7BP35HFsRlhafj4tPEul8XfbB4i/oAsYdE=;
	b=jZBfoMjopGP+T+jd5ZmihJlFetu6l6S33IKxkutQd5hrG38uOGPZZ5Gowo3YwFy3ER
	40o9Ad2AudkXS0T+G6/ULevUhPDbJB1htNIrjtHd1x56E0vCWgnc+dw2TGDBzgjIBgo4
	Crgnwr0ECZOR9ezUvpXVNq0cdOol+ncUGUoCvc4j5DvoLowvTnPHAt/mB/NYkdiJNkug
	pwgnfWZIBHrG98/HVTmD4JIc2zp244ycmiSDYxq3cM0pmRTTooUjwiJ0++jD31i38dxg
	86vqeVn3VTJhnB9T5auFid5SjOZrtgwUa3XwbLQJITKxsMBSdX6wcbVVGb1Z+Cj5zj+w
	2kYA==
X-Gm-Message-State: ABuFfohnm89M3jPYDpQNS7GdyrebDKtrgm2sfjB5XoZAFkru/HVmAkJa
	4Pyk0in3RnmV7Qecym1SJDQ1wpjsLGKQ1leZJcU=
X-Google-Smtp-Source: ACcGV63lsMtR/L0Wz9c+ZvvaQty8BfuPFye7i1pFTqMA63f4Q5YQbj+blwR0tcotTstH+x18+0TslWrt0m7QEYdWFgQ=
X-Received: by 2002:adf:e58e:: with SMTP id
	l14-v6mr416847wrm.321.1538050408025; 
	Thu, 27 Sep 2018 05:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180927091147.12414-1-Martin.Jansa@gmail.com>
	<c092fdb5b89a0ddcf849298b77b27f2abfb4174a.camel@linuxfoundation.org>
In-Reply-To: <c092fdb5b89a0ddcf849298b77b27f2abfb4174a.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Sep 2018 14:13:16 +0200
Message-ID: <CA+chaQfk6SeYy9PRQNcvRLix+LQLm52OG7Tz8jU+wTWL_YrUsQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in the _LINK_NAME variables and change it to hard link
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
X-List-Received-Date: Thu, 27 Sep 2018 12:13:28 -0000
Content-Type: multipart/alternative; boundary="0000000000003793c60576d94463"

--0000000000003793c60576d94463
Content-Type: text/plain; charset="UTF-8"

The reason is that for our builds we set the IMAGE_VERSION_SUFFIX based on
jenkins job number which creates them (or you can
imagine IMAGE_VERSION_SUFFIX being set to something like "release-2.6").

With current metadata we have 2 options:
1) keep IMAGE_VERSION_SUFFIX as is, but don't vardepexclude the build
number (DATETIME in the default value)
But this causes e.g. kernel.do_deploy signature to be changed and whole
do_deploy task re-executed (instead of reused from sstate if it's the same
except the output files names), which in turn causes whole kernel to be
rebuilt in every build, because to run do_deploy we need do_install etc
(and these builds are usually using rm_work and TMPDIR is empty before each
job).

2) leave IMAGE_VERSION_SUFFIX as is, but rename the artifacts after the
build
When the image artifact says "image-release-2.6.img" and kernel image from
the same build says "uImage-release-2.5.bin" (because kernel wasn't
modified at all since previous release), people will be confused.
This is what we were seeing in CI which was usually sending just the image,
but then for some new MACHINEs we needed to send kernel artifact separately
and sometimes the artifact wasn't found with expected name.
Then we changed the build number (aka IMAGE_VERSION_SUFFIX) to be included
in do_deploy signatures which lead to 1) and kernel rebuilds every time

To solve both, we've added webos_deploy_fixup tasks (in many places) which
just adds the hardlinks with expected filenames (so that other systems just
using the artifacts doesn't need to know anything about internal issues
with sstate reuse, nor needing external script to rename things after the
build).

Hardlinks are better than symlinks in this case, because you don't want to
have symlink
image-release-2.5.img -> image.img
still in the deploy directory after you do another build which creates new
image.img and new symlink
image-release-2.6.img -> image.img

If someone downloads image-release-2.5.img "too late" he will get 2.6
version instead.

Hardlinks don't have this issue and yes the need to check the inode numbers
might be confusing to some, but when do you really care where does it
point? In our use-case we always care only about the *"release-2.5"* and
the artifacts without the version string are considered as intermediate
files created by the build or "whatever version was built last in this
build directory", pretty much the same as version-less symlinks in current
build (which are easy to resolve when looking at the filesystem, but
exposing those symlinks for download e.g. over HTTP hides where it points
completely.

I'm not sure I understand your concern about bypassing sstate control, we
still want to reuse kernel.do_deploy and image.do_image_complete. Just with
additional very fast intentionally not-covered-by-sstate task before
do_build to create consistent names.

On Thu, Sep 27, 2018 at 1:15 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hi Martin,
>
> In the commit message you say a lot about what you've changed but not
> so much about why the changes are important and the advantages they
> bring.
>
> There are tradeoffs, for example symlinks make it clear which artefact
> they're really pointing at, hardlinks hide that fact, you need to go
> and look at inode numbers to figure out which of several artefacts one
> might be pointing at. I'm not sure that is an improvement.
>
> I'm also slightly concerned that we need to bypass sstate control, the
> whole intent there was to ensure that output is reproducible and
> consistently restored. Adding in a new task means do_build target usage
> will work but any of the code that has do_deploy as a dependency (e.g.
> an recrdep) will now also need to consider do_deploy_links. For that
> reason alone, I'm not sure we can do this.
>
> Cheers,
>
> Richard
>
> On Thu, 2018-09-27 at 09:11 +0000, Martin Jansa wrote:
> > * just RFC, the part for images isn't finished yet and there is
> >   still some issue with DATETIME when kernel artifacts are used
> >   from sstate, this is just to validate the idea behind
> >   [YOCTO #12937] before finishing the implementation (it's already
> >   finished and used by various LGE builds, but having simpler
> >   way of doing it directly in oe-core mighe be useful for others).
> >
> > * move IMAGE_VERSION_SUFFIX from _NAME variables to _LINK_NAME
> >   that way e.g. kernel.do_deploy can be reused from sstate to
> >   provide "version-less" artifacts and then very fast
> >   do_deploy_links task just adds links with consistent suffixes
> > * create hard links instead of symlinks, so that whatever version
> >   the filename says is really there
> > * some IMAGE_FSTYPES might need the "version-less" IMAGE_NAME file
> >   to be removed first or they might either append or update the
> >   content of the image instead of creating new image file from
> >   scratch - I have seen this only with one proprietary format we
> >   generate with our own tool, so hopefully this isn't very common
> > * this is basically the mechanism are using in webOS with
> >   WEBOS_IMAGE_NAME_SUFFIX which is for official builds set from
> >   jenkins job and then all artifacts (images as well as corresponding
> >   kernel files) have the same version string, the implementation
> >   "from outside" is a bit tricky as shown in webOS OSE, the variable
> >   modifications:
> >   https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e
> > 44a132d01297ff478248/meta-webos/conf/distro/include/webos.inc#L65
> >   and then various bbclasses to hook do_webos_deploy_fixup task
> > creating
> >   the hardlinks for possible artifacts:
> >   https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e
> > 44a132d01297ff478248/meta-webos/classes/webos_deploy.bbclass
> >   https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e
> > 44a132d01297ff478248/meta-webos/classes/kernel.bbclass
> >   https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e
> > 44a132d01297ff478248/meta-webos/classes/image.bbclass
> >   so hopefully with all these changes in oe-core other project can
> >   achieve the same just by setting one variable IMAGE_VERSION_SUFFIX
> >
> > [YOCTO #12937]
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/kernel-artifact-names.bbclass |  4 +--
> >  meta/classes/kernel.bbclass                | 40 ++++++++++++++++--
> > ----
> >  meta/conf/bitbake.conf                     |  4 +--
> >  3 files changed, 33 insertions(+), 15 deletions(-)
> >
> > diff --git a/meta/classes/kernel-artifact-names.bbclass
> > b/meta/classes/kernel-artifact-names.bbclass
> > index bbeecba7bd..84ec193b5a 100644
> > --- a/meta/classes/kernel-artifact-names.bbclass
> > +++ b/meta/classes/kernel-artifact-names.bbclass
> > @@ -1,5 +1,5 @@
> > -KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-
> > ${MACHINE}${IMAGE_VERSION_SUFFIX}"
> > -KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
> > +KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}"
> > +KERNEL_ARTIFACT_LINK_NAME ?=
> > "${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}"
> >
> >  KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
> >  KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
> > diff --git a/meta/classes/kernel.bbclass
> > b/meta/classes/kernel.bbclass
> > index d0fbbd1989..7aaebb56b4 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -667,25 +667,18 @@ kernel_do_deploy() {
> >       fi
> >
> >       for imageType in ${KERNEL_IMAGETYPES} ; do
> > -             base_name=${imageType}-${KERNEL_IMAGE_NAME}
> > -             install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
> > $deployDir/${base_name}.bin
> > -             symlink_name=${imageType}-${KERNEL_IMAGE_LINK_NAME}
> > -             ln -sf ${base_name}.bin
> > $deployDir/${symlink_name}.bin
> > -             ln -sf ${base_name}.bin $deployDir/${imageType}
> > +             install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
> > $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin
> > +             ln -sf ${imageType}-${KERNEL_IMAGE_NAME}.bin
> > $deployDir/${imageType}
> >       done
> >
> >       if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
> > '^CONFIG_MODULES=y$' .config); then
> >               mkdir -p ${D}${root_prefix}/lib
> >               tar -cvzf $deployDir/modules-
> > ${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
> > -             ln -sf modules-${MODULE_TARBALL_NAME}.tgz
> > $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
> >       fi
> >
> >       if [ ! -z "${INITRAMFS_IMAGE}" -a
> > x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> >               for imageType in ${KERNEL_IMAGETYPES} ; do
> > -                     initramfs_base_name=${imageType}-
> > ${INITRAMFS_NAME}
> > -                     initramfs_symlink_name=${imageType}-
> > ${INITRAMFS_LINK_NAME}
> > -                     install -m 0644
> > ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs
> > $deployDir/${initramfs_base_name}.bin
> > -                     ln -sf ${initramfs_base_name}.bin
> > $deployDir/${initramfs_symlink_name}.bin
> > +                     install -m 0644
> > ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${imageType}-
> > ${INITRAMFS_NAME}.bin
> >               done
> >       fi
> >  }
> > @@ -695,7 +688,32 @@ do_deploy[prefuncs] += "package_get_auto_pr"
> >
> >  addtask deploy after do_populate_sysroot do_packagedata
> >
> > -EXPORT_FUNCTIONS do_deploy
> > +kernel_do_deploy_links() {
> > +     deployDir="${DEPLOY_DIR_IMAGE}"
> > +     if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
> > +             deployDir="${DEPLOY_DIR_IMAGE}/${KERNEL_DEPLOYSUBDIR
> > }"
> > +             mkdir "$deployDir"
> > +     fi
> > +
> > +     for imageType in ${KERNEL_IMAGETYPES} ; do
> > +             ln -vf $deployDir/${imageType}-
> > ${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}-
> > ${KERNEL_IMAGE_LINK_NAME}.bin
> > +     done
> > +
> > +     if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
> > '^CONFIG_MODULES=y$' .config); then
> > +             ln -vf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
> > $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
> > +     fi
> > +
> > +     if [ ! -z "${INITRAMFS_IMAGE}" -a
> > "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
> > +             for imageType in ${KERNEL_IMAGETYPES} ; do
> > +                     ln -vf ${imageType}-${INITRAMFS_NAME}.bin
> > ${imageType}-${INITRAMFS_LINK_NAME}.bin
> > +             done
> > +     fi
> > +}
> > +do_deploy_links[prefuncs] += "package_get_auto_pr"
> > +
> > +addtask deploy_links after do_deploy before do_build
> > +
> > +EXPORT_FUNCTIONS do_deploy do_deploy_links
> >
> >  # Add using Device Tree support
> >  inherit kernel-devicetree
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 93aee1ae46..017cb163ba 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -447,8 +447,8 @@ IMAGE_ROOTFS = "${WORKDIR}/rootfs"
> >  IMAGE_BASENAME = "${PN}"
> >  IMAGE_VERSION_SUFFIX = "-${DATETIME}"
> >  IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
> > -IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
> > -IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
> > +IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}"
> > +IMAGE_LINK_NAME = "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"
> >
> >  # This option allows for a percentage overage of the actual image
> > size rather than a
> >  # fixed extra space, this is space needed for initial startup and
> > basic operations.
> > --
> > 2.17.1
> >
>

--0000000000003793c60576d94463
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">The reason is that for our builds we set the IMAGE_VERSION_SUFFIX=
 based on jenkins job number which creates them (or you can imagine=C2=A0IM=
AGE_VERSION_SUFFIX being set to something like &quot;release-2.6&quot;).</d=
iv><div dir=3D"ltr"><br></div><div>With current metadata we have 2 options:=
</div><div>1) keep=C2=A0IMAGE_VERSION_SUFFIX as is, but don&#39;t vardepexc=
lude the build number (DATETIME in the default value)</div><div>But this ca=
uses e.g. kernel.do_deploy signature to be changed and whole do_deploy task=
 re-executed (instead of reused from sstate if it&#39;s the same except the=
 output files names), which in turn causes whole kernel to be rebuilt in ev=
ery build, because to run do_deploy we need do_install etc (and these build=
s are usually using rm_work and TMPDIR is empty before each job).</div><div=
><br></div><div>2) leave IMAGE_VERSION_SUFFIX as is, but rename the artifac=
ts after the build</div><div>When the image artifact says &quot;image-relea=
se-2.6.img&quot; and kernel image from the same build says &quot;uImage-rel=
ease-2.5.bin&quot; (because kernel wasn&#39;t modified at all since previou=
s release), people will be confused.</div><div>This is what we were seeing =
in CI which was usually sending just the image, but then for some new MACHI=
NEs we needed to send kernel artifact separately and sometimes the artifact=
 wasn&#39;t found with expected name.</div><div>Then we changed the build n=
umber (aka=C2=A0IMAGE_VERSION_SUFFIX) to be included in do_deploy signature=
s which lead to 1) and kernel rebuilds every time</div><div><br></div><div>=
To solve both, we&#39;ve added webos_deploy_fixup tasks (in many places) wh=
ich just adds the hardlinks with expected filenames (so that other systems =
just using the artifacts doesn&#39;t need to know anything about internal i=
ssues with sstate reuse, nor needing external script to rename things after=
 the build).</div><div><br></div><div>Hardlinks are better than symlinks in=
 this case, because you don&#39;t want to have symlink</div><div>image-rele=
ase-2.5.img -&gt; image.img</div><div>still in the deploy directory after y=
ou do another build which creates new image.img and new symlink</div><div>i=
mage-release-2.6.img -&gt; image.img</div><div><br></div><div>If someone do=
wnloads image-release-2.5.img &quot;too late&quot; he will get 2.6 version =
instead.</div><div><br></div><div>Hardlinks don&#39;t have this issue and y=
es the need to check the inode numbers might be confusing to some, but when=
 do you really care where does it point? In our use-case we always care onl=
y about the *&quot;release-2.5&quot;* and the artifacts without the version=
 string are considered as intermediate files created by the build or &quot;=
whatever version was built last in this build directory&quot;, pretty much =
the same as version-less symlinks in current build (which are easy to resol=
ve when looking at the filesystem, but exposing those symlinks for download=
 e.g. over HTTP hides where it points completely.</div><div><br></div><div>=
I&#39;m not sure I understand your concern about bypassing sstate control, =
we still want to reuse kernel.do_deploy and image.do_image_complete. Just w=
ith additional very fast intentionally not-covered-by-sstate task before do=
_build to create consistent names.</div></div></div></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">On Thu, Sep 27, 2018 at 1:15 PM Richar=
d Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.=
purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Hi Martin,<br>
<br>
In the commit message you say a lot about what you&#39;ve changed but not<b=
r>
so much about why the changes are important and the advantages they<br>
bring.<br>
<br>
There are tradeoffs, for example symlinks make it clear which artefact<br>
they&#39;re really pointing at, hardlinks hide that fact, you need to go<br=
>
and look at inode numbers to figure out which of several artefacts one<br>
might be pointing at. I&#39;m not sure that is an improvement.<br>
<br>
I&#39;m also slightly concerned that we need to bypass sstate control, the<=
br>
whole intent there was to ensure that output is reproducible and<br>
consistently restored. Adding in a new task means do_build target usage<br>
will work but any of the code that has do_deploy as a dependency (e.g.<br>
an recrdep) will now also need to consider do_deploy_links. For that<br>
reason alone, I&#39;m not sure we can do this.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
On Thu, 2018-09-27 at 09:11 +0000, Martin Jansa wrote:<br>
&gt; * just RFC, the part for images isn&#39;t finished yet and there is<br=
>
&gt;=C2=A0 =C2=A0still some issue with DATETIME when kernel artifacts are u=
sed<br>
&gt;=C2=A0 =C2=A0from sstate, this is just to validate the idea behind<br>
&gt;=C2=A0 =C2=A0[YOCTO #12937] before finishing the implementation (it&#39=
;s already<br>
&gt;=C2=A0 =C2=A0finished and used by various LGE builds, but having simple=
r<br>
&gt;=C2=A0 =C2=A0way of doing it directly in oe-core mighe be useful for ot=
hers).<br>
&gt; <br>
&gt; * move IMAGE_VERSION_SUFFIX from _NAME variables to _LINK_NAME<br>
&gt;=C2=A0 =C2=A0that way e.g. kernel.do_deploy can be reused from sstate t=
o<br>
&gt;=C2=A0 =C2=A0provide &quot;version-less&quot; artifacts and then very f=
ast<br>
&gt;=C2=A0 =C2=A0do_deploy_links task just adds links with consistent suffi=
xes<br>
&gt; * create hard links instead of symlinks, so that whatever version<br>
&gt;=C2=A0 =C2=A0the filename says is really there<br>
&gt; * some IMAGE_FSTYPES might need the &quot;version-less&quot; IMAGE_NAM=
E file<br>
&gt;=C2=A0 =C2=A0to be removed first or they might either append or update =
the<br>
&gt;=C2=A0 =C2=A0content of the image instead of creating new image file fr=
om<br>
&gt;=C2=A0 =C2=A0scratch - I have seen this only with one proprietary forma=
t we<br>
&gt;=C2=A0 =C2=A0generate with our own tool, so hopefully this isn&#39;t ve=
ry common<br>
&gt; * this is basically the mechanism are using in webOS with<br>
&gt;=C2=A0 =C2=A0WEBOS_IMAGE_NAME_SUFFIX which is for official builds set f=
rom<br>
&gt;=C2=A0 =C2=A0jenkins job and then all artifacts (images as well as corr=
esponding<br>
&gt;=C2=A0 =C2=A0kernel files) have the same version string, the implementa=
tion<br>
&gt;=C2=A0 =C2=A0&quot;from outside&quot; is a bit tricky as shown in webOS=
 OSE, the variable<br>
&gt;=C2=A0 =C2=A0modifications:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/webosose/meta-webosose/blob/=
a35e81622aae1066591e" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/webosose/meta-webosose/blob/a35e81622aae1066591e</a><br>
&gt; 44a132d01297ff478248/meta-webos/conf/distro/include/webos.inc#L65<br>
&gt;=C2=A0 =C2=A0and then various bbclasses to hook do_webos_deploy_fixup t=
ask<br>
&gt; creating<br>
&gt;=C2=A0 =C2=A0the hardlinks for possible artifacts:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/webosose/meta-webosose/blob/=
a35e81622aae1066591e" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/webosose/meta-webosose/blob/a35e81622aae1066591e</a><br>
&gt; 44a132d01297ff478248/meta-webos/classes/webos_deploy.bbclass<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/webosose/meta-webosose/blob/=
a35e81622aae1066591e" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/webosose/meta-webosose/blob/a35e81622aae1066591e</a><br>
&gt; 44a132d01297ff478248/meta-webos/classes/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/webosose/meta-webosose/blob/=
a35e81622aae1066591e" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/webosose/meta-webosose/blob/a35e81622aae1066591e</a><br>
&gt; 44a132d01297ff478248/meta-webos/classes/image.bbclass<br>
&gt;=C2=A0 =C2=A0so hopefully with all these changes in oe-core other proje=
ct can<br>
&gt;=C2=A0 =C2=A0achieve the same just by setting one variable IMAGE_VERSIO=
N_SUFFIX<br>
&gt; <br>
&gt; [YOCTO #12937]<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-artifact-names.bbclass |=C2=A0 4 +--<br>
&gt;=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 40 ++++++++++++++++--<br>
&gt; ----<br>
&gt;=C2=A0 meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +--<br>
&gt;=C2=A0 3 files changed, 33 insertions(+), 15 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/kernel-artifact-names.bbclass<br>
&gt; b/meta/classes/kernel-artifact-names.bbclass<br>
&gt; index bbeecba7bd..84ec193b5a 100644<br>
&gt; --- a/meta/classes/kernel-artifact-names.bbclass<br>
&gt; +++ b/meta/classes/kernel-artifact-names.bbclass<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; -KERNEL_ARTIFACT_NAME ?=3D &quot;${PKGE}-${PKGV}-${PKGR}-<br>
&gt; ${MACHINE}${IMAGE_VERSION_SUFFIX}&quot;<br>
&gt; -KERNEL_ARTIFACT_LINK_NAME ?=3D &quot;${MACHINE}&quot;<br>
&gt; +KERNEL_ARTIFACT_NAME ?=3D &quot;${PKGE}-${PKGV}-${PKGR}-${MACHINE}&qu=
ot;<br>
&gt; +KERNEL_ARTIFACT_LINK_NAME ?=3D<br>
&gt; &quot;${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 KERNEL_IMAGE_NAME ?=3D &quot;${KERNEL_ARTIFACT_NAME}&quot;<br>
&gt;=C2=A0 KERNEL_IMAGE_LINK_NAME ?=3D &quot;${KERNEL_ARTIFACT_LINK_NAME}&q=
uot;<br>
&gt; diff --git a/meta/classes/kernel.bbclass<br>
&gt; b/meta/classes/kernel.bbclass<br>
&gt; index d0fbbd1989..7aaebb56b4 100644<br>
&gt; --- a/meta/classes/kernel.bbclass<br>
&gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; @@ -667,25 +667,18 @@ kernel_do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for imageType in ${KERNEL_IMAGETYPES} ; do<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_name=3D${imageTy=
pe}-${KERNEL_IMAGE_NAME}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${KER=
NEL_OUTPUT_DIR}/${imageType}<br>
&gt; $deployDir/${base_name}.bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symlink_name=3D${imag=
eType}-${KERNEL_IMAGE_LINK_NAME}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${base_name}.b=
in<br>
&gt; $deployDir/${symlink_name}.bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${base_name}.b=
in $deployDir/${imageType}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${KER=
NEL_OUTPUT_DIR}/${imageType}<br>
&gt; $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${imageType}-$=
{KERNEL_IMAGE_NAME}.bin<br>
&gt; $deployDir/${imageType}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${MODULE_TARBALL_DEPLOY} =3D &quot;1&qu=
ot; ] &amp;&amp; (grep -q -i -e<br>
&gt; &#39;^CONFIG_MODULES=3Dy$&#39; .config); then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${r=
oot_prefix}/lib<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -cvzf $deplo=
yDir/modules-<br>
&gt; ${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf modules-${MODU=
LE_TARBALL_NAME}.tgz<br>
&gt; $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;${INITRAMFS_IMAGE}&quot; -a<=
br>
&gt; x&quot;${INITRAMFS_IMAGE_BUNDLE}&quot; =3D x1 ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for imageType in=
 ${KERNEL_IMAGETYPES} ; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0initramfs_base_name=3D${imageType}-<br>
&gt; ${INITRAMFS_NAME}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0initramfs_symlink_name=3D${imageType}-<br>
&gt; ${INITRAMFS_LINK_NAME}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0install -m 0644<br>
&gt; ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs<br>
&gt; $deployDir/${initramfs_base_name}.bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ln -sf ${initramfs_base_name}.bin<br>
&gt; $deployDir/${initramfs_symlink_name}.bin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0install -m 0644<br>
&gt; ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${imageType}-<b=
r>
&gt; ${INITRAMFS_NAME}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt; @@ -695,7 +688,32 @@ do_deploy[prefuncs] +=3D &quot;package_get_auto_p=
r&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy after do_populate_sysroot do_packagedata<br>
&gt;=C2=A0 <br>
&gt; -EXPORT_FUNCTIONS do_deploy<br>
&gt; +kernel_do_deploy_links() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0deployDir=3D&quot;${DEPLOY_DIR_IMAGE}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ -n &quot;${KERNEL_DEPLOYSUBDIR}&quot; ]; the=
n<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deployDir=3D&quot;${D=
EPLOY_DIR_IMAGE}/${KERNEL_DEPLOYSUBDIR<br>
&gt; }&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir &quot;$deployDi=
r&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for imageType in ${KERNEL_IMAGETYPES} ; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -vf $deployDir/${i=
mageType}-<br>
&gt; ${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}-<br>
&gt; ${KERNEL_IMAGE_LINK_NAME}.bin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ ${MODULE_TARBALL_DEPLOY} =3D &quot;1&quot; ]=
 &amp;&amp; (grep -q -i -e<br>
&gt; &#39;^CONFIG_MODULES=3Dy$&#39; .config); then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -vf $deployDir/mod=
ules-${MODULE_TARBALL_NAME}.tgz <br>
&gt; $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;${INITRAMFS_IMAGE}&quot; -a<br>
&gt; &quot;${INITRAMFS_IMAGE_BUNDLE}&quot; =3D &quot;1&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for imageType in ${KE=
RNEL_IMAGETYPES} ; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ln -vf ${imageType}-${INITRAMFS_NAME}.bin<br>
&gt; ${imageType}-${INITRAMFS_LINK_NAME}.bin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +}<br>
&gt; +do_deploy_links[prefuncs] +=3D &quot;package_get_auto_pr&quot;<br>
&gt; +<br>
&gt; +addtask deploy_links after do_deploy before do_build<br>
&gt; +<br>
&gt; +EXPORT_FUNCTIONS do_deploy do_deploy_links<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Add using Device Tree support<br>
&gt;=C2=A0 inherit kernel-devicetree<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 93aee1ae46..017cb163ba 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -447,8 +447,8 @@ IMAGE_ROOTFS =3D &quot;${WORKDIR}/rootfs&quot;<br>
&gt;=C2=A0 IMAGE_BASENAME =3D &quot;${PN}&quot;<br>
&gt;=C2=A0 IMAGE_VERSION_SUFFIX =3D &quot;-${DATETIME}&quot;<br>
&gt;=C2=A0 IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D &quot;DATETIME&quot;<b=
r>
&gt; -IMAGE_NAME =3D &quot;${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFF=
IX}&quot;<br>
&gt; -IMAGE_LINK_NAME =3D &quot;${IMAGE_BASENAME}-${MACHINE}&quot;<br>
&gt; +IMAGE_NAME =3D &quot;${IMAGE_BASENAME}-${MACHINE}&quot;<br>
&gt; +IMAGE_LINK_NAME =3D &quot;${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}&quot;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # This option allows for a percentage overage of the actual imag=
e<br>
&gt; size rather than a<br>
&gt;=C2=A0 # fixed extra space, this is space needed for initial startup an=
d<br>
&gt; basic operations.<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div>

--0000000000003793c60576d94463--
