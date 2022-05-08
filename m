Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0C1C433EF
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 16:45:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.22208.1652028349745402298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 09:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jnuw8xVd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id j15so16483757wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=vmAADvfz+iQaXYvDlUU8Zm1RDVXDczVKhyAi+Yki8iw=;
        b=Jnuw8xVd0uIFFiW0PlYJ+UX2RqYKbZ7mQFjK1/1TvynjzlwV1eQwNhADKgoSaMGjtY
         1SOEJiE4GBNMRgIxNwZn+ygDE4Lr/GvMVoRXkdRFWmhRvWF70Ugar8J5PuFCiPlB8ALw
         K1dAu+1+UDvVcY9A5mg4T7epC9h0DxOnrPwmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=vmAADvfz+iQaXYvDlUU8Zm1RDVXDczVKhyAi+Yki8iw=;
        b=FUkpvGvynQuugrBMacp47H8yB8yV69TbUZCGB7dx/rZWoAmRp3PnIn3t+IC+KrWERf
         G9VYLlYrqn+/jp5Z44rn0F+XqkaRPICbuJcKrGJq8rCpCqPl6vN5iOAMIWguyqB9NGot
         jl3f4/u/MyImFyA0y6duwZacTMOu/fNCBuv4NKLA2p/Jt1yCfHFbJumh+02L65BWM5fi
         Fw7/7wvE7xQzWAgnGet3pg3z8LKSTUeCcwVEU0tKbEv5qPLR0Z4Uw21HhkPsOg/C3EU/
         i1iA2MGepNa+p3+SBb//a9akQbdEgddQ7yCZhMj7AVRmca1fyDia7c4RYhCp8mNmViqg
         H2pA==
X-Gm-Message-State: AOAM533mrC5ISYkA77+rInzYchxIzr8NzMusAPxNm2MM2+OgQjDCYV6n
	gYzprDMKoLLTSmzDuhiIcoLIP5vj/EFgFJRq
X-Google-Smtp-Source: 
 ABdhPJyV15MqhE9QeR2rKxeU4Q7M6Z65VebQC0HnUbdrl5sx16CIGbmOg9lO2ElCRYadLaTjSRs5ew==
X-Received: by 2002:a5d:53c1:0:b0:20a:db5d:2590 with SMTP id
 a1-20020a5d53c1000000b0020adb5d2590mr10187073wrw.411.1652028347953;
        Sun, 08 May 2022 09:45:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9751:d995:8644:a17e?
 ([2001:8b0:aba:5f3c:9751:d995:8644:a17e])
        by smtp.gmail.com with ESMTPSA id
 n11-20020a056000170b00b0020c5253d8c7sm8552711wrc.19.2022.05.08.09.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 09:45:47 -0700 (PDT)
Message-ID: 
 <940414ecb58f77ed1c0ce6693cf7b5e8836ce28a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] freetype: Upgrade 2.12.0 -> 2.12.1
From: richard.purdie@linuxfoundation.org
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>, Steve Sakoman <steve@sakoman.com>
Date: Sun, 08 May 2022 17:45:46 +0100
In-Reply-To: <16ED214F51D113CA.5869@lists.openembedded.org>
References: <20220508123418.159142-1-richard.purdie@linuxfoundation.org>
	 <16ED214F51D113CA.5869@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 16:45:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165380

On Sun, 2022-05-08 at 13:34 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Includes fixes for CVE-2022-27404, CVE-2022-27405, CVE-2022-27406.
>=20
>=20

I'm amending this to "Include fix for CVE-2022-27404" since CVE-2022-
27405 and CVE-2022-27406 were already in 2.12.0.

I don't think the CVE checker is going to like these as they're using
dates for these for reasons I don't understand.

Cheers,

Richard

