Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE66C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 09:09:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.15737.1724231372689357267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 02:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NWzBnjnf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428243f928fso70455655e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 02:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724231371; x=1724836171; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AzvNO4sV4Xv+pntkqHvU+csHenEZ85mmzW0TzAlayIw=;
        b=NWzBnjnfoaFqVibKSjTRlWVlG4Btc3mCPLvfRhOFUZgDecUYu3dhSzPHo09S0E+CEC
         7GB1Aqceh0a+w2XtJzJvQ/+U3VJutTAs/4GhZk35pX4lkxTU+gXV/IoN/tbqmafAmIKh
         ZDNRf0x/Xw8brlWnqLU3naDznS9DfppT374Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724231371; x=1724836171;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzvNO4sV4Xv+pntkqHvU+csHenEZ85mmzW0TzAlayIw=;
        b=nP60x99dzB5p1jQGw23pd0tDh3NqaSNLsMTuyumMNU/T95GJynp8Q5voeQZ/mGfmFu
         NZaxrdyKO8BGBu59aozij94ee8E/vjx52RyCDm5B3so7mOiUv1p3zmrBbSev7kUzHRBX
         DAKLHdocF2M4NWv1fXiL5MVy5S5+0kElhBAiQ/QO8w/Ou6n8fjr7Oh0AE8AhQnaD9i+k
         GPJBLVa0OJ07eQs/G8gANF4PMNQp+I+pK5Qq83qlOWyMIDVAR/K6nsyZQmT7sWWDIlPc
         mI6rqTEw6+3vEN2r6j8t4JVlO87JuM3WW8fqeLWOH7DmPwCz0TLOfdsh4+H7KyKt99Tp
         QRCg==
X-Forwarded-Encrypted: i=1; AJvYcCW0MRuClVpem8pv7x5RWubfF93lv654LzozNvN6kJbOp1LHeMeKgKV6oTDJjvOCdnwI5ekT9X49aTN9KPryJNGL3g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzy1Ll1H0SWPfmnC80QoeVeOeVnnrpZlF4yqlQWGBTFFzIXhpbc
	nU00jHyRQe0y4CJrHwoMbmzCEAotsWu0Tk+MnXut1/k+Q3P+5eGcPZ2/PtdsD4Q=
X-Google-Smtp-Source: AGHT+IFARasQ69IcosDeHGZz1e0YZnzi8v3R9wHoJqBG12+rAjXE8MUKn3kiaL66AJFNr/JbN68Ohw==
X-Received: by 2002:a05:600c:a43:b0:428:d31:ef25 with SMTP id 5b1f17b1804b1-42abd2153e6mr15926445e9.12.1724231370836;
        Wed, 21 Aug 2024 02:09:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:91ef:3f82:9d0e:a987? ([2001:8b0:aba:5f3c:91ef:3f82:9d0e:a987])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef9948bsm18313475e9.26.2024.08.21.02.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 02:09:30 -0700 (PDT)
Message-ID: <d5ae5a3ee5d270ed34bbf6b3628971e38eda63fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kmod: upgrade 32 -> 33
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2024 10:09:29 +0100
In-Reply-To: <CANNYZj-OjZ2--ZHCQz6vkxHbsS7CQ4HCJ0gRSYc91Ba12qE-Fw@mail.gmail.com>
References: <1724142644-20746-1-git-send-email-wangmy@fujitsu.com>
	 <710ec238fc73efaedfbdb3a06c4c57214b6d926b.camel@linuxfoundation.org>
	 <CANNYZj-OjZ2--ZHCQz6vkxHbsS7CQ4HCJ0gRSYc91Ba12qE-Fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 09:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203579

On Wed, 2024-08-21 at 09:17 +0200, Alexander Kanavin wrote:
> I have a patch where this is addressed in=C2=A0
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-versi=
on-updates
>=20
> The whole set is being tested in a-full now.

This is getting a bit tricky as Wang Mingyu posted a series and there
is change log information in many of those commits.

I had tested the other series with an a-full with two issues found, I'm
in the process of re-testing it without those two commits (after your
build).

Somehow I'll have to try and pull the best bits of both series
together...

Cheers,

Richard





