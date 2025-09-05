Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6814DCA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 11:02:16 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.18676.1757070126666213469
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 04:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXzraQzo;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afec5651966so401117866b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 04:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757070125; x=1757674925; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQ1No2z1g/XM7inTI+mvqyhatm/GruUrEs/s9xawOpM=;
        b=CXzraQzoXEwDxcMqt1ZCEr+1SRBUECH0eA/VWQVT2FGdH/z6B6qAvW+cF0eGRD7Dm8
         QLdqcTku8v0d0egWtD/UygPD9khrZPqEzL5B63efXUNyqqcIoYIrG6tyRMgFwUdGusjq
         k0sDmiH5mf+pDDwy7jAKutlBx6/65m9TAiDO4gpUWuDTWqfzV+fLhkeDnqXu2s18+0wJ
         jezl3xbBqjRnUcFe87/hazRwgV0lk+eEY3dnJYpaB6v1fl/uAabUuqDhTAkkxgH93VMb
         sBD/OrF901iKn9JiOd+fwYhsz0ZeKHoUvtxAHZFMihO7tYNE8x3/uKTpOducA6cA+XKG
         1qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757070125; x=1757674925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQ1No2z1g/XM7inTI+mvqyhatm/GruUrEs/s9xawOpM=;
        b=uKtC+qebAUMPDo58MGmYL3aKsLn8tb9xPfTvrDZzGptMUr/aZcCc1cmBAcJwAHDoV4
         cu1aObfyQpc21988wOCrVk5TxjTNPDvkan6GuRaRI0fxeVy6m/VgsYjf5HPfabRyYwo3
         7JIXx8g9P7RWYfTJN4J82d1SoW5z+YhegpIXcxXxqOANQaihi3gSL9YaGAChgNsHP2yn
         eobePQMKvjDlcwPHvzVpcSq1RYE0VHSJ+L/GHB7oAc7E6O8u0qM9dNrry66FqO+DaFg3
         d/m6VbwSidi+7W/ftfB1PyG835lD8n0nmHOPWykqXLGwLktMJDfQkVNusSi+cgvAt2kf
         m/wg==
X-Gm-Message-State: AOJu0YwTZ2oGvOmTa5VruNdlKWtIOhTihmaQgrCKbbIghzbSNjZYYxvg
	aR45VeMkK04QNN/eu4JnThcEouQa4BzQgEqC6Ym6psLG7IHS2XthTCVc
X-Gm-Gg: ASbGncu/uEsm+phYQZxyVIk14pFYn9i6Rs8hSwRiQMnySp+K4ngjc7m5yXGIfONUdy7
	fzyxTmwKaQATvFkuxrkWjjZaAztqg2lzTMwu3jfbHkA+ZMhyTeMhUDck7ZoWsHp7CZ5bJToKsJo
	Epk66bGljbgJ9mghRoqrIe/NIo/nW3K/yoliRLK8OaBNcU4IQLnXNFkGull0R45fZYRBXV7jzEZ
	+OPQUlW4+m457ihjXBCdVga3F44EXhBFnWjUCJwRH29jmQVyDs6l5miu2Pr4LzdIO0X+As+1gE5
	baFnKxfVAXjujCRkFsYS2LjJMZuBml1WBNTAQ9ClbedQ9JUNiMx/1CJYnEC8VdQ+woaEBvSVpJL
	oJIJetftIouQfOLqohphE3yJ10BQE3nc=
X-Google-Smtp-Source: AGHT+IG07ELquCrINCsPh7cGNelHLJ2Ggc6l+ZgAw78X1PpKpEroCGTVpMT3Fyl7DsgSXIuQyGwnOg==
X-Received: by 2002:a17:907:d78b:b0:afe:cb06:ee2c with SMTP id a640c23a62f3a-b01f20becc7mr2175127366b.59.1757070124730;
        Fri, 05 Sep 2025 04:02:04 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm466925266b.53.2025.09.05.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 04:02:04 -0700 (PDT)
Message-ID: <3782c24f-9d92-4221-a170-54dbe6048171@gmail.com>
Date: Fri, 5 Sep 2025 13:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] gettext, gettext-native-minimal: upgrade 0.23.1
 -> 0.26
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <186229F4B4DD4221.5335@lists.openembedded.org>
 <03abf8f0-89f7-41b4-9fe6-81072b2e6d87@gmail.com>
 <CANNYZj9GbpFEyyj3pWdAvXCpyNXrnso6LYL_g4HdPnGw5eyY2A@mail.gmail.com>
 <73f6c7ef-b598-4d1b-898b-ca6a18966c38@gmail.com>
 <CANNYZj_W=wCmuG1dtSobvLQzeJDWXXieu6V2hZwHQjTfqDGcmw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj_W=wCmuG1dtSobvLQzeJDWXXieu6V2hZwHQjTfqDGcmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 11:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222990

On 9/5/25 12:52, Alexander Kanavin wrote:
> On Fri, 5 Sept 2025 at 12:49, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>>> So is v2 still being developed and will be sent for review and testing later?
>> I have sent out V2 already[1], feedback of all kind about it would be
>> very appreciated.
>>
>> I just received some feedback off-list that the first version didn't
>> reach everyone somehow who wanted to review it/compare it with v2 -
>> that's why this was resent.
>>
>> [1]: https://lists.openembedded.org/g/openembedded-core/message/222852
> Right, but if there are no known issues with the patch, and you think
> it's ready for autobuilder testing and merging, then you should take
> away the RFC prefix.
>

Since it's kinda invasive as it touches a lot of recipes, I thought I
wait a day or two waiting for anyone to speak up if they are against it
for whatever reason. But I do plan to send it out without RFC also in
the very near future if no one complains about it until then.

