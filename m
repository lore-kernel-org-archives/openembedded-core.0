Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.16712.1621245052459325537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 02:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dl2kYmVf;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id s22so8040091ejv.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=qkYsb+ede5NImqIyzqisLswyAWjC1olW0OWYWUEvKPU=;
        b=dl2kYmVffkijFPjM95JQ/ZeqZZ1OEUDn2o7MyhnjXSkMf2caCYnAowIavXQKSrgGa/
         THDRwU/8UQcrEJq9qdc3Tkglu9TJ9vikAlB8wjArAf2qTnUvu7vnXEqMIu3uWWFHOvLg
         DbJKoHt/n7quLexNFC6lMi8ixwkKXHMklXTOPnHBGyCHQ4FdE5UhaN8BO6YwoR/JHmoC
         UscE849Pg+8IINOUZjJOsr6JdGZREf/ZILkleb1Me9l5TEBlKz4pwxRqR/XbNONsuqPt
         BKhV6ExSQczHIqGEM+IOEzDHjF9kHjrmKYovvU55aJbFuQa81ezmq3kEmNk5j3luJiCR
         ZKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qkYsb+ede5NImqIyzqisLswyAWjC1olW0OWYWUEvKPU=;
        b=Bblonb3CkuUZVRSLf6xliMyKu5brfwkuqAv7nSOtjCcptim8Xl9kiLnv3A7PGhrEh1
         yyrZGeLtgHIpBSPz1rcJqEKvV03/WZ5QMTIqBe99nmZJaBzdSUnI0N+4bws3Oa7tWaQ8
         QZ6bF34xu5KYeAOcNWyzhJ+Bmon2Ob7kchwm98pmQbzGr4q24+icUxfoVCgQmfniLjON
         0MZSA6z+QJ1d1D1Wtg7/MtlimhEOeo/LggcF5Gq6pVezz8mHOfAi2P4b3ruYYE1kEjzO
         cGAPWPW5aTsOmeZ5AGyaSgyweokqMNIAsgx5m9pleVhM3GCZg0/jD1bJB1ocaM3voCTu
         /nRA==
X-Gm-Message-State: AOAM531NedaxH2zk3ywR53ct4j1wItB8vEnUQQ+LB3nNqcwfxT8o6Pr4
	sr84eeUrY3xZ9Mct8J+c+l6Wtfr740hTwg==
X-Google-Smtp-Source: ABdhPJzgDzmN4wZu/bKF6bFrWviNz7T1/eCZ/6nIrJ2MNACS1hr8KVlqhkBWhaN2Ic8ecU1QWR/LuQ==
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr37875974ejj.16.1621245051010;
        Mon, 17 May 2021 02:50:51 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from [192.168.10.102] (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id n17sm10485415eds.72.2021.05.17.02.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 02:50:50 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] rpm: Exclude CVE-2021-20266 from cve-check
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210517094834.2415783-1-richard.purdie@linuxfoundation.org>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <eab4eb99-b189-e8a9-d16d-d90cb748a331@gmail.com>
Date: Mon, 17 May 2021 11:50:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517094834.2415783-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/21 11:48 AM, Richard Purdie wrote:
> This is included in the release we have, it was the reason for the last rpm
> point release.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> index 2857cd730c4..760adab02b5 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> @@ -51,6 +51,10 @@ S = "${WORKDIR}/git"
>   # included in 4.16.1.3
>   CVE_CHECK_WHIETLIST += "CVE-2021-20271"
>   
> +# Fix https://github.com/rpm-software-management/rpm/commit/2e21a178fcc76565c09ed3a28624ca8aeda1880a
> +# included in 4.16.1.3
> +CVE_CHECK_WHIETLIST += "CVE-2021-20266"
> +

Is the same spelling already exists above, but is that really 
intentional, "WHIET" instead of "WHITE" ?

/Jacob

>   DEPENDS = "libgcrypt db file popt xz bzip2 elfutils python3"
>   DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
>   
> 
> 
> 
> 
> 
