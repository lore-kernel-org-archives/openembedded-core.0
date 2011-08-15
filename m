Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QsyGK-000210-Is
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:35:33 +0200
Received: by wwe32 with SMTP id 32so4061154wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 07:30:56 -0700 (PDT)
Received: by 10.227.200.212 with SMTP id ex20mr3577116wbb.89.1313418656480;
	Mon, 15 Aug 2011 07:30:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fh17sm2194155wbb.20.2011.08.15.07.30.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Aug 2011 07:30:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201108151523.09022.paul.eggleton@linux.intel.com>
Date: Mon, 15 Aug 2011 16:30:53 +0200
Message-Id: <B0416E2E-1F00-40F5-83F3-230D341239F5@dominion.thruhere.net>
References: <201108142050.37352.paul.eggleton@linux.intel.com>
	<1313417701.14274.581.camel@rex>
	<201108151523.09022.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 14:35:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 aug. 2011, om 16:23 heeft Paul Eggleton het volgende geschreven:

> On Monday 15 August 2011 15:15:01 Richard Purdie wrote:
>> It sounds like its being installed to the right location but that =
opie
>> isn't looking for it in the right place later.
>>=20
>> How does opie know where to look for the file?
>=20
> Same way it gets installed, it looks for it in ${OPIEDIR}. It's just =
that the=20
> second time around if the machine is not the same, ${OPIEDIR} is not =
the same=20
> either.

That sounds like an expanded version is getting stored somewhere where =
it shouldn't=


