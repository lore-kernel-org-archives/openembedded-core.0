Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D49C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 09:19:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.8202.1647508756768891243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 02:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ElbEFC40;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id h16so2173581wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=41IKoB+pa0Vvbhw3rU7nNbLcG0Ac6OtxieSphHktJ9s=;
        b=ElbEFC40z+iaWFD9Fxz6GspunY9roS708ibuCwu1DTkVEfsrpkrvyWmbeWwbYtmgwK
         COoLzIBVhKpOAIv4pB7Qkb0rHfJl99j/DzfWUj5Y1qcr6iosc02obMhCFRKE9gnbWysk
         JnUKvZySiCUNs4U6rnl457GWEpO4Ap4OLDmaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=41IKoB+pa0Vvbhw3rU7nNbLcG0Ac6OtxieSphHktJ9s=;
        b=G7NZ791ekccqOI2XoV3Mja+2pEPVOyTnv1uNh31FVfpQ4baAEWfrkz3OGN5FvLGDWA
         yGDffp2yIVtIdUS19Vbqee2Qu2SsYPlSzYaig+flHNOLuyrT8TmqIMqlkNiQIKV90G4R
         bm82z3pnMc1gO/mOFqc57WTDk5PNkYXXNEZ4fRbIwBxe9um8w2nVpOFrSJIZp0VD2WTm
         H7dFixUSU5WeZw3OineuqsKK0elUtwdS45z3Y598NJWjdRxh/ca1ykQK8XeQ3KxfE0/m
         4hcJkcuP3SzerOb9bMsyUWoiOeD/xrLq6TxTHUsffZ3K+kzWcKH3oe9wTgNzVYCE7zNu
         Cz5g==
X-Gm-Message-State: AOAM531N8wD5sNwdbgeKET9iJfmy5v68W8LxUvSk02NDMvjzSPD8GInd
	7aLPY/5eC2n0pbfl1izq+NaV0w==
X-Google-Smtp-Source: 
 ABdhPJy+l54ZIcBtaDsq6WyssT7+lZCfQM7atrPernxEtLHpD5+jZ4GD2e09fQ7q4EGYaJAiutRdCQ==
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id
 s2-20020a7bc382000000b003882e7649edmr3037889wmj.195.1647508755023;
        Thu, 17 Mar 2022 02:19:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:64d8:6f1c:d663:861?
 ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 ay9-20020a5d6f09000000b001f1f3330fc5sm3804997wrb.28.2022.03.17.02.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 02:19:14 -0700 (PDT)
Message-ID: 
 <0cd5a585b5b477559e8479d619a4ea185e64df3f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-snowballstemmer: upgrade to 2.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Date: Thu, 17 Mar 2022 09:19:11 +0000
In-Reply-To: <20220317021024.721357-1-tim.orling@konsulko.com>
References: <20220317021024.721357-1-tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 09:19:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163377

On Wed, 2022-03-16 at 19:10 -0700, Tim Orling wrote:
> License is BSD-1-Clause, update LIC_FILES_CHKSUM
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  ...allstemmer_2.0.0.bb => python3-snowballstemmer_2.2.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-snowballstemmer_2.0.0.bb => python3-snowballstemmer_2.2.0.bb} (51%)

I think it is 3-Clause. I've gone and audited all the new recipes in master-next
to try and sort this out as there were a few things wrong with the licenses.
I've squashed in all the changes.

Cheers,

Richard


