Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.2145.1614540018666507969
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l3NZxXN4;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id u11so8529426plg.13
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=do53F5OLDAzJuWscf3Vo8GTk/6vZeTx9AyYwVgiMGZI=;
        b=l3NZxXN4dYw6uJTU1k1ZZw53iKK3UiRWWv02iVFLwSwAU8+5IjwyjPcQpzhqxSzhx6
         4zxyPOUOk+8eRjbx8PZV/P1h+wqZ7lD6CLWW3JvnDbefCjODjaFSOhhpmmdq5nhz3RYv
         XCSdlXakTTINfJW8y93rGLdbPIIlhlYNMuOv3JeWXn4yC7WoVMRLPYodQ8aMkx/lrnpL
         CyKv+ujJsXaFLalm6UXfPtOI3fgxikkd4RS1pN/mARolO+nsnkHPJ7gvlLGClLW8jB0V
         oi8MWNu9UAJu8z5vxKYtYg0qyinVF/ySZoHR41gytf+qzi0zGC2aWZspfcnRMN14SXLm
         BJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=do53F5OLDAzJuWscf3Vo8GTk/6vZeTx9AyYwVgiMGZI=;
        b=RLpC3SJblonDjCX4lz4CfO3H/H7sUqnRUNMk06HNIMTSc4LanQ+R+7E0Mx4vYN96JU
         SNqvNPM5GTa8cNDILsboTHdMmcOCQZR69px1jL0X38OK/CCMjVrpwnf4IQRZ6cx54OeK
         45KX1/rRcFo0Zyx+RhsB5C7U2kOtYEtmOYbtiCUOzxCKV+mTwVnqAzlde5I0evnirnx6
         DyzNYRvgaWlhhbA1VfBj4OwDPBkRb0UaqThzd4aN+MMFKzCs7VZpL4JdF7uPfD0otimo
         ZsNNDgD1toZ8B7uk20XhJhxFryWOzi9qyHjIOkxSaiH/F3nl/f9fytLM8+Puv4i/LODE
         NzGQ==
X-Gm-Message-State: AOAM530MtPkH7s2lENFKWCmAbRSgQ2/yeZ4i+MPYrXsny/0L1jmcz2q5
	CsCgEQVbQtTPG1C9Sq4gF2RI+rJ0ySTEKQ==
X-Google-Smtp-Source: ABdhPJxD4YKtbfPovzDfOCAnnTxBn9LCTIX36r3Cgg0DH+x2QB/lyHmY868oXg824ZrE3VbHJQg8Hw==
X-Received: by 2002:a17:902:7c83:b029:e2:b157:e25c with SMTP id y3-20020a1709027c83b02900e2b157e25cmr12291238pll.32.1614540017958;
        Sun, 28 Feb 2021 11:20:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::5d43? ([2601:646:9200:a0f0::5d43])
        by smtp.gmail.com with ESMTPSA id c8sm15310467pjv.18.2021.02.28.11.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 11:20:17 -0800 (PST)
Subject: Re: [OE-core] [PATCH 02/24] bmap-tools: upgrade 3.5 -> 3.6
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-2-alex.kanavin@gmail.com>
 <23dd5c64-4658-f00b-1775-46de9674a4d5@gmail.com>
 <CANNYZj8F9j_EEr=Ak0aACDpnpbu8t74haFkjJNRKLtoAbaV0SQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c92ae0ca-762d-0f75-cfbb-dc2fed47b026@gmail.com>
Date: Sun, 28 Feb 2021 11:20:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8F9j_EEr=Ak0aACDpnpbu8t74haFkjJNRKLtoAbaV0SQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/28/21 11:08 AM, Alexander Kanavin wrote:
> On Sun, 28 Feb 2021 at 19:35, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
>      > -RDEPENDS_${PN} = "python3-core python3-compression python3-mmap
>     python3-setuptools python3-fcntl python3-six"
>      > +RDEPENDS_${PN} = "python3-core python3-compression python3-mmap
>     python3-setuptools python3-fcntl python3-six coreutils"
> 
>     what needs coreutils at runtime ? and which utilities
> 
> 
> df, introduced here: 
> https://github.com/intel/bmap-tools/commit/f1cd6ec8ef29beb556f1b725aaf6916ba29a61fe 
> <https://github.com/intel/bmap-tools/commit/f1cd6ec8ef29beb556f1b725aaf6916ba29a61fe>
> 

OK, df is also provided by busybox so I think we will always have df in 
rootfs, unless it specifically need df from coreutils, perhaps we dont 
need to be specific about the rdep

> Alex
