Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 74E52782E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:32:07 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id z19so4796900qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=PCY8LewgOBL09EGAXm9ncbh79+KzAtEGveEPLPLeg3w=;
	b=o0ldBFEJ1lnwYxMFXnjtVGD4YGPQVyEt7qgJnZQDav8+CY4QKPOu8SSUTgKOmRONsm
	F44KUgfKamyqreZqXT8vwr7XbaZjmRU55yYcVG7J8i/x/WBGqq0/AoKd0YgGbt12kDJc
	UllCo2xYGWWs2O5znuBFEudyzlnDxuHkjiFLnOnsSiShDZFyvdGNe+M/0OgQfDPnxpOt
	df0SCijgEt+94DzevJC1WyDAJ6/xsjUJY24Vk0IWSbVqdyEkK6+YjSModq8fhzkcX5JQ
	N9lwMvTacB7ungAG6az18tRzSaVa3kqd26Zn3PNcGcg6QXYN5MRL+I5IDCtpa7+5lGxK
	2GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=PCY8LewgOBL09EGAXm9ncbh79+KzAtEGveEPLPLeg3w=;
	b=pRfzbPghgCgarlo6NVlCoDvtyN2EeGXuSzV+T+6PNl0v5odmOZyUY0uCV+MnRkdiRT
	BqhLQvCM5R6Ne/N4nov7Wv6PRWtQe5OYoi38ukgNF6UzrYhAI94DVWkzXycxF4NW6MAS
	p2phWdV2Fnx865IfIdiKf7dNsWVXaNy9D2kBZ4pDKWvYhos+uYsUbhf9CPP9A8ox2KCO
	ato7OaIzwICM+eny3R8ZdwxbTMvA1xUNlscFKq7fUfR/2Czrf9ZUrH54RAhSSYiDOltR
	foODAilbgU0DUBtptMAHPEnxqovwYx5ezSO3J3gPIirMihl/r5PUUb5JLoW4t6iPXz7o
	KUFg==
X-Gm-Message-State: AMCzsaXU5aU4YQ+UsMEdXot/Tzn1i0DwavYPATrIDB5RHBmy5dw3RnEc
	5hNrHybDbj7vsVK/JqIGHfqOgyR6
X-Received: by 10.37.184.3 with SMTP id v3mr2829023ybj.208.1508257928234;
	Tue, 17 Oct 2017 09:32:08 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46])
	by smtp.gmail.com with ESMTPSA id n7sm5064581ywh.33.2017.10.17.09.32.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:32:07 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id h6so3970561oia.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RnwVBFg7PQ7+AccaZFqyxOKM2/MB5SRQPe602qnuoV8elCfZ0o3MKFQ5MZwgHAjlOdxuiYEHaCe/7jxvS/1PQ=
X-Received: by 10.202.223.8 with SMTP id w8mr7311903oig.17.1508257926437; Tue,
	17 Oct 2017 09:32:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Tue, 17 Oct 2017 09:32:05 -0700 (PDT)
In-Reply-To: <CAMKF1soaVRfyvgYcZy2TSfjgOT+Er4eB0kCKtWd0_wqbZwH17w@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-4-raj.khem@gmail.com>
	<CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
	<CAMKF1sov3p8viw9h1SjNF9Hyz0X5LuMqbJ4JnyFw-7HHxnKTLA@mail.gmail.com>
	<CAJTo0Lb81WDPU5mFKi+5SJkuqXDgxFEwnD2LLCMk+T24_M7nWg@mail.gmail.com>
	<CAMKF1soaVRfyvgYcZy2TSfjgOT+Er4eB0kCKtWd0_wqbZwH17w@mail.gmail.com>
Date: Tue, 17 Oct 2017 14:32:05 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpRhkqs60cd46V0ngy31PJyA4mO+sCiYrHcNQmS0Zfi=w@mail.gmail.com>
Message-ID: <CAP9ODKpRhkqs60cd46V0ngy31PJyA4mO+sCiYrHcNQmS0Zfi=w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Tue, 17 Oct 2017 16:32:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 2:29 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Oct 17, 2017 at 9:25 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 17 October 2017 at 17:24, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Tue, Oct 17, 2017 at 5:41 AM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>> > Curious how you hit this with master.  For me:
>>> >
>>> > checking for check >= 0.9.9... no
>>> > configure: WARNING: check not found - skipping building unit tests
>>> >
>>> > The configure script uses pkg-config so shouldn't be picking up host
>>> > binaries.  Can you dig a little?
>>>
>>> do you have ptests on
>>
>>
>> Yes but libevdev doesn't have any.
>
> and I am using new pkgconf

pkgconf is broken on master as far as I know.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

