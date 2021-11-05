Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20F2C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 17:32:54 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.8941.1636133574351955213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MikIerrE;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id n85so4983137pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=C876yhkCe8qfOdJwXoelD0ISHCkHZNH5Z3u/jvAeESI=;
        b=MikIerrEtov3kuItOFv0JwUluIUABKiI0dbev9oWuiJttijh621bWOzi+lPK9gdkPQ
         xIn/qJlasd3gzIwTB9ITklyTRctZlEHFPMEAQcWwCKrKnaIpq194jm9isOK1gI12l+7j
         ksR2hQfqWlC5JNAU0WKPLuLg7NZjxhcnLmE4fV4K1+iREyV3uyl5NsrTXaDWiG8Zco4W
         JLA2i1XBMeFIlf3q9jvoTVGyz6lMbMnk4vgBfXP3Wp0KI9LgSnO3AsMG9Jz9CYKw9I7n
         S58THar7y6VpPCv4O8JJvxwy1B8ASY3/7hO4rWH0aZ2VxrwycMOK9J4zNMI8TZu07jOE
         K0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=C876yhkCe8qfOdJwXoelD0ISHCkHZNH5Z3u/jvAeESI=;
        b=TyKtHi4+dxqM2LKCr6HXOqRr8fDprLaUi9si17/CVIOLVoUrUzf+uhgSmrwDbgWVCF
         FGe+aICQpNY5S2/oEGuhpw9+JKlxsuiIOYNZWeTGI9VUblIOjfT5lvgLBCu0F5H00PiT
         5oRbBQ1MzzV2eeVfEuyDIqrCG40LmpiaduaL76OBRS6iikYdiQo1f173sXBEj2xIy6xY
         VLuWjx/+ogG/LvSOwCKZasuP6TBEYC0sAH31KR4z4UQ6GI5JHNJNMGv0mRkCjar3DSHe
         6gl7t3OdLQoNfkpq0wTIHPFzbUQFXjJRQ5Tr/HPaezTjM4cK12Mh6+cK0jcm/AvhZ/v2
         ArxA==
X-Gm-Message-State: AOAM533oqqcCGeYuYfSMQKloojgCKBnKLd/ePmGjTgSVhtUsoHoVjgy8
	Ep235lIIFltmWhAzrvQFgTE=
X-Google-Smtp-Source: 
 ABdhPJzlTqFgdPpggvZT88jQUvH8qxuy/j4H1Hmf1LqHsmtSFgPICTPgRo5JzO4QyrB4IhDUwnYi3w==
X-Received: by 2002:a65:5b01:: with SMTP id y1mr28763494pgq.451.1636133573632;
        Fri, 05 Nov 2021 10:32:53 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:9103:5ab5:3527:3728?
 ([2601:646:9200:a0f0:9103:5ab5:3527:3728])
        by smtp.gmail.com with ESMTPSA id
 b21sm523760pff.75.2021.11.05.10.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 10:32:53 -0700 (PDT)
Message-ID: <4059496a-3720-1f5c-a22b-fbfeaca37a99@gmail.com>
Date: Fri, 5 Nov 2021 10:32:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [OE-core] [PATCH] ppp: fix build against 5.15 headers
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <20211105171954.8848-1-bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211105171954.8848-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 17:32:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157917



On 11/5/21 10:19 AM, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> The 5.15 kernel has removed ipx support, along with the userspace
> visible header.
> 
> The build error was found for muslc, since it doesn't have a
> fallback header, we disable it for both glibc/muslc.
> 
> This support wasn't used previously (as it hasn't been very well
> maintained in the kernel for several years), so we can simply
> disable it in our build and wait for upstream to do a release that
> drops the support.
> 
> Although the tarball we use for our build (versus git), doesn't
> use the autoconf disable flag to turn off the support, it is included
> in this patch in case someone is building via git source base.
> 
> Upstream-Status: Inappropriate [OE-specific configuration/headers]
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   ...1-ppp-fix-build-against-5.15-headers.patch | 36 +++++++++++++++++++
>   meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  3 ++
>   2 files changed, 39 insertions(+)
>   create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
> 
> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch b/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
> new file mode 100644
> index 0000000000..c91246dbf5
> --- /dev/null
> +++ b/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
> @@ -0,0 +1,36 @@
> +From aba3273273e826c6dc90f197ca9a3e800e826891 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Date: Fri, 5 Nov 2021 12:41:35 -0400
> +Subject: [PATCH] ppp: fix build against 5.15 headers
> +
> +The 5.15 kernel has removed ipx support, along with the userspace
> +visible header.
> +
> +This support wasn't used previously (as it hasn't been very well
> +maintained in the kernel for several years), so we can simply
> +disable it in our build and wait for upstream to do a release that
> +drops the support.
> +
> +Upstream-Status: Inappropriate [OE-specific configuration/headers]
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +---
> + pppd/Makefile.linux | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
> +index 22837c5..23b9b22 100644
> +--- a/pppd/Makefile.linux
> ++++ b/pppd/Makefile.linux
> +@@ -91,7 +91,7 @@ MAXOCTETS=y
> +
> + INCLUDE_DIRS= -I../include
> +
> +-COMPILE_FLAGS= -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -pipe
> ++COMPILE_FLAGS= -DHAVE_PATHS_H -DHAVE_MMAP -pipe
> +
> + CFLAGS= $(COPTS) $(COMPILE_FLAGS) $(INCLUDE_DIRS) '-DDESTDIR="@DESTDIR@"'
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> index 235595ff76..bd6435e69c 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> @@ -24,6 +24,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
>              file://ppp_on_boot \
>              file://provider \
>              file://ppp@.service \
> +           file://0001-ppp-fix-build-against-5.15-headers.patch \
>              "
>   
>   SRC_URI[sha256sum] = "f938b35eccde533ea800b15a7445b2f1137da7f88e32a16898d02dee8adc058d"
> @@ -39,6 +40,8 @@ EXTRA_OECONF = "--disable-strip"
>   #
>   EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${STAGING_INCDIR}/openssl -I${S}/include"'
>   
> +EXTRA_OECONF:append:libc-musl = " --disable-ipxcp"

does this have to be musl specific ? given that kernel is dropping ipx 
support I think this should be disabled unconditionally isnt it ?

> +
>   do_configure () {
>   	oe_runconf
>   }
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157915): https://lists.openembedded.org/g/openembedded-core/message/157915
> Mute This Topic: https://lists.openembedded.org/mt/86846153/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

