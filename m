Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47534C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 14:37:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9338.1742481453193507852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 07:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Jt1lBbYy;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso9308955e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742481451; x=1743086251; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LLieBZ73VZIMiw8BIDtk3zxR2xepEN+VIiK6lh2TcHM=;
        b=Jt1lBbYyehDU5z+Jh80HFxXwHz12VjO1qp3UbhWwB53huHNneXTq4XmJIAqb3For6W
         VdSoIopEyw9AGpMpu92gkYhUgo88+ORu754OgjS2Z8QNCOtjJ7oK9B9b7/Rwh8+VJU/z
         s5VzgnIPc23KiKtilnPPHcIXWHSuMUgx9D8ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481451; x=1743086251;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLieBZ73VZIMiw8BIDtk3zxR2xepEN+VIiK6lh2TcHM=;
        b=i7QSnTxhnoXseJUoHZethZw++/6QwGmXsKRsi4ChyGf0m/Ns9USm5wNi9296YK35ID
         T+NHOfkvWD9vlUPY4uKvsiZkf4pzMVmsYKbhUVAN8z/BgTJwbMkVXyB/3eSg7kVcKmED
         V1xWvg/jCCV0aMnpYKgZK4u4IFgak5DfabWrElXeDLg0EDuEd9vf1V0kYbuH9Mjlz8FU
         cd3GXnLLjzSpFwVHfPY3Wkt9k1Kkenrl0pxKBrSinuZTuPV3Pmb7IFDZHVtNIEOMbIUm
         QKt2CdNvs30CKFPAvlb/K7FoygSzsq1kdTQNn6NP9KQn3WoqGZg4GCM37zAPvI4Wcf4o
         uN8w==
X-Forwarded-Encrypted: i=1; AJvYcCVhu1j7378tGWLeBadZbO5mVt/D4KJjZcvNpzhaVR4S/bHvEGTJ9aP0lAJ8KS/LROhV8hgHi9WAsoGHn8ET7OCHpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5/SoUTPfTA4tXro75cS2LFTFSdSXjMooxD7gtuK73dcYfLYsA
	jm1F1RMvsFEyIloxW6IA+7BuM5AeVixvUfpLvdi9AxlcVPvkbQntFjL7UmeDLQM=
X-Gm-Gg: ASbGncu9jxSUDG7zsCSzgYNqdTbNbLbtzFxoDgIRSRGDUdePSjy/GbRJ1PDYA3Mr/8N
	fh5crEsd4WHvF3MMCZVXCKYmuq9Cn91g5dOj38Ci14Dx7a+qdd+n/3czF22IPC38f4YXhlYLEf7
	/mz56bbD5INrMp31fBvt4YybpL6GZvbiBZGBFiFvatj+6vvNyubE18vvPEJkIYfvtB6twazmOdw
	gyYBl1Kgqer42mvD5yq0KEfxNfJUfKOSJKrN9QT3/92aHCEPJBGQhGwMHFV4IeNmGe31z/sMp5H
	aTw+ORg5tbS8eCJoE0K1sFONBHxET5EzgvSS4tChaDLoidxQx0UXE3j7omHP+Dxit7K2cJxE1ef
	gujPOgG+ACiQ/9Ts8mbAApv1DRFdriKXf
X-Google-Smtp-Source: AGHT+IGCSbWQkoc1TYOe2YjTi9lNZNA3sH1gPQvg2JqAz1jsNJDZN5gpnfz3/Zh7tZ7K5jjJT1/Vvw==
X-Received: by 2002:a5d:47cc:0:b0:391:4889:5045 with SMTP id ffacd0b85a97d-399795d89femr3122170f8f.36.1742481451362;
        Thu, 20 Mar 2025 07:37:31 -0700 (PDT)
Received: from [10.1.9.44] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a3dsm24183848f8f.74.2025.03.20.07.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 07:37:31 -0700 (PDT)
Message-ID: <64138d50-a5a1-4ddb-9080-d83542f64769@smile.fr>
Date: Thu, 20 Mar 2025 15:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/2] insane: Check if the C++ toolchain
 supports --std=gnu++20
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20250320134009.2631475-1-yoann.congal@smile.fr>
 <20250320134009.2631475-2-yoann.congal@smile.fr>
 <285a6f70302a45e896cd93bda2ec5ed135597110.camel@linuxfoundation.org>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <285a6f70302a45e896cd93bda2ec5ed135597110.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 14:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213405



Le 20/03/2025 à 15:13, Richard Purdie a écrit :
> On Thu, 2025-03-20 at 14:40 +0100, Yoann Congal via lists.openembedded.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> This is needed to build nodejs from meta-oe. Check this early to
>> avoid
>> an error later in the build.
>>
>> Fixes [YOCTO #15804]
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> 
> Subject should be sanity: as insane is something different. I tweaked
> on master-next though, no need to resend.

d'oh! Sorry, and thanks!

> 
> Cheers,
> 
> Richard

-- 
Yoann Congal
Smile ECS - Tech Expert


