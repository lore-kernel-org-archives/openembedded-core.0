Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD7CD60401
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 06:19:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b15-v6so30618156wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 23:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:references:cc:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=koY9HX5JK2UceA7EJ4M705QjKlKY0BwxyHzp+tYhYf8=;
	b=ngCZcWTDdCPVjgmUPfyECi4VzZeZTEt9XZuFUnhap5l+NFg11Ub3BEt0Ft3hPYxmts
	0o+VkVz5K1wX6o4wB/mJJl6YHatQokKRnnzJq6gKeYDJpR5UrVMHYH03gdNZ8Q9/idMM
	5tk1ckeLs1Bg0Hv6F/4kfQ7Z/ihejdmuTiTaw70nYJU8+EB3aH3RVqW/ABpck0AkUiqm
	041g4AaOaSYAKMz505vkI2EIrtlSXM4MK7dKaRlZE8wKDozzXNMpexWj7y6/CtkjetaK
	r5HyQnAj3Lja4Pt2USi+WzaBixpStP328q2P3zbzB/BC62hC9LCFAvQk4JxwLAZFsXKD
	LylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:cc:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=koY9HX5JK2UceA7EJ4M705QjKlKY0BwxyHzp+tYhYf8=;
	b=eEDeDjiidVGbGYJjrg5v0QtmIspC3PPX0ucTU2CCAfjtKmafumUq1O9ppwyQmZ12LB
	nv8G79C5sCUc0lIrclk57NzPWNKz1DJsV/5+Y8plQ26223oZ9wB1x8S0stDft/14sroU
	h7gEomA8c5PM1QBiTk6E1L4xLkuSQPStKyKbT4yeAx5D6tCluBfShvK6OFJd4ZgF+T++
	iWwcaDdjl7nKvnpq96SMZU/aOKJE0Ix7ZburaLKRWet+pPpACHsTTFiiG7TaxiZUYQrY
	9AST13/wUNrwNGiDZZaJmiHr4z6qjHQbjWzRMn0ncbgyhSb38163AI5WeMTSrO2Uyx7X
	LEyg==
X-Gm-Message-State: AOUpUlG39RUdkliX9pBBbmvLm3SInlWUOu8NOteCxsmnYJCppTaksacv
	Oj+xtMJAA7KM4AJIgc2qR/uddw==
X-Google-Smtp-Source: AAOMgpcPIWKKBcOC0oFYOmXkYG+iY8pPgolAYt7hqSOGAC29QHXxg7iQpo0bU2HzCCxvQXaa6WSziw==
X-Received: by 2002:adf:82f0:: with SMTP id
	103-v6mr10606239wrc.131.1531721955201; 
	Sun, 15 Jul 2018 23:19:15 -0700 (PDT)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	d7-v6sm23926845wro.92.2018.07.15.23.19.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 23:19:14 -0700 (PDT)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <99949e3e-c252-9504-ea89-f379bab6f021@dresearch-fe.de>
	<CAMKF1soU6M4zv6Xu4ugwheBHGO49cZSnnOD-PWSWJsCaAJC28g@mail.gmail.com>
	<a212aa5f-27a7-3181-cab8-c07fa5eca72a@dresearch-fe.de>
	<d45d83de-c360-6306-d35a-1388fdbd518a@dresearch-fe.de>
Openpgp: preference=signencrypt
Autocrypt: addr=sledz@dresearch-fe.de; prefer-encrypt=mutual; keydata=
	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
Message-ID: <04a430ad-567a-d9d3-8a17-77e2dd55d025@dresearch-fe.de>
Date: Mon, 16 Jul 2018 08:19:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d45d83de-c360-6306-d35a-1388fdbd518a@dresearch-fe.de>
Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
Subject: Re: devshell problems after distro upgrade openSUSE Leap 42.3 -> 15.0 (tmux only)
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
X-List-Received-Date: Mon, 16 Jul 2018 06:19:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 04.07.2018 13:37, Steffen Sledz wrote:
> On 03.07.2018 08:04, Steffen Sledz wrote:
>> On 02.07.2018 20:25, Khem Raj wrote:
>>> On Sun, Jul 1, 2018 at 11:39 PM Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>>>
>>>> After upgrading my build system from openSUSE Leap 42.3 to openSUSE Leap 15.0 a
>>>>
>>>>   bitbake foo -c devshell
>>>>
>>>> no longer switches to the related work directory. The devshell is opened in the original directory without any error or warning instead.
>>>>
>>>> Any hints what's wrong here or how I can debug this behaviour?
>>>>
>>>
>>> which terminal are you using, probably some default behavior changes there ?
>>
>> Main terminal is xterm. No special settings for the devshell terminal, so tmux is started like before.
> 
> 
> After some more tests I can limit the problem to OE_TERMINAL="tmux". Other terminals like screen or xterm work well.
> ...


Ping!

