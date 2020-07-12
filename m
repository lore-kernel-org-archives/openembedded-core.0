Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.2543.1594522990319128530
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2020 20:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EsuLwWQ+;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id l63so4469345pge.12
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2020 20:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=HaLkn6Ga0IxR3H6d7DtpiBWCRuNvHQQr5XWpzIsOQ6Y=;
        b=EsuLwWQ+v+3Y5gxqG+AHABbndbsrN05Ytv/8uPgDkyPc/n7THkuflm00gdCi31LKjG
         lqKMiGQ/aheQndHIDupJlSbN3KtreGm827OC20WB3nG/80xpRajn/i7Hw3gMg2d1BeSU
         Me1da1+ulNZWf+4ikf4KcXiH/+tXnh4KJHYAL0BCp3WcOrW9OD+Fs6uc73N3C1jnc4P1
         RbdvnUpRFKMqJwQQunXVMLuQ6gbv2EvOmRXdzqn7tjT9PJPmw7H78x13MfiTpaJlUHWm
         0o60rvbden35dhkbiq8aEtkC+1KsWQJMS1pt0kcbkK+Qc0EjmG38xre+oejk89Wd/3Jg
         49LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=HaLkn6Ga0IxR3H6d7DtpiBWCRuNvHQQr5XWpzIsOQ6Y=;
        b=YSwEpWHB7nMNoDsMba1MC0SnV3cx6Sw2Tu/zfHPusor/RQKhZ4dFPEDCIRXRw2HFqM
         37d6bqzE5LAK5l1V0hY9HwXKhMeDOupYI0VOG9YXGdITn5w1KiPU9yKyeXg6GQlRbjCA
         2bN7+Do8PtGesOGuT13UxzMXPEUT/ZIe/tXEfYhnfrUTtp/rmOmfzAz/oTIFwNOUzp3f
         Q3ctr+jRC3uwFhUUeMoozU/vIInH9vzIKZN4EUpRHENfgvoA+mg118bGoPTy/q9BSeJ7
         ovGI7hV8gx5vi+668YFuxhekhkW+X69Z685RU8ftn0D+z/PKbfZTONh1JNL+1Gh3TlwU
         LPTw==
X-Gm-Message-State: AOAM531DyFG2R6fRTQANkGD1jvwmk05lnvJ63KyGjDkxGXTZzzjq5Nb3
	OEi590lEzXwb2d0zsRek9UAdX8/Sat8=
X-Google-Smtp-Source: ABdhPJwpN+aJbbK9YnfcuDfjON9e5NTURgDfOkeGR6QSykcXj5POZuIPkQ4Xzs1o54cDPZUKFwaTEQ==
X-Received: by 2002:a62:cfc2:: with SMTP id b185mr34377139pfg.125.1594522989577;
        Sat, 11 Jul 2020 20:03:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:94e8:27ac:fdd9:c160? ([2601:202:4180:a5c0:94e8:27ac:fdd9:c160])
        by smtp.gmail.com with ESMTPSA id 198sm10829965pfb.27.2020.07.11.20.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2020 20:03:08 -0700 (PDT)
Subject: Re: [OE-core] [dunfell][PATCH] busybox: Security Fix For CVE-2018-1000500
To: Rahul Kumar <rahulk@mvista.com>, openembedded-core@lists.openembedded.org
References: <1594516895-5308-1-git-send-email-rahulk@mvista.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <4c77a3e7-e9f4-d122-1f84-8405cabc4d92@gmail.com>
Date: Sat, 11 Jul 2020 20:03:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594516895-5308-1-git-send-email-rahulk@mvista.com>
Content-Type: multipart/alternative;
 boundary="------------F39A871220EC131A118BF109"
Content-Language: en-US

--------------F39A871220EC131A118BF109
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 7/11/20 6:21 PM, Rahul Kumar wrote:
> CVE: CVE-2018-1000500
>
> Signed-off-by: Rahul Kumar <rahulk@mvista.com>

Does this affect master?

