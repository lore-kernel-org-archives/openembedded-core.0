Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489BAC74A5B
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 09:00:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.6246.1679821215396175775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 02:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JTJEsFwF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so3342597wms.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679821214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HSKn3gzSHaZktTdPaV37cwK6iwOdmj0mNmMX2Y4+kf4=;
        b=JTJEsFwFtfolyhWxGGnUe57Wcsf8cC+gc4g4Q+jFs3Yyx0xdw6Hx0m6x4SDehkH0Dc
         E0r3QKXV1+z4p3oc6fMSSExKzwLY58I8XnUMlLWtpuaLFaJkkQ8i8E/wLIoRrUhuNkmy
         eV6UvlP2E/63Qp7gA9OzDrv5iBi8VfGcT3osw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679821214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSKn3gzSHaZktTdPaV37cwK6iwOdmj0mNmMX2Y4+kf4=;
        b=v1Ety4hgWFf/DMJDIDdwHvbzI9s1acF5iKlU5vn5JCEihqAuU+ptAd89Nfae3lTpen
         PoHwoekuj+5xeMpnTviuCl3nP1l88QQK5s5wy9QPtlwXXWO3LuYY2IIddzAXzjhPazsx
         0Cc/T1a4dwHnDHnhAEYrc2VAd5hPeyu5Q4O5Yzuwo14Huex0d5AFi9cq3co2t8CZv8wA
         BstLOVnIerKrNcHV225ZFJmdxK6nMFDh5k0ErqtrcG5GfzLOArK79aiHMFSedFQq2zDV
         LdPsO5F+Tl8Jl6KJrFJdoLQZflMw2VNXrVuPwXy7ttadMmzxmCkoZze3U4KcXzMQVYhI
         YMqA==
X-Gm-Message-State: AO0yUKXXCzUfvWcq2h5yGVtk/8zkNb4L8wYm/zaxxFpWCWR+Kdn1vu3l
	p5YMpb9o0395acrA8xEwhCAWbiFDi42hvB0L+ww=
X-Google-Smtp-Source: AK7set9EeWdaGmKwe0B2osZ0TArP5mona4f/NXHkqqxjp867zg4FY0e6QsmlJcO+XS2N6kkCLfhKVA==
X-Received: by 2002:a7b:cb92:0:b0:3ed:88f5:160a with SMTP id m18-20020a7bcb92000000b003ed88f5160amr6796531wmi.11.1679821213856;
        Sun, 26 Mar 2023 02:00:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e91:cdb:75c4:1387? ([2001:8b0:aba:5f3c:7e91:cdb:75c4:1387])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d4e84000000b002ceac2ccc4asm22295220wru.23.2023.03.26.02.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 02:00:13 -0700 (PDT)
Message-ID: <9201518f604d50dedb65cd337c42230c23438092.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-scons: upgrade to v4.5.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 26 Mar 2023 10:00:12 +0100
In-Reply-To: <CA+chaQcgXJSgp8SAT2ynqvvF8vOZJguq0EerQSJC42vK1z1OAQ@mail.gmail.com>
References: <20230324141626.1361740-1-Martin.Jansa@gmail.com>
	 <cf263160e22b4caadd5a5c11f3f4871ede96964d.camel@linuxfoundation.org>
	 <CA+chaQcgXJSgp8SAT2ynqvvF8vOZJguq0EerQSJC42vK1z1OAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 09:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179114

On Sun, 2023-03-26 at 10:57 +0200, Martin Jansa wrote:
> You're right, the commit which fixed the issue:
> https://github.com/SCons/scons/commit/a4ab466c6df5bd3187e78c36bfa8f68e1fb=
7659e
> said #4231 so I went with this less cool number (without noticing
> that my other tab has the issue ticket #4321).
>=20
> Should I send v2?

Please. There is some issue breaking master-next and I worry it is
something which already made it into master as there are only a limited
set of possibilities in -next including this. I can't quite see how it
would be related to this one but it is why I was looking...

Cheers,

Richard

