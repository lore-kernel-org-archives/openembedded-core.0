Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73DBC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 11:21:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.6050.1635938477287377600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 04:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rq/c+WzS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso4313977wmc.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 04:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=43r9t36iSUEWjc6gQOXYwexCgqjXNzEX2t7X2YMHmBw=;
        b=Rq/c+WzS5VOyzCjC+FMNLOK9hiIPQhPIARFHGVyhonbAh7sxzo/ZIQnB70Wl50f56S
         mf14Rr7AFdpitfsiJVqzBOK9CojswtJ7Y9n103cgxpv5BUVnt2doYJ4HIYg3L7yYHF4k
         sDv/nfVJ0/Jr69fw6WuHFgR0SCna4Ryk5fAIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=43r9t36iSUEWjc6gQOXYwexCgqjXNzEX2t7X2YMHmBw=;
        b=XOvHLNhJm9oEDq9+Q+Sz8Ro0GKxygyOKiSYO1kZrulFIHsSSrJ9Jv4S0wmtfg5aRcH
         dNzrIdH7JhFqKFpmn9hgjNltG58BFzuzC+zZvvfo62Bd3IcpvQbTXbM3rdDIMSHGnPnt
         cmrWJb6uLWcc3TZ8oq1O5apl43zlblulavovIPn+gK0UGHigNh4GAve2tOouaB0eHmPq
         TR+q6Txo/S1m8rMMiDh5rZ3eRxCrBpYQ02xDlIXUVhpXymQ2EG0krbLbVgxD9JnP8mNj
         uaqkQsN6gPowTM8NhWH5f+Wf2RsFXmwQUZNdpt1/lIRUJjkAJ91vHfySe10nZg20A401
         2AEw==
X-Gm-Message-State: AOAM5328anG3CUm6TFacG2zq5pqlgEsUsxDlMYsGyJKJnW1rebeD1Pye
	eTHuuKzUr8YD+Ca69GmBl7MaCA==
X-Google-Smtp-Source: 
 ABdhPJwWvuFrU1X5SVS4girIAV1VbEsE9fd3JFK6eIS+5nEDWGo+GdgJAdC4ihQcQDW2S+tM5cO5yw==
X-Received: by 2002:a1c:8093:: with SMTP id
 b141mr14598284wmd.129.1635938475526;
        Wed, 03 Nov 2021 04:21:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:52dc:b819:4029:149f?
 ([2001:8b0:aba:5f3c:52dc:b819:4029:149f])
        by smtp.gmail.com with ESMTPSA id
 o3sm1881296wms.10.2021.11.03.04.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 04:21:14 -0700 (PDT)
Message-ID: 
 <2078f5ba21c984af336d79feaa7b1833a7391e6a.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/29] Pull request (cover letter only)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Nov 2021 11:21:12 +0000
In-Reply-To: <cover.1635898227.git.steve@sakoman.com>
References: <cover.1635898227.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 11:21:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157827

On Tue, 2021-11-02 at 14:11 -1000, Steve Sakoman wrote:
> The following changes since commit a7520c47573cd166d441e504737492b86f5aa42e:
> 
>   selftest/reproducible: adjust exclusion list for dunfell (2021-10-25 13:28:19 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> 
> Alexander Kanavin (7):
>   linux-firmware: upgrade 20210511 -> 20210818
>   linux-firmware: upgrade 20210818 -> 20210919
>   wireless-regdb: upgrade 2021.04.21 -> 2021.07.14
>   wireless-regdb: upgrade 2021.07.14 -> 2021.08.28
>   ca-certificates: update 20210119 -> 20211016
>   tzdata: upgrade 2021a -> 2021d
>   tzdata: update 2021d -> 2021e
> 
> Daniel McGregor (1):
>   bitbake.conf: Add gpg-agent as a host tool
> 
> Jose Quaresma (1):
>   sstate: fix touching files inside pseudo
> 
> Minjae Kim (1):
>   vim: fix 2021-3796
> 
> Oleksandr Kravchuk (1):
>   mirrors.bbclass: remove dead infozip mirrors
> 
> Ranjitsinh Rathod (1):
>   curl: Whitelist CVE-2021-22897
> 
> Richard Purdie (5):
>   base: Clean up unneeded len() calls
>   base: Use repr() for printing exceptions
>   reproducible_build: Drop obsolete sstate workaround
>   patch: Use repr() with exceptions instead of str()

The above patch did have at least one fix and further discussion and proposed
patches so I'm not sure about that one. I didn't take it now as it at least
needs my followup fix too.

Cheers,

Richard


