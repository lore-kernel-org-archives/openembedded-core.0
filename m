Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6999C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:31:54 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.7044.1643117513850156954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZGkR1RJR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id v13so19901534wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RGAptExEqVzcKDGGcYNaIU4XNXJCUK5lyKP/lG8UFyM=;
        b=ZGkR1RJRipcyjKUtvJU4ho6EQPufW4SQ19cjmKkseWfKRUVex6NizmlCSNaykJOBGk
         rc91FqDv5reYEKkkGEbQ13B9iDtvKl1XAJDjB/PhqlN7IdKRpme9Xfzmhl/lsoNmYoAW
         3fTnvNotZ3rELQEUxCQk8rXLXt5eQioX6qu4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RGAptExEqVzcKDGGcYNaIU4XNXJCUK5lyKP/lG8UFyM=;
        b=m08uAAbBnzsueziCSvAH9kexPeYYtegSjV3T3ceG7ddZetw3Z/8b+8jNR//c/xJWeo
         ddsTBsRb+ytFEhBCegVa3ZzIMf4B2GrE8pQoVAQcEHzaV6KiBVlDxdpbkbOnZCekYsO2
         y4MME2Y9eMtQfjtodjXH+RGUX/Kh6Pr+GljCLLMo8eU0d4I6YXVLFXL6byUorGoScgAf
         emR82dG87/tRoKu+zwHeDzb6u5JGbIRN1lmDQZWim3DqziDq27e23LHA6Ebf3OQYYvSR
         R03TUxgwk3Ox6KKmbL6Jy0SlaW9p5f5aQGU9DvBvXnqSAFMe6GeM98kTVTwhu1NIr7xP
         pDQQ==
X-Gm-Message-State: AOAM531zpBE43OhIlKWb0tu8qU0h+GjcfNRQEZsCXSDcx+Um+eNfxAGH
	nP2IyBPHNIQA4Y8M3iX2OjiLTw==
X-Google-Smtp-Source: 
 ABdhPJxcysTVnSSDbVlzwKZzDxXclSgr9qWQ+Dh/a8MCm24B5T2ulVcLGx39g6QOZZFIbwV0IQO72A==
X-Received: by 2002:a5d:598c:: with SMTP id
 n12mr18395038wri.386.1643117512396;
        Tue, 25 Jan 2022 05:31:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b0a:3d41:67d:ed83?
 ([2001:8b0:aba:5f3c:6b0a:3d41:67d:ed83])
        by smtp.gmail.com with ESMTPSA id
 t18sm386222wmq.43.2022.01.25.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 05:31:52 -0800 (PST)
Message-ID: 
 <52c9f0d2a60594c1d450955ae63b2557e07c02ba.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCHv2] libical: build gobject and vala introspection
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Tue, 25 Jan 2022 13:31:49 +0000
In-Reply-To: <20220121035639.230863-1-f_l_k@t-online.de>
References: <20220121035639.230863-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:31:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160920

On Fri, 2022-01-21 at 04:56 +0100, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-support/libical/libical_3.0.12.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/libical/libical_3.0.12.bb b/meta/recipes-support/libical/libical_3.0.12.bb
> index b2b2211b9b..614a76ba5b 100644
> --- a/meta/recipes-support/libical/libical_3.0.12.bb
> +++ b/meta/recipes-support/libical/libical_3.0.12.bb
> @@ -16,7 +16,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.g
>  SRC_URI[sha256sum] = "35095a4cc1a061a3de0f332c2dc728226cf127fa0baa818e9f8856cee6d35830"
>  UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
>  
> -inherit cmake pkgconfig
> +inherit cmake pkgconfig gobject-introspection vala
>  
>  DEPENDS += "libical-native"
>  
> @@ -32,6 +32,11 @@ EXTRA_OECMAKE += "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
>  EXTRA_OECMAKE += "-DLIBICAL_BUILD_TESTING=false"
>  # doc build fails with linker error (??) for libical-glib so disable it
>  EXTRA_OECMAKE += "-DICAL_BUILD_DOCS=false"
> +# gobject-introspection
> +EXTRA_OECMAKE += "-DGObjectIntrospection_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper"
> +EXTRA_OECMAKE += "-DGObjectIntrospection_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper"
> +EXTRA_OECMAKE += "-DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen"
> +EXTRA_OECMAKE += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DGOBJECT_INTROSPECTION=ON -DICAL_GLIB_VAPI=ON', '-DGOBJECT_INTROSPECTION=OFF', d)}"
>  
>  # Tell the cross-libical where the tool it needs to build is
>  EXTRA_OECMAKE:append:class-target = " -DIMPORT_ICAL_GLIB_SRC_GENERATOR=${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmake"


Looks like this breaks libical-native:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/4618
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4645

and many more in that build.

Cheers,

Richard


