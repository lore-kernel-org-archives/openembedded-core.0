Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA477FA35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 18:41:20 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z14so10202665qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 10:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CbxZ9Iom+tI+BHwdSCesZ3Ixb7VqVHm4UUnLyRxtG9g=;
	b=Y+6J2CNVEeKLyTMbdBjJz0TcQ/WHEJ0poieLgfiP8osNH0+bTKs60Rtcc0ZK2k3z++
	Qc9LDb/u29yqAIAnsS34NIdbUWkWhz6eTbEDuI4yeiRni0Ag6g2wIHaD/AKDTWvGuZkG
	pxvuO/YeG0FcayCZsr0f+ec/woiEWNRDfpxwZVZKZJWwryRYmoSMgfpAm7USnnSQH2xm
	rjzfVGO6o/pJQ7x1q7fdph1vSJip8IviaZSEAt3hHNellAiy4Xoqr+HwD3B9fakt+BIH
	oQcjFTh1Lh+l9cYjA05tABDUrO2P14jJ/F7NFwflHVhLXCaTilNlMtsKkyeaY16G7f+T
	7o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CbxZ9Iom+tI+BHwdSCesZ3Ixb7VqVHm4UUnLyRxtG9g=;
	b=RO57Q2GXaiQonPtS3o/fYrkVQHvBWtydnwr1EXBkXSpUSM82T9/Mzu05ld2xiqwvP+
	daWCuW6vUp5KCMHXSMWzePbpQqy35sDdFmhTFyEJrJ8NzjEDE8EVNaV4OAlZwCRiCm2u
	EsNTF1AZIuqjBnNieTrkhlHvlm42jKo9La0p1HXSSap6jeRrBnPxk7Kth9S4jTjyJEma
	KMjFI54bYq4tefEbz71yatqD9YuLZAjc5jqlJHnQMj3kshrnOmPB94gjnjj7ze5YfSVx
	P8srUPHCA+/TpbRkFPz/Ieqz/blyBk+rlcduHWbjLsDcHnqonTeOomc/YJE5LHcDKFzt
	K5Tg==
X-Gm-Message-State: APjAAAUTcs8635zmG5PCBoFJA6lAJsXGczDz1wh6UQy61UQRDJBodAFX
	U+tg1UFvwcjXSeMM1vPKMEC7SyUSZ19ER6pPfsE=
X-Google-Smtp-Source: APXvYqwZFwkmDMPmj9SJuO+M4PorsQhvLNGuqBxMf9SoejajH2ncXUHArE9SxHWa5lp/5IbJ4yyGW+W6C8dlJ5CLumc=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr4485659qkh.9.1576089681101; 
	Wed, 11 Dec 2019 10:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20191211172334.11377-1-twoerner@gmail.com>
In-Reply-To: <20191211172334.11377-1-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Dec 2019 10:40:54 -0800
Message-ID: <CAMKF1srKC=Z5r56=hZj5Q7trKW+LG-NDp7JqLXZqaoWGcDqinQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa.inc: allow the user to choose the build type
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
X-List-Received-Date: Wed, 11 Dec 2019 18:41:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 11, 2019 at 9:23 AM Trevor Woerner <twoerner@gmail.com> wrote:
>
> Upstream mesa can either be built as a debug release (the default) or a
> production release. This patch allows the user to choose which one they
> want by setting MESA_BUILD_TYPE to either 'production' or 'debug' as
> they see fit. Under OpenEmbedded a production build will be performed by
> default.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 5838207e6b..9ad9f2e370 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -46,6 +46,19 @@ export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
>
>  MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
>
> +# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
> +# by default the upstream mesa sources build a debug release
> +# here we assume the user will want a release build by default
> +MESA_BUILD_TYPE ?= "release"
> +def check_buildtype(d):
> +    _buildtype = d.getVar('MESA_BUILD_TYPE')
> +    if _buildtype not in ['release', 'debug']:
> +        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
> +    if _buildtype == 'debug':
> +        return 'debugoptimized'
> +    return 'plain'
> +MESON_BUILDTYPE = "${@check_buildtype(d)}"
> +

Should this also be controlled with DEBUG_BUILD knob

>  EXTRA_OEMESON = " \
>      -Dshared-glapi=true \
>      -Dgallium-opencl=disabled \
> --
> 2.23.0.37.g745f681289
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

