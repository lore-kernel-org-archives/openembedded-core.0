Received: from 11.mo4.mail-out.ovh.net ([46.105.34.195]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1T3U8t-0001gz-5Y
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 17:43:51 +0200
Received: from mail247.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id DF2181050F30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 16:19:43 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 20 Aug 2012 16:14:51 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(82.240.38.71) by ns0.ovh.net with SMTP; 20 Aug 2012 16:14:51 +0200
Date: Mon, 20 Aug 2012 16:14:50 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20120820161450.61b5eb23@eb-e6520>
In-Reply-To: <1345471653-4604-1-git-send-email-radu.moisan@intel.com>
References: <1345471653-4604-1-git-send-email-radu.moisan@intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 5069645806160489739
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehtddrudefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepsghushihsghogidrnhgvthenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehtddrudefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepsghushihsghogidrnhgvthenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Mon, 20 Aug 2012 15:43:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Radu,

Le Mon, 20 Aug 2012 17:07:33 +0300,
Radu Moisan <radu.moisan@intel.com> a =E9crit :

> Updated defconfig file from generated .config
> Disabled CONFIG_LSOF for backwards compatibility
>=20
you may now need this patch :
http://busybox.net/downloads/fixes-1.20.2/busybox-1.20.2-kernel_ver.patch
which corresponds to :
http://git.busybox.net/busybox/commit/libbb/kernel_version.c?id=3D556ac3633=
ce3e7bd51c93b78827ae3874d856257

Eric


