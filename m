Return-Path: <eric@eukrea.com>
X-Greylist: delayed 71156 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Nov 2014 20:25:36 UTC
Received: from mo4.mail-out.ovh.net (mo4.mail-out.ovh.net [178.32.228.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0768465C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 20:25:36 +0000 (UTC)
Received: from mail615.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 3684D1000C67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 21:18:56 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Nov 2014 22:18:56 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO e6520eb.localdomain)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 13 Nov 2014 22:18:54 +0200
Date: Thu, 13 Nov 2014 21:18:53 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <20141113211853.6c8a6f6f@e6520eb.localdomain>
In-Reply-To: <OF69DC7AA2.57980DB5-ON86257D8F.006E27D9-86257D8F.006ECC75@ni.com>
References: <OF81A9A14C.EC58A864-ON86257D8E.00636115-86257D8E.0064525F@ni.com>
	<20141113013933.6820d2d9@e6520eb.localdomain>
	<OF69DC7AA2.57980DB5-ON86257D8F.006E27D9-86257D8F.006ECC75@ni.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.24; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1309984542690291155
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejhedrjedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejhedrjedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Opkg files at /var/lib/opkg/lists
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2014 20:25:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

Le Thu, 13 Nov 2014 14:10:12 -0600,
Alejandro del Castillo <alejandro.delcastillo@ni.com> a =C3=A9crit :

> I think you got it, the commit d950ef40a3eae4b54cc62828e66d84a62d78c447=20
> removed:
>=20
>         rm -f ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/lists/*
>=20
> step that I didn't see implemented on rootfs.py. I'll file a bug report=20
> (not too familiar with rootfs.py to try to fix it myself).
>=20
please add me in cc. I expect to investigate more on
FEED_DEPLOYDIR_BASE_URI problems I met next week and will try to also
look at this

Thanks,
Eric

