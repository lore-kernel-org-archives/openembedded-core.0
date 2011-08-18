Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1Qu0iL-0005a6-J6
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 13:24:45 +0200
Received: by ywa12 with SMTP id 12so452178ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2011 04:20:05 -0700 (PDT)
Received: by 10.146.58.22 with SMTP id g22mr612540yaa.34.1313666405698;
	Thu, 18 Aug 2011 04:20:05 -0700 (PDT)
Received: from [10.1.10.66] (rrcs-97-79-162-178.sw.biz.rr.com [97.79.162.178])
	by mx.google.com with ESMTPS id
	j45sm1104496yhe.22.2011.08.18.04.20.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 04:20:04 -0700 (PDT)
References: <4E4CAE28.8050600@linux.intel.com>
	<3FF42F5B-A193-4753-9EDD-A23318C4A4C6@dominion.thruhere.net>
In-Reply-To: <3FF42F5B-A193-4753-9EDD-A23318C4A4C6@dominion.thruhere.net>
Mime-Version: 1.0 (iPad Mail 8L1)
Message-Id: <79B8A076-0E9D-4057-B04E-4ABFBCEF6608@beagleboard.org>
X-Mailer: iPad Mail (8L1)
From: Jason Kridner <jkridner@beagleboard.org>
Date: Thu, 18 Aug 2011 06:20:05 -0500
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 18 Aug 2011 11:24:45 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



On Aug 18, 2011, at 3:11 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:

>=20
> Op 18 aug. 2011, om 08:16 heeft Darren Hart het volgende geschreven:
>=20
>> =46rom what I could gather, it makes sense to address using mfloat-abi=3D=
hard
>> for the beagleboard in the cortexa8 tune file.
>=20
> It doesn't, actually. Sadly the internet is now full with posts from misin=
formed meego and debian people about this issue, so I see why someone might t=
hink hfp cures cancer and creates world peace.
>=20
>> Before I submit this as a pull
>> request, I'd appreciate a sanity check from the Beagleboard experts.
>>=20
>> Is there any reason the cortexa8 tune file should not be using "hf" by de=
fault?
>=20
> Yes, it's incompatible with anything out there. The only real world app th=
at slightly benefits from it is povray, no demonstrable gains for everything=
 else. This also breaks the 3d drivers.
>=20
> All in all this is something a DISTRO should opt-in to, not opt-out of.

Since I was in the Cc, +1.



