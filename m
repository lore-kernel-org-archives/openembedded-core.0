Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.1792.1632359037292861486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 18:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HepANah4;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id 72so16326993qkk.7
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 18:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gIqCO9sf6I3h86BQgv+F8NNed+sric6LYfHRTmupIt8=;
        b=HepANah4t3LJjBS8WejggvKuuoT044afPw7UmLTnrow4QdgO2rwFGO0hlPNjx7O0W7
         FcuQGM+OcimTftgBtlpSBE5xJ7r3wJD1lR3Q0I14pz8PNhbTpFnW8xSaS4UHRxQWTVbj
         yr2iJey5w9xW5TG0aqOQnzRjtoqbTJ2hIPzI4vXD071B6lb2LgI+4FF0YNyOlmULPixC
         oUrdsklcaEvoxcPns75ScivADZXe6x1s+xP4SEFUzGJ5t3g5hhemong1Y8YnojYzX2VY
         H9ULjhHNV8p4TT2jkYSlKF261KhjUiVcAIRezKN93yk580Mgn96HpeRSrpnnVszEBjR/
         mL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIqCO9sf6I3h86BQgv+F8NNed+sric6LYfHRTmupIt8=;
        b=xTs8o4ORS0D7edMyeM/CzDlbUOppvGzrxV+Pt6uQSTrgY+f6/ZwYif6TONXYw+AcZZ
         dS72StyfQBU3Fb+YEgbAcyJg9IPAIZ+hkA1A8R0waH25amEXdJhYJ5oMod331K43N/u8
         Ui5HEtFS6RBtOb51V9Tpa77z4BCDf6r55pvczM5MoeTh5vYn9t/gC80W6XFmUrwgEjpW
         zKE1rayml2ThuAnvLmmZBDxSxpT009pOvjr22pThT+R/o8HY9I7ea4DxF2LJsR1I8nfb
         ZsqknqzJdk8vJwoqpdF3fTRjZm5bnzmZZUC48OqjMTkBNoOE2KdZvXSjDzKuc6qicP/W
         WXsQ==
X-Gm-Message-State: AOAM533d93CuD2n6mlTGF3acGBBtaheojsM6unLc5SnMbEGXsQzG9oop
	xInR2BAiWvGk0Q0EjVsFe+0mLpktg+jxFjL2beFN9sp0jCo=
X-Google-Smtp-Source: ABdhPJxJndmJJkjkAUM1If87habJy8QR0h9FJqBmG31o/G0eVnaZdjC2Oz84USOPk2TRVID2BGaR7BL+GpE56VqHyrc=
X-Received: by 2002:a37:9c46:: with SMTP id f67mr2339158qke.98.1632359035995;
 Wed, 22 Sep 2021 18:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210923001731.32084-1-sakib.sajal@windriver.com>
In-Reply-To: <20210923001731.32084-1-sakib.sajal@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 22 Sep 2021 18:03:29 -0700
Message-ID: <CAMKF1spAOdmmgr3MSTP0SRkVUjaS3+jbgShp9o_LHmzWvANnEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: upgrade 1.16.7 -> 1.16.8
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this looks ok. Are you also working on 1.17 major version upgrade ?

On Wed, Sep 22, 2021 at 5:17 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-devtools/go/{go-1.16.7.inc => go-1.16.8.inc}     | 4 ++--
>  ...{go-binary-native_1.16.7.bb => go-binary-native_1.16.8.bb} | 4 ++--
>  ...o-cross-canadian_1.16.7.bb => go-cross-canadian_1.16.8.bb} | 0
>  .../go/{go-cross_1.16.7.bb => go-cross_1.16.8.bb}             | 0
>  .../go/{go-crosssdk_1.16.7.bb => go-crosssdk_1.16.8.bb}       | 0
>  .../go/{go-native_1.16.7.bb => go-native_1.16.8.bb}           | 0
>  .../go/{go-runtime_1.16.7.bb => go-runtime_1.16.8.bb}         | 0
>  meta/recipes-devtools/go/{go_1.16.7.bb => go_1.16.8.bb}       | 0
>  8 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.16.7.inc => go-1.16.8.inc} (91%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.16.7.bb => go-binary-native_1.16.8.bb} (83%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.7.bb => go-cross-canadian_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.16.7.bb => go-cross_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.16.7.bb => go-crosssdk_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.16.7.bb => go-native_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.16.7.bb => go-runtime_1.16.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.16.7.bb => go_1.16.8.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.16.7.inc b/meta/recipes-devtools/go/go-1.16.8.inc
> similarity index 91%
> rename from meta/recipes-devtools/go/go-1.16.7.inc
> rename to meta/recipes-devtools/go/go-1.16.8.inc
> index 9eca1caeeb..acc2300a28 100644
> --- a/meta/recipes-devtools/go/go-1.16.7.inc
> +++ b/meta/recipes-devtools/go/go-1.16.8.inc
> @@ -1,7 +1,7 @@
>  require go-common.inc
>
>  GO_BASEVERSION = "1.16"
> -PV = "1.16.7"
> +PV = "1.16.8"
>  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> @@ -18,7 +18,7 @@ SRC_URI += "\
>      file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>      file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
>  "
> -SRC_URI[main.sha256sum] = "1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac"
> +SRC_URI[main.sha256sum] = "8f2a8c24b793375b3243df82fdb0c8387486dcc8a892ca1c991aa99ace086b98"
>
>  # Upstream don't believe it is a signifiant real world issue and will only
>  # fix in 1.17 onwards where we can drop this.
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.7.bb b/meta/recipes-devtools/go/go-binary-native_1.16.8.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.16.7.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.16.8.bb
> index cb54c2868e..926222089d 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.16.8.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>  PROVIDES = "go-native"
>
>  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "7fe7a73f55ba3e2285da36f8b085e5c0159e9564ef5f63ee0ed6b818ade8ef04"
> -SRC_URI[go_linux_arm64.sha256sum] = "63d6b53ecbd2b05c1f0e9903c92042663f2f68afdbb67f4d0d12700156869bac"
> +SRC_URI[go_linux_amd64.sha256sum] = "f32501aeb8b7b723bc7215f6c373abb6981bbc7e1c7b44e9f07317e1a300dce2"
> +SRC_URI[go_linux_arm64.sha256sum] = "430dbe185417204f6788913197ab3b189b6deae9c9b524f262858e53dab239c2"
>
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.16.7.bb b/meta/recipes-devtools/go/go-cross_1.16.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.16.7.bb
> rename to meta/recipes-devtools/go/go-cross_1.16.8.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.16.8.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.16.7.bb b/meta/recipes-devtools/go/go-native_1.16.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.16.7.bb
> rename to meta/recipes-devtools/go/go-native_1.16.8.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.16.7.bb b/meta/recipes-devtools/go/go-runtime_1.16.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.16.7.bb
> rename to meta/recipes-devtools/go/go-runtime_1.16.8.bb
> diff --git a/meta/recipes-devtools/go/go_1.16.7.bb b/meta/recipes-devtools/go/go_1.16.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.16.7.bb
> rename to meta/recipes-devtools/go/go_1.16.8.bb
> --
> 2.33.0
>
>
> 
>
