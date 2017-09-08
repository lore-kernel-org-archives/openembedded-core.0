Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 399086E672
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 20:06:17 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f199so10519581wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 13:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0QKfJabdej3IspLGflJ1xpkIk4XnWxJRXBNmTwFvehA=;
	b=KxS1RhtvhoYoCS7I/8seIWL3QcanEWao+7FwiUtAa2k1S+zT0Odi8sl1LLnSsrhwrT
	sazNocl72l2I7ehuJvJRSmjg4Lh6eKx+xGFld+zVQrLTwlYsoXBvvkp5fbl1MaraQbdB
	Sq3CtLHVH0WhJ7wWE4nVxstCYJdY1IHOVwx+vhs60nUgMtegCWkZfLfZttpT4oZ6GaaZ
	fBBFchlVWngIn9HRVVEXJL4a/Rs4L8AYN4Z1rvJJC5+WqokYTG5YDUfMY2l5sjkDUggS
	XSiUCfLOW+1d4V5qS5jtEtnRgVsxH4zPVSnihg59wP7vzPfu3ShXLI0zQuqw5bBvRsL1
	CM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0QKfJabdej3IspLGflJ1xpkIk4XnWxJRXBNmTwFvehA=;
	b=ZNL4a+AO7BL3rbw/X8VRMLgQbVKIo/J96jQ3BPEcB929gyV4UnymKc6VgPhvgRTHl6
	5yycvG33FLksLA/RdcxxBRoIyeWtyzqheL20O2B8srkqDOvMh4IFL/r0mILlct/76Ht+
	FDHxsfnNjqEN+Q8/RsfKwnhFVWglOmbAjQcV1Xrtuh7ZhdVzojwJzpcdL5q6ATRM6kBe
	9jFLseSSfb74y8csdx3ZX/O/2tw5FhYQIxI0lz6w0GZn9crSvdUKj+RZ0tscCk+SF4mI
	OCCwd1sbnT7h+Z6cUUnXfEdEcPkp6H0HPmqCOKid7iPqgjtRHpwcjxGWreO+f2aXK/e7
	xP3g==
X-Gm-Message-State: AHPjjUhiDbqd+kAOmFkDBRUsc6orqHfqsWx5S7z0FJhmjWoGO3yhEzv+
	pjKB+s0hUNOn731JHpg2c3goMsgaJ6Cx
X-Google-Smtp-Source: ADKCNb7ObJfFmndN773W0ARVlBGur6XsTngBwRiFP3dyh4lyFsckqvbYclIi+zWVAn+fsBzyaGE4rqTS61AGrbbfrcY=
X-Received: by 10.28.29.129 with SMTP id d123mr2456608wmd.130.1504901178087;
	Fri, 08 Sep 2017 13:06:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.155.157 with HTTP; Fri, 8 Sep 2017 13:06:17 -0700 (PDT)
In-Reply-To: <20170821092134.6329-1-mnhu@prevas.dk>
References: <20170821083946.4493-1-mnhu@prevas.dk>
	<20170821092134.6329-1-mnhu@prevas.dk>
From: Paul Barker <pbarker@toganlabs.com>
Date: Fri, 8 Sep 2017 21:06:17 +0100
Message-ID: <CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mnhu@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-module-split: rrecommend kernel-image instead of rdepend
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
X-List-Received-Date: Fri, 08 Sep 2017 20:06:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2017 at 10:21 AM, Martin Hundeb=C3=B8ll <mnhu@prevas.dk> wr=
ote:
> Hard depending on the kernel makes it impossible to install kernel
> modules without getting the kernel image installed too. This is
> inconvenient in e.g. initramdisks, where the kernel is loaded from
> outside the initramdisk.
>
> Making the kernel modules rrecommend kernel-image-<version> instead of
> rdepending on it, makes it possible to install kernel modules without
> the kernel image by setting "kernel-image" in BAD_RECOMMENDATIONS.
>
> Signed-off-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
> ---
>  meta/classes/kernel-module-split.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index 1035525dac..78843c5474 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -120,6 +120,11 @@ python split_kernel_module_packages () {
>                  rdepends[dep] =3D []
>          d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commase=
p=3DFalse))
>
> +        # let kernel modules runtime recommend kernel image
> +        rrecommends =3D bb.utils.explode_dep_versions2(d.getVar('RRECOMM=
ENDS_' + pkg) or "")
> +        rrecommends['kernel-image'] =3D []
> +        d.setVar('RRECOMMENDS_' + pkg, bb.utils.join_deps(rrecommends, c=
ommasep=3DFalse))
> +
>          # Avoid automatic -dev recommendations for modules ending with -=
dev.
>          d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
>
> @@ -138,7 +143,7 @@ python split_kernel_module_packages () {
>      postinst =3D d.getVar('pkg_postinst_modules')
>      postrm =3D d.getVar('pkg_postrm_modules')
>
> -    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_depends=3D'kernel-%s' % (d.getVar("KERNEL=
_VERSION")))
> +    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_depends=3D'')
>      if modules:
>          metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
>          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> --
> 2.14.1
>

This breaks the method described in the kernel dev FAQ to omit the
kernel image from the rootfs which is to set the following in a conf
file:

    RDEPENDS_kernel-base =3D ""

See http://www.yoctoproject.org/docs/2.3.1/kernel-dev/kernel-dev.html#idm45=
690538384880.

By recommending kernel-image directly instead of recommending the
top-level kernel-<version> package which was actually removed from
extra_depends, we skip the inclusion of the kernel-base package. I'm
not familiar enough with the details of kernel module loading to know
if the 2 files in kernel-base (modules.builtin and modules.order) are
strictly needed but I think they should at least be included in via
recommendation.

As we already have a documented way to omit the kernel image, can we
revert this?

As an alternative I can send in a patch which changes the recommend to
the top-level kernel-<version> package instead of kernel-image.

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

