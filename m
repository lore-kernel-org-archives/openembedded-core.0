Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3918C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 06:13:34 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web09.7828.1645164814224790305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 22:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pHdrTIgA;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id e22so12880496qvf.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 22:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vr9/NPnxQohNfFsmEjH0BkR933AHWGFwvbTcIO3qzGE=;
        b=pHdrTIgARGN9lABxYEdnlH/A+WGp5H10ZDm3jwDeMWqnDJOTbyRXAsEXrcdgyvQcsM
         AMgms0MVrIT/cJzeBfUHJyDxSrGk83vlGjkxWEZGLirve462FOsJ4L4Qpe0cC5MtAIyG
         RWjpU3AWCXtmGIFj+dE6faIjtHI8i1vhVadk+JDEq+9DcwzcH2Xomc/ltb6EHjuCa8Np
         wJMIRQCHyliAFbPFTYV8D0PFjb0dS0bvtYY6ev+3tOqoIhmqc0kiOm+6OQdN19l98RQ1
         17b8xruvFAzD18/4//weMF6kb4BBczCxAf42QGZg0JYJusKFjK5JpmewsxZ3xGiL19XG
         1CjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vr9/NPnxQohNfFsmEjH0BkR933AHWGFwvbTcIO3qzGE=;
        b=IZnres3bRem5RhF8FsuWkhwb7uX0XwfpwSBK+l8gNys/lfYfw1ZZv6gt0Amc8vfaId
         jT8w1Q3cRhDps/3YBBesvoYAqRlb3a+hBAtu8H6wAJatk/BQ52vYmUUDztRfNCAgogXK
         UHkNJcGx9I7k+8XZuiXxkNVFpAE5HIivP9dWQW32DWPjxEMOF5ygRGj/JLzPu9faF4xu
         MTRjqv8SC2rfqH+4IfwU5OA55XnkJO9OX9xH1ouS+FLR8MOVydsq8/jwmrMQOo7wwKpZ
         PVqsGWTCCN/aq5mBAVizljfe72KKrNi6GjBNB8EN2NjEiT/87fP/WsWBYN8w3UsDcDxb
         dyrg==
X-Gm-Message-State: AOAM5309v7CaYBSdbK4c9vlG7jKxkgxsml2Y3tzUVMJd9Sk7amcIg+Lh
	L6OMA0lDe4LTj31GfbeRQk2yOo4Iukatlj67ZNE=
X-Google-Smtp-Source: 
 ABdhPJy4sMSPmvF++KmLbYf8iverS6eIFHbVoiSPXrNK72N/tZc2qpkRJJO3/yqlJ/nlJAF13QvH9yJYs7k9hOZwgzM=
X-Received: by 2002:ad4:574a:0:b0:42b:ef56:c2a4 with SMTP id
 q10-20020ad4574a000000b0042bef56c2a4mr4654778qvx.16.1645164813196; Thu, 17
 Feb 2022 22:13:33 -0800 (PST)
MIME-Version: 1.0
References: <20220218054315.169005-1-andrew@aj.id.au>
In-Reply-To: <20220218054315.169005-1-andrew@aj.id.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Feb 2022 22:13:07 -0800
Message-ID: 
 <CAMKF1sojxzU4g7hy3RPgnY99X70KnVnnVLqKFuVeD6rTp8WvxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Introduce RS_BUILD_ARCH to handle ppc64le
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 06:13:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161879

On Thu, Feb 17, 2022 at 9:43 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On modern Power systems `uname -m` reports 'ppc64le'. However, Rust's
> toolchain names the architecture 'powerpc64le'.
>
> Introduce RS_BUILD_ARCH to provide an indirection to fix this mismatch.
>
> I've tested each of the generated URIs for Power using the output from
> `bitbake -e rust-native` and could successfully fetch the artifacts.
>
thanks
can you also check if arch_to_rust_target_arch() in
meta/recipes-devtools/rust/rust-common.inc
is computing it right for ppc64le case ?

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta/recipes-devtools/rust/rust-snapshot.inc | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
> index 74b558262f62..9b309b6f330c 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -14,12 +14,20 @@ SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "3618da916a0f92f241cf1d67d04bb578
>  SRC_URI[rustc-snapshot-aarch64.sha256sum] = "f26811e48d03c56c125de03d389e1ae7c6df36990953c1670c6a5676bc12d4cb"
>  SRC_URI[cargo-snapshot-aarch64.sha256sum] = "6d11cd94618d80cda273eeeae7285980445f61a49ebacc616777b482a41cbf3f"
>
> +python () {
> +    build_arch = d.getVar('BUILD_ARCH')
> +    if build_arch == "ppc64le":
> +        d.setVar("RS_BUILD_ARCH", "powerpc64le")
> +    else:
> +        d.setVar("RS_BUILD_ARCH", build_arch)
> +}
> +
>  SRC_URI += " \
> -    https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
> -    https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
> -    https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
> +    https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RS_BUILD_ARCH};subdir=rust-snapshot-components \
> +    https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RS_BUILD_ARCH};subdir=rust-snapshot-components \
> +    https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RS_BUILD_ARCH};subdir=rust-snapshot-components \
>  "
>
> -RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
> -RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
> -CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${BUILD_ARCH}-unknown-linux-gnu"
> +RUST_STD_SNAPSHOT = "rust-std-${RS_VERSION}-${RS_BUILD_ARCH}-unknown-linux-gnu"
> +RUSTC_SNAPSHOT = "rustc-${RS_VERSION}-${RS_BUILD_ARCH}-unknown-linux-gnu"
> +CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${RS_BUILD_ARCH}-unknown-linux-gnu"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161878): https://lists.openembedded.org/g/openembedded-core/message/161878
> Mute This Topic: https://lists.openembedded.org/mt/89227468/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

