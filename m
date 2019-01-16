Return-Path: <petr.vorel@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id E97EF7C0C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 15:28:13 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id f9so5707904eds.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XWiSpw6Ax/ilkcN6QzYnzjGwolkCROcnNiBihXo+SkM=;
	b=kJOmPLaIEUNsvgPX1ITuQ68Gfajxb66YhmofU/COAJEKGGX+fbhH4SVaOjJvwgUKSq
	5NjQzb4YMUGazXRSyAZOCl/5jXVcy4HLbz47MM62cqAUHlBcDRt7jhHUjHHj47iyF3oL
	QFddwN9dbFsVoc94mu8iIvvRAF7Lvgr7GYalwLIAQmugEvCFlgrrMry9X52DR4StovhQ
	fJ/VH6A2DfLaeRNXmAWAvj0+Of4x7OUJSdW/XLEpnVOOZM7eOwSdRUkJFINDAMEfWAN2
	ErAErFwn7BTbBdfyJ5KGMrP66zDWKfQ4bbkfEHtUQfJAPkdYtZ1GPxtPwIEKRgJgc8DM
	Pcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XWiSpw6Ax/ilkcN6QzYnzjGwolkCROcnNiBihXo+SkM=;
	b=c1c6rBStxiNTraSl9A2ZLVOsQ8TRYQsjhFA/zH9IAv+BV3bNlqSSAAdIhLrTKo7Ceo
	lSq8yzXAS/Ur4O/2zbTtSOzqyVHr/Ek7T5vQLhT5r4AX1s7MUIgxGzLMBz5Bb5SLimWf
	QoTyHdoz2pBcZ7DId/5nInY1rIfI3r5Vnu0yXDSCH98TOVpE4s5dtlR0MoCRgilvEaXm
	ORa7JbFRmBWNLU80NISsW1zhNcutUmA0612ugbwFiZwch72akHca6/dFZFCbnGXPW3m0
	nQm/FLUaj75xrcjZ+aSHNlnK66z1tDGM6FwkhhI17/3rmVY+89e/YSUZrSzzJK7OE8by
	H/nw==
X-Gm-Message-State: AJcUukc54nQxA03HIqtSGD0MGmnuaDTiGxm06OFaFlTKFNSAWB4ruRUj
	/iv0PlgmqHykw6GXjKlX1d0=
X-Google-Smtp-Source: ALg8bN6vzPigbH3AKb3j4T9Dyp1gpbHuEhMKyRFmkEH2J9M697hSn3vZsh+II3ZUhbCc3gl6b+h+bA==
X-Received: by 2002:a50:ad97:: with SMTP id a23mr7553665edd.128.1547652494670; 
	Wed, 16 Jan 2019 07:28:14 -0800 (PST)
Received: from x230 (gw.ms-free.net. [95.85.240.250])
	by smtp.gmail.com with ESMTPSA id
	i46sm5546359ede.62.2019.01.16.07.28.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 07:28:13 -0800 (PST)
Date: Wed, 16 Jan 2019 16:28:11 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190116152809.GA407@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20190115230612.18947-1-petr.vorel@gmail.com>
	<f945d8518ac05d37fbba3a134dc09d6c89acbc7a.camel@linuxfoundation.org>
	<CAMKF1spaQmVW_=5bgus7nkw5Q9vU+DQH+qTzMj27i8omxg1DwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spaQmVW_=5bgus7nkw5Q9vU+DQH+qTzMj27i8omxg1DwA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] ltp: Update to 20190115
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
X-List-Received-Date: Wed, 16 Jan 2019 15:28:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard, Khem,

> > Thanks for looking at this. Unfortunately it failed in testing on most
> > targets:

> > https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/181/steps/7/logs/step1b

> > (one failure given as an example).

> > Warnings as errors are good during development but sometimes less
> > useful during release due to the variety of end user configurations.

> with glibc 2.29 in play
> http://errors.yoctoproject.org/Errors/Details/216829/

Thanks for your reports.
Is there any way I could easily reproduce it?
Some config I can download?
I'm testing with default config.
I'm sorry for dummy question, I'm more experienced with Buildroot.

Kind regards,
Petr

