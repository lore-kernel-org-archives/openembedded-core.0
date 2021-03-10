Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.web12.7326.1615375462853075927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=cOBMt6Vc;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4DwV8g5nwCzQjwL;
	Wed, 10 Mar 2021 12:24:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1615375456; bh=DMqli4J5kZA+Rzu8C6l9Cmo++NDJ3NmT8Ld4UfCfS3k=; b=c
	OBMt6VcM7vF5fRyImYPcrHyszKPlb9ON5hFGOb1C0JpwqK8Ud2KO7qijh5UizB5y
	0ay51su5YyZR8cMNnKZcGs+mdBlJzmSaTpqhDH+mMKQ/HpLVKSsYiV0hE9vOrGMp
	sUmcs2gPKm5pBarv1kW4RvA1+/N0IqNt8uiWktKfNFRUoEm73zCxqvc8WV1VliZb
	a6EvjmpiDQB9kO87+3KWu93sZViMt2P1jDIz8jCEK1nqq+Ub1HxbdcOS+RlhF0J3
	GPc7+L3Tx8TGp0z/zbBNpWabwM2f9C8nhuBqZc4TMCvzZsQSTw+MZUR0XMkP++w8
	1+yDzoJM6VcgUJkbKtvoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1615375457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UbkkmIt72e0dI9NQEnyLxgd4P1hZVoOt8FT4xeL33EQ=;
	b=KLOWpu0X/ScxFyffL/7RMokzX4IfDLSZJVEb8mPAAjGch4hNYZacUvW989BTZ1sl2rpk9e
	E/qj0kHrvxbwl04+FTBbmfnkvJmyDghXueU/flO03E6SIN8WpLu6HAY2A2mcFwFBAqB8hg
	ZT8uytJW6GLiXgpdA9zbCbfhklDCoIy1auN17I5YtPnVNR54lzdA81jVSH9amtb4fAAGyv
	xmE2lKjOhVNI4qS+vgM4e3Q+3ZgjJFXWaoKyLhhFY5MJ8QoRukJo4BPICBWx8lKxmDpzv/
	QSQqmHXTbgxogYz4hcYYZmSfcYtYS+gt5Nw3PEF/HsC63ZbgnJu3S2vVwad4Lw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
	with ESMTP id ZH8_DrYO1O3i; Wed, 10 Mar 2021 12:24:16 +0100 (CET)
Subject: Re: [OE-core] [PATCH] pipewire: add recipe from meta-openembedded and upgrade to 0.3.23
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
 <schnitzeltony@gmail.com>
References: <20210310070810.20295-1-crg7475@mailbox.org>
 <CAAnfSTs5NuLR0MZcJ--8-bFQZOrpH0aKcE0U713iRenPUNTxFg@mail.gmail.com>
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
Message-ID: <67b77428-a61a-9824-9bf1-128af2db99f6@mailbox.org>
Date: Wed, 10 Mar 2021 12:24:15 +0100
MIME-Version: 1.0
In-Reply-To: <CAAnfSTs5NuLR0MZcJ--8-bFQZOrpH0aKcE0U713iRenPUNTxFg@mail.gmail.com>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.40 / 15.00 / 15.00
X-Rspamd-Queue-Id: BF0FA17B5
X-Rspamd-UID: dcb0ef
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I'm fine with either direction (keeping it in meta-multimedia for now / 
migrating it now). Others thought it was a good idea, which is I 
submitted this.

I put more people CC that were involved in that earlier discussion to 
get more opinions.

On 10.03.21 11:41, Ross Burton wrote:
> On Wed, 10 Mar 2021 at 07:09, Carlos Rafael Giani via
> lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
> wrote:
>> +python set_dynamic_metapkg_rdepends () {
>> +    import os
>> +    import oe.utils
>> +
>> +    # Go through all generated SPA plugin and PipeWire module packages
>> +    # (excluding the main package and the -meta package itself) and
>> +    # add them to the -meta package as RDEPENDS.
> [ ...]
>
> do_split_packages() returns the packages it generated, so what does
> this Python do differently?
>
> I tend to agree with Alex: adding it to oe-core now without a
> migration path seems early.  If you were in a series that removed
> PulseAudio then that would be a different conversation, but currently
> you're just moving a recipe from meta-multimedia to oe-core.
>
> Oh, and I recommend only sending the removal patch when the addition
> patch has been merged: too often I've seen the removal merge before
> the addition...
>
> Ross