-armin
> ---
>  .../busybox/busybox/busybox-CVE-2018-1000500.patch | 98 ++++++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.31.1.bb        |  1 +
>  2 files changed, 99 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
> new file mode 100644
> index 0000000..cde3923
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
> @@ -0,0 +1,98 @@
> +From 71e7e2fb35c806d20f9739d832cd9ae3a86fdee2 Mon Sep 17 00:00:00 2001
> +From: Dimitri John Ledkov <xnox@ubuntu.com>
> +Date: Tue, 19 May 2020 18:20:39 +0100
> +Subject: [PATCH] wget: implement TLS verification with
> + ENABLE_FEATURE_WGET_OPENSSL
> +
> +When ENABLE_FEATURE_WGET_OPENSSL is enabled, correctly implement TLS
> +verification by default. And only ignore verification errors, if
> +--no-check-certificate was passed.
> +
> +Also note, that previously OPENSSL implementation did not implement
> +TLS verification, nor printed any warning messages that verification
> +was not performed.
> +
> +Bug-Ubuntu: https://bugs.launchpad.net/bugs/1879533
> +
> +CVE-2018-1000500
> +
> +Upstream Status: Backport https://git.busybox.net/busybox/commit/?id=45fa3f18adf57ef9d743038743d9c90573aeeb91
> +CVE: CVE-2018-1000500
> +
> +Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> +---
> + networking/wget.c | 20 +++++++++++++++++---
> + 1 file changed, 17 insertions(+), 3 deletions(-)
> +
> +diff --git a/networking/wget.c b/networking/wget.c
> +index 9153264..a7e6deb 100644
> +--- a/networking/wget.c
> ++++ b/networking/wget.c
> +@@ -91,6 +91,9 @@
> + //config:	patches, but do want to waste bandwidth expaining how wrong
> + //config:	it is, you will be ignored.
> + //config:
> ++//config:	FEATURE_WGET_OPENSSL does implement TLS verification
> ++//config:	using the certificates available to OpenSSL.
> ++//config:
> + //config:config FEATURE_WGET_OPENSSL
> + //config:	bool "Try to connect to HTTPS using openssl"
> + //config:	default y
> +@@ -115,6 +118,9 @@
> + //config:	If openssl can't be executed, internal TLS code will be used
> + //config:	(if you enabled it); if openssl can be executed but fails later,
> + //config:	wget can't detect this, and download will fail.
> ++//config:
> ++//config:	By default TLS verification is performed, unless
> ++//config:	--no-check-certificate option is passed.
> + 
> + //applet:IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
> + 
> +@@ -124,8 +130,11 @@
> + //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
> + //usage:       "[-c|--continue] [--spider] [-q|--quiet] [-O|--output-document FILE]\n"
> + //usage:       "	[-o|--output-file FILE] [--header 'header: value'] [-Y|--proxy on/off]\n"
> ++//usage:	IF_FEATURE_WGET_OPENSSL(
> ++//usage:       "	[--no-check-certificate]\n"
> ++//usage:	)
> + /* Since we ignore these opts, we don't show them in --help */
> +-/* //usage:    "	[--no-check-certificate] [--no-cache] [--passive-ftp] [-t TRIES]" */
> ++/* //usage:    "	[--no-cache] [--passive-ftp] [-t TRIES]" */
> + /* //usage:    "	[-nv] [-nc] [-nH] [-np]" */
> + //usage:       "	[-P DIR] [-S|--server-response] [-U|--user-agent AGENT]" IF_FEATURE_WGET_TIMEOUT(" [-T SEC]") " URL..."
> + //usage:	)
> +@@ -137,7 +146,9 @@
> + //usage:       "Retrieve files via HTTP or FTP\n"
> + //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
> + //usage:     "\n	--spider	Only check URL existence: $? is 0 if exists"
> +-///////:     "\n	--no-check-certificate	Don't validate the server's certificate"
> ++//usage:	IF_FEATURE_WGET_OPENSSL(
> ++//usage:     "\n	--no-check-certificate	Don't validate the server's certificate"
> ++//usage:	)
> + //usage:	)
> + //usage:     "\n	-c		Continue retrieval of aborted transfer"
> + //usage:     "\n	-q		Quiet"
> +@@ -662,7 +673,7 @@ static int spawn_https_helper_openssl(const char *host, unsigned port)
> + 	pid = xvfork();
> + 	if (pid == 0) {
> + 		/* Child */
> +-		char *argv[8];
> ++		char *argv[9];
> + 
> + 		close(sp[0]);
> + 		xmove_fd(sp[1], 0);
> +@@ -689,6 +700,9 @@ static int spawn_https_helper_openssl(const char *host, unsigned port)
> + 			argv[5] = (char*)"-servername";
> + 			argv[6] = (char*)servername;
> + 		}
> ++		if (!(option_mask32 & WGET_OPT_NO_CHECK_CERT)) {
> ++			argv[7] = (char*)"-verify_return_error";
> ++		}
> + 
> + 		BB_EXECVP(argv[0], argv);
> + 		xmove_fd(3, 2);
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
> index 2bb1d59..a6b4702 100644
> --- a/meta/recipes-core/busybox/busybox_1.31.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
> @@ -48,6 +48,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch \
>             file://0001-Remove-stime-function-calls.patch \
>             file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
> +           file://busybox-CVE-2018-1000500.patch \
>  "
>  SRC_URI_append_libc-musl = " file://musl.cfg "
>  
>
> 


