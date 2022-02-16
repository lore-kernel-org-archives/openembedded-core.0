Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FBCC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 06:43:47 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.9002.1644993826252342796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 22:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=T/m+5s7M;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.8.233] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id E38F420B9D51;
	Tue, 15 Feb 2022 22:43:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E38F420B9D51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1644993825;
	bh=LWT1Z41RI+o0A7PeqROeRGPH7GIM0riQL1hSDhhxskQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=T/m+5s7MrTdT2mFFGnOIQRRT+LB09B88VZEz/fiv7p3r6jf06vehnFZUrpQe2gNzo
	 r10+xxq//DJOE9MEQ49GyP5/tktTGwY9sVYRZ8OLgJwSk5EixXogpBWMRago4sjVIR
	 tZajR7jl6SAtzzuQCv3MjVdvRRhW6qaIhdP7Exj8=
Content-Type: multipart/alternative;
 boundary="------------qe6JdNI7Q240763itccuyN3s"
Message-ID: <f4c8c2f7-a578-83fd-5268-aeee11e801e2@linux.microsoft.com>
Date: Wed, 16 Feb 2022 06:43:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] go: upgrade 1.17.6 -> 1.17.7
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
References: <1644848847-3331-1-git-send-email-wangmy@fujitsu.com>
 <1644848847-3331-3-git-send-email-wangmy@fujitsu.com>
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <1644848847-3331-3-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 06:43:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161768

This is a multi-part message in MIME format.
--------------qe6JdNI7Q240763itccuyN3s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

This is causing a do_fetch failure in the autobuilder for go-binary-native:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3231


Cheers,

Alejandro


On 2/14/22 14:27, wangmy wrote:
> Signed-off-by: Wang Mingyu<wangmy@fujitsu.com>
> ---
>   meta/recipes-devtools/go/{go-1.17.6.inc => go-1.17.7.inc}     | 2 +-
>   ...{go-binary-native_1.17.6.bb => go-binary-native_1.17.7.bb} | 4 ++--
>   ...o-cross-canadian_1.17.6.bb => go-cross-canadian_1.17.7.bb} | 0
>   .../go/{go-cross_1.17.6.bb => go-cross_1.17.7.bb}             | 0
>   .../go/{go-crosssdk_1.17.6.bb => go-crosssdk_1.17.7.bb}       | 0
>   .../go/{go-native_1.17.6.bb => go-native_1.17.7.bb}           | 0
>   .../go/{go-runtime_1.17.6.bb => go-runtime_1.17.7.bb}         | 0
>   meta/recipes-devtools/go/{go_1.17.6.bb => go_1.17.7.bb}       | 0
>   8 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-devtools/go/{go-1.17.6.inc => go-1.17.7.inc} (92%)
>   rename meta/recipes-devtools/go/{go-binary-native_1.17.6.bb => go-binary-native_1.17.7.bb} (83%)
>   rename meta/recipes-devtools/go/{go-cross-canadian_1.17.6.bb => go-cross-canadian_1.17.7.bb} (100%)
>   rename meta/recipes-devtools/go/{go-cross_1.17.6.bb => go-cross_1.17.7.bb} (100%)
>   rename meta/recipes-devtools/go/{go-crosssdk_1.17.6.bb => go-crosssdk_1.17.7.bb} (100%)
>   rename meta/recipes-devtools/go/{go-native_1.17.6.bb => go-native_1.17.7.bb} (100%)
>   rename meta/recipes-devtools/go/{go-runtime_1.17.6.bb => go-runtime_1.17.7.bb} (100%)
>   rename meta/recipes-devtools/go/{go_1.17.6.bb => go_1.17.7.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.17.6.inc b/meta/recipes-devtools/go/go-1.17.7.inc
> similarity index 92%
> rename from meta/recipes-devtools/go/go-1.17.6.inc
> rename to meta/recipes-devtools/go/go-1.17.7.inc
> index 3ea23e0320..e8c8c031ae 100644
> --- a/meta/recipes-devtools/go/go-1.17.6.inc
> +++ b/meta/recipes-devtools/go/go-1.17.7.inc
> @@ -17,7 +17,7 @@ SRC_URI += "\
>       file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch  \
>       file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch  \
>   "
> -SRC_URI[main.sha256sum] = "4dc1bbf3ff61f0c1ff2b19355e6d88151a70126268a47c761477686ef94748c8"
> +SRC_URI[main.sha256sum] = "c108cd33b73b1911a02b697741df3dea43e01a5c4e08e409e8b3a0e3745d2b4d"
>   
>   # Upstream don't believe it is a signifiant real world issue and will only
>   # fix in 1.17 onwards where we can drop this.
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.6.bb b/meta/recipes-devtools/go/go-binary-native_1.17.7.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.17.6.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.17.7.bb
> index 674f9176af..c78c28f84e 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.17.6.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.17.7.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM ="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>   PROVIDES = "go-native"
>   
>   SRC_URI ="https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "231654bbf2dab3d86c1619ce799e77b03d96f9b50770297c8f4dff8836fc8ca2"
> -SRC_URI[go_linux_arm64.sha256sum] = "82c1a033cce9bc1b47073fd6285233133040f0378439f3c4659fe77cc534622a"
> +SRC_URI[go_linux_amd64.sha256sum] = "02b111284bedbfa35a7e5b74a06082d18632eff824fd144312f6063943d49259"
> +SRC_URI[go_linux_arm64.sha256sum] = "a5aa1ed17d45ee1d58b4a4099b12f8942acbd1dd09b2e9a6abb1c4898043c5f5"
>   
>   UPSTREAM_CHECK_URI ="https://golang.org/dl/"
>   UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.17.6.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.17.7.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.17.6.bb b/meta/recipes-devtools/go/go-cross_1.17.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.17.6.bb
> rename to meta/recipes-devtools/go/go-cross_1.17.7.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.17.6.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.17.7.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.17.6.bb b/meta/recipes-devtools/go/go-native_1.17.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.17.6.bb
> rename to meta/recipes-devtools/go/go-native_1.17.7.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.17.6.bb b/meta/recipes-devtools/go/go-runtime_1.17.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.17.6.bb
> rename to meta/recipes-devtools/go/go-runtime_1.17.7.bb
> diff --git a/meta/recipes-devtools/go/go_1.17.6.bb b/meta/recipes-devtools/go/go_1.17.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.17.6.bb
> rename to meta/recipes-devtools/go/go_1.17.7.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161707):https://lists.openembedded.org/g/openembedded-core/message/161707
> Mute This Topic:https://lists.openembedded.org/mt/89137048/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------qe6JdNI7Q240763itccuyN3s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Courier New, Courier, monospace">Hello,</font></p>
    <p><font face="Courier New, Courier, monospace">This is causing a
        do_fetch failure in the autobuilder for go-binary-native:<br>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3231">https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3231</a></font></p>
    <p><font face="Courier New, Courier, monospace"><br>
      </font></p>
    <p><font face="Courier New, Courier, monospace">Cheers,</font></p>
    <p><font face="Courier New, Courier, monospace">Alejandro<br>
      </font></p>
    <p><font face="Courier New, Courier, monospace"></font><br>
    </p>
    <div class="moz-cite-prefix">On 2/14/22 14:27, wangmy wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1644848847-3331-3-git-send-email-wangmy@fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
