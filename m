Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.6307.1631262480626734659
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 01:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mne3yfng;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id m2so637622wmm.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=bqtukeC0QsIWRpOK7E9AphbTzhkwJg0Ddvj87qpwv9s=;
        b=Mne3yfng56ZvZGCEZATSsF49Xs5xrVe9RX+FcZYcPiZp+C6I0kXvkd32fljztSwY2g
         kVA6/fiSeXLEEDhO3G/5HRw6/jz1vkf0wvlBSW6haMid8UAfgryuz+Gt748hmjCjc/4x
         YGWPdwnogI1SuHav9gegDwayyXfVjplZflOBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bqtukeC0QsIWRpOK7E9AphbTzhkwJg0Ddvj87qpwv9s=;
        b=AhmQpFTklRkv7q8VF8EkB1fMXhgR3CpmmNnflmu4ZPWGbKYwu/OruVLMInURIsLKW4
         BMVF32RXzCrD4AIccAuVdNYeJQooS+6+GLGQzLQJ5CMcFerhQkDUL87gq3bszBIlz9ZG
         tyfAZ25fXi80Xh/6IPsVELUPQnfD/5HdeaaFFu4wpCk2Y49W1q8LJd1T50sEjzDddD1N
         0djJtlBnvJzeUokS/qgGquxG/I4vbAM/bUZj2OnKt2yAKDd2kxc58K4NHCMJQpiXWKSH
         rK5ITgXovr/WW1shWnuE1W1ebyP11yRMPyyZSH/anNhtdOXiAM+hDQBA920CkkXRka6d
         ir7Q==
X-Gm-Message-State: AOAM533zjpLeKMb2OicOqy/LsDKhiSea/JEUxqVxyWvCXN46dF2lRx6U
	vdtX5n7BigyeD8GKdpMJlisRJxD1lO4JJFCl
X-Google-Smtp-Source: ABdhPJxzKvNPT+p/afVgTN7T4pCL3ChvYObDiEtNFheZYCqoByAmfAdU+dGicZWmFI8enWjmH8fVHQ==
X-Received: by 2002:a05:600c:3542:: with SMTP id i2mr7019653wmq.170.1631262479199;
        Fri, 10 Sep 2021 01:27:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45? ([2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45])
        by smtp.gmail.com with ESMTPSA id k18sm3642857wmi.25.2021.09.10.01.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:58 -0700 (PDT)
Message-ID: <e30702440326f7af69aefd980c2cd569dbf40b70.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] tar: add pkgconfig for selinux
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Sep 2021 09:27:57 +0100
In-Reply-To: <20210908080505.29681-3-mingli.yu@windriver.com>
References: <20210908080505.29681-1-mingli.yu@windriver.com>
	 <20210908080505.29681-3-mingli.yu@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-08 at 16:05 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Add pkgconfig setting for selinux.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-extended/tar/tar_1.34.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
> index 98755a11cc..a6a417a1a5 100644
> --- a/meta/recipes-extended/tar/tar_1.34.bb
> +++ b/meta/recipes-extended/tar/tar_1.34.bb
> @@ -16,6 +16,7 @@ PACKAGECONFIG ??= ""
>  PACKAGECONFIG:append:class-target = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
>  
>  PACKAGECONFIG[acl] = "--with-posix-acls,--without-posix-acls,acl"
> +PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
>  
>  EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
>  

This breaks one of the selftests, you could reproduce with

oe-selftest -r oescripts.OEListPackageconfigTests.test_packageconfig_flags_default

however I've added a patch to fix it.

Cheers,

Richard



