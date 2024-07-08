Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE58C3DA42
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 08:15:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.75058.1720426516620678981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 01:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DGNQY7+J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-36798779d75so3170850f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 01:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720426515; x=1721031315; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSIY5dxL4AOm+Psv+L0Rc+d8XD/XG2+Ks1HMcb9256Q=;
        b=DGNQY7+JWsQ2UHvyQYB6d3Ltt1k/IPQ2Wx5ADOnUkPDt3+0lEy6q99yMAWhvBGA3jg
         PA05P9v/BhCnk25LP+BsFJN/4x9YR5W7yBUooxj1/mz0YFASfEe8LyP9pX4ZihvMFPFk
         yyD0JkJ4yjayKTX2iQpPWQKfGODtyHwM2WTms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720426515; x=1721031315;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BSIY5dxL4AOm+Psv+L0Rc+d8XD/XG2+Ks1HMcb9256Q=;
        b=eZO7eqb+ZFVr9x8VyJyGRKh5Vt0e06lc+yaWmbCAnFGqlktiw8u2tLHG2aBYNWaRb+
         FfszCbVHC4BqmK0Eztc7AlFZTg960iE8c/VK1KZ+cdSKX1Xds5IKgbHdO/ZlZBHF1MLv
         72ebqoucxYbX2APJyWuV5PnvukiL6udmqHJtH/jIH5oOheccAZOnN67UMsgDNW/RAf/D
         LUkTmChOAlyUh/UaXpSSWMfXiAf/2oBIF2Roh5H/EFALDHe1XDqsLNkxvwK1VWt+QMSh
         xxEPgiQ2Dt8WUtaEtx5eimXCmEH4/eiBOGQPRHT+nbX/cl82SUMmKSYZYY7ymTdxQQrL
         J26Q==
X-Forwarded-Encrypted: i=1; AJvYcCU73qePnZKhUZddHQOLIY0COlYIh7nBtUw3Dr/Ii3eh61785YLRLK5i1bRBfU8vBUnc07HNbS+OJPkJca2I1WO1t/rfLJ93c7xISNoLlIENSy/dmgiMqap4
X-Gm-Message-State: AOJu0YwD3w4IT/fQX/LCOyVrD3pZ9UX/uu+9e4XVy00w6pEQsBxJ+AVM
	FYL2ew1uCo8wD3aRPp6vP84ijGNtFY8ztVNO7IfNRvYl5vdWZDYlYv/l2ndd0KI=
X-Google-Smtp-Source: AGHT+IEkRlWadxeVIhfLULPbB+Q/TxmqNVdz2MyBtixfnfy6AbXBGl+Fuc0F6syGnVI2Q2ZoDBQa2A==
X-Received: by 2002:a5d:650d:0:b0:367:89d3:5d3f with SMTP id ffacd0b85a97d-3679dd1040emr9767539f8f.6.1720426515109;
        Mon, 08 Jul 2024 01:15:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1d0a:489f:367:5889? ([2001:8b0:aba:5f3c:1d0a:489f:367:5889])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679efcffe0sm9955433f8f.97.2024.07.08.01.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 01:15:14 -0700 (PDT)
Message-ID: <8e3a910b8a9db0210ce0abef9fc1013dd93473b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.72 -> 5.76
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 08 Jul 2024 09:15:14 +0100
In-Reply-To: <20061.1720351816128509704@lists.openembedded.org>
References: <3010.1720348883591077355@lists.openembedded.org>
	 <20061.1720351816128509704@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 08:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201629

On Sun, 2024-07-07 at 04:30 -0700, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org wrote:
> I sent a patch to fix the incompatible pointer type warning (from the
> musl logs):
> https://marc.info/?l=3Dlinux-bluetooth&m=3D172035149427086&w=3D2
>=20
> This casting is done in other places in the source so I don't think
> it hurts to propose this change.

Seems reasonable to me, thanks for sending it to them.

Cheers,

Richard