---
 meta/recipes-devtools/go/{go-1.17.6.inc =&gt; go-1.17.7.inc}     | 2 +-
 ...{go-binary-native_1.17.6.bb =&gt; go-binary-native_1.17.7.bb} | 4 ++--
 ...o-cross-canadian_1.17.6.bb =&gt; go-cross-canadian_1.17.7.bb} | 0
 .../go/{go-cross_1.17.6.bb =&gt; go-cross_1.17.7.bb}             | 0
 .../go/{go-crosssdk_1.17.6.bb =&gt; go-crosssdk_1.17.7.bb}       | 0
 .../go/{go-native_1.17.6.bb =&gt; go-native_1.17.7.bb}           | 0
 .../go/{go-runtime_1.17.6.bb =&gt; go-runtime_1.17.7.bb}         | 0
 meta/recipes-devtools/go/{go_1.17.6.bb =&gt; go_1.17.7.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.6.inc =&gt; go-1.17.7.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.6.bb =&gt; go-binary-native_1.17.7.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.6.bb =&gt; go-cross-canadian_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.6.bb =&gt; go-cross_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.6.bb =&gt; go-crosssdk_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.6.bb =&gt; go-native_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.6.bb =&gt; go-runtime_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.6.bb =&gt; go_1.17.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.6.inc b/meta/recipes-devtools/go/go-1.17.7.inc
similarity index 92%
rename from meta/recipes-devtools/go/go-1.17.6.inc
rename to meta/recipes-devtools/go/go-1.17.7.inc
index 3ea23e0320..e8c8c031ae 100644
--- a/meta/recipes-devtools/go/go-1.17.6.inc
+++ b/meta/recipes-devtools/go/go-1.17.7.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
     <a class="moz-txt-link-freetext" href="file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch">file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch">file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch</a> \
 "
-SRC_URI[main.sha256sum] = "4dc1bbf3ff61f0c1ff2b19355e6d88151a70126268a47c761477686ef94748c8"
+SRC_URI[main.sha256sum] = "c108cd33b73b1911a02b697741df3dea43e01a5c4e08e409e8b3a0e3745d2b4d"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.6.bb b/meta/recipes-devtools/go/go-binary-native_1.17.7.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.7.bb
index 674f9176af..c78c28f84e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707">"file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"</a>
 PROVIDES = "go-native"
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}">"https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"</a>
-SRC_URI[go_linux_amd64.sha256sum] = "231654bbf2dab3d86c1619ce799e77b03d96f9b50770297c8f4dff8836fc8ca2"
-SRC_URI[go_linux_arm64.sha256sum] = "82c1a033cce9bc1b47073fd6285233133040f0378439f3c4659fe77cc534622a"
+SRC_URI[go_linux_amd64.sha256sum] = "02b111284bedbfa35a7e5b74a06082d18632eff824fd144312f6063943d49259"
+SRC_URI[go_linux_arm64.sha256sum] = "a5aa1ed17d45ee1d58b4a4099b12f8942acbd1dd09b2e9a6abb1c4898043c5f5"
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://golang.org/dl/">"https://golang.org/dl/"</a>
 UPSTREAM_CHECK_REGEX = "go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.6.bb b/meta/recipes-devtools/go/go-cross_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.6.bb
rename to meta/recipes-devtools/go/go-cross_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.6.bb b/meta/recipes-devtools/go/go-native_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.6.bb
rename to meta/recipes-devtools/go/go-native_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.6.bb b/meta/recipes-devtools/go/go-runtime_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go_1.17.6.bb b/meta/recipes-devtools/go/go_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.6.bb
rename to meta/recipes-devtools/go/go_1.17.7.bb
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#161707): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/161707">https://lists.openembedded.org/g/openembedded-core/message/161707</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89137048/4354175">https://lists.openembedded.org/mt/89137048/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------qe6JdNI7Q240763itccuyN3s--

