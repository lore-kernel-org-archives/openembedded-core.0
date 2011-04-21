Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCztj-0007Ns-0b
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 21:50:43 +0200
Received: by wwb17 with SMTP id 17so49027wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 12:48:18 -0700 (PDT)
Received: by 10.216.9.141 with SMTP id 13mr2367906wet.73.1303415298586;
	Thu, 21 Apr 2011 12:48:18 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id g22sm1112611wes.36.2011.04.21.12.48.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 12:48:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303414084.5518.363.camel@rex>
Date: Thu, 21 Apr 2011 21:48:15 +0200
Message-Id: <C5EA4061-5E0F-4897-A45D-3028A0E2E899@dominion.thruhere.net>
References: <cover.1303412254.git.raj.khem@gmail.com>
	<9efd8eca294cb7e3206e47e3b9bea503f3c87ac8.1303412254.git.raj.khem@gmail.com>
	<1303414084.5518.363.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] pcmciautils: Upgrade 017 -> 018
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
X-List-Received-Date: Thu, 21 Apr 2011 19:50:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 21 apr 2011, om 21:28 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-04-21 at 11:59 -0700, Khem Raj wrote:
>> version workaround is done in recipe itself
>> by adding PV to CFLAGS
>> 
>> Since we define LIBC and pcmciutils use it too
>> which hinders build when we define LIBC in
>> environment. Its not used in the builds anyway
>> so we get rid of depending on it
> 
> Why are you defining LIBC in the environment? That sounds like a
> seriously bad idea. Our current environment handling should stop it
> leaking into a build anyway shouldn't it?

In OE .dev we unexport LIBC for that exact reason :)


