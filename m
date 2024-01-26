Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF110C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 16:10:27 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.1747.1706285421837818604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 08:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ev4kx9qG;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50eac018059so768221e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706285420; x=1706890220; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L9ScOsXwauxzqWo+5PY30pUsSbyWuk0gTq7NkeYGkxA=;
        b=ev4kx9qGcpp/e0VIE+4WQMUn4gR7OrVHsd4U6U5orZvAamIB1KwpFMfgB6SMf/dX9X
         kd6LmddW3LIrw5i38r/14FZHm2DrYKUM+nrXO3KhdvqkeMwbBZVnoHduPcKBgIZ+6P9E
         MbASxzHQydKtzdyYwMqFphf5TTabAdVmKXP6bsBU3KHGLf+j8xlbLQsGV7R66Oc9FRpf
         CBP5sXTdAhWFlrKH73FzYUotnOzogoNLpWcBkItbCBWWODGQmJBdBUNtSfzZJsCYsnsP
         eSkUXcleqGjbx/AR8FFsoAbutnA9UKbiZZBVy0HkGHw/ZkfLulzszMURef04nw3mGZyr
         b6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706285420; x=1706890220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9ScOsXwauxzqWo+5PY30pUsSbyWuk0gTq7NkeYGkxA=;
        b=A4wZsfrkYtBOzUDvXzQAbsi5fbriaYfJ+fbNK+POrJj/Z3E+xExLxhZxBQdxnPpyp8
         SzAnTdtaEwpFNQcoioi53CYm1d+WJKOoIx4tHU88CQbq6ZP1GUQY/+yxZHaOyh2MQOwl
         0KMT6xngO91TyMU4pu0FQiLo7EpEhVIGDI+cru5bK+JLBQZW4fCWcggbk13NiO8RZiMh
         DEbUu0l3WxYCzwegNoI3/bSuRFVeAD2D+e9oMvj3cozsY0bYe57s6Us9eHQcF/i2UwI4
         oIvrzcomw9ARnOftiAe1/bL8fW/S0fqsttOeXYVoNnoaUs4QwG50S7etXuGgL4RMbGgh
         SaRQ==
X-Gm-Message-State: AOJu0Yw+0Ew2Vsq6SAvVj0SGC+Cu/i1mpPM7rgGou5FChKOuRLD8vzxX
	PGluzewyWgQ8x1SJOg56XkavfbBXyqq6rK5ySBxlFjR91Eb6WeWr2qxa3LtdmB4Spt1B/EcH9gp
	qPIWilyNj4sXKyy8h7CP/hs/Wt4M=
X-Google-Smtp-Source: AGHT+IEzaFxBk3ZQK4mF1H6qH6bJnfLmdp3qpZY2aH4u5h0COiEM+KVi1tgrgI+2juCKh2KTa9iL8471/+Q5X6wZjhU=
X-Received: by 2002:a05:6512:ad3:b0:510:1461:d029 with SMTP id
 n19-20020a0565120ad300b005101461d029mr1035660lfu.28.1706285419744; Fri, 26
 Jan 2024 08:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20240126160555.66586-1-jose.quaresma@foundries.io>
In-Reply-To: <20240126160555.66586-1-jose.quaresma@foundries.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jan 2024 17:10:08 +0100
Message-ID: <CANNYZj-geP-RWJqkdo=_gaO-44SJ0YHnyVoyNN2n3jybohQYWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: update 1.20.12 -> 1.20.13
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 16:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194393

Hello Jose,

there was a 1.21 update earlier, what happened to that?

Alex

