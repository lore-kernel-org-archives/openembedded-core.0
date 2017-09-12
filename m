Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id ECADD71AC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:32:18 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id s62so28231400ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=HiUgppZyf732dEbmCKyFZazuiionl7lLUsVI/CbRMkA=;
	b=19EVilH13ssx3QgqR5jovXVBSJ1NZKARMb1SGF7SkFSEKqi3+iJilsSSrue3u7EEe0
	lAgbr0Ue/rLX6YDzBmVzCCKCA+G52d8cXCE5vTQNpiQBamybAlWRvZ3Ke/6M59HKoclr
	D/XtA5T3leGbN2d57bdr3CPJ2a40CeHdW4Xk+WQrIDzDdlZkzFwrlo+2m2D9FZjHiXKs
	JuPk5mR2Fz17EYJH4NhSnAsS0mphKO28uiM0pDY+VUPhATM/DKvVM7f13+CMkjhy4DUg
	zShOHmziiImLKcCcwfuRS5O/U4riyi/tTiwPwbmfVeC96WqH6GaMfo4u30l4HTS1uD/V
	Bi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=HiUgppZyf732dEbmCKyFZazuiionl7lLUsVI/CbRMkA=;
	b=EEYKWrFwwP5x9B70GAwpWax8yd4jDuWRXp+ixSbW+Mh/2XfAWrrruqqzCHVUZRJuhi
	Y9KkhcYlkZ7lnftHmd/rIJ6VfZySrhotUIPgt8LdflCIQ18r3/U8z80zEauh1as1Flly
	QsEFimHZSy4VDtxUB92B3qW0Q+iMPDwFTLKq1ZOkToZdKbXTlJJvH6LOpNZoBE6fNGmX
	wwRPk9S0RQS24qp1/RBFV9ufvCPUpXc5oGoZGTVUdHrU7yM9Mfc2yTwA0AH+Vzp0Hqai
	koMFKNlwueAIQhER8RmxKt8D7H7r4s326c47M7a4owRyv4+kZU0D4FMnihQNdSCzZOrP
	LJEQ==
X-Gm-Message-State: AHPjjUhOlpWQKM79IpVb+kt+ST7obnPtlrHJRfjGXC1QRr+i1tXiZ7Py
	IPqcOJWXtJk5gU5KP30=
X-Received: by 10.37.187.203 with SMTP id c11mr12357985ybk.11.1505223139514;
	Tue, 12 Sep 2017 06:32:19 -0700 (PDT)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com.
	[209.85.223.169]) by smtp.gmail.com with ESMTPSA id
	t66sm3797885ywe.79.2017.09.12.06.32.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 06:32:18 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f169.google.com with SMTP id g32so29327921ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 06:32:18 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAXB5Ky19Q9NWJLUO+ndV23oS4zeHxxwELAESw1b7qEcuOOZb+Ule+IeV2rWYuLiirhxrk9fqEyuzK9h/9xajM=
X-Received: by 10.202.81.214 with SMTP id f205mr16442077oib.274.1505223137568; 
	Tue, 12 Sep 2017 06:32:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 12 Sep 2017 06:32:16 -0700 (PDT)
In-Reply-To: <CA+chaQckTsnPoOeup9v563r1p3Rh5Yn1kDy=4BFaJbT6JPn3KQ@mail.gmail.com>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
	<20170912125031.4009-7-otavio@ossystems.com.br>
	<CA+chaQckTsnPoOeup9v563r1p3Rh5Yn1kDy=4BFaJbT6JPn3KQ@mail.gmail.com>
Date: Tue, 12 Sep 2017 10:32:16 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoODpumO+yN7qmkEynJ46fZxC6nNW=+oPtnH20sMQT9aw@mail.gmail.com>
Message-ID: <CAP9ODKoODpumO+yN7qmkEynJ46fZxC6nNW=+oPtnH20sMQT9aw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 06/13] go-dep: Move bash dependency to -dev package
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
X-List-Received-Date: Tue, 12 Sep 2017 13:32:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 10:15 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Doesn't this belong into:
> [OE-core] [PATCH v8 03/13] go: split out go-runtime into separate recipe
> where it packaging change was probably introduced?

I can squash it; in fact the change was introduced on "[v8,05/13]
go.bbclass: remove some xxx_FINAL variables". Not sure if it is better
or worse in this case. What do you think?

> Also just RFC question, would it make sense to use:
>
> VIRTUAL-RUNTIME_bash ?= "bash"
> RDEPENDS_${PN}-dev += "${VIRTUAL-RUNTIME_bash}"
>
> instead of the bash dependency directly? If it's acceptable for oe-core I'll
> create change to do it for all recipe (I don't mind waiting after 2.4 is
> released).
>
> Because right now for reasons described in
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9217 I need to do the
> above +
> RDEPENDS_${PN}-dev_remove = "bash"
> for many recipes with many bbappends, for our distro where we RPROVIDE bash
> by busybox, which is good enough for package manager, but QA error is still
> shown in cases where the real bash is built before the component rdpenending
> on it.

I'd be fine with this. It does make sense to allow the replacement of bash.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