--------------F39A871220EC131A118BF109
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/11/20 6:21 PM, Rahul Kumar wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1594516895-5308-1-git-send-email-rahulk@mvista.com">
      <pre class="moz-quote-pre" wrap="">CVE: CVE-2018-1000500

Signed-off-by: Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:rahulk@mvista.com">&lt;rahulk@mvista.com&gt;</a></pre>
    </blockquote>
    <br>
    Does this affect master?<br>
    <br>
    -armin<br>
    <blockquote type="cite"
      cite="mid:1594516895-5308-1-git-send-email-rahulk@mvista.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../busybox/busybox/busybox-CVE-2018-1000500.patch | 98 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb        |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
new file mode 100644
index 0000000..cde3923
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
@@ -0,0 +1,98 @@
+From 71e7e2fb35c806d20f9739d832cd9ae3a86fdee2 Mon Sep 17 00:00:00 2001
+From: Dimitri John Ledkov <a class="moz-txt-link-rfc2396E" href="mailto:xnox@ubuntu.com">&lt;xnox@ubuntu.com&gt;</a>
+Date: Tue, 19 May 2020 18:20:39 +0100
+Subject: [PATCH] wget: implement TLS verification with
+ ENABLE_FEATURE_WGET_OPENSSL
+
+When ENABLE_FEATURE_WGET_OPENSSL is enabled, correctly implement TLS
+verification by default. And only ignore verification errors, if
+--no-check-certificate was passed.
+
+Also note, that previously OPENSSL implementation did not implement
+TLS verification, nor printed any warning messages that verification
+was not performed.
+
+Bug-Ubuntu: <a class="moz-txt-link-freetext" href="https://bugs.launchpad.net/bugs/1879533">https://bugs.launchpad.net/bugs/1879533</a>
+
+CVE-2018-1000500
+
+Upstream Status: Backport <a class="moz-txt-link-freetext" href="https://git.busybox.net/busybox/commit/?id=45fa3f18adf57ef9d743038743d9c90573aeeb91">https://git.busybox.net/busybox/commit/?id=45fa3f18adf57ef9d743038743d9c90573aeeb91</a>
+CVE: CVE-2018-1000500
+
+Signed-off-by: Dimitri John Ledkov <a class="moz-txt-link-rfc2396E" href="mailto:xnox@ubuntu.com">&lt;xnox@ubuntu.com&gt;</a>
+Signed-off-by: Denys Vlasenko <a class="moz-txt-link-rfc2396E" href="mailto:vda.linux@googlemail.com">&lt;vda.linux@googlemail.com&gt;</a>
+Signed-off-by: Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:rahulk@mvista.com">&lt;rahulk@mvista.com&gt;</a>
+---
+ networking/wget.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index 9153264..a7e6deb 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -91,6 +91,9 @@
+ //config:	patches, but do want to waste bandwidth expaining how wrong
+ //config:	it is, you will be ignored.
+ //config:
++//config:	FEATURE_WGET_OPENSSL does implement TLS verification
++//config:	using the certificates available to OpenSSL.
++//config:
+ //config:config FEATURE_WGET_OPENSSL
+ //config:	bool "Try to connect to HTTPS using openssl"
+ //config:	default y
+@@ -115,6 +118,9 @@
+ //config:	If openssl can't be executed, internal TLS code will be used
+ //config:	(if you enabled it); if openssl can be executed but fails later,
+ //config:	wget can't detect this, and download will fail.
++//config:
++//config:	By default TLS verification is performed, unless
++//config:	--no-check-certificate option is passed.
+ 
+ //applet:IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
+ 
+@@ -124,8 +130,11 @@
+ //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
+ //usage:       "[-c|--continue] [--spider] [-q|--quiet] [-O|--output-document FILE]\n"
+ //usage:       "	[-o|--output-file FILE] [--header 'header: value'] [-Y|--proxy on/off]\n"
++//usage:	IF_FEATURE_WGET_OPENSSL(
++//usage:       "	[--no-check-certificate]\n"
++//usage:	)
+ /* Since we ignore these opts, we don't show them in --help */
+-/* //usage:    "	[--no-check-certificate] [--no-cache] [--passive-ftp] [-t TRIES]" */
++/* //usage:    "	[--no-cache] [--passive-ftp] [-t TRIES]" */
+ /* //usage:    "	[-nv] [-nc] [-nH] [-np]" */
+ //usage:       "	[-P DIR] [-S|--server-response] [-U|--user-agent AGENT]" IF_FEATURE_WGET_TIMEOUT(" [-T SEC]") " URL..."
+ //usage:	)
+@@ -137,7 +146,9 @@
+ //usage:       "Retrieve files via HTTP or FTP\n"
+ //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
+ //usage:     "\n	--spider	Only check URL existence: $? is 0 if exists"
+-///////:     "\n	--no-check-certificate	Don't validate the server's certificate"
++//usage:	IF_FEATURE_WGET_OPENSSL(
++//usage:     "\n	--no-check-certificate	Don't validate the server's certificate"
++//usage:	)
+ //usage:	)
+ //usage:     "\n	-c		Continue retrieval of aborted transfer"
+ //usage:     "\n	-q		Quiet"
+@@ -662,7 +673,7 @@ static int spawn_https_helper_openssl(const char *host, unsigned port)
+ 	pid = xvfork();
+ 	if (pid == 0) {
+ 		/* Child */
+-		char *argv[8];
++		char *argv[9];
+ 
+ 		close(sp[0]);
+ 		xmove_fd(sp[1], 0);
+@@ -689,6 +700,9 @@ static int spawn_https_helper_openssl(const char *host, unsigned port)
+ 			argv[5] = (char*)"-servername";
+ 			argv[6] = (char*)servername;
+ 		}
++		if (!(option_mask32 &amp; WGET_OPT_NO_CHECK_CERT)) {
++			argv[7] = (char*)"-verify_return_error";
++		}
+ 
+ 		BB_EXECVP(argv[0], argv);
+ 		xmove_fd(3, 2);
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 2bb1d59..a6b4702 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -48,6 +48,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball\file://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch\file://0001-Remove-stime-function-calls.patch\file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch\+file://busybox-CVE-2018-1000500.patch\">"https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch \
            file://0001-Remove-stime-function-calls.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
+           file://busybox-CVE-2018-1000500.patch \
 "</a>
 SRC_URI_append_libc-musl = <a class="moz-txt-link-rfc2396E" href="file://musl.cfg">" file://musl.cfg "</a>
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F39A871220EC131A118BF109--
