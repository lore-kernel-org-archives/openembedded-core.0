Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.20609.1618436767064046669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 14:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=pgmTuLPE;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.8.1.2] (unknown [107.158.96.43])
	by linux.microsoft.com (Postfix) with ESMTPSA id C3CE620B8001;
	Wed, 14 Apr 2021 14:46:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C3CE620B8001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618436766;
	bh=/jH1DdMxyhLapc+S6tLSkAygGs5AjcSPMtIB9Qdm624=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=pgmTuLPELssi9fiwZfo3oLq1v/nHAMYnz79v+XcnOxUIWi8699QTtaKYnYP/0JVSD
	 N8UI6kFthZtTJDvqfbU5Bq+iAXuqxxFV8cUs2Y5yUOWeMJiy+qrtX57sRR4VSYH6hM
	 HNHxH7bTPoOqJ/SxlpQ501qqFS4ZELKUsE8ESEck=
Subject: Re: [OE-core] [PATCH v2] go: upgrade 1.16.2 -> 1.16.3
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>
References: <20210410013005.2232041-1-raj.khem@gmail.com>
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
Message-ID: <876f7807-4d37-94bc-0592-806ded94c87d@linux.microsoft.com>
Date: Wed, 14 Apr 2021 21:48:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210410013005.2232041-1-raj.khem@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------D9C594157C96769F3C7F9E70"
Content-Language: en-US

--------------D9C594157C96769F3C7F9E70
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


This one is causing failures in test_yocto_source_mirror

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2037/steps/23/logs/stdio

although since its still on master-next my guess is that its sources 
havent been published

yet to downloads.yoctoproject.org


Alejandro


On 4/10/21 1:30 AM, Khem Raj wrote:
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
>   meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc}     | 4 ++--
>   ...{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} | 4 ++--
>   ...o-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} | 0
>   .../go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb}             | 0
>   .../go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb}       | 0
>   .../go/{go-native_1.16.2.bb => go-native_1.16.3.bb}           | 0
>   .../go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb}         | 0
>   meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb}       | 0
>   8 files changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc} (88%)
>   rename meta/recipes-devtools/go/{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} (83%)
>   rename meta/recipes-devtools/go/{go-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} (100%)
>   rename meta/recipes-devtools/go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb} (100%)
>   rename meta/recipes-devtools/go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb} (100%)
>   rename meta/recipes-devtools/go/{go-native_1.16.2.bb => go-native_1.16.3.bb} (100%)
>   rename meta/recipes-devtools/go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb} (100%)
>   rename meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.16.2.inc b/meta/recipes-devtools/go/go-1.16.3.inc
> similarity index 88%
> rename from meta/recipes-devtools/go/go-1.16.2.inc
> rename to meta/recipes-devtools/go/go-1.16.3.inc
> index e65caf8197..ebd25a5eaa 100644
> --- a/meta/recipes-devtools/go/go-1.16.2.inc
> +++ b/meta/recipes-devtools/go/go-1.16.3.inc
> @@ -1,7 +1,7 @@
>   require go-common.inc
>   
>   GO_BASEVERSION = "1.16"
> -PV = "1.16.2"
> +PV = "1.16.3"
>   FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> @@ -17,4 +17,4 @@ SRC_URI += "\
>       file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>       file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>   "
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
>   PROVIDES = "go-native"
>   
>   SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "542e936b19542e62679766194364f45141fde55169db2d8d01046555ca9eb4b8"
> -SRC_URI[go_linux_arm64.sha256sum] = "6924601d998a0917694fd14261347e3798bd2ad6b13c4d7f2edd70c9d57f62ab"
> +SRC_URI[go_linux_amd64.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
> +SRC_URI[go_linux_arm64.sha256sum] = "566b1d6f17d2bc4ad5f81486f0df44f3088c3ed47a3bec4099d8ed9939e90d5d"
>   
>   UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>   UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
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

--------------D9C594157C96769F3C7F9E70
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,</p>
    <p><br>
    </p>
    <p>This one is causing failures in test_yocto_source_mirror <br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2037/steps/23/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2037/steps/23/logs/stdio</a><br>
    </p>
    <p>although since its still on master-next my guess is that its
      sources havent been published</p>
    <p>yet to downloads.yoctoproject.org<br>
    </p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/10/21 1:30 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210410013005.2232041-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: wangmy <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>

This is bugfix release in 1.16 series [1]

[1] <a class="moz-txt-link-freetext" href="https://github.com/golang/go/issues?q=milestone%3AGo1.16.3+label%3ACherryPickApproved">https://github.com/golang/go/issues?q=milestone%3AGo1.16.3+label%3ACherryPickApproved</a>

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
v2: Fix checksums and improve commit msg

 meta/recipes-devtools/go/{go-1.16.2.inc =&gt; go-1.16.3.inc}     | 4 ++--
 ...{go-binary-native_1.16.2.bb =&gt; go-binary-native_1.16.3.bb} | 4 ++--
 ...o-cross-canadian_1.16.2.bb =&gt; go-cross-canadian_1.16.3.bb} | 0
 .../go/{go-cross_1.16.2.bb =&gt; go-cross_1.16.3.bb}             | 0
 .../go/{go-crosssdk_1.16.2.bb =&gt; go-crosssdk_1.16.3.bb}       | 0
 .../go/{go-native_1.16.2.bb =&gt; go-native_1.16.3.bb}           | 0
 .../go/{go-runtime_1.16.2.bb =&gt; go-runtime_1.16.3.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.2.bb =&gt; go_1.16.3.bb}       | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.2.inc =&gt; go-1.16.3.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.2.bb =&gt; go-binary-native_1.16.3.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.2.bb =&gt; go-cross-canadian_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.2.bb =&gt; go-cross_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.2.bb =&gt; go-crosssdk_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.2.bb =&gt; go-native_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.2.bb =&gt; go-runtime_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.2.bb =&gt; go_1.16.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.2.inc b/meta/recipes-devtools/go/go-1.16.3.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.2.inc
