Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.178.1618846716362534061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 08:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tPYiAOsG;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id i12so4656768qke.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n7DhPoZb+bqH4asCVXsFTXLutk6rWa6O5FNNKOWl3WQ=;
        b=tPYiAOsGkS4xTf12FHcraFv8Som3D/sqomJBCyvWJeqA3QpC4yJTXe9qopQNGhKQBQ
         XSI+wz/VJJw5YNESvufvoqteFDFUixGCjBZo9DyypI00CjQ2lOfVy4LkyxuMQmoT5Nzp
         JMTg0rQsmXvZEI6KnZbTBqwNzVMr1DShh1jfljemrDYF0+mAAeYqL82war5DfmuVW8db
         SylmsKtRPAPlQJwFPBcPcEkKSlEgJDzanquANIckfN+CSMDMmxNvmf5ghWOBgQmNwIa1
         s3atV76tWkP/bUwCT/r4HTkIG3OB5EoHiMoTpfqXVoqw1Dx08rbRhUXqpnyAuPFHd2sg
         U7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n7DhPoZb+bqH4asCVXsFTXLutk6rWa6O5FNNKOWl3WQ=;
        b=dHqKftcXcYyD1193DLVprw2LiF1UtT7kEtXR7MSRGaFc/cOVpESHnf3WusR7e7rArK
         v2t6zQGaiZBytL8XWQv5BXZhKEdWcpch+EEfSP2xH7QlgSF6BV8VdOdaLt9hc8+a4gbW
         5iXY733ZGWGZSI4mtQRqVgv8JlmHe0zPqxkHd+mGJi8pG6d2nUJvuWEIws4MBsxzEVPW
         rHxs59UxgmqJQCJiUOBzm48yNig3a2on/4hwwNXy3LAAJ4MAFlyj394mtoo7tnyx+SJy
         Jz68URSIM38XVWD+HEgKH4yCMerOwO3v9iukNoqCHPO891rZZ0X5Q0VH6rwiGrcif+Bt
         T6FQ==
X-Gm-Message-State: AOAM530Y7qYluj+ATGFbayMm6dTYFMWoEB3g5H0mTpPrnfugpQwYeLUg
	7ykfV1ERGwEtReHo3EezxuPxwG0j8zq8jziWkWQ=
X-Google-Smtp-Source: ABdhPJzpB8u0QQ8l5RzPAgIJ6wYzh8nL668KDVuSsCkIlKaLOLIuXo4VvHsd9kay3+lipH8phAH+YiOIPbnaGW8D/Rc=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr12521129qkd.381.1618846715422;
 Mon, 19 Apr 2021 08:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210410013005.2232041-1-raj.khem@gmail.com> <876f7807-4d37-94bc-0592-806ded94c87d@linux.microsoft.com>
 <eec642ef8f5e4bb79194c384092181e7@intel.com> <20210419075121.c3f43vbrqudy26pt@jama>
In-Reply-To: <20210419075121.c3f43vbrqudy26pt@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 19 Apr 2021 08:38:09 -0700
Message-ID: <CAMKF1spNc_skUcvZKquR+i+LbfmNKQSDe+JHUrWKrKDZuqpnWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] go: upgrade 1.16.2 -> 1.16.3
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>, 
	Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, wangmy <wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021 at 12:51 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Mon, Apr 19, 2021 at 04:25:26AM +0000, Naveen Saini wrote:
> > [SWAT]
> > Fetching error:
> > recipe go-runtime-1.16.3-r0: task do_fetch: Failed
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2053/steps/23/logs/stdio
>
> That seems related to
> https://git.openembedded.org/openembedded-core/commit/?id=2a1eb731ed3bcb049192550e362b771c3a9ea6eb
> not this go upgrade.
>

that change came after upgrade to see if it will help this issue :)

> Also locally I can fetch this over http:// as well as https:// without
> any issues with wget, but it's true that with chrome I see valid
> certificate on https://golang.org/dl but not on
> https://golang.org/dl/go1.16.3.src.tar.gz
> or
> https://golang.org/dl/go1.16.2.src.tar.gz
>
> and curl downloads just the link to dl.google.com/go
> $ curl https://golang.org/dl/go1.16.3.src.tar.gz
> <a href="https://dl.google.com/go/go1.16.3.src.tar.gz">Found</a>.
>
> Maybe we should just use https://dl.google.com/go directly to fetch
> go.

yes perhaps that's a better option.

