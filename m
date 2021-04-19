Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.322.1618847109998738129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 08:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kaCZpcYm;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id j7so15105198pgi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p/c5j43KfCfRNn3xplvj9TSxhV8itNHVYUwd3OnUUjo=;
        b=kaCZpcYmUcxVy+yd2w+0Q7EvifRjJY0RETu5M6Ouen4n9FwGF0foBhwYGqtSMZ6bj8
         2vCLMIQudIQHNmlJ/wPQasgI4ujpd01mgVnbMR5lqfOR39hrH0AIbM/aUqAakgH5zm4b
         +mucEpvQhtwCrvkxZ5Vld/LN10Pen5zOWiPvLhDW+7bc49T0ygPSEHJ1S7u9y8X2y0x6
         Gig8ZyjjCONn8mPEm3IA+NA+di+GRXF52D77l7obJ/Vws+wYSAxlg1l5Xob8UcctneSg
         uOTObeQ1Wlz3AfQTtV4aUbd8BVm9bO74CpJxMB74XtuwZXObVAN2M7vMEqgKvpEhLlV8
         Hs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=p/c5j43KfCfRNn3xplvj9TSxhV8itNHVYUwd3OnUUjo=;
        b=l2D7yewvYaxQlSHtQcEYBAhSCI4rGRUo+MO9G1QmP38Y7FKjvDOtFTeuohNEWXqydE
         UW7+kE5q8ceJ9lS7LqVp4mOXgzgcIs27CFhsfIScY61TcXgIazKVlJTpJ775j9k1J35K
         nMiMG2fisUNQddHwstY7tVY/0kuTyjLx1xzoT0HyQzIsKT0AjN0xTU6nI1NT5iyjjAUg
         Zv93UBbHTYJN2OzXkkRn0JKCn+xoh9SfUoFs3CZQug/oc6oAfxI9DxETb65juuJN87Mb
         xLiNMQt3+Wi1TnGOEPZTCl0zRsF3MQikYDky1ZATXt1W86J7Hd222eu7gBcb3i8Vm/p1
         MjYg==
X-Gm-Message-State: AOAM532BcnVXEVIYRWspq7qUYJGvTBA3dFOLvjmEwnO7qJfP+4seH69z
	jwjtGdJkjJ/UNG2Bao0hCoXaP/cYa94b9w==
X-Google-Smtp-Source: ABdhPJyMMagI1da3mjTpvAgoCWpJyOgOwEsx7yGlYwG8lGXHkf+FEA5kDMwGRQ1m7nqIrHwWEXOvDw==
X-Received: by 2002:a63:4d50:: with SMTP id n16mr6462270pgl.237.1618847108950;
        Mon, 19 Apr 2021 08:45:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:692a:2f5c:cdd4:70fe? ([2601:646:9200:a0f0:692a:2f5c:cdd4:70fe])
        by smtp.gmail.com with ESMTPSA id f18sm11964191pfk.144.2021.04.19.08.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 08:45:08 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 2/4] libmicrohttpd: add a recipe from meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210419090044.582453-1-alex.kanavin@gmail.com>
 <20210419090044.582453-2-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <42dd97b7-c7ed-6cf3-7604-2c84cbfb59cf@gmail.com>
Date: Mon, 19 Apr 2021 08:45:07 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419090044.582453-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/19/21 2:00 AM, Alexander Kanavin wrote:
> This is required to enable debuginfod in elfutils.
> 

Don't forget to send a patch to remove  it from meta-openembedded once 
merged in core.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   .../libmicrohttpd/libmicrohttpd_0.9.72.bb     | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
> 
> diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
> new file mode 100644
> index 0000000000..66c48da3b7
> --- /dev/null
> +++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
> +HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
> +LICENSE = "LGPL-2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=57d09285feac8a64efa878e692b14f36"
> +SECTION = "net"
> +
> +DEPENDS = "file"
> +
> +SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "2a286193af88ab2ae3149748d4b46187"
> +SRC_URI[sha256sum] = "0ae825f8e0d7f41201fd44a0df1cf454c1cb0bc50fe9d59c26552260264c2ff8"
> +
> +inherit autotools lib_package pkgconfig gettext
> +
> +CFLAGS += "-pthread -D_REENTRANT"
> +
> +EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
> +
> +PACKAGECONFIG ?= "curl https"
> +PACKAGECONFIG_append_class-target = "\
> +        ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
> +"
> +PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
> +PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
> +PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
> +
> +do_compile_append() {
> +    sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> 
> 
