Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 62B3B7873C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:02:26 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id j129so13436226oib.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=l9sWQbHPhg/UrDsMi9J5FGgOeG00TWHZCjZcr8Eb8zs=;
	b=Jm/zdll9izhzXFnsG9y4iYHGbel+zhy/79a/tjrNICfnN2JtNLxzj6dB0dnlXkU1q3
	+QM4xreAlQvR+l9ox5hlU+dgL4qiO3djMX2jB5vYcOZmUGjJ9OzZIhqPzEG+dZ+LMmpP
	7CF7P03XMJ7jmixfMFbXw2NTaszI62jwe4bULxov6dMh2snWHeGcNgFqo1Mil56IjD9d
	CxPp0nkos7eUA8/38o/m4vYalkBAk6WLuSM+BwXr/2B0B0ZwWuGXoBRXAIOaTuFGdRge
	NpzV9nBTHvj5DnOU8sK+VQi4XgTbEyrxhWDBmXAstc9ArbSI8b93nxP3G5Z/LaeHltTh
	AZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=l9sWQbHPhg/UrDsMi9J5FGgOeG00TWHZCjZcr8Eb8zs=;
	b=CwPI4x+nzBYqgL0OZoxa88x/f1WUX4igqd9+Dkpra6XUfRn3inRzU/N1/KELuK7ccc
	pC8KBB4AJ2mTIMs4S0MT4uV7vvq4UToxTY5ehPfV6nSqcCKxPAVKQA/wUdBnwC+uIHkP
	rkKpezs5T+sqelF471G0STfaYXyltISthT7yFiumUtuDJBNdMUaftmcDYGUyRCWyeeQS
	KbTCZkPEZJKjnUjthJydozQzM6zbXUKuRNNtXoT9ZiHBE6RBEg5qDTyY/C1lofGn5+fL
	/maUM1H7I7ciORfyiqG9zal2wL3IRTUQlSmnxJGIBs7SPoh+Qg78Z2KBPephoWaDTSOJ
	xbYA==
X-Gm-Message-State: AKwxytfflJmpkoaV2MvgoOa9qnMbBxFKwsWUStc3TC1rRBp6KdQlacRc
	L+y2tXo+emgIv5emuAKFDK2iq1AU
X-Google-Smtp-Source: ACJfBovbikQn+3FX0kYmkxLddL4DlFiDRAgmOMt1HtbrYbUOYgY2mG0n/Nsh7tF27YYeIlv8FTJYMQ==
X-Received: by 10.202.114.214 with SMTP id p205mr1377784oic.230.1516204947693; 
	Wed, 17 Jan 2018 08:02:27 -0800 (PST)
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com.
	[74.125.82.169])
	by smtp.gmail.com with ESMTPSA id 33sm2187262otg.41.2018.01.17.08.02.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 08:02:25 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f169.google.com with SMTP id t20so7898359ote.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:02:25 -0800 (PST)
X-Received: by 10.157.12.230 with SMTP id o35mr1553788otd.191.1516204943124;
	Wed, 17 Jan 2018 08:02:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 08:02:22 -0800 (PST)
In-Reply-To: <1f683220-01a2-c3ad-f5b0-47fe4e9abdc3@linux.intel.com>
References: <20180117004018.21928440002@auh.yoctoproject.org>
	<CAJ86T=X=KXEZ9BxNkkKcdbwNyqwNktwjohOenKdurt9u8ZfOTA@mail.gmail.com>
	<CAP9ODKq6hf=OChy2p4OP2T=mS1ZvZ4GyzL1cvn8LuFmvyQSsxw@mail.gmail.com>
	<1f683220-01a2-c3ad-f5b0-47fe4e9abdc3@linux.intel.com>
Date: Wed, 17 Jan 2018 14:02:22 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr4y_th2sh9fv5Rb0JQ1g99K0Asuy4okS6oNX2vWH9iEA@mail.gmail.com>
Message-ID: <CAP9ODKr4y_th2sh9fv5Rb0JQ1g99K0Asuy4okS6oNX2vWH9iEA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2018-01-16
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
X-List-Received-Date: Wed, 17 Jan 2018 16:02:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 12:00 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 01/17/2018 01:53 PM, Otavio Salvador wrote:
>
>> An important aspect is to analyze the errors in the upgrade process. I
>> went through all the upgrades and:
>>
>>   - go-dep is confusing. It failed but I essentially bumped the SRCREV
>> so I don't know why it failed
>>
>>   - cmake has multiple errors:
>>
>>     - added checksums in cmake_${PV}.bb instead of cmake.inc
>>     - removal of non-patch files by mistake
>>     - did not handled the -native recipe
>
>
> Note that the actual upgrade is performed via 'devtool upgrade'/'devtool
> finish' sequence. Devtool can amend the recipes in strange ways,
> particularly when the recipes are structured in a way that is not commonly
> used. Most of the time, from my experience, it does the right thing though.
>
> You can replicate the failures and dig deeper into them if you have time, or
> just take those emails as imperfect update reminders :)

I am not a devtool user, so I think someone more intimate of it should
take a look. I thought to summarise the errors would help if someone
wishes to look at it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

