Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
	[209.85.167.177])
	by mail.openembedded.org (Postfix) with ESMTP id 408BC7C629;
	Thu,  4 Apr 2019 10:50:38 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id 3so1481814oir.7;
	Thu, 04 Apr 2019 03:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0P5kR6jhn4WNSQYVMDXuSXY3ENFBvxHRUqq3jwVaoVI=;
	b=e7IrthM9tWhHhCWswMrpOzTveLh7FlZvGEVa4b5qRQmQdDA+MpqErfuVYIHTTb57uC
	QTJ3Lgfsmj1qWwlA0QYf4gHSH/mZMRSB/gY3ta57u9odewT4M2dOE893Zbs90Qu1B1AR
	4pkDhPjp/BXt3VfrywsssIZObmmmsuVlpXWWIMErzFOu7spflnQe4C9DdLwAXqkP/zGY
	nqGbqKDmX5sda/gv5lZoXbrzCD+fRzEdRxHZ54QnqRlVPzwjz8s+Tbejr2Jj2S9kkCei
	We3m+63C6MB9ciHsDBbJ1y6QGloNiGch6Rt0VHC+teQXmv8KlBMwxiB0KR/XZh0ZAQWg
	LFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0P5kR6jhn4WNSQYVMDXuSXY3ENFBvxHRUqq3jwVaoVI=;
	b=CGGfgSjsmRjwS5VIdUg71jSYnrkB+iEkFzUNB7VRITD2vAgi4uL7smGP7oRo9Bu3zb
	M8DcIb9rEcBouWPE2kRzmQqvLrqykg8YBu3xf2Aqs2dUnAe1VAWgZvAQ+1CIzsl07j75
	opd8xVYBpkvUyGKBJWdMzxlrHjYE7h0LrUIaXzRXE9CgL0hTv6Ad37rHD0pf2A6Tx7LU
	wTDFfMEYYRET/tHtkzz/5GXdLxtKGzuSdkyym8ivBUNA+9L65ctSfXVFBHSHMkLqGaD8
	7ChW2zqSPOyen5PpO2A8WjgOzHuo5+OIINwh69Bfu4lTXvO3cQxSLG4gHzPcMtRfOVcA
	n3eA==
X-Gm-Message-State: APjAAAVCfA5M5g2krJplRhU3BKbjdNZvK7Q1g3jXDk24rKfJUsSXsqNt
	JOiZ+CYJ3jzTtteKczNz4HnMPIPCPU7+iyMM9zo=
X-Google-Smtp-Source: APXvYqzZroSKuUETEM3GqtqOd4Nw/sC3xzcstxgXKl/OMcAB62jgWnMobiGPUafXy5hz3VYyhVswK1rVcxp4G6p3VJc=
X-Received: by 2002:aca:e689:: with SMTP id d131mr3055538oih.132.1554375039211;
	Thu, 04 Apr 2019 03:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<20190403144110.GG4664@bill-the-cat>
	<CAMKF1srb2EgL7tYZDFoq2EqABp-+_eib2u2OZMwT6B3TVgNk=Q@mail.gmail.com>
	<2189093.Hm6Vq2XZhg@localhost.localdomain>
	<CAMKF1spJCg2HjGRzke_3yH_9hCZR=ZQZfJ1EQZCQi9gQF3x-4g@mail.gmail.com>
In-Reply-To: <CAMKF1spJCg2HjGRzke_3yH_9hCZR=ZQZfJ1EQZCQi9gQF3x-4g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Apr 2019 12:50:27 +0200
Message-ID: <CANNYZj9iPw7yV1Csy1wBk53twHk3nWo9jFhmJ+ww4vtQ_sJ1yQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Tom Rini <trini@konsulko.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [yocto] [oe] Git commit process question.
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
X-List-Received-Date: Thu, 04 Apr 2019 10:50:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Apr 2019 at 02:39, Khem Raj <raj.khem@gmail.com> wrote:
> Definitely, and I agree that we should put relevant information in
> commits, usually
> the information about side effects if any, links to changelog etc. are
> useful too
> however, we should not enforce a behavior which could result in
> redundancy as explained

To be honest, researching changelogs and summarizing them into commit
messages is feasible if you maintain maybe three recipes. When you
maintain thirty, it becomes a burden, and I am not going to take that
burden. There's already enough work in getting the upgrade into
working shape, work that largely goes unnoticed and unappreciated and
does not require finding and reading upstream changelogs.

HOWEVER. I think we could start putting links to changelogs into the
recipes themselves. If it's a webpage, we can use templating to
substitute version numbers, if it's a file in the source tree, we can
also come up with a format for that. Then it's a simple extension to
e.g. devtool to show that changelog via less or a browser.

Alex

