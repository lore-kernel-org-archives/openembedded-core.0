Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 799B46FA85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 07:03:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,955,1392159600"; d="scan'208";a="52111475"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 02 Jun 2014 09:03:13 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Mon, 2 Jun 2014 09:03:13 +0200
Received: from COSNADEXC23.usr.ingenico.loc ([169.254.3.176]) by
	COSNADEXC12.usr.ingenico.loc ([10.31.4.212]) with mapi id
	14.02.0328.009; Mon, 2 Jun 2014 09:03:13 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] libav: add PACKAGECONFIG for theora,
	libvorbis,	speex and openssl
Thread-Index: AQHPdOkuc0O8JO5+H0y2wc7qOF6715tddshg
Date: Mon, 2 Jun 2014 07:03:13 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BA1C947B6@COSNADEXC23.usr.ingenico.loc>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Mon, 02 Jun 2014 07:03:16 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Should I rebase/repost this? Aside libav versions/pinning preferences, this=
 single patch deserves to be commited.

Regards,
Matthieu


-----Message d'origine-----
De=A0: openembedded-core-bounces@lists.openembedded.org [mailto:openembedde=
d-core-bounces@lists.openembedded.org] De la part de Matthieu Crapet
Envoy=E9=A0: mercredi 21 mai 2014 13:38
=C0=A0: openembedded-core@lists.openembedded.org
Objet=A0: [OE-core] [PATCH 1/4] libav: add PACKAGECONFIG for theora, libvor=
bis, speex and openssl

Dropped libvorvis dependency because there is already a (better) builtin vo=
rbis codec.
Don't confuse codec names: "vorbis" (builtin) and "libvorbis" (using extern=
al library).

Changes:
- add --enable-nonfree when faac or openssl are used
- add DESCRIPTION
- sort PACKAGECONFIG entries

Tested with libav-0.8.11 & libav-9.13.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-multimedia/libav/libav.inc | 39 ++++++++++++++++++++++++++---=
----
 1 file changed, 31 insertions(+), 8 deletions(-)

[...]

