Return-Path: <scott.branden@broadcom.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A7C3D60E46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 18:36:22 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b17so3904940wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 10:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=V5lnHbg3rDsR7pmNrQ5OZ37XVHXvCe0HTxM49SR2lD8=;
	b=P+OPxy/tKs0o7JeL8+bHxjiiJTxMG/MsIqITyBh0msNHm2EnZ2+FMKMWU1IcY474h+
	sLyOiHAx6uOJDeIFmEnZBM6GMtJBw7VZy2Rhr5xQrJzptzR/oQOU083mOLa6I55p1Pb1
	w9fReP//HGkOOO1clDSmDaDKG3NvuCkUPPFE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=V5lnHbg3rDsR7pmNrQ5OZ37XVHXvCe0HTxM49SR2lD8=;
	b=GcNBtppcB9DVihZnRAjjOm8eHKVVmg59VlsEs4HKWZFdgXenIh4zkc6pYPY5yhSb5C
	anEw3GHWrSwi47xgNOxNfWkRGgUh3arlAGwcyts8c+qe3/yliVZnqxpSWpFPSDC2YryZ
	nEdgwdp1aErhElvAw+cQ7Dq72nuluwf9hhYIpx5Kzgz023ug9FfHjw8sEC0lOc0WGHP8
	IUQUL0byR6iMD8oprifNHiRIQsQeLGFRHF+e/tIGITTXmTtiwQ335I3BUtKPro8+u7uh
	72Wl+0RgnEYpH75OpAHysdTFN9tcIU56FM3cBjEcUGWCMasTgtMtRfAhqwB59eclukqB
	zMbA==
X-Gm-Message-State: APjAAAUWMX9kl5oWde2s3qdVbFfkUMxgFbIlaFp9BYZ8kBBv6dxc3vO/
	StzC3j8uM05OSg40kqBBR6NegR4twyqm/YNXN58wz0xVMBliCkm5AdkzzLt+FI0FwWCMVHBWmdc
	saRDPjWw0xEk25MPAs3AxFWMaudWK/QgPkyctisjhZfYBqaRpz5gg6SFlPH+eLeXUr+5h2aC4Ob
	CXZurVMIPyRa9Tk2IzRp/RZrwR
X-Google-Smtp-Source: APXvYqyrYC5Bb9UWjy+itVcCCFbApWunrlI1uozklsiAE3pO3ET4fUvfjXhj+0yk8hew6xr103X2Fg==
X-Received: by 2002:a1c:6755:: with SMTP id b82mr5386905wmc.127.1581100582820; 
	Fri, 07 Feb 2020 10:36:22 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id t9sm4247801wmj.28.2020.02.07.10.36.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 07 Feb 2020 10:36:22 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200206205743.5388-1-scott.branden@broadcom.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <290a23c4-ec41-18e5-a795-f6e66859fa79@broadcom.com>
Date: Fri, 7 Feb 2020 10:36:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206205743.5388-1-scott.branden@broadcom.com>
Subject: Re: [PATCH] cryptodev: update to Jan.23, 2020
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
X-List-Received-Date: Fri, 07 Feb 2020 18:36:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

cryptodev and perf don't build with the latest 5.5+ kernel in yocto.

Just wondering if I need to do anything else I need to do for this patch 
to be accepted?
Also, I see perf patches in the mailing list and was wondering if there 
were ready to try as well?


On 2020-02-06 12:57 p.m., Scott Branden wrote:
> * Remove backported patches:
>    0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
>
> Update to latest cryptodev dated Jan.23, 2020.
> Fixes build on kernel v5.5+
>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   meta/recipes-kernel/cryptodev/cryptodev.inc   |  3 +-
>   ...x-module-loading-with-Linux-v5.0-rc5.patch | 59 -------------------
>   2 files changed, 1 insertion(+), 61 deletions(-)
>   delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
> index 9d8ba44058..f99f8bc9f0 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -4,9 +4,8 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
>   SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
> -           file://0001-Fix-module-loading-with-Linux-v5.0-rc5.patch \
>              "
> -SRCREV = "fd8b15ef1c8398a69a37932ee48c74ab40329a29"
> +SRCREV = "a87053bee5680878c295b7d23cf0d7065576ac2b"
>   
>   S = "${WORKDIR}/git"
>   
> diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
> deleted file mode 100644
> index 34ec87272f..0000000000
> --- a/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/f971e0c]
> -
> -Backport patch from upstream to fix module cryptodev loading error.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -From f971e0cd4a0ebe59fb2e8e17240399bf6901b09b Mon Sep 17 00:00:00 2001
> -From: "Derald D. Woods" <woods.technical@gmail.com>
> -Date: Sun, 10 Feb 2019 13:22:19 -0600
> -Subject: [PATCH] Fix module loading with Linux v5.0-rc5
> -
> -This commit fixes this module load error:
> -[...]
> -[   29.112091] cryptodev: loading out-of-tree module taints kernel.
> -[   29.128906] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
> -[   29.188842] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
> -modprobe: can't load module cryptodev (extra/cryptodev.ko): unknown symbol in module, or unknown parameter
> -[...]
> -
> -Upstream Linux support for unused GIVCIPHER, and others, was dropped here:
> -
> -c79b411eaa72 (crypto: skcipher - remove remnants of internal IV generators)
> -
> -Signed-off-by: Derald D. Woods <woods.technical@gmail.com>
> ----
> - cryptlib.c | 9 +++++++--
> - 1 file changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/cryptlib.c b/cryptlib.c
> -index 6e66698..4a87037 100644
> ---- a/cryptlib.c
> -+++ b/cryptlib.c
> -@@ -38,7 +38,9 @@
> - #include "cryptodev_int.h"
> - #include "cipherapi.h"
> -
> -+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 0, 0))
> - extern const struct crypto_type crypto_givcipher_type;
> -+#endif
> -
> - static void cryptodev_complete(struct crypto_async_request *req, int err)
> - {
> -@@ -157,8 +159,11 @@ int cryptodev_cipher_init(struct cipher_data *out, const char *alg_name,
> -
> - #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0))
> - 		tfm = crypto_skcipher_tfm(out->async.s);
> --		if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type) ||
> --		    (tfm->__crt_alg->cra_type == &crypto_givcipher_type)) {
> -+		if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type)
> -+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 0, 0))
> -+		    || (tfm->__crt_alg->cra_type == &crypto_givcipher_type)
> -+#endif
> -+							) {
> - 			struct ablkcipher_alg *alg;
> -
> - 			alg = &tfm->__crt_alg->cra_ablkcipher;
> ---
> -2.20.0
> -


