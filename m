Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.4669.1611617601400192039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 15:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u8IlQScG;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id j21so4026430pls.7
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 15:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rn0WkfDA+x3altYm9RHmK3JnhSs6o/CAUuVfpvkKJeU=;
        b=u8IlQScGbCa1bSg8ybGV6IUpNZtCh+fr8VoZ1N29vtkFEWLv4cijgJDlO1sbY8Ke0+
         juIJXlfKm7k+nW+zl2Shcnff5TpRxOBiL26Ka4M71t+ZnaXgZIWxnb0q01nkgBQ9ODRh
         8PTtBJDxDmnjqT+yFkAnyGqYRHXdJmBtmIlrU8reimc/2IS1vjl2nc1P4JP3uyTYq1MC
         4wSjQti8KIopEkeKS2RYEpbbN1VO2P6QVkgN8kZl5F11zG6XJApCe2tv7gKK+YdXPA4x
         My/3bT2MlKAmvGgJIpCyBQiyLdly2cWOZKs3KSMdJI4nPLoDwu00kgZcCyqrbAq1qpbu
         Q9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Rn0WkfDA+x3altYm9RHmK3JnhSs6o/CAUuVfpvkKJeU=;
        b=YXFIyHgtAWEp0s/TppszRpJAGq9C71By09AJB2fhdcqVzufvHmNOD6a8r91EianXNd
         8+bJuMhBJK5MCUfPiQ2pXqn4I3VsB5Z0fyh/InEPpAtmAc+FHs/zTTlSCNJrMnk2zEnq
         phv7fUAiaLyEWO4LP+WgiGbT5o0qcRkG0ob9Y+aeNilhu0OomY2Fyt4/oQR78/Bldm3z
         Df81PXAHAz9kOFD+QEccMMIbOx5h+8UeiX7G+uZo6haApfVzfG15Tt5FRQWLlQcHpeCF
         eWa14gIQzCTQFHQKKfCqvYcwSnRREw7zMwfOkL4iyx06pjdSiVSkHdbjLk6YIy2hx7X7
         BRfA==
X-Gm-Message-State: AOAM530bX5Gdj86m00NdpvGjMaHPxMq61laC9nC687WXwNj1fl4BHtE2
	Aek78t46rCVgTkWEu7ddbPJiFIn6LhG9dA==
X-Google-Smtp-Source: ABdhPJxMwXYmMM1Xm7aUCBo1/01ZZLn9++u8N2x16/LlWeOCfeIY8q5g5APfIzVXgK175GXvWmH/Xg==
X-Received: by 2002:a17:90a:8817:: with SMTP id s23mr2726900pjn.67.1611617600438;
        Mon, 25 Jan 2021 15:33:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b0f2:af7b:8412:cef7? ([2601:646:9200:a0f0:b0f2:af7b:8412:cef7])
        by smtp.gmail.com with ESMTPSA id oa10sm384041pjb.45.2021.01.25.15.33.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 15:33:19 -0800 (PST)
Subject: Re: [OE-core] [PATCH] libmodulemd: upgrade 2.11.2 -> 2.12.0
To: openembedded-core@lists.openembedded.org
References: <1611553359-78953-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <afedafbd-96aa-311f-0497-3cf1b66b4858@gmail.com>
Date: Mon, 25 Jan 2021 15:33:18 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611553359-78953-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

In commit msg Can you mention why -Ddeveloper_build=false is dropped?

On 1/24/21 9:42 PM, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>   meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> index 5664df051e..fd49399cb8 100644
> --- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> +++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> @@ -6,14 +6,14 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
>              file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
>              "
>   
> -PV = "2.11.2"
> -SRCREV = "169136d708eb4df10e76247c5cc6189f0de0c13e"
> +PV = "2.12.0"
> +SRCREV = "aaed38c899a958a88a6a368a70510e350ebe336c"
>   
>   S = "${WORKDIR}/git"
>   
>   inherit meson gobject-introspection python3-dir
>   
> -EXTRA_OEMESON = "-Ddeveloper_build=false -Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled -Dgobject_overrides_dir_py3=${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
> +EXTRA_OEMESON = "-Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled -Dgobject_overrides_dir_py3=${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
>   
>   DEPENDS += "glib-2.0 libyaml glib-2.0-native python3"
>   
> 
> 
> 
> 
> 
