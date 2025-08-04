Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EC3C87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 15:52:56 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.21842.1754322768236585665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 08:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KoNCkc/+;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-88189f28701so22857639f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322767; x=1754927567; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HiTfm1p2aYuWaQLbxGYxXanDcF6C5D+mYPKd7vbI44=;
        b=KoNCkc/+lcDIf3+N6qFQH5JKwNNs/OgZrEUHY4WFNQKVTnKFB4yF/jPSwOchzF4b4d
         AUaQT6F1Xh/DDPZNhDO4sewDqRhMCHKDmSbOvjJ3f92f1JyGuY25sepW3O7uHj86gXKC
         wddv+M3GuzV2vEwST2wi+l6KKHMeR8aKxvN2Lco+vKcX7qMtFiyA8aonKYAOWlw/HPNy
         nAyOA6dBbpYZhYRDDH9vv+i6x7e96PAA5cIJJzihvV2CgYtEdPSS9EHLYMle9rYf/bkS
         k/a7YK2KaQdmiHSDguNX1az7PQE4ojVn1jb5zuzfrRwreILM3V7cZ+uUFJtPwX39kz4S
         mkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322767; x=1754927567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HiTfm1p2aYuWaQLbxGYxXanDcF6C5D+mYPKd7vbI44=;
        b=pu6Ndc4h9SPKb8N4Y6Oy/WbUaRSqpKbcNSlpSuSfm7KnJs94nFqhUfIx5ZVVNFmIB6
         x9kutPOsLlmYKGAg4Qne2ygLJwrX1LuGPqJpipvIsNLo+Nb7TXZES/guX2pRdSFxJXKx
         zIi9wcAlv8thdMiOZ907qkUGtxw8/02bnb3OH8Folk+lWWmPjZ2HIqBLKokUfaY3GkXf
         oNRfopHueMleAlFmGCimRMlafZGil99/rDMQRkTAjH4X6apuC3Dmn/Z/bCvQkcQgHEQk
         eC8C1CIUf1XgRkKKzk+hkxLf8NI0zTtXHkrfijm5OC+zarMR2vF+XBwBCp67nxVVE808
         LY8w==
X-Gm-Message-State: AOJu0Yz26MIXF5qbgz+H9ARKYtNv3GQZmmKh0IzNfD3yPPJvLsLholfi
	G65GBv1IjV3ulknHLNq26IshbTykU3gVCdW/4QrqqL79L3yt6nv/1jLX0Z0Xb5UhdEc=
X-Gm-Gg: ASbGncvKPS8nRtksM47xx5QLqtW5IgG4jKLauRW32oiwnOWivuHrI00zLFNcgJW3m1K
	z7WSNgoD6RnuH7OlIn23gSnBGrMRxz5wnt+a4Y3ILy71mfsEZ6wRzgbiL90jWBsOuWEPYHL0fJx
	+rIqoEgmnRDLQY+DE2oGWJPd5Tu1wCdpO3dRMnukrfHgFlFvBIv9Ju3nP7lxFaPK9heVq6wqtH0
	0sSNkWQGxKZlXezHIwPEctFD7ZMWxnwLn2TnaodDuLULUPGbjlN/mHzBXT2gncOQMr3bJVqhqAe
	vic1HCvJOus3ay2zgSuQiKSPdpPM92LtTHSLLQSzjGjTzWS/jVGQK5iRzUUc2KEYWVBKalhcobv
	T4Iv6DeKKHNBwoWMmCK0XnBpDeI/pMil+PG6flPwRxaBrQeyYEITsWgad4HfNsTh2aUxO2yEFAq
	4bGv54VbkM9hGyFa5lPeeI
X-Google-Smtp-Source: AGHT+IG54/yVKnmNid9n9zyncaU4OxbwtcrfBI/bfgxDh1z2kz8S/BJ2RxV4ZcJ184qLGu7gGDMz+Q==
X-Received: by 2002:a05:6602:2cd2:b0:861:6f49:626 with SMTP id ca18e2360f4ac-8816834f432mr1718016539f.6.1754322767182;
        Mon, 04 Aug 2025 08:52:47 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:99a1:9f7d:46fa:d7cd? ([2601:646:8201:fd20:99a1:9f7d:46fa:d7cd])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8814dfb8e41sm334823539f.33.2025.08.04.08.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 08:52:46 -0700 (PDT)
Message-ID: <decc4bbb-0dd5-4473-b4e0-1d6eb2edeeb4@gmail.com>
Date: Mon, 4 Aug 2025 08:52:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] clangd: add compile_commands.bbclass
To: alex.kanavin@gmail.com, anakin@childerhose.ca
Cc: openembedded-core@lists.openembedded.org
References: <20250803010422.21838-2-anakin@childerhose.ca>
 <20250803010422.21838-3-anakin@childerhose.ca>
 <CANNYZj9fC5=jD_-UAmrGdv+rSrF_L968jaHK3_xwZ6o=Xbu9vw@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANNYZj9fC5=jD_-UAmrGdv+rSrF_L968jaHK3_xwZ6o=Xbu9vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 15:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221432



On 8/4/25 3:42 AM, Alexander Kanavin via lists.openembedded.org wrote:
> On Sun, 3 Aug 2025 at 03:04, Anakin Childerhose via
> lists.openembedded.org <anakin=childerhose.ca@lists.openembedded.org>
> wrote:
>> Add a class to link the ${B}/compile_commands.json file to
>> ${S}/compile_commands.json to automatically configure the clangd
>> language server for build systems that generate a compile_commands.json
>> file.
> 
> I don't understand this description. What does this json file do, what
> does clangd language server do,

It will be good to summarize that it implements LSP for C/C++ and 
reference to https://microsoft.github.io/language-server-protocol/

  why can't it find the original file in
> ${S} and should that be fixed instead? Having different directories
> for source and build artefacts is common, and we shouldn't be fixing
> it up for others.
> 

Clangd tries several search paths in S and B as well, but perhaps
something is unique about OE build structure that it is not able to
find it ?

clangd has --compile-commands-dir=<...> option which might be of 
interest here

Aside from this, I think it will be good to add 
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON via cmake.bbclass if someone wants
LSP at distro level.

> Alex
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221424): https://lists.openembedded.org/g/openembedded-core/message/221424
> Mute This Topic: https://lists.openembedded.org/mt/114509177/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


