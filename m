Return-Path: <sascha-ml-linux-yocto-oe-core@silbe.org>
Received: from bbox.sascha.silbe.org (bbox.sascha.silbe.org [46.38.230.149])
	by mail.openembedded.org (Postfix) with ESMTP id ABECB7554E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 16:14:33 +0000 (UTC)
Received: from twin.sascha.silbe.org (twin.sascha.silbe.org [192.168.1.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "twin.sascha.silbe.org",
	Issuer "stunnel Pseudo-CA" (verified OK))
	by bbox.sascha.silbe.org (Postfix) with ESMTPS id 167A3BEF2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 18:14:34 +0200 (CEST)
Received: (nullmailer pid 28185 invoked by uid 8193);
	Thu, 14 Jun 2018 16:14:34 -0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
In-Reply-To: <CANNYZj894Yin6tnTSW1Mw3YdcLkX9CdSBcs8kOo1iubi+LmHEA@mail.gmail.com>
References: <20180608161841.10108-1-x-yo17@se-silbe.de>
	<CANNYZj_V7knzM_+3J+YnHNyG+mbGmkzYBM_GoxTK1jKoYx9UGw@mail.gmail.com>
	<toeh8mdywfy.fsf@twin.sascha.silbe.org>
	<CANNYZj9uwH9erkgu8Of5xq6PTLfTqdTdnUJtqMbyqgJa1ONKzA@mail.gmail.com>
	<toeefhhyt86.fsf@twin.sascha.silbe.org>
	<CANNYZj894Yin6tnTSW1Mw3YdcLkX9CdSBcs8kOo1iubi+LmHEA@mail.gmail.com>
Date: Thu, 14 Jun 2018 18:13:57 +0200
Message-ID: <toe4li5z6pm.fsf@twin.sascha.silbe.org>
MIME-Version: 1.0
From: Sascha Silbe <x-yo17@se-silbe.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection: relocate typelib repository for native builds
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
X-List-Received-Date: Thu, 14 Jun 2018 16:14:34 -0000
X-Groupsio-MsgNum: 112563
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> writes:

> 2018-06-08 22:27 GMT+03:00 Sascha Silbe <x-yo17@se-silbe.de>:
>> We have some Python modules that we are extracting some information from
>> and generating documentation for at build time; both times the modules
>> get imported. We don't need GLib to actually work; it only needs to be
>> importable. Fortunately no other typelib is used by the code.
>
> Thanks for explanation. The patch is fine then and can be added to
> oe-core - so that if later g-i needs to be fully supported on the
> native side, this part would be already sorted. For now though it's
> not 'officially' working.

Fair enough. Thanks for the review! Is there anything else I should do
for the patch to go in?

Sascha
=2D-=20
Softwareentwicklung Sascha Silbe, Niederhofenstra=C3=9Fe 5/1, 71229 Leonberg
https://se-silbe.de/
USt-IdNr.: DE281696641

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJbIpRGAAoJEMGPauiBMO2XL0MQAISGq2wZHWCB7yABKT1lDUhG
groq3vm1lx0FWgNLTsVM+9TxCp3X2wUNs03qemyzWgdOsUDurJ08FCS92Bm3LLB+
SG8xDKjIibJloZv4ej+uVsoDGJRvkFhFBlRb64a4B1UTGoyJSqCb3DjBPVCYRwsO
JMdoNdJiWYQD2SgV+L+ELXuCj5su+VMoKG5q29j9SDr7SR9DDNOA5Bpryn8Zj/eQ
cefaf8lzZCE4aa10kDHo4dZHWomMhELFiOP5CIUpoTy3he0uSlLIbzbm04p+SOUr
Thwp7ZylgdC+e4wNeeJ7BvXKjxarGR0bKwXhPaMkxIQ8TLEPNZcWihS1+PzIzJiA
4t/xNNKPaQeTN9xEBAw+IHyp+BxHwiSLBbQwI9WSSZdPIzG40q5aPHlcZrsknDss
RPo+B8wxp+EcheHXZKjyjWO6wCtPHcL7l+rVqR/czUZ5RYUvQWGZnHSi7oRpD5al
SWkcVFZ/iFH0c5hjSNhdlY7jy8LMKY6wgyFa+xzC+f2HU6jzNOPTRSmHQvaE39TR
B2LIoa5XlpSF1Pnocqhv59gS+Yc48EvtXjvNR751c3zIkogMxw8PhBCjTMOqRzc+
pEnQVYkM7gAciJsTNBgvuEXXNE2jq0VBxuSOK1nBJXWARwzh/6S1csipkWe8200l
IZhyEcCVzA9HygqwUSal
=uvav
-----END PGP SIGNATURE-----

--=-=-=--
