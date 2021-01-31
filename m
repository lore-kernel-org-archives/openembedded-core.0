Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.17397.1612093315961650680
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 03:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VnrCJsLn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id i9so10761302wmq.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 03:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=A9WAVf5pyK0/vJHx+A46JBOZjY4V+SeDGd6ZLbOEeSU=;
        b=VnrCJsLnHUJj0weM7p7fwxo1nMXmevT2Ki9eHBB8yW76Gp4CFGEldByEM5iyTruwXe
         YIlYuGheOlNmQu4MiJpniOVCHc5Vo6UxS8uXhK26gzfveTP87kocmTF8asW5Y4lS845k
         FYvB9XztkR8c6gY1sLT6cjIv19vf/9fJ4Sm18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=A9WAVf5pyK0/vJHx+A46JBOZjY4V+SeDGd6ZLbOEeSU=;
        b=EJAO/N8/7PIjrTU93pS3779E8tLgsVePXGe+g1k9zb7rxWzGPTdZ9t2T3nb7Epzje9
         OeNXDnqfN84WLmFzRM2BYS1MIC0pkXLLmdR56k+w/XeLUDrHTD9bEQ/ogAcv3NCQr2Jc
         TSnD9htHTshTnVq0Sfbaqm3GSNI2FyufA8ifaOa3OhxpNk+N/iqVn0mknO0MVDg5e+3i
         SocRn2yZMd/qXoLncKN2Yke8S3NNb08KfB+zhckM2IbIiPyG66X4HtGt7Bw1YiTZlziI
         uUNBoModspGB/HPnQ+heAvga/xOieZM5aaVRzLxgOUm/q7uod5zY8s0sALb+3owFGSfG
         z28Q==
X-Gm-Message-State: AOAM530nozVoaEm32m77FAEBOgcCFWm+EtfW0a6xgm2QLRoGgZUANf22
	mheos0D295ap7wpduLN9tSFwxg==
X-Google-Smtp-Source: ABdhPJwraHjpwNGIDYUMPv/DfhyupqnmhYw80W4baQIVomJNbG0KdAwdf8cvqP2+He9DpT1MPYIzsQ==
X-Received: by 2002:a05:600c:198e:: with SMTP id t14mr10802231wmq.109.1612093314413;
        Sun, 31 Jan 2021 03:41:54 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29f7:5a4e:c660:258e? ([2001:8b0:aba:5f3c:29f7:5a4e:c660:258e])
        by smtp.gmail.com with ESMTPSA id s25sm24380440wrs.49.2021.01.31.03.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:41:53 -0800 (PST)
Message-ID: <2526810fa97531f7e8245ed1f265ac3a7ba2b0ee.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>
Date: Sun, 31 Jan 2021 11:41:52 +0000
In-Reply-To: <20210120050318.10376-1-Qi.Chen@windriver.com>
References: <20210120050318.10376-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-20 at 13:03 +0800, Chen Qi wrote:
> Build error occurs as below:
> 
>   ERROR: igt-gpu-tools-1.25+gitAUTOINC+d16ad07e7f-r0 do_package_qa:
>          QA Issue: /usr/lib/libigt.so.0 contained in package igt-gpu-tools
> 	 requires libprocps.so.8(LIBPROCPS_0)(64bit), but no providers
> 	 found in RDEPENDS_igt-gpu-tools? [file-rdeps]
> 
> Add procps-lib to RDEPENDS to solve this issue.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> index 89480d79d2..b012dbf58e 100644
> --- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> @@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
>  S = "${WORKDIR}/git"
>  
> 
> 
> 
>  DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
> -RDEPENDS_${PN} += "bash"
> +RDEPENDS_${PN} += "bash procps-lib"
>  RDEPENDS_${PN}-tests += "bash"
> 


You are correct about this and I see the same issue if I build it
locally. What worries me is why we don't see this on the autobuilder in
world builds?

Cc'ing Anuj as the maintainer.

Cheers,

Richard


