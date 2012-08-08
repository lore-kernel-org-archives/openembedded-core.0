Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Sz7zQ-0005nm-Jb
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 17:16:04 +0200
Received: by ghbz2 with SMTP id z2so802282ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CNWCCTls0JaV9r8OvgM6vQsGIrAP8L/GZvZLi1pUyEs=;
	b=OHfdlth4sRthhscgrBV32XGtgCjjL3R/lZG9nMIqe8DCv8CWNd6tVS4L8lnVyLZ+E4
	ihgJHBd3lQ+4BCnk6WG+YmkxoI152Q+/+u6KbNlSIEpr4LhQ3ascOXqCw39UGn1HJ8az
	mw9yWuGh02o09d0tNsXjLH9mC7UN0kyjed7/wwF4fgf/FJ41SA/5kmLFWSDDCxIAXrDR
	Wr1Kd1jdNUzyqSlpTxW4RQwZDH27emTUKTSKlkxBzwxEzT+TNOp9SIRMCl4qjLz6+AXS
	xKaqlqbCjc0KjYx9yC+NulDX1urTtqudqSbO0RqrWWXNio+ptccJwolej27udTgnMio+
	l9FQ==
MIME-Version: 1.0
Received: by 10.43.45.200 with SMTP id ul8mr14357561icb.36.1344438256703; Wed,
	08 Aug 2012 08:04:16 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Wed, 8 Aug 2012 08:04:16 -0700 (PDT)
In-Reply-To: <1503062.H9kskseNSt@helios>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<1434346.ITqeKT5PyT@helios>
	<FC8D60B3-17DE-4CEE-8A86-4BF201870280@dominion.thruhere.net>
	<1503062.H9kskseNSt@helios>
Date: Wed, 8 Aug 2012 17:04:16 +0200
Message-ID: <CAGiJk9f3fL8gC4RpEweeyFrZU0oPsth_Rh_SEhtK+L66PgJinA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Replacing Web in Sato with Midori
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 15:16:04 -0000
Content-Type: text/plain; charset=UTF-8

2012/8/8 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Wednesday 08 August 2012 16:47:05 Koen Kooi wrote:
>> Op 8 aug. 2012, om 16:03 heeft Paul Eggleton <paul.eggleton@linux.intel.com>
> het volgende geschreven:
>> > On Wednesday 08 August 2012 15:56:33 Koen Kooi wrote:
>> >> There are a ton of recipes in oe-core that need extra layers to get
>> >> properly tested (QT comes to mind),
>> >
>> > What are you referring to? Qt should be perfectly testable within OE-Core.
>>
>> What kind of big qt apps does oe-core have to test it? I had to enable
>> meta-kde to find bugs in the qt recipes, so if the tests are in there, they
>> aren't get run properly.
>
> And? KDE is far more demanding upon Qt than most Qt-based applications. We had
> to make specific changes to our Qt recipes just to accommodate it.

If you're talking about adding accessibility and session management to
configure -> these are set by default by Qt.
Don't know why they where unset in oe-core though.

>
> Cheers,
> Paul



-- 
Regards
Samuel


