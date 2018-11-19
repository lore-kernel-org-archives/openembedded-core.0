Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id F09916B99C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 16:33:32 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id a205-v6so9169091itd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 08:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=tCjqoFwuFcPuks8fqjnKwGpvuuBIjErpNZEV8ELytXQ=;
	b=YjQA85iEcazz5XeUZcTX71kgKt5Ob+jp1viFcekwymNqACkDyK/flXLB+l0dLo9DgG
	vSYNDb56MIB/xkKmoj+Ydxwzsk/N3rdbHFHxG2Uxa+ukidkE5HCJvPlo1EaOv+Vuheqm
	+u6eh4sNeqv8HQfHYTpLu6zPBg/2k5zN7AsSIxutc26NnKN2c+SZ2Le6vtA18aS0o5pV
	Emm4cH9lZdFnTY1OE/EnId58OFwJaMmjsuLvbIwog/+o8H72EpXKhK17VsAJnuCLvscb
	CXtYJXUPamFpNx5EY8YIDrwo8vjp/AYiTlSH/tqjO+i5gJfgBWe7Ak7MMfCWWaBE637t
	rNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tCjqoFwuFcPuks8fqjnKwGpvuuBIjErpNZEV8ELytXQ=;
	b=piVEpA//ZLtmpWYr2jT63Z5NTVaAQq/hifCfyc9aWcv9l/P3uXkfzPFnC7kHn9U50H
	L84pzYBAkhRJSO994pXZdSOWlLvo7jJl+Xi8muDPPd730JQMAOP4oSGMknXSqdOMcNwU
	6vFL2Ooqh7tKgpuY2Kaso+ieop6Z4T+17TzyMekN3jtK3GS1AUljA/qJ7cQ4/yJXBR+J
	vl50RxCXx8Jh4T0Y44W9Om1yFR063CdGEdqFwR8A52U8ACZ11rea/ZiHk4gKkBBaPuVd
	Pjz2720ZopqUCszMSbbsftEviSbaRUqrx8wJSccW2rbN4X3wX8Svodu15biyp0Tx9M6B
	5o3w==
X-Gm-Message-State: AA+aEWbKfZIJaDkdQG5ZLIfaVncyw9nPTPbTYUkJE9DSU87kqDOZ7m/O
	tBvDdEZAGC6iUspxh2SOYEOPaDwSj0w=
X-Google-Smtp-Source: AFSGD/VEyQJB0ykglWLRD2AP9neefO+FhHMU1Hupsq7v7eDCZ0XX6VGRMoumeBSZN9J6xL4oY0ZhWA==
X-Received: by 2002:a24:9a84:: with SMTP id l126mr9812934ite.77.1542645213754; 
	Mon, 19 Nov 2018 08:33:33 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w124-v6sm4416377ita.0.2018.11.19.08.33.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Nov 2018 08:33:32 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <4ca98c687b24ace8bd7987455c8aebe0967dce93.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 10:33:30 -0600
In-Reply-To: <895f07363a38c1be4c3d584547fffe6e8bc7b0a3.camel@linuxfoundation.org>
References: <20181115191442.24106-1-JPEWhacker@gmail.com>
	<20181118191914.14495-1-JPEWhacker@gmail.com>
	<895f07363a38c1be4c3d584547fffe6e8bc7b0a3.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.1 (3.30.1-1.fc29) 
Mime-Version: 1.0
Subject: Re: [PATCH v2] classes/testsdk: Split implementation into classes
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
X-List-Received-Date: Mon, 19 Nov 2018 16:33:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-11-19 at 14:25 +0000, Richard Purdie wrote:
> Thanks for reworking this, it does look a lot better and should stop
> some of the bbclass proliferation we're seeing.
> 
> I assume all the code was functionally unchanged in the move?

Correct.

> 
> On Sun, 2018-11-18 at 13:19 -0600, Joshua Watt wrote:
> >  python () {
> > -    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
> > -        bb.build.addtask("testsdk", None, "do_populate_sdk", d)
> > -        bb.build.addtask("testsdkext", None,
> > "do_populate_sdk_ext", d)
> > +    auto = oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False")
> > +    bb.build.addtask("testsdk", None, ("",
> > "do_populate_sdk")[auto], d)
> > +    bb.build.addtask("testsdkext", None, ("",
> > "do_populate_sdk_ext")[auto], d)
> >  }
> 
> This doesn't look like an improvement to code readability? :)

It isn't. I will fix it with v3.

> 
> Cheers,
> 
> Richard
> 
> 
> 
-- 
Joshua Watt <JPEWhacker@gmail.com>


