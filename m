Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC88C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:56:00 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.10900.1677160556504763342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 05:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S5D1A+a6;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id da10so43608829edb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 05:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6q77vehPlSXkg802yKxWP4OluAmuzx7seeleHEZUBVQ=;
        b=S5D1A+a6ly021lGNJvPupT/SUIFWptXPkw1rpiMsTeHgyAZ+uWpIR7LM8sl/POpCDr
         NvFQzoITiicZt7t9tc4xPPREpBkYV8gBbjU5xCYwPy4Z3GM5d6XPFRvEv5V5QoaGxttM
         5xp83a/eMqbT2AjVBntBuYpdIirBgLWbAKDqVVpUTBPzYrXyUOtBwLnG2AnwLutxNpnE
         HL/vcdjr7bwuFvkDmU9J6phfus+uD3XFnkSMA6+26Qya2RUOGcnxfRNdlQw3sv1QJJ0/
         PeyLJm+ltTFJ08n5IC/TXPy43P8uwGrIXROva2s1t6zr19esJd1BF20ZF2QW9fKJ9bl3
         F9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6q77vehPlSXkg802yKxWP4OluAmuzx7seeleHEZUBVQ=;
        b=2x7yC+BE0L8BOZIQbVtzA1MivERjowqXZgbVqscXLQq8RfGrFvl0HsKyGiwFmshNCu
         4IuFum5SIySSJOetTVmcK6vIcXrpj2YIzSRLjPmYYWCf6KQCa1fyGc1THuTresFVMiWJ
         aJTBt+2lfBCflcpf4JIe+EWFeAkfZ00ZmAvkh7GIK5OIS0cWSaubSyimeJYwwzNOhryH
         ZR1i5db1+PUuN7A9TtRsEyilV8S6jNTa/WZvOe+xNG+dwd0AwN2zW43MLIgijQK5qYXR
         c9pP3ERXfFSyPRMWGMMemabHRsUAe7yCAy5K9KJ71kUkLk3xd9ihb434OOuP+0QJYENW
         HVCA==
X-Gm-Message-State: AO0yUKViYXaCZ+srvCkceCsmkmcHnM4z+YKIyU8tAXIayCnKx2HE9Tyk
	Z+3+Zqt5vVG7TE1IlbG7cOnQGciP6Ug=
X-Google-Smtp-Source: AK7set/yrtuAzUrtiZvvADYg4uMLkoFIvesd9KJqUDMKDT77CW5oO0MZDt7ZNrkapqrItfXnVci8iA==
X-Received: by 2002:a17:907:2ce6:b0:8e9:afb1:65c6 with SMTP id hz6-20020a1709072ce600b008e9afb165c6mr4675706ejc.13.1677160553944;
        Thu, 23 Feb 2023 05:55:53 -0800 (PST)
Received: from [192.168.1.143] ([188.36.69.43])
        by smtp.gmail.com with ESMTPSA id q21-20020a50aa95000000b004ab4db9be14sm4475686edc.81.2023.02.23.05.55.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 05:55:53 -0800 (PST)
Message-ID: <28c8d9aa-27f3-4427-93aa-670bfa05e564@gmail.com>
Date: Thu, 23 Feb 2023 14:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: bindgen missing?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177609

Hi,

I have tried to upgrade the Mesa recipe to use 23.0.0
and tried to enable Rusticl by adding these:

inherit rust
PACKAGECONFIG[rusticl] = "-Dgallium-rusticl=true 
-Drust_std=2021,-Dgallium-rusticl=false,libclc spirv-tools spirv-llvm-translator,libclc 
spirv-tools spirv-llvm-translator"
PACKAGECONFIG:append:x86-64:class-target = " rusticl"

To do that on Kirkstone, meson 1.0.0 needs to be backported, which is not an issue.

Configure stage fails with:

Program bindgen found: NO

Where is bindgen in Yocto?

Thanks in advance,
Zoltán Böszörményi


