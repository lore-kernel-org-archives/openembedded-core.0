Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C75C3DA6E
	for <webhook@archiver.kernel.org>; Mon, 25 Dec 2023 08:40:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.57201.1703493647441709422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Dec 2023 00:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SsFtN2XY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d4f5d902dso20393005e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Dec 2023 00:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703493646; x=1704098446; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GTWgmcj0VDtUNj9ye7XH16tO8bdYJv0pU2MCYB92EHQ=;
        b=SsFtN2XYh9W+9NUeAv812BRvGb9q8iVCnZvF+9xdw/wV0wFDrk3AXtqtUMu+KoPzm4
         6scClZaCdeEFA3TU7sHX2yte1RPtuQN6V0uDVzCKy8wI2rKwJ2Y8x7hPjd5mrrvT3i+Z
         SDz4dkxKBfB+XHgxm7VU6zzKGFShGH3zEvmFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703493646; x=1704098446;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTWgmcj0VDtUNj9ye7XH16tO8bdYJv0pU2MCYB92EHQ=;
        b=mVoNA8cZvAH3bLj8cf8Dx3QNWDKf3zWKhh7XwcDApAIikoDSCyKzhgtliDqtVs35Jo
         5uYmOx4DBJ6WsEWdHP6jikXWpVjSs4ww7gReEpP6ZlQum8tVt225wYt29Inm818GHbeS
         4J5rC1dBbjwSd/nqn5adgxMo5yvyMyJoR2Vpx/1vQAfY9FoKsXGnrr3ei2mgzxtE4ISG
         x3XozgUxDegkMeeRWYVaRsIgvUBnqlEzJJVzzdp4HxvnaF5Eytr7OWAZqyElDEzIWqQv
         cq+qBNovcZfDO0p3jVNhCqykUccDS4677XGC9zfR6rXIMcb0vqaHKDOh0Y9jKClTRkZz
         NGkw==
X-Gm-Message-State: AOJu0YxATklpk39PQ+p7xySsm9obgPQexTw9PiuWjg4DHUgqyVCfYKcz
	FmxLjgcobLMoq2uiZj42k/9F4mg5iKDQKQ==
X-Google-Smtp-Source: AGHT+IEoOcE3hHof1A/YdckrgxxBDTpg4UxR1sRcDx+22RnK8K2wW5+NfXc58/2QOdJg5GKCjukrLA==
X-Received: by 2002:a05:600c:190b:b0:40d:511d:5911 with SMTP id j11-20020a05600c190b00b0040d511d5911mr1691187wmq.80.1703493645789;
        Mon, 25 Dec 2023 00:40:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ef8a:cd0e:7ae5:e3f3? ([2001:8b0:aba:5f3c:ef8a:cd0e:7ae5:e3f3])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d4247000000b003366811fd6bsm9780813wrr.14.2023.12.25.00.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 00:40:45 -0800 (PST)
Message-ID: <71d893c557d7aed9ecfdb96e6054d15fb9d9243f.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 0/6] Stepwise rust upgrade 1.71.1 -> 1.74.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Date: Mon, 25 Dec 2023 08:40:44 +0000
In-Reply-To: <20231224230934.831-1-alex.kiernan@gmail.com>
References: <20231224230934.831-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Dec 2023 08:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192902

On Sun, 2023-12-24 at 23:09 +0000, Alex Kiernan wrote:
> This is the 1.74.1 rust series rebased to include a revert of
> https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704=
d1d08a8ec
> which I'm pretty sure is what's causing our filename churn. I've checked
> 1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics
> which had the issue) and in both cases we're not generating the dirname
> based prefix - hopefully that means that the interim commits are fine
> too, if not we can do the step back through the commits to find the next
> issue.
>=20
> I've dropped the zvariant tests as upgrading it isn't useful (since it
> no longer includes git crate dependency) and spurious oe-selftest
> failures aren't helpful. I guess we need to include either something
> synthetic which tests git crates, or pull in
> https://github.com/jthornber/thin-provisioning-tools/ from
> meta-openembedded which includes a live example (though who knows for
> how long!)
>=20
> Assuming this does actually fix the reproducibility issue, I'll look at
> how we fix the issue properly, rather than just reverting the commit
> which I think is our problem, but I'd like to try and get us back on the
> rust release train if we can!
>=20
>=20
> Alex Kiernan (6):
>   meta-selftest: Drop zvariant recipe
>   rust: Upgrade 1.71.1 -> 1.72.0
>   rust: Upgrade 1.72.0 -> 1.72.1
>   rust: Upgrade 1.72.1 -> 1.73.0
>   rust: Upgrade 1.73.0 -> 1.74.0
>   rust: Upgrade 1.74.0 -> 1.74.1

Sounds like a good plan, I've started a reproducibility test:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4142

With zvariant, we might be better replacing with a synthetic example
for testing purposes?

Cheers,

Richard

