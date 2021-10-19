Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD39C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 16:44:50 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.12564.1634661890017613283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 09:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WLGWtlNP;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id v20so14064896plo.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 09:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=wvwt6xKEKYUh3vVxC0vCCnLjrYiqBKa6LXxdBRIECf8=;
        b=WLGWtlNPr3OlHRxVQhAUPQ7rfDyYQFjdmsZcwbFJmU2h7Fv2m37ZPy6q5gsTIdxGs1
         owQR7xMqOYTkm+f3cWmPfmBBAsox/Y9Rvu84sSewqzDkVi9DFFbzGhS21C36K2YrGquQ
         xl7J/zpUBBnLbUX/Qtfsxstp6kXTHEfNeQArlFmGEwPmCJtrsntWmTqoed+fKxd0o1XJ
         gi4dKtPh8G/gYyWWeDlYvbIbjSsDDWP+nj4CvYPxqGwpUlnfMdXYPAq1EBJMNJ9rHQEk
         XXbXpxCJ9Ot6D4/otN47+TzZ1dDX7mUiiXuxHEmwUpwSG2noG+zfPy+GdLAtggkRvkNw
         lDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=wvwt6xKEKYUh3vVxC0vCCnLjrYiqBKa6LXxdBRIECf8=;
        b=eaAxHGCmyQc8Zt01UnWpU8Xa1KwQpjfB2oNXgX057vjIihZtZZLaqM+6u55uTyepIE
         fjiQOE+vqZkFZJ1595j/4D7CrKLIZ0Bxt76SDY23t33SZ0y6stvfxEfUfj9TYYcmvxmM
         IPlBLHG7nM9ME9yH8+HWfrchSHlrZBZoye3W7LkrXMUjMJro/yw447flCYPS8D331sHC
         HzciqnC1JTeOHqTtLVBnqdPT0bnne1xYn0WxJIx9A4ypPXOLUaPIuJDoymcbyBUEXdla
         5M7e5oS5zjMwsMWV9KJbHZ8ylGY/S16e+WrxawaBRiuqZlIHUEY/r28zpTBFcj9XrIat
         rBNg==
X-Gm-Message-State: AOAM532X7cAl7lOHJfJUrh/0QW4fXjInA1b/mSQDH3Svrcb8dYAcCDV2
	eBWt7p1y5nxkLOszGP972e4=
X-Google-Smtp-Source: 
 ABdhPJyTFPC8oZ2mWrC1EQRIyxnlGFwg3LwfOJ5BET69i653EUDBqh1EANryvuDnwlwSIMLiqkFw8Q==
X-Received: by 2002:a17:90a:55cb:: with SMTP id
 o11mr1112597pjm.244.1634661889375;
        Tue, 19 Oct 2021 09:44:49 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f9fc:73ad:7653:581d?
 ([2601:646:9200:a0f0:f9fc:73ad:7653:581d])
        by smtp.gmail.com with ESMTPSA id
 oc8sm3515213pjb.15.2021.10.19.09.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:44:49 -0700 (PDT)
Message-ID: <968cbfa1-7d80-11d2-d6ab-e050ea855799@gmail.com>
Date: Tue, 19 Oct 2021 09:44:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [OE-core] [PATCH 26/65] psplash: upgrade to latest revision
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-26-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211019153419.3319802-26-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 16:44:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157187



On 10/19/21 8:33 AM, Alexander Kanavin wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/recipes-core/psplash/psplash_git.bb | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
> index 1be7ece79d..1d410bd548 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -6,9 +6,8 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
>   DEPENDS = "gdk-pixbuf-native"
>   
> -SRCREV = "0a902f7cd875ccf018456451be369f05fa55f962"
> +SRCREV = "f5203fdee61b90ef9552ca49c213fe16776b3e4b"
>   PV = "0.1+git${SRCPV}"
> -PR = "r15"
>   

Since PV is not bumped. Resetting PR will break feeds


>   SRC_URI = "git://git.yoctoproject.org/${BPN} \
>              file://psplash-init \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157145): https://lists.openembedded.org/g/openembedded-core/message/157145
> Mute This Topic: https://lists.openembedded.org/mt/86442672/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

