Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pz2hB-0006Ba-AC
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 09:00:06 +0100
Received: by wwb17 with SMTP id 17so4621222wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 00:58:24 -0700 (PDT)
Received: by 10.216.11.205 with SMTP id 55mr2019996wex.72.1300089504566;
	Mon, 14 Mar 2011 00:58:24 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id z50sm954659weq.23.2011.03.14.00.58.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Mar 2011 00:58:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D7D42A1.80106@mlbassoc.com>
Date: Mon, 14 Mar 2011 08:58:23 +0100
Message-Id: <D15BF97D-1018-43F4-A141-E5521023D369@dominion.thruhere.net>
References: <cover.1299940883.git.raj.khem@gmail.com>
	<4D7CE94A.5080706@mlbassoc.com>
	<CCDB3981-855D-444D-A271-A863C2765CC4@dominion.thruhere.net>
	<4D7CF827.60904@mlbassoc.com>
	<AANLkTikQ-kF5u6AAKmWojmuP3xGZB4EPR0RkhhSsWAns@mail.gmail.com>
	<4D7D42A1.80106@mlbassoc.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH 0/1] Import own-mirrors class from OE
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
X-List-Received-Date: Mon, 14 Mar 2011 08:00:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 mrt 2011, om 23:18 heeft Gary Thomas het volgende geschreven:

> On 03/13/2011 12:50 PM, Chris Larson wrote:
>> On Sun, Mar 13, 2011 at 10:00 AM, Gary Thomas<gary@mlbassoc.com>  =
wrote:
>>> Ask Richard?  I was just pointing out that Poky/Yocto already has a
>>> mechanism;
>>> perhaps the OE one is better, who knows.
>>=20
>> There seems to be some confusion here.  PREMIRRORS isn't a
>> "poky/yocto" mechanism.  It started in OE, and stills works just fine
>> there (it's implemented in bitbake).  own-mirrors is simply a
>> convenience to make premirrors manipulation easier for the user.  If
>> convenience and usability isn't a priority for poky/yocto, I'd be
>> curious to hear the reasoning.
>=20
> Fair enough; I was merely commenting on how I had been told to handle =
this
> in Poky/Yocto.  If OE has a better way, perhaps it makes sense for it =
to
> be available in both OE-CORE and Poky/Yocto.

And next time please have a look at the actual patch posted before =
commenting on it. The patch does *exactly* what you are saying, namely =
overriding PREMIRRORS.=


