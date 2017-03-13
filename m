Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id C8DFD776C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 17:58:11 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id m124so81526685oig.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 10:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=OieBy2axpVsC8389igDrfx8qVU1kU4vjW11lFobNOVw=;
	b=SawWjSShHUywijSWDUqjpSJVxqeRnZMdN7AaJHU83OMTDqYoWv9JQxr8GvNsf58zHQ
	FkO4w/caSWF71RAQC6Y2+j0pivqGxIpOlVC5xn2pUthnO2fv9VX9xNF5At0WL+vl6fGp
	tbQCXF7qUqOZ0ienLcp5x7TpR+od7bhrdyz9cXdzYeAfiKwMs1oMFT0PWMf0liN5jRax
	SlEm3W0BDMtDWtZiO7nAv3PaZyeryG1Oa8xUZ84L7888z4eCsGklGfD1yYNOIaiV0EVK
	7qZxbZUxzU/QLUbUKcNsz9UZq1OApx4xjAMoiHcr3q94lXXdJtL6ouC9/Xf6XTiUOUtR
	IP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=OieBy2axpVsC8389igDrfx8qVU1kU4vjW11lFobNOVw=;
	b=KQdGKhwPfVG+InCZzxwdMe6FrROCcAxjLW6OlxQzBw5n+mj01OJ4h29dG9f+k/ijQ2
	8xMNQFmhna9/6w4uqDCkuziyeBd8Xn+92KlPAR2qmoHdQYCcS9UEf5vCUa0mJ8ik+N+Y
	iJMI6gnpFepPztsQNnhx7WyuwYFgVcrHt6WhgFKO8/IAw4eXAwEN73rSikmu89/LlDyO
	xYne+fp1yhIQbIHscWTv9mAy9UMjWJqd7yY9fYv9aemOcCwNSIrLKybxS1UTV9tNSC4X
	koWHV78vQTvj68oHYA9oOta4O/pCMbaAADZiClG7Znni4/V35B1P7wveq7XGYJuQNne2
	2kYQ==
X-Gm-Message-State: AMke39kBwAuabpRzFcYTPHo0uRdIR8OZeRwAoWXlahfN5haXGSERhAHiIDg0v/DRDXUIlw==
X-Received: by 10.202.244.150 with SMTP id s144mr15733131oih.143.1489427892524;
	Mon, 13 Mar 2017 10:58:12 -0700 (PDT)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com.
	[209.85.218.42]) by smtp.gmail.com with ESMTPSA id
	c126sm8259406oia.5.2017.03.13.10.58.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 10:58:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f42.google.com with SMTP id 126so81525220oig.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 10:58:11 -0700 (PDT)
X-Received: by 10.202.180.85 with SMTP id d82mr18493087oif.210.1489427890960; 
	Mon, 13 Mar 2017 10:58:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.26.5 with HTTP; Mon, 13 Mar 2017 10:58:10 -0700 (PDT)
In-Reply-To: <20170303221947.17487-1-raj.khem@gmail.com>
References: <20170303221947.17487-1-raj.khem@gmail.com>
Date: Mon, 13 Mar 2017 14:58:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrS3MX=KHTyNum=sqYGReDaXVaRQ-1vL=ZifkoJfe1cPg@mail.gmail.com>
Message-ID: <CAP9ODKrS3MX=KHTyNum=sqYGReDaXVaRQ-1vL=ZifkoJfe1cPg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 13 Mar 2017 17:58:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 3, 2017 at 7:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * This is converging the recipes for go from
>   meta-virtualization and oe-meta-go
>
> * Add recipes for go 1.7

Go 1.8 is out so I believe we ought to move to it. Also one thing
which need discussion is regarding the upgrade process of Go recipes.
The 1.8 release is the last one supporting ARMv5 and this means some
reference BSP won't work with Go 1.9 (QEMU ARM) without some hackery.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

