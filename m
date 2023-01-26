Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F59AC54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 13:01:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.72966.1674738112362314279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 05:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B6Wht+iZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id h12so1677920wrv.10
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 05:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7pB9lo2S5Z0ar7ylPkyVtJRR5BTQfIqWQIr0c1P46Ec=;
        b=B6Wht+iZm8qcwljZlOG8BMKUI0WYuvR3qbqvbSUZvEfZeudyZ5XVRlUSbE22SkeWPS
         brO0rM4Tg2gKhoFlsBcyk9svXckudo/3cYp62kxX0JVSPe72zBpM0ji+ak7aLHNkEkdO
         cH9Iw8M3CaM+yfQ6U6qeLVlJQ9GTqv1AeREkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pB9lo2S5Z0ar7ylPkyVtJRR5BTQfIqWQIr0c1P46Ec=;
        b=LurT5KIPUPxvXKhWfsqHk9TePRMFSfMDWa+hoA/E88EIT0Qyq93QNrjh5Yoi5klLlr
         xRTtXUIKDiBd6+/85POIJViGVNl9Us/rqEXWVLHkrB8AJLa/Rf7f1LxTqI4TCMtVool7
         Jw0DWBK9beEMJy7c0TsccMgjMBzdAme7h2sI0ax1Bnux0o/WSxXBhTwX9ZngCVo5B2X5
         xzYd4JjditlLiIgB27A2afKrnnelZUEUh5IluUOwvVPaNxxEwo6XlnYRIzzhBtMbaboY
         kHJRYLGfWrE2CaSxjHm8apu2ER3dgX+ZaxBU9RgwJzN3lmBp3/nmHr6vkZyA3RNvb8ih
         dvuA==
X-Gm-Message-State: AFqh2kqURMH665wHiGeWokOFLzvzKArlGPXRlOw1Wi5WKZ0QvK+Isd4a
	yje/NAiv4VKfIowD3Pv/MLIW/Q==
X-Google-Smtp-Source: AMrXdXsAITGOAxTln72Po6xb5gSDIYcKenSyZDO1mAmvdr/sdp6KYID2KNBtAzrApYC2otC171GDqw==
X-Received: by 2002:adf:f90e:0:b0:2bd:9b1e:165a with SMTP id b14-20020adff90e000000b002bd9b1e165amr31053442wrr.6.1674738109726;
        Thu, 26 Jan 2023 05:01:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2d7:e330:f537:35d8? ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c1d0400b003db2e3f2c7csm11760481wms.0.2023.01.26.05.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:01:49 -0800 (PST)
Message-ID: <0bbeba753327c9348177349032e03f366c38d5dd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] gdk-pixbuf: remove ptest support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 26 Jan 2023 13:01:48 +0000
In-Reply-To: <CANNYZj-cnpyE7cbGuX+Ou465BikgwNinjAgHtOzqy-854kZ5kA@mail.gmail.com>
References: <20230126083752.151940-1-alex@linutronix.de>
	 <2986f2e9ac85049402a858526b6989028e451a8c.camel@linuxfoundation.org>
	 <CANNYZj-cnpyE7cbGuX+Ou465BikgwNinjAgHtOzqy-854kZ5kA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 13:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176396

On Thu, 2023-01-26 at 13:58 +0100, Alexander Kanavin wrote:
> On Thu, 26 Jan 2023 at 13:52, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I don't quite understand this. Does does mean the ptest was working on
> > x86 but not on arm and was silently failing?
>=20
> Generating data files needed for ptest was working as long as build
> host could execute target binaries (build host executable from
> gdk-pixbuf-native was run with target .so plugins from gdk-pixbuf to
> do that) and was silently failing when that was not the case (each of
> the plugins caused a load error due to architecture mismatch -> empty
> output file). Since we run x86 ptest on x86 host and arm ptest on arm
> host, it produced the needed file in both cases, but only by
> coincidence.

Ok, that helps explain it, thanks. Could generate these files using
gdk-pixbuf-native?

Cheers,

Richard