On Fri, 26 Jan 2024 at 17:06, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> Upgrade to latest 1.20.x release [1]:
>
> $ git log --oneline go1.20.12..go1.20.13
> a95136a88c (tag: go1.20.13) [release-branch.go1.20] go1.20.13
> 5c38c04957 [release-branch.go1.20] crypto/tls: align FIPS-only mode with BoringSSL policy
> 9e4abed39b [release-branch.go1.20] crypto/internal/boring: upgrade module to fips-20220613
> 95afc744a7 [release-branch.go1.20] runtime: put ReadMemStats debug assertions behind a double-check mode
> 8cb86b5f85 [release-branch.go1.20] os/signal: skip nohup tests on darwin builders
> 59ffd3b90d [release-branch.go1.20] os/signal: remove go t.Run from TestNohup
>
> [1] https://github.com/golang/go/compare/go1.20.12...go1.20.13
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-devtools/go/{go-1.20.12.inc => go-1.20.13.inc} | 2 +-
>  ...binary-native_1.20.12.bb => go-binary-native_1.20.13.bb} | 6 +++---
>  ...oss-canadian_1.20.12.bb => go-cross-canadian_1.20.13.bb} | 0
>  .../go/{go-cross_1.20.12.bb => go-cross_1.20.13.bb}         | 0
>  .../go/{go-crosssdk_1.20.12.bb => go-crosssdk_1.20.13.bb}   | 0
>  .../go/{go-native_1.20.12.bb => go-native_1.20.13.bb}       | 0
>  .../go/{go-runtime_1.20.12.bb => go-runtime_1.20.13.bb}     | 0
>  meta/recipes-devtools/go/{go_1.20.12.bb => go_1.20.13.bb}   | 0
>  8 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.20.12.inc => go-1.20.13.inc} (89%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.20.12.bb => go-binary-native_1.20.13.bb} (78%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.20.12.bb => go-cross-canadian_1.20.13.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.20.12.bb => go-cross_1.20.13.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.20.12.bb => go-crosssdk_1.20.13.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.20.12.bb => go-native_1.20.13.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.20.12.bb => go-runtime_1.20.13.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.20.12.bb => go_1.20.13.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.20.12.inc b/meta/recipes-devtools/go/go-1.20.13.inc
> similarity index 89%
> rename from meta/recipes-devtools/go/go-1.20.12.inc
> rename to meta/recipes-devtools/go/go-1.20.13.inc
> index 9be56c6707..b6eeb651c9 100644
> --- a/meta/recipes-devtools/go/go-1.20.12.inc
> +++ b/meta/recipes-devtools/go/go-1.20.13.inc
> @@ -15,4 +15,4 @@ SRC_URI += "\
>      file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
>  "
> -SRC_URI[main.sha256sum] = "c5bf934751d31c315c1d0bb5fb02296545fa6d08923566f7a5afec81f2ed27d6"
> +SRC_URI[main.sha256sum] = "0fe745c530f2f1d67193af3c5ea25246be077989ec5178df266e975f3532449e"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb b/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
> similarity index 78%
> rename from meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.20.13.bb
> index 41db2ada80..d99bab71e1 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
> @@ -9,9 +9,9 @@ PROVIDES = "go-native"
>
>  # Checksums available at https://go.dev/dl/
>  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "9c5d48c54dd8b0a3b2ef91b0f92a1190aa01f11d26e98033efa64c46a30bba7b"
> -SRC_URI[go_linux_arm64.sha256sum] = "8afe8e3fb6972eaa2179ef0a71678c67f26509fab4f0f67c4b00f4cdfa92dc87"
> -SRC_URI[go_linux_ppc64le.sha256sum] = "2ae0ec3736216dfbd7b01ff679842dc1bed365e53a024d522645bcffd01c7328"
> +SRC_URI[go_linux_amd64.sha256sum] = "9a9d3dcae2b6a638b1f2e9bd4db08ffb39c10e55d9696914002742d90f0047b5"
> +SRC_URI[go_linux_arm64.sha256sum] = "a2d811cef3c4fc77c01195622e637af0c2cf8b3814a95a0920cf2f83b6061d38"
> +SRC_URI[go_linux_ppc64le.sha256sum] = "5f632b83323e16f8c6ceb676cd570b3f13f1826e06a81d92985d1301b643a7d3"
>
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.20.12.bb b/meta/recipes-devtools/go/go-cross_1.20.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.20.12.bb
> rename to meta/recipes-devtools/go/go-cross_1.20.13.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.12.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.20.12.bb b/meta/recipes-devtools/go/go-native_1.20.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.20.12.bb
> rename to meta/recipes-devtools/go/go-native_1.20.13.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.20.12.bb b/meta/recipes-devtools/go/go-runtime_1.20.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.20.12.bb
> rename to meta/recipes-devtools/go/go-runtime_1.20.13.bb
> diff --git a/meta/recipes-devtools/go/go_1.20.12.bb b/meta/recipes-devtools/go/go_1.20.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.20.12.bb
> rename to meta/recipes-devtools/go/go_1.20.13.bb
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194392): https://lists.openembedded.org/g/openembedded-core/message/194392
> Mute This Topic: https://lists.openembedded.org/mt/103978924/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

