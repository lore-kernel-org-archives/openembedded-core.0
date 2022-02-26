Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D47C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 07:28:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.3919.1645860479699304136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 23:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BlK0sxcW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 n25-20020a05600c3b9900b00380f41e51e6so2962692wms.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 23:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Rn9GYap662DhkIZtf+I1iwjPg6fFUHYECVuNzBwnTjQ=;
        b=BlK0sxcWSFXkwOnDSqUJY8dDFMY8Nrr9n1zS++6uDkAG3TRdf0224nw/ZcPsArTumy
         JnQNqVucEJu1EGOQH+WgTlf7i9V15dVn5o+i7X4mkBlgoHR0S4cvpATN/eE51o2KvPei
         xPllUA3HZxu8t43BdYEXEJCyx8AHiGlV0/x0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Rn9GYap662DhkIZtf+I1iwjPg6fFUHYECVuNzBwnTjQ=;
        b=ChnutnlhlJshb7uRmi553q2jgUwVGJEqVKuNTPE3qVEujd8EQ1kr075ItWy3JcGNJd
         FO3LN6Tn3zec7tfRhHAciqLBq0LSi8TopdKrhD6qGTXUzsG9ONqLcTkNyN8vU4OfjfX5
         8mIhHQEGbaWrWpT+dkxl4wTPkwuLAYDGMnrGmwYgN2f3Oc7oNty4uh3+Z/194e/BRd3v
         jKbxD+cKNzlMwxD6/sbyBastiRHTUv+iy6gjLUmrdGmORbyG8Cjsew1bJbZfuGYvUIwk
         CuTYCCx84fppGpihxo4yIIZX4A/O5y5gmVJ/i84CObN/a/eWY1cBW8g6Vo2zlSKDJUKg
         FSww==
X-Gm-Message-State: AOAM530KQXQ3c8MmSGanfMvxw9RgdD0dGwbXaXu4IsoThUpBiE0peRBt
	XsG/Xe9imvVPmP9KFURVjcKHlQ==
X-Google-Smtp-Source: 
 ABdhPJzqj8NmJapZH+mVpz8dr/U9lQVPQsgyDxWvY4tA1IO0Vb1Efccd6IaGaW6ERifvxgtLV2VnlQ==
X-Received: by 2002:a05:600c:a03:b0:37b:daff:6146 with SMTP id
 z3-20020a05600c0a0300b0037bdaff6146mr5633916wmp.85.1645860477863;
        Fri, 25 Feb 2022 23:27:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3901:1ac2:e293:e734?
 ([2001:8b0:aba:5f3c:3901:1ac2:e293:e734])
        by smtp.gmail.com with ESMTPSA id
 k19-20020a05600c479300b00380e461a4d2sm10256981wmo.0.2022.02.25.23.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 23:27:57 -0800 (PST)
Message-ID: 
 <75da2ee2701f904fb0dd7f898eebf8f6927534b8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] setuptools3.bbclass: add check for
 pyproject.toml
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Date: Sat, 26 Feb 2022 07:27:53 +0000
In-Reply-To: <20220225234317.668778-1-tim.orling@konsulko.com>
References: <20220225234317.668778-1-tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 07:28:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162421

On Fri, 2022-02-25 at 15:43 -0800, Tim Orling wrote:
> From: Tim Orling <ticotimo@gmail.com>
> 
> With help from Peter Kjellerstedt <peter.kjellerstedt@axis.com> via IRC.
> 
> Add a check for pyproject.toml in ${S} and if so check if it has a
> [build-system] build-backend. Give the user a helpful warning that
> the recipe should be changed to one of the PEP-517 classes (instead of
> setuptools3.bbclass).
> 
> Add SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK variable to skip this check (and
> avoid the warning). This is needed for e.g.
> python3-setuptools-rust-native which does not build cleanly with
> setuptools_build_meta.bbclass
> 
> Because some sources have a pyproject.toml but no [build-sytem] or no
> properly defined (or accurate) build-backend, add a try: except: clause
> to avoid KeyError.
> 
> [YOCTO #14736]
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/classes/setuptools3.bbclass | 41 ++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
> index 12561340b07..d80a91d3296 100644
> --- a/meta/classes/setuptools3.bbclass
> +++ b/meta/classes/setuptools3.bbclass
> @@ -18,6 +18,47 @@ setuptools3_do_configure() {
>      :
>  }
>  
> +SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK ?= "0"
> +
> +python check_for_pyprojecttoml_build_backend() {
> +    import os
> +    import tomli

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4833/steps/12/logs/stdio

Exception: ModuleNotFoundError: No module named 'tomli'

Cheers,

Richard

> +    from pathlib import Path
> +
> +    if d.getVar('SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK') == "1":
> +        bb.debug(3, "Skipping check for build-backend in pyproject.toml")
> +        return 0
> +    warn_string = "The source has a pyproject.toml which declares '%s' as a build backend, please consider 'inherit %s' instead of inheriting setuptools3."
> +    warn_layer_string = "The source has a pyproject.toml which declares '%s' as a build backend, please consider 'inherit %s' from %s instead of inheriting setuptools3."
> +    pyprojecttoml_file = Path(d.getVar('S'), 'pyproject.toml')
> +    if pyprojecttoml_file.exists():
> +        bb.debug(3, "pyproject.toml found: %s" % pyprojecttoml_file)
> +        with open(pyprojecttoml_file, "rb") as f:
> +            pyprojecttoml_dict = tomli.load(f)
> +            try:
> +                build_system = pyprojecttoml_dict["build-system"]
> +                if build_system:
> +                    bb.debug(3, "[build-system] found in pyproject.toml")
> +                    backend = build_system.get('build-backend')
> +                    if backend:
> +                        bb.debug(3, "build-backend found: %s" % backend)
> +                    if backend == "flit_core.buildapi":
> +                        bb.warn(warn_string % ('flit_core.buildapi', 
> +                                               'flit_core'))
> +                    elif backend == "setuptools.build_meta":
> +                        bb.warn(warn_string % ('setuptools.build_meta',
> +                                              'setuptools_build_meta'))
> +                    elif backend == "poetry.core.masonry.api":
> +                        bb.warn(warn_layer_string % ('poetry.core.masonry.api',
> +                                                     'poetry_core', 'meta-python'))
> +                    else:
> +                        bb.warn("The source has a pyproject.toml which declares '%s' as a build backend, but this is not currently supported in oe-core." % backend)
> +            except KeyError:
> +                bb.warn("The source has a pyproject.toml, but either no [build-system] or it is malformed. If the recipe is still buildable with setuptools3, you can skip this check with:\nSETUPTOOLS_SKIP_BUILD_BACKEND_CHECK= \"1\"")
> +                pass
> +}
> +do_configure[prefuncs] += "check_for_pyprojecttoml_build_backend"
> +
>  setuptools3_do_compile() {
>          cd ${SETUPTOOLS_SETUP_PATH}
>          NO_FETCH_BUILD=1 \
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162414): https://lists.openembedded.org/g/openembedded-core/message/162414
> Mute This Topic: https://lists.openembedded.org/mt/89401217/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [richard.purdie@linuxfoundation.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



