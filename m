Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D16C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:43:44 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.66789.1680518622463054126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BxWhymoP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id p34so16811653wms.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 03:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680518621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqiIi3rBdLK0g94X0efy/JZLWl7Fo4V0+kZEtnwA13Q=;
        b=BxWhymoP7YkJ82TQ6LpeCG+bZxDoKfv4xKVO+d/GpCFW0x1cvS5aQGkAv2Rk9PQb+t
         K7sdozLbP8GiTPOpdj0+fnmT7psaZsgLMhP0evcelGKjYB9WbYPwqntx3PupcX3RUif4
         zLxTroL9TSBCaWVcaP1Dg9NQAVU7+arwRR1Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680518621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqiIi3rBdLK0g94X0efy/JZLWl7Fo4V0+kZEtnwA13Q=;
        b=dkREFMJpW4dpqhooKS0l+ZZNUnp7Jq75JazDIBC1FlvkL7oVQHWuAfbGf2ZiLFODmZ
         koIQ4vlDl6+5NW1KJve2NgtVz2QquSz37iS2V7mY25n0/I0yg3UVCfwy5+v/diF2tT91
         NBrHM0qyfinTfKzW/H39ngKVDyQE1JSB58/SbqeOEIpRFv8MMHFHmCaExZCS2lQrRnnQ
         HcHldDnG3Bz6ZCAZ7ntVtdOr17zvs/R9IzHpOpkUG8CaLG3L5041hXuArj+4o0ZwLMoL
         2jPECl9Sv0yXAnMVDc1UDDemUD5fvgshA1GMQlOhgSOvhaIb6baj9Q6T13TaqFkPxEt1
         /FtA==
X-Gm-Message-State: AO0yUKXr5ifZE1co9xGUopjn0udJ1WQ/yFDB0k1tjvKAXTf/Him6sCvt
	BBNdjIqHqQMlJ9N//cxnaGJDMA==
X-Google-Smtp-Source: AK7set9JP2DR5+hFPzvDcTYaMpWho9tjcZuBcvZ3U7wRdc1AsZhy1Z1siA9iSL1cl2x2y2tqS5OiAA==
X-Received: by 2002:a05:600c:280e:b0:3ee:672d:caa8 with SMTP id m14-20020a05600c280e00b003ee672dcaa8mr25411781wmb.1.1680518620930;
        Mon, 03 Apr 2023 03:43:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8? ([2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003ee1e07a14asm19067037wmq.45.2023.04.03.03.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 03:43:40 -0700 (PDT)
Message-ID: <0e3a9766a809aa9b5c933932e28124c9fd7dcc47.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 06/10] webkitgtk: add missing dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr =?UTF-8?Q?Kubiz=C5=88=C3=A1k?= - 2N <Kubiznak@2n.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 03 Apr 2023 11:43:40 +0100
In-Reply-To: <DB4PR02MB100301B77BF93E3A3CC6708A5E2929@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
	 <20230331114634.3578244-6-kubiznak@2n.com>
	 <e1408db180e41666a38260a9f45f6edf7f725192.camel@linuxfoundation.org>
	 <DB4PR02MB100301B77BF93E3A3CC6708A5E2929@DB4PR02MB10030.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179610

On Mon, 2023-04-03 at 10:31 +0000, Petr Kubiz=C5=88=C3=A1k - 2N wrote:
> Hi Richard,
>=20
> Yes, that is sufficient. I've prepared an updated patch. In the
> meantime, I've noticed some of the patches from the series had been
> merged into master-next, but not to the master yet. Should I now
> resend the whole series, or filter out these patches, i.e. rebase to
> master or master-next?

Normally I'd suggest rebasing on master unless there is another series
this series depends upon. The ones in master-next were the ones I
thought were simpler/ready and had been through testing in that branch.

I've just gone ahead and merged them so you should find they drop out
naturally now.

I sometimes do this just to reduce the need to resend patches, for me
to re-read/re-test them and make it clearer where the review is still
needed.

Cheers,

Richard

