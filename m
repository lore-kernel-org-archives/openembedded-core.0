Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id ADE846D572
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2013 17:38:18 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so2609616eak.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Nov 2013 10:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Bd5xROMmdajiJAbJpA401PMx/ZxgxhqUxevKbrUabJs=;
	b=cbqudKjBUqWRqqd4v4xSSWONvMfBkxsGBnfome8HT22qtReH4o3AHwHDnkT/4BfvB8
	sFbmwBPdGUNVL+IAylymrImXTJYTDsIWxG7Xl/GX8L9w3mV18OiofBHUL/FUGZKhxDtu
	uju4ToYnVSX/yGNaBzTk4/nGZmgVBSm2topZr3yeYwAgHbtFwsXABNyO1TUKelFWY/iB
	lUR9tkvxYySemIA9VBP0daSPrqSisxPw51QLDOIxp9vx10n57jv5TmlHyziq9X/T/j5/
	PoEzIMeLtjjVi46ZZqCH3CrUc6KquTX2LODGOEhIIYQkzbl/mOtTLoIWWFB9JrshZ2Ol
	qUoA==
X-Gm-Message-State: ALoCoQnIBw2J9vY6lGTr/u/duvRj9rrTjXg77p/tLMHTFfkU3KC9k/q9pmn5FUQjnXA85FARKSdG
MIME-Version: 1.0
X-Received: by 10.14.214.73 with SMTP id b49mr558059eep.89.1383413899874; Sat,
	02 Nov 2013 10:38:19 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Sat, 2 Nov 2013 10:38:19 -0700 (PDT)
In-Reply-To: <5274027B.5060106@linux.intel.com>
References: <1383237932-13177-1-git-send-email-trevor.woerner@linaro.org>
	<5274027B.5060106@linux.intel.com>
Date: Sat, 2 Nov 2013 10:38:19 -0700
Message-ID: <CALmOhg=WORvyaqcD_qn8t5mbR0s8FzuyE57xL0ogJCO5x_gyKg@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runtime package management: ipk/opk
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
X-List-Received-Date: Sat, 02 Nov 2013 17:38:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Saul,

On 1 November 2013 12:35, Saul Wold <sgw@linux.intel.com> wrote:
> This says what you are doing, but the question is why is the change needed?
> It might be obvious to you, but not to others.  The base-feeds.conf file is
> provided via the a distro configuration, so it's not guarenteed to be there
> for every distro, so I am not sure this change is correct.
>
> Also for future referece the commit message should follow the commit
> guidelines:

You're right, this patch is messed up.

Thank you for the feedback :-)

