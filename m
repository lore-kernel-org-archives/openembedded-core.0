Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6610CF2576
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 13:18:26 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.31398.1728825501243605561
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 06:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yUj7lnDX;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so2364759f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 06:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1728825499; x=1729430299; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7E6rtvBnGcTQ49w0eeZcbYmUw+8uiCWejRpD8iC8V1U=;
        b=yUj7lnDXnGLcMjVeH08IjYPSBIcdiQq88RCIFnKLGXOM98CU+j5/ZPE34E5UJvSUgo
         Qx2chOViY8MPUP/fGqyvODNSlxQr60Sv6MKChA+ZiuO7ysHRfAlPWMx3CFQWn+x7iCyW
         h477UK5EQuyHm2zretI0OEiYeqg1Qv6lczjGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728825499; x=1729430299;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7E6rtvBnGcTQ49w0eeZcbYmUw+8uiCWejRpD8iC8V1U=;
        b=k3dXBq36NOZY/FTLZCRiGkJ7nXvTERkDR0N6+FQQ2jokCEDiqBjteNsHd949pV649s
         1aDCVhITW78gBvv8/5niru9nzKRwuKUCEbeJuDA68Tc/bF4brKvQsjN+fpgeO9wMUe37
         pBocxopBLJLOuv52QUoKMnXtjQjUBNdJOiDLCZa5bajDaJYTUf6ja482UPwd7xcUrnZJ
         ZFlNpp2bf46tYr3QYrAZ2vlKCgQf+JH2Pjee1rR5c+t3ImI7XSgxYr5ERg6cghkDeTcZ
         U5DcBEjQcl3YM/f9JJ/hhOfH8SFecJI8aNGbZwqFEVjhlwnZQaRwWwcJE2gc/2xcC1fc
         jNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0ND7CNc3aq4QalgjS2oA6N4JvjyJTmiQOM1oqG78DS6e1P73+66DLEwKZzvdOScBXpz43PTehlaPk/5JwaeeQKw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXrk8yAHAYhr19ds+pCYEnpfj2dINYS91JqOxPwo2eYxZTd46K
	Qax1wmOOc0FK+Qqg9I3k6tTlxR6HhG3rQWCEgtSw18fq+egR0fKPgkNw0sZtwKQ=
X-Google-Smtp-Source: AGHT+IEcIHvs9CY3ztwHVrwlFQTbZ+4GepN9xz65WtxCifstKNk0GhvOOWiSr5br+uK8tjAa/bZjOA==
X-Received: by 2002:a05:6000:b0c:b0:37c:fc25:ef39 with SMTP id ffacd0b85a97d-37d551e3c50mr6069108f8f.16.1728825499372;
        Sun, 13 Oct 2024 06:18:19 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7edebfsm8629344f8f.98.2024.10.13.06.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 06:18:19 -0700 (PDT)
Message-ID: <3831edba-2e59-48a8-9186-52c5a4081fd1@smile.fr>
Date: Sun, 13 Oct 2024 15:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1 -> reproducibility doc improvement
To: Tom Geelen <t.f.g.geelen@gmail.com>, Tim Orling <ticotimo@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
 <3d120a63-7fbf-43fc-8f44-5ad50ab1a061@smile.fr>
 <CANx9H-Bi0CKSMdH9fsQ8hAzabuyk2bX3hm3ZqUoPdmuupLeK_A@mail.gmail.com>
 <CAJo0Az6nDT-av_8HuudUt5Ob5ga7+=Qofaaa2Z2RTjKpsC1T+w@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAJo0Az6nDT-av_8HuudUt5Ob5ga7+=Qofaaa2Z2RTjKpsC1T+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 13:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205722

Hi,

On Sat, Oct 12, 2024, 8:32 PM Tim Orling <ticotimo@gmail.com> wrote:
> We need to capture more of how to do this in the documentation. I
> did what seemed to be what the variable names would indicate. In the
> past, I always ran the full reproducible builds without restricting
> to “one recipe” (slow).

Le 12/10/2024 à 20:38, Tom Geelen a écrit :
> That the documentation could be more elaborate I agree on,

I've filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=15619 about
this (attributed to me since I plan to take care of it some day)

> this is my
> first attempt at pushing a fix I Poky and there is a lot of things to
> take into account. It makes it daunting to contribute as I'll be making
> a lot of mistakes.

The fact that python3-cryptography is not an "easy" recipe does not help
at all. But correcting your mistakes and improving your patch is the
review process working as intended, so, please don't be discouraged.

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

