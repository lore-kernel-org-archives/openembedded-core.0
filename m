Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646C1CCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 11:34:36 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.6466.1759404872753801347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 04:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJTGxntM;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: zboszor@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-273a0aeed57so23827515ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 04:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759404872; x=1760009672; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgDiLvUXLVHZk+3oI1tP8Ma270eK2NZFtayuuvfcY3s=;
        b=BJTGxntMh7tgYn1xsCs/jTlrdQFArXFJwpTMEkB79VxFLKYZOknP707Vhltsf0wg6u
         oAJiOKYVv3Kj7tVxIYxQ/IolOwT+GxTuF9Ape11Qua9teSlAf5hqsyJg3/rmLahslCXB
         Nfrha3GjGTurdYnwyxEVnla8IECTsy/TlFqcqXJqxBgmOpsURhwZWGKgkmrH5L8uK1Zw
         xs/0UuCkf1vsP7nIEGBBgXuJ1gpBijU0bZhBN26eWCOXTwe9E8VlRUlGgv5TmLK59v0r
         AYiGzyu4C8g2zN3V01BSbtfzVYq1iRZKQoiDKw+E2KDw+C2Y6TJ9sVZAr5XMDndH6lgB
         fMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759404872; x=1760009672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgDiLvUXLVHZk+3oI1tP8Ma270eK2NZFtayuuvfcY3s=;
        b=XNROUxf0Gjp0iXtm8x2xgjx6VdT/QUkY0yXMVCmyWZ2ANY/ahVp/EgZdVimzGxWR4P
         ZG8CWWk++HLgxIOQA8ObcA+Ge/1wCQR28CZcp3TkVjBgiPRLig4WKV0I/RKoLd1pIe+n
         HYWu6KHBxCiJOyRBqUTN/LaGCVGlCsfp8jjCiC1E9V1F5CDk8qrtY+s8hmdv12NREUla
         E1StbEN8uPRkG/Nt+2i1kOhoH6ykdAiVfFD9kjHHTpjJz1Fn9+mZizWKilVhCcRxsrnY
         dYcpEBhciJloHvlopds5NnYV6fIRiyZER+HwQbLF9RajNJjcHi2lOzUUc/ecYngTTi/g
         qyyQ==
X-Gm-Message-State: AOJu0YxLPa4Qy20uXjNeEam/VP5HOjlzPRVdnBElBTuq3PE07Hgo4umY
	HQStHA8TL+liaeXI9x7NyTGYKI6NR6KULI7HFoZdEWQX98rIAZh2QD/V
X-Gm-Gg: ASbGnctWz5DcLqZ5MiaZ1csM9H657yCx3tUSBpGGEnJBf3JIpEOJtAmt43jghMvuL6g
	NmHoKAL3kZkY2ZnKn8dmIGT3y4RPt9j0kKQUnE5t2yjTnacdsfvW9Uce76A0P6j4rhr2MHlRLfQ
	naH6EedUszdGB8iuqWvtSSWmyr3hBkkOLBKcvDSh+h5PIxuX/i7Q9Y4TodMdoC/mbFtH4q9z4Ou
	JjcmnYJ+Em1bNttZaBKCKjQtk7GaaucCdNj/ETIBTNgjNZHPbG7cs1sDraEwVxNkEaDnQPqjH8r
	JeygTQj9G4Kn4Z55brjebUQYa9auAVUQ9m1X1XYcbyDs+473OCGWWkvuouqbsIeGoIr3LK4Sn5E
	2QrniqJxG005IK7Y7rjKpxCNDVHXWdXRJamRVue33ZBpcUogq+xd087EwhICwK1nuSlmZ+jdPVy
	zyYX6R
X-Google-Smtp-Source: AGHT+IHjs8eTUrJ8LinQUqQYgZZZiyVZs/HzGJ34/7+hRDfRqqLvSzmiLtwvkAAox4isiL7pyoDdsQ==
X-Received: by 2002:a17:903:2c0e:b0:269:8ace:cd63 with SMTP id d9443c01a7336-28e8d0a8324mr35482985ad.30.1759404872104;
        Thu, 02 Oct 2025 04:34:32 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1ea92csm19921025ad.123.2025.10.02.04.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 04:34:31 -0700 (PDT)
Message-ID: <2bebc88e-88ed-43ea-b262-e8696f531a5b@gmail.com>
Date: Thu, 2 Oct 2025 13:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: 25.3.4
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251002111844.10404-1-zboszor@gmail.com>
 <CAOMZO5CxxJvxRc-f9Ze8FZVYkZV6_O5mqHvHX9Q45cknz1eXqw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAOMZO5CxxJvxRc-f9Ze8FZVYkZV6_O5mqHvHX9Q45cknz1eXqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 11:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224354

2025. 10. 02. 13:21 keltezéssel, Fabio Estevam írta:
> On Thu, Oct 2, 2025 at 8:19 AM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
> wrote:
>> Announcement:
>> https://lists.freedesktop.org/archives/mesa-dev/2025-October/226554.html
> There's a typo in the Subject line: 25.3.4 --> 25.2.4

LOL. Thanks.


