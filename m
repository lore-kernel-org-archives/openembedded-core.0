Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56229D63926
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 10:50:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.10614.1732099811796174922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 02:50:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CgPjnhaW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so55288335e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 02:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732099810; x=1732704610; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UkI2BYJ2sxKsdw9S0NRVpQg4ZDCXwKHHKjgyiZEY7s=;
        b=CgPjnhaWJNhAmDHK5WUQrK+c3uINEd/ERnNGkPD7c13VIzgBXNBQVlKcvt5rC2wrsB
         7sbfiDEEHrZpr9o5PclnwHWnND3tfXY/QX5cnPWQ1hexlq3jqZxWZJvolEoiU8a+Ulcp
         cZbJpwjQBYiiQwSLN5UonPBIEo/Ws2mh54qxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099810; x=1732704610;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UkI2BYJ2sxKsdw9S0NRVpQg4ZDCXwKHHKjgyiZEY7s=;
        b=figdqZZzJ4GPkdbfcI93fBpbctdsLUoaMhDgr/C6KfGJp4jeVw+0Aa58sAaTP+Coph
         Tf/kSKmfXBogvvq78RYZSwsB3scX6w8OlTpcTc090GrHnlhoiPmbQzx0TY4elUxu3bya
         IupAhcqN6SwLbcRCIsfBquAlhgFaApVXTLcG9MQ32ztXFpoLdu1o/StUOgul8edVtGuz
         1BeN5daD3h/apjW61mvRUQjptxFE/CwldnyUZJrtrwHoZK6ioKrBefJWIkWNcBttvw2b
         JJUbOiNHdlIF/0eoGha1IJqbUWeMiL8zg+NRhCPitQE0DH4rvfprxkQHGAao+TnR9xoe
         WDdg==
X-Forwarded-Encrypted: i=1; AJvYcCVS80ZwOKjlVCas2QFHVh4wuO1SSyync4URcdyP0xk3KIEpl+GX5NDeXBfX/WhE7g64ZlHdgWSXAXhvB98PzWMuuQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwETMncOVYHqxIc83kOoQ3aOPju344TVn/EOVVEH0ocmYK9To21
	IOoVdfsjYkzatUQ1tW8m06PieD8H/9AXHNrkGxTcrHj9317Ejjyy/Fuagc5eiEtdzzlQ8DqwdL2
	X4/o=
X-Google-Smtp-Source: AGHT+IH08wEaNjMjrkE121xAWm+SyRPL9eIbDEEY1El1yjg/7cd346VQ6xEQuSnD25obEk75NbUzaQ==
X-Received: by 2002:a05:6000:2105:b0:381:f08b:71a4 with SMTP id ffacd0b85a97d-38254b162f8mr1276578f8f.45.1732099810204;
        Wed, 20 Nov 2024 02:50:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe0:5119:2eb:57b2? ([2001:8b0:aba:5f3c:6fe0:5119:2eb:57b2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254905294sm1720864f8f.11.2024.11.20.02.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 02:50:09 -0800 (PST)
Message-ID: <e3645da1364c32fcfce0ccc198f470cf1a61e4c7.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] icu: upgrade 75-1 -> 76-1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: schonm@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2024 10:50:09 +0000
In-Reply-To: <20241119184411.76770-1-schonm@gmail.com>
References: <20241119184411.76770-1-schonm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 10:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207421

On Tue, 2024-11-19 at 13:44 -0500, J. S. via lists.openembedded.org
wrote:
> License-Update: add JSON parsing library under MIT license.
>=20
> Drop backported patches which have been merged into the new version.
> =C2=A0 ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch -
> https://github.com/unicode-org/icu/pull/3058/commits/db70adaddcfa8050db6a=
69cdfef080a7f1423ad7
> =C2=A0 fix-install-manx.patch

This seems to break webkitgtk:

https://valkyrie.yoctoproject.org/#/builders/59/builds/467/steps/11/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/6/builds/474
https://valkyrie.yoctoproject.org/#/builders/3/builds/480
https://valkyrie.yoctoproject.org/#/builders/17/builds/410

Cheers,

Richard

