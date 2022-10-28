Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B6AFA3742
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 16:13:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.1366.1666973619902658143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 09:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VL7zWtaQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B5E111C000A;
	Fri, 28 Oct 2022 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666973617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lzJhl5DdiM04pnqZS/SU7EoxBLgDb0AJ3AnUR8GN4PI=;
	b=VL7zWtaQuSMnZ2l8AM4sqTOqruBWMJWwqvNMAGmUqv0Um+ovd8LnhF2nzcJeeIwAhMqe3d
	v7vNENr+kxoto9hIIXoryxAwCAEL1Y9i9PBwSMVVtSfGgpWg6kRuKQHT4F+sLdwrX//56k
	aWr/OGbPHwVajLj4uAdJ4agF8BsrydbEkoLUPGjUqRxWt7fDojrGRd7XC43gf3nwdBAtWL
	0ka3lUreYozFlCx0LNVGXMZVB3qbX315q9x5+5ncBihg8UZOcy8Wha8RzWGTfpAiTdgbNp
	4WEzXK0MkUKUk3XqZtG99t2mIIyUyiE4Fz+X64xWVnL9bX8rdChf9QgrMYQ/4g==
Date: Fri, 28 Oct 2022 18:13:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 03/23] go: update 1.19 -> 1.19.1
Message-ID: <Y1v/sDcpZnFUjHXK@mail.local>
References: <20221027201611.3644334-1-alex@linutronix.de>
 <20221027201611.3644334-3-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027201611.3644334-3-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172266

Hello Alex,

Do you mind rebasing on master, I guess there is the ppc64 checksum to
add.

On 27/10/2022 22:15:51+0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/go/{go-1.19.inc => go-1.19.1.inc}   | 2 +-
>  ...o-binary-native_1.19.bb => go-binary-native_1.19.1.bb} | 4 ++--
>  ...cross-canadian_1.19.bb => go-cross-canadian_1.19.1.bb} | 0
>  .../go/{go-cross_1.19.bb => go-cross_1.19.1.bb}           | 0
>  .../go/{go-crosssdk_1.19.bb => go-crosssdk_1.19.1.bb}     | 0
>  .../go/{go-native_1.19.bb => go-native_1.19.1.bb}         | 0
>  .../go/{go-runtime_1.19.bb => go-runtime_1.19.1.bb}       | 0
>  ...go-make-content-based-hash-generation-less-pedan.patch | 8 ++++----
>  meta/recipes-devtools/go/{go_1.19.bb => go_1.19.1.bb}     | 0
>  9 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.19.inc => go-1.19.1.inc} (89%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.19.bb => go-binary-native_1.19.1.bb} (83%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.19.bb => go-cross-canadian_1.19.1.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.19.bb => go-cross_1.19.1.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.19.bb => go-crosssdk_1.19.1.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.19.bb => go-native_1.19.1.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.19.bb => go-runtime_1.19.1.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.19.bb => go_1.19.1.bb} (100%)
> 
> diff --git a/meta/recipes-devtools/go/go-1.19.inc b/meta/recipes-devtools/go/go-1.19.1.inc
> similarity index 89%
> rename from meta/recipes-devtools/go/go-1.19.inc
> rename to meta/recipes-devtools/go/go-1.19.1.inc
> index f733a807b4..48140f1c2b 100644
> --- a/meta/recipes-devtools/go/go-1.19.inc
> +++ b/meta/recipes-devtools/go/go-1.19.1.inc
> @@ -16,4 +16,4 @@ SRC_URI += "\
>      file://filter-build-paths.patch \
>      file://stack-protector.patch \
>  "
> -SRC_URI[main.sha256sum] = "9419cc70dc5a2523f29a77053cafff658ed21ef3561d9b6b020280ebceab28b9"
> +SRC_URI[main.sha256sum] = "27871baa490f3401414ad793fba49086f6c855b1c584385ed7771e1204c7e179"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.bb b/meta/recipes-devtools/go/go-binary-native_1.19.1.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.19.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.19.1.bb
> index ca424a66b8..e67457b86c 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.19.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.19.1.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>  PROVIDES = "go-native"
>  
>  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "464b6b66591f6cf055bc5df90a9750bf5fbc9d038722bb84a9d56a2bea974be6"
> -SRC_URI[go_linux_arm64.sha256sum] = "efa97fac9574fc6ef6c9ff3e3758fb85f1439b046573bf434cccb5e012bd00c8"
> +SRC_URI[go_linux_amd64.sha256sum] = "acc512fbab4f716a8f97a8b3fbaa9ddd39606a28be6c2515ef7c6c6311acffde"
> +SRC_URI[go_linux_arm64.sha256sum] = "49960821948b9c6b14041430890eccee58c76b52e2dbaafce971c3c38d43df9f"
>  
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.19.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.19.1.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.19.bb b/meta/recipes-devtools/go/go-cross_1.19.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.19.bb
> rename to meta/recipes-devtools/go/go-cross_1.19.1.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.19.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.19.1.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.19.bb b/meta/recipes-devtools/go/go-native_1.19.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.19.bb
> rename to meta/recipes-devtools/go/go-native_1.19.1.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.19.bb b/meta/recipes-devtools/go/go-runtime_1.19.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.19.bb
> rename to meta/recipes-devtools/go/go-runtime_1.19.1.bb
> diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> index 8cbed93017..17fa9d9831 100644
> --- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> +++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> @@ -1,4 +1,4 @@
> -From a3db4da51df37d163ff9e8c1e1057280c648c545 Mon Sep 17 00:00:00 2001
> +From fb22e586871cc6be0b7041e86d2daceee06ea568 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 28 Mar 2022 10:59:03 -0700
>  Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
> @@ -32,13 +32,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 34 insertions(+), 10 deletions(-)
>  
>  diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
> -index 529351d..df791b0 100644
> +index 81ee859..2db3898 100644
>  --- a/src/cmd/go/internal/envcmd/env.go
>  +++ b/src/cmd/go/internal/envcmd/env.go
>  @@ -176,7 +176,7 @@ func ExtraEnvVars() []cfg.EnvVar {
>   func ExtraEnvVarsCostly() []cfg.EnvVar {
> - 	var b work.Builder
> - 	b.Init()
> + 	b := work.NewBuilder("")
> + 
>  -	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
>  +	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
>   	if err != nil {
> diff --git a/meta/recipes-devtools/go/go_1.19.bb b/meta/recipes-devtools/go/go_1.19.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.19.bb
> rename to meta/recipes-devtools/go/go_1.19.1.bb
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172207): https://lists.openembedded.org/g/openembedded-core/message/172207
> Mute This Topic: https://lists.openembedded.org/mt/94612924/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

