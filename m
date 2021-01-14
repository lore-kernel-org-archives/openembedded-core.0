Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.3915.1610640900770880274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JhrG42R1;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id l200so6414270oig.9
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eMYcxhnaxbTuUnl3yfhkYglLP0bnSWLyofzMzeKyWx0=;
        b=JhrG42R1hakxe6I4vnqEdIAlDvh0vX+HZDDBVDptMBo2hYOg3370MBkQLve+Lnplal
         rRji4TfaF7x8t+a7Rjn96Dk6qDYNok6YQbQWs2RIEhKROd1lNoB+nUufhF9ViTT246ja
         eFAB9An3B+XCTAFviXdY3hU571b540b1v0uFA9V1g4YHq4X9A+sHNnVEdq2Ag4J3fTQC
         57UXu6pB7DLufhIKyNmhzA5ZlCuWJmUZl49l/Y/UeRLPd+bCQp6UAsSFC6wZSoNNuE74
         tZZRxczL3n1RXFGcjnBT5+ivXSWOkTYa+lhiDtqsVninylqBm+2Lrw+1edY8B+2UwQaH
         ejWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eMYcxhnaxbTuUnl3yfhkYglLP0bnSWLyofzMzeKyWx0=;
        b=iFxz8Fp2qzIzm3U1nskixV07aLjQ4qaJN5RHZ0htWDyp1yyYAVVNCPHTq9J8kyGzq+
         hqaYfYjm0dCcDf4AkYSkAMkCugsZq+/TyPV/xuxMo6cXY/4xnfGvyEBNY1zS1iUwYErD
         zUcJ31HmMIVacWnvdVLsi/hkkX8X8/xxyZ+t3+N2T+VHVsZgIkR6MOT6+2yNBR6c37EB
         /FMbxVa1eo36kHKw1atDdFPt1Zs72o7AzZaSyZO9DgbuiPqwZvzYPa8w+3iibSyGKk0y
         G/koaYEViK6s3XRw6BXmJwaXLx7w+B16Azl5T/HVjJXS8RQaF8A7J7oGAA8mVQuFDLM5
         0Feg==
X-Gm-Message-State: AOAM533Xzf3x4PiMpdC/y5PyHjgtl+OqkmreKyYVFSLpds1/gV3tekiv
	RQwgmCFjNVdDZg1ldKxAijM=
X-Google-Smtp-Source: ABdhPJx9e6Auxh6WQHovhzL1RVxYLh28vY0I3iWsTbIOuLIZjRXbaXqVhwkguVNGPa4CvvZgqmakBw==
X-Received: by 2002:aca:e0c5:: with SMTP id x188mr3095690oig.20.1610640900158;
        Thu, 14 Jan 2021 08:15:00 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id g12sm1177013oos.8.2021.01.14.08.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 08:14:58 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] fetch2: git: Append the password to the username on git URI reassembling
To: openembedded-core@lists.openembedded.org
Cc: Dominik Schmidt <ds@technokrat.ch>
References: <20210114161153.17719-1-JPEWhacker@gmail.com>
Message-ID: <267dc42c-ac1f-8955-b67a-4f8a8867adee@gmail.com>
Date: Thu, 14 Jan 2021 10:14:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114161153.17719-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Argh, sorry. This is not what we want.... I was supposed to make a 
different change and forgot :(

On 1/14/21 10:11 AM, Joshua Watt wrote:
> From: Dominik Schmidt <ds@technokrat.ch>
>
> This allows the users to specify SRC_URIs of the form
> git://user:password@host.tld/path/to/repo.git
>
> which allows pulling in private repositories.
>
> [YOCTO #14065]
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   bitbake/lib/bb/fetch2/git.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
> index df9538a60d..a1356ed9f0 100644
> --- a/bitbake/lib/bb/fetch2/git.py
> +++ b/bitbake/lib/bb/fetch2/git.py
> @@ -606,7 +606,10 @@ class Git(FetchMethod):
>           # removing the password. ssh keys, ~/.netrc and ~/.ssh/config files can be used as
>           # alternatives so we will not take patches adding password support here.
>           if ud.user:
> -            username = ud.user + '@'
> +            username = ud.user
> +            if ud.pswd:
> +                username += ":" + ud.pswd
> +            username += "@"
>           else:
>               username = ""
>           return "%s://%s%s%s" % (ud.proto, username, ud.host, ud.path)
