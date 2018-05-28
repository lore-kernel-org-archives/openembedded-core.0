Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id C957671A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 05:23:37 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 14-v6so1359345oie.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 May 2018 22:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vQtO4Fcwr+Beih3ichBvYl/rcAHX0TnPUdcK1SbDXYM=;
	b=MlJJ15t2ZLS7myj/8/DVeyg1xLiYNJgBjL4Z5iOpY36OhW/DTvbkaGTyZWQj9FzBql
	8KfeXtPV9bBEejykyvheGWRrTlLGmSMN7E8xa3UgoCkWk+Bc+GCfdjsAudXKtAVWyFOp
	DUZFOwK9/aQACiIQri9VMdAcfq55mFwDeToS2eIPPFDEmCPSm9jxeJLXDpFUgPk6oNFY
	J9+OatBzzQjC4TPs+1qoRyX0liHKPZ2HA9hiP0ns5Obvx05NzowMWMw2W7QbNwLG4/aE
	+fca0fyuv6ioHPkFGkchbvXfGt+4usdcnDFYwfkdW4rQoNUJ5UyZHvIpZZxSnsiosYnd
	wZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vQtO4Fcwr+Beih3ichBvYl/rcAHX0TnPUdcK1SbDXYM=;
	b=s0q3EXFTEGMZk2YwYT2eTuvAG7Dhw44xcDpQ6fsf/1wZnY6CEYBZMBiDnzvnaBsXO/
	wVCK+A7VpbiGj2KxVeO8RaGSsQK5Y7zMm87QvWKqe1JthstYItceF/sGDDH3tV2sMGlV
	MrCeOVglDoP7CC4xQq5LT3juAKHrFRY05BcEK1UoCwvIukPso3Kow1FJDJEjTq1bclSX
	uborAyNtbPzBxMxt89RyxM71aichj+UCoH5QFO+e2O2AQJELFSo+chqz8RHvucLPDtc1
	e/lBbkovJnRp2pniT68FMjk9rS/Q3BzXncExqKMd9uNqdQKKD6SLkWNPNpvjWlUY2urs
	hQ0w==
X-Gm-Message-State: ALKqPwe53Whc6Sc2nVK5k+XAtzZ5Eg3N90iYnwoYoIpaBfenjVPNPHC9
	jblW2sp35wNqY5iAshGqADLt5AreP6ucJ2Jx3IQ=
X-Google-Smtp-Source: ADUXVKIRr84K1L5J+jppzP7qAdlOhFLXmaaCYy+8KbK7PYJbxSula39hAJ8fa7tSb1liG8z+VJkZeIwAKpx7uHKZ//s=
X-Received: by 2002:aca:b78b:: with SMTP id
	h133-v6mr6164121oif.54.1527485018490; 
	Sun, 27 May 2018 22:23:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Sun, 27 May 2018 22:23:38
	-0700 (PDT)
In-Reply-To: <7253e4cc-4ef2-522a-df37-383b98cbc81d@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<56d696e2a24b5ba066cbb2a02af31bb4496eaa07.1527216285.git.liezhi.yang@windriver.com>
	<055a6008-6237-5535-61c5-60162c3e7729@linux.intel.com>
	<7253e4cc-4ef2-522a-df37-383b98cbc81d@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 May 2018 08:23:38 +0300
Message-ID: <CANNYZj9BPkpwWb5HsKenfM0Qm7qAH8A2T1je6vPai0_izJ+dgQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/24] base.bbclass: Add buildcfg multilib values
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
X-List-Received-Date: Mon, 28 May 2018 05:23:37 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-28 6:24 GMT+03:00 Robert Yang <liezhi.yang@windriver.com>:

> Thanks for the reply, but I'm afraid that all_multlilib_tune_values() isn't
> suitable for this case, what need to display is something like:
>
> lib32:  DEFAULTTUNE       = "x86"
> lib32:  TARGET_SYS        = "i686-pokymllib32-linux"
> lib32:  TUNE_FEATURES     = "m32"
>
> But all_multlilib_tune_values() returns all values, e.g:
>
> DEFAULTTUNE       = "core2-64 x86"

That's right, but you should still use get_multilib_datastore()
instead of setting up localdata manually

Alex

