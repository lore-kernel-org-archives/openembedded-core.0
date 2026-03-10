Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910C7FCC9D7
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 07:39:34 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34865.1773128370655459718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 00:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NNl0u4oJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c4a93841so4666027f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 00:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773128369; x=1773733169; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwNFSovo3wV8HCwkeilDv6XruYZWnOyqZlbcLg4dy34=;
        b=NNl0u4oJGcrRSRfGL5db1+g9XiRgF3ZX3uqR7WEYKkm89xA0y/3l9CNh+l642aS+sX
         7f8KKFTC73Dw07kOWFVgkRcj2Su1kp+zE9j7x+zpBwjAphkXKT0ZuayaoXxRjoRjTb2o
         xWA8AASzHGwDQupn17+Mi++wKCJYi3JbmqDCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128369; x=1773733169;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dwNFSovo3wV8HCwkeilDv6XruYZWnOyqZlbcLg4dy34=;
        b=OPW94yKtT8mcCPLa6YMKtTGwrp9d4khEWgcTC/aTXQsOFHK8hI53HMc4+zDeqo+U/O
         C/uPeEw/7Tlz1IO3S9eDmT+z70ChAbF2IcvJE4AAVAX+h1VIs2+c/eQL20KO5wN0decl
         uq5xzJyBsS537+npH6zJzdrzsDcRgM4qRN5eVVt6fnN3yvUkZHbMgapDJ/yCZWsO0fhT
         2j81+VKadWkxHS3Rf2RqKPFG15Y9Jemh+02Z2rg5QtwyJJ7LtEfg2x+YEMD7Sh6UMyz8
         5YBFZblgUHgyzc47XAjtoVaddBivSfqwqosCi2XDJuperOVdaFVre6BdNYLR+o4OSPek
         sq9g==
X-Forwarded-Encrypted: i=1; AJvYcCVeEqyBTYHOFB/6rDOjWMAx/WkFzhuG6KNaQX/NnPKgT14b5vNsww2skPLgelzUXSKLM/VE9P+BVY0qwF/wzVbzmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwXITAT/EXcR1MwqFINHabk1tDONR1JFtOrrVK6LaurIMKZP2Hp
	dJTuoXuO6pxN09W6YWKrJ5tFbggZGM47VnNLiyDtvuBImsM90I+++ZNBex/MnuFv9y8=
X-Gm-Gg: ATEYQzyTfnayjVWnZS21xiftuRgo6mBsoCgMJ3te2VFmYyV8hVdgMH11nlTszsOH6KY
	nfx4HgPpYkSRXxHUxhBXkWpieP8BPii4wi/AMJn7tJqfVQlHv7MZZ2HVPaKX/pfvr2YMgCSx9KW
	Ahg5HSgZlu+UiyjMTG2OdENhnvL0fzdypdwRZQaKcPnd6u+0O0kEZst6w83v6NcmQODh9e0yA6I
	Sgfn5IfZSxu+mt+Ghp13zQcCrfeNk/QouE0MRYSkVrfG1tD59XJK4kd4ekKBDfSKVLaqeYu3nIC
	eOX9bsm6mYzZBEY2XB3K2QWK+cCY5ycFtyAHNDz4AxM5or9o8wFeCzGi8YFsa0QePZ5O4yCzDq6
	kRZ1Ih4ju81gk/h16u2u86SWMnabfwiua8NXwfh28fjOHPNNrEYJu1LFKG2Zb7ZOtHzhcuhLNM1
	k7jB4CGY1iHWruy6+1JzMyotDuJRDgAbOk9baSnk2BeARW8uAiDCmBNQk5WjQWSezqYSUtAjLca
	sZ9oRlX3oKfyzs=
X-Received: by 2002:a05:600c:a4a:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-4852691e00dmr223993135e9.14.1773128368871;
        Tue, 10 Mar 2026 00:39:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485245dbcffsm113059485e9.18.2026.03.10.00.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 00:39:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 08:39:28 +0100
Message-Id: <DGYXJR3CL2C7.5MCD2YPSRQ3F@smile.fr>
Subject: Re: No listed maintainer for stable releases
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Clayton Casciato" <majortomtosourcecontrol@gmail.com>, "OE Core mailing
 list" <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <07131edc-be81-4c9b-a3b7-6d5b5b865be7@gmail.com>
In-Reply-To: <07131edc-be81-4c9b-a3b7-6d5b5b865be7@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 07:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232760

On Tue Mar 10, 2026 at 12:19 AM CET, Clayton Casciato wrote:
> Hi, Yoann
>
> I believe you are the current maintainer for stable releases.
>
> The contributor guide [1] asserts that "The list of stable branches
> along with the status and maintainer for each branch can be obtained
> from the Releases [2] page."
>
> I could not find a maintainer listed on the Releases page.

You are right, this info was not migrated from the wiki : https://wiki.yoct=
oproject.org/wiki/Releases

I'll look into it, thanks for the report :)

>
> [1] https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.ht=
ml#submitting-changes-to-stable-release-branches
> [2] https://www.yoctoproject.org/development/releases/
>
> Thank you!
>
> Clayton Casciato


--=20
Yoann Congal
Smile ECS


