Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A33CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 12:26:42 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.21411.1758112000386435804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 05:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gFaP4Pwb;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b042eb09948so1327958766b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758111998; x=1758716798; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OAzzxZEfRMuJnthAr5WfjswAB1UVEt8/6PUb2cSSVd4=;
        b=gFaP4Pwbq116s8VEk3tcx/bCrgipDa8TNRI684+xCguTbnNTSxrFKi1gh//IIPnXKT
         KrjXFwwbfLe7PP8JPshuHHswnI3rebs87l6AqXvQDGKnQEROzfETfCFJ80C0oRv+KNTw
         13gX57CkOsx0uBlSKQnoHNdvN73xJgHfvLFnTgy8rF/kbLn5yYC6UkrZnyCbJzeBIc7z
         MM/AQsgxrGdGgWu8rY55f6FJPokVaTLhvpt7Od2LbegN+sebBdSvf6AeBxbx52zNP5E+
         v+1hKt2cpr+R5zv5Ji2XrKu2tOXEtf5QVQirbSRr+e3G41LfT/CTdH/mnmAx0bwggqy/
         RAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758111998; x=1758716798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OAzzxZEfRMuJnthAr5WfjswAB1UVEt8/6PUb2cSSVd4=;
        b=mPF7khzJO4IgdpHzSZFgF7jPgq6Yi2OC/IrEO071TOUIWX9fHEfjTJE+8+rIn0eOqv
         v76y+1G1qPok+0n5K9AFF8K3v9e91OXnczcyGe3KWI/8af71SMKeOIwdQQjrAOAPIrdC
         xK//1qKse9rAnmEzBGMwj60niY1HL9u1qcI3v1ohm1+xSKsGVaROAgknfCBrwZJ/0Mwd
         nNydi+cqNkd16MaBf7w+6BWiRxViia9HsrSZKmc0R3vGxaPW6UeexlFM65k4oLSMyg82
         PNdQm8YOg61klH2zK+Qcsh2d7dm22i3KrG4GGUgPebakW/5c8aoc/MmWJVX8dsNqFN5/
         3vDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8u8WkAvTP7A0+LZPpukb+atsIfCQ1NuKGS5UwcxS2Lkbxn0wceGGCHRTxrnzoV5EpcSBV5ELV75ZyfdLleSOxeg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzepRvTEUjidbIg/rCr+Syfq7oxPyw/sL/HBlGL/dcJt0DdKlJY
	vqidjQTgnZl2j1UdWl7QegDBVXVpSUX1LmIgQWWomv7oF3D1aPFN0pCDs5NY1Q==
X-Gm-Gg: ASbGncvhlp8RjfjKsCGwyf6Ax0pAlggR20D85YmOp3uKQf6jrQE4cffTZuYRqOv9d3a
	xOQ7q3Zg/tZ/XsljS4XO6z+4yr8JT1/BINoUOlHhP5x0fvd/d9uIpel/n0pctZ1xKtH8KLxYgzM
	VqMAtFG8jb721VA+JzYuOPcVfChp5w/lbFOmPnYOkc4KjHFnE3ONH5Ng+wxLoCRwVTXE6XKV5zQ
	YI73F3zdgXxFgmukWwN/2oQRSkUmB5a5GG7+j8vjd7l/l06M4W5TNJVJHWVbHFV35IGcnwgg7uD
	MYmNTqxwO63E07EE9UbLxmHgA9j8clV2aJXC0LaEsoXd39pBFhc3tJv6FMHOZsyGfp3+Ee07eG5
	DD1YZlqy2vdHkTXEh/UeN6NxfkaGkRd0=
X-Google-Smtp-Source: AGHT+IFBCYZbaFSqbzggsWrqZ4FhpEQUs/dvMn9G2+em7Igltrkw4RvJ9u/kY06iqSwVbVPPTD2WMw==
X-Received: by 2002:a17:907:6ea9:b0:b17:ec4a:4f2f with SMTP id a640c23a62f3a-b1bb2261b11mr259552166b.27.1758111998214;
        Wed, 17 Sep 2025 05:26:38 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3347a4fsm1337121066b.103.2025.09.17.05.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 05:26:37 -0700 (PDT)
Message-ID: <4149a1b0-f423-4942-ba48-6b9f70e8ec61@gmail.com>
Date: Wed, 17 Sep 2025 14:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3-cython: make generated source file be
 reproducible
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250917121016.15784-1-hongxu.jia@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250917121016.15784-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 12:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223600

On 9/17/25 14:10, hongxu via lists.openembedded.org wrote:
> +diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
> +index 6672cb986..ae1625ea2 100644
> +--- a/Cython/Compiler/ModuleNode.py
> ++++ b/Cython/Compiler/ModuleNode.py
> +@@ -779,7 +779,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
> +         code.put_generated_by()
> +         if metadata:
> +             code.putln("/* BEGIN: Cython Metadata")
> +-            code.putln(json.dumps(metadata, indent=4, sort_keys=True))
> ++            _metadata = json.dumps(metadata, indent=4, sort_keys=True)
> ++            _metadata = _metadata.replace(os.getcwd()+'/', '')

I don't think that this is going to work on Windows due to the different
default path separator (of course for Yocto that doesn't matter much,
but I think upstream cares about it)

Maybe os.path.sep would be more portable?


