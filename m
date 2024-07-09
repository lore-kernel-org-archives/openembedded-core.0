Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F03C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 10:38:49 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.10006.1720521519620287815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 03:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R95wy5r6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so33067441fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720521518; x=1721126318; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv2vptF1HIi+jObkAsnvryP8IVGeoVuF3hoSRlVwrOc=;
        b=R95wy5r61Y/XZ2N+BHeXbvGJQIKGNLH6mYgMdY5YPH2BerKqqAUDBZ1ayEYwJIKLbQ
         j84XdShOkEE6Rf8axGIFk+la9fmmutHZPcVIdvy8FR+IG13Lm5+SF2i7bDh30ORcdS+t
         OrXdtMsYuWm2xneN7KNZHhm/fK24PNWjpaRhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720521518; x=1721126318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tv2vptF1HIi+jObkAsnvryP8IVGeoVuF3hoSRlVwrOc=;
        b=Md+nrj09XTlGNmGaSgPsMZ4Gf/YJXg++yk25aOvI6vMgKVz8DQD/NGJB5Jge5XJjfY
         6r44P0CZx8bamRmCU9pGoKNxA5AK30gzLZIT/ZYuow1uoSy7fHDg5UPrT0ATcb9vAFrA
         7zHSiPHXrcqH6y9HEIy4YNxLwCqbc0I6N6I1+L2edtHPTC9yhGfU/U9Kc1HUGxPNjYMh
         /V3WxypL7Usl12j2hu574c2mCOKZ3ZmsFNwNryBKn2auxzJgqaMUM3PYHWaFkeJhguGC
         KBfu6qWSbc5lDe+03bOJQIrGOZFEfS89aBDE0T5nqgrQ8U/8KsQtWuc3diafs6gcNvlR
         6t7A==
X-Forwarded-Encrypted: i=1; AJvYcCU9LEZsiaWTtIGEAIHOYQZSYu7DnTPPvDf/qGSzo3AbI7JOmsB3/1iWCq4XXYUHPayyuTNP+W7gAO8eTTJai1EBK12IQzQZUkkbEGiWkyJ7YWyyjU7YwgVv
X-Gm-Message-State: AOJu0Yw4zjY/Qso4m432sPuvmOwReqU+XDM9JBwECeHCT4ZIAECeSyu1
	8VxMnjaIRGSHCzjUq0oEZ8H2HnYQsGK23O0p13vf3M9+2yC9SnqfyQFUtDSuM12EwM0aWI3XOW4
	s
X-Google-Smtp-Source: AGHT+IHvN/dVKtzpP0T2x6JbbHhBcvczuhdDffsnmnRQ2BYMLn0tOyxju578uJ5iCty/yVGETzTeDg==
X-Received: by 2002:a2e:b0d8:0:b0:2ee:8c8e:b6e7 with SMTP id 38308e7fff4ca-2eeb30babd4mr17934591fa.2.1720521517907;
        Tue, 09 Jul 2024 03:38:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb12:75be:8387:683a? ([2001:8b0:aba:5f3c:eb12:75be:8387:683a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891d9sm2186179f8f.65.2024.07.09.03.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 03:38:37 -0700 (PDT)
Message-ID: <62a1cde2e5bc518deb64fcb89ee8d64e3ea96bde.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.72 -> 5.76
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 09 Jul 2024 11:38:36 +0100
In-Reply-To: <13915.1720479388530140543@lists.openembedded.org>
References: <21762.1720472567196386859@lists.openembedded.org>
	 <13915.1720479388530140543@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 10:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201654

On Mon, 2024-07-08 at 15:56 -0700, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org wrote:
> Looks like BlueZ 5.77 is in the process of being released
> (https://github.com/bluez/bluez/commit/68864d1aa818aca00d67f7a4d60783
> 44483e9509). =F0=9F=91=80
>=20
> I can look into upgrading to 5.77 instead of 5.76. It would be nice
> to skip creating two new patch files. :)

I'm happy to upgrade to 5.77!

Cheers,

Richard

