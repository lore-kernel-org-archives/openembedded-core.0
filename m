Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9A674596
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 05:48:34 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id u11-v6so6848465plq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 22:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UE0pchkOuc/En0yC8FvbramYxWSvpF+dOU8m1Poqh5g=;
	b=iYsU2+odEz0fsIltuYgJ5MhzQm4SNWV4mwfoAB29Cobl0tiUbU5OxzoeNwRcQBm4Ij
	bEX/e3qmwRJGPkRGht5po3SijLHlVLavLYECXhUcUaLOgVgBxZRXN10jfb3Yf47Oq4jO
	oU+SFG76Y73jd6dcdLKtolSz//xCt79usM3ejtYifZGVmf5Ei3lsDm4SiXC54+lmLiH6
	eKe7Mw3dZJ6uk4bG0xjjfWh08u5p175k5eQB81C0+XE9/edQYpSrH/4Jvbz/knlWvAyF
	1abfY0IBC7G6LdLdz77WkXBDi0w9CmP/4GuIi/hO6fKj8L1wBXhX1iIUzVwbWvEIByxf
	wZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=UE0pchkOuc/En0yC8FvbramYxWSvpF+dOU8m1Poqh5g=;
	b=WR3SoMyrjFeZd5hR08FTTMdv5ALA95yKOZwPyfSwj4FNMxfO5SfohkD7ZIgFMPrAp4
	swVrzONFqWlI+QTgHjJffc6rQjFEqa3LZ4KWZzr7nE22iWIQGvo8/zpwAyQtZ5qVaZgD
	N+qBPECQWe+johCn5CDGcEZHOdnR+NDvcQP71pEmhdUvLKXN1dN9IAgSPR1h2NCxNu2t
	OxotD7o2aIn+BLrLOq5nA019iu32Pvb9h5tl7Tlw5VStcoUVvtwZfdWwwiMu5jUarRWj
	CxIgTeEl4HscsoU6YsC2pVbh6WcoYoBODpHP9tYkyemuDcCTkcuksAoKyFIX1dRyGKrv
	ijsg==
X-Gm-Message-State: ABuFfohAi3JHpgUPrE4uCfWS4FTw+PWT9hQqhl8IYtofWVdcyI8VqbNW
	CDnkOms1bwgWR0CjpUVcvaEJrcdE
X-Google-Smtp-Source: ACcGV60rzrqwndLzcPnMr73XNrnLuhtE4NtjR8s6MNuyCbw09lVxTLgbPcEwFKvfAG0TCVvL0yHr9w==
X-Received: by 2002:a17:902:2e83:: with SMTP id
	r3-v6mr1036575plb.80.1537595315933; 
	Fri, 21 Sep 2018 22:48:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c80d:9d99:c57:cbfe?
	([2601:202:4180:c33:c80d:9d99:c57:cbfe])
	by smtp.gmail.com with ESMTPSA id
	d24-v6sm31312756pgv.23.2018.09.21.22.48.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Sep 2018 22:48:35 -0700 (PDT)
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
References: <20180922021650.2040-1-okaya@kernel.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <dbde70e2-a822-cda0-8e1b-4e2b52cc459b@gmail.com>
Date: Fri, 21 Sep 2018 22:48:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180922021650.2040-1-okaya@kernel.org>
Subject: Re: [sumo] [PATCH v3 1/3] busybox: CVE-2017-15874
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
X-List-Received-Date: Sat, 22 Sep 2018 05:48:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sanan,


On 09/21/2018 07:16 PM, Sinan Kaya wrote:
> * CVE-2017-15874
> busybox: Integer underflow in archival/libarchive/decompress_unlzma.c
>
> (cherry picked from 9ac42c500586fa5f10a1f6d22c3f797df11b1f6b)
>
> Affects busybox <= 1.27.2

this series in sumo-nmut

thanks,
Armin
> CVE: CVE-2017-15874
> Ref: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2017-15874
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../busybox/busybox/CVE-2017-15874.patch      | 30 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.27.2.bb   |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-15874.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2017-15874.patch b/meta/recipes-core/busybox/busybox/CVE-2017-15874.patch
> new file mode 100644
> index 0000000000..67b4ed7e11
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/CVE-2017-15874.patch
> @@ -0,0 +1,30 @@
> +From e75c01bb3249df16201b482b79bb24bec3b58188 Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Fri, 27 Oct 2017 15:37:03 +0200
> +Subject: [PATCH] unlzma: fix SEGV, closes 10436
> +
> +Upstream-Status: Backport [ https://git.busybox.net/busybox/commit/?id=9ac42c500586fa5f10a1f6d22c3f797df11b1f6b]
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +Signed-off-by: Sinan Kaya <okaya@kernel.org>
> +---
> + archival/libarchive/decompress_unlzma.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/archival/libarchive/decompress_unlzma.c b/archival/libarchive/decompress_unlzma.c
> +index 29eee2a..41e492f 100644
> +--- a/archival/libarchive/decompress_unlzma.c
> ++++ b/archival/libarchive/decompress_unlzma.c
> +@@ -353,6 +353,10 @@ unpack_lzma_stream(transformer_state_t *xstate)
> + 						pos = buffer_pos - rep0;
> + 						if ((int32_t)pos < 0) {
> + 							pos += header.dict_size;
> ++							/* bug 10436 has an example file where this triggers: */
> ++							if ((int32_t)pos < 0)
> ++								goto bad;
> ++
> + 							/* see unzip_bad_lzma_2.zip: */
> + 							if (pos >= buffer_size)
> + 								goto bad;
> +-- 
> +2.19.0
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
> index 1ce4823d47..bab29728ee 100644
> --- a/meta/recipes-core/busybox/busybox_1.27.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
> @@ -47,6 +47,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://busybox-CVE-2017-16544.patch \
>             file://busybox-fix-lzma-segfaults.patch \
>             file://umount-ignore-c.patch \
> +           file://CVE-2017-15874.patch \
>  "
>  SRC_URI_append_libc-musl = " file://musl.cfg "
>  


