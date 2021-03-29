Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.17235.1616990845491529611
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 21:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TW4u3Smd;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id g10so3779504plt.8
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Mar 2021 21:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vZ2ifSj8rzgbu2kGW9W1Ax39IZDIlOUnfnNCpjUv2aw=;
        b=TW4u3SmdgyJi+4EcAOmb78sBTZhSc/np0keb/unXw8nRwhl8ug7AEaXIUvzim7V/u+
         JMKYVe6KfF3Zp0NHlW+lh481m0+hZFL929y8FmlzXuivuX4Y2GCX+YDSWgaPg+DS+g14
         d9w/blmv5yKJsnM77IBq/W44QLYYCNBp7jjlmEwxpzklr7j/q4K+xS3NqrlwKiFdxjm4
         B4MIN9zZ8ReDxtZmqByztn+oN5Jak3ZdC6EGiTTsYdRI4kPzLgiEChA1tDyQsE7M5mSq
         +EFaB8nc9jlyxzU9nyZutMLTcrbYRY/mi0dv2t7wQvy9XimO1/OQ3n9SFc8S8/Wx0Qbx
         WFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vZ2ifSj8rzgbu2kGW9W1Ax39IZDIlOUnfnNCpjUv2aw=;
        b=tJpeS1NFMftw06d8GSKU9bZP6zudBBGxflkPwK73j+YKpzXZHps4+usC/B9B09CM/e
         ode1+Ogno/iCbDsegQB672vyqG+xBFzqjJawFpkOU4+A1iGJF7/RFHO7M/WWCW+A71YE
         y1UGskwkj3ZlvCpzrwXy6cHTS1pKOCef0ZZlVWKx4jIj+jQjh6SOxLDFzcunpirVWP0y
         K/+YIXMLPmaSFyxjeRdrgYQrxDx88MrtTenMcM0+w/VtVhgQdp0A9uWbaF6diRTGj+2O
         tiAV+dmB998O71uyll7Cf9g+sMFDd8e+bSSb1Fc8YyoZB9oNKK5ptlK98zGinQmZsnJT
         KLsA==
X-Gm-Message-State: AOAM533qecNMxVeGwGgwLxdlg3fhS9JfcYWLB/Swikh5ZgSn2o7EIDxr
	oho08Ac4nM4tIQDD2xKPsVbSPqqIJI7Oug==
X-Google-Smtp-Source: ABdhPJx/yGQ8hjITNmPsMlc9riIx3T/KGT79hNPPuMFVArYnK71Wbp7+/jtiQQ+3q4kQW82ANBm44Q==
X-Received: by 2002:a17:90a:c201:: with SMTP id e1mr24469042pjt.30.1616990844818;
        Sun, 28 Mar 2021 21:07:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4986:10f4:29b0:2119? ([2601:646:9200:a0f0:4986:10f4:29b0:2119])
        by smtp.gmail.com with ESMTPSA id ot17sm9286471pjb.50.2021.03.28.21.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 21:07:24 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] git: Remove CVE-2021-21300 patch
To: Minjae Kim <flowergom@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210329030912.2532126-1-raj.khem@gmail.com>
 <5247.1616988933175538946@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e0aad2a0-0e68-05a2-6a18-011a7f16867d@gmail.com>
Date: Sun, 28 Mar 2021 21:07:23 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <5247.1616988933175538946@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/28/21 8:35 PM, Minjae Kim wrote:
> HI Khem,
> 
> I already prepared upgrating git 2.30.1 -> 2.31.1
> https://lists.openembedded.org/g/openembedded-core/topic/patch_git_upgrade_2_30_1/81646287?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,20,81646287. 
> <https://lists.openembedded.org/g/openembedded-core/topic/patch_git_upgrade_2_30_1/81646287?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,20,81646287>
> 

yes this is on top of master-next

> Thanks
> Minjae Kim
> 
> 
> 
> 
