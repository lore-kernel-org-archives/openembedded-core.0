Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.8588.1626557414075718494
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jul 2021 14:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i4m+NXtH;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id e14so4696519plh.8
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Jul 2021 14:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=rYgm3fqYAxQB4bzxCPaUFj/VaAvAHQXlLAdv73urZp8=;
        b=i4m+NXtHqVPIHvHTHlI4DWq3p2249gan1G5pG+RoNQc8AsOwSNRzKrODEFh9Ft3gMN
         R/ReewWSoRxAncgqlBsxSYsNr720HNfXQ5KQy31gLL0SE3d9mId5zqS0BxPcJpQGbfLS
         nAl6821MnyGZjM+BSMWkoKpy4NyW8qBc2NQ4f5wuwt/6+K/P9udapZftAg400flIQdWj
         QEMTdIzZKiJ0Lv+Kdvz+g96rhPxABMH9kWuZhIjgg7vsZsORoBt6ZXLKvfrZtc+JB5oK
         eXXgonAqCN9Rsr77IDBFS70p+jNkCez0JCQJeVYmRth46YdoXmilXROIZ/a/s+mUc2TH
         oY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rYgm3fqYAxQB4bzxCPaUFj/VaAvAHQXlLAdv73urZp8=;
        b=H5+wmbktwVQpCubau1ta+A040uuB1e2mWJ8iRF2FA2BFOXkKBwXZNKy551NnW5ESym
         KmLExT3vYkj8051EXpV1D3Mr8iNmZtHXhVJjMbT+3UAR7Z+8FMIWO7KDI5DVOVjUvqxN
         +cYtahxvWkBJ/Qix1RjGWxGyciaa5LB73gk27d7mInvGYnFIcoLxvAysj7NzkuxruQ0U
         WUJ30cDAq8plJa9A9Wpo96nrNCmtDKJDHQsrVzrMHce1bX+h0BUrKtWToUrHoQ2OnRYk
         1DftPqQZxfZLb69ATpFUJL7FN6dFHEDfYE6Gnd6kku0B0weYn9yxAYZafyxFc8wnoKzd
         Am+Q==
X-Gm-Message-State: AOAM530VIiRYd9Al0oNGlt/esE5KpFMyqwJKWfjrt8JgazRRbeJVzoc2
	jSU0X/uYwf5cD9INUsbeXlfrd++5zIc=
X-Google-Smtp-Source: ABdhPJwARWs3opHduW5EGZqkkm1bR21yejzxXLs6VN5JbF8xXYzCcqKGprkUIbDw3oE5tzdRKksQ8A==
X-Received: by 2002:a17:90a:d18d:: with SMTP id fu13mr21884551pjb.206.1626557413413;
        Sat, 17 Jul 2021 14:30:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5b11:9c4:d91e:7217? ([2601:202:4180:a5c0:5b11:9c4:d91e:7217])
        by smtp.gmail.com with ESMTPSA id u33sm14572489pfg.3.2021.07.17.14.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 14:30:12 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] libseccomp: Update to main branch
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210714021322.1245535-1-raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <fa50037d-6482-8aeb-b710-d2c8a532ff80@gmail.com>
Date: Sat, 17 Jul 2021 14:30:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714021322.1245535-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/13/21 7:13 PM, Khem Raj wrote:
> Get RV32 imlementation

The subject is miss leading. You are replacing the upstream url with
your github version to make riscv easier. Is this the preferred method
of supporting new Architectures?

-armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-configure.ac-Bump-version-to-2.5.99.patch | 26 +++++++++++++++++++
>  .../libseccomp/libseccomp_2.5.1.bb            |  7 +++--
>  2 files changed, 29 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
>
> diff --git a/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
> new file mode 100644
> index 0000000000..f30ca77465
> --- /dev/null
> +++ b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
> @@ -0,0 +1,26 @@
> +From 00b6bc440a75443f9bea431bbb41df50469b5093 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 8 Jun 2021 23:13:20 -0700
> +Subject: [PATCH] configure.ac: Bump version to 2.5.99
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 3e87734..48e796f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -19,7 +19,7 @@ dnl #
> + dnl ####
> + dnl libseccomp defines
> + dnl ####
> +-AC_INIT([libseccomp], [0.0.0])
> ++AC_INIT([libseccomp], [2.5.99])
> + 
> + dnl ####
> + dnl autoconf configuration
> +-- 
> +2.32.0
> +
> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> index 8fe1023901..5f79f3dbcb 100644
> --- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> @@ -7,14 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357c
>  
>  DEPENDS += "gperf-native"
>  
> -SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
> +SRCREV = "${AUTOREV}"
>  
> -SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
> +SRC_URI = "git://github.com/kraj/libseccomp.git;branch=riscv32 \
> +           file://0001-configure.ac-Bump-version-to-2.5.99.patch \
>             file://run-ptest \
>             "
>  
> -COMPATIBLE_HOST_riscv32 = "null"
> -
>  S = "${WORKDIR}/git"
>  
>  inherit autotools-brokensep pkgconfig ptest features_check
>
> 
>

