Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 48A237D68C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 04:56:05 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w22so5174442pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 21:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jVu7m6HogFRTb6rWtjQs9q69/cBTk1CdXVkZjCIIMJU=;
	b=XI79nYvFG/3HRxZpC9UjIm3M58VrLOTRGtg3p3Aua3RBYORRqiuobLBLlFJkJ7oQB7
	LKOJq+RvfI7a/Xvkq9/fcVCbS4v46ZZXIsS4SfI9dKiLFLlIME7kmYPeA4GXhSodG6vb
	YJn49VWQIP3a448SunDN6BDndIb9tTKz1YfFap8PXiyWBV8HyJfGOYvoIHTi0WvCbyos
	A0drjiURuzcY/qUjr7QYMbtPFws+fInZ6Ic7C5kXWFFyrkR7agogW6oD5DQ95g/wl3wE
	IIfMp1K3Psho2G8hcOXfAdXIBNFrYlT2b+LLvHecikJ9c/sjtkETYTEh4WoSh9Lra4K/
	B0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jVu7m6HogFRTb6rWtjQs9q69/cBTk1CdXVkZjCIIMJU=;
	b=V2jtBbZMcBOkDhrzIg3cipTnxUtarq59bmNr5teDviyEpD4EOcD430VGQfSIPu/Hgl
	eAZXC73yvCIc27cHUOj4EJIN3v68dhrqFeB6deiXbgXZXrKNDBPzxBqADMFjtVM8Gj/H
	rDX6AhyDp2ffKpL7fqg4QayaRVax11vhfdppYMiZTLcmt+xzO7P5Yb/EWqB2b/46XxeW
	Vr7qwafRHwOLBCol1i9DpILT4RD7zzrBLUxghC9q2Bekzgcv+JsKWr67dy9avgoHU1vq
	9SZW7ev+Rezvm0MCh4iMlme7xfyigl0M9JiU0A/gU8HmnDwbIeAPQatQLBYdEUgGYPRm
	qDNw==
X-Gm-Message-State: APjAAAXfVW1WPDvGbELiK+7txBWatsfKUhXYilsQD5GN8JVMb9iBUGKQ
	TGxdWjNIR5Z5uzaAzHVzNW/l1GVbJCE=
X-Google-Smtp-Source: APXvYqxDN6wRRpE06sh91Fs2TBGYU71DWDCIGsRbCqg5fjEFBXiwr7BPc+tJDvgO34HMASRf68MgQA==
X-Received: by 2002:a63:1460:: with SMTP id 32mr68249465pgu.319.1558241765954; 
	Sat, 18 May 2019 21:56:05 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:2991:b26a:5bdc:753c])
	by smtp.gmail.com with ESMTPSA id
	p64sm19967722pfp.72.2019.05.18.21.56.04
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 21:56:05 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190518172136.11368-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c5b0bf78-e579-4f77-c4f2-b16e9ee49eda@gmail.com>
Date: Sat, 18 May 2019 21:56:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190518172136.11368-1-bunk@stusta.de>
Subject: Re: [PATCH] libnss-mdns: Stop trying to build for musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 May 2019 04:56:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/18/19 10:21 AM, Adrian Bunk wrote:
> There's no point in building an NSS module for a C library
> that doesn't support NSS.
> 

Fundamentally this change looks ok however
have you tried using avahi after this change ?

> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   .../libnss-mdns/0001-check-for-nss.h.patch    | 56 -------------------
>   .../libnss-mdns/libnss-mdns_0.10.bb           |  3 +-
>   2 files changed, 2 insertions(+), 57 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch
> 
> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch b/meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch
> deleted file mode 100644
> index f63eb90cdc..0000000000
> --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From bdf01a581d58eb5340e9238d143dbcac9db5b11c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 30 Jan 2016 19:29:45 +0000
> -Subject: [PATCH] check for nss.h
> -
> -nss.h may not available on all libc implementations, e.g. musl does not
> -have this header, this patch detects nss.h presence and defines the data
> -types that are required if nss.h is missing on platform
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - configure.ac |  2 +-
> - src/nss.c    | 11 +++++++++++
> - 2 files changed, 12 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index aa66bc6..ce19b07 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -71,7 +71,7 @@ AC_PROG_LIBTOOL
> -
> - # Checks for header files.
> - AC_HEADER_STDC
> --AC_CHECK_HEADERS([arpa/inet.h fcntl.h inttypes.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h nss.h sys/ioctl.h])
> -+AC_CHECK_HEADERS([arpa/inet.h fcntl.h inttypes.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h nss.h sys/ioctl.h nss.h])
> -
> - # Checks for typedefs, structures, and compiler characteristics.
> - AC_C_CONST
> -diff --git a/src/nss.c b/src/nss.c
> -index e48e315..406733b 100644
> ---- a/src/nss.c
> -+++ b/src/nss.c
> -@@ -29,7 +29,18 @@
> - #include <assert.h>
> - #include <netdb.h>
> - #include <sys/socket.h>
> -+#ifdef HAVE_NSS_H
> - #include <nss.h>
> -+#else
> -+enum nss_status {
> -+    NSS_STATUS_TRYAGAIN = -2,
> -+    NSS_STATUS_UNAVAIL,
> -+    NSS_STATUS_NOTFOUND,
> -+    NSS_STATUS_SUCCESS,
> -+    NSS_STATUS_RETURN
> -+};
> -+#endif
> -+
> - #include <stdio.h>
> - #include <stdlib.h>
> -
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> index d0eb2768d1..953505971a 100644
> --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> +++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> @@ -9,7 +9,6 @@ DEPENDS = "avahi"
>   PR = "r7"
>   
>   SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz \
> -           file://0001-check-for-nss.h.patch \
>              "
>   
>   SRC_URI[md5sum] = "03938f17646efbb50aa70ba5f99f51d7"
> @@ -21,6 +20,8 @@ localstatedir = "/"
>   
>   inherit autotools
>   
> +COMPATIBLE_HOST_libc-musl = 'null'
> +
>   EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
>   
>   # suppress warning, but don't bother with autonamer
> 

