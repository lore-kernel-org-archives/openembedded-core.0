Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD45C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:36:31 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.29976.1644428189547104417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eE/PCSw2;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id b13so6803392edn.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6hGyjKPxc13vX1rPm5EZveqc29kGbdK79j0p5ia5PPU=;
        b=eE/PCSw2uBv0gtQzR1geDvvAjWbgCDfya8JcSRlbkm/J8Gu6avX2BYIYcCpy/6RhHd
         jk/1qmR4RcZ9QVM5ySJaVvgnFjzGDProAHx3SV5ugwGS5BBMjdbsqsen0NSj+opZrgDY
         QicI01dHCPjERGeHjs6s4otOZoO4anNom/9MbK8dyerK8hXCb41M1HV6kI8MJDze0bIC
         wd+656W9XtnCf/o3RUs8HnwaDhnNhHI5kmrZoCBzDPz+9khbespIpxcwf8OmdOzHqBgz
         xERjbGmeIof1OP/FFfpmyHKFBUXcI0eUY+0IaEMbEHH3u4IAiqb/emPDgIKYHl24uxSm
         7rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6hGyjKPxc13vX1rPm5EZveqc29kGbdK79j0p5ia5PPU=;
        b=Zpqg3wvBUIMW+BmRkuCcd8jGYNJ8O0owlXOsTRmYPfmsPkQhTKTsyE2LyJ0ovLSuLk
         TI2pI/KhPiQ+9lz+bgZw+y8AsPtPK4aVZMaVuzjp/Xj9tnqmLfOg6/cM4HIhNN9a0iwN
         hZt2bGmlTgDfjr0BIaHViWShbWCcq2Fah1x6CgL5oJb1/4yDdxCecZ3SVHz+XcjkbxZb
         ja9A7T2rSRbHfqNR50nHxotO0MGgOeMEGQioISVhsvAgRJd+zwO9cO8Ln5Nf8cHhUKmW
         95oB+fAbkB+YEYfqXf7b/33C4hmlIMYjdnTyP9wgB7vZFcc2lvINjFeXpyw3PtJjNZsU
         sbFg==
X-Gm-Message-State: AOAM530jYyfqXIrRQcz7luFuR5XBQC7PtxURno341uUbXHbHyOpeaJso
	m3CsEnnICK0lUVLiAulEIlQ8ZKYYMQ7fiXXBMEU=
X-Google-Smtp-Source: 
 ABdhPJyX5rl7fdCpT9l0as7sPUW3UMNdVwoZIAiKR8s6cfJewTAqLQhdehCcdpRPzs062y2Yg+nzWmpJKFl0vYZFb3c=
X-Received: by 2002:a05:6402:278c:: with SMTP id
 b12mr3725407ede.103.1644428187537;
 Wed, 09 Feb 2022 09:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20220209173036.3823144-1-ross.burton@arm.com>
 <20220209173036.3823144-2-ross.burton@arm.com>
In-Reply-To: <20220209173036.3823144-2-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 Feb 2022 12:36:16 -0500
Message-ID: 
 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kernel-module-split: modules should recommend the
 kernel image
To: Ross Burton <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:36:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161577

On Wed, Feb 9, 2022 at 12:30 PM Ross Burton <ross.burton@arm.com> wrote:
>
> Currently each split-out kernel module RDEPENDS on the top-level kernel
> package (e.g. kernel-5.15-yocto-standard). Whilst at first this seems
> correct, as modules obviously need their matching kernel, there are many
> situations where the kernel is provided out-of-band and forcing the
> kernel in via RDEPENDS in the wrong thing to do, for example an
> initramfs really shouldn't contain a kernel image, but can contain
> kernel modules.
>
> Change the module splitting logic to use RRECOMMENDS instead of
> RDEPENDS, and tighten the dependency to kernel-image instead of kernel
> to pull in just the image, which also means PACKAGE_EXCLUDE =3D
> "kernel-image-*" is sufficient to ensure the image doesn't get pulled
> into an image.
>

As much as I hate to suggest it, I think the strength of the image
dependency needs to be configurable. I know of situations were
rrecommends are disabled AND they use quite a few out of tree
modules. While I can't say that they are counting on RDEPENDS
heavily in this situation, I also can't rule it out .. so this is a breakin=
g
change in behaviour for those configurations.

That being said, if RP doesn't want/like a conditional at this particular
spot, I can understand that as well .. and am happy to be ignored
in that case :)

Bruce

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/kernel-module-split.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index a29c294810e..4429fee4b51 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -175,7 +175,7 @@ python split_kernel_module_packages () {
>      module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>      module_pattern =3D module_pattern_prefix + kernel_package_name + '-m=
odule-%s' + module_pattern_suffix
>
> -    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_name,=
 kernel_version))
> +    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_recommends=3D'%s-image-%s' % (kernel_pack=
age_name, kernel_version))
>      if modules:
>          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
>
> --
> 2.25.1
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

