Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.1391.1589476303276481466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 10:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VI32cDSV;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id k6so1081264iob.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 10:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=goGq53Vm3XrAcg83n0CobH8cD9TrlIenLVbFKzVyxV0=;
        b=VI32cDSVg/ZJOke08yVeNAxfvlGt72Y0YtRPES1b+obDoBsDh+UINJerBilogr+q31
         IcUXkDdNiZMRzIW5OV0wONvues15WEEEPLC3R25WKmR0MMypGi2KEv6N8ILATMFzkYEK
         atKpRP9JKGHosCHUAT0df65AvJ8Iddo3paNoLKgB0Az7yEb9H/UxMxxKldWv08gdyLJX
         vBhtLhdwynVEBvb06YEySY61nBIs2eICXI6qF/+hpaVfbi05rMGJCkxtAugdOGYcbKbX
         Y/wYeO2yGrmdWkIjgbO9rUe635LO+g39n/PVYEE6k1xR2iwr8sCcJnOIbnWmqupr5HpJ
         Pf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=goGq53Vm3XrAcg83n0CobH8cD9TrlIenLVbFKzVyxV0=;
        b=BcDPrIs0vmZbobwsxDXxyhbX/ujSHCP2Pog7D8t2AtCqs92+BbGd9PZF1l+lc9Ip24
         rNdph40V0BsLcGjs07U37n9tWsz0bQJzLe/qicucMvDbKG9XlwKYVdIPmt6irzcsjqXE
         FzzQbQmAxrXtR3mljRhuNnxGxW/a4HrtyeARe9WFRm83SKT5GAu0uxYAroEruO60RGEG
         N5t/dujexAOp8tPMa55n3+oHUY6ifqIaLD6qcsFAD/sO3eZXylRA1m9oIOwnEIoXv14w
         zN4A5mbij+sa5xU6y4E3HIFWMzsDpSHiTuat/pop3dWSBrmXjO3GkzgRdCeK4EHSS2dx
         ZLdQ==
X-Gm-Message-State: AOAM531JnZV9b2VXuMxaaxi0mZYomw/X6zlAYwfwAb6p0B+wzrqPDmDu
	8iFBhQY508R1/+g0TOD3/a0=
X-Google-Smtp-Source: ABdhPJyGLrVO7TQ3B4QaSnF5Sjo3YhzN34LiVCnsMxkTf/n5xO0XsIBpXID/UGabHHNGo5qPGGXPFA==
X-Received: by 2002:a6b:c9cc:: with SMTP id z195mr4929511iof.164.1589476302618;
        Thu, 14 May 2020 10:11:42 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:1041:f567:5747:59e9? ([2605:a601:ac3d:c100:1041:f567:5747:59e9])
        by smtp.gmail.com with ESMTPSA id l9sm1209740iop.22.2020.05.14.10.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 10:11:41 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] kernel/reproducibility: factor kernel source epoch for common use
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
 <d09f4c9abf8c9e0ff342c4b5d6323eb371391c63.1589378829.git.bruce.ashfield@gmail.com>
Message-ID: <3cecc535-4291-4ce1-a25d-51db2b9d0415@gmail.com>
Date: Thu, 14 May 2020 12:11:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d09f4c9abf8c9e0ff342c4b5d6323eb371391c63.1589378829.git.bruce.ashfield@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------19500C811C266DA8CCACE5F4"
Content-Language: en-US

--------------19500C811C266DA8CCACE5F4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/13/20 9:24 AM, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Rather than duplicating the code to generate the kbuild environment
> variable: KBUILD_BUILD_TIMESTAMP, we can factor the checks into a
> python function and call it from the main image and kernel module
> do_compile routines.
>
> All paths have been checked and the timestamp is identical to the
> previous shell variant.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   meta/classes/kernel.bbclass | 43 ++++++++++++++++---------------------
>   1 file changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a3990aaf59..de63e1c0f6 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -153,6 +153,21 @@ python do_symlink_kernsrc () {
>   }
>   addtask symlink_kernsrc before do_configure after do_unpack
>   
> +def get_kernel_source_date_epoch(d):
> +    import subprocess
> +
> +    s_d_e = d.getVar("SOURCE_DATE_EPOCH")
> +    if not s_d_e:
> +        s_d_e = subprocess.check_output(['git', '--git-dir=%s/.git' % d.getVar('S'), 'log', '-1', '--pretty=%ct']).decode('utf-8')
> +        if not s_d_e:
> +            s_d_e = d.getVar("REPRODUCIBLE_TIMESTAMP_ROOTFS")
> +
> +    env = os.environ.copy()
> +    env['LC_ALL'] = 'C'
> +    ts = subprocess.check_output(['date', '-d @%s' % s_d_e]).decode('utf-8')
> +
> +    return ts
> +

Is there something special about the kernel that it can't use the 
SOURCE_DATE_EPOCH guessing code from classes/reproducible_build.bbclass? 
If so, is it possible there is some minor change we could make to the 
code to make it work? It seems a little unfortunate to replicate the 
logic to calculate the SDE when that class does it already.


