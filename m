Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFBE6A9ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 14:42:02 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2755E4B0074;
	Mon, 28 Jul 2014 16:42:01 +0200 (CEST)
Date: Mon, 28 Jul 2014 16:42:00 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: David Vincent <freesilicon@gmail.com>
Message-ID: <20140728164200.55019693@e6520eb>
In-Reply-To: <CAKRNOGx_e_cNLuzhETFuL2k12fhGsHBPdYT9ND8uP_F67=VA7A@mail.gmail.com>
References: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
	<20140728135853.35af7ee0@e6520eb>
	<CAKRNOGx_e_cNLuzhETFuL2k12fhGsHBPdYT9ND8uP_F67=VA7A@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] barebox: Add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 14:42:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi David,

Le Mon, 28 Jul 2014 14:15:12 +0200,
David Vincent <freesilicon@gmail.com> a =E9crit :
> > Why don't you use $BAREBOX_BINARY instead of hardcoding
> > barebox-flash-image which won't work on old versions of barebox where
> > barebox's binary is named barebox.bin ?
>=20
> I didn't know that, but I am not sure I can use $BAREBOX_BINARY since
> this variable is used in $DEPLOY_DIR. I tried to mimic u-boot recipe
> behavior as much as possible.
>=20
you can use the variable as it's defined upper. u-boot recipe does it
this way :
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-bsp/u-boot=
/u-boot.inc#n19
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-bsp/u-boot=
/u-boot.inc#n63

FWIW you can find here the initial barebox recipe we have in
meta-fsl-arm :
https://github.com/Freescale/meta-fsl-arm/tree/master/recipes-bsp/barebox

Best regards,
Eric

