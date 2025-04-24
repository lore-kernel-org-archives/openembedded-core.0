Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB441C369CB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 02:26:00 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.5933.1745461552175063651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 19:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ADjCc9Bq;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso385460b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 19:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745461551; x=1746066351; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtF1KskJNnJLw2I5AnfANSEp6ivVcruYGPY2i2f0kAI=;
        b=ADjCc9BqPjnrYmIXGflM0W2getj919HprqusCmKl0tdLJcjhazrFAzoR7G/gHt0jtM
         /PIrKBqqJocuos+Cxkd0ZlWWOWPbWT4mZ7xsDTLRxnZ2NcexM+zPzOEXzLzmb4Is+Avj
         WKKK57xlIDYFzekyA/TdZw5o3Z7JDA624hGd/sUyH1tfQJsnzHukNrCmpxnbTCJ9XiV7
         kNmBu68LXOpuN+vNWiT0uKah94ks7jPj/PlfxVpxnQ14hpW9mOKCjm+z5QsHtWEsyZZT
         Nm9MvpbWCTIWoQLNRRlPvp1i5j6pqVSA5YdMtN+inBeMjVgXsT2H7yeOVH0UFRjOFnSc
         MtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745461551; x=1746066351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtF1KskJNnJLw2I5AnfANSEp6ivVcruYGPY2i2f0kAI=;
        b=FfDdT0fNxbXvlHd3n66GrxQiSrSyBDboAegTjsBPQe5YOEHQ81aPA9mBbATujGCNuf
         566ofZHzGBvyoO3WzZirxRxd8Lr/PmurGW8kJlm1sc4oUT4A1kiW41gc/gmx6KJwbBKK
         aOa2cbFlHJ839xWRKHPT7mKzN7lolrN5bZK7EaL3f+nGhGDETpOwBTgEJTJ6/ciao1Oi
         qjGL/Uxww+7T7j/vByQqcpbzy8m5qyRn4wi/IOJoAYIWGePfE0BZb/YfYGlutmUuun1+
         f75T0PZoM+SSlNtEB40GKtHjb9FbyOhhrBBTBOtC+ivNl+jD5yMnkKIw9nHRdbFgDeHn
         eJyg==
X-Gm-Message-State: AOJu0YzfVB+5yWuMx/ZlUWQuLXDEEEcEU0yCn/guxA1c4rEX/W12sjCt
	n291lF1b98HLVz9CD2apoVuOVeRxPw9G23oN9xQlbR/XTbOtecVyu2V8oEM8
X-Gm-Gg: ASbGnctlnNxD/L5JohaQe+C5cUAgOeptOXn4oecJ58M6NOePbHAIbLCB1q/TL8drcso
	GRvTuqlgU5u1/uizAWj2eDktyhgUjTdRktoFWQcCoP4aiEWyYQKQvKfgsuFQwcQRrtsd6FPWy4W
	UyLC/Mz4gW/AtsRG3tEswUaOZpzwi5K63SFCWbDlrhxflTugh1ZNh8Nbm74UirBDZJLInR7hFNv
	TUBy/l7Yi65Gd7wwBPDyUAWxsJikPXxwjIVNPxQNF7QwQ2wHgWTgkTXa+wFUnFQH69e+XA2hK3L
	zwHN92Di6HdNhNGWkOmrrtiFE/29qlJsBgT5qgKlWNFG/PUyP83Z+gGyyvIeScuckkDEKaLx/t3
	E+j4u1GMZmKTeAAGL/mfJrHXI1DaE
X-Google-Smtp-Source: AGHT+IGFxlZ8M+u/8w68tdXa4+MAQ/zW5k69BXbaDIvQht3FyifNm+K0YcnXBC7BSZR1T+o7NNtYcw==
X-Received: by 2002:a17:90b:250a:b0:2ff:5357:1c7e with SMTP id 98e67ed59e1d1-309ed29c807mr1199073a91.20.1745461551099;
        Wed, 23 Apr 2025 19:25:51 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:a5ae:f5cf:b9ee:f09b? ([2601:646:8201:fd20:a5ae:f5cf:b9ee:f09b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd230sm1827545ad.77.2025.04.23.19.25.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 19:25:50 -0700 (PDT)
Message-ID: <656f5ffc-98b6-44e9-8308-51495e1961d7@gmail.com>
Date: Wed, 23 Apr 2025 19:25:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] kernel-module dependency mystery
To: openembedded-core@lists.openembedded.org
References: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 02:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215321

On 4/23/25 5:34 AM, Mike Looijmans via lists.openembedded.org wrote:
> I built the same image for 5 different machines. Only one of them fails 
> with the logging below. Note that all machines install the "kernel- 
> module-dyplo" package, and on 4 machines that succeeds just fine.
> 
> 

how are the five machine diffrent with machine config metadata

>   * Solver encountered 2 problem(s):
>   * Problem 1/2:
>   *   - conflicting requests
>   *   - package kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b- 
> r0.tdpzu9 requires kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, 
> but none of the providers can be installed
>   *   - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 needed by 
> kernel-module-dyplo-6.6.40-xilinx- 
> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>   *   - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 needed by 
> kernel-module-dyplo-pcie-6.6.40-xilinx- 
> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>   *
>   * Solution 1:
>   *   - do not ask to install a package providing kernel-module-dyplo
> 
>   * Problem 2/2:
>   *   - conflicting requests
>   *   - package kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b- 
> r0.tdpzu9 requires kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, 
> but none of the providers can be installed
>   *   - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 needed by 
> kernel-module-dyplo-6.6.40-xilinx- 
> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>   *   - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 needed by 
> kernel-module-dyplo-pcie-6.6.40-xilinx- 
> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>   *
>   * Solution 1:
>   *   - do not ask to install a package providing kernel-module-dyplo
> 
> I'm on "scarthgap" branch.
> 
> The "kernel-module-dyplo" recipe can be found here:
> 
> https://github.com/topic-embedded-products/meta-dyplo/blob/master/ 
> recipes-dyplo/dyplo-core/kernel-module-dyplo.bb
> 
> The isue at first glance appears to be that "kernel-6.6.40-xilinx- 
> g6a2cb0f14db5" mixes the git version hash from the module itself and the 
> git hash of the kernel. There's no such package, it should have been 
> "kernel-6.6.40-xilinx-gd7b52381656b"
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215287): https://lists.openembedded.org/g/openembedded-core/message/215287
> Mute This Topic: https://lists.openembedded.org/mt/112412917/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
-Khem

