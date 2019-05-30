Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C62A47E4FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 14:06:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c2so4303376wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 07:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=P3pr0v+5kaeu4AjlPNpGHfEFjgmWAZXsb475vjVyB+o=;
	b=W2+VGoCXrR4bwoPQIDaXqxezvO7OP1BixSxUpLLZiimpTw31vokIwF2shQzUa4fAjR
	cFYit594G4tlIr176RhNWMaxFHT8dnDqphzNYZWDlXoAJonMP1lx2uQ4E/n2xCkGCycX
	3/WvB6Mq+heWBnoa0Z/Phglr/WbpBScWqSbck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=P3pr0v+5kaeu4AjlPNpGHfEFjgmWAZXsb475vjVyB+o=;
	b=lti67b7T1YYSbzFRhgdohzeUr9LEgYT0de5O92jg943wTQtoYD/42vlNWotWpSLuYz
	h/XZhb7ioR4IVY9s+XEhsv3QmApVfXpPe5yYZGvPXDQsbNmsnkhgRzDGWLsc0EBOdaeU
	ggdhb5uxJk4YMf3fDVNgCKtJ99RAvtl6lABIjHxZfX3NH/TsoXt5OizOjdbN1FzrCNmW
	4xqTseL0bcthlrFRHBmgiI7aTQj22vOz3kkQPvuvA+kNq6JY1GosLfB+kgWjKFr7nMIo
	Bj20a5W491nf+GLjmQso/tkfnTSKSXCM5d7bSfhQSncMMcarlBiWZhbSvAR1D8lD/zDe
	mgDA==
X-Gm-Message-State: APjAAAWt714TDczvR5k2/6kA/fovbWXfZOU/TiaC60BUzu8FxGAuzNsE
	t1jBXrZce9q7fd1UI30s3FgF2Q==
X-Google-Smtp-Source: APXvYqzf7yNz0lZif44t5A+ChKF2TcFB+/nRb2AIyOzjYDPaJABcxBzzpGoOnF3EcRi/EIxBF3FeQA==
X-Received: by 2002:adf:f38a:: with SMTP id m10mr2825721wro.81.1559225218538; 
	Thu, 30 May 2019 07:06:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f197sm2924090wme.39.2019.05.30.07.06.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 07:06:58 -0700 (PDT)
Message-ID: <e7536283bb0d7d255826585a3222aedd0d7950ad.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Adrian Bunk <bunk@stusta.de>
Date: Thu, 30 May 2019 15:06:56 +0100
In-Reply-To: <20190530135949.GA318@localhost>
References: <4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
	<20190529230203.GB16075@localhost>
	<aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
	<20190530135949.GA318@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Thu, 30 May 2019 14:06:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 16:59 +0300, Adrian Bunk wrote:
> There are also some other related topics that might be considered
> on how this should develop long-term:
> 
> 1. How important is it to support host distributions that are not 
> listed as supported? Not limited to uninative it can be painful
> adding support for new distributions to stable branches.

The distros we do support were chosen to give a decent cross section of
the Linux ecosystem. Whilst not full coverage, the delta between those
and other systems should be relatively minimal as we have both older
and modern in there.

> 2. Does using uninative by default bring enough benefits to
> outweight the problems with new host distributions, or should it
> become non-default in master?

We test it heavily on the autobuilder and also benefit from it
massively there so in my view its a significant win for us alone. We
chose to share it with the ecosystem. You're not forced to use it.

> The sum of the two points above is especially problematic:
> "re-use of native shared state artifacts across different host 
> distributions" is a more exotic feature, and effectively supporting
> this for unsupported host distributions is the problem here.

Which distros are you seeing a problem with and what kinds of problems?
I'd hoped/believed the problems should be relatively minor unless
they're really old.

You could also just disable uninative on specific distros if that was
needed.

> 3. uninative is so fragile because it tries to fix the C library
> only. A lot of problems with host distributions (not limited to
> uninative) would go away if one host distribution would be picked
> and provided as container for people who are using other
> distributions.

We could make lots of things easier if we mandated a specific
underlying configuration but that isn't how people use the project
(including commercially), or why people are attracted to it so whilst I
understand the attraction and it would make things simpler, I don't see
it as a viable option.

I am curious what issues you're running into specifically though.

Cheers,

Richard



