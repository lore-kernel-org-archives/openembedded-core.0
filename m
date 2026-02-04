Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621F1E95395
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 12:31:37 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19346.1770208293607479451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 04:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gB2jDlCH;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso63333465e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 04:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770208292; x=1770813092; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1vSiOcxDHCDIBFiPlSs/UG/dWb3B+d4OskREmsdrhk=;
        b=gB2jDlCHl0TcPq6r/MKeQULzhkDUgZ7IeImdYuNVaKu0xOxVZqhHeM0ate5zFihEZP
         mgoOWSnWo0eQA2VY2DkWc0V1snsVn5I0kHFmDq8k8UtOIj7e+/HhJdnEfJbTm16mRmlg
         8wvgdJfQrmvbw/461yul8N/Ju9YMQ8Uy2jOg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770208292; x=1770813092;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1vSiOcxDHCDIBFiPlSs/UG/dWb3B+d4OskREmsdrhk=;
        b=SZpA+SxHYIKlo8hHCpbplEW1QMphHopdqqDLiTiQViHqFsJkgltT8m+kCE4hV0wAF4
         WjjuP/1BHQT41/tZO9h8tCexTjv2s3Mr+XJLKPKZBWUNGPCBP09accHeWKG5rwpg2gka
         Ng/pQlLIOBPULFoI1TudXihilarXqMradzMrHLhsv/fHv1HamgqoJzqfkQdzgtcgPPF9
         keeZgchFUM86CPDB/fLRos4AWtnsdojHuGQrtOG0dL969TLOtDuwlOzeizlcqh+1gJbF
         6HRgT7iAVzr1uqZH0Inbe+JUl9VhTMaVXOxPXoK1AB9+XibeREw42r/YZAskwtglIj15
         wrng==
X-Forwarded-Encrypted: i=1; AJvYcCXcmsZLa0rDTtF3iNksAjcs3vdsChqRvVc9oLlB52my7DFrdsH5/lQCQRIg7Apz8N0nBIrmUbC9T+GbRSa+VZsWWg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuPSycmp81JuEGvgxvMKlSmQW3WkC3Mnn8OPJqJIr577HQWLyG
	0FKn7Jmwo2v5GboxRr/gZj/qItKWQUu/jxsnGlp/0qVDfmnyqA+HY6EzBMzh4hopvns=
X-Gm-Gg: AZuq6aJlU2XZ1yiQXn7b8a8P3pFGqR9Zeln8zOI4c0sxPwqzWjCrjNF8SFparrcr0Yt
	elH8AOQl3COHMWVR9Tn80zJndshYnTsGUzAmF2Fnk+H189uuev2NPuBVXhBU+iYbyMFjm97bBbf
	AbmnHX5BL1hyfEXN1Mdwu497bmdlMb0VRvGxNQ4ErJf1uUheitZM3WRpBfMZ4er9jYcJJua8Xxg
	UGRyGTR0+eVynqSErugVog0VOtsblwQJOnwJCKc/imBpLrLBJnHz1NJ/IEc+SZDHNwIank4WkCn
	cnfXK5VIqFR3/hgrSTpQepzaGlaZRBwM+0Xp7yvrJTEdHwGJwecG0j8OO1dM78xaRCbECFwJ8ny
	idxgZk2Vwg0irbqzhtwWBekW602EswwKMJbasCV2Xg/Vy7jw0MWHxjVHilr9XSqgFdyz61575sy
	oBcxiP+earR0TIWnTHdYByEfFQRBco+7TPT0JdnzsVRWnp+PEpoMysJ/PMa0dqRuocTncVfnaS3
	qQ=
X-Received: by 2002:a05:600c:630a:b0:480:3a72:5238 with SMTP id 5b1f17b1804b1-4830e98ad35mr41152745e9.30.1770208291868;
        Wed, 04 Feb 2026 04:31:31 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831084d9d2sm44613945e9.5.2026.02.04.04.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:31:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 13:31:31 +0100
Message-Id: <DG66GUA3GH4D.31PC9MVWLCK32@smile.fr>
Subject: Re: [OE-core] [PATCH v5 07/15] kernel-yocto.bbclass: Disable ccache
 when rust-kernel is enabled
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <alistair.francis@wdc.com>, <bruce.ashfield@gmail.com>,
 <elmehdi.younes@smile.fr>, <richard.purdie@linuxfoundation.org>
To: "Paul Barker" <paul@pbarker.dev>, <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
 <20260129163910.2612040-8-Harish.Sadineni@windriver.com>
 <8a9cf281b36ede03135fb042e260d22785ed4f38.camel@pbarker.dev>
In-Reply-To: <8a9cf281b36ede03135fb042e260d22785ed4f38.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 12:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230517

On Wed Feb 4, 2026 at 1:05 PM CET, Paul Barker wrote:
> On Thu, 2026-01-29 at 08:39 -0800, Sadineni, Harish via
> lists.openembedded.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>=20
>> Currently, a ccache enabled build fails with:
>>   |   HOSTRUSTC scripts/generate_rust_target
>>   |   HOSTCC  scripts/kallsyms
>>   |   HOSTCC  scripts/sorttable
>>   |   HOSTCC  scripts/asn1_compiler
>>   |   TOUCH   include/generated/gcc-plugins.h
>>   |   DESCEND objtool
>>   | error: multiple input filenames provided (first two filenames are gc=
c and
>> .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_targe=
t.rs)
>>=20
>> when using ccache, value of "HOSTCC=3Dcache gcc" when this value is pass=
ing
>> to rustc, It is thinking gcc is a input file. when ccache is not used "H=
OSTCC=3Dgcc" is passed.
>>=20
>> Disable ccache for kernel build if rust-kernel is enabled to workaround
>> this.
>>=20
>> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> This patch is good, but we should try to get the issue resolved upstream
> if we can so that ccache can be used.
>
> Has this been reported upstream yet? Could you also open a bug in our
> bugzilla to track this?

Hello,

For context, a lengthy discussion happened on this patch here:
https://lore.kernel.org/openembedded-core/CA+TGqK9Yd2WWKrhMkhofF-8N0cESCSef=
WD2DXr4sBO9fDQXyrg@mail.gmail.com/t/#u

And, sadly, we lack resources at the moment on our side to follow-up on thi=
s :-/

Regards,

--=20
Yoann Congal
Smile ECS


