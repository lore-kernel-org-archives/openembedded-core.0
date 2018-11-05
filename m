Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3BE79EE9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 11:42:41 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j17-v6so4009296wrq.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 03:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=V+nKvr0WcLat5rN4pqD1y6HQYLkBLGM0wsGQxu0nBmY=;
	b=hMvd7/VUWx1gmNE0IjOOiIpd199pOrwjPrD9tS1w4dtj48xGO1TqgChQVOxNqIapck
	EV7gLRcC2fncZF50OYTLE75nd3LR6eGHoRCRiDZ6Hs9SLqFsP38E9NbF0X7K/e/eoYz+
	TgUB+Nm4JsOg3bv232HeiDcX9gax7GWqG6BoUky+Y/uu7ddBcrRkdSI4l/OqTSJDPN2y
	/0JuzIVppZ+cskoV10CHT8YYsW6pIGD0xRVWl+en6g197wBnC6r1O08mSJppclI7xOtB
	1wsF+A6KtZYZXaczg+ssKLthMLefmp+JK/Xq5C2mIuxYeV0FISniwFN2dKv7T+o6z2HJ
	4zKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=V+nKvr0WcLat5rN4pqD1y6HQYLkBLGM0wsGQxu0nBmY=;
	b=Js5BsfsNLeiZTLYMPa0sIf72y50AEdPcV+FXVmUoNGIMuH14iyv9khcoKocBrmd63s
	l2GpKtwnlX120Evok2zs7Wb2bsE6lWPeJES+upIjh0YyTV2XoARhIn/htmoVntzFC8XH
	08hJ2Ggjt45oXAEk1FdqUINHmkRM8NH29M83x4wijRVGKVuo5xFct+2U0AwFPFUw2Lh2
	iaaFKfJuTfacEWozomxO/Dau41/2luL641Jdiy6l6uGpbwyT/BevLEZ/PKdc60HJ0srP
	tOZJ6c9spQdP2Mk3Lz0ONOyWwJDkDrp0+fcePSw2LVPRm/lTbl5OldF67r2AN+YD9IAI
	AyzQ==
X-Gm-Message-State: AGRZ1gLFLtNgO2LRVX3AJK9bBXGrYpAM27Hwd73Ohjp4peEbIWC5vGX4
	Do2S8KezmKjTdogiJprZgJM=
X-Google-Smtp-Source: AJdET5eahpH1ZBI7bObW/8v0kRySLQkJ4xchajFP2FOA8wp0dXRGftkd5NNSVHzamdr0/IKU9NdpSg==
X-Received: by 2002:adf:e406:: with SMTP id
	g6-v6mr12286961wrm.277.1541418162205; 
	Mon, 05 Nov 2018 03:42:42 -0800 (PST)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	y83-v6sm1525717wmb.20.2018.11.05.03.42.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 03:42:41 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <8B2286F0-7937-4EC4-A35D-8D2C2F0581A2@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 5 Nov 2018 12:42:39 +0100
In-Reply-To: <11534e53929f6a521560cdf97f71b6af61afdb29.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20181103131223.28268-1-sno@netbsd.org>
	<11534e53929f6a521560cdf97f71b6af61afdb29.camel@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sqlite3_3: Update to 3.25.2
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
X-List-Received-Date: Mon, 05 Nov 2018 11:42:42 -0000
X-Groupsio-MsgNum: 117945
Content-Type: multipart/signed;
	boundary="Apple-Mail=_43AD5775-60EB-4BD2-A798-BE554AD18B56";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_43AD5775-60EB-4BD2-A798-BE554AD18B56
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_781BDC18-A297-4149-9076-B0E41D0CA866"

--Apple-Mail=_781BDC18-A297-4149-9076-B0E41D0CA866
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 05.11.2018 um 12:39 schrieb Richard Purdie =
<richard.purdie@linuxfoundation.org>:
>=20
> On Sat, 2018-11-03 at 14:12 +0100, Jens Rehsack wrote:
>> Update SQLite3 from 3.23.1 to 3.25.2 for UPSERT, window
>> functions and improved ALTER TABLE support.
>>=20
>> For a detailed list of changes since 3.23.1, see
>> * https://www.sqlite.org/releaselog/3_25_2.html
>> * https://www.sqlite.org/releaselog/3_24_0.html
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta/recipes-support/sqlite/sqlite3_3.23.1.bb | 10 ----------
>> meta/recipes-support/sqlite/sqlite3_3.25.2.bb | 10 ++++++++++
>> 2 files changed, 10 insertions(+), 10 deletions(-)
>> delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.23.1.bb
>> create mode 100644 meta/recipes-support/sqlite/sqlite3_3.25.2.bb
>=20
> How was this tested? pseudo-native fails to build with this:
>=20
> =
https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/161/step=
s/7/logs/step1b
>=20
> and many other similar failures.


