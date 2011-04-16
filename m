Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QAxCO-00049H-KC
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 06:33:32 +0200
Received: by wwb17 with SMTP id 17so3286723wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2011 21:31:14 -0700 (PDT)
Received: by 10.216.46.21 with SMTP id q21mr138718web.113.1302928274476;
	Fri, 15 Apr 2011 21:31:14 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id e13sm1971570wbi.23.2011.04.15.21.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Apr 2011 21:31:14 -0700 (PDT)
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
	<72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA88DE3.2050702@linux.intel.com>
In-Reply-To: <4DA88DE3.2050702@linux.intel.com>
Mime-Version: 1.0 (iPhone Mail 8G4)
Message-Id: <9480BCD7-8617-488A-B034-B30D1195E9C4@dominion.thruhere.net>
X-Mailer: iPhone Mail (8G4)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 16 Apr 2011 06:31:09 +0200
To: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 2/3] netbase: automatically bring up usb0 on	beagleboard
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
X-List-Received-Date: Sat, 16 Apr 2011 04:33:32 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 15 apr. 2011 om 20:26 heeft Saul Wold <sgw@linux.intel.com> het volgende g=
eschreven:

> On 04/15/2011 10:00 AM, Paul Eggleton wrote:
>> From: Paul Eggleton<paul.eggleton@linux.intel.com>
>>=20
>> Avoids manual configuration of the BeagleBoard xM's ethernet port (which
>> shows up as usb0).
>>=20
>> Fixes [YOCTO #930]
>>=20
>> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
>> ---
>>  .../netbase/netbase-4.45/beagleboard/interfaces    |   27 ++++++++++++++=
++++++
>>  1 files changed, 27 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-core/netbase/netbase-4.45/beagleboard/in=
terfaces
>>=20
> I know this time would come!
>=20
> So this is up for discussion in a big way!
>=20
> There was some initial discussion at ELC this last week about what goes wh=
ere and how layers are going to work moving forward.  I know that we are com=
mitted to the qemu* machines in oe-core (meta), and that currently meta-yoct=
o contains a set of core HW (beagleboard among them), so the question then i=
s should the HW specific stuff, such as this patch move to meta-yocto or som=
e other layer?  There are a couple other recipes such as x-load and formfact=
or that contain HW specific files.

It should live in the upstream beagleboard BSP layer, which currently is met=
a-texasinstruments



