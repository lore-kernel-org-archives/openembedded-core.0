Return-Path: <pbarker@toganlabs.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id A851B71A91
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:37:13 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id a43so12964969wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JF+09429TTXWvoeEwLA/KwCqJm6Aqd/HzmipwsI7pxY=;
	b=WTA25XYsBmkwEL5fG/tyM9zgThcura2nBPO7ltuUI7D9Nv5ZC4fNmS1R0cNGMtpPB5
	unlmxZBicG+ogOCNDIK/rzKjcpZH0IQXoZuYRpxBlfUZWQqBcP0kB0WHIYQDHTSbkH5m
	Tz95TGv6r544SghTkCsOJkYwXUJe6AmXxSQMr5ZMCALpsklz58y3CvIi8VgKvn7hWDyZ
	+5HF8IKM0fChBqYscQVHokYdKmOWflnxlaAo69LuooWrbuAiFxY/E8xz5MIickDvt+lV
	4JnAphKchmHA3OQDCD+bfcVBNfpv+Gwi6nbercyFwNpXKS39Y5jzNdYVF424ydnR654u
	nUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JF+09429TTXWvoeEwLA/KwCqJm6Aqd/HzmipwsI7pxY=;
	b=t0MgKk57mqKECjFeHTGN38wB/kJ+d6/uaAQQV2Ea+pQAtn5HUQ+zSO/lzLZlDjsZKD
	7jmXMkQmVSHekCZ5F+UE/ChhxZGrua15YOrWF4HLtloaDtSZinKDSnrcGzo/HuAaqRBX
	HtOlMNkD+vm3/O7YQE+YokSfiqCSkV/pQjfbSSe+BpRSwPu5W4wmfO+Z4Yr3hk5JIqyD
	2LOtZfkdTfb9qsC7ef8GX61O4qepGlTmcJOTD+mD+SIQV84YWSmWUoUp22Cif3HVKnTo
	G8SN1SIvEtbHEi63f6BAXVfPWWxM078noBg4bc08+oXwOQwyrqdwpIoGqrHm9QGVdO6w
	6ZzA==
X-Gm-Message-State: AHPjjUit0/LkLeWbUjelbCEq+0tv6Eqyr8iWgtZA6AZB3x48eqVL1fX2
	Jw/cJ2oh4TF345sVTf3lKrG0ZpST6cIv
X-Google-Smtp-Source: ADKCNb6QQG3i7s3yWpfYaQcQ8zq15R0GkZeWTcpKV85JBxwuxTAjBilz5FepD9kOKKVECPxYuUGC84lCBfJ0hB6awrc=
X-Received: by 10.223.136.43 with SMTP id d40mr7583814wrd.121.1505119034479;
	Mon, 11 Sep 2017 01:37:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.155.157 with HTTP; Mon, 11 Sep 2017 01:37:13 -0700 (PDT)
In-Reply-To: <20170911072328.8449-1-mnhu@prevas.dk>
References: <20170911072328.8449-1-mnhu@prevas.dk>
From: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 11 Sep 2017 09:37:13 +0100
Message-ID: <CAPyrkgydBLXaSn5jjMajy_PO4gs=5GbDzYRypbBiPCdN833yYQ@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mnhu@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "kernel-module-split: rrecommend kernel-image instead of rdepend"
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
X-List-Received-Date: Mon, 11 Sep 2017 08:37:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2017 at 8:23 AM, Martin Hundeb=C3=B8ll <mnhu@prevas.dk> wro=
te:
> This reverts commit e0ed52c51464855e9a6a37ea49df7efde7e91076.
>
> Commit e0ed52c514 ('kernel-module-split: rrecommend kernel-image instead
> of rdepend') changed kernel modules to rrecommend kernel-image instead
> of rdepend on kernel. This broke existing setups, where the kernel is
> omitted by setting RDEPEND_kernel-base =3D "".
>
> Revert the patch, as the existing way of omitting kernel-image in images
> works just fine.

This is missing a Signed-off-by tag.

> ---
>  meta/classes/kernel-module-split.bbclass | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index 78843c5474..1035525dac 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -120,11 +120,6 @@ python split_kernel_module_packages () {
>                  rdepends[dep] =3D []
>          d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commase=
p=3DFalse))
>
> -        # let kernel modules runtime recommend kernel image
> -        rrecommends =3D bb.utils.explode_dep_versions2(d.getVar('RRECOMM=
ENDS_' + pkg) or "")
> -        rrecommends['kernel-image'] =3D []
> -        d.setVar('RRECOMMENDS_' + pkg, bb.utils.join_deps(rrecommends, c=
ommasep=3DFalse))
> -
>          # Avoid automatic -dev recommendations for modules ending with -=
dev.
>          d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
>
> @@ -143,7 +138,7 @@ python split_kernel_module_packages () {
>      postinst =3D d.getVar('pkg_postinst_modules')
>      postrm =3D d.getVar('pkg_postrm_modules')
>
> -    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_depends=3D'')
> +    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_depends=3D'kernel-%s' % (d.getVar("KERNEL=
_VERSION")))
>      if modules:
>          metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
>          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> --
> 2.14.1
>

Change looks good.

Thanks,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

