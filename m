Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id ECAA77ECC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 10:48:43 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hnhUK-0007nQ-HM; Wed, 17 Jul 2019 12:48:44 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hnhUJ-0007Y0-H5; Wed, 17 Jul 2019 12:48:43 +0200
References: <20190716135444.12057-1-u.oelmann@pengutronix.de>
	<20190717090812.GA18597@localhost>
User-agent: mu4e 1.1.0; emacs 26.1
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Adrian Bunk <bunk@stusta.de>
In-reply-to: <20190717090812.GA18597@localhost>
Date: Wed, 17 Jul 2019 12:48:43 +0200
Message-ID: <6rmuhd2ayc.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: =?utf-8?Q?S=C3=B8ren?= Andersen <san@skov.dk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] squashfs-tools: upgrade to commit f95864afe883
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
X-List-Received-Date: Wed, 17 Jul 2019 10:48:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On Wed, Jul 17 2019 at 11:08 +0200, Adrian Bunk <bunk@stusta.de> wrote:
> On Tue, Jul 16, 2019 at 03:54:44PM +0200, Ulrich =C3=96lmann wrote:
>>...
>> Commits [5] & [6] introduced interesting features, namely zstd support a=
nd
>> reproducibility of created SquashFS images. They are reflected in two new
>> PACKAGECONFIG options now.
>>...
>> -PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr"
>> +PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd reproducible"
>>...
>
> zstd is not in OE-core, so this cannot be enabled by default.

of course... although I should have known better I missed that as in the
BSP I used to develop this patch I include meta-rauc which offers zstd
(see [1]).

I could send a v2 that does not enable zstd by default, but still offers
the PACKAGECONFIG[zstd]. Otherwise if you like zstd to become a member
of OE-core (as the other supported compressors already are) I could
prepare a patch series with meta-rauc's zstd-recipe as a base for the
update of the squashfs-tools. In the latter case meta-rauc could drop
that recipe in the future and that's what we would prefer. What do you
think?

Best regards
Ulrich


[1] https://layers.openembedded.org/layerindex/recipe/79049/
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

