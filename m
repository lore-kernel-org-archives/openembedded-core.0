Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id C0B466189C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:35:55 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d9so427728pgu.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=mPd6ZivXPg86Le6HvU0O3FaqeC0sX7d8Kpe/DG9zPrA=;
	b=N4OW8bDYX0TdVgE63BeFmiV34TARs2rhiCPtGI3wHIfEUWrQLkSciaSF9+E4RMZmPb
	KSJfS4YlBhapmYnBr7RsBOXJjWDNcNs/7Ib00k1xpjietOq0z1ThK4hzNDD8CiL2cHMK
	NKSYr6+bwKXdXoU1QN2M87EmXkdEPVgGpMOBjA3fLySGV7bO7mvE1ZWVH8giQFCiOy1c
	COZzmGafMEYTi1W94tRqygu3UHk/QIT5Q/vg8MN7yI+1aM21fmUJOjC+kwL5LTi1Sgfm
	4m3JP5T++Kk1CTN0eGtz5f4+QWs4ri/+elxwdGMvLkCnvwnr+hoA3M2FvjCje7B64gPX
	EFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mPd6ZivXPg86Le6HvU0O3FaqeC0sX7d8Kpe/DG9zPrA=;
	b=omQAmh69e5Uy30d57tzH/GtLTaaU8A9qTRvZFMgMTtTvcWYjgkCEn9UH7SFm3a4fCc
	qqQLIew/LtuvTjnbT7MMPdGzCQf89kwxaOZMpZH7BMLBW1ryIDJD/IJX3pza3I9lxqYz
	cg3YaImM3IoupZZUwhTN+qXRRUfbeWxeTmgScteBepyTLYGb4kl+8ENxMNh4c5a4js6+
	+W1bhHgMGA5Nu5fVwJy/vgsPEMub+XSr4hG8NjPFS4QWrH4uSuBgBIfEtyXj2UDCfFjU
	+1Jt0zxkHenNg7cH4FZRcnpvmKEHQdbEG48ytsubsfHy4Bz1uScBPHMp4oQ00x90Wjz8
	r6Lw==
X-Gm-Message-State: APjAAAUwvcYMlJnuDeF/897K82+ps6c8yECIWXVvzUqU6wd203QEVuQp
	ec+R/Iua7KjT2UUYQdKpp37OFkiv
X-Google-Smtp-Source: APXvYqxXTtSkae4qGTm8TdS39pU6OQcShaHgGoakIWKHj/4wufzf52UgUqDe3ANsjm3ha/Q/lOM4IA==
X-Received: by 2002:aa7:8587:: with SMTP id w7mr1258487pfn.39.1582842956647;
	Thu, 27 Feb 2020 14:35:56 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:3d0b:bd00:40e0:2589?
	([2601:202:4180:a5c0:3d0b:bd00:40e0:2589])
	by smtp.gmail.com with ESMTPSA id a5sm7214535pjh.7.2020.02.27.14.35.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Feb 2020 14:35:56 -0800 (PST)
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>,
	openembedded-core@lists.openembedded.org
References: <20200227221535.8622-1-jpuhlman@mvista.com>
	<20200227221535.8622-3-jpuhlman@mvista.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <38925dad-bc5b-adda-281f-aefcc5f06934@gmail.com>
Date: Thu, 27 Feb 2020 14:35:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227221535.8622-3-jpuhlman@mvista.com>
Subject: Re: [PATCH 3/3] lsb-release: fix likely reproducabilty timestamp
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
X-List-Received-Date: Thu, 27 Feb 2020 22:35:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/27/20 2:15 PM, Jeremy A. Puhlman wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> Remove timestamp from gzipped manpage.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  .../0001-Remove-timestamp-from-manpage.patch  | 25 +++++++++++++++++++
>  meta/recipes-extended/lsb/lsb-release_1.4.bb  |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch
>
> diff --git a/meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch b/meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch
> new file mode 100644
> index 0000000000..e7ff00d132
> --- /dev/null
> +++ b/meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch
> @@ -0,0 +1,25 @@
> +From fb0b58be938bab5571ac0bdec3725f6d88b07e9f Mon Sep 17 00:00:00 2001
> +From: Jeremy Puhlman <jpuhlman@mvista.com>
> +Date: Sat, 22 Feb 2020 19:01:28 +0000
> +Subject: [PATCH] Remove timestamp from manpage

Missing "Upstream-Status:" and "signed-off-by" in patch

- armin
> +
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 04fdecd..5be8081 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -17,7 +17,7 @@ man: lsb_release.1.gz
> + 
> + lsb_release.1.gz: lsb_release
> + 	@./help2man -N --include ./lsb_release.examples --alt_version_key=program_version ./lsb_release >lsb_release.1
> +-	@gzip -9f lsb_release.1
> ++	@gzip -9fn lsb_release.1
> + 
> + install: all
> + 	install -D -m 644 lsb_release.1.gz ${mandir}/man1/lsb_release.1.gz
> +-- 
> +2.13.3
> +
> diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
> index 52e30267f5..a06cbcf845 100644
> --- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
> +++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
>             file://0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch \
> +           file://0001-Remove-timestamp-from-manpage.patch \
>             "
>  
>  SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"