>
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Alejandro Hernandez Samaniego
> > Sent: Thursday, April 15, 2021 5:49 AM
> > To: Khem Raj <raj.khem@gmail.com>; openembedded-core@lists.openembedded.org
> > Cc: wangmy <wangmy@fujitsu.com>
> > Subject: Re: [OE-core] [PATCH v2] go: upgrade 1.16.2 -> 1.16.3
> >
> >
> > Hello,
> >
> >
> >
> > This one is causing failures in test_yocto_source_mirror
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2037/steps/23/logs/stdio
> >
> > although since its still on master-next my guess is that its sources havent been published
> >
> > yet to downloads.yoctoproject.org
> >
> >
> >
> > Alejandro
> >
> >
> > On 4/10/21 1:30 AM, Khem Raj wrote:
> >
> > From: wangmy <wangmy@fujitsu.com><mailto:wangmy@fujitsu.com>
> >
> >
> >
> > This is bugfix release in 1.16 series [1]
> >
> >
> >
> > [1] https://github.com/golang/go/issues?q=milestone%3AGo1.16.3+label%3ACherryPickApproved
> >
> >
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com><mailto:wangmy@fujitsu.com>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com><mailto:raj.khem@gmail.com>
> >
> > ---
> >
> > v2: Fix checksums and improve commit msg
> >
> >
> >
> >  meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc}     | 4 ++--
> >
> >  ...{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} | 4 ++--
> >
> >  ...o-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} | 0
> >
> >  .../go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb}             | 0
> >
> >  .../go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb}       | 0
> >
> >  .../go/{go-native_1.16.2.bb => go-native_1.16.3.bb}           | 0
> >
> >  .../go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb}         | 0
> >
> >  meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb}       | 0
> >
> >  8 files changed, 4 insertions(+), 4 deletions(-)
> >
> >  rename meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc} (88%)
> >
> >  rename meta/recipes-devtools/go/{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} (83%)
> >
> >  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} (100%)
> >
> >  rename meta/recipes-devtools/go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb} (100%)
> >
> >  rename meta/recipes-devtools/go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb} (100%)
> >
> >  rename meta/recipes-devtools/go/{go-native_1.16.2.bb => go-native_1.16.3.bb} (100%)
> >
> >  rename meta/recipes-devtools/go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb} (100%)
> >
> >  rename meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb} (100%)
> >
> >
> >
> > diff --git a/meta/recipes-devtools/go/go-1.16.2.inc b/meta/recipes-devtools/go/go-1.16.3.inc
> >
> > similarity index 88%
> >
> > rename from meta/recipes-devtools/go/go-1.16.2.inc
> >
> > rename to meta/recipes-devtools/go/go-1.16.3.inc
> >
> > index e65caf8197..ebd25a5eaa 100644
> >
> > --- a/meta/recipes-devtools/go/go-1.16.2.inc
> >
> > +++ b/meta/recipes-devtools/go/go-1.16.3.inc
> >
> > @@ -1,7 +1,7 @@
> >
> >  require go-common.inc
> >
> >
> >
> >  GO_BASEVERSION = "1.16"
> >
> > -PV = "1.16.2"
> >
> > +PV = "1.16.3"
> >
> >  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> >
> >
> >
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"<file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707>
> >
> > @@ -17,4 +17,4 @@ SRC_URI += "\
> >
> >      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> >
> >      file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
> >
> >  "
> >
> > -SRC_URI[main.sha256sum] = "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea"
> >
> > +SRC_URI[main.sha256sum] = "b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25"
> >
> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
> >
> > similarity index 83%
> >
> > rename from meta/recipes-devtools/go/go-binary-native_1.16.2.bb
> >
> > rename to meta/recipes-devtools/go/go-binary-native_1.16.3.bb
> >
> > index 4fb060173c..d01a2bd8f1 100644
> >
> > --- a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb
> >
> > +++ b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
> >
> > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"<file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707>
> >
> >  PROVIDES = "go-native"
> >
> >
> >
> >  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"<https://dl.google.com/go/go$%7bPV%7d.$%7bBUILD_GOOS%7d-$%7bBUILD_GOARCH%7d.tar.gz;name=go_$%7bBUILD_GOTUPLE%7d>
> >
> > -SRC_URI[go_linux_amd64.sha256sum] = "542e936b19542e62679766194364f45141fde55169db2d8d01046555ca9eb4b8"
> >
> > -SRC_URI[go_linux_arm64.sha256sum] = "6924601d998a0917694fd14261347e3798bd2ad6b13c4d7f2edd70c9d57f62ab"
> >
> > +SRC_URI[go_linux_amd64.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
> >
> > +SRC_URI[go_linux_arm64.sha256sum] = "566b1d6f17d2bc4ad5f81486f0df44f3088c3ed47a3bec4099d8ed9939e90d5d"
> >
> >
> >
> >  UPSTREAM_CHECK_URI = "https://golang.org/dl/"<https://golang.org/dl/>
> >
> >  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> >
> > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
> >
> > similarity index 100%
> >
> > rename from meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb
> >
> > rename to meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
> >
> > diff --git a/meta/recipes-devtools/go/go-cross_1.16.2.bb b/meta/recipes-devtools/go/go-cross_1.16.3.bb
> >
> > similarity index 100%
> >
> > rename from meta/recipes-devtools/go/go-cross_1.16.2.bb
> >
> > rename to meta/recipes-devtools/go/go-cross_1.16.3.bb
> >
> > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
> >
> > similarity index 100%
> >
> > rename from meta/recipes-devtools/go/go-crosssdk_1.16.2.bb
> >
> > rename to meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
> >
> > diff --git a/meta/recipes-devtools/go/go-native_1.16.2.bb b/meta/recipes-devtools/go/go-native_1.16.3.bb
> >
> > similarity index 100%
> >
> > rename from meta/recipes-devtools/go/go-native_1.16.2.bb
> >
> > rename to meta/recipes-devtools/go/go-native_1.16.3.bb
> >
> > diff --git a/meta/recipes-devtools/go/go-runtime_1.16.2.bb b/meta/recipes-devtools/go/go-runtime_1.16.3.bb
> >
> > similarity index 100%
> >
> > rename from meta/recipes-devtools/go/go-runtime_1.16.2.bb
> >
> > rename to meta/recipes-devtools/go/go-runtime_1.16.3.bb
> >
> > diff --git a/meta/recipes-devtools/go/go_1.16.2.bb b/meta/recipes-devtools/go/go_1.16.3.bb
> >
> > similarity index 100%
> >
> > rename from meta/recipes-devtools/go/go_1.16.2.bb
> >
> > rename to meta/recipes-devtools/go/go_1.16.3.bb
> >
> >
> >
> >
> >
> >
> >
> >
>
> >
> > 
> >
>
