Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id D01107F962
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:57:41 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a21so4393988edj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Vo9LyvZtkSO4yPvtGB2HtCQnhHQ4v1hFDurHMs+w3RQ=;
	b=RMPL51jFv5jyIvNcNygpFxpTr2NMP3GgodNA67SeMy3Ma8BJu8MXVBgivBAPSrAtnM
	k+Ltl/tFsRjV0yltelmDAwXZjTJvczWMS1ByLkGZxAe6AGiIXelOfa0FqA7z5cnSC3Qy
	qFMq2Ziy27outXA6CPYAeBG3vMN0mxEU1b7QcdZOr2cSfffPpaAQO7+gkhJMgJ4DTHvX
	TV/eT7vmsc0j4XebuONiL1sUuBc+VngAA+9HjudKLdwJugU9w7Y7of6tpHec/ByB19vn
	CCY0/hz0AJoJQIrUFpPMal80VoIA80QFTbucqSQAgYJnrkgWX3aOcXKhl41kBBB5Nw1C
	xKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vo9LyvZtkSO4yPvtGB2HtCQnhHQ4v1hFDurHMs+w3RQ=;
	b=afA9qVS0tqvksKazNeAC4ZpPL7mpaa8RobW7kCmd4h1oGxCREpN1NHwvvJhXwm81k6
	rQkXHn61VFzwOTqqgmGSuJPVrgoFqWQ/hpgQopbyiDVcXKQ7WeRn4hhisy844hY8jFsh
	EKBVdJhpNXunxZNE6GRUGzb0dFkWcJQqE/B50Pf8ha6Y8DhBBxgLprNdqoXbe7VBEWDk
	VcSR4CoR7uLQb2+KmGt4bgi7WA9ZBpSgTg7bgWc+46Dodw/z/TVbOzp1qYcr70GpZW9o
	TNUBYM1O9BFH7Bd94TlILwcQxQ6JbpVHmvpDs9Ay65ofgItt8Jg7cC9rlBkvfPSeMHQO
	gvPg==
X-Gm-Message-State: APjAAAU+hzIppyXkllow43Su7841UdBbGrNhqzI+QP9BJ+NXWcKr6vri
	SPzhDAByb5oKgEjxbR3WcQeAABS4Em4YOddIaTR687FmHhk=
X-Google-Smtp-Source: APXvYqwOjYSx0qNEGFnqLWGxH+EiYPwhGMoN7D2uUYJumxvJSduHcofDp7nSfIv7fYFrNfoD6I5cazbj8hPITJzAKec=
X-Received: by 2002:a17:906:1f8b:: with SMTP id
	t11mr3170352ejr.191.1572519462320; 
	Thu, 31 Oct 2019 03:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <1572517219-382824-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1572517219-382824-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Oct 2019 06:57:32 -0400
Message-ID: <CADkTA4OvFRd7wCFQRHZAv+BMki9nsX_g5_TuogsHUvSnmDGLxg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dummy: Add package kernel
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
X-List-Received-Date: Thu, 31 Oct 2019 10:57:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 6:20 AM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> Some package like packagegroup-core-boot may ask for package kernel. Let
> linux-dummy rprovide package kernel to fix the following build failure.
>
> ERROR: Nothing RPROVIDES 'kernel' (but
> .../meta/recipes-core/packagegroups/packagegroup-core-boot.bb RDEPENDS on or
> otherwise requires it)

Can you expand on what the higher level use case is that something is
using packagegroup-core-boot (or whatever), but also linux-dummy ?

It seems like this is going to hide misconfigurations .. since you may
want something bootable, but yet are not properly configured.

If there's part of that packagroup you need, why not split it up,
rather than masking the symptom seen here ?

Bruce

>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-dummy.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
> index 62cf6f5ea6..20d7ed815d 100644
> --- a/meta/recipes-kernel/linux/linux-dummy.bb
> +++ b/meta/recipes-kernel/linux/linux-dummy.bb
> @@ -8,19 +8,22 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
>
>  PROVIDES += "virtual/kernel"
> +RPROVIDES_${PN} += "kernel lib32-kernel"
>
>  PACKAGES_DYNAMIC += "^kernel-module-.*"
>  PACKAGES_DYNAMIC += "^kernel-image-.*"
>  PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>
> -PACKAGES += "kernel-modules kernel-vmlinux"
> +PACKAGES += "kernel-modules kernel-vmlinux kernel"
>  FILES_kernel-modules = ""
>  ALLOW_EMPTY_kernel-modules = "1"
>  DESCRIPTION_kernel-modules = "Kernel modules meta package"
>  FILES_kernel-vmlinux = ""
>  ALLOW_EMPTY_kernel-vmlinux = "1"
>  DESCRIPTION_kernel-vmlinux = "Kernel vmlinux meta package"
> -
> +FILES_kernel = ""
> +ALLOW_EMPTY_kernel = "1"
> +DESCRIPTION_kernel = "Kernel meta package"
>
>  INHIBIT_DEFAULT_DEPS = "1"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

