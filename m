Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2298A6B5C5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2019 14:06:00 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t132so47240935pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2019 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=fKXURtePO5nSjfzQeKlkaZ3h4jZALTPq1DXdrcPPz/8=;
	b=dOdx1A64ta9GNYHxlj11amNmwSrXdS/dA+RyZtbhEEk1q2oXKmy2F+cLWM7uv5sTnq
	tN/h3M0mQ/7F59ZtlmfW09FHqF0OrQxOJoNe4uw8+Yt0uz9zumUoGg5p6XonzMDNYVZt
	zM33HbGK/hVw1UM7+d21JkGVrV6o5aHKs2wMCmcBf4zt9IN5TkE/bQQ9SbhwPWyYCocx
	tES675gRhg9D3BGRvz2qZhrL2lVBzq18q44duaQaqSc5WNAfGSAJ+LWfzR/1aJpnuG/B
	UjD+/u7QEYc9inwR/72KgeJr9XVtgLZj5qqiyXJ5SvLPb0j7GMtIfg2T4BpCCz7tST+X
	w18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=fKXURtePO5nSjfzQeKlkaZ3h4jZALTPq1DXdrcPPz/8=;
	b=swd1aMp1Ql8SI/bAhPdF9sn6KZRsj+/3gHWSsxsJ7qPnGVunowc+r1B/3rydinKxLQ
	xEjtTujCZVdKiBOnp2OlSs/p2yJymGIkEl3qkUKWIl8JBtWVjhD6Qk6YaiZ2/HZS5qsh
	1XZeRRBTe+7UT5b605q6jMLE+zSS5R5UPLbxUZzmZhjzgeUUS9IzSvr9R+3FmFsSe3oL
	fYc5ym/1r1CIouAsUB3pKKaEXJ3vV/5CE6IwXF8gg/JqKhfBVNB258eFunkWd60BAZoe
	IERRubHcoO175BkNmT8OJLNICfz1Y9TkbxsB7WKMTVRGo89lFW1uaNMTsbmBos2+Dr3Q
	xAeA==
X-Gm-Message-State: APjAAAWw3VN3myJnO7OjPKnURShHykV+vI2j80MVUYethR8WfpffJjCm
	8MgrJKHi5UysRqc1r7Ln1lYrpaN3
X-Google-Smtp-Source: APXvYqz1WiIj2QIQr9fvqy1NPsNZXA8mUb1JGAHeXLT+/bE9Gh+nvYpICtPk9Mw4clbNlyxKOqHiJg==
X-Received: by 2002:a62:1515:: with SMTP id 21mr10517216pfv.81.1565445960808; 
	Sat, 10 Aug 2019 07:06:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:cd6e:8130:b233:452a?
	([2601:202:4180:c33:cd6e:8130:b233:452a])
	by smtp.gmail.com with ESMTPSA id
	l31sm146035851pgm.63.2019.08.10.07.05.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Aug 2019 07:05:59 -0700 (PDT)
To: Naveen Saini <naveen.kumar.saini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190729074154.26755-1-naveen.kumar.saini@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <310dd611-62f9-673b-bd1b-3aee8d5335ba@gmail.com>
Date: Sat, 10 Aug 2019 07:05:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729074154.26755-1-naveen.kumar.saini@intel.com>
Subject: Re: [warrior][PATCH] qemu: fix CVE-2018-20815
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
X-List-Received-Date: Sat, 10 Aug 2019 14:06:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/29/19 12:41 AM, Naveen Saini wrote:
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2018-20815.patch            | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)

This is causing build failures, see
https://errors.yoctoproject.org/Errors/Details/260333/

on a multitude of targets: qemuarm64, beaglebone, musl-qemux86-64,
qemumip64

- armin


>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index e503aa866d..4f21bae99c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://0018-fix-CVE-2018-20191.patch \
>             file://0019-fix-CVE-2018-20216.patch \
>             file://CVE-2019-3812.patch \
> +           file://CVE-2018-20815.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
> new file mode 100644
> index 0000000000..f1fcaaf56d
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
> @@ -0,0 +1,39 @@
> +From 8bb018af1a7f2b9965f872a4b1121864e73e1b61 Mon Sep 17 00:00:00 2001
> +From: Peter Maydell <peter.maydell@linaro.org>
> +Date: Fri, 14 Dec 2018 13:30:52 +0000
> +Subject: [PATCH] device_tree.c: Don't use load_image()
> +
> +The load_image() function is deprecated, as it does not let the
> +caller specify how large the buffer to read the file into is.
> +Instead use load_image_size().
> +
> +Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> +Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> +Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> +Reviewed-by: Eric Blake <eblake@redhat.com>
> +Message-id: 20181130151712.2312-9-peter.maydell@linaro.org
> +
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/da885fe1ee8b4589047484bd7fa05a4905b52b17]
> +CVE: CVE-2018-20815
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + device_tree.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/device_tree.c b/device_tree.c
> +index 6d9c9726f6..296278e12a 100644
> +--- a/device_tree.c
> ++++ b/device_tree.c
> +@@ -91,7 +91,7 @@ void *load_device_tree(const char *filename_path, int *sizep)
> +     /* First allocate space in qemu for device tree */
> +     fdt = g_malloc0(dt_size);
> + 
> +-    dt_file_load_size = load_image(filename_path, fdt);
> ++    dt_file_load_size = load_image_size(filename_path, fdt, dt_size);
> +     if (dt_file_load_size < 0) {
> +         error_report("Unable to open device tree file '%s'",
> +                      filename_path);
> +-- 
> +2.17.1
> +


