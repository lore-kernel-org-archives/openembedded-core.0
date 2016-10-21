Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB6F71AEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 14:05:30 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t0nWb5Cdlz3hjV8;
	Fri, 21 Oct 2016 16:05:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t0nWb2YQbzvkpl;
	Fri, 21 Oct 2016 16:05:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id w-FRmAftflMV; Fri, 21 Oct 2016 16:05:18 +0200 (CEST)
X-Auth-Info: KOo9qGkiY1/yfH3L98gaQKltkKNrEAhG8uMTlLKTVRs4ulPcq2h0h+CvPrWMD/yy
Received: from [10.0.0.72] (host-141-40-253-38.customer.izb-online.de
	[141.40.253.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 21 Oct 2016 16:05:18 +0200 (CEST)
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1476871513-19739-1-git-send-email-o.mandel@menlosystems.com>
	<1985222.nRgBkrL9KW@peggleto-mobl.ger.corp.intel.com>
From: Olaf Mandel <o.mandel@menlosystems.com>
Organization: Menlo Systems
Message-ID: <7c0317d9-f5d2-6a0d-5b2c-93d17fa5712c@menlosystems.com>
Date: Fri, 21 Oct 2016 16:05:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1985222.nRgBkrL9KW@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] $COREBASE/LICENSE in LIC_FILES_CHKSUM
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
X-List-Received-Date: Fri, 21 Oct 2016 14:05:31 -0000
X-Groupsio-MsgNum: 88483
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="hHac0gOw86pQ7WHWIGsnKeSrdPb9XNEmv"

--hHac0gOw86pQ7WHWIGsnKeSrdPb9XNEmv
Content-Type: multipart/mixed; boundary="6QXsuMI3pSIm6nGACnbINUkXQJdmuiljc";
 protected-headers="v1"
From: Olaf Mandel <o.mandel@menlosystems.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <7c0317d9-f5d2-6a0d-5b2c-93d17fa5712c@menlosystems.com>
Subject: Re: [OE-core] [PATCH 0/1] $COREBASE/LICENSE in LIC_FILES_CHKSUM
References: <1476871513-19739-1-git-send-email-o.mandel@menlosystems.com>
 <1985222.nRgBkrL9KW@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1985222.nRgBkrL9KW@peggleto-mobl.ger.corp.intel.com>

--6QXsuMI3pSIm6nGACnbINUkXQJdmuiljc
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Am 21.10.2016 um 01:29 schrieb Paul Eggleton:
> On Wed, 19 Oct 2016 10:05:12 Olaf Mandel wrote:
-Snipp-
>> There are additional recipes that reference the global LICENSE
>> file, but where I am not sure if a less blanket license declaration
>> is appropriate or not. Especially for meta-toolchain and
>> build-appliance-image, the global LICENSE is probably correct.
>> Any comments?
>=20
> For images and other recipes that don't pull in anything by themselves,=
 there
> shouldn't be a need for LIC_FILES_CHKSUM (or indeed LICENSE) to be set =
at all
> - in order to understand the license for the result the appropriate pla=
ce to
> look is the license manifest that represents everything that goes into =
the
> image. In fact, in master / morty, if SRC_URI is empty then LIC_FILES_C=
HKSUM
> is no longer verified [1]. Thus, for such recipes we can remove the set=
ting of
> LIC_FILES_CHKSUM (and LICENSE, if possible) altogether.
>=20
That seems to apply to eight of the nine remaining recipes still
containing the ${COREBASE}/LICENSE:

meta/recipes-core/meta/buildtools-tarball.bb
meta/recipes-core/meta/meta-environment.bb
meta/recipes-core/meta/meta-extsdk-toolchain.bb
meta/recipes-core/meta/meta-ide-support.bb
meta/recipes-core/meta/meta-toolchain.bb
meta/recipes-core/meta/signing-keys.bb
meta/recipes-core/meta/testexport-tarball.bb
meta/recipes-core/meta/uninative-tarball.bb

Of the already modified recipes, this applies to:
meta/recipes-core/systemd/systemd-compat-units.bb

Also, it is not currently possible to remove LICENSE: still causes
build-errors.

I will send a patch that removes LIC_FILES_CHKSUM from a total of 19
files, but please someone review it: it also removes the CHKSUM from
e.g. kernel-devsrc and perf.

This leaves only one instance of ${COREBASE}/LICENSE:
build-appliance-image. Someone please say if the blanket license text
from "LICENSE" applies or if the narrower license terms from
"COPYING.MIT" suffice.

Best regards,
Olaf


--6QXsuMI3pSIm6nGACnbINUkXQJdmuiljc--

--hHac0gOw86pQ7WHWIGsnKeSrdPb9XNEmv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYCiDFAAoJEFS9nbRiUh3/MYoH/2oe6eqD9LIHTJE22GuCXWrC
tXmbkInaJ2qJ0LQSK1xDgeGRjTHKsjQViGkFKvLgaN9Q11v8bVSI74JemJYNmiRd
zIhdtJPxrcJptRKVoSg4ZU1MUjsoVl1qW1yXe5BUIMoaP+xcwwAs24uhIChdPfx0
9x27WzTm+I1ECNZptbj4AKwayGaSwJ9ohoX4vfH/LufukbLDa2XmWTNOzlz6m2iO
WlHMdrb2oma+dkcorX6CjsazeVcTj9tbV0P3Nfw2UjytlKcCnQlWUSj4lPMCA2RO
hI/k22HF3BwPaXRH4QpY0deUbxKtFWfagFgegiC3ugirdLO28utxD2DQCy85K3Y=
=hzcb
-----END PGP SIGNATURE-----

--hHac0gOw86pQ7WHWIGsnKeSrdPb9XNEmv--
