Return-Path: <fathi.boudra@linaro.org>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id D2C1578416
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 18:04:33 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id t6so1136724ual.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Feb 2018 10:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KZRqLyKIp0qWKrQ4+NYLrAnXoRiK8OCNspxJTDMYaXo=;
	b=c8HCVOfxmU0Nkh7a7WZ7QRTkyCEzGm1cduN/U8poNrF57H45QSBdFfNLgg9FzNsmDu
	+Ud0BalHTSL5k831mLVnA5x9RHr0CtJXc9xzjHgE43jlkgf2Vd8x6CpRPFZQRKWTI99A
	w1GsAl6Bv4537TYmj5DoQTCjLPiLwPjCLD1/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KZRqLyKIp0qWKrQ4+NYLrAnXoRiK8OCNspxJTDMYaXo=;
	b=OJ9Bie+DGmCnDkJ74iNy760OD7nE7FYu0fBnKptDvBScdoHJ6vM+gMQbAwYAVzydLv
	HzFzgUOpU/W3orvOJW/n+zOUzAxC/oiIpwD0PIF3AEqGXo0rTaOzooJtMG7qe6bkWj0F
	QK99oWugb2Q4iViiCTsRJ0OORYwRkz8UK8lIBH3xO0IT1A7F0m/ObR22U54oKkJ6aS2y
	G+cCUvF+RfEhcv/3QrLJ0FXqdpiQJ6/BwLTyM+/XrlgVjwC98XZHD7CUEFf2TgxkIZOI
	7L985+5zW1dal4cFgJPYseHnqIvn/IamOd+eqQDWygKnTLG3SJgdMmQktDJNlEefjtVT
	dWXw==
X-Gm-Message-State: APf1xPBXjENJsYEaH2aW4JFVjWjGC5y1ok7Mw50Tuu2WkJZb2xdATjWq
	2aN4+4i6Q22sRj5KDzwyehDvLloaeXd2YgrtpO/jSA==
X-Google-Smtp-Source: AH8x225kulJo7dYDDIlCdQXIAzAKjHM090y1Q3CbaxLWKQ98qBN6n39qbC4C8UYremG/m9qkIKdeONOwv2wg+qHepPw=
X-Received: by 10.176.9.95 with SMTP id c31mr5808122uah.43.1518026670945; Wed,
	07 Feb 2018 10:04:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.54.77 with HTTP; Wed, 7 Feb 2018 10:04:30 -0800 (PST)
In-Reply-To: <73704abe-4307-e1fa-bf2e-ca55617c64a7@linux.intel.com>
References: <1516102686.29722.267.camel@linuxfoundation.org>
	<1517070952.756.40.camel@linuxfoundation.org>
	<73704abe-4307-e1fa-bf2e-ca55617c64a7@linux.intel.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Wed, 7 Feb 2018 20:04:30 +0200
Message-ID: <CAGNsrLC8hdYKb2K+RLSBnOUBg74oz5=DvepFeUiEy+eKd-XN2A@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project, Spectre and Meltdown
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
X-List-Received-Date: Wed, 07 Feb 2018 18:04:34 -0000
Content-Type: text/plain; charset="UTF-8"

On 7 February 2018 at 14:17, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 01/27/2018 06:35 PM, Richard Purdie wrote:
>>
>> On Tue, 2018-01-16 at 11:38 +0000, Richard Purdie wrote:
>>>
>>> I just wanted to give people an update on where the project stands
>>> with these issues.
>>
>>
>> Master now contains gcc and kernel fixes (in linux-yocto). meta-yocto-
>> bsp updates are still pending.
>>
>> rocko-next also has those fixes and is undergoing testing which if it
>> passes, will get pushed to rocko.
>
>
> A quick way to check what degree of protection there is on a system is to
> look at what is in /sys/devices/system/cpu/vulnerabilities:
>
> ak@linux-f9zs:/sys/devices/system/cpu/vulnerabilities> ls
> meltdown  spectre_v1  spectre_v2
>
> ak@linux-f9zs:/sys/devices/system/cpu/vulnerabilities> cat spectre_v1
> spectre_v2 meltdown
> Vulnerable
> Mitigation: Full generic retpoline
> Mitigation: PTI
>
> Of course, outdated, unprotected kernels do not have this directory at all.
>
>
> Paul, perhaps this could go to release notes?

It might be of interest to some since it's shipped by some distro:
https://github.com/speed47/spectre-meltdown-checker

>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

