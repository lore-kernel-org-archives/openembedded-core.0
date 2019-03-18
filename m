Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6E371AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 23:27:09 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k11so14527135oic.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=JClnpn9HEVk5KCFxgE1btZ2U71Qdw3mR4cCD4IofULE=;
	b=ZoES0r3dK+7Z5I6txNsPRnH3FZkuz0QFc+7d5PYgDa85i4inGi5pBUYZtRCjg3s8CU
	sXN0fSoGsTJ2YIAmcJ2V6C6LpAU9T3MlvghTFfyrgltU0Lc2W774FH4tYlvOM/zkD7rQ
	WprsEOE6EYyFo1s3J685vet5zkXrCBe8S4gG5qTe5TQkgZRRdee6rDRIn+QuvZJiiFPx
	bPd53Y46gei8bGQ9M9ll7W4lPQSVG9+alRtYPyGpNLYRVgB5cZTYRAhNOQ6mOH/vBpJc
	OuuYQhHkDJVxifWJz034FxUaasf9Tnb4+RsMyMW/AfECiv4x7RqJZGk/chSvC6w7z/9z
	a1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=JClnpn9HEVk5KCFxgE1btZ2U71Qdw3mR4cCD4IofULE=;
	b=sgXS4hPRwWE3m/tbUmyAMAU4zBGWWxq5ew0UVLal4vXm/Pti8SiIFDs4vlfs15lLFo
	/IdyhDsyDea3XBA7DvsyNT9Qd8SB/2/8iQTeZ7zFqSV2tLkYI4iU95TjtwNzug+MdLgD
	8BXVkRngMMh5AXBGoGqzMo/yKJ2hG7pjZ5+MoNMbx4mnVDu8CHPs6ZTv48ioSroBfM4m
	lD06hgId9JJPURZyjkoiPHDjzBRWQvEgHmTUz60f2bQ8mAPP4pF4GGYRjfDZT8hBbA4p
	R8znA43pnjJIM/M4Y5IsPbdv5hMhzjifqQE75n69mRbNAqZImSR/9g8WpwnozwtLEiiM
	FdBA==
X-Gm-Message-State: APjAAAV1PnEHvJ5o36mrBEp1OnSNKq6BtiKEsLjJbTQFdrBoRRQH406z
	UFqb8D47ZtpdsXV6mI6gBAFznIm36AMu3w==
X-Google-Smtp-Source: APXvYqzH/baVb9DEhVBTDbGwYMEhkg8cV4yHyv7WqhpXUVOj0/6VpFlK66FWaMLGzaDRpovKwNYhRQ==
X-Received: by 2002:aca:b341:: with SMTP id c62mr65801oif.112.1552951630106;
	Mon, 18 Mar 2019 16:27:10 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
	[209.85.210.41]) by smtp.gmail.com with ESMTPSA id
	q18sm4367760otl.51.2019.03.18.16.27.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 16:27:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f41.google.com with SMTP id f10so8609608otb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:27:09 -0700 (PDT)
X-Received: by 2002:a9d:644d:: with SMTP id m13mr11960488otl.22.1552951628601; 
	Mon, 18 Mar 2019 16:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190318133618.4022-1-otavio@ossystems.com.br>
	<166926B2-31F9-4290-A4B8-1EC6486C7357@gmail.com>
	<CAP9ODKq_bxdcX8DijCz0WFXBKMmAfxE8AhnPDhGk1t01axXnEg@mail.gmail.com>
	<81AEDE73-7DD8-4F69-BF8D-BC2BF92FFC06@gmail.com>
	<1fb71bec0195779b572ef9870d2efbb2bea40abd.camel@linuxfoundation.org>
In-Reply-To: <1fb71bec0195779b572ef9870d2efbb2bea40abd.camel@linuxfoundation.org>
Date: Mon, 18 Mar 2019 20:26:54 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpqWzgmTzeeBSpfOrHJVKW=WUus2Gsy8oSu4yj5epOu7A@mail.gmail.com>
Message-ID: <CAP9ODKpqWzgmTzeeBSpfOrHJVKW=WUus2Gsy8oSu4yj5epOu7A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2019 23:27:09 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

On Mon, Mar 18, 2019 at 8:18 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> I think the commit message could use some work but IMO this patch
> probably is worth it for OE.

What do you think I could improve on it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

