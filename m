Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81262CA5539
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 10:26:34 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.8479.1694600784654716257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 03:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K53zyME1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50098cc8967so10716884e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 03:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694600783; x=1695205583; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dysgI4yvV4NnHoAG5fuF1s9XHGEgyF9l2hL+kBltiQ=;
        b=K53zyME1BCR/izXScKFitp15QTbC7MfaFmbjgADAVAFIaDZuS0frQ9u1jrgjRjeVyi
         OsQhGJEEeXSf2R5IXdGryMOQJg3+lj0UPSSpLS4jhuat+Jhl57NK+3+GopSCbZzgamRb
         5Fu2D82nGNKmbet50Mit5xcB/TF2O/vk92gW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694600783; x=1695205583;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7dysgI4yvV4NnHoAG5fuF1s9XHGEgyF9l2hL+kBltiQ=;
        b=fYdZUshc8agABjoe6mkCS5snCr8XfgKrkQTuHxS+T0DhJx+Vw0eXKXWQb275fmyoZ4
         HAHvrzErd+k1DM7+SUgw7BgLQL0mPcM+bPqTJtiESQSD0S4/IwbZpEjgbh/V2ibIaCag
         fQxvDTc+lHXILnmNdLnawz0etk/ie+myJUXgXtQQfwrltsG7+viN36sU778CIQJCfmf0
         YBY52ahA3gyOKzrjgZ3J1J75LDv3NLpmE9eYv6dXLg6esajHL+H1Z8oGhqwR0tDkdZ3W
         c5lpwcHc2HfbGYRooKmc8ZUnCyvZ1oX7H0S0sQF5cs/dnku1r+ye7teJbwLcKRiOUQD4
         pdSg==
X-Gm-Message-State: AOJu0YxYu5NTfkzDo5EoCcpoh/3qZB6pt4xAyKUv5lKy0VDq63UEPQ4P
	GnIs6FyUTZtnd/jLb2Gn2B1cGw==
X-Google-Smtp-Source: AGHT+IH/Ewn6bI4/g9a9u5hBvJxjcA78tamQqHx/KmkRZrk/JWQB1iUwMtbbw9dd6g+JULZwZpFVbA==
X-Received: by 2002:a19:5f4f:0:b0:502:d302:e013 with SMTP id a15-20020a195f4f000000b00502d302e013mr1356921lfj.0.1694600782676;
        Wed, 13 Sep 2023 03:26:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a8:4888:9029:4207? ([2001:8b0:aba:5f3c:2a8:4888:9029:4207])
        by smtp.gmail.com with ESMTPSA id p6-20020a7bcc86000000b003fbdbd0a7desm1595044wma.27.2023.09.13.03.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 03:26:22 -0700 (PDT)
Message-ID: <0b4b6a18c6a9eb8af992da05201a8c601b02f21c.camel@linuxfoundation.org>
Subject: Re: [PATCH] [OE-core] [PATCH] font-util: upgrade 1.4.0 -> 1.4.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2023 11:26:21 +0100
In-Reply-To: <1694597797-21673-1-git-send-email-wangmy@fujitsu.com>
References: <1694597797-21673-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 10:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187582

On Wed, 2023-09-13 at 17:36 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> License-Update:
> - Replace unicode files with ones that provide better terms of use
>   Identical files but these have the unicode terms-of-use (SPDX:
>   Unicode-TOU) instead of some old license format.
>=20
>    https://www.unicode.org/Public/MAPPINGS/ISO8859/8859-1.TXT
>    https://www.unicode.org/Public/MAPPINGS/OBSOLETE/EASTASIA/JIS/JIS0201.=
TXT
>    https://www.unicode.org/Public/MAPPINGS/VENDORS/MISC/KOI8-R.TXT
>=20
> - Remove "All rights reserved" from Oracle copyright notices
>   Oracle no longer includes this term in our copyright & license notices.
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../xorg-font/{font-util_1.4.0.bb =3D> font-util_1.4.1.bb}   | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/xorg-font/{font-util_1.4.0.bb =3D> font-uti=
l_1.4.1.bb} (74%)
>=20

Does that mean that LICENSE should have Unicode-TOU in it?

Cheers,

Richard

