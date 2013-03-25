Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1UK0sJ-0000Z3-NQ
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 07:27:34 +0100
Received: from LMUC430092 (lmuc430092.bmw-carit.intra [192.168.101.1])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 504A040044;
	Mon, 25 Mar 2013 06:26:36 +0100 (CET)
From: "Lukas Bulwahn" <lukas.bulwahn@oss.bmw-carit.de>
To: "'Stefan Herbrechtsmeier'" <stefan@herbrechtsmeier.net>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2013 07:10:23 +0100
Message-ID: <00b901ce291f$6ff84670$4fe8d350$@oss.bmw-carit.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac4pHqzl9WA1jQOZSfCrdz+8GLROUA==
Subject: Re: [PATCH] boost: Add real native support
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
X-List-Received-Date: Mon, 25 Mar 2013 06:27:36 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: de

> Von: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] Im Auftrag
> von Stefan Herbrechtsmeier
> Gesendet: Dienstag, 12. M=E4rz 2013 15:49
> An: openembedded-core@lists.openembedded.org
> Betreff: [OE-core] [PATCH] boost: Add real native support
>=20
> The current boost recipe only creates the bjam build tool during a =
native
run
> and thereby is not usable for other native recipes that depend on a =
boost
> library. Use instead the bjam build tool from the do_boostconfig task =
and
add
> real native support to the boost recipe. Additionally remove the
boost-native
> from DEPENDS.
>=20
> Keep the installation of the native bjam build tool for backward
compatibility.
>=20
> Native compilation of bzip2 isn't working and therefore disabled.
>=20

What's the status on this patch? I am in need of this patch and would be
happy to see it in the OpenEmbedded Core repository.
I have seen there has been some discussions on a early try of Stefan
Herbrechtsmeier to patch boost, but nobody has commented or reviewed =
this
patch.

Are there still doubts or need for discussion about this patch?

Kind regards,

Lukas Bulwahn, BMW Car IT GmbH



