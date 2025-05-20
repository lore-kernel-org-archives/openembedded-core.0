Return-Path: <jeroen@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4937C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 16:09:13 +0000 (UTC)
Received: from outbound3.mail.transip.nl (outbound3.mail.transip.nl [136.144.136.12])
 by mx.groups.io with SMTP id smtpd.web10.24881.1747757345571129869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 09:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=Fcy5mSOY;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.12, mailfrom: jeroen@myspectrum.nl)
Received: from submission7.mail.transip.nl (unknown [10.103.8.158])
	by outbound3.mail.transip.nl (Postfix) with ESMTP id 4b1zy70DQLz129lF;
	Tue, 20 May 2025 18:09:03 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission7.mail.transip.nl (Postfix) with ESMTPSA id 4b1zy5693Fz3cyj8k;
	Tue, 20 May 2025 18:09:01 +0200 (CEST)
Received: from [192.168.178.63] (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: jeroen@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id BB1CE20072;
	Tue, 20 May 2025 16:08:59 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=jeroen@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Message-ID: <94959f54-400c-45c6-be73-f8a1b0bf11be@myspectrum.nl>
Date: Tue, 20 May 2025 18:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gcc 15: fix ldrex r1, [s14] on ARM
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Armin Kuster -M <akuster808@gmail.com>,
 Jeroen Hofstee <jhofstee@victronenergy.com>
References: <20250519181815.2536332-1-jeroen@myspectrum.nl>
 <CANNYZj8akxs-9hB2LirzQpmM9_-6EMxc=otE+EPuykFvX1Ryrw@mail.gmail.com>
Content-Language: en-US
From: Jeroen Hofstee <jeroen@myspectrum.nl>
In-Reply-To: <CANNYZj8akxs-9hB2LirzQpmM9_-6EMxc=otE+EPuykFvX1Ryrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission7.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1747757341; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=NTYihzzOiq2uDLe0ZsZXmDlV36/ce8eU50PTlF0wGSA=;
 b=Fcy5mSOYKBvIWnT3EiFrvkhETaa7ByvVOMd9d/8pzl3x573sQx19ThcXEWt6EEmiNfuSvO
 wAaIA4bMt/g05jgtzSP9Z2xxst0uLJqdFAD1/NHSCn4Im5NTxrqMWyvi4Gy6HVxRQYHxkL
 An+ZBDhD4pbIxmz5Oe/Df3MvNlfTy6jM8Bkf252ygFaUD6N6o8tZ/nSjLuIDugcOkVpJcH
 H5JHCku1YpQYoFnIkDFKqvvdOVKZEjOjDzi3g+WRLrZ4HjdB5ojx+7vWAcfQUsPz2vJxMZ
 zT54NUJzUAQbTq5oXXAF4t06BF6bLA9pO1mDinxutPz/3m3AE2SbS1KVfcb5hg==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 16:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216924

Hello Alexander,

On 5/20/25 15:24, Alexander Kanavin wrote:
> On Mon, 19 May 2025 at 20:18, jeroen via lists.openembedded.org
> <jeroen=myspectrum.nl@lists.openembedded.org> wrote:
>> +Upstream-Status: Backport [WIP, https://gcc.gnu.org/cgit/gcc/patch/?id=e5bb7a328eb71daa02d15b48d3a6c6b8cd24abc5]
> Has this landed in master/main? If not, it is not a backport, and
> should be marked as 'Submitted [where]'.
>
yes, it is in gcc master, but not in a gcc release.
It it superseded by 
https://patchwork.yoctoproject.org/project/oe-core/patch/20250519183029.1517865-1-raj.khem@gmail.com/ 
though.

With kind regards,

Jeroen Hofstee


