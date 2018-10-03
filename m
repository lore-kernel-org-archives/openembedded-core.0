Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C0E587944A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 16:13:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 206-v6so6297743wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2018 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ahLDUmA1cqo3w5ghyJWal7fC/1hNDWoFsEL++CybrdQ=;
	b=ZbSgzX69JuV+CF1D0QdVdyiWOiApTGV+/tsO8BsT+tfvVj2mB13c4kTOr0L6rKy0Cs
	4vDPLRAhb7R0k1OVLJJzTDNNXP4dGjxZBe9soY62ADI/TD6hdGR3sOTGY9OiEdtISxSC
	msBuEG9ZfIhXx8Vl88+jPrPXQJSQj6k5v7Whw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ahLDUmA1cqo3w5ghyJWal7fC/1hNDWoFsEL++CybrdQ=;
	b=TCNaGxyJtO+zx1JJjF5wvgSHM8BFl5YG/Pzip6M+928Vr3pxTG0kxpI/eS+7mfTD81
	diGUKwFt/Fk/y0Ox3zFPXpDKVFtMKa6Ra7oEIA2uDKoFbG0YeYpCwEifXoAPyEDLTmZ3
	arKxJE093urYM11fH/59FMYdeGjmPxhDuK9lMSphlAK+QOfnEpXEfK4RqX2TEHwXhRG8
	pcGBe8B3wE3ZkVFrbJIW2MrnMV3duTPQ/yjabeceTv+fkUYTfaKcJqtoKu3QK19RNC5s
	ZLABSeYN4Y03YCpGqlTnYssUl8Lmrqi7DWvf5zNih+u4diferHH4vGCs9geKABhHW6mJ
	brMg==
X-Gm-Message-State: ABuFfogB5nvJb/p6ORihY+41i7Va8w3o6Drb1JREDlsjvTKF0rd/lZY0
	ZjjZrVrEtJ25bpQqT55Ws+HW7A==
X-Google-Smtp-Source: ACcGV62cFiNcnSkfWeyQ5ytSxbV7BULnxAbVozjU2QQL3FjKSWhQDYoOQEfjk1uXDYtKBBvpSEeGiQ==
X-Received: by 2002:a1c:7c16:: with SMTP id
	x22-v6mr1934706wmc.16.1538583225299; 
	Wed, 03 Oct 2018 09:13:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a105-v6sm3688301wrc.23.2018.10.03.09.13.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 09:13:44 -0700 (PDT)
Message-ID: <d30408c2c0f343fd1bbaaef8006820bfb6b7c686.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Paulo Neves <ptsneves@gmail.com>
Date: Wed, 03 Oct 2018 17:13:42 +0100
In-Reply-To: <CAJO0J4gkXiv++K+aTHJF2O_Hq8MFDKPCpy+vWz6Ym1ZrLY00Bw@mail.gmail.com>
References: <1535651376-25467-1-git-send-email-ptsneves@gmail.com>
	<1535651376-25467-4-git-send-email-ptsneves@gmail.com>
	<a4268dca5b5db6759cce2f089f5065708112082d.camel@linuxfoundation.org>
	<CAJO0J4gkXiv++K+aTHJF2O_Hq8MFDKPCpy+vWz6Ym1ZrLY00Bw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 4/4] testimage: Moved write_image_test_data to testimage bbclass.
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
X-List-Received-Date: Wed, 03 Oct 2018 16:13:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-02 at 10:19 +0200, Paulo Neves wrote:
> Would assure you if it generated the test data on image creation
> *and* on test task?

No, it wouldn't.

> If not please describe more or less how I could collect which
> variables write_image_test_data depends upon. Just a high level
> description would do.

I thought testdata contained a filtered list of variable keys but it
doesn't, its a complete dump of the data store with some variables
"broken" by the removal of TOPDIR. My proposal was based on my thought
that it was filtered so that won't work.

> I have really been in a good spirit to get this topic merged but I do
> not see a clear guidance for me to fix what was clearly broken.

It is not clearly broken. Its broken in the way you're trying to use it
and expect it to work.

The usage of testdata is alongside the image that is built, they're a
paired item. The image and the testdata go together. Either both are
rebuilt together or they're not.

Personally, I think testdata should get filtered to the list of
variables the testing code really needs, not just a dump of every
value.

I thought the tests had markup to indicate which variables they needed
for that reason, so a list of variables could be constructed. If we did
that, this would allow us to rewrite the file (and rebuild the rootfs)
when the values changed.

> Actually the current code put there by intel should should be
> reverted in my opinion, as it broke all the controllers besides
> simpleremote and qemu.

I would very much like to fix that and your other patches in this area
are good. Unfortunately you change a lot in the patches in one go
though and it was too difficult to review like that.

If you were able to split those into smaller pieces that make one
logical change/fix in each, that would help in getting those ones in at
least.

Improving the test coverage so that things don't get broken again would
also be very helpful.

Cheers,

Richard

