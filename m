Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.1072.1618450014895941143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 18:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DP1sA5eB;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id o10so24280589ybb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 18:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GGdeRGtPQvnGkBuredI8rxJtNsoWBOn4IWd4xNlsd3U=;
        b=DP1sA5eBndZjseSCovPK5N308VT+PelcqjYjFkIbEauSIqjuFMX1zYfOUNWmWW+5eh
         xx7hDbONcUMlcHgDkpn+ZFYk/w7qyjxuc/ubt2XtnZVhvtdCTomgGFosyP914gKeGGFW
         nr2u3lSA4Isd5H/LYcayZVJYnolqRkztJjonAISTB4t/OaCf33lc+BTQ6zn0/9/Xuxo8
         MFjb1PIEagVXfqM3203kyuArQ3CZ+Mca+KZ8IXWZsQTHj0drqZAv2P0p0CD+5ryDf0bu
         TB8ClcOueG8k3HR0Tw9u/L7DhiR9L/27+SQUN4XsShQRy9Yetp1pQ5f52wNvTfUd0Lax
         JLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GGdeRGtPQvnGkBuredI8rxJtNsoWBOn4IWd4xNlsd3U=;
        b=At09UA2aY2hBa2FyrEgCjK4mzRWSEY+nmDd5rUbtPZZcIHzSXCkpYLFsIM5zSUQL1v
         E/3qx5dNASNKF3PCDbxXc3mf7I9bCFK4gNjzXUC5sciQAVxh/0FHcHa7x0DniLs+73LA
         cMWGBBYTImIwegri9YiEg2WgLyr3e0hHPQ/b8YRZVskwnR8RTlA3vHbTLe/H16GlclBo
         pPdFuXg7iMM/2qxrfcNpia10SRsDv60sKazy/T9jsGXoqcEZzOtkuJiVSu4luiLFFys0
         IGl2N3jagXqPpn6a/fasFLhHTiFCx1hAX2hscjIexMSIA0ywhmcw8h0OqVg8wleQ61bP
         RD3Q==
X-Gm-Message-State: AOAM5315Bm5gRLjE/qDBKR36bb0CgGrGjEPZ7KcW4eUVNc5lp0JREubG
	ogymZzZAccs8rk2I0NDeoY6eQscCFYpILpiGUgQ=
X-Google-Smtp-Source: ABdhPJxxXqhHi9o7y4J1L6thaOPx8JSe71ykQCW0NFJ302LzdTpuCURmgdXZSLooS6GUVfuni8ctiReHXmEUbg2DYKk=
X-Received: by 2002:a5b:94d:: with SMTP id x13mr1134934ybq.368.1618450013963;
 Wed, 14 Apr 2021 18:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210410013005.2232041-1-raj.khem@gmail.com> <876f7807-4d37-94bc-0592-806ded94c87d@linux.microsoft.com>
In-Reply-To: <876f7807-4d37-94bc-0592-806ded94c87d@linux.microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Apr 2021 18:26:26 -0700
Message-ID: <CAMKF1sqB+YXC1dvCr4nkTP3tWw5XWXDtm9YKcxT-7UL31p=wUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] go: upgrade 1.16.2 -> 1.16.3
To: Alejandro Hernandez <alhe@linux.microsoft.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, wangmy <wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 2:46 PM Alejandro Hernandez
<alhe@linux.microsoft.com> wrote:
>
> Hello,
>
>
> This one is causing failures in test_yocto_source_mirror
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2037/steps/23/logs/stdio
>
> although since its still on master-next my guess is that its sources havent been published
>
> yet to downloads.yoctoproject.org
>

Thank you for reporting, can you try out v3, which switches to use
https for src_uri

>
> Alejandro
>
>
> On 4/10/21 1:30 AM, Khem Raj wrote:
>
> From: wangmy <wangmy@fujitsu.com>
>
> This is bugfix release in 1.16 series [1]
>
> [1] https://github.com/golang/go/issues?q=milestone%3AGo1.16.3+label%3ACherryPickApproved
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix checksums and improve commit msg
>
>  meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc}     | 4 ++--
>  ...{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} | 4 ++--
>  ...o-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} | 0
>  .../go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb}             | 0
>  .../go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb}       | 0
>  .../go/{go-native_1.16.2.bb => go-native_1.16.3.bb}           | 0
>  .../go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb}         | 0
>  meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb}       | 0
>  8 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc} (88%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} (83%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.16.2.bb => go-native_1.16.3.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.16.2.inc b/meta/recipes-devtools/go/go-1.16.3.inc
> similarity index 88%
> rename from meta/recipes-devtools/go/go-1.16.2.inc
> rename to meta/recipes-devtools/go/go-1.16.3.inc
> index e65caf8197..ebd25a5eaa 100644
> --- a/meta/recipes-devtools/go/go-1.16.2.inc
> +++ b/meta/recipes-devtools/go/go-1.16.3.inc
> @@ -1,7 +1,7 @@
>  require go-common.inc
>
>  GO_BASEVERSION = "1.16"
> -PV = "1.16.2"
> +PV = "1.16.3"
>  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> @@ -17,4 +17,4 @@ SRC_URI += "\
>      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>      file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>  "
> -SRC_URI[main.sha256sum] = "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea"
> +SRC_URI[main.sha256sum] = "b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.16.2.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.16.3.bb
> index 4fb060173c..d01a2bd8f1 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>  PROVIDES = "go-native"
>
>  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "542e936b19542e62679766194364f45141fde55169db2d8d01046555ca9eb4b8"
> -SRC_URI[go_linux_arm64.sha256sum] = "6924601d998a0917694fd14261347e3798bd2ad6b13c4d7f2edd70c9d57f62ab"
> +SRC_URI[go_linux_amd64.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
> +SRC_URI[go_linux_arm64.sha256sum] = "566b1d6f17d2bc4ad5f81486f0df44f3088c3ed47a3bec4099d8ed9939e90d5d"
>
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.16.2.bb b/meta/recipes-devtools/go/go-cross_1.16.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.16.2.bb
> rename to meta/recipes-devtools/go/go-cross_1.16.3.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.16.2.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.16.2.bb b/meta/recipes-devtools/go/go-native_1.16.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.16.2.bb
> rename to meta/recipes-devtools/go/go-native_1.16.3.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.16.2.bb b/meta/recipes-devtools/go/go-runtime_1.16.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.16.2.bb
> rename to meta/recipes-devtools/go/go-runtime_1.16.3.bb
> diff --git a/meta/recipes-devtools/go/go_1.16.2.bb b/meta/recipes-devtools/go/go_1.16.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.16.2.bb
> rename to meta/recipes-devtools/go/go_1.16.3.bb
>
>
> 
>
