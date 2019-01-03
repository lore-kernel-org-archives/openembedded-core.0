Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id CEA7979D4B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 22:46:31 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id o125so20601273qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 14:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HWcJnOsjE8XFd0GN8nhnFTesLSNeRp3dGW+itD57yQA=;
	b=bxGLrkqeq4FFlviomLKgneD9Dy9JIHll/SRzPk8ZZZ4uGTh9tgbLOfAJ/zj7Sqw/R1
	qU8cCwb4jXGiJ58vxGT0PVZUHQkl7gksz5QdoAdF6Gkz2XBhQy0sPg69r4XUVPpSWnVJ
	RgBWHhX0A35y7EHPUPCAQKzAVYkk5aLVq3XroPjD8IjheZItXPJ1+8wSsl+GQZ/DIcy+
	kXS/A/Dys4WlbVPBGyoFmbXqwBUZ7zffXdM1pg4dWat22kGaSyQ2PbT8u6bE637ldg6u
	G1h8cv6LYVpqtuAI/g2uYfNQrRn+94lMZg/F1vq/+anCP6WP1M8QZzUclw/Y5gwOOr65
	BtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HWcJnOsjE8XFd0GN8nhnFTesLSNeRp3dGW+itD57yQA=;
	b=bCd1eT2kygFff3v1gNRy39wO1wZ0jE3IMetX4Va+KdzPLcW5rbMi3Z0aAPUG/UtinT
	yo/9H2PZtEBKPrTidHI2JJqVO85GyhvN4qyFnkDaUFV8c/txfs1XAcI/z05uKKd654AO
	nebubG6VJd76K2ErVEvbevYZRRFK098iz+v4K+/vL7ia6v5PE+BNq7cfPfDoXXecA7ls
	YZUXPwEwxwv+ibtA6XhVsNZiIn5VPpad7bq3+fCmtZBOZydQ1iLZNDRmq6qh2dSsof9H
	vw3bwz0phSUgSzK7CcMXm/l+dgrVOwIn7TRYjPsp1Z4GEyv2ITEWJTWVu/GTJxvHDWZv
	uuSw==
X-Gm-Message-State: AJcUukeRauJdzbqNDBxwcBpST4O+B7wcGqZhl6AnXWZ1Qv2sawUTkmCA
	kfAP4KcjD+0An66ptMHqjwHun4TJIaEOx6b1HlHvTvNj
X-Google-Smtp-Source: ALg8bN5L6Uyh+ZGC+g71KE514Son7DX6AICCGZm/alu+CAGGKykZ0IQ10NIzJgdU88UE0ePk4nBDFfMjavTK0YSIsO8=
X-Received: by 2002:a37:d408:: with SMTP id l8mr45815014qki.315.1546555592447; 
	Thu, 03 Jan 2019 14:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20190103223211.23531-1-alistair.francis@wdc.com>
In-Reply-To: <20190103223211.23531-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Jan 2019 14:46:06 -0800
Message-ID: <CAMKF1soQ4jSBtSXCZVHDtk6nHcyKTSG9UFK6-vLETxmoSwkeQw@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fts: Bump FTS to version 1.2.7
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
X-List-Received-Date: Thu, 03 Jan 2019 22:46:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 2:42 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-core/fts/fts.bb       | 22 ----------------------
>  meta/recipes-core/fts/fts_1.2.7.bb | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 22 deletions(-)
>  delete mode 100644 meta/recipes-core/fts/fts.bb
>  create mode 100644 meta/recipes-core/fts/fts_1.2.7.bb
>
> diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/fts.bb
> deleted file mode 100644
> index 02f54086a3..0000000000
> --- a/meta/recipes-core/fts/fts.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
> -# Released under the MIT license (see COPYING.MIT for the terms)
> -

I am sad you took this out :)

> -SUMMARY = "POSIX file tree stream operations library"
> -HOMEPAGE = "https://sites.google.com/a/bostic.com/keithbostic"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=5ffe358174aad383f1b69ce3b53da982"
> -SECTION = "libs"
> -
> -SRCREV = "944333aed9dc24cfa76cc64bfe70c75d25652753"
> -PV = "1.2+git${SRCPV}"
> -
> -SRC_URI = "git://github.com/voidlinux/musl-fts \
> -"
> -S = "${WORKDIR}/git"
> -
> -inherit autotools pkgconfig
> -#
> -# We will skip parsing for non-musl systems
> -#
> -COMPATIBLE_HOST = ".*-musl.*"
> -
> diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
> new file mode 100644
> index 0000000000..7ede6550f6
> --- /dev/null
> +++ b/meta/recipes-core/fts/fts_1.2.7.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Implementation of ftsfor musl libc packages"
> +HOMEPAGE = "https://github.com/pullmoll/musl-fts"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5ffe358174aad383f1b69ce3b53da982"
> +SECTION = "libs"
> +
> +SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
> +
> +SRC_URI = "git://github.com/pullmoll/musl-fts.git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +#
> +# We will skip parsing for non-musl systems
> +#
> +COMPATIBLE_HOST = ".*-musl.*"
> +
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