My local test environment fails with lots of other failure due master =
updates.
So my only test at the very moment was to compile python3-sqlite and =
dbd-sqlite-perl
and continue fixing other issues before coming to create an image :(

I'll send a v2 as soon as I get around to it ;)

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_781BDC18-A297-4149-9076-B0E41D0CA866
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 05.11.2018 um 12:39 schrieb Richard Purdie &lt;<a =
href=3D"mailto:richard.purdie@linuxfoundation.org" =
class=3D"">richard.purdie@linuxfoundation.org</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Sat, 2018-11-03 at 14:12 +0100, Jens Rehsack wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Update SQLite3 from =
3.23.1 to 3.25.2 for UPSERT, window<br class=3D"">functions and improved =
ALTER TABLE support.<br class=3D""><br class=3D"">For a detailed list of =
changes since 3.23.1, see<br class=3D"">* <a =
href=3D"https://www.sqlite.org/releaselog/3_25_2.html" =
class=3D"">https://www.sqlite.org/releaselog/3_25_2.html</a><br =
class=3D"">* <a href=3D"https://www.sqlite.org/releaselog/3_24_0.html" =
class=3D"">https://www.sqlite.org/releaselog/3_24_0.html</a><br =
class=3D""><br class=3D"">Signed-off-by: Jens Rehsack &lt;<a =
href=3D"mailto:sno@netbsd.org" class=3D"">sno@netbsd.org</a>&gt;<br =
class=3D"">---<br class=3D""> =
meta/recipes-support/sqlite/sqlite3_3.23.1.bb | 10 ----------<br =
class=3D""> meta/recipes-support/sqlite/sqlite3_3.25.2.bb | 10 =
++++++++++<br class=3D""> 2 files changed, 10 insertions(+), 10 =
deletions(-)<br class=3D""> delete mode 100644 =
meta/recipes-support/sqlite/sqlite3_3.23.1.bb<br class=3D""> create mode =
100644 meta/recipes-support/sqlite/sqlite3_3.25.2.bb<br =
class=3D""></blockquote><br class=3D"">How was this tested? =
pseudo-native fails to build with this:<br class=3D""><br class=3D""><a =
href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/=
161/steps/7/logs/step1b" =
class=3D"">https://autobuilder.yoctoproject.org/typhoon/#/builders/34/buil=
ds/161/steps/7/logs/step1b</a><br class=3D""><br class=3D"">and many =
other similar failures.<br class=3D""></div></div></blockquote></div><div =
class=3D""><br class=3D""></div>My local test environment fails with =
lots of other failure due master updates.<div class=3D"">So my only test =
at the very moment was to compile python3-sqlite and =
dbd-sqlite-perl</div><div class=3D"">and continue fixing other issues =
before coming to create an image :(</div><div class=3D""><br =
class=3D""></div><div class=3D"">I'll send a v2 as soon as I get around =
to it ;)</div><div class=3D""><br class=3D""></div><div =
class=3D"">Cheers<br class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></div></body></html>=

--Apple-Mail=_781BDC18-A297-4149-9076-B0E41D0CA866--

--Apple-Mail=_43AD5775-60EB-4BD2-A798-BE554AD18B56
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlvgLK8ACgkQRJmWrtzl
Cp365A/+KYpq4QtLsfbX8hCxt2jBXDmSqzxF/SEbyuEVarekOC0LWsanF0irCRFQ
PA1y1OWNOwqxxqr/6id5acPTdDjJBnk14VuIfw5IgJf5N9fcb/+9VKyNhMnnzgDT
sxEw5vVPRpMvo8ptZVoRfJVrOPUAx8giQnTcmGRlrj32Pnk1sqacMAh6P1SKRtVQ
aSK7c1YKtQsWADOTIhatehCsBg8MOfCIz05O+MmKx9dmVQa7l8F1aGcpzzTectG6
ASD6En7Qp+GeDIRPCzdgAqqh9Meq0xhMutPs3nQ2BKtbkvRyZIhDhR2CcmG9RseB
2cU/+Uo7eWLGvRyL11ksee0zs6OZDow/v9lEW/lGK91hzZN9QRSMMVkv6ijdFEtZ
cBDTDZEXbo8AF5CfHWH9+LDF8pBw3z0SX5YRlu3JxFoCPV7g4StRko3jm58bL3jd
M9wxacA10oxCy0ZeST2k7BnurpSuREJEIip/MWbrxUnpGHaR9UVs2ry1wGrEB7Oz
TIuAmGQXJBPsyx3UT/3rVu6qai1DB1So4zEVXlye8kxBiomBe1/UO7bnuL99twr0
ehXKl0LcOvH55GeL9FtyVR0u9cm2Arwxa3ZSPnd5GMWgutNsLbtD664szuR3ga20
4b1SWKrXljuOKyyA4aNtiClS1oMY/br+Arp3vKvbGPsoAVzSsHA=
=k1CB
-----END PGP SIGNATURE-----

--Apple-Mail=_43AD5775-60EB-4BD2-A798-BE554AD18B56--