rename to meta/recipes-devtools/go/go-1.16.3.inc
index e65caf8197..ebd25a5eaa 100644
--- a/meta/recipes-devtools/go/go-1.16.2.inc
+++ b/meta/recipes-devtools/go/go-1.16.3.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.2"
+PV = "1.16.3"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707">"file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"</a>
@@ -17,4 +17,4 @@ SRC_URI += "\
     <a class="moz-txt-link-freetext" href="file://0008-use-GOBUILDMODE-to-set-buildmode.patch">file://0008-use-GOBUILDMODE-to-set-buildmode.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch">file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch</a> \
 "
-SRC_URI[main.sha256sum] = "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea"
+SRC_URI[main.sha256sum] = "b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.3.bb
index 4fb060173c..d01a2bd8f1 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707">"file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"</a>
 PROVIDES = "go-native"
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}">"https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"</a>
-SRC_URI[go_linux_amd64.sha256sum] = "542e936b19542e62679766194364f45141fde55169db2d8d01046555ca9eb4b8"
-SRC_URI[go_linux_arm64.sha256sum] = "6924601d998a0917694fd14261347e3798bd2ad6b13c4d7f2edd70c9d57f62ab"
+SRC_URI[go_linux_amd64.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
+SRC_URI[go_linux_arm64.sha256sum] = "566b1d6f17d2bc4ad5f81486f0df44f3088c3ed47a3bec4099d8ed9939e90d5d"
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://golang.org/dl/">"https://golang.org/dl/"</a>
 UPSTREAM_CHECK_REGEX = "go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.2.bb b/meta/recipes-devtools/go/go-cross_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.2.bb
rename to meta/recipes-devtools/go/go-cross_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.2.bb b/meta/recipes-devtools/go/go-native_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.2.bb
rename to meta/recipes-devtools/go/go-native_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.2.bb b/meta/recipes-devtools/go/go-runtime_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go_1.16.2.bb b/meta/recipes-devtools/go/go_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.2.bb
rename to meta/recipes-devtools/go/go_1.16.3.bb
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D9C594157C96769F3C7F9E70--
