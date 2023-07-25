Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E55C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 14:06:04 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.21194.1690293955177186567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 07:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QidHlRI0;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so13799166a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690293953; x=1690898753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NGvR8iSMHZ7b9EKxz2GEZlOL3DwYLQkQWEG5Tfzdds=;
        b=QidHlRI0mQoE+bUNC95U7Hip0OfGDcQIA1/8gnFNOWB+fCgTL+b3QLa+wCpOAMLixK
         pZ3POLHvVNExyGLdwcj5MZYBkKo0F0BHkWXW2G63AiVhtefMJbqx83cerHVK5wXC8IVu
         qtnwgmpKmyIYncGhJJG4BTNw994LYWKEkr0y3wfJ7FMp2IfcSodtVl3UFdU2MqrUcuLn
         9S4TI4on0EPdyCNLA2vdaLVsGK+W8f5xAZPq5zkQnTgQ/BHTSuF3YsTjCZaUaYQ1GZ5v
         nm/0CO3hJge5zYS7oTb1ZtASYZfZNmdEu4aKXI89F/BaaH80rIvV0NQ0QUhj8HYNmVc0
         K4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690293953; x=1690898753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NGvR8iSMHZ7b9EKxz2GEZlOL3DwYLQkQWEG5Tfzdds=;
        b=JQUTiNbt1QjtlsZlM2QfwOk3wOy0W5QL1EcuvM67bn4G733lpbwfx7AWtpYamr5B1t
         FpcDmVe+H4kRCtvxy0iSDItvtL+oNWty7nDZbrdtfoTO5TkCSAGzc8dSUFMdy8tQQ2FM
         jaWhG8l4k46bfi83zyH/paCz7QN1ku3cXeI9Qhp1jUeXZ1taD4P9Ds01D1iy2DtTIavN
         poxHsxM9dj21AUC974BaDSTqZRE9R5B8b/bn3N8reyTubBtQWZLOlSsmcuGERaCgfp4v
         DCozOVe5baasLyL1QkIV0mzX/S2fpoLkwPQRo9XGrKISHe8uXuA5Dobv6vz01DDlyXb5
         kUNA==
X-Gm-Message-State: ABy/qLah4VU/eHJaoIyEpiFG6J+drGI2qd+05fpwXEwdYDOMxgL5p9Q6
	j+6w3LB2AAF8YJB0dLFYzAw=
X-Google-Smtp-Source: APBJJlE6EdNV9w9rzXBHmnUPY83zsC7vTyXi2I6yijUzJgTp2+cv1Vp6kXyqegTMPPwz6Ov2PI/7HQ==
X-Received: by 2002:a17:907:7708:b0:993:d589:8b75 with SMTP id kw8-20020a170907770800b00993d5898b75mr2688978ejc.2.1690293953216;
        Tue, 25 Jul 2023 07:05:53 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709065fd400b009934b1eb577sm8363767ejv.77.2023.07.25.07.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 07:05:52 -0700 (PDT)
Message-ID: <528fd043-0709-a363-00bd-28753fe9debe@gmail.com>
Date: Tue, 25 Jul 2023 16:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>
References: <20230724123529.288581-1-zboszor@gmail.com>
 <CANNYZj9FLbQxnbhd-Lzcr5GB3Ycf+35O1eADZ51EuVNg-eN33A@mail.gmail.com>
 <CANNYZj8HRnoCSBax5VzHU+xU+=XqeS3gF_ys_jFzJYs2+MivwQ@mail.gmail.com>
 <3040946c-5697-d6f5-567c-7bb85f8e0c49@gmail.com>
 <CANNYZj__RUD=T7qgBpAmNs5K9Qf1hgFkjeqnsm_04yAQJkxQow@mail.gmail.com>
 <79529556-5b85-c8b5-1145-177c741f9da4@gmail.com>
 <CANNYZj92V90ADfPLOwT2QEkm9JyE4aDWM7SFCPO6JpFVbE7xqw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj92V90ADfPLOwT2QEkm9JyE4aDWM7SFCPO6JpFVbE7xqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 14:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184845

2023. 07. 25. 12:30 keltezéssel, Alexander Kanavin írta:
> On Tue, 25 Jul 2023 at 12:27, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> I have a working recipe change based on
>> https://github.com/rpm-software-management/rpm/pull/2579 (for 4.18.x)
>> https://github.com/rpm-software-management/rpm/pull/2580 (for 4.19.x)
>>
>> I will send it soon.
> I'd want to see what rpm upstream says. Maybe we're doing the whole
> platform macro thing wrongly.

I sent the recipe change so you can see the complete picture.
FWIW, I was able to build a complete image using this (no problems
during do_rootfs or anywhere), and rpmbuild works out of the box
on the target system.


