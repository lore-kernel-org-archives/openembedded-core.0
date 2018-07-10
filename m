Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id B4FF16FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:39:43 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id y207-v6so41649469oie.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7GKOoxjfGIQEGpP3XQH1aKEUAHhfVxn2t6qxPtQs0bw=;
	b=LX/q1AOYwzWNNmFaod3V0cAN2Ies4UQqqhmUnxZEx5Rh/n9ZHCgkgtm/cx90Q8eACR
	TTBnDsLk5WtraP43CeLu6sp2cu8zOY2RecFJejUprs1mx68i8VKA26HOvOL5ZuV0TlWj
	WFA1X9WIQwrT3dFa1HPU2k9/qfX60pcQ0Cw1UrwSDMJ+uJxFC3eiulAJNjQd0GAu26jC
	URUhkiAFjWk6eaLdOcvlaF2EKv5tSnNXDrkKZmlO8NHAcrIBx6tVSUmHUUoW7yf0G/0v
	dV17EhCNs8ShwDnC0chqxRD/Q/SlSaEeLQS8BAQSSO4MuXoDBPW/A78mCkOm4C8EUR9Z
	twKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7GKOoxjfGIQEGpP3XQH1aKEUAHhfVxn2t6qxPtQs0bw=;
	b=mBtW4QtYXS9AbF7hSEdJ1GvanqrwP63h9mGTLzandp/wghAztPGjfl6Xzd8uCG1Q0z
	H+YW0idJ7nyltAFU94X+ouMJnEbUZIv7P60+GuCvUey2KF0t/TE5bvpD+VZwusAFm018
	HPJcRi0xcsFRqcdLVTauldYjniGZsKHN+oFndsgkpfA+6F7XOkdegaXi6P09uQA4ufoK
	NY+rm83UMIQjNHQeqQShqVABjJH0PLWIH5F3OVXG0x1VFKtbakUXbudHGtwxyfr+jfOI
	vFb1hgzu/6mz9fRhHCfYFsfz+wqESGYZM3kM0jk31zQyk0XguzZ5FUsdQroDi499bNBV
	96DA==
X-Gm-Message-State: APt69E1q94elVDUS/KghxxhCIwhSzhukYjgFp7iFbaY+3MGBh4RbcyOU
	eIKlr8ufe+gL782HVzZ/TKZcbfxXtzI1inn6SoDlxd9I
X-Google-Smtp-Source: AAOMgpc6mP6dyMQ1DCwUVMz0ubRCkkS32BTvkIT2uYkBXwFZvSgF2UHysfTkywmkn1tuKsHmR0wghfE1kvpBUXbVuIQ=
X-Received: by 2002:aca:4c8e:: with SMTP id
	z136-v6mr28942984oia.170.1531219184768; 
	Tue, 10 Jul 2018 03:39:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 03:39:24
	-0700 (PDT)
In-Reply-To: <20180710024207.6296-3-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
	<20180710024207.6296-3-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2018 11:39:24 +0100
Message-ID: <CAJTo0LaV+54SATOy4yz-cDH=HjGLc8ivfjawbj3c7x3LGqQaqQ@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] harfbuzz:1.7.5 -> 1.7.6
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
X-List-Received-Date: Tue, 10 Jul 2018 10:39:43 -0000
Content-Type: text/plain; charset="UTF-8"

Packaging is broken, as it was the last time this was submitted to the list:

packages/corei7-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed
"/usr/lib/libharfbuzz.so.0.10705.0", added
"/usr/lib/libharfbuzz.so.0.10706.0 /usr/lib/libharfbuzz-subset.so.0
/usr/lib/libharfbuzz-subset.so.0.10706.0"
packages/corei7-64-poky-linux/harfbuzz/harfbuzz: PKG changed from
libharfbuzz0 to harfbuzz [default] - may indicate debian renaming
failure

Ross

On 10 July 2018 at 03:42, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade harfbuzz from 1.7.5 to 1.7.6.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.7.6.bb}                 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.7.6.bb} (88%)
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.6.bb
> similarity index 88%
> rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.7.6.bb
> index 0a9b029..80d413a 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.6.bb
> @@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
>
>  SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
>
> -SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
> -SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
> +SRC_URI[md5sum] = "ffb94cf2942327344ac31330d07036ba"
> +SRC_URI[sha256sum] = "da7bed39134826cd51e57c29f1dfbe342ccedb4f4773b1c951ff05ff383e2e9b"
>
>  inherit autotools pkgconfig lib_package gtk-doc
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

