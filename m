Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4171CC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 17:23:42 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.14209.1678296216394781337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 09:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wf1ljCzY;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id da10so68769813edb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678296214;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwigC8ee3Y74Rd4l9BK7MBpEuSswqPKT7d4CCqLkAA0=;
        b=Wf1ljCzYNL98rZvLgJlOWu8/ll08YHdOOAL52GvdKqiP0hXtooO8sujOD9F3DtgrbW
         JrwKwerIKck57QDhhItUXkBQlnXxJzrvr2Th1j4yezB+rwLlc3IhLStfQoz0qCBOUWy+
         /ChEdCD1z2LbPNwes67TkX3ZrnJPJ+W7YKeUelUgOC5rGxbmUwjZf0eeHWQiRjitQ643
         Blu2sDGM1Rgswy/X3tuznCK8FlHJSeyRBNiNN/dIYR6Kwpc88Q8EMWqOlFtQiFFNGUpE
         FxEnqeMcW4KzEGe2IzT9VYes9Ckvg4iR2eo5C7fl5WPGKeRXdR/m4eRskCjbsQdRpVon
         x/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296214;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwigC8ee3Y74Rd4l9BK7MBpEuSswqPKT7d4CCqLkAA0=;
        b=7cBYXd+stwrE0ahyKMPd++Ffy/OCcU+7Lnlt9cRdOKZGrcq0fc5AxM5IPUNpK+6uTD
         E8Au4TPChdYV2+WhEhqb7oyKI0QYSFcN+bqQFG5LVgUmKUV/rLsXDjTqB9Zvr64UtVl9
         Y2QllHq04Kvqy/ly9aCqwPEU/kSNjrxX91S3wIoVjaPyXHz9g2eGAlI6AF2D0BybEfzt
         WmTdYnat6ul1HLwsz3sFbqNVh3OBYy4MYMDXa248bFuqjYAnbT5OoJOKyNrehp2IAEBw
         03hGG4cY0TuJ94AWw9oY2+x8DVa9jEoH/Y6OWSu1oV/jfWAYH6FIkmI68Hyb0coX4rN8
         euhQ==
X-Gm-Message-State: AO0yUKVKRAhBHJeZeFvD0mgZjAzRR/eEqO34sLEjJ6cPhlFl0r+PQZEk
	rP2By9d/Auq+uc/szQpFgpZq3NTRN96snw==
X-Google-Smtp-Source: AK7set+lBw30sxe/o6iOZQBaSG3e/9PJ5nZ0Pe0aYd1+lNk+Bt6x0BWauEB9GDBJvAdNxbctM2WQ6A==
X-Received: by 2002:a17:906:35d5:b0:8f8:1501:be85 with SMTP id p21-20020a17090635d500b008f81501be85mr17293536ejb.34.1678296214658;
        Wed, 08 Mar 2023 09:23:34 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id b4-20020a170906038400b008d4df095034sm7721174eja.195.2023.03.08.09.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 09:23:34 -0800 (PST)
Message-ID: <b1a311d7-2a11-66ff-9698-29b95f1192cc@gmail.com>
Date: Wed, 8 Mar 2023 18:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] Inconsistent libOpenCL.so.1 expectations
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <174A81466EAA9EC4.23983@lists.openembedded.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, Khem Raj <raj.khem@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <174A81466EAA9EC4.23983@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 17:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178184

Added cc for the interested parties.

2023. 03. 08. 18:19 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> Hi,
>
> I observed the following inconsistencies:
>
> 1. opencl-icd-loader and ocd-icd both provide libOpenCL.so.1
>
> 2. opencl-icd-loader has PROVIDES="virtual/opencl-icd", ocl-icd hasn't
>
> 3. oe-core's piglit recipe explicitly depends on opencl-icd-loader (should be 
> virtual/opencl-icd)
>
> 4. meta-intel recipes RDEPENDS on ocl-icd (should be virtual/opencl-icd)
>
> Currently, I can't install piglit together with e.g. openvino-inference-engine
> because opencl-icd-loader and ocd-icl would conflict.
>
> Best regards,
> Zoltán Böszörményi
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178183): https://lists.openembedded.org/g/openembedded-core/message/178183
> Mute This Topic: https://lists.openembedded.org/mt/97477512/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


