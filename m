Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E342CD4F4E
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:11:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.17978.1695377471821326140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QmW06oVU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-405361bb9cdso15304515e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 03:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695377470; x=1695982270; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dM4iNeNjQUfSUO6DCsqjd/PjJqWlm+17KFn22RjooQ=;
        b=QmW06oVUGg3KU4Qn1FJK2+yGdko5hb7tK+7ga+InqCmX38xSuKn55JA+1c/RCMU9fv
         nlH7JjZZB+fCQBNey6HZVhC2isSjObbdVNd/tlmbD3iLXB84vVVlx8cNPgteRW9iA2FU
         QLfNPq91tdPcXTm9kLpiqK5WCQ5uGJkHLQ41c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695377470; x=1695982270;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0dM4iNeNjQUfSUO6DCsqjd/PjJqWlm+17KFn22RjooQ=;
        b=odRmKFPOwgNqOxxbzrKB+HUnIuyTQv7tcVcF90796Mf5gbfaveq87K7H6jdf2Ja6jd
         wmmfsASx0k1TS6LbIKP5W27XE/u1g0VyKER5ipnScfq8jrIB8nPXdroy6I0o6h/Q+lva
         WEL+yJ7ja76jbnixw02Y0C71ON2b9/G/P56pYOdtNHy/ab2aNNCEDpH67+IqvxF3pYHG
         vsWy8mpITmRpfhnmeg5QSqbHYwaeeUo2N6NNe5poH7nfgXJsh11M6FvoBPCJlPvX11IH
         aetqqjbdLnvQMLJDDJi719AMEFQXjKKhjVu13UFeep9gVE8C200u+Rg7hJT7B0zU1u09
         JR7Q==
X-Gm-Message-State: AOJu0YzcBXqTLEJzlmnJkG3BpGmYVlPqFtLVwthJ0LxKjo1q+Kt2aNzO
	UvQtgK3sSq4sL+DB9sDAmxiVyg==
X-Google-Smtp-Source: AGHT+IEVyuosFT1sbZ2JD5jd229K05XjX9q/wK2fTAMjokKNuCjbpvdAxfDWxo3c37elmXkekekCCg==
X-Received: by 2002:a05:600c:a381:b0:401:906b:7e9d with SMTP id hn1-20020a05600ca38100b00401906b7e9dmr7156222wmb.18.1695377469625;
        Fri, 22 Sep 2023 03:11:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd? ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bcb8d000000b003ff3b964a9asm7070619wmi.39.2023.09.22.03.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 03:11:09 -0700 (PDT)
Message-ID: <2d66ceecc50d6a5041963c1afa9d55858c0e9bfa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] musl: Drop MIRRORS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2023 11:11:08 +0100
In-Reply-To: <20230922011520.23704-1-raj.khem@gmail.com>
References: <20230922011520.23704-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 10:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188092

On Thu, 2023-09-21 at 18:15 -0700, Khem Raj wrote:
> When using mirrors fetcher gets into a weird state when shallow clones
> are enables.
>=20
> ERROR: Bitbake Fetcher Error: UnpackError('No up to date source
> found: clone directory not available or not up to date:
> /mnt/b/yoe/master/downloads/git2/git.musl-libc.org.git.musl.git;
> shallow clone not available:
> /mnt/b/yoe/master/downloads/gitshallow_git.musl-
> libc.org.git.musl.git_79bdacf-1_master.tar.gz', 'git://git.musl-
> libc.org/git/musl.git;branch=3Dmaster;protocol=3Dhttps')

That sounds like something we should look into and fix?

I don't think it makes sense as a justification in a commit message.

Cheers,

Richard

