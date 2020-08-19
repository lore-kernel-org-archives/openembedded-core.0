Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.83988.1597819861816688662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 23:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dyr4tsov;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id 77so20707286qkm.5
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 23:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OzeK0AnyGHR6dWznVgae6YdLsxFXddjCog+G2hGnm4E=;
        b=dyr4tsovg096F57GLE8RJwXFctFI0TyRJ97PLQI3ESNI2Wv4rO7Ek35YACXgOCz6Q7
         ANDMnHk7dTkKcjXJFFLqU7WlskEM+wiDlH8Aj22M8s9TO7g+XyFC1f6YcOC3YB42xwZp
         /bwv8WBm+1CKspFwBaz3uminQOpsW4mrJeInZ/5eiq8kn+Mh6EFMZ8hM4WYi8azB5Kpi
         ACCRDNQecq9FNx7LHr+0Jb8QXOIk9+W6DysJ6feEhcpU4jl8bTsxvp6CNLupNR5aB6G6
         68lW8EsNevk2aN/u+a0wX4qN0HmYOirlThTw676n5TRlCFTHaGCxZ53sqH0m4hKCHU3V
         WnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzeK0AnyGHR6dWznVgae6YdLsxFXddjCog+G2hGnm4E=;
        b=crnlmOkMAHw4OCHu1jfXclpfQji6raUHy4rJ+FQ6TCuimhEM+7NSVOyxg874EfhY4c
         NPoVlEy3rGqBSiyR61JndLH+eQKCcdGlzFutWPufR8OyGuDtYcrcxYxsnM2BS6WCwZ4D
         kpwmodkjDAh3EcLPs1gLYp3WFl/P/CmqU5bOWl4GfywvDEG71YBNGPzHoxdpPEyLqN8I
         5DIttf0MbtP/nCw5h8uOQzd7t13x7dEFPFLtnWyHJ6lgrXRwEsL7RYi3MPc7y+QuGwXl
         m7/SpBw5VUD19Lcg0SrwwVLp6UPXzBhsjI3Fhla7bWjr9GrHDeL5qlc8U+46ou/VILNn
         TTUg==
X-Gm-Message-State: AOAM532ITPM7mQWnr9hhTKquAxfzLPJirGGdtXcrt75n7sajtWCAP6iH
	FfVU+D/H0aoXWnfAWdSvhrYxaiyhlwa+fs/jMwA=
X-Google-Smtp-Source: ABdhPJyws/ZNnpShPt2KoSU0dFyWDGZXYnL1YFs7L2Px734OJlPx/ZQlMW0NXRou+xbIaW60LPpSXQs9eqP2FitAGE0=
X-Received: by 2002:a37:a0d1:: with SMTP id j200mr20760175qke.212.1597819860747;
 Tue, 18 Aug 2020 23:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200819053439.3241164-1-lachlan.archibald@opengear.com> <20200819061323.3247373-1-lachlan.archibald@opengear.com>
In-Reply-To: <20200819061323.3247373-1-lachlan.archibald@opengear.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 18 Aug 2020 23:50:34 -0700
Message-ID: <CAMKF1srZhAkK8UsPvnQDoKiNPM9nac97-B1o8Yyzc_Xdn9Es6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] base-files: Add directory /var/empty
To: Lachlan Archibald <lachlan.archibald@opengear.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 18, 2020 at 11:14 PM Lachlan Archibald
<lachlan.archibald@opengear.com> wrote:
>
> /var/empty is commonly used as the home directory for system users that do not
> have any other dedicated directory.
>

There is no "standard" empty directory specified in FHS so we need to
justify why we should always create this directory
which dameons need it or other applications that depend on /var/empty


> Signed-off-by: Lachlan Archibald <lachlan.archibald@opengear.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 94299431f6..ff706637fa 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -39,7 +39,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
>             ${libdir} ${sbindir} ${datadir} \
>             ${datadir}/common-licenses ${datadir}/dict ${infodir} \
>             ${mandir} ${datadir}/misc ${localstatedir} \
> -           ${localstatedir}/backups ${localstatedir}/lib \
> +           ${localstatedir}/backups ${localstatedir}/empty ${localstatedir}/lib \
>             ${localstatedir}/lib/misc ${localstatedir}/spool \
>             ${localstatedir}/volatile \
>             ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
> --
> 2.26.2
>
> 
