Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.1268.1626369747464947770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r/6IgpQo;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id jx7-20020a17090b46c7b02901757deaf2c8so4668995pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=44YCOlm92DKffiTQDVZOH2TGdraS6ElG1NJTKohghWU=;
        b=r/6IgpQosEiJU+WF+o/BQ35jwEHC+SHwCiSAmnIZIDy6dwGdoiE7S+hZU9BVPGvWJv
         VFQ9vUZ6zF5zptRe19oK2m6douAW48LRk2cWqJM7UEEedUbgPjG+D6xmwGjwQeAzq3FO
         zWHeMClnwnPbCGcEqGPyHI56IcvQmgOyYT7So4IaF6bqdg7pfT69aShQ9WXCZdzuj5G5
         bsUlSbDcYoYfrKMcW03nBn4q5vr3cqsSNqVvdcrF/4K37zHcZFEULMmF/JpnpitnU/JB
         iqsE+VlxqDRngJNsgqTfbAWyn1FGnj2uVipkRjefRySFA4+MBZAXvpVA48bJVUdO0ZBr
         FFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=44YCOlm92DKffiTQDVZOH2TGdraS6ElG1NJTKohghWU=;
        b=Aa8lMuiXRr8Qtd5YJw0lA/5DCnCULVOLj3Lbxv1QsrXPHBR+6/9HiaTWDNKtTF9Hrm
         yjAmy+nSEvXIPxDdAnOHAVpunbYt++x7js/ezGvAlGGo3qe/Fimb+yLGNCfevO1BwOmE
         tcn80inOMC1PKvBNNrYxCFm6tu9SgwYMx98gYYOKKGBLZ6nG2VPI7aj8QkCeZPPXkONF
         Y5Z1xySPSRCygDBSC+oe6hrMgopjio/m6vExxJrwbjTKsEfsUgOjTZnRvtyvoJMO8ydH
         q5asbmDMRMhBdEJhXZenxhNpY7Izi0kT47zkn+P9newMusaqaqJGOQVx7Pu4XrJzdvIN
         A4EQ==
X-Gm-Message-State: AOAM531DdJtwOa3Vpr8ApJWXCC59XzGEazh6uOf2wwEfBSihD11k/LcT
	TIEUi7nZQ7kAe1HEFEN5CDaUUQrjW7utqw==
X-Google-Smtp-Source: ABdhPJy5xEw7W/pdbbuDAcOucGQ50cf5h3LQ4sYXxwPJpiLvkS5a8M7QAPHMMyyxoYf3beCderqauw==
X-Received: by 2002:a17:90a:9484:: with SMTP id s4mr11247600pjo.231.1626369746550;
        Thu, 15 Jul 2021 10:22:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9c22:5530:e06f:dd43? ([2601:646:9200:a0f0:9c22:5530:e06f:dd43])
        by smtp.gmail.com with ESMTPSA id v11sm6090966pjs.13.2021.07.15.10.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 10:22:26 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v4] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: Martin Jansa <Martin.Jansa@gmail.com>, wangmy <wangmy@fujitsu.com>,
 Leon Anavi <leon.anavi@konsulko.com>, Derek Straka <derek@asterius.io>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1626076608-17034-1-git-send-email-wangmy@fujitsu.com>
 <CA+chaQfWtGf7gsUCLXcTuB985YYHM=FQszdX1d2y4fcjjEepOg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <17064fad-db99-80e0-f9b7-ab8c4685ec7d@gmail.com>
Date: Thu, 15 Jul 2021 10:22:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfWtGf7gsUCLXcTuB985YYHM=FQszdX1d2y4fcjjEepOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 7/15/21 7:43 AM, Martin Jansa wrote:
> On Mon, Jul 12, 2021 at 9:57 AM wangmy <wangmy@fujitsu.com 
> <mailto:wangmy@fujitsu.com>> wrote:
> 
>     reproducibility.patch
>     deleted since it's been merged upstream.
> 
>     v57.1.0
>     -------
> 
>     Changes
>     ^^^^^^^
>     * #2692: Globs are now sorted in 'license_files' restoring
>     reproducibility by eliminating variance from disk order.
>     * #2714: Update to distutils at pypa/distutils@e2627b7.
>     * #2715: Removed reliance on deprecated ssl.match_hostname by
>     removing the ssl support. Now any index operations rely on the
>     native SSL implementation.
> 
> 
> FWIW: this change 
> breaks  meta-openembedded/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb:do_install:
> 
> + people who might be interested in python3-cassandra-driver.
> 
> | Installed 
> /jenkins/mjansa/build/ros/ros2-rolling-honister/tmp-glibc/work/core2-64-oe-linux/python3-cassandra-driver/3.25.0-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/cassandra_driver-3.25.0-py3.9-linux-x86_64.egg
> | Processing dependencies for cassandra-driver==3.25.0
> | Searching for geomet<0.3,>=0.1
> | Reading https://pypi.org/simple/geomet/ <https://pypi.org/simple/geomet/>
> | Download error on https://pypi.org/simple/geomet/ 
> <https://pypi.org/simple/geomet/>: [SSL: CERTIFICATE_VERIFY_FAILED] 
> certificate verify failed: unable to get local issuer certificate 
> (_ssl.c:1129) -- Some packages may not be found!
> | Couldn't find index page for 'geomet' (maybe misspelled?)
> | Scanning index of all packages (this may take a while)
> | Reading https://pypi.org/simple/ <https://pypi.org/simple/>
> | Download error on https://pypi.org/simple/ <https://pypi.org/simple/>: 
> [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to 
> get local issuer certificate (_ssl.c:1129) -- Some packages may not be 
> found!
> | No local packages or working download links found for geomet<0.3,>=0.1
> | error: Could not find suitable distribution for 
> Requirement.parse('geomet<0.3,>=0.1')
> 
> 

yes its reproduced on AB as well.
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1397

> 
> 
> 
> 
