Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B96C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 13:55:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.10997.1645192542412986841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 05:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hSvfI0X4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id k1so14736181wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 05:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7H2LgiGhpV65T0AjMIraPwzbpP1a8jirFzZ8MV9wATc=;
        b=hSvfI0X4tAkfK5hpS3ATvOGTIdQIx8ynnggHuZhNg/kFH+cjGpr/aNN4VerY9e+qLF
         RjEXya1vNbf+oR8ewj18sg7Y0spUTTRW4SucFyO00hV7i0gZYkVA/nMkoiyoOScuPooZ
         U55pfqZmJdq4UjAh+yAZwVpA6XqUWtrM63Vzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7H2LgiGhpV65T0AjMIraPwzbpP1a8jirFzZ8MV9wATc=;
        b=TdyjUiZaq5153muH87k3DmoFfShjMFbWjgUcAh2bQE4g+pUaqz+KKyWy6D7FewVjde
         exzi6dqTLogpkiSkAlg7oA7csRWjJRq5KTHjt+mc+aZ5N+BU3hZOlce4uuMiC0ObxGQY
         +ddEVpHIBEETrbApY3PInsB4DlXnqa2yLtRvVtgPIuca1xa29hhNldt8y6K/HIF0aovf
         xrYWewHlT+jnEWnfCpO8BbPyNYSvJ+2yiuzQh41S6pl15e1Vyo8hNLc33YKoX0G5ju0M
         lfUv9Lyzi22e3jThMCwZ20jl9Nd5N0KTp7ObJ9ahu+N7Z53o8oaYyZKycYfdHpiPqkZA
         UZpw==
X-Gm-Message-State: AOAM530puTZN3B1fdmoo+IGziJsJtSlc+p5oWmXPgXhTHjzy9UN4EbPQ
	GLDqnsu5r0LNetid83Ogv1F8+A==
X-Google-Smtp-Source: 
 ABdhPJz3Vt99/QGbz3JK5zefPXQ+UDGtBwHcUs5Bg4C4+aG2V5k30NkgdjJOP8iFe2gPE6w1XFeXpg==
X-Received: by 2002:a5d:53cd:0:b0:1e5:a670:9d0b with SMTP id
 a13-20020a5d53cd000000b001e5a6709d0bmr6172928wrw.170.1645192540514;
        Fri, 18 Feb 2022 05:55:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bc9:59b:7021:269f?
 ([2001:8b0:aba:5f3c:7bc9:59b:7021:269f])
        by smtp.gmail.com with ESMTPSA id
 s6sm4591036wmr.43.2022.02.18.05.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 05:55:40 -0800 (PST)
Message-ID: 
 <caf357e342ad33e0117af76244ba13fcd804f4fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] convert-variables: Script for Inclusive
 Language variable renames
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: enrico.scholz@sigma-chemnitz.de, Saul Wold <Saul.Wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 18 Feb 2022 13:55:37 +0000
In-Reply-To: <ly35kg9tsz.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <20220217003248.581903-1-saul.wold@windriver.com>
	 <ly35kg9tsz.fsf@ensc-virt.intern.sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 13:55:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161938

On Fri, 2022-02-18 at 14:40 +0100, Enrico Scholz via lists.openembedded.org
wrote:
> "Saul Wold" <Saul.Wold@windriver.com> writes:
> 
> > From: Saul Wold <Saul.Wold@windriver.com>
> > 
> > This script searches for a list of variable that have been renamed
> > and converts them to their more descriptive names.
> 
> again: most of these renamings make identifiers much less descriptive
> because they now sound like boolean flags instead of lists

Whilst you could say they sound like booleans, they clearly can't be as that
wouldn't make sense, e.g. "Ignoring variables in basehash" makes no sense.

Secondly, most metadata variables are lists of things. Adding "LIST" to every
variable that is a list of items would just make the variable names much longer
with little end resulting readability gain.

Unfortunately there likely isn't a perfect rename and these were the best we
were able to come up with.

Cheers,

Richard



