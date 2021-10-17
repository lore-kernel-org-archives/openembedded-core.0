Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99045C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 11:41:35 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.22053.1634470893945490982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 04:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XTg/2xyD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id g25so35506843wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 04:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WgluOQcfRFa7FV1NAAGDjFKMy+z4us/NscrgJtteplQ=;
        b=XTg/2xyDuJVl/zqWalgz7E5SRjvjEwR8fseXk2EQnVz1VTbqrkjRoOoAwg8XmQ2u/8
         ZAhRelIQNFXTROwX1tPW9o05vXAxtYHXIctj0PYXNkf3RXCyzJTiNFTMdhhn20FBlGBz
         O6uiZ9peUmXMHM0BQqSYIKB+Um/zywoynqvwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WgluOQcfRFa7FV1NAAGDjFKMy+z4us/NscrgJtteplQ=;
        b=GcSG3jepa3zZh5ixH43cz4U1R91bGV01VaIS/ml9WooUYk6mMrO74541YXzyoxJHjh
         du67S+xyrtpvSaT07IFihIgkuZRoUHVkphpokSCNPd/THGxr3JKhy9oOx2bZ+jLBDkS/
         pB/VQY6M/Tfyf/zN02ufC07jFUOkXVDRX2T1RtbT36PApP4qrtENfzwQkVion+H0z+yv
         uqKU4Hsn3S8kxnVFvbzaEIhYemOgD6Op4ZkU3LzsuBvDM+cCCSQ4X/ST8n3UHSQfuOq2
         p3C9W5gsAicU93we2GMv/CFKh7IHeT7hMpLagVEd7gY+iLeNJvqKIOqRwowNYJLJd+lE
         yzwQ==
X-Gm-Message-State: AOAM532YXKJx9szCN29gGDRzZBlSWb8WfnZN5ZscY+zouJ8g6RsE7V5F
	SsjSWB1HUecDiWtQ0+UYPkPUOg==
X-Google-Smtp-Source: 
 ABdhPJwnGzUb3s4K8JLRJxeDAC4SbgLdALk88UVCSCb1T4lnaRebWPlX5Vy4rO7o3olGHYrZEVqAUg==
X-Received: by 2002:adf:de0e:: with SMTP id
 b14mr27991919wrm.271.1634470892227;
        Sun, 17 Oct 2021 04:41:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d75:85d1:ab5f:ea09?
 ([2001:8b0:aba:5f3c:5d75:85d1:ab5f:ea09])
        by smtp.gmail.com with ESMTPSA id
 i17sm11099441wru.18.2021.10.17.04.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 04:41:31 -0700 (PDT)
Message-ID: 
 <41dd3fe3be3db23edd4ae17f23520709997f8d48.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] python3-setuptools-scm: upgrade 6.0.1 ->
 6.3.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Date: Sun, 17 Oct 2021 12:41:30 +0100
In-Reply-To: <20211017014121.414803-3-timothy.t.orling@intel.com>
References: <20211017014121.414803-1-timothy.t.orling@intel.com>
	 <20211017014121.414803-3-timothy.t.orling@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 11:41:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157034

On Sun, 2021-10-17 at 01:41 +0000, Tim Orling wrote:
> RDEPENDS on python3-tomli instead of python3-toml
> 
> Cleanup RDEPENDS (common vs. class-target)
> 
> For changes, see:
> https://github.com/pypa/setuptools_scm/blob/main/CHANGELOG.rst#632
> 
> Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> ---
>  ..._6.0.1.bb => python3-setuptools-scm_6.3.2.bb} | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>  rename meta/recipes-devtools/python/{python3-setuptools-scm_6.0.1.bb => python3-setuptools-scm_6.3.2.bb} (73%)
> 
> diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.3.2.bb
> similarity index 73%
> rename from meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
> rename to meta/recipes-devtools/python/python3-setuptools-scm_6.3.2.bb
> index afbed17a2d..bc594d9620 100644
> --- a/meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.3.2.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
>  
> -SRC_URI[sha256sum] = "d1925a69cb07e9b29416a275b9fadb009a23c148ace905b2fb220649a6c18e92"
> +SRC_URI[sha256sum] = "a49aa8081eeb3514eb9728fa5040f2eaa962d6c6f4ec9c32f6c1fba88f88a0f2"
>  
>  PYPI_PACKAGE = "setuptools_scm"
>  inherit pypi setuptools3
> @@ -12,15 +12,15 @@ inherit pypi setuptools3
>  UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
>  
>  RDEPENDS:${PN} = "\
> -    ${PYTHON_PN}-debugger \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-py \
> +    ${PYTHON_PN}-packaging \
> +    ${PYTHON_PN}-pyparsing \
>      ${PYTHON_PN}-setuptools \
> -    ${PYTHON_PN}-toml \
> +    ${PYTHON_PN}-tomli \
>  "
> -RDEPENDS:${PN}:class-native = "\
> -    ${PYTHON_PN}-setuptools-native \
> -    ${PYTHON_PN}-toml-native \
> +
> +RDEPENDS:${PN}:append:class-target = " \
> +    ${PYTHON_PN}-debugger \
> +    ${PYTHON_PN}-json \
>  "
>  
>  BBCLASSEXTEND = "native nativesdk"


I think python3-packaging needs a nativesdk BBCLASSEXTEND for this to work:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2766/steps/13/logs/warnings

Cheers,

Richard




