Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F88C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 11:45:38 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.20225.1754653538264279071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 04:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bDCB87iS;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-617c40825c9so3131114a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 04:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754653537; x=1755258337; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nCXfc700v40BDlgZXwvwh9jMEZt/FyttqccKhvcoXU0=;
        b=bDCB87iSF0OPyL7tAgmFfEEZGkIDjZgwvf0C3Sxskn+PFxBn8L1hVkXIqJuQJJDv7v
         JhR4GU+c57dm9OK+bLpp18eO59Fw+fEs+XwBOipZsansObZ9EzM1+ILUmK1o79S9/kGD
         A9E8s0LqcxKeq1TjgI4GdCzH2tB7/fgUbGah+DFlLiUWNwn5iKeB9mfpKNo9D+1Evioj
         LKUOh9DCuAAbry46jGZLB85jSCh+UgiChVEhPtyZdwnbuXhyltWBsEEabenwWGpVYB7O
         Be+/OWr/MuDmjOBIUhVJNVe2Vt7dW1M9loTubWygJUDS+yCFVmAuCMq1BeKAFu/6MUQ4
         laUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754653537; x=1755258337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCXfc700v40BDlgZXwvwh9jMEZt/FyttqccKhvcoXU0=;
        b=I312XvP+WM8b+/1kvR/pkH/9juaIt0pVouKkY5ahTHnI1FMaxAOUsELfquIQIjmcyV
         rFITOCln/dj5Oyt8jQgP/qLg+mbdHEcKvhIuFrHyg/9+fWBdRI6NIji1zF1VLJQO1vyi
         ZudWj7QBBoN799YBcX5yriryfXBun2llYtsQM5Z60JAWB5gqymTStxKemNTZP+aXaGSx
         PVhxCtbLK1lXAzd+8iilfwdD4cRzQA4ekjzsg82gIZOUlNJQBW5vOkfVHGUvOEA/vmQ7
         cbpPamhoqlQgQCiXefBWBWgsnBvbEPlxBRjpuuZSRAXXoF2hKroUVj7+RRB9fF4yDX+F
         A++A==
X-Gm-Message-State: AOJu0YxiEqj3WSSrWXAMtuCBW8cZcvkR4vcVTT3rRxwDwjyb9dhL6ARb
	mHhGD1hm3fqXcegtgdWJE4MzFpPgRVzbuMKsQuRAf4ACQaH5J650Iku5uc2eGg==
X-Gm-Gg: ASbGnct2H2PqUWHQDtWk7HCK4XhdCu1eodbJcoIHhGPNyLvC9eR1E9gD+gDCuurOnxm
	Et4EZpa71p3u/lN3SdlkSY08HOl/rE0vP2LFzLXt1bwt3L2D50RmE3ZOmkC/OHBX5/YkYfcFtVJ
	gqt2k5+6HupAYhqepBw4voZQY/v84gHyyTH6/cI/u1GA9nryvQzIL820oAMocHCJsWs+TEmYdiM
	sibycf6CJv454pKqh8/NWzKLbP8KhGb6/oLxDPHhvFn+GTIcS0nzAqXbhCwJzv+bldDW0SB2o+x
	IxyJsTH2gnynZ1mR0898YZblfsDL1jmVXuQ/6qADJuVggzF9/dWlwXyf+hOR18LcktKu3YS3xyf
	2juCbVlLsSfVn0oVFdCN9TVve2UyVjHBfBj7zC4Uk
X-Google-Smtp-Source: AGHT+IHmugPREPso6pVDuTrD5vnKSu5zL8TS2ekjEt9OalXR10Uj7mybQk9vy2I3V61L733bTUv9Mg==
X-Received: by 2002:a05:6402:520b:b0:617:d155:bc9d with SMTP id 4fb4d7f45d1cf-617e2e55b19mr1688350a12.21.1754653536548;
        Fri, 08 Aug 2025 04:45:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8efffa5sm13203742a12.12.2025.08.08.04.45.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:45:36 -0700 (PDT)
Message-ID: <3eae6be2-7240-44b9-8c36-548d73ab4cdd@gmail.com>
Date: Fri, 8 Aug 2025 13:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gcr: upgrade 4.3.1 -> 4.4.0.1
To: openembedded-core@lists.openembedded.org
References: <1859C809B2762E5C.1001@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1859C809B2762E5C.1001@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 11:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221652

On 8/8/25 13:44, Gyorgy Sarvari via lists.openembedded.org wrote:
> +
> +# gnome_verdir is coming from gnomebase.bbclass, which seems to work
> +# with gcr as long as its version has 3 sections (x.y.z).
> +# This version is 4.4.0.1 - add a custom version parser, otherwise the
> +# original parser constructs invalid download URL.
> +# It can be removed with the next update, when/if the version has only
> +# 3 sections again.
> +def gnome_verdir(v):
> +    return ".".join(v.split(".")[:2]) or v
>
This is something that seems to work for gcr, but don't know if it works
for all gnome recipes, so I just put it in this recipe, in the hope that
they won't form a habit of using such long versions.

