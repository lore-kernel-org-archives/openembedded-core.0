Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4719BC433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 17:53:47 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.779.1652810017802581868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 10:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S9LGfHkb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id w4so25731103wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 10:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=WRwMw81kYhyNHIwADgXlG5TbmxXXdVfEls+nyEVESow=;
        b=S9LGfHkbLIvpava1HSzq6S1Oqssl12ZWyitWZdwD8bK5VOG92EGaMVXUsSb/A3xN/b
         7plYM1lZskMdkxTWchPf164O+xpR1QRsyzsZNuXMxF9K3pkG7hlOi095FRMMyIh0E7iI
         DMOG24XgzMQ/EgySqEX8vGC3zrXzOnCG320+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=WRwMw81kYhyNHIwADgXlG5TbmxXXdVfEls+nyEVESow=;
        b=ZdYFxKvS8ISSJlixBU5BrUkF8dcqfezYu8vXf5Osjz/8EWuQQV5tewQqnQTLgKYr+H
         yriLf9fnLR2g75pgTtY1coNu53+63+LLg/tEHVfEUDu2xQRbuKIQLsoLEssHI6tE+NFn
         kbtwTFOB0/QCQa3MNmdH0bX7ax7VsggtLj/dscTOpPguV0cvSba6Wzh4byWhmqd4W7tN
         lR2AcIbj6CYuBCVOPAFmq2AqjqY2fjdyImmPfHLN9kChDWHdb//kcFOgyYrB50zkZo6F
         ZdsZp7dk2CDUB4n1qYWlZRLOY6kCTT/aF9EhZ9laknEJoo8FVB6slKhSpR81SelC0F2c
         J24Q==
X-Gm-Message-State: AOAM532gJs7QjZKZbm5Y1MEqDrDLWJyywQ0tvvNJqNh8s12ywubuqEpY
	5R7Z1CV14Igo+tIk9s4raGZtAg==
X-Google-Smtp-Source: 
 ABdhPJwpNjYJwwGOl0/zkfDZ8Xojieu1Toy7OIXlokAvfovFY6QRahKza0V+IFY5xMSiE3j34sK3VQ==
X-Received: by 2002:a5d:52ce:0:b0:20c:e030:b05a with SMTP id
 r14-20020a5d52ce000000b0020ce030b05amr19051946wrv.174.1652810016223;
        Tue, 17 May 2022 10:53:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f9c5:af58:f70a:331b?
 ([2001:8b0:aba:5f3c:f9c5:af58:f70a:331b])
        by smtp.gmail.com with ESMTPSA id
 c13-20020adfa70d000000b0020c5253d8f7sm13086467wrd.67.2022.05.17.10.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 10:53:35 -0700 (PDT)
Message-ID: 
 <6b2639bff5af2a04e2c0a0c4da8567000c63d2db.camel@linuxfoundation.org>
Subject: Re: [OE-core] convert-overrides.py
From: richard.purdie@linuxfoundation.org
To: oobitots@cisco.com, Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2022 18:53:35 +0100
In-Reply-To: 
 <PH0PR11MB4902975CA8B2354DCB0E837ED7CE9@PH0PR11MB4902.namprd11.prod.outlook.com>
References: 
	<PH0PR11MB4902975CA8B2354DCB0E837ED7CE9@PH0PR11MB4902.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 17:53:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165742

On Tue, 2022-05-17 at 17:17 +0000, Oleksiy Obitotskyy via
lists.openembedded.org wrote:
> openembedded-core/scripts/contrib/convert-overrides.py missing conversion=
s for architectures like i386, i586 and so on.
> It leaves untouched something like: foo_i586 =3D "bar"
> I'm not sure if it should be fixed for all existing iX86 sequence.

The script wasn't perfect, it was trying to do a best effort. I think
that there were a lot of i*86 entries that shouldn't be converted and
so it was easier to handle those manually.

Patches are welcome to improve it but we need to be careful it doesn't
convert things it shouldn't.

Cheers,

Richard




