Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id D2F3377D12
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 02:09:00 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id n18so15057077oig.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=PGaA9Z/7qyWmNlNKxKgwTJzeZrVZIzQ0Rr0w8tC04Pw=;
	b=IUSmz8vDXWg5pno8+ZMVPAnbfFVKseQu39/7T3VqA/PBpLVF6nodYhrIJmZzirCGT6
	bCB0vv8klia6V8Gc7a+ghmclWCG5kam6YDsYb2QNchox3qaf2K1emQUP+tiRa67YJ+2O
	xnRcvsLZjsly5pWRi+wByZIpfRPsuAkEDZ0Q2HSh14+cv+5v4Ih3UPjfGpVmfGPhTVJa
	kSmkCvtsQRbGibLGGxUW2mX07IDiaAfHTXh5jz46qR7jELnYA+s9Xe6DcVS+cRklF9FS
	JYWfbdKkr6E3VukeAebwJRj3DPA3tNVAiB/5gJa6dDnLLp9TDV51al2m8yxEWa86tpHv
	TR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=PGaA9Z/7qyWmNlNKxKgwTJzeZrVZIzQ0Rr0w8tC04Pw=;
	b=J5tpHrk29kZHZfdz2PNMCAd9iX8QSJrIWKY0VVVsI5pKAqp+Rs1sF7OUFrrsqmdxOy
	xH/GlMrdnBRCoJZTMlpvudknBDjdr98vi1An4R4Tw8A2SkOeTeXvjWGS6i1HAnXnc9Nu
	dGPWlyvGdbtw0C9N9rknAuv8uPPykdMxnx5GsEuaZG1X9Z98wNuo0xfVAVSOIwmg3miV
	SbqXElJLa9fcPEQqzuP6ZXRDMcvlLSeODy0DztX73RdnW4wVnkrv5wq866JmB1Ii+DPV
	JRUOW6pielnn7nXeFz3df5nH4q36G/6D0bkU9/FTUk5jVf43PvQkG/zDYy9Yt2XtHfLw
	2stw==
X-Gm-Message-State: AHPjjUgck9b6Ge9jOx5KfLvhPp6A94OHcvAj16UnV8//Xw/oX7wafV13
	ElWrHJCjMeFZJcHQvfM=
X-Received: by 10.202.198.131 with SMTP id w125mr2397531oif.120.1504577341497; 
	Mon, 04 Sep 2017 19:09:01 -0700 (PDT)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com.
	[209.85.218.43])
	by smtp.gmail.com with ESMTPSA id n5sm9287144oif.25.2017.09.04.19.08.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 19:09:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f43.google.com with SMTP id t75so14952018oie.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 19:08:59 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4RXWz4iBaz+OT3g0dGbBZ0UED0D8Wp+IY2visxMaToQHVzkvg1cR/FOX1VpQbONE6C9Wz26RBoqsOhF6wqMc4=
X-Received: by 10.202.225.3 with SMTP id y3mr2088573oig.32.1504577339574; Mon,
	04 Sep 2017 19:08:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Mon, 4 Sep 2017 19:08:58 -0700 (PDT)
In-Reply-To: <20170905020455.2381.16814@do.openembedded.org>
References: <20170905015722.16993-1-otavio@ossystems.com.br>
	<20170905020455.2381.16814@do.openembedded.org>
Date: Mon, 4 Sep 2017 23:08:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqmpV0jhZ-BsatebkSZD_=a-yunOEzh-gDDs_MCv4JQkg@mail.gmail.com>
Message-ID: <CAP9ODKqmpV0jhZ-BsatebkSZD_=a-yunOEzh-gDDs_MCv4JQkg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGtlcm5lbDogTW92ZSBEZXZpY2UgVHJlZSBzdXBwb3J0IHRvIGtlcm5lbC5iYmNsYXNz?=
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
X-List-Received-Date: Tue, 05 Sep 2017 02:09:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 11:04 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: kernel: Move Device Tree support to kernel.bbclass
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/8699/
> State : failure
...
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at dd75644db2)

It does, but it depends on "kernel: Stop using update-alternatives" patch[1]

1. https://patchwork.openembedded.org/patch/143549/

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

