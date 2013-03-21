Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1UIpWS-0006Gm-Th
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 01:07:53 +0100
Received: by mail-ea0-f172.google.com with SMTP id d10so1121040eaj.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 16:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=lBgI15cays7f8KwAZvFSgj6YytYEk12wCQK+ZyhrDVE=;
	b=F05tm94oNVVM8vy3B+53WiHVEyKnMmm8J47b5eU96TzcYF7VBehUsd/OHSvePCGOTR
	vtIqDG65tzOqx3Gr9cm6D7ZQu5Y/YXpecruPcDcN72HOnas2pu9I5XjAx15/ud2YgF45
	BT1HX00//KqT7BIxhBZOmVvqijT3ahToPEsVK++bjl2woZgwYYfHNec+N59HEaUwWKEf
	03D2FACh6FHy/DcP3bwmFPi/NDm9pFgjz7evf6qPUwYmam8d7x1lBWsrX5kqfSE6tnAG
	/dgY76G/w57lhuTfYJ3g/QltpDI5OekB2YQEE8nzYN3LzJ7yxvpa2ImgPCczmML+d9HK
	fQ5A==
X-Received: by 10.15.81.136 with SMTP id x8mr11636429eey.9.1363909860051;
	Thu, 21 Mar 2013 16:51:00 -0700 (PDT)
Received: from [46.207.139.139] (046207139139.atmpu0029.highway.a1.net.
	[46.207.139.139])
	by mx.google.com with ESMTPS id 3sm36673eej.6.2013.03.21.16.50.52
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Mar 2013 16:50:59 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 22 Mar 2013 00:53:31 +0100
Message-ID: <13d8f5e7efc.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <1363908112.16482.151.camel@ted>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
	<13d8f28b861.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<1363908112.16482.151.camel@ted>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.2.20 (build:
	2100226)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/16] distro: Add separatebuilddir.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 00:07:53 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 22 March 2013 00:21:52 Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2013-03-21 at 23:54 +0100, Bernhard Reutner-Fischer wrote:
> > On 21 March 2013 16:55:14 Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Going forward its going to be useful to separate build data from 
> source data
> > > in those autotooled projects which support it. Unfortunately there is a lot
> > > of breakage so for now, this starts the creation of an opt in list which
> > > we can iterate over enable more recipes over time.
> >
> >
> > This does not yet seem to cover the 'O=' family, right?
>
> Correct. autotools seemed like the best place to start with that and the
> trick I mention above with the configure checksum change is only
> currently enabled there anyway.
>
> We could extend this to other places if it makes sense although I'm not
> sure how many O= recipes we have...

There are not that many I suppose, yes (Linux, Busybox, uClibc come to 
mind). Thing is that the later two would be nice to have, IMHO..

I'll keep it in mind.
Cheers,


Sent with AquaMail for Android
http://www.aqua-mail.com




