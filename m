Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8934EC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 17:59:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.29272.1671472795205564108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 09:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A4rWhXCV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id r67-20020a1c4446000000b003d35acb0f9fso68268wma.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 09:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eQ/6dY/9QDnRRIn+Y/6g7F2Y/JEYogMihQz0MorM1lE=;
        b=A4rWhXCV7x5+BF1NqWXEeCD298XUrjutYdB665GYvtKHPq3tF8cPVlzs0BQ+8MibE5
         0dCkl72N7+Um6tmg3z7lvNEOr1GT9VdOU4+wBqXLyxgvXKgZ8pnoxy54eKxHJ7sKAhy/
         JLVy35b4QL+bln8a2dJV/tMyoWvhSW7UGaSwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQ/6dY/9QDnRRIn+Y/6g7F2Y/JEYogMihQz0MorM1lE=;
        b=ocsGEdAOaPNV5Xwc7YQvzgv1rJYYbVNcMMLCgEXxMrO3BquHNKkIZibtR0cXzt49DA
         AWVNcKOLLpp56IIAC3XQApDzQzGfs63WBl7g+p++Dr03AiZ0xPUl1YG0/LFwVde8lbaU
         yIrjVPHuQZSUVuLqmZam86GkHy3IttnyNXl99UKBg9ULlb9Uh7r0w1NQUQp2W/heko/s
         FxL/OFvY5fOrrvg0aNZ7geJlYZIpEdTKH3r95xLO3Z2sXUM7Eb0Eft5/6KETOrVZ1HOy
         Rd3JfOUYrq9VO95aUPk2Z4UbQ1NwBP5ipgNSBWGLDJhiSwNxtHN7FBuE5FHMVLxIpAvl
         0seA==
X-Gm-Message-State: AFqh2kqE4BdhgkSVgldHZcuhC2v47DoR5YJ7vzNeeZF4Sz7inqzg8cgc
	weLQjz6cWamt7ZrmPoM5Msegrw==
X-Google-Smtp-Source: AMrXdXvnAw0/ggpmg0euT8uoIGeK54Q79sctKHsKKJ1SLiXVR0EJtec50bIJ3xEXZWWjRUKz2nRW5w==
X-Received: by 2002:a05:600c:4f50:b0:3d3:52bb:3985 with SMTP id m16-20020a05600c4f5000b003d352bb3985mr4624073wmq.31.1671472793544;
        Mon, 19 Dec 2022 09:59:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac4f:7328:1210:6c79? ([2001:8b0:aba:5f3c:ac4f:7328:1210:6c79])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b003d35c09d4b9sm3002611wmb.40.2022.12.19.09.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 09:59:53 -0800 (PST)
Message-ID: <7d1d8ea943b8b223486b07fce854638ab9b611f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity: Update minimum python version to 3.8
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2022 17:59:52 +0000
In-Reply-To: <AS1PR10MB5697400B344F5549E1232DC0FDE59@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20221211173746.22513-1-richard.purdie@linuxfoundation.org>
	 <AS1PR10MB5697400B344F5549E1232DC0FDE59@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 17:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174830

On Mon, 2022-12-19 at 17:04 +0000, Marko, Peter wrote:
> Hi Richard,
>=20
> this disqualifies at least debian-10 and ubuntu-18.04 which are still
> listed in SANITY_TESTED_DISTROS.
>=20
> How is the SANITY_TESTED_DISTROS list maintained and tested?
> Are there some autobuilder jobs with these distros (should be failing
> now)?

At any given time you can see what we're testing on here:

https://autobuilder.yoctoproject.org/typhoon/#/workers

so debian-10 is no longer one we test on.

We do test on ubuntu 18.04 but only with buildtools tarball so that is
still supported for now but close to EOL.

> I was wondering about this for some time already because I had to
> discard Debian-9 when migrating our layer to kirkstone but poky still
> lists it as sanity tested on that branch.

We struggle to keep the list in the various branches up to date and
probably need to find a way to add some automated test to check it.

Cheers,

Richard

