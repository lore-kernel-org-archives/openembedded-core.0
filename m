Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.6420.1587574462628794864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 09:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mjLmz6qG;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id s10so1181093plr.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=ttCZz7IobQYcJg0BetwmkgMER3S4wt/6Y7CY8RdZ9bc=;
        b=mjLmz6qGKmO5AAecWa2v8nBbZgNppwEAmTJbBpArF59MUCdUW3p2MTPdzTco5EGOrG
         AVXPutCiq9x9Ye1BkWebVHDZPC3mje1xW1XwK1Z66YfW/sR0IplSDDECLVCO7LTedzSg
         xk8hi4NZNeCR39iXct3uVzNWbptr7p6fTjIGXQBxCOOT1OOxkFJsVrPrU3XGQJcanunv
         KMOqscwsqsi2S/Q9ZNIrqyJnQVBxhP8KK7Ye4ZJb7I3/0hpmG57z/hu02QSt/0Fm/ngO
         n32+8hjNhLDcg7upsHkPxA9VQrw4dHOQGkr22n8Tgo6JspnLUuecpBSZQxIOe+3X1GWI
         xrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=ttCZz7IobQYcJg0BetwmkgMER3S4wt/6Y7CY8RdZ9bc=;
        b=NWf9pTeRprhm//DebP2qQ4jVfwnsBu6NFYFcojPNIlCk8MRLBhaTxF9mph75SA6DLO
         umCbf99dHbQ3vOCojjSOa0jS0DuQv78lNYqu/3dxgNXXkNpILKG1MqRjwLJmP2PGowt+
         UwgbZXOQl33oiC68rxHyqi9UYJHfluc1bTKm4b0ZznA0Wu6/39ZR3iJsCgTxTwLwIVCe
         h3QRiYVhaFhNQBnR3x4Wcx3RZA6MOx6NY1uKbHWwvT8UmVL3OGlH075frQTdPos8Aq/5
         oBZbEevpPac7kF628nHt3fe89utpYSGqWIH72JiTctK59UmXzV8kfMlZKDgFVgaT53MW
         ysDQ==
X-Gm-Message-State: AGi0PubW8+o95hSCSBCFpl0FzlPrf8zTE+0CK/55PvFVgSWd96NQTGlE
	sEnlOKGIMfGOG53UOu3PuEs=
X-Google-Smtp-Source: APiQypJmA7I5xRQP4Fy5yGrY2zI5yeBGJzV7dPc4lfIXSepR8hgIFCLso++7x6mtJ/8C57SLu7hy8g==
X-Received: by 2002:a17:90a:d101:: with SMTP id l1mr12923615pju.1.1587574461738;
        Wed, 22 Apr 2020 09:54:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:503a:d0d7:51f9:c1bb? ([2601:202:4180:a5c0:503a:d0d7:51f9:c1bb])
        by smtp.gmail.com with ESMTPSA id 62sm6085173pfu.181.2020.04.22.09.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 09:54:21 -0700 (PDT)
Subject: Re: [OE-core] [zeus][PATCH] qemu: Replace stime() API with clock_settime
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200422143824.2634423-1-Martin.Jansa@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <21d8e101-e86a-0c23-4c5c-13464d26bd82@gmail.com>
Date: Wed, 22 Apr 2020 09:54:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422143824.2634423-1-Martin.Jansa@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------DA5597A0109F51F9F3DC6790"
Content-Language: en-US

--------------DA5597A0109F51F9F3DC6790
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 4/22/20 7:38 AM, Martin Jansa wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  ...linux-user-remove-host-stime-syscall.patch | 61 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index f451017f6d..ad4ff52892 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>             file://0009-Fix-webkitgtk-builds.patch \
>             file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
> +           file://0011-linux-user-remove-host-stime-syscall.patch \
>             file://CVE-2019-15890.patch \
>             file://CVE-2019-12068.patch \
>             file://CVE-2020-1711.patch \
> diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
> new file mode 100644
> index 0000000000..659e6be45d
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
> @@ -0,0 +1,61 @@
> +From 0f1f2d4596aee037d3ccbcf10592466daa54107f Mon Sep 17 00:00:00 2001
> +From: Laurent Vivier <laurent@vivier.eu>
> +Date: Tue, 12 Nov 2019 15:25:56 +0100
> +Subject: [PATCH] linux-user: remove host stime() syscall
> +
> +stime() has been withdrawn from glibc
> +(12cbde1dae6f "Use clock_settime to implement stime; withdraw stime.")
> +
> +Implement the target stime() syscall using host
> +clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc.
> +
> +Tested qemu-ppc/x86_64 with:
> +
> +	#include <time.h>
> +	#include <stdio.h>
> +
> +	int main(void)
> +	{
> +		time_t t;
> +		int ret;
> +
> +		/* date -u -d"2019-11-12T15:11:00" "+%s" */
> +		t = 1573571460;
> +		ret = stime(&t);
> +		printf("ret %d\n", ret);
> +		return 0;
> +	}
> +
> +        # date; ./stime; date
> +        Tue Nov 12 14:18:32 UTC 2019
> +        ret 0
> +        Tue Nov 12 15:11:00 UTC 2019
> +
> +Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=0f1f2d4596aee037d3ccbcf10592466daa54107f]
> +Buglink: https://bugs.launchpad.net/qemu/+bug/1852115
> +Reported-by: Cole Robinson <crobinso@redhat.com>
> +Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> +Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> +Message-Id: <20191112142556.6335-1-laurent@vivier.eu>
Who signed this patch off?

