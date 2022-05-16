Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B910C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 11:43:40 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web08.27603.1652701411008888520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 04:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kkAZSuF6;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 16so17729378lju.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 04:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=DIr7fhZMDAdzmitSRdl2Jk7OOVtj8OCs5PwB9XHbc9w=;
        b=kkAZSuF64M3eOHoQzrgwI3B18z/vLAjPHJOm7J51mZ6OqK/oqH4Bp3exo0IEV5E8HO
         YLwBgBo0mPZpxZVgS7xZ3FSIWOTe6FPOCI2Nbm7J5f1+Qyc1xrxifKt4GYIMX9b9Cj3x
         RBDngSDKShdeIGUUyUKkOwkYxt5wuDPT/gaoVj9P5ZSVwk4dXZ2nk1obOcONMRKPGg7t
         M/ulaW4sz0yTcK2O2GN/agQN2LBl9qi7zpC5TZyE5TMr8tm+Zh6vOGt1A7PdKbBSXZZz
         VTp4v7GFloDDjXAyMh5QZvLVvsvUZsvarUpFnk5rITeefogUo7ONAqp6Krir2gyjLmx0
         Q8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DIr7fhZMDAdzmitSRdl2Jk7OOVtj8OCs5PwB9XHbc9w=;
        b=1xxFanRc5CAUhw6yFH2VTQLDndbefXIS39aEEVoHx7Kj/BsSxMc/i/HPte3zOasVk3
         Nb0lx2Jfo1Qt5HmZX7sFDldvrLcPmYqtHlL/rl4drcz8XU29Yuw7yrsYWdATgy8dPxDx
         TwFnPWAl5kR+SGO0Q8nNTTMfZJwy0SOGw+mpX6kmyJiTsCw9F0Y7OGqBOqXUIF0Sn6Ey
         r8JlfVcFzoDWj5+XVLOzvDCHSvQMhhevItNUm2YtoQvH7c/6bt912dK6H5MKp4l1xM4q
         AWrQkK/QFrZVApCAAgFojZkr8cyD6tzfz/jeIC6dwt3b4ETDXD9qOC5Hw4xvxACeL2qG
         Zgbw==
X-Gm-Message-State: AOAM532qJ78BIdISr4y2N+gKidxg2H4LwyoSaA6S3HSO+zm1uIbAbuTy
	jQhbebVX+OqYdY/+p1uzwrE=
X-Google-Smtp-Source: 
 ABdhPJxhk7KgEJwiu64QS1+ucJlgri/lgKAdG5VSqLvjFnR6Lh8pcX8ebqIPuxrNlnnVFxxAIB8yKQ==
X-Received: by 2002:a2e:875a:0:b0:24f:11e2:319 with SMTP id
 q26-20020a2e875a000000b0024f11e20319mr11365877ljj.451.1652701409178;
        Mon, 16 May 2022 04:43:29 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 a11-20020a2e980b000000b0024f3d1daee9sm1527931ljj.113.2022.05.16.04.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 04:43:28 -0700 (PDT)
Message-ID: <7763f240-35b1-27d8-f2ec-8860dbea0e48@gmail.com>
Date: Mon, 16 May 2022 13:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures/overlayfs: Always append
 to DISTRO_FEATURES
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220516112849.448882-1-richard.purdie@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220516112849.448882-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 11:43:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165677

Hi Richard,

On 5/16/22 13:28, Richard Purdie wrote:
> Using += unintentionally removes all over entries from DISTRO_FEATURES and

"over", you mean "other" ? If so, how is that possible ?

> this reduces sstate reusage on the autobuilder. Fix this to speed up builds.

/Jacob

