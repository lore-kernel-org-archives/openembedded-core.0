Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.2084.1611248710419353683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 09:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FfL6KH9s;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id v24so3510521lfr.7
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 09:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/95puVxOj8BOc0VDpNxJa2m8xb2JuHln1rdwC2rUsQ=;
        b=FfL6KH9sKSZ+5QEprzRu4d7qsbTljCBIhP8qpz5/pYYXtOCSHb4YcmZOm3EdklaeSi
         8j4M30pCzWmCaXDEjqdP6jah3LtWz6FY/O+dgGCDuYrWIROnYvBOTh2zZQdjBgrIjg9c
         nwynpyIw0lxvvxCobAq3g8YglJHwCj7if/L+7r9TdD3+V/a9A9Q6Jx4wLZwme3K7NKIC
         P6BpvZ8rDE0k5L7+fKJgFY7ZPJba1h/5kLz6CoTcykp37Gr6L5jhWabE7hse6g8Yw23W
         DCpGeey6IYpSPfC4nag4HOy9hlD5e44ajWmGlq0s0OaDAU53ELNEj975Ujml2qnsWn/g
         gJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/95puVxOj8BOc0VDpNxJa2m8xb2JuHln1rdwC2rUsQ=;
        b=NeEGehiqi4mFC8lOf11seGAkewy42160zK3m0eqluz+H5qOmb0TX7P3TeRGXFgP13D
         MeT5phPf/IJa1E+48+8Y2tX0GPxOlUX0FXjye/PVxZkOLFVuQFDphnle1eV+Y0e9h/ND
         UYTvVQgmjczw5K5nq1wb7ae0Mb0Nyo9J+LkTRfvqisb67tpiubwiDc5fp9S2rYeRNqm7
         XTxXKwVVWGhYVKCMWbbnW4RSSbPMd1ZdavU1nPDlPhcX+8kX0rIRpUHwdX9UGvJ9Bg24
         zFG4iIbtsnnS3qStzMeLtbIn7H1jIi23v29eI5v1hEDh5B14edUI4J7lnjSKuxb+WOJE
         UxXg==
X-Gm-Message-State: AOAM530ambdz198IOWGwVb3iSX3AQtQuaGTq+k6qdGmvzqQ+ta4r8VH+
	FYVpdCsV++ioneNq2BaS/sEQdWc+Nns7/VJD2s8=
X-Google-Smtp-Source: ABdhPJy4X1P3s1E0MOMv9N9+nPPfciSCFRE4SPPvkZhXqJ5v5AeeMxpowHmzBnVwH29mqd2R6FVCnzP97z0JHoMiZuA=
X-Received: by 2002:ac2:5b49:: with SMTP id i9mr97963lfp.50.1611248708609;
 Thu, 21 Jan 2021 09:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20210121152650.618875-1-quaresma.jose@gmail.com>
In-Reply-To: <20210121152650.618875-1-quaresma.jose@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 21 Jan 2021 18:04:57 +0100
Message-ID: <CAHtQpK6HNN34iJY6aQ9iEcyKRfUC7YF2tsoMcMODA4gKJiOJ_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glslang: upgrade 8.13.3743 -> 11.1.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Jose,

On Thu, Jan 21, 2021 at 4:26 PM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> License-Update: Add additional licenses
>
> - [1] BSD-2-Clause & MIT & Apache-2.0
> - [2] GPL-2-with-bison-exception

This should be rather GPL-3-with-bison-exception, according to the
commit link you've posted.

As this license does not exist in OE-Core - I'd suggest you introduce
it as well.

>
> [1] https://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c609289666b60741b8
> [2] https://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3fbe6a4d54e3817a8
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb}   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-graphics/glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb} (75%)
>
> diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
> similarity index 75%
> rename from meta/recipes-graphics/glslang/glslang_8.13.3743.bb
> rename to meta/recipes-graphics/glslang/glslang_11.1.0.bb
> index 2c4f4be5a2..1afa46954c 100644
> --- a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
> +++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
> @@ -5,15 +5,15 @@ of the specifications for these languages. It is open and free for anyone to use
>  either from a command line or programmatically."
>  SECTION = "graphics"
>  HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
> +LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
>
> -SRCREV = "e05cc20ec20a154d94256c744a3837c23719c0f9"
> +SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
>  SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
>  UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
>  S = "${WORKDIR}/git"
>
> -PV = "8.13.3743+git${SRCPV}"
> +PV = "11.1.0"
>
>  inherit cmake python3native
>
> --
> 2.30.0
>
>
> 
>


-- 
Regards,
Andrey.
