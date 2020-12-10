Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.16903.1607619956482713910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 09:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qUlSM2Fi;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id v3so3071149plz.13
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 09:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=+xR7LM2UjZye7nLg7zwHr8Gv2vTp5fmpz4SmjKAbl9k=;
        b=qUlSM2Fi3RZ1XcgeKODibpNdIyhxr41cB1fdDND2SMnwFyB9tywzu2hd/ud2auMNwE
         BgRBYy7FxulVgNkW/0V3By7zHUYmxumiZ8ouTo7ORgdn+LOXGvQSLAENT9Ll3hOM5zhA
         QeCaxZjVur2sjtPKa1Qa++N5K/Z61xzsP9Hw/FAHp+S47rWX5v+O3+1leoeMU8zMoMXj
         Z3hToHTYY/K7UGJXi/rGWJ6I0g43t+5Tuvp7i23cspvQm6Pc+7MRA2SN8jil6rHOiiEu
         ahhwhyWV94T4xMxKE+oLi5DIrOwlrpCle3LCTKXNjSeX4USCAbpu6zZU9pPHUZSzLHik
         kkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+xR7LM2UjZye7nLg7zwHr8Gv2vTp5fmpz4SmjKAbl9k=;
        b=TJPFbyAAq6/PJlSB7vV+uCUrgCZ3Wtzem5PsT9pgCSlIkiacnIVrVlKo8JsPb+FutE
         wY0ze7P2unEalh6khrLQXqlySqb2YmTpI1LdDP5OvPZqqKVERetxMRiPX7E60Q4iIiBz
         wcjMY/VmunLfWodD22SETnBobE0GzN+cLgao32TQb2D5MuIeE4+R2I7WO0Fih0hUI/WR
         bq4r3z5/9VrOl4kpDiLgeJPWUx4VCJArQH6AG3/tTVTYtw775d+Zu9zu2rwLe0MSMwwX
         4DrvZZMq+fVxOGlDmwWZgFkumagouLnWjTJpx15dpxxSRkCcuxLTCxdDSUD94/RTIVA7
         AXDw==
X-Gm-Message-State: AOAM531blXLfOHNv22wsMEVfA1vfnpzc5oYyFS+zNL/SXZThg/yFAgq+
	kGCHq4gge1M0F/CPF7hMT+cfwSOAvy2Myg==
X-Google-Smtp-Source: ABdhPJz9SCq/tn1I5sqxStgoZsReGDDVlGxnEJYlMedK2WVqjSCcr0tOa813n0kZnF/DXkcC4AEJPQ==
X-Received: by 2002:a17:902:a986:b029:db:cb2b:8bdb with SMTP id bh6-20020a170902a986b02900dbcb2b8bdbmr7106181plb.40.1607619953851;
        Thu, 10 Dec 2020 09:05:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::5bf5? ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id fv22sm7367218pjb.14.2020.12.10.09.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 09:05:30 -0800 (PST)
Subject: Re: [OE-core] [PATCH 2/5] systemd: add package config for systemd-oomd
To: Luca Bocassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201210125312.3302065-2-luca.boccassi@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <184a087d-adf6-5a7f-a615-be41030e3648@gmail.com>
Date: Thu, 10 Dec 2020 09:05:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201210125312.3302065-2-luca.boccassi@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/10/20 4:53 AM, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Disabled by default
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>   meta/recipes-core/systemd/systemd_247.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
> index bf73630569..f20c2cffb7 100644
> --- a/meta/recipes-core/systemd/systemd_247.1.bb
> +++ b/meta/recipes-core/systemd/systemd_247.1.bb
> @@ -157,6 +157,7 @@ PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
>   PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
>   PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
>   PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
> +PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"

I wonder if it should be packaged into its own package and built always 
so someone interested can just add it their images instead of modifying 
packageconfig if its an independent feature.

>   PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
>   PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
>   PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
> @@ -565,6 +566,7 @@ FILES_${PN} = " ${base_bindir}/* \
>                   ${bindir}/resolvectl \
>                   ${bindir}/timedatectl \
>                   ${bindir}/bootctl \
> +                ${bindir}/oomctl \
>                   ${exec_prefix}/lib/tmpfiles.d/*.conf \
>                   ${exec_prefix}/lib/systemd \
>                   ${exec_prefix}/lib/modules-load.d \
> 
> 
> 
> 
> 
