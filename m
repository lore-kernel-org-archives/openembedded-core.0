Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.509.1623965124450472325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 14:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n/HgEjh+;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id o21so3609184pll.6
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Se3SH5VOns5a/WI/Yt8K4AA0QR6N5fZSbpf6KlIMBLM=;
        b=n/HgEjh+2D9a5vnBLm9hc3xB+1b5BQrHOplTCONU6PkMr9N0ynONXgOBXQnQzBT6qy
         pGzdczH7xHiTeV+OkeZjTMcLHHzbYOTwbvbHTsAIjjrbzeHUEmUU+48+u/0aTeI4dOwk
         LrokmhRtrn3zDfwPCNowaXl2Eoei7NKsnX0Jf1yDF1Lx9Mq/DhHkbDTglMs9+sfX99t4
         MR+DqU2p706x1BYUdDdH5um7W0brIaqcRWvUZ6C7b95MO7+oYT/JXfuek6B7s3Bv0sgy
         aI+EIdHhGvPsFXGnIvlrXlrzzoPabCoDMfrs3UXqfSsGz+x3nA7Tz+jmEPlNzCVrBCFe
         NiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Se3SH5VOns5a/WI/Yt8K4AA0QR6N5fZSbpf6KlIMBLM=;
        b=BI/LFi/3f37n1mYEyR5O32THiVB7kpV864Kx1IZRqoAShCyIbgM2DzrnumFkS4/UQO
         4IKAf+alH4lHhDM1dBbVPIDcAK/Xhou5l719ZIILmdedouT50LaQzcuTFA9dthJdK8ty
         ynsyj7gCrxPytivoFibOJycMSi0GPrGJFeSM+fpp9JIEDxN220IbX0AZXysNoe3sC3vW
         xfJbh7d7yNxXr+YxsMQP3X6gz27JUX9rZbY3T2Bz+EcwBFGrSHnffprZw6aMFXM4bwpQ
         6PN4aZcW/M1aq75Pl8AuXM5ZrnsMFrcSUcO8AHLy8V8a3g8OJ9wBRLTshNmyEOJyyw7Z
         mmmw==
X-Gm-Message-State: AOAM5306Lse6/6on5w0Xeq4x93ct9HlFC2+W4yHP+RfSbxu8pRy8xy4j
	wgyVNslUmzopnCyfNr782I5g3VfFeuQ01Q==
X-Google-Smtp-Source: ABdhPJxTuScNOj/W9Gzu5mQAf7R8kGwTgS4BG25eO4o9Y1jlJdzhvRvFOFlXKGEe+C/Qy0GCE3uYqA==
X-Received: by 2002:a17:902:6a84:b029:f2:b1f1:a8c0 with SMTP id n4-20020a1709026a84b02900f2b1f1a8c0mr1786919plk.13.1623965123549;
        Thu, 17 Jun 2021 14:25:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:547b:1a51:8143:a5fd? ([2601:646:9200:a0f0:547b:1a51:8143:a5fd])
        by smtp.gmail.com with ESMTPSA id f28sm6536453pgb.12.2021.06.17.14.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 14:25:23 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] glibc: fix path to place zdump in the tzcode package
To: Tony Battersby <tonyb@cybernetics.com>,
 openembedded-core@lists.openembedded.org
References: <e28daac3-9131-6f27-f8cc-577b821323d1@cybernetics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c60f1f1c-a16b-d850-72c9-f87a04b42aef@gmail.com>
Date: Thu, 17 Jun 2021 14:25:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e28daac3-9131-6f27-f8cc-577b821323d1@cybernetics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Thanks, I think this needs to be backported to dunfell and other 
maintained releases too.

On 6/17/21 12:06 PM, Tony Battersby wrote:
> zdump should be included in the tzcode package but is instead included
> in the glibc-utils package due to an incorrect path in the recipe.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14427
> 
> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> ---
>   meta/recipes-core/glibc/glibc-package.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index 8d0cc8047f..8841c5e3ca 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -43,7 +43,7 @@ FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
>   FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
>                 ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
>   FILES_${PN}-mtrace = "${bindir}/mtrace"
> -FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
> +FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${bindir}/zdump"
>   FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
>   FILES_catchsegv = "${bindir}/catchsegv"
>   RDEPENDS_catchsegv = "libsegfault"
> 
> 
> 
> 
> 
