Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id DE3C07507C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 02:03:44 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id v24-v6so16297379plo.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 19:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=WSeIyuZYcpdgIafwcSefwn0M6G16F58VR/nBbpJcsUY=;
	b=GO+VuwyKIWjeqeMRAm1vodLxf7HFZjrkKh4BRMmQWtM45ayA9JDeEcCJy3EGaX6nIo
	uWpweg4ToZE77p+MzOwzLuZMTIu/eei7I8J8j4dpZhlQRTHq+Xm0otdFv63unPJriJBK
	PbLk25DAFoCXjhBT/qxuChZZaWw+ie+Us8hOyxgmgI5i2BziE2ldfCWL3+caIDSmlpCK
	Vme48B5Vos6DIhmbGxSCCrjJi6y6ygAMs4wz4ZxDoNavLSDVVJ/bzn2DDt9HS2MtQAot
	evucBgkVBroT4tOniAaPe5pbd5Yfm2f4p6Ftc5VrS22juzgvZzncuJDlRt0FhZes06BD
	bG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=WSeIyuZYcpdgIafwcSefwn0M6G16F58VR/nBbpJcsUY=;
	b=VJ25Sgg/bCFcYkvpGpgHP7AG1HyaQ99cyfilQoScEVobPh9a1jS1MbUAf9v2I/0Z3x
	Ikgik5yQpSCvcIMhoi9BxwTPTCL38UTn19kUo99ASKaMAFTFlCuPQoxF5wyXuqmCqLqm
	Nsl+Qqy36mR/YV0tNZGwFfKdjINbpdAOZr8HJ4ORiIyjh1TmZKLw+fxRrDkI+arDNh8F
	dnuRNBrpmhAoo9W+BAV5Pr4+dyo/cmhaPzj9ZLresyh+SD4/A290AD734pIfZy5uaXHK
	s+Q1pCgz/p/KlZ5ayGqz2jThIi08ZU2HGZJtkoomoQWEtwrZNtEoX49yKzfpzKO/Fu1n
	66tw==
X-Gm-Message-State: ALKqPwdrEezQc14ReENr0RoKaWzSvZ8DrnOM/gAWpgpUJsEFOP998VN6
	cJOLwE2HxoWzM7iT8LQXWhyNng==
X-Google-Smtp-Source: ADUXVKKLXcBaes7M2mzCFtcGxOn0YtwFCKIIyAF6BkttUEtvZGaupwJ4ACS4PuNBkxDNzaoln7uV3g==
X-Received: by 2002:a17:902:d697:: with SMTP id
	v23-v6mr4806420ply.193.1527905025690; 
	Fri, 01 Jun 2018 19:03:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:cd69:7d4:a4bc:31b4?
	([2601:202:4000:1184:cd69:7d4:a4bc:31b4])
	by smtp.gmail.com with ESMTPSA id
	s1-v6sm60246609pgr.66.2018.06.01.19.03.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 19:03:45 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180601154209.673-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3e0d91cb-4fd1-d563-be97-779ae5dfa2e1@gmail.com>
Date: Fri, 1 Jun 2018 19:03:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180601154209.673-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] systemd: fix build with gcc8
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
X-List-Received-Date: Sat, 02 Jun 2018 02:03:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/01/2018 08:42 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...ild-with-gcc8-Werror-format-truncati.patch | 53 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_237.bb      |  1 +
>  2 files changed, 54 insertions(+)

I am seeing this same issue in Sumo and I have applied this patch.  Its
currently running a test build.
- armin
>  create mode 100644 meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
> new file mode 100644
> index 0000000000..e44f431073
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
> @@ -0,0 +1,53 @@
> +From f9fd4546c25a15629544bc4642a74d7909cc0840 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Fri, 1 Jun 2018 15:22:28 +0000
> +Subject: [PATCH] time-util: fix build with gcc8 -Werror=format-truncation=
> +
> +* it fails with gcc8 when -O1 or -Os is used (and -ftree-vrp which is added by -O2 and higher isn't used)
> +
> +../git/src/basic/time-util.c: In function 'format_timespan':
> +../git/src/basic/time-util.c:508:46: error: '%0*llu' directive output between 1 and 2147483647 bytes may cause result to exceed 'INT_MAX' [-Werror=format-truncation=]
> +                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
> +                                              ^~~~
> +../git/src/basic/time-util.c:508:60: note: format string is defined here
> +                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
> +../git/src/basic/time-util.c:508:46: note: directive argument in the range [0, 18446744073709551614]
> +                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
> +                                              ^~~~
> +../git/src/basic/time-util.c:507:37: note: 'snprintf' output 4 or more bytes (assuming 2147483651) into a destination of size 4294967295
> +                                 k = snprintf(p, l,
> +                                     ^~~~~~~~~~~~~~
> +                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
> +                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +                                              p > buf ? " " : "",
> +                                              ~~~~~~~~~~~~~~~~~~~
> +                                              a,
> +                                              ~~
> +                                              j,
> +                                              ~~
> +                                              b,
> +                                              ~~
> +                                              table[i].suffix);
> +                                              ~~~~~~~~~~~~~~~~
> +cc1: some warnings being treated as errors
> +
> +Upstream-Status: Submitted https://github.com/systemd/systemd/pull/9156
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + src/basic/time-util.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/basic/time-util.c b/src/basic/time-util.c
> +index 0601d4fa9..db5a9cd78 100644
> +--- a/src/basic/time-util.c
> ++++ b/src/basic/time-util.c
> +@@ -484,7 +484,7 @@ char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy) {
> +                 /* Let's see if we should shows this in dot notation */
> +                 if (t < USEC_PER_MINUTE && b > 0) {
> +                         usec_t cc;
> +-                        int j;
> ++                        char j;
> + 
> +                         j = 0;
> +                         for (cc = table[i].usec; cc > 1; cc /= 10)
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
> index 2e6558ded1..0113c2dc72 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -54,6 +54,7 @@ SRC_URI += "file://touchscreen.rules \
>             file://libmount.patch \
>             file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
>             file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
> +           file://0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch \
>             "
>  SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>  


