Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QBkpO-0005uC-TJ
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 11:33:07 +0200
Received: by wwb17 with SMTP id 17so4539218wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 02:30:46 -0700 (PDT)
Received: by 10.216.205.139 with SMTP id j11mr4678117weo.28.1303119045936;
	Mon, 18 Apr 2011 02:30:45 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	r57sm2473637wes.25.2011.04.18.02.30.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 02:30:45 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201104181017.59589.paul.eggleton@linux.intel.com>
Date: Mon, 18 Apr 2011 11:30:31 +0200
Message-Id: <E3CCB8FD-559F-4700-B922-FC7C86033E40@dominion.thruhere.net>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
	<72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA88DE3.2050702@linux.intel.com>
	<201104181017.59589.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 2/3] netbase: automatically bring up usb0 on beagleboard
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
X-List-Received-Date: Mon, 18 Apr 2011 09:33:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr 2011, om 11:17 heeft Paul Eggleton het volgende geschreven:

> On Friday 15 April 2011 19:26:43 Saul Wold wrote:
>> There was some initial discussion at ELC this last week about what =
goes
>> where and how layers are going to work moving forward.  I know that =
we
>> are committed to the qemu* machines in oe-core (meta), and that
>> currently meta-yocto contains a set of core HW (beagleboard among =
them),
>> so the question then is should the HW specific stuff, such as this =
patch
>> move to meta-yocto or some other layer?  There are a couple other
>> recipes such as x-load and formfactor that contain HW specific files.
>=20
> Ah, yes, you're right - we definitely don't want this file in oe-core. =
I should=20
> have pushed this particular patch to meta-yocto=20

You mean meta-texasinstruments, right? Or do you yocto folks keep going =
to deny that there's an upstream layer for beagleboard support? If so, =
that doesn't bode well for manufacturers wanting to support their boards =
that overlap with boards in meta-yocto.=


