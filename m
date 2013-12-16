Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 978626E488
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 08:48:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,493,1384297200"; d="scan'208";a="38154306"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 16 Dec 2013 09:48:18 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.128]) by
	COSNADEXC22.usr.ingenico.loc ([10.31.4.222]) with mapi id
	14.02.0318.001; Mon, 16 Dec 2013 09:48:18 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Saul Wold
	<sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] bash-completion: add recipe
Thread-Index: AQHO+CGDFGouKcR37k61CLZz/i9PfppWhqkw
Date: Mon, 16 Dec 2013 08:48:18 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B4D5698D7@COSNADEXC13.usr.ingenico.loc>
References: <1386946865-18483-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<52AB357D.3040805@linux.intel.com> <6222173.lGgdPurBqE@helios>
In-Reply-To: <6222173.lGgdPurBqE@helios>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash-completion: add recipe
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
X-List-Received-Date: Mon, 16 Dec 2013 08:48:20 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for comments.
I have posted a v2 patch on oe-devel list.

Changes:
- Drop PR. As this is a new recipe, this should be PR =3D "r0", and r0 is t=
he default.
- Add PE =3D "1" to not conflict with old recipe (OE-Classic) PV =3D "20040=
711"
- Moved LIC* entry before SECTION

Question:
- Kept DESCRIPTION, should it be renamed to SUMMARY?

Cheers,
M


-----Message d'origine-----
De=A0: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Envoy=E9=A0: vendredi 13 d=E9cembre 2013 17:36
=C0=A0: Matthieu CRAPET; Saul Wold
Cc=A0: openembedded-core@lists.openembedded.org
Objet=A0: Re: [OE-core] [PATCH] bash-completion: add recipe

On Friday 13 December 2013 08:27:41 Saul Wold wrote:
> Needs more comment as to why we need this along with a Signed-off-by:
> tag.  Can you include where you brought this in from.

I think this probably belongs in meta-oe rather than OE-Core, unless a good=
 case for everyone needing it can be made.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

