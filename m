Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31AAC47073
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 11:08:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.182364.1703934499608101413
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 03:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h4sGsynA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d5a9cb423so42949545e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 03:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703934498; x=1704539298; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H4l1VUu8rv05zGlTUbKJn/IPBTuihXYX1SmAejcM/Dg=;
        b=h4sGsynAVRwMyTqzsdWMcBl7a4OlouEdUkdrCXYRK9oOw14K7LAoAiEXeGEx0SOlEk
         RNcEp5Xc2uR02oS3nU/c2QPs5GgR43ad3GrjRmAHSYm6PcHNhW16h6nztVksiNrP2B8Z
         geuOUa2XQ8WL92hnPe2Heggg1msNhieZ+j7Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703934498; x=1704539298;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4l1VUu8rv05zGlTUbKJn/IPBTuihXYX1SmAejcM/Dg=;
        b=FFvBeVS/ZK/v3uTVhYR/gm8P3HzXfL7oebwlHM5mqOkzuJllCcaRQZT4wwqv8ZMDzg
         BM9dwT/yacT6P5ByUH6LYqL4eVg00m1xJ9dwG3KNwQJrDDkG54PFSf4e0p66QTTGe4vs
         +wz7/GO9pRCWws8cR8MgB/cK3FWbM5kWBTBr9DRL5GvkEvoS5KlP6D2Wggmk6y52UGu3
         c5CJg+33t/1duuq0o4ie3yYcbC9yUqtv2soCZuaTifKeUkSq5hYxwrHfmHOFAkZXuDfx
         1PD+cvioIRV6WAHqAigfcgM0B96+6uyER4IUzgRmA/P0g9ZnIhC8TLgxkooBzl6vgwoL
         Fa1A==
X-Gm-Message-State: AOJu0YwMigwdn6oRjJF87lexWcSVMDtfhCE3OsI3T8y6BJ5ZaUUgsXsc
	LG0x/ta4+zOnEd2aseo+x2Ds5Qaph8n2sw==
X-Google-Smtp-Source: AGHT+IEa/5j6x5H9JhAUCJmLUcAQZlB6fYkiCsbhw+C1Pmd1jEwd4EtqL1dSTNb7oo/NxacCNrN73A==
X-Received: by 2002:a7b:ca48:0:b0:40d:123a:517e with SMTP id m8-20020a7bca48000000b0040d123a517emr7730927wml.74.1703934498018;
        Sat, 30 Dec 2023 03:08:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a152:ea8e:7a3:4258? ([2001:8b0:aba:5f3c:a152:ea8e:7a3:4258])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b0040d61b1cecasm9847578wmq.33.2023.12.30.03.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 03:08:17 -0800 (PST)
Message-ID: <3677ac92a92c1709b578467834abb9f392ee4332.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 00/10] Stepwise rust upgrade 1.71.1 -> 1.74.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, "Kokkonda, Sundeep"
	 <Sundeep.Kokkonda@windriver.com>
Date: Sat, 30 Dec 2023 11:08:16 +0000
In-Reply-To: <20231229114435.27810-1-alex.kiernan@gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 11:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193068

On Fri, 2023-12-29 at 11:44 +0000, Alex Kiernan wrote:
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
> Changes in v4:
> - Mark hello-rs as EXCLUDE_FROM_WORLD as it's not reproducible
>=20
> Changes in v3:
> - Add hello-rs as a replacement for the tests which used zvariant
>=20
> Changes in v2:
> - Skip zvariant based test rather than deleting it.
>=20
> Alex Kiernan (10):
>   devtool: selftest: Fix test_devtool_modify_git_crates_subpath
>     inequality
>   devtool: selftest: Fix test_devtool_modify_git_crates_subpath bbappend
>     check
>   meta-selftest: hello-rs: Simple rust test recipe
>   devtool: selftest: Swap to hello-rs for crates testing
>   zvariant: Drop recipe
>   rust: Upgrade 1.71.1 -> 1.72.0
>   rust: Upgrade 1.72.0 -> 1.72.1
>   rust: Upgrade 1.72.1 -> 1.73.0
>   rust: Upgrade 1.73.0 -> 1.74.0
>   rust: Upgrade 1.74.0 -> 1.74.1

Thanks for working through this, I've gone ahead and merged it :)

I am a little worried that:

* the test recipe isn't reproducible
* we still have the tests disabled
* the next version looks problematic

but I think we're at the point it makes sense to move to the newer
version.

Cheers,

Richard

