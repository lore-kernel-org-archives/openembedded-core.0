Return-Path: <eric@eukrea.com>
X-Greylist: delayed 597 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Nov 2014 00:58:09 UTC
Received: from mo69.mail-out.ovh.net (2.mo69.mail-out.ovh.net [178.33.251.80])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEB660167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 00:58:09 +0000 (UTC)
Received: from mail409.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with SMTP id 4AA34FFC279
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 01:39:39 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Nov 2014 02:39:38 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO e6520eb.localdomain)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 13 Nov 2014 02:39:36 +0200
Date: Thu, 13 Nov 2014 01:39:33 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <20141113013933.6820d2d9@e6520eb.localdomain>
In-Reply-To: <OF81A9A14C.EC58A864-ON86257D8E.00636115-86257D8E.0064525F@ni.com>
References: <OF81A9A14C.EC58A864-ON86257D8E.00636115-86257D8E.0064525F@ni.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.24; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 18286866288414993875
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejhedrieelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejhedrieelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 13 Nov 2014 00:58:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Aljandro,

copying oe-core's ML as the problem seems related to oe-core and
not to meta-oe.

Le Wed, 12 Nov 2014 12:15:46 -0600,
Alejandro del Castillo <alejandro.delcastillo@ni.com> a =C3=A9crit :

> Hello,
>=20
> I noticed that the OE build process is leaving files at=20
> /var/lib/opkg/lists (~1.5 MB on my system), which I believe are the feed=
=20
> content used to build the image. The target opkg.conf file configure=20
> lists_dir to be at /var/lib/opkg (instead of the default=20
> /var/lib/opkg/lists), so the feed content under /var/lib/opkg/lists is no=
t=20
> used at all.=20
>=20
> Does anyone know if there Is a reason why the files are left over or is=20
> this a bug? Shouldn't the image creation process remove the whole=20
> directory if it's not going to be used?=20
>=20
> BTW, Dylan doesn't have this problem, but Daisy and Dizzy do (not sure=20
> about Dora).
>=20
I was on a similar subject today and this seems broken since :
d950ef40a3eae4b54cc62828e66d84a62d78c447

BTW it seems that FEED_DEPLOYDIR_BASE_URI was replaced by
PACKAGE_FEED_URIS in 9b8811045546ad67b4695d980f09636d5506e50c but the
document is still pointing to the previous one :
http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#runti=
me-package-management-target-ipk
If the replacement was not intended then there is a problem as
FEED_DEPLOYDIR_BASE_URI doesn't seems to work anymore (tested with
dizzy and package_ipk).

Best regards
Eric

