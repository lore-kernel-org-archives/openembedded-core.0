Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2AFCA0FF2
	for <webhook@archiver.kernel.org>; Sun, 31 Aug 2025 18:54:34 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.34689.1756666465030350390
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Aug 2025 11:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hY9avxp4;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7ae31caso702018466b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 11:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756666463; x=1757271263; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k15JCFlNkBpJ4ktt+Gw1VE+kZHRQqY8n2sF+TXiICLc=;
        b=hY9avxp4womK72Zwf8yDCYxVcAVIn1ve4XyFvmFoIujKxeb7ROv7HZnfCiwamXlJhE
         OMFhPC6+K82aHc/nhz/1zsUWFsz0h8lv45cExibrEXoxhbgU63kO0TfmKbFAZk6zySR5
         aZsyaT64sNPmMOlmTGOIdmet+QeBjHKgHfBi1uq9uixHdwu58r9Ri3MdrigXDsXmGxeC
         fm2VzaEqaXVlPmon6G0hEY7BYqiXE+B7mEnqrJvw4FHXgbgF1SsirGZnZmwlYVYw/Nkm
         qEBkiNCn5QRHSZV/saUYa/0ZsdR1OZE7Az5GqLCmSS1PVja8SSu1j3/X2ggbCeHRusRj
         01Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756666463; x=1757271263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k15JCFlNkBpJ4ktt+Gw1VE+kZHRQqY8n2sF+TXiICLc=;
        b=qPYQu7TcUhpx8AIlUeXR+9T0n8GgF1Nva0DNY47626QH1PpxHDwqdq154g0ak58g6m
         MamDk1xP419Un9tLm9srs0eYW54ID7t5w18Wh8pTZbD97KYikA3SREscs8SLXD8ZKlDy
         nzXtBR6Nv8qjMDU6DdMVj6Pa+vq1g4zVxnC6+faHSK+FX69IEm5tL+7Sk5OkcfzD/88s
         1WE8CrG0TVY/ClOJieP4IZzQcD+JF/xCVjhWST6os4SyeU0uGimsZGLmfbn4S4PKbZUO
         tb5N37f/E0Hc+S3YybHmGGdUDiq9zbEqsDdaphWKwxuRVOeqcHy1hbgKBwQ6KU8nRsPx
         6LWw==
X-Forwarded-Encrypted: i=1; AJvYcCWWb043n3H5kGSgvBEStww18X6RRjXv+06MMxeILYHU//6jjxN5peHLHJYX6j7RmwI8oQ9CQUgynlRDRpNfP0dVTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXpvMfjXpjFlvkWRkba54SJiKX0ifY6B+3FXkn1XFFLUFNGVoC
	qcs9zS22YG1ckwR08Kk6122e/+ozHAwSNbGz6C6RPCkkOXcT1wb6jsWn
X-Gm-Gg: ASbGncvrvr1PQMW0t9Ws9a+X0KeFD7ETeQyK2pjEMuaE84sxcSsmM7tGI69crTwBvRO
	yyl9kVs7FmbvNbum7S6F9mxKGlQymAxK5IPa+Z9ediHm0qcMutYbJOJBfVuia9B+bAm8+tI6689
	7fuIYd71+XnLlGXpOQjuBxMoB8YvZ+bK/jBJ9LaCuOF3d2YhEUyvvc7t4eAuuvWEKx8RtiV4p6l
	EE8H2rkzN9tQB/ByrIt70MMp7HEI4TVutxMsaLaJq69CgTph0yeK1/X1ni9gsH5TSRQuI1ee3GG
	SOVlwf/MfiwEX//l+rSignYz+4X/B9VJ3Q/JxW9rB9cN42gZ5otuEPk7yceZA9e9pdHN1W3Jppa
	2n5wraFyUFfZU/4ag2x06BBbXJT72BNg=
X-Google-Smtp-Source: AGHT+IHlxI2Rj4JAb4G2wufER5azjWSyYhBY11iix6iMFamcjsD6glzkUv225qOcQh0nhbIe+bD5YQ==
X-Received: by 2002:a17:907:daa:b0:afe:f793:b7d with SMTP id a640c23a62f3a-b01d97aabdcmr479741566b.59.1756666463053;
        Sun, 31 Aug 2025 11:54:23 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01af44a01fsm401539666b.23.2025.08.31.11.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 11:54:22 -0700 (PDT)
Message-ID: <0b975731-d53e-4508-9a75-e74d29014497@gmail.com>
Date: Sun, 31 Aug 2025 20:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
To: peter.marko@siemens.com, "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250712140638.3099109-1-gudni.m.g@gmail.com>
 <24850.1752329523627965940@lists.openembedded.org>
 <AS1PR10MB5697C5226761702F5C7B4E68FD4AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AS1PR10MB5697C5226761702F5C7B4E68FD4AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 18:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222635

On 7/12/25 16:25, Peter Marko via lists.openembedded.org wrote:
>
> I don’t think it’s worth to send the same patch again.
>
> It did not fail on normal autobuilder builds which build images and
> testimages.
>
> Also my private builds were fine before I sent my patches.
>
>  
>
> The problem is in oe-selftest run on autobuilder, where the conditions
> are different.
>
> Oe-selftest is a huge beast (taking more than a day on regular
> machines) and AB config is hard to decode.
>
> I’ll eventually build it myself as part of ppc-32 support, but I’m not
> so far yet.
>

I managed reproduce this on my machine.

1. Apply this patch, and do at least 50% of world build (the more the
better, I think).
2. Set BB_NUMBER_THREADS = "100" in local.conf
3. Delete the tmp folder (but keep the sstate cache, the idea is to
abuse it)
4. Start "bitbake world" again, and let it run until it runs out of
setscene tasks, or fails.
5. If it doesn't fail, stop the build and go back to step 3.

I don't know how frequently this reproduces, but, it looks at  least 3
out of 4 tries fail on my end.
I will try to look at it as time allows, but if you have experience with
sqlite, don't hold yourself back, feel free to look into this. I start
blind here.

(Btw that 100 threads for setscene isn't a killer, I'm using an aging
Ryzen 5600G.)

>  
>
> Peter
>
>  
>
> *From:*openembedded-core@lists.openembedded.org
> <openembedded-core@lists.openembedded.org> *On Behalf Of *Guðni Már
> Gilbert via lists.openembedded.org
> *Sent:* Saturday, July 12, 2025 16:12
> *To:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
>
>  
>
> Previous discussion thread:
> https://lists.openembedded.org/g/openembedded-core/topic/113866512
>
>  
>
> I built today /core-image-minimal/ on latest master (Git HEAD for
> reference:
> https://git.openembedded.org/openembedded-core/commit/?id=cf89a121f93e404485983b92abc88a46a7f24890)
> and also upgraded SQLite from 3.50.1 to 3.50.2 for bug fixes.
>
>  
>
> So far I haven't been able to reproduce the issue with pseudo I saw
> with SQLite 3.50.1, and I wonder if the autobuilder/test system will
> catch any issues?
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220192): https://lists.openembedded.org/g/openembedded-core/message/220192
> Mute This Topic: https://lists.openembedded.org/mt/114116736/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


