Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE45611CC;
	Wed,  4 Mar 2020 17:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48XgjF2qw5z43;
	Wed,  4 Mar 2020 18:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583342657;
	bh=5oy8SuWEcVt5jN2j+093Ibx+kadysFs1oMkW8yFWLEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZ1bPjoEBqfx03vFtMGsoqpmhU2yHoocpTR2OLnj4auKlQZK4r9F70OGjs8fMw48Z
	cqdObood8GmKoHc67UXzKM1EZ9/uXPlR2WBcDvKK1/R1bY6fxjQHSnXM97CIv5FJtx
	/la8QqJD5mrVlo6YZHldhpnZjwy+ek8zuX7EO7H/uW/WiZgJg7NsYEkq6UO9xDWj9a
	/FsbL+yqgAxZWX6xiVm+y2DRaXYL1FwZbAFTSkHHeqrveJ26HrdelRICyLE0ompaiv
	AXYr+fXU3/3oqI+pjeYPpeBBk8xcANYYe5xcC7/YHSJYWoFinu+mst2bsN1+guoZYn
	RFkH3uUPJseVUzkTLYk/mD6yoopKpOXDsoaf1wregPpfy+K1QfCHK21PCdA4QJCEj9
	9BMpj8gD6aOW9C7LZnDXFjsgC6a81aaGG5HwRA69TOn4+gho+gSmkFr6qyESVJj1cY
	lYs0FumdJLkgkEo3MlxswGHZ/TlMsb5V5hrlPAvXIUdKC1f7rpzuB8wAmKIXYcGeO6
	qzNuUNSW/QoozMaZ641L4mv3Y9C33XzIWNk39aXzxCzmB8yd1liAtsX7rMD7ECrZHj
	dg5T5H9kLd6NukpVCxzDYLMtrsNA2R2uh8GhBIRfnHgFDxxm6y0EapzYIskuf/aamJ
	hjHSImAxHSUx/pcWquonM+a4=
Date: Wed, 4 Mar 2020 19:24:15 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200304172415.GA29456@localhost>
References: <20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
	<20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
	<20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
	<20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-architecture@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Wed, 04 Mar 2020 17:24:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 04, 2020 at 05:00:44PM +0100, Alexander Kanavin wrote:
> Taking offense or getting angry at the yocto project is entirely
> misdirected.

I am not angry if YP does not provide security support.

I am angry when YP is telling lies that it would provide security 
support, but does not actually provide it.

> The liability for insecure millions of devices does not lie
> with the yocto project, it lies with the OEMs.
>...

The liability for insecure millions of devices lies 100% with the Yocto 
Project if it claims to provide security support but does not actually 
provide it.

If a user has to decide today whether an upcoming product will run
Ubuntu 20.04 LTS or Yocto 3.1 LTS, then it should be clear to the
user whether or not choosing Yocto will provide upstream security 
support the same way as Ubuntu.

A user reading the YP LTS announcement expects security support similar 
to what Ubuntu is offering, and might only notice that this isn't true 
after a known vulnerability gets exploited on millions of devices.

If security support for YP stable and LTS releases is only on a
community support basis and usually incomplete, then it is on YP
to make that clear to all users instead of claiming the opposite - in 
other projects LTS does include security support, sometimes only 
security fixes are permitted.

This could be combined with a call for help for security support,
an advantage of being honest would be that it becomes visible for
users that there is a resource shortage.

> Alex

cu
Adrian

