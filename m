Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5548778916
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:42:06 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id m193so3302613qke.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 08:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YuBSRPEgwN2eMMD4l4iASrai7P4jxiTOHkjf/Fm4wnY=;
	b=LFcCQRrJokzspEaq84yxbpOcCnbNb9ZwffZJ/OAuDJ7v7XT78jifgyq0rCV3LbGI5Z
	lCjFChRsyrXboxpMQZ5wnHAnd5TliF9OEOarqdux4aGIALvBaBcqR+d8Nr4KezxKtVrE
	Iv9aoQl9tKmK3qAIoQ3U6irPSHrjMPblZUbRY3rGkXf739bSxbkpZMthmxdJYXL2pJzI
	iiJBXPziyS7GO5DNe0JN+nBOgbiofVTJFCTFgCER1tHIfTN3ig2rlCuJbyIXgJp4XI2c
	rO8fz3NOTp2oqtOLochxiuu0zCgC554Odc2ARoNgb9xVpS9Z2kOaP/UbF/ckWPWmoWd8
	VVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YuBSRPEgwN2eMMD4l4iASrai7P4jxiTOHkjf/Fm4wnY=;
	b=taKC1zMgg7Kj3R7MihJrGwrh2fqnO0Z6pZeolkVC2JyjvNm4AnJTD8o/almNP3xwwB
	epG6eva0pjMgDGgAhVL8gH2W9uc1Gy/wquM468lz7QlWMuWDxxSQc+lfX4N6/NstuSD3
	7IZf+g/Cb2/XcnRLPmUrdKTe2vSWLDpJYeMrQ9fVaxdndnVM0+0ZJf12Juv2xJA3+Z0O
	X5AvQ+w7S80sR7gcq0Dyh8Nj4QYCsiiAWh8OBWxJEnvlHa+nD0FXb9YIfgC6ZIENv8Ui
	Uy6ZWP33m+2hyI3HEj8VENINtATZ3ogjswP2qlTOy8cj1RFDbmdjbeHQztAD2kQvE9OD
	k5Ig==
X-Gm-Message-State: AKwxytfUnIPVamJ3bIEaoWD08ssixA4r5TKvtALnT867APQlJjV3Z2V0
	sAQsCavSLHccKye6EnCeugUGx+0kbhg+qabmfb1gmA==
X-Google-Smtp-Source: ACJfBotCs8Xq/SBqW6x6y70gdeVaKwI5cLaQTyZdGks3XphefEZoG9mglHSO6YUD7QN5W/HQtFVjAUvpA1sIi1QQgsQ=
X-Received: by 10.55.203.92 with SMTP id d89mr11825323qkj.218.1515343328051;
	Sun, 07 Jan 2018 08:42:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 7 Jan 2018 08:42:07 -0800 (PST)
In-Reply-To: <db5ad1b0-0994-0ce9-79df-39a1704b1072@denx.de>
References: <20180107161920.30937-1-marex@denx.de>
	<20180107161920.30937-2-marex@denx.de>
	<CADkTA4MH4EL42iL=BXRKy8y0Gp_bwOarpXiBEPrvCSygOuT4oQ@mail.gmail.com>
	<db5ad1b0-0994-0ce9-79df-39a1704b1072@denx.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Jan 2018 11:42:07 -0500
Message-ID: <CADkTA4NL=2rzVUfwimQhON00xFMy2UwrQ63vjmR_4QBGHNn1EA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: Add optional patch_xenomai task
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Jan 2018 16:42:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 7, 2018 at 11:38 AM, Marek Vasut <marex@denx.de> wrote:
> On 01/07/2018 05:37 PM, Bruce Ashfield wrote:
>> On Sun, Jan 7, 2018 at 11:19 AM, Marek Vasut <marex@denx.de> wrote:
>>> Add additional task, do_patch_xenomai, inserted between do_patch and
>>> do_configure tasks. This task applies the cobalt patch to the kernel
>>> sources for a specific machine. This is disabled by default, so use
>>> PACKAGECONFIG[xenomai] of the kernel package to enable the patching.
>>>
>>> You will also need a kernel recipe for a kernel version with ipipe
>>> patch applied.
>>
>> This doesn't make any sense to me.
>>
>> Why on earth would this be in kernel.bbclass ? and part of a xenomai
>> recipe ?
> Do you have a better suggestion how to make this easily available for
> every kernel recipe ?

There's no need to make it available for every kernel recipe. If someone
wants to build xenomai, they need to have a specific kernel recipe and
configuration to make it work. By providing that patch and allowing it to
be applied to any kernel doesn't mean it will actually work .. so you aren't
doing anyone any favours.

The same thing could be said for the -rt patch, aufs, etc, any patch could
be made available for any kernel, but they aren't, since they will either fail
to patch, or won't work at runtime.

Why would a specific xenomai "host" kernel recipe be made and have that
patch applied ? You need to control the kernel version and configuration
for it to work at runtime anyway.

Bruce

>
> --
> Best regards,
> Marek Vasut



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

