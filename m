Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC409CF9C64
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 13:03:15 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.14550.1727010192383719132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 06:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c/xoMrAb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374bd059b12so2024374f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727010191; x=1727614991; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYLQ8QfpNUhqLieqFI5b4pnIALgZxqEHC5NDV2+tMIM=;
        b=c/xoMrAbqd5qhv3oRzTqRZMCADkNDGjKmBis3UvW3E1oIZsdeEA25kXWc7JMtoSN3L
         BhPaM6R9atxDOyy5NkT3mWFFQm+pA+khFangJ5CzzyLivIR9szjXHCV4z26EcXLbXd1I
         R3NpNeMaWIGo14KfgKXpTFlkNp4BZLsTe1oU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727010191; x=1727614991;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QYLQ8QfpNUhqLieqFI5b4pnIALgZxqEHC5NDV2+tMIM=;
        b=Y1d9tzgAcoJH7MUhsb3YHKjcUafJ1xZRTuSsgIuOdzF1JYgNpoKdtqYgd+Ge6ypJ54
         jq7x/ID9nGofzVZY5qwjqBi7otbG/NyR2hnJqeQbFvGMutJlycvDG8qb7U1deX3akv8C
         Q++dDgdplt86WjcwhiNuzaBurIz6FT7/4lg+bXLgrf0FxzsC0aHZcVYorNGydmE9qrFt
         0AKuRZ2ontsVx/1uPQ9rePcAhS3szxrOzoPCNIy+z/FTmo8TFgPqMiNh9boiBn9FzBeO
         5ubQXCt6idPW+vbQ13ZW1O/c5zIAxFCS2IVjetPqPlqinDd84KDsbBOLOcxfFc7jngo7
         r3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXArDGeMQ6RJorOb8PSLA2TGFFldeSvTCBJd50qn3CltyawJ7AAHDOiEq0D6K2ErxLxXiTZlM0fjG1hz61uWuGBrA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzzI3bMUPXHvN0AJT12X2isrPBNFFy+2aRqFLle3C40hYILnIGi
	fJe1QFJ9GgioGaiU0mPLzGZ/EbxNXni+aMlOgYLB32yt3a4tS4q9oIWGVkPRDNk=
X-Google-Smtp-Source: AGHT+IHFllA65zRcnscbxKTzdIttqmVhEympLkWYHyNfoC042jykqW7Lxt5s2Ie6bMGo8xaO970Emg==
X-Received: by 2002:adf:e805:0:b0:378:81aa:2662 with SMTP id ffacd0b85a97d-37a4223e13fmr3930152f8f.7.1727010189829;
        Sun, 22 Sep 2024 06:03:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7ffc:6209:f6b5:78bc? ([2001:8b0:aba:5f3c:7ffc:6209:f6b5:78bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e8388sm22056511f8f.32.2024.09.22.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 06:03:08 -0700 (PDT)
Message-ID: <208e43278d2a6fa31444180a29073baa7c3d1108.camel@linuxfoundation.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 22 Sep 2024
 01:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 22 Sep 2024 14:03:07 +0100
In-Reply-To: <20240922111819.B5EB01003AA@builder.sakoman.com>
References: <20240922111819.B5EB01003AA@builder.sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 13:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204787

On Sun, 2024-09-22 at 01:18 -1000, Steve Sakoman via lists.openembedded.org=
 wrote:
> Branch: master
>=20
> New this week: 0 CVEs
>=20
> Removed this week: 0 CVEs
>=20
> Full list:=C2=A0 Found 0 unpatched CVEs
>=20
> Summary of CVE counts by recipe:
>=20
> For further information see: https://autobuilder.yocto.io/pub/non-release=
/patchmetrics/

According to https://autobuilder.yocto.io/pub/non-release/patchmetrics/
this should read 43 CVEs. Any idea why it shows 0?

Cheers,

Richard

