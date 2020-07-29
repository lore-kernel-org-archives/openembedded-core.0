Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.3498.1596066647768897575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 16:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W7TMlIPs;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id r11so6082596pfl.11
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 16:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XR+osWNnoVfv9sOg7PgbpL8lmcxi/mRcPJMPl3G6LiU=;
        b=W7TMlIPswRxuoBiIJQWvxfhUzTdhsCaenTA1RwEI2OK3CYdmdIgo9jr7VVqcp8bVU5
         gOdDis+M0H3FU4AZA3k8Niatm47af6cj3zvIlDbLb/frq2JXH0Wibf9q2x7d6/0CpyJu
         HbvESYTon36RQggJDwuLN0P00D6DxkMOffZct1rTZFYpe7o1jX5LYzMOcRBUfqr0urmB
         NyPkoRG5hV+oQUhuKcI75fb7nAyf/+HWPz/56Os32sue9yGGLaIj4dtqeQKb2FbxciYm
         SWbULZnqbpFXNV00cH7JZnBQiIEF19xglJI1NvdWBkHXxUAI9GM6ghHicZcEV75gT0On
         I1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=XR+osWNnoVfv9sOg7PgbpL8lmcxi/mRcPJMPl3G6LiU=;
        b=q/umbLAln5wb+r/wedbyhF4ZmZ8ViEIOqJZlkW6u+coRfSs3F6cDkTQakrZ072jk4d
         LMgzBxdRvBvJews1tVJ8TefFHhz8zF/Mwjyr3p2Mieh4JZHpoD5FYXaw39a+wZgKEIbV
         nFKpZ6oxXypG/EAllw7Oa5ahfErKHjXtd3UYCLNehaqC0O6fUxqU4H+mx2/GGQSZG7d/
         C6qMYv9ElTIMv0m84HLTBMwEOYDq6Na9FTL4HA5z64HNcPKfnaJTCcdyblLBliZJpFSS
         xfqstDamjRN4KQf3vdB6p3CMxb7oi+AVcI6WEGBbQD3GtewzUSARjDePOnbxaJ8CIS2+
         pNmw==
X-Gm-Message-State: AOAM531wPVKXfe3fIxP96wAkicFotp43N4Gv3nSrgiGp38b1fxkymwiV
	Y823ISuUbbWRj7vcI8t7qgE=
X-Google-Smtp-Source: ABdhPJxk14zpA+4wk8/3dFEtN3jGKdOmJsuer4GUgvZzGtkCzDGuWOAmDVu6/r63q9AG/SUm59zEdw==
X-Received: by 2002:a65:644d:: with SMTP id s13mr32230878pgv.103.1596066647134;
        Wed, 29 Jul 2020 16:50:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:78ea:3c50:1a71:2bae? ([2601:202:4180:a5c0:78ea:3c50:1a71:2bae])
        by smtp.gmail.com with ESMTPSA id u2sm3679668pfl.21.2020.07.29.16.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 16:50:46 -0700 (PDT)
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.1.2.rc1)
To: "Jain, Sangeeta" <sangeeta.jain@intel.com>,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
 "yi.zhao@windriver.com" <yi.zhao@windriver.com>,
 "Sangal, Apoorv" <apoorv.sangal@intel.com>,
 "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>,
 "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
 "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
 "steve@sakoman.com" <steve@sakoman.com>
References: <20200724075804.747FD280D94@debian10-ty-1.yocto.io>
 <BYAPR11MB36243A6E3626563BFF30D22CE3700@BYAPR11MB3624.namprd11.prod.outlook.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d975f34c-7b15-e552-31b4-6e21ac959f33@gmail.com>
Date: Wed, 29 Jul 2020 16:50:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB36243A6E3626563BFF30D22CE3700@BYAPR11MB3624.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/28/20 11:22 PM, Jain, Sangeeta wrote:
> Hi All,
>
> This is the QA report for yocto-3.1.2.rc1:  
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults

Is QA still having to perform the Manual test remotely?

-armin
>
> ======= Summary ========
> No high milestone defects.  
> No new defects are found in this cycle.
>
> Thanks,
> Sangeeta
>
>> -----Original Message-----
>> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Behalf
>> Of Pokybuild User
>> Sent: Friday, 24 July, 2020 3:58 PM
>> To: yocto@lists.yoctoproject.org
>> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
>> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
>> Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
>> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
>> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>;
>> steve@sakoman.com
>> Subject: [yocto] QA notification for completed autobuilder build (yocto-
>> 3.1.2.rc1)
>>
>>
>> A build flagged for QA (yocto-3.1.2.rc1) was completed on the autobuilder and is
>> available at:
>>
>>
>>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.2.rc1
>>
>>
>> Build hash information:
>>
>> bitbake: cc11dfa4eb3616547a8a3909f89da0cc4f35dc57
>> meta-arm: 4812a66527e88ebdc5351d5dbd63765abe4abf62
>> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
>> meta-intel: 77831443738885d33bfa3a738fe6c4f0361e4892
>> meta-kernel: 58a589c5aad5417abd099a961e3c1a5b083cdb90
>> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
>> oecore: ea886d57db917a41a0d106a15e1e96c72d6407b0
>> poky: 569b1f5d67c57de957e243997c53ec2f81dc8dfe
>>
>>
>>
>> This is an automated message from the Yocto Project Autobuilder
>> Git: git://git.yoctoproject.org/yocto-autobuilder2
>> Email: richard.purdie@linuxfoundation.org
>>
>>
>>

