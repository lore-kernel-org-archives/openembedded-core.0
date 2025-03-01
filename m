Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA04C021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 04:50:05 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.3708.1740804602525834057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 20:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=llTINwLD;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22113560c57so54444295ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 20:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740804602; x=1741409402; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6Z6fElv44USeCLl8vyTI5I4ndtmr1GKBSPjJXkBhn4=;
        b=llTINwLD/x9/IWeMgAYT4XjiTfeDqPxp7muu99IXT9/4Xn/vE3JBkVj3H72JMmqhHK
         V25FnbEa6edJL+EbSR4upw6yAbUkQ0Qv34+7KcrhpHK6UeWaa6j08ZfM8zlM3SIOFC81
         OQdZhmv0hXAAQo1jbTW978JZnVQNJyTFWjTJtNXiPe2/UvUY8LIN8ado0ZJWOZsQF0mX
         Tw2vRBSSmcllxR3zoqCrer77MhkUIZxqrQbRvJ8FyfXuGeVC7m5pOS20la+y9zCGYNTq
         K9U1HrJtKp2DxGwJ62XrqNnNNMY+y8HcMHqGR9HnfJiEaKoEXChGePrfX4KM8T14EuKZ
         +ISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740804602; x=1741409402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6Z6fElv44USeCLl8vyTI5I4ndtmr1GKBSPjJXkBhn4=;
        b=OErUQcsTqilFHjUGWIuIXPz3LFgSCEN7I3Nv6P8SM/HC0Jsq94s/JbpgFX4uQMWmCQ
         NqDI3froyKXsCTnjmh1ehx17pMRJUICB6s6mPYBohngFilZAANuOakVmFRFEY51usakA
         gle2o+q+Y3GxArIlASA14BNChsxdwjO053Vc0YWfqNeoNRhe2lJbOq3QkhZrIHoKyWXM
         SlmvGUrx8Ja0H/+RUdmhfI8W/WFRifU75c9T51gC02LCSxJYnJLDJjmSimIdmFYzrXgG
         5Pa4wsk3bpLRZtI41yzKe6TXeuTYtl7ClkY2KbLZWy3nW0k7m+A4CQjffKFv38W7/QZ6
         lVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXipl8mNJo0cLIm/sHZYdKW17E1ZRmm9fzD4sghRUfPmq1JOGMsQFT4HrMigc7sk/cty5edt2uo5I9aWLv9jEZOw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywx6Bni1+DpYiNuPaJ3D1FL8ap2F1WfRWeKyp1FypxyDzeT2uLD
	JwDNIV4w4pUVkIRo3Y6/VavZaeU5MG2LeZzH4NoGn3AKi2akE+W2
X-Gm-Gg: ASbGncuBTAKLwi4gcPOWIvd4XKAoqMbtV+aNXCIcLAj9AMtyvS6Txu0hCyUFuSWI6Ay
	J7tOIZY6ZkPab6JNk1wMXLKa/W1jaYkN8Cip7IXjN7arUTaeLppcoZs0wl7oak9Tf6FTBpVKLl5
	OXEusWZE+94kj2t9+x4H7KDCMAJkfd9QvEXMi6qgT6vHoW5iEeeztFxylyYhgZ593FbfyXXYZHn
	z9hFWj1ICxHxC5JlpbxWphlEvvnysDub0MgO/2Te6dVJRj3T2LTSVGnHL2mZJPGaVDe/Hv1j9et
	L08TOlH/LfSJfx1Kg5oP5N4exROm4bjjEWRjKo/yFx5Om+WjCdyNE9ehJpG3zazrMhz8MtGW4mH
	P7/kgwF38ERvGTRxZka0zysusBuQdgtG1
X-Google-Smtp-Source: AGHT+IExqVZqkc86SWcqtBcg+Ny0qrGR6CAkFFH/1mVAP+use2rahtHSeYw4W9tMpOHdeCPwbX0JHQ==
X-Received: by 2002:a17:903:32cf:b0:223:5ada:891a with SMTP id d9443c01a7336-22368f72fe8mr115362655ad.10.1740804601946;
        Fri, 28 Feb 2025 20:50:01 -0800 (PST)
Received: from ?IPV6:2601:646:8201:fd20:b97c:f45a:2761:8e2b? ([2601:646:8201:fd20:b97c:f45a:2761:8e2b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c09sm41513435ad.142.2025.02.28.20.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 20:50:01 -0800 (PST)
Message-ID: <69a5783b-362b-4ded-8bd4-f510b86280fe@gmail.com>
Date: Fri, 28 Feb 2025 20:50:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC OE-core][PATCH 2/4] goarch: switch the default
 linking to static
To: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
References: <20250228155301.1033479-1-jose.quaresma@foundries.io>
 <20250228155301.1033479-2-jose.quaresma@foundries.io>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250228155301.1033479-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 04:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212085


On 2/28/25 7:52 AM, Jose Quaresma via lists.openembedded.org wrote:
> The dynamic linked standard library /usr/lib/go/pkg/linux_amd64_dynlink/libstd.so
> contains reference to TMPDIR that I couldn't fix and this breakes the go-runtime.
>
> The static linking is the default and most used linking in the golang ecosystem.
> Even in more restricted environments such as embedded ones the space occupied by
> the libstd.so and the golang aplications installed on target is considerably high
> when few golang applications are used, being in the end higher than what it would
> be with static linking.
>
> When we use static linking we can only use the parts of libstd.so that we realy
> need and thus we do not need to have unused features in the runtime system library.
> This way it ends up not even being necessary to install the libstd.so on the target,
> which reduces the total space when there are few applications as already mentioned.

I think it becomes more useful if there are lot of go apps on target, 
which might not be as common case so perhaps this switch is ok but we 
need to document it very clearly as defaults have changed users 
expectations should be aligned as well.


>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>   meta/classes-recipe/goarch.bbclass | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
> index 1ebe03864f..dfe1c64b3b 100644
> --- a/meta/classes-recipe/goarch.bbclass
> +++ b/meta/classes-recipe/goarch.bbclass
> @@ -38,12 +38,12 @@ BASE_GOARM:armv5 = '5'
>   # Go supports dynamic linking on a limited set of architectures.
>   # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
>   GO_DYNLINK = ""
> -GO_DYNLINK:arm ?= "1"
> -GO_DYNLINK:aarch64 ?= "1"
> -GO_DYNLINK:x86 ?= "1"
> -GO_DYNLINK:x86-64 ?= "1"
> -GO_DYNLINK:powerpc64 ?= "1"
> -GO_DYNLINK:powerpc64le ?= "1"
> +GO_DYNLINK:arm ?= ""
> +GO_DYNLINK:aarch64 ?= ""
> +GO_DYNLINK:x86 ?= ""
> +GO_DYNLINK:x86-64 ?= ""
> +GO_DYNLINK:powerpc64 ?= ""
> +GO_DYNLINK:powerpc64le ?= ""
>   GO_DYNLINK:class-native ?= ""
>   GO_DYNLINK:class-nativesdk = ""
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212066): https://lists.openembedded.org/g/openembedded-core/message/212066
> Mute This Topic: https://lists.openembedded.org/mt/111436384/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

