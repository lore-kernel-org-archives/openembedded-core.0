Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ED3C00528
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 13:40:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.34645.1691415599672884142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 06:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZJ9nXbXD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso38092815e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691415598; x=1692020398;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bwgiua6Y4Vu6j8XIW12e38s0Ieezfo+4OXdHUifn7qk=;
        b=ZJ9nXbXDY0cPvKcVWWdgUCuzAPqPLCH5HY5l3q1CZdxBAaJNW+9h5R2ZK2gj2se5IK
         eC/6P0QjCsFLhVV3qXr/2rZ27E1WBOLp0gaoEzMx7w6A/cifCOyO+yiE+SjiyNmubUyo
         iKNH5aAILENofCMdncE2T8yNKcJdz2fxBt/gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691415598; x=1692020398;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bwgiua6Y4Vu6j8XIW12e38s0Ieezfo+4OXdHUifn7qk=;
        b=EHGimJJsK6ACtnAqu+PagpCN7M7yd6iL9YH7HkBNwnJyOi8ze7NI+ARGB85TBLb7ug
         3/Cq8doRbTlZtFM7/g+mdfKc4iFKwBDiIWmioq8nw9eQm/yzqe0KIqt9ojh0b9KOSa8m
         ST6Kowxzgbhhltsk8BFMMvVqd9OkmZdbKn85tTH7TU7w8MLZp48CmbXZBum5DQF9CqI+
         yUq+Ft+Q1eCzOUB/bY6S3BJV5FXPcQQSkFjWtERg3HX15lBZXBkOIDyGimu67fYC7++r
         Y6AmsYXzRzMw2ugA2lV/o4focJDEDi3k9tpWyHsRBZLyeTgjCGQRvWe2PIGUHYNuONTu
         hs5w==
X-Gm-Message-State: AOJu0Yzu9sgb2blmR241nLFREAGPzz5vLZri2Dod3axpra7J71j6taLf
	dvRC0Em15iMk1hJzFDg/kWQXHGqScAfxjolzR8E=
X-Google-Smtp-Source: AGHT+IH6kG7ejRR9ZMtdFY0cQn6wObllr7JMcXqGaSh3y5iS50/fIe7skf8NdHBYSaNH6EZmw29NCg==
X-Received: by 2002:a05:600c:364d:b0:3f9:9a93:217f with SMTP id y13-20020a05600c364d00b003f99a93217fmr6072628wmq.3.1691415598079;
        Mon, 07 Aug 2023 06:39:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5? ([2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bc5d6000000b003fe195cecb3sm15134084wmk.38.2023.08.07.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 06:39:57 -0700 (PDT)
Message-ID: <9a501820b6be02e45069bbcd0e804f1f63017116.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RESEND 1/1] libexif: add ptest support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Julien Stephan
	 <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 07 Aug 2023 14:39:57 +0100
In-Reply-To: <CANNYZj8=HDJrMyF21pGbNRD3L6G-_cVdMMQ=_CU0ev_GgAzjcA@mail.gmail.com>
References: <20230803132908.4134002-1-jstephan@baylibre.com>
	 <20230803132908.4134002-2-jstephan@baylibre.com>
	 <CANNYZj8=HDJrMyF21pGbNRD3L6G-_cVdMMQ=_CU0ev_GgAzjcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 13:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185599

On Thu, 2023-08-03 at 15:50 +0200, Alexander Kanavin wrote:
> What do the tests actually do? If they test libexif functionality in
> isolation, is there a need to run them, if upstream does this anyway?
> ptests are primarily meant for integration testing, e.g. exposing
> issues that arise in a complete customized system.

I've noticed a few replies about this and I do disagree slightly.

ptests are useful to ensure that the recipes in question actually work.
I'm sure most upstreams do test things but probably not on weirder
targets like mips/powerpc or with musl.

For something like libexif, if the ptests test the library functions
properly, returning the right test data for a sample for example, then
that is a useful for us.

Cheers,

Richard