- armin
> +---
> + linux-user/syscall.c | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +--- a/linux-user/syscall.c
> ++++ b/linux-user/syscall.c
> +@@ -7651,10 +7651,12 @@ static abi_long do_syscall1(void *cpu_en
> + #ifdef TARGET_NR_stime /* not on alpha */
> +     case TARGET_NR_stime:
> +         {
> +-            time_t host_time;
> +-            if (get_user_sal(host_time, arg1))
> ++            struct timespec ts;
> ++            ts.tv_nsec = 0;
> ++            if (get_user_sal(ts.tv_sec, arg1)) {
> +                 return -TARGET_EFAULT;
> +-            return get_errno(stime(&host_time));
> ++            }
> ++            return get_errno(clock_settime(CLOCK_REALTIME, &ts));
> +         }
> + #endif
> + #ifdef TARGET_NR_alarm /* not on alpha */
>
> 


--------------DA5597A0109F51F9F3DC6790
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/22/20 7:38 AM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200422143824.2634423-1-Martin.Jansa@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...linux-user-remove-host-stime-syscall.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f451017f6d..ad4ff52892 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,7 @@ SRC_URI = "<a class="moz-txt-link-freetext" href="https://download.qemu.org/$">https://download.qemu.org/$</a>{BPN}-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch">file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0009-Fix-webkitgtk-builds.patch">file://0009-Fix-webkitgtk-builds.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch">file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0011-linux-user-remove-host-stime-syscall.patch">file://0011-linux-user-remove-host-stime-syscall.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2019-15890.patch">file://CVE-2019-15890.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2019-12068.patch">file://CVE-2019-12068.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2020-1711.patch">file://CVE-2020-1711.patch</a> \
diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
new file mode 100644
index 0000000000..659e6be45d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
@@ -0,0 +1,61 @@
+From 0f1f2d4596aee037d3ccbcf10592466daa54107f Mon Sep 17 00:00:00 2001
+From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:laurent@vivier.eu">&lt;laurent@vivier.eu&gt;</a>
+Date: Tue, 12 Nov 2019 15:25:56 +0100
+Subject: [PATCH] linux-user: remove host stime() syscall
+
+stime() has been withdrawn from glibc
+(12cbde1dae6f "Use clock_settime to implement stime; withdraw stime.")
+
+Implement the target stime() syscall using host
+clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc.
+
+Tested qemu-ppc/x86_64 with:
+
+	#include &lt;time.h&gt;
+	#include &lt;stdio.h&gt;
+
+	int main(void)
+	{
+		time_t t;
+		int ret;
+
+		/* date -u -d"2019-11-12T15:11:00" "+%s" */
+		t = 1573571460;
+		ret = stime(&amp;t);
+		printf("ret %d\n", ret);
+		return 0;
+	}
+
+        # date; ./stime; date
+        Tue Nov 12 14:18:32 UTC 2019
+        ret 0
+        Tue Nov 12 15:11:00 UTC 2019
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://git.qemu.org/?p=qemu.git;a=commit;h=0f1f2d4596aee037d3ccbcf10592466daa54107f">https://git.qemu.org/?p=qemu.git;a=commit;h=0f1f2d4596aee037d3ccbcf10592466daa54107f</a>]
+Buglink: <a class="moz-txt-link-freetext" href="https://bugs.launchpad.net/qemu/+bug/1852115">https://bugs.launchpad.net/qemu/+bug/1852115</a>
+Reported-by: Cole Robinson <a class="moz-txt-link-rfc2396E" href="mailto:crobinso@redhat.com">&lt;crobinso@redhat.com&gt;</a>
+Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:laurent@vivier.eu">&lt;laurent@vivier.eu&gt;</a>
+Reviewed-by: Peter Maydell <a class="moz-txt-link-rfc2396E" href="mailto:peter.maydell@linaro.org">&lt;peter.maydell@linaro.org&gt;</a>
+Message-Id: <a class="moz-txt-link-rfc2396E" href="mailto:20191112142556.6335-1-laurent@vivier.eu">&lt;20191112142556.6335-1-laurent@vivier.eu&gt;</a></pre>
    </blockquote>
    Who signed this patch off?<br>
    <br>
    - armin<br>
    <blockquote type="cite"
      cite="mid:20200422143824.2634423-1-Martin.Jansa@gmail.com">
      <pre class="moz-quote-pre" wrap="">
+---
+ linux-user/syscall.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -7651,10 +7651,12 @@ static abi_long do_syscall1(void *cpu_en
+ #ifdef TARGET_NR_stime /* not on alpha */
+     case TARGET_NR_stime:
+         {
+-            time_t host_time;
+-            if (get_user_sal(host_time, arg1))
++            struct timespec ts;
++            ts.tv_nsec = 0;
++            if (get_user_sal(ts.tv_sec, arg1)) {
+                 return -TARGET_EFAULT;
+-            return get_errno(stime(&amp;host_time));
++            }
++            return get_errno(clock_settime(CLOCK_REALTIME, &amp;ts));
+         }
+ #endif
+ #ifdef TARGET_NR_alarm /* not on alpha */
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------DA5597A0109F51F9F3DC6790--
