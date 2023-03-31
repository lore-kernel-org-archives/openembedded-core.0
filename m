Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D41C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 16:34:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.60028.1680280465170718070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 09:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CeqCSTq2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id l37so13247375wms.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680280463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pXWYpDXI/RMfx0AVU8HcnsRQE75fLGKhTpapuEJZviM=;
        b=CeqCSTq2Qna8ekFQzDGcruEXJC0uaZwumGBxN4FJRCC3YYYitMO9quiwUxSb/tHPVK
         XKxATWvkwh7aj2szq1FRRYP8jjXzQ6qMzYlf/3uYC0sJAm+UfxS6Ew/fsoMcOcGL0QoM
         xmtdIpPS6K7A240jNn7OW1fIS6b70W9prlac4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pXWYpDXI/RMfx0AVU8HcnsRQE75fLGKhTpapuEJZviM=;
        b=aPQW4WCrnY6QLL74njtGG28G79oFotdhqMJP128yNzhi2U01SPtq6iICA8r+EcwB1d
         5GOcI51VYWG0Q0WE70tAJHg5RYLC9tpJo46D4cFZvScBExB4w1FNkqT99ACk1mrW7+Df
         jx9GnJsYTRmq8HVsjSO9LSTj81vDUc8A84l0pLvmXvT1cZ0cea1UtIvWxFj5dL9OrpcK
         7J8I9SedU7n7ZZpthVqJk6UFI8rfIGPbVIwaWAABy5eYgCiWVH1jvhDxIRHpTkraVmV9
         bnk9nioLmblgVhZ/d8aaKyyoZgcUWIPPtNGN+BTjTg+Q9R/WKcdhK3fOmuOaIOp2CnEa
         6thQ==
X-Gm-Message-State: AO0yUKWzU+To886uwhpesbjh2TRMyZE9Z7p7/8ITajxzdehHpoG9lbgi
	08ndDQj0CNsXbMrxlP0SUiIENQ==
X-Google-Smtp-Source: AK7set8j0BWoTe0WTpyINocufXOxwtGJeRBJwm9JkU2LybaD0xSAZYYiOUTW/OkVWYSLjA0yfaFISA==
X-Received: by 2002:a1c:770b:0:b0:3ed:4b0f:5378 with SMTP id t11-20020a1c770b000000b003ed4b0f5378mr20823956wmi.27.1680280463388;
        Fri, 31 Mar 2023 09:34:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:18b7:bfe:d74b:7341? ([2001:8b0:aba:5f3c:18b7:bfe:d74b:7341])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c468d00b003ef7058ea02sm10283006wmo.29.2023.03.31.09.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:34:22 -0700 (PDT)
Message-ID: <55024a9677091b2b1d3bc4faac1216e271940272.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for
 zvariant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons
 <frederic.martinsons@gmail.com>,  Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alex Kiernan
	 <alex.kiernan@gmail.com>
Date: Fri, 31 Mar 2023 17:34:22 +0100
In-Reply-To: <CA+cAkeqXdBYLbtVzMvwTLWPqTBkWm7dmPit_M6LG5Tt4VRUwtw@mail.gmail.com>
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
	 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
	 <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
	 <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com>
	 <c007fc29d99e2116d2fd53a9338d329559723102.camel@linuxfoundation.org>
	 <CANNYZj8xFw5_c6vZ_aiDhSuf1+aZRayJfvXHpg9=mhtGp7taTQ@mail.gmail.com>
	 <CA+cAkeqXdBYLbtVzMvwTLWPqTBkWm7dmPit_M6LG5Tt4VRUwtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 16:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179454

On Fri, 2023-03-31 at 17:01 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> Ok I'll take a look at this next week. But I don't know anything
> about reproductability build so if you have any info that can point
> me to the right direction, I'll be glad to read it.=C2=A0

I think the simplest thing is if I add an EXCLUDE_FROM_WORLD to that
recipe for now but we should file a bug for the reproducibility issue
and ultimately fix it.

This would let us add the additional testing but aim for improving this
in due course as well.

Cheers,

Richard

