Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id CAD51606D0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Oct 2017 13:44:45 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id z195so2134692ywz.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Oct 2017 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0UBHq5vy7WoRGbPS5nll975dK2HhvceJoxrzhvMnMlI=;
	b=tvJaa1+KT305mu8vUBwCwwr67bjzRaoulQOknd106PqTEvCKku+BzcQ1sel9Jw7WtV
	aWgPYJyNBVcGL3e1/SHpaddv2XBBRnNvVl41drYYuzPht6JdfIXIo2rnAhMQqSovJ975
	r/9luVmTnn3gR5HotywfINoMjdWKK1jbl0Ihw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0UBHq5vy7WoRGbPS5nll975dK2HhvceJoxrzhvMnMlI=;
	b=KbKm2hRC6pQGTR7wxRhEzoBXVmoaAVVWFz2AZ4aEVsG+7/zd+66C949iTx4QkefLNq
	gof0iU6ZHz2UX/oSge68BWEDnZ7RwXtNcdkNtyWR7KnaiQu1gMlaCywXeTYbs0GdSFHK
	0eKzxbHGS9pZv4B88JdpH7MGpVkoW4M8vwvlUR1slQ3DYERuCv7DzdvRzNH8tN7Poi99
	YTKEYRStEJfUQL2TdtoMSeKCW8NHOiffa1tnnRB8ko2oOXqDyctu52/m3U+7/HGCsHsE
	B7ld0un8kWvthIs1ZinpuMa563biusSm3a2xVYAr+XPhirrQBMBR3fTfyFw4WjXnAWdd
	1Mag==
X-Gm-Message-State: AMCzsaXursdn0V+5KLrrwLia3SCtaOnOVfvMo1b5CWIl+w312sv4Fcli
	mYSemr2lqR9dMx52RoE9WxsYlA==
X-Google-Smtp-Source: ABhQp+SeTJM/ZG8Lx77ZfU/dM4eq/L2zOiCYdHl7FrxU/ouiLCIyJ2boQQ4pON+BX8LBm/3jMMDo2g==
X-Received: by 10.37.176.4 with SMTP id q4mr4900574ybf.202.1508593486859;
	Sat, 21 Oct 2017 06:44:46 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:a166:949a:f218:8a0])
	by smtp.gmail.com with ESMTPSA id
	g27sm1681088ywk.29.2017.10.21.06.44.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Oct 2017 06:44:45 -0700 (PDT)
Date: Sat, 21 Oct 2017 09:44:43 -0400
From: Tom Rini <trini@konsulko.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20171021134443.GM12015@bill-the-cat>
References: <c9dc44be-45fc-71b7-c488-d7b02e8beebf@windriver.com>
	<7202c981-ed88-48ac-6281-d8e7d50a409a@windriver.com>
MIME-Version: 1.0
In-Reply-To: <7202c981-ed88-48ac-6281-d8e7d50a409a@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Wind River Continuous Integration project
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
X-List-Received-Date: Sat, 21 Oct 2017 13:44:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 20, 2017 at 06:07:18PM -0400, Randy MacLeod wrote:
> On 2017-10-20 02:18 PM, Konrad Scherer wrote:
> >
> >One of the common challenges of Yocto development is the setup and
> >maintenance of a build cluster. If only there was a generic open source
> >Yocto continuous integration project to make the setup and maintenance of
> >build clusters easy...
> >
> >I have a working prototype and it's on GitHub.
> >
> >https://github.com/WindRiver-OpenSourceLabs/ci-scripts
> >
> >It is a set of scripts and docker images for building Yocto images using
> >Jenkins and Docker. There are three main features that I think you will
> >find interesting:
> 
> Konrad and I work together so my comments here might be biased. :)
> 
> I haven't been involved in the ci-scripts project until I tried
> it out yesterday. Without Konrad's guidance, I was able to
> install the system and run a core-image-minimal build. The
> set-up took ~ 10 minutes of my time including reading some of
> the Docker docs, installing packages, then it was another 10-15
> mintues of downloading the images and so on on my slow network.
> 
> I ran it out on an old core2, 4 GB RAM, with one of those old,
> slow, spinning magnetic disks  on a slowish network. A build
> in the ubuntu container in docker finished in the same as
> a native build:
>   3hr 22min for core-image-minimal, poky/pyro.
> Such slow hardware!
> 
> Btw, I recently got a Google Compute Platform (GCP) offer of
> $300 worth of GCP time. I set-up a reasonable VM and on that
> Haswell, 4 core system a build of core-image-minimal took
> about 60 minutes and finally for comparison sake on our
> 128 vCore system, core-image-minimal takes ~ 30 minutes.
> 
> The cost for the build was 62 cents:
> 
> Resource               Usaged           Amount
> Custom instance Core   658.42 Minute    $0.45
> Custom instance Ram     21.95 GiB-hour  $0.12

Just a note on costs.  In GCP custom instances are almost always going
to run more than one of the stock configurations.  The n1-standard-4 is
probably about the same as what you setup (or the n1-highmem-4) and
would be a bit cheaper I think.  I know this is true for the higher end
machines.

-- 
Tom

