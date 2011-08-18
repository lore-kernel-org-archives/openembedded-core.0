Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QtxmK-0005cq-Lh
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 10:16:40 +0200
Received: by wyf19 with SMTP id 19so1353040wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2011 01:12:01 -0700 (PDT)
Received: by 10.227.174.206 with SMTP id u14mr350147wbz.59.1313655121170;
	Thu, 18 Aug 2011 01:12:01 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm9sm1541869wbb.44.2011.08.18.01.11.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 01:12:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E4CAE28.8050600@linux.intel.com>
Date: Thu, 18 Aug 2011 10:11:58 +0200
Message-Id: <3FF42F5B-A193-4753-9EDD-A23318C4A4C6@dominion.thruhere.net>
References: <4E4CAE28.8050600@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] cortexa8: use hard floating point
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
X-List-Received-Date: Thu, 18 Aug 2011 08:16:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 18 aug. 2011, om 08:16 heeft Darren Hart het volgende geschreven:

> =46rom what I could gather, it makes sense to address using =
mfloat-abi=3Dhard
> for the beagleboard in the cortexa8 tune file.

It doesn't, actually. Sadly the internet is now full with posts from =
misinformed meego and debian people about this issue, so I see why =
someone might think hfp cures cancer and creates world peace.

> Before I submit this as a pull
> request, I'd appreciate a sanity check from the Beagleboard experts.
>=20
> Is there any reason the cortexa8 tune file should not be using "hf" by =
default?

Yes, it's incompatible with anything out there. The only real world app =
that slightly benefits from it is povray, no demonstrable gains for =
everything else. This also breaks the 3d drivers.

All in all this is something a DISTRO should opt-in to, not opt-out of.=


