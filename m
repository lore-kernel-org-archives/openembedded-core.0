Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78872C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 22:29:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.893.1667341749494051579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 15:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yyi3X31H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so195464wmq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 15:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRiuiWCft18oAKjIsah2028JICUUJ/Tk3t3kmt5q/j0=;
        b=Yyi3X31HTOpUSmWv59E5fiTcdTHR47k4n33W9QVlPw/tf5sr1Z0BjKZkcupiS7Fu5i
         px94K8iRdCp/JX+M7NeRNUB7CyNuVb6qjyNrhD071tC8Aue3OeKBnovKzxmIJzShIx3n
         aVuyvYlv0wyTbT8gbRpFq2pEqeAhMmCG0IfBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TRiuiWCft18oAKjIsah2028JICUUJ/Tk3t3kmt5q/j0=;
        b=kXcIymj+qAGnaEkIDL+gAaC6/hmdDLFczzTOA+yCZZb6EzdVi4GIeF+vg7vlB6g0kv
         t3YMcC2C5lg1v6wHrrywJzFuYiki9e8iJ7Rx+uUgDEMqUv9t/VD0du0S5eOO1bAJuiEq
         Pdtqmq7q5ST24TJ7xGp6L2oiMvMBRkOJCuTZf440pAHnQJZZDmevs52l4GpOVjC/mN52
         PgwA1OmNmnPEyNaBLLLHBdo65txzvGCvwfaaduflAHOP9BYH1Cp16X1OqHvHFHrt0g+2
         STTfwd0FYmX9wz3fdOk+qyFOM1IdmR9sJY3rt8RbQK9Ok5r1wkZ+mRATtqn8whHVC4t4
         qcDQ==
X-Gm-Message-State: ACrzQf2HhVeNHe9PtMv8KvfhI1s5kxUaDgl8jQQ4T6l4jIe9zGqmvmV5
	IR6k4TIaGi6ZPpYUjWl/5FjF1A==
X-Google-Smtp-Source: AMsMyM7viwOzMo8lQfl35xQYgLFvTefkxFofavTB7Q/ywgo3nqivp4HxK27tawlhh3wO7ah2MV6dcQ==
X-Received: by 2002:a05:600c:42c9:b0:3cf:69d4:72d9 with SMTP id j9-20020a05600c42c900b003cf69d472d9mr11254658wme.93.1667341747880;
        Tue, 01 Nov 2022 15:29:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8b1:19d6:e9d8:a61a? ([2001:8b0:aba:5f3c:b8b1:19d6:e9d8:a61a])
        by smtp.gmail.com with ESMTPSA id i203-20020a1c3bd4000000b003cf7292c553sm69886wma.13.2022.11.01.15.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 15:29:07 -0700 (PDT)
Message-ID: <bea81871d7a4247eec8f3cc1f4f363a1b29aa2ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dunfell CVE reduction fun: Raffle #2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2022 22:29:05 +0000
In-Reply-To: <CAOSpxdZBXZuaGcC=aZQTmC_XLPhfzjvmMr9R9g_qoDXWj4_FNg@mail.gmail.com>
References: <17142B1671501C64.2599@lists.openembedded.org>
	 <CAOSpxdZBXZuaGcC=aZQTmC_XLPhfzjvmMr9R9g_qoDXWj4_FNg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 22:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172392

On Tue, 2022-11-01 at 05:35 -1000, Steve Sakoman wrote:
> There were 66 entries in the raffle:
>=20
> steve@hexa ~/Desktop $ wc -l cve-raffle.txt
> 66 cve-raffle.txt
>=20
> Many thanks to all who participated, this is great progress!
>=20
> And the winner is:
>=20
> steve@hexa ~/Desktop $ shuf -n 1 cve-raffle.txt
> CVE-2018-25032 Tim Orling <tim.orling@konsulko.com>
>=20
> Congratulations Tim!

Nice! Thanks for doing this Steve, it is a good bit of fun :)

Cheers,

Richard

