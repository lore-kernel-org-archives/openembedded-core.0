Return-Path: <petr.vorel@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 49E647F029
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 21:51:30 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id w13so32282474eds.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 14:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nTqNv7hWSOijbXo6x/WEnz0dKODGJCCD6g1pa3+7pZg=;
	b=ZkurtaIBqeBdsmLAcd/KO1lu5c522c2TvC7slOocxwOGFyfANBphe85oJ2VyXdzCRu
	Ot5tcypV36P2Hsi6SwHfzcVWEuT7mdNKleTyQQmhEwOGeY8YcAiplacFNyVWyGz2A7ip
	IJnfkpsKGtz1pqwr2Z2dXChh1/x9sU2onbnYmsjCf4XCBIV9GK4wogpLu0ZP4WuEwgum
	d8/oJHx/vEwYqZcMryeMlxIqFBlAOFJN3XnRvJB5bQ38GLfctjJD9qQTrEopwYw9y1N8
	ZlCZzvFFTCpP9G6vix+Djkb2fV/U0divIPiccif6wf1vWZEZM1PhPgIb1JHdVNPDCkaZ
	3Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nTqNv7hWSOijbXo6x/WEnz0dKODGJCCD6g1pa3+7pZg=;
	b=Ca+PCnrmkOPO+78j2vqhuGfhm0MjHacpbqDZjQTL9QB7vWkmJDbRiS8tr4udCwHBi6
	ZxgzSNNN4MZS0BaaXd8ORrTWbOZpuo7gvKsHu9D0zAlAJ1YRwnhXhDH7ENpnu2W1I7Ay
	cKAPLB3BBzwhGbiKgEayInJlOpR8OWMrtUjHmFoFBoUUFXbV6w3jQ4YR4IFo/Od6azv4
	2OXnXLCM1Zl58MfyGRfeRs7n+/wD0I7HHGEMgIkqEYHw46jiflMr0LLrIAU2+w43xhOI
	MLqlnUQn3XSHsRI6IUbkzwApVpHyHb8XyD54b4Kk7WjjPRgPrQ7FAZ0wHLESm+8fyT1p
	UjBA==
X-Gm-Message-State: APjAAAU8NOMvz7N0dFM/Us85txSh9lUfRSB0n7PraZ2YsO2tH0yI7gAX
	td7kjbNGc3aqOWpgJknd4gy+Ean+6/4=
X-Google-Smtp-Source: APXvYqxjHeAG8q9K7Dky2EWVx651IZqscx1BNYuXyYE1NfRu6w1ENs9aKfebSUywz3ZVTbm7eb74RQ==
X-Received: by 2002:a17:906:5384:: with SMTP id
	g4mr37341689ejo.241.1563486691846; 
	Thu, 18 Jul 2019 14:51:31 -0700 (PDT)
Received: from dell5510 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	x11sm5918799eju.26.2019.07.18.14.51.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 14:51:31 -0700 (PDT)
Date: Thu, 18 Jul 2019 23:51:34 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Message-ID: <20190718215132.GD26895@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20190717095039.121044-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190717095039.121044-1-hongzhi.song@windriver.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: getrlimit03: adjust-a-bit-of-code-to-compatiable-with mips32
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
X-List-Received-Date: Thu, 18 Jul 2019 21:51:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hongzhi,

...
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
> @@ -0,0 +1,62 @@
> +From e79652a3839869b1983d65999e5d5dcb50bc9cd7 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Mon, 15 Jul 2019 03:39:06 -0400
> +Subject: [PATCH] getrlimit03: adjust a bit of code to compatiable with mips32
...
> +Signed-off-by: Jan Stancek <jstancek@redhat.com>
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)

I have to say I prefer policy when only build fixes are backported / added.
(approach which e.g. buildroot has). Having many patches (25 atm) makes updating
a bit difficult (ok, not that much, 'Upstream-Status: Backport' shows what has
been merged since last release) and sometimes brings users patches which weren't
accepted by upstream (your mips patch [1] was not accepted [2]).

But I understand that LTP 3 months release cycle can be to
slow for some LTP users.

Kind regards,
Petr

PS: I'm slowly working on fixing all musl issues in LTP upstream. It's a long
term run but were moving towards that goal.
Patch "build: Add option to select libc implementation" [3] is a not a good
approach.  Instead it's needed to find for each failure why it's not presented
in musl.  Mostly because it uses non POSIX features or deprecated API, which
needs to be avoided or used kernel headers where it's available.

[1] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
[2] https://patchwork.ozlabs.org/patch/982194/#2012168
[3] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch

