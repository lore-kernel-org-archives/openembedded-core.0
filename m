Return-Path: <eric@eukrea.com>
X-Greylist: delayed 3300 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 25 Jan 2015 22:13:26 UTC
Received: from 3.mo2.mail-out.ovh.net (3.mo2.mail-out.ovh.net [46.105.58.226])
	by mail.openembedded.org (Postfix) with ESMTP id 53D7560017
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 22:13:26 +0000 (UTC)
Received: from mail91.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 30307FFA798
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 22:18:23 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Jan 2015 23:18:23 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO e6520eb.localdomain)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 25 Jan 2015 23:18:22 +0200
Date: Sun, 25 Jan 2015 22:18:21 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150125221821.07fc63b4@e6520eb.localdomain>
In-Reply-To: <54C1AE00.6010402@windriver.com>
References: <54C1AE00.6010402@windriver.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.24; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6745829292497284490
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejkedrudelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejkedrudelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] About GPLv2's native recipe
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
X-List-Received-Date: Sun, 25 Jan 2015 22:13:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Robert,

Le Fri, 23 Jan 2015 10:12:16 +0800,
Robert Yang <liezhi.yang@windriver.com> a =C3=A9crit :
> We have several GPLv2 recipes such as m4-native_1.4.9.bb, while we also
> have GPLv3's m4-native_1.4.17.bb, I think that we can remove
> m4-native_1.4.9.bb if the target m4_1.4.9.bb builds well ?
>=20
> I'd like to remove it because we don't build the lower native version by
> default, and we don't know whether it works or when it would fail.
>=20
if you want to build a system without GPLv3 ("supported for only
minimal and base images" as stated in the manual) you may need GPLv2
tools :
http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#ref-ima=
ges
INCOMPATIBLE_LICENSE =3D "GPL-3.0 LGPL-3.0 AGPL-3.0"

Best regards,
Eric

