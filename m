Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1T8tu9-0002jG-Qx
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 16:15:01 +0200
Received: from mail243.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 12982FFA30C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2012 11:19:43 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Sep 2012 11:14:22 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(82.240.38.71) by ns0.ovh.net with SMTP; 4 Sep 2012 11:14:12 +0200
Date: Tue, 4 Sep 2012 11:14:12 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
Message-ID: <20120904111412.5c9c8994@eb-e6520>
In-Reply-To: <1346749679-12397-1-git-send-email-radu.moisan@intel.com>
References: <1346749679-12397-1-git-send-email-radu.moisan@intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 14295551118786473227
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehtddrgeefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepsghushihsghogidrnhgvthenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehtddrgeefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepsghushihsghogidrnhgvthenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: Add sign-off-by and upstream-status
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
X-List-Received-Date: Tue, 04 Sep 2012 14:15:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Radu,

Le Tue,  4 Sep 2012 12:07:59 +0300,
Radu Moisan <radu.moisan@intel.com> a =E9crit :

> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kern=
el_ver.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kern=
el_ver.patch
> index 456fb08..69bbe73 100644
> --- a/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.=
patch
> +++ b/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.=
patch
> @@ -1,3 +1,6 @@
> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
this should be : Signed-off-by: Andreas Oberritter
<obi@opendreambox.org>

> +Upstream-Status: Pending
> +
this should be Accepted=20
http://git.busybox.net/busybox/commit/libbb/kernel_version.c?id=3D556ac3633=
ce3e7bd51c93b78827ae3874d856257

Eric