>   inherit kernel-arch deploy
>   
>   PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
> @@ -291,19 +306,9 @@ get_cc_option () {
>   kernel_do_compile() {
>   	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>   	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> -		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> -		# be set....
> -		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> -			# The source directory is not necessarily a git repository, so we
> -			# specify the git-dir to ensure that git does not query a
> -			# repository in any parent directory.
> -			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> -		fi
> -
> -		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> -		export KBUILD_BUILD_TIMESTAMP="$ts"
> +		export KBUILD_BUILD_TIMESTAMP="${@ get_kernel_source_date_epoch(d)}"
>   		export KCONFIG_NOTIMESTAMP=1
> -		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +		bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
>   	fi
>   	# The $use_alternate_initrd is only set from
>   	# do_bundle_initramfs() This variable is specifically for the
> @@ -332,19 +337,9 @@ kernel_do_compile() {
>   do_compile_kernelmodules() {
>   	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>   	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> -		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> -		# be set....
> -		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> -			# The source directory is not necessarily a git repository, so we
> -			# specify the git-dir to ensure that git does not query a
> -			# repository in any parent directory.
> -			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> -		fi
> -
> -		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> -		export KBUILD_BUILD_TIMESTAMP="$ts"
> +		export KBUILD_BUILD_TIMESTAMP="${@ get_kernel_source_date_epoch(d)}"
>   		export KCONFIG_NOTIMESTAMP=1
> -		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +		bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
>   	fi
>   	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
>   		cc_extra=$(get_cc_option)
>
> 

--------------19500C811C266DA8CCACE5F4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/13/20 9:24 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:d09f4c9abf8c9e0ff342c4b5d6323eb371391c63.1589378829.git.bruce.ashfield@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Bruce Ashfield <a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield@gmail.com">&lt;bruce.ashfield@gmail.com&gt;</a>

Rather than duplicating the code to generate the kbuild environment
variable: KBUILD_BUILD_TIMESTAMP, we can factor the checks into a
python function and call it from the main image and kernel module
do_compile routines.

All paths have been checked and the timestamp is identical to the
previous shell variant.

Signed-off-by: Bruce Ashfield <a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield@gmail.com">&lt;bruce.ashfield@gmail.com&gt;</a>
---
 meta/classes/kernel.bbclass | 43 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a3990aaf59..de63e1c0f6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -153,6 +153,21 @@ python do_symlink_kernsrc () {
 }
 addtask symlink_kernsrc before do_configure after do_unpack
 
+def get_kernel_source_date_epoch(d):
+    import subprocess
+
+    s_d_e = d.getVar("SOURCE_DATE_EPOCH")
+    if not s_d_e:
+        s_d_e = subprocess.check_output(['git', '--git-dir=%s/.git' % d.getVar('S'), 'log', '-1', '--pretty=%ct']).decode('utf-8')
+        if not s_d_e:
+            s_d_e = d.getVar("REPRODUCIBLE_TIMESTAMP_ROOTFS")
+
+    env = os.environ.copy()
+    env['LC_ALL'] = 'C'
+    ts = subprocess.check_output(['date', '-d @%s' % s_d_e]).decode('utf-8')
+
+    return ts
+</pre>
    </blockquote>
    <p>Is there something special about the kernel that it can't use the
      SOURCE_DATE_EPOCH guessing code from
      classes/reproducible_build.bbclass? If so, is it possible there is
      some minor change we could make to the code to make it work? It
      seems a little unfortunate to replicate the logic to calculate the
      SDE when that class does it already.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:d09f4c9abf8c9e0ff342c4b5d6323eb371391c63.1589378829.git.bruce.ashfield@gmail.com">
      <pre class="moz-quote-pre" wrap="">
 inherit kernel-arch deploy
 
 PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
@@ -291,19 +306,9 @@ get_cc_option () {
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
-		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
-		# be set....
-		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
-			# The source directory is not necessarily a git repository, so we
-			# specify the git-dir to ensure that git does not query a
-			# repository in any parent directory.
-			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2&gt;/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
-		fi
-
-		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
-		export KBUILD_BUILD_TIMESTAMP="$ts"
+		export KBUILD_BUILD_TIMESTAMP="${@ get_kernel_source_date_epoch(d)}"
 		export KCONFIG_NOTIMESTAMP=1
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
 	fi
 	# The $use_alternate_initrd is only set from
 	# do_bundle_initramfs() This variable is specifically for the
@@ -332,19 +337,9 @@ kernel_do_compile() {
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
-		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
-		# be set....
-		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
-			# The source directory is not necessarily a git repository, so we
-			# specify the git-dir to ensure that git does not query a
-			# repository in any parent directory.
-			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2&gt;/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
-		fi
-
-		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
-		export KBUILD_BUILD_TIMESTAMP="$ts"
+		export KBUILD_BUILD_TIMESTAMP="${@ get_kernel_source_date_epoch(d)}"
 		export KCONFIG_NOTIMESTAMP=1
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		cc_extra=$(get_cc_option)
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------19500C811C266DA8CCACE5F4--
