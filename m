Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1BBC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 09:40:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.5728.1657791614264337522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 02:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LtqZhdXJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id o8so679737wms.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=3cwgrUB0dz7AXWNUijAed7MIAnXRnB3DThIMp2oyBR8=;
        b=LtqZhdXJSQQMFgpdjokmnW49e7KGFTQU4qgoxkl2hJAS98ue3Qd7aYuo2pHEwwnZSD
         sBVQK/rKectXBkS25FguXTgz3l8vxHy9ijEzAHDYGKKt95TOrZM8Io6CAEILCn3EsTEU
         PJ4jYDMkjjBKLElbll2vKJ6OZmRr9CYLlyEkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=3cwgrUB0dz7AXWNUijAed7MIAnXRnB3DThIMp2oyBR8=;
        b=h0ihCLml8vI0j5EKrGq5WqIysw/b5DsU7wTywpSv/meb4VemNjE6dcS1AGB+C7m0h4
         hKj0tLzAoH+PFtvYjxq1AoI73vQOLK17Rfv7XnRh8BFjzhDN1ksJBxhGQuBXCGwWh90l
         Ult/McZGxBvB/av0kHshjTzCdCSHJ0k2647/GjwWTavsCSFHeisReo9fCMjehNsw5r+1
         FjOmUDq7MtP/FzsJe6po2jjvTxNxemR0H4BMyDYuBAkAdlji168YPsnJ87YTidAbSaum
         wF/b3o70009/du14InZbft59iW2x1NkH178C0R0ZfWnNHetqC2Z8YU/9rSSHLX7dvJh0
         zPsw==
X-Gm-Message-State: AJIora/qP/iajqQ2LsFj5pX5Ks9KjrDFjXrvQxe7aQdkhJ+qdTkdQ+1Y
	yNDIwu4Dg7XgJvDTHf8VFGddVw==
X-Google-Smtp-Source: 
 AGRyM1vOzTtSZoSnvxSyW04eFAyZW7nEUkX4E/VMx0Wfx0jgrVsQAg659ltjSC1ph+wCkJtQV73j3Q==
X-Received: by 2002:a05:600c:354e:b0:3a1:9ddf:468d with SMTP id
 i14-20020a05600c354e00b003a19ddf468dmr14031311wmq.145.1657791612611;
        Thu, 14 Jul 2022 02:40:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64?
 ([2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64])
        by smtp.gmail.com with ESMTPSA id
 i16-20020a5d5230000000b0021d9d13bf6csm974630wra.97.2022.07.14.02.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 02:40:12 -0700 (PDT)
Message-ID: 
 <9af42266ee228614914afa3f1cf7ac1f43b550be.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 01/27] ruby: add PACKAGECONFIG for capstone
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2022 10:40:11 +0100
In-Reply-To: 
 <CAOSpxdad4+XpE-kWSbuWYu8YptOx-nDFthiuEPUcyBrx+dMpkw@mail.gmail.com>
References: <cover.1657772638.git.steve@sakoman.com>
	 <17019818268B4DB5.31059@lists.openembedded.org>
	 <CAOSpxdad4+XpE-kWSbuWYu8YptOx-nDFthiuEPUcyBrx+dMpkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 09:40:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168029

On Wed, 2022-07-13 at 18:42 -1000, Steve Sakoman wrote:
> At this point I've only seen this on kirkstone, but I suspect it is
> only a matter of time before we see it on master too. So we should
> probably consider this for master too.

No probably about it, I've queued for testing!

Cheers,

Richard

