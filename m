Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 942957F0E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 08:34:09 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h6so18631861iom.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 01:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WiNfnLi4rV8GRSERjICGe4p9vIrhw53/n9lFB13vQIQ=;
	b=dc072X34JmyxjQd1S/Ll+ZaiNe7hQSZnUhHtho9mgllsgTLI3OGsPYTZtIun7ORBiD
	gOi3pMGyAoDKElhBnM4x0Tf8stN8HiQF9hnnhci6qoy1lSpY06gTUBX6e+qrESu0vrIR
	Y0mNYBEgwFegWteZ6ZYvZVllqRat/PE9eXPiPuPrXN2zCLwdvPFgJzKpKogNisWD2pJ1
	yUdBuc0KcT2b3P14IR1qVkgiHJFREgrYNKnwX+QxVWPdbjleVwcLZIkxDJ8q81D0qSNj
	GSCvgTDaeRyIK7QxwvkVxPpyvu8KaGvt0H+2P8qqzRKCpGzObT8Rh8GQfRDvuM8/Raeq
	hN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WiNfnLi4rV8GRSERjICGe4p9vIrhw53/n9lFB13vQIQ=;
	b=OOXquSv5OTC13dfNdiJPDOl6KTpyOujrMjafBhIf1AAFPmI1rMXlxYKyKK+aKw0axS
	byHgtsq7zA7L9Z6vBI1QcMLsfZA77DnaU2SALrJmRRW9QhxOhT8b0Z1kCC4Ly2mJitGF
	ahl0TnwzvLidVCsAHzO0fB9YtG0Mbe48GEd+WYIA1Jt6HBNm2sNQKJdbENKpYfxcwF3q
	HPh1HCEr3W3m3uV6EzTLm1tK8mYY0S56sYs+rzh1Vr1pJae51C5tDph+rJAvTa3Ihwyc
	Ggb/F+HTBRPcFrF6BIMdXhoi8jwmKrZTg6PR+yzj0r/IDr/Icmn7ABlBopjPSoUqFodp
	+drA==
X-Gm-Message-State: APjAAAW59VEp+G+qh7FBlEekyRWQ1mQ/kfENDjnaSk0ssjqh1wGmmXYB
	Jlt5otI3wOWKeIr3PebCTXzPnJT208RFRGGAwpR5nA==
X-Google-Smtp-Source: APXvYqyIyXIDj98Vaj9yzKazkfvRgsjTUkC/49GiJuWo4sJvKS/ICsy7geaqwPMnR7GmpWD39ogx79VZHL/j4858Cs4=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr9044878ioc.179.1562920450463; 
	Fri, 12 Jul 2019 01:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190711202739.131168-1-joe.slater@windriver.com>
	<20190711204424.GA2092@localhost>
	<CAJTo0LYnXYrkfa_HrU=QPxxngpP0qHsAUMkFENYGU=MCFGDZyA@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84FA81B717@ALA-MBD.corp.ad.wrs.com>
	<20190712063040.GB2092@localhost>
In-Reply-To: <20190712063040.GB2092@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2019 09:33:59 +0100
Message-ID: <CAJTo0LaE0JvnsF9uTshyiXMzX5X6+2tzkx3jxjN1vdWFSDNAZg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libtool: allow for use of reproducible_build bbclass
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
X-List-Received-Date: Fri, 12 Jul 2019 08:34:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2019 at 07:30, Adrian Bunk <bunk@stusta.de> wrote:
> Debian has already done a lot of work regarding reproducible,
> so checking there for existing patches first is always a good idea.

To expand on this for people who don't know how to mine Debian: first,
identify the source package.  In this case it's libtool but otherwise
you can search packages.debian.org.  Then search
https://sources.debian.org/patches for libtool and you find
https://sources.debian.org/patches/libtool/2.4.6-10/no_hostname.patch/.

Ross

