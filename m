Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6678D3E2C0
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 19:47:54 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.2121.1730144871155528641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QYC9PhFN;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so41106791fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730144869; x=1730749669; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ1Zg7A3MVIf3w3TFDZYa4uZl6PWWpiqPSFflhD4rwo=;
        b=QYC9PhFNlJrJuSVr30/Uxvk3RCDH1RZ19a/y1UFnAzH3jvncGl2NiS7YLhiFVAts52
         2kTpciJVMA4YKNjEafHAX702YR+GR1zTNTHvgfvo/AVK0GQu0Pg/9xh8uMeOWjccABUK
         RrSBSr+//Gm8sH3LZKdOcmwCOsB2AJBv9yUfcF6XSpClnlH+QKKYe+uJdRsLaFlo8h3Y
         gHZn7SDfozgO7UGox2YAlfG2zj1nqOzmRDTAqC7GjesSoch/igdlgmxjnNz7KY+vVNVk
         urs449XxXe916fdkwkZb+mH62hyorHa44u8fgvtVg276tbGSXU85E2sMrFvEUKcIXFxQ
         1suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144869; x=1730749669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ1Zg7A3MVIf3w3TFDZYa4uZl6PWWpiqPSFflhD4rwo=;
        b=R2AM/kGb+icgo+gU2jcGmtr6svtUP2+WznmZd/HrTv5R+U0f5mjzlw/DzJxBjcSFQn
         LRrZTGl0dYQuUjeHohv7W5PClSzVs0fm3hnNejoWPExtrhcONrGivDdpGtACdpj+u5+j
         6gVwAZjbPuIRThFYtXV8ScawI/bkP+qgzgKap6SgjJmFflPHeDlo3yV5Hpzs+ICGqYQd
         PL17tiDv7O2pmK360Np9oVVHLAsvFJhXM2ZghX2D3+yP0oGpmNLtp3BjgmkOYq5q3el3
         Qb01hlOPkw3F4zBjA82pIa26QMbHVgfs7SL0lj7HffEEx4HfLiM9zPdC/s6BCCG4TTw3
         hlyw==
X-Gm-Message-State: AOJu0YwKte9O/o0N0Eu8MooHfLREkgVqC/dTzRKCMPlK6QZQzKqOJGwO
	Pwdew09noxXyj7ZjpmyUOOKG4DArl4ykAHqL2b1T5x0vQTs8C9XM9OKTShDs5Jr/gNaQjuZxPx4
	5hGvk0gxR4ZZluzKBuiUSimHaXSs=
X-Google-Smtp-Source: AGHT+IFPfzECRoGEOEeUR55MKXK6E+BraLB3rIPScTsIPk7oGQrcksq9e4tO0jE1v8ZlgqUpFqD4oMJm8cZSusyx2Vs=
X-Received: by 2002:a05:651c:199e:b0:2fb:5740:9f9a with SMTP id
 38308e7fff4ca-2fcbe07871dmr40359561fa.29.1730144868976; Mon, 28 Oct 2024
 12:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241027133906.367260-1-peter.marko@siemens.com> <20241027133906.367260-2-peter.marko@siemens.com>
In-Reply-To: <20241027133906.367260-2-peter.marko@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Oct 2024 20:47:36 +0100
Message-ID: <CANNYZj9zcNQ+=QCDci_U=x9TopEW0YaHDJ=asJUhkRpEg8zWTQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] go: upgrade 1.22.7 -> 1.22.8
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 19:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206460

Thanks, but should we rather update to actual latest, which is 1.23.2?

Alex

On Sun, 27 Oct 2024 at 14:40, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Upgrade to latest 1.22.x release [1]:
>
> $ git --no-pager log --oneline go1.22.7..go1.22.8
> aeccd613c8 (tag: go1.22.8) [release-branch.go1.22] go1.22.8
> b4086b7c16 [release-branch.go1.22] syscall: skip TestAmbientCapsUserns when restricted, document
> 6fab4b9a9e [release-branch.go1.22] runtime: size maps.Clone destination bucket array safely
> 71655f14ce [release-branch.go1.22] cmd/cgo: correct padding required by alignment
>
> [1] https://github.com/golang/go/compare/go1.22.7...go1.22.8
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/go/{go-1.22.7.inc => go-1.22.8.inc}   | 2 +-
>  ...o-binary-native_1.22.7.bb => go-binary-native_1.22.8.bb} | 6 +++---
>  ...cross-canadian_1.22.7.bb => go-cross-canadian_1.22.8.bb} | 0
>  .../go/{go-cross_1.22.7.bb => go-cross_1.22.8.bb}           | 0
>  .../go/{go-crosssdk_1.22.7.bb => go-crosssdk_1.22.8.bb}     | 0
>  .../go/{go-runtime_1.22.7.bb => go-runtime_1.22.8.bb}       | 0
>  meta/recipes-devtools/go/{go_1.22.7.bb => go_1.22.8.bb}     | 0
>  7 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.22.7.inc => go-1.22.8.inc} (89%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.22.7.bb => go-binary-native_1.22.8.bb} (78%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.22.7.bb => go-cross-canadian_1.22.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.22.7.bb => go-cross_1.22.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.22.7.bb => go-crosssdk_1.22.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.22.7.bb => go-runtime_1.22.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.22.7.bb => go_1.22.8.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.22.7.inc b/meta/recipes-devtools/go/go-1.22.8.inc
> similarity index 89%
> rename from meta/recipes-devtools/go/go-1.22.7.inc
> rename to meta/recipes-devtools/go/go-1.22.8.inc
> index e54a902741..542519b930 100644
> --- a/meta/recipes-devtools/go/go-1.22.7.inc
> +++ b/meta/recipes-devtools/go/go-1.22.8.inc
> @@ -15,4 +15,4 @@ SRC_URI += "\
>      file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
>  "
> -SRC_URI[main.sha256sum] = "66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f"
> +SRC_URI[main.sha256sum] = "df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
> similarity index 78%
> rename from meta/recipes-devtools/go/go-binary-native_1.22.7.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.22.8.bb
> index aba317fd38..98799eb503 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
> @@ -9,9 +9,9 @@ PROVIDES = "go-native"
>
>  # Checksums available at https://go.dev/dl/
>  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb"
> -SRC_URI[go_linux_arm64.sha256sum] = "ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885"
> -SRC_URI[go_linux_ppc64le.sha256sum] = "a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a"
> +SRC_URI[go_linux_amd64.sha256sum] = "5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f"
> +SRC_URI[go_linux_arm64.sha256sum] = "5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a"
> +SRC_URI[go_linux_ppc64le.sha256sum] = "c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27"
>
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.22.7.bb b/meta/recipes-devtools/go/go-cross_1.22.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.22.7.bb
> rename to meta/recipes-devtools/go/go-cross_1.22.8.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.22.7.bb b/meta/recipes-devtools/go/go-runtime_1.22.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.22.7.bb
> rename to meta/recipes-devtools/go/go-runtime_1.22.8.bb
> diff --git a/meta/recipes-devtools/go/go_1.22.7.bb b/meta/recipes-devtools/go/go_1.22.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.22.7.bb
> rename to meta/recipes-devtools/go/go_1.22.8.bb
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206401): https://lists.openembedded.org/g/openembedded-core/message/206401
> Mute This Topic: https://lists.openembedded.org/mt/109239515/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

