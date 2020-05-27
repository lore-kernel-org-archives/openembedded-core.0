Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.7203.1590590202583577633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 07:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gwY1DYKj;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id l15so28863151lje.9
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KrYIsmdPkFvuXqXT/RTvWdAN9huvrQndbnqStCSq0tg=;
        b=gwY1DYKjkkP3KVV/UrCm3u85OpURZMZgYJxJr9E8pwCGUq4Xgvo6N0H1myzkeYRMvh
         F1zlBqNg/vTeOPP3P+7VRpyCAAwvw9SdMTAoFjE+LqOjmRsT5++ytQKhLdjUpzUGTEY2
         sFcLQsQmV8N7e70zSS2ixHt6dBfjG0ZhF/vV6wJBtu6UyfOwil1pSwQlQiKDJfGpTjhj
         4a1rC2Ri39Zc6AL+J0boGHFf4F2P+xjVWDSuTHwL53g01G+1JU8gOxDewbaVdYKFGJ2n
         PbLlKIXZ6ET1EI7XORnxVNobKc6iRsAdz2i5mr5VBDgzdbLUvlfOXxzO/PMM0Yr2QjXH
         goEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KrYIsmdPkFvuXqXT/RTvWdAN9huvrQndbnqStCSq0tg=;
        b=B/7A1WFgvIbp9JDkw27HIZLCo4mzAG0zaOd8V09ptkMxCDHkA8Lch40UrALKzBmFZQ
         yMBJOh8+Og57DpL0ioOYEuCWoG/2OoIqWrf3bmiW6j5xdV6Mws7a1zSltSQNgW9zGzh2
         Lsp7EKTN1ch9QFEghuH2v5R5QzC25abQamQbDdcpKKxU+iV1krYuVIsDEuAFrY2V92MU
         RKCWu/p5DczxDSkGaxX3jyJ6QMmfJBhBSX2Sf6BKbl399A1DuHN3Up6xzq+FuWudMHIg
         Tjl7xg5CHqtTxCqmXQUa65xJxVWdpozSJhqLgUCXusNnY8PKO/P9zPaJtWhGSc1vL62G
         gdCQ==
X-Gm-Message-State: AOAM532ODUKT6tTHlbaXyL75nppx53DHkT1HCVEgEsZgagq/f/rg2x76
	iTUk+56choNkSTnaOO36/RdSbSBE/b0=
X-Google-Smtp-Source: ABdhPJy8L3oHTVrAng5tlYgQd5YhgEGmMYeceF9MvggTuNjLWJi3ipFBD8dVvc34ma+3JqgOQzJBLA==
X-Received: by 2002:a2e:b52b:: with SMTP id z11mr3207488ljm.313.1590590200191;
        Wed, 27 May 2020 07:36:40 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id r11sm719121ljd.101.2020.05.27.07.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 07:36:39 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <0d663371-0bb1-9ae8-a50b-bc4ed7fda412@gmail.com>
Date: Wed, 27 May 2020 16:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/27/20 4:31 PM, Robert P. J. Day wrote:
> 
> Variable DEPLOY_DIR_TOOLS was introduced in 2007:
> 
>    commit f751a20152c651a33f08ceda0502fa1d4f11c005
>    Author: Richard Purdie <richard@openedhand.com>
>    Date:   Wed Aug 8 21:02:39 2007 +0000
> 
>        bitbake.conf: Sync with OE.dev
> 
> apparently never used so get rid of it.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

meta-openembedded/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb:do_deploy[sstate-outputdirs] 
= "${DEPLOY_DIR_TOOLS}"
