Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ttaos-0007cY-9r
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 10:22:44 +0100
Received: from mail416.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 37A22DC5BD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 09:57:51 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Jan 2013 10:48:28 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO e6520eb)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 11 Jan 2013 10:48:26 +0200
Date: Fri, 11 Jan 2013 09:48:25 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Message-ID: <20130111094825.13615ca8@e6520eb>
In-Reply-To: <CACW_hTaR+s1OyZFCseA1Nx0kxwi_W0NHzpBw7r-8jinKeBA21w@mail.gmail.com>
References: <CACW_hTbcpzGuQw3HfNc1bL+a7L6oGcJWfhE5=YKyXR6fwQeVfg@mail.gmail.com>
	<1357751835.13022.103.camel@ted>
	<CAAQYJAsygkKtJiu7QFSM2o+5iNx7GSmwvOZ6E+LBkoAh4ChQzA@mail.gmail.com>
	<CACW_hTZdivwbMO8jskuhPNefEL2riDfQ6_XWdG7bkpZJNOmnzQ@mail.gmail.com>
	<CACW_hTaR+s1OyZFCseA1Nx0kxwi_W0NHzpBw7r-8jinKeBA21w@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 15121398699230211550
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrgeelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrgeelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: Patches, oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: split mtd-utils
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
X-List-Received-Date: Fri, 11 Jan 2013 09:22:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Frans,

Le Fri, 11 Jan 2013 09:40:43 +0100,
Frans Meulenbroeks <fransmeulenbroeks@gmail.com> a =C3=A9crit :

> Along the lines of the oe classic patch I propose to split as follows:
>=20
>=20
> mtd-utils-jffs2 package containing
> jffs2dump
> jffs2reader
> mkfs.jffs2
>=20
> mtd-utils-ubifs package containing:
> mkfs.ubifs
> ubiattach
> ubicrc32
> ubidetach
> ubiformat
> ubimkvol
> ubinfo
> ubinize
> ubirename
> ubirmvol
> ubirsvol
> ubiupdatevol
>=20
> mtd-utils package containing:
> docfdisk
> doc_loadbios
> flashcp
> flash_erase
> flash_eraseall
> flash_lock
> flash_otp_dump
> flash_otp_info
> flash_unlock
> ftl_check
> ftl_format
> mtd_debug
> mtdinfo
> nanddump
> nandtest
> nandwrite
> nftldump
> nftl_format
> recv_image
> rfddump
> rfdformat
> serve_image
> sumtool
>=20
IIRC sumtol is used for jffs2 images (to create the erase block
summary) so that may better fit into mtd-utils-jffs2

Also, nftl* rfd* doc* ftl* serve_image may go into a separate packate
(mtd-utils-misc ?) as I believe those tools are not very usefull in
most configurations using mtd with nowadays's flashs.

Eric


