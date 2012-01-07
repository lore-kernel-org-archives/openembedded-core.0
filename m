Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RjYUt-0003Fv-GL
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 16:47:56 +0100
Received: from mail409.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id B710C1004140
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jan 2012 14:15:21 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Jan 2012 15:14:12 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO eb-e6520)
	(82.233.81.124) by ns0.ovh.net with SMTP; 7 Jan 2012 15:14:11 +0200
Date: Sat, 7 Jan 2012 14:14:10 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
Message-ID: <20120107141410.3d35c503@eb-e6520>
In-Reply-To: <1325911915-16001-4-git-send-email-steve@sakoman.com>
References: <1325911915-16001-4-git-send-email-steve@sakoman.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.7.10 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 4981825613623635394
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefkedrfeefucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtudenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepne
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefkedrfeefucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtudenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepne
Subject: Re: [PATCH RFC v2] dhcp: package /var/lib/dhcp with dhcp-client rather than dhcp-server
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
X-List-Received-Date: Sat, 07 Jan 2012 15:47:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Fri,  6 Jan 2012 20:51:54 -0800,
Steve Sakoman <steve@sakoman.com> a =E9crit :
> -FILES_dhcp-server =3D "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server=
 ${localstatedir}/lib/dhcp/"
> +FILES_dhcp-server =3D "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"

isn't this directory necessary for dhcp-server ?

Eric


