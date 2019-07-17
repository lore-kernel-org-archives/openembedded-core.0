Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id ABDCF7ECC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 10:51:30 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hnhX1-0008AK-9d; Wed, 17 Jul 2019 12:51:31 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hnhWz-0001sW-R8; Wed, 17 Jul 2019 12:51:29 +0200
References: <20190716135444.12057-1-u.oelmann@pengutronix.de>
	<09978b11aded8890d37f2a64f7833f7a028e2577.camel@linuxfoundation.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-reply-to: <09978b11aded8890d37f2a64f7833f7a028e2577.camel@linuxfoundation.org>
Date: Wed, 17 Jul 2019 12:51:29 +0200
Message-ID: <6rlfwx2atq.fsf@pengutronix.de>
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
X-List-Received-Date: Wed, 17 Jul 2019 10:51:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Wed, Jul 17 2019 at 11:19 +0200, Richard Purdie <richard.purdie@linuxfou=
ndation.org> wrote:
> On Tue, 2019-07-16 at 15:54 +0200, Ulrich =C3=96lmann wrote:=20=20
>> [...]=20
>> -PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr"
>> +PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd reproducible"
>> [...]=20
>> +PACKAGECONFIG[zstd] =3D "ZSTD_SUPPORT=3D1,ZSTD_SUPPORT=3D0,zstd"
>> +PACKAGECONFIG[reproducible] =3D "REPRODUCIBLE_DEFAULT=3D1,REPRODUCIBLE_=
DEFAULT=3D0,"
>
> This fails in OE-Core since zstd isn't present and you've enabled that
> by default:
>
> e.g.:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/827
>
> (but many other similar failures).
>
> Adding the PACKAGECONFIG[zstd] is good, we just can't enable it by
> default.

see my reply to Adrian: what do you think of transplanting the zstd
recipe from meta-rauc to OE-core?

Best regards
Ulrich
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

