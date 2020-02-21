Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5222E6164C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:12:06 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 70so1193484pgf.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=wkvXPyp84yl0cnrvFO19AWFVq/yeVyuWcIkvDqmeJ3Y=;
	b=u+7xuL8y6jvF3XI2eiXe+E2Ti/zJI0LHemEzURYwKDuWIhGdYu5nkHxZekF85nwIqj
	0Lyi6Pw3YyGfZYbv+S4P3Snk1qhuUp3uFkPDgNGbXRXR1cGjZmZKDFOd/BdXWHIl+zft
	mFLQ4asIrRlLgBbIR97hDxLc7R6S6qg8E7vK2qaIGQxo+KaXb5RERCtfn66czInMI48d
	VvLpb6FeG3r/FaOowmAucGxTUSKUVxgwdjht7/IdZD7K1tVADUvaz+62ne0SEvWDaRPQ
	UvFQZGj4+JgRt6D8ymmPjlu2dsmxeD4zsmxkKyTHI3EbhHLRh0pzqAt2N2tKGctClP/H
	hUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=wkvXPyp84yl0cnrvFO19AWFVq/yeVyuWcIkvDqmeJ3Y=;
	b=axOwg54PR7EiRA34gEs/WpkUDsHF9bhZjyLcJF+1nbv+0RqubQNgBzSLtyFfnnBRSJ
	oqBle6jhK9b6EWCpL/O9Ylj+9x2fTF9CRN44fi4/R93PcAsEiIyslnzrvinkwdX8ynhp
	4KfTTjet2PEhRsZLTOeUzXzgiIH7vD5MiW+ARCyBHvnawIUhwP3ww/iJAyRAghLpi289
	yM/yYn0syyx9cF8FJVfFzq/CYXShn1K1hRq3gkeX4yHHtwsEgur3+Zita923jWFgAB52
	0Pn78t8RqzTMX2ttE7N844ZQ5Ao3VSXWZ0XfKQFeO6n0YWgdegnkN9wP66GgnNzco3RW
	hyiw==
X-Gm-Message-State: APjAAAXZrHokhKpfSwkbU0/LY5pzuu/x22sFbEbeSSvDGURsFiGO9SlU
	W80OblYUqmOHkCCc5Fk595r+tl52
X-Google-Smtp-Source: APXvYqw3n9fb6c9UOSap7+8io1mi57lRP6aNu9BkjDDDgRlsyw/Hp1fLA9ZQBVFWcJXNVfQ89Gdaow==
X-Received: by 2002:a63:487:: with SMTP id 129mr39036283pge.193.1582301526544; 
	Fri, 21 Feb 2020 08:12:06 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:dda2:81fa:6982:d91f?
	([2601:202:4180:a5c0:dda2:81fa:6982:d91f])
	by smtp.gmail.com with ESMTPSA id
	w26sm3298833pfj.119.2020.02.21.08.12.05
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 21 Feb 2020 08:12:06 -0800 (PST)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1582255767-74523-1-git-send-email-anuj.mittal@intel.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e82c8986-8872-1705-faa4-f48791b69977@gmail.com>
Date: Fri, 21 Feb 2020 08:12:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582255767-74523-1-git-send-email-anuj.mittal@intel.com>
Subject: Re: [zeus][PATCH] openssh: backport patch to fix "cert not yet valid" test
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
X-List-Received-Date: Fri, 21 Feb 2020 16:12:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/20/20 7:29 PM, Anuj Mittal wrote:
> Fixes [YOCTO #13796]
Could you please take ownership of the bug. Its weird we both worked on
the same issue and had a fix done about the same time.

Ill replace my version in stable/zeus-nut with this patch.

- Armin
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  ...at-bozo-decided-to-use-2020-as-a-future-d.patch | 46 ++++++++++++++++++++++
>  meta/recipes-connectivity/openssh/openssh_8.0p1.bb |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch
> new file mode 100644
> index 0000000..e2930c3
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch
> @@ -0,0 +1,46 @@
> +From 3cccc0a2ab597b8273bddf08e9a3cc5551d7e530 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Fri, 3 Jan 2020 03:02:26 +0000
> +Subject: [PATCH] upstream: what bozo decided to use 2020 as a future date in a
> + regress
> +
> +test?
> +
> +OpenBSD-Regress-ID: 3b953df5a7e14081ff6cf495d4e8d40e153cbc3a
> +
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/ff31f15773ee173502eec4d7861ec56f26bba381]
> +
> +[Dropped the script version and copyright year change at the top]
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + regress/cert-hostkey.sh | 2 +-
> + regress/cert-userkey.sh | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/regress/cert-hostkey.sh b/regress/cert-hostkey.sh
> +index 3ce7779..74d5a53 100644
> +--- a/regress/cert-hostkey.sh
> ++++ b/regress/cert-hostkey.sh
> +@@ -248,7 +248,7 @@ test_one() {
> + test_one "user-certificate"	failure "-n $HOSTS"
> + test_one "empty principals"	success "-h"
> + test_one "wrong principals"	failure "-h -n foo"
> +-test_one "cert not yet valid"	failure "-h -V20200101:20300101"
> ++test_one "cert not yet valid"	failure "-h -V20300101:20320101"
> + test_one "cert expired"		failure "-h -V19800101:19900101"
> + test_one "cert valid interval"	success "-h -V-1w:+2w"
> + test_one "cert has constraints"	failure "-h -Oforce-command=false"
> +diff --git a/regress/cert-userkey.sh b/regress/cert-userkey.sh
> +index 6849e99..de455b8 100644
> +--- a/regress/cert-userkey.sh
> ++++ b/regress/cert-userkey.sh
> +@@ -327,7 +327,7 @@ test_one() {
> + test_one "correct principal"	success "-n ${USER}"
> + test_one "host-certificate"	failure "-n ${USER} -h"
> + test_one "wrong principals"	failure "-n foo"
> +-test_one "cert not yet valid"	failure "-n ${USER} -V20200101:20300101"
> ++test_one "cert not yet valid"	failure "-n ${USER} -V20300101:20320101"
> + test_one "cert expired"		failure "-n ${USER} -V19800101:19900101"
> + test_one "cert valid interval"	success "-n ${USER} -V-1w:+2w"
> + test_one "wrong source-address"	failure "-n ${USER} -Osource-address=10.0.0.0/8"
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
> index 2ffbc9a..3d16f9d 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
> @@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
>             file://0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch \
> +           file://0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch \
>             "
>  SRC_URI[md5sum] = "bf050f002fe510e1daecd39044e1122d"
>  SRC_URI[sha256sum] = "bd943879e69498e8031eb6b7f44d08cdc37d59a7ab689aa0b437320c3481fd68"


