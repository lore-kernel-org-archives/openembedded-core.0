Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2F5ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 12:22:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.11192.1663676522125833009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 05:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BATfYo5n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so1546513wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=8TKkZBQWH2LqsPR8i9EcjhP9s5vl9CAgECHRx38CqJ4=;
        b=BATfYo5nXci+uJvmgxOeFnSRbbSpsXGIlWHYgZ6+Afn49OEh7SNIvB+nRyxcc0A1o/
         0YO+2S2u6OJQumWaZGbDt8xvnn5DItD/SAGVyIqPhU1bPajpcR2zi40sfmvGgSP1XG3B
         jhgbjn6F6OCZ0S05PmsmVTHp6SrI+kMkXA2QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=8TKkZBQWH2LqsPR8i9EcjhP9s5vl9CAgECHRx38CqJ4=;
        b=Q1sGeUJbpbOUSfC5wcB9dQAZQszNRAYKzO/c5T21k7o1ON65tjTjJABRxa6JsogYGg
         0DSqyt/FkLvMziFGGluz2//9ad0+YDEt7n3tIl/tSmds77+PCoayacd0N4MKuEO1xcZO
         qTXNrQzn3no5OqWjd7HUVIWMYipQD5kqUiFA8DWsOEr8eqdDiauceWipBCkMr9nX/fe3
         Sqt0nCeIQG3H93h4aPJSHIvaZmLZtCkpC+yb7eAotVKZRnCEiFjsXj0HgnGgaDA0zPTh
         5jhnUWj6yLpCqNE20h4KEdHBE4tD+fzszq9SjUZc3hfrkpSsck++56I7M+d9at6lqreC
         7kRQ==
X-Gm-Message-State: ACrzQf0bpA8hp2SbxzlBOaLYE/WtBqZX4LClVfJ4Gh88+dILaX+ZPPRI
	bcfe2dGfKII3T9rReYaClIV+LQ==
X-Google-Smtp-Source: 
 AMsMyM4gUJcMIjwoHSuSmHAg8mhBkii2U4LdQm8X+IJc46H/Y6GnrE4WrEBQhbJdfJ7Dzhua6rwliA==
X-Received: by 2002:a05:600c:4fd1:b0:3b4:c00d:230a with SMTP id
 o17-20020a05600c4fd100b003b4c00d230amr2162837wmq.62.1663676520469;
        Tue, 20 Sep 2022 05:22:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d363:331f:b5a4:a50a?
 ([2001:8b0:aba:5f3c:d363:331f:b5a4:a50a])
        by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6acc000000b0022afcc11f65sm1729925wrw.47.2022.09.20.05.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 05:21:59 -0700 (PDT)
Message-ID: 
 <029dd3e7238551e5ff6c687a001988485c6a3687.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2022 13:21:59 +0100
In-Reply-To: <cover.1663597409.git.bruce.ashfield@gmail.com>
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 12:22:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170896

On Mon, 2022-09-19 at 10:28 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Richard,
>=20
> Here's the next set of -stable updates to the active reference kernels.
> I also have updates back to 5.4 that I'll send to the various stable
> branches shortly.
>=20
> I also have a couple of kern-tools fixes. One to solve a problem reported
> on the list about some directory structures (typically created from KAS)
> to break the meta-data phase of the kernel build. I've fixed that issue,
> then fixed the other regressions that fix caused, and have everything
> passing sanity. There shouldn't be any fallout, but I'll be keeping a
> close eye on things.
>=20
> I also have Khem's MDIO configuration change in the queue, along with
> a previously hidden kern-tools feature that allows it to not warn if
> something is 'enabled' (y or m).

I have a patch in master-next I'm testing for the perf issue. On
testing that, this set of config warnings became clear for poky-tiny:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157

Cheers,

Richard

