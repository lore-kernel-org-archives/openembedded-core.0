Received: from retry101.mer-nm.internl.net ([217.149.192.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1TwaMq-0003aM-04
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 16:30:12 +0100
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[IPv6:2a01:3a8:100:2::8b:25])
	by retry101.mer-nm.internl.net (Postfix) with ESMTP id 1EF83414B8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 16:14:35 +0100 (CET)
Received: from amavisd-new (mailscanner13.mer-nm.internl.net [217.149.192.128])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 1F6C23F51D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 16:14:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mailscanner13.mer-nm.internl.net
X-Spam-Flag: NO
X-Spam-Score: -0.617
X-Spam-Level: 
X-Spam-Status: No, score=-0.617 required=3 tests=[INN_HELPER1=-1,
	INN_NONNLRELAY=0.01, INN_TESTB=0.01, RDNS_DYNAMIC=0.363]
	autolearn=disabled
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner13.mer-nm.internl.net [217.149.192.159])
	(amavisd-new, port 10024) with ESMTP id IBJ+EW3PdHf3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 16:14:34 +0100 (CET)
Received: from TOP-EX02.topic.local (82-204-13-181.dsl.bbeyond.nl
	[82.204.13.181]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 16:14:33 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (192.168.10.102) by mail.topic.nl
	(192.168.1.103) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Sat, 19 Jan 2013 16:14:24 +0100
Received: from TOP-EX01.TOPIC.LOCAL ([::1]) by TOP-EX01.TOPIC.LOCAL ([::1])
	with mapi id 14.01.0289.001; Sat, 19 Jan 2013 16:14:31 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] pulseaudio: Pulseaudio DEPENDS on libjson
Thread-Index: AQHN9ias4WoEV4QWhU2ACb8S4m2xxZhQWYCAgABo1DQ=
Date: Sat, 19 Jan 2013 15:14:31 +0000
Message-ID: <A551BDF323A45B48ACE6A404AA16A1C412796D9F@TOP-EX01.TOPIC.LOCAL>
References: <1358587215-23952-1-git-send-email-mike.looijmans@topic.nl>,
	<50FA6DDB.8000302@linaro.org>
In-Reply-To: <50FA6DDB.8000302@linaro.org>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [85.150.144.104]
x-exclaimer-md-config: 9833cda7-5b21-4d34-9a38-8d025ddc3664
x-exclaimer-md-bifurcation-instance: 0
MIME-Version: 1.0
Subject: Re: [PATCH] pulseaudio: Pulseaudio DEPENDS on libjson
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
X-List-Received-Date: Sat, 19 Jan 2013 15:30:12 -0000
Content-Language: nl-NL
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

(sorry for top-posting but I'm forced to use outlook's web client when not =
in the office)

Indeed, that patch is pointless. Which makes me wonder how I got the 2.1 bu=
ild to fail on missing libjson, but thats a mystery for myself to solve...

Regards,
Mike



Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) - (0)499 - 33.69.79
Telefax: (+31) - (0)499 - 33.69.70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitsluit=
end bestemd voor de geadresseerde, zoals die blijkt uit het e-mail bericht =
en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaan.=
 Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, terwi=
jl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseerde=
 te ontvangen, wordt u verzocht de afzender hierover direct te informeren e=
n het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de i=
nhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, door=
 een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de event=
ueel in het e-mail bericht of de bijlagen voorkomende andere personen. TOPI=
C Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloeien=
d uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij beh=
orende bijlagen.

The contents of this message, as well as any enclosures, are addressed pers=
onally to, and thus solely intended for the addressee. They may contain inf=
ormation regarding a third party. A recipient who is neither the addressee,=
 nor empowered to receive this message on behalf of the addressee, is kindl=
y requested to immediately inform the sender of receipt, and to destroy the=
 message and the enclosures. Any use of the contents of this message and/or=
 the enclosures by any other person than the addressee or person who is emp=
owered to receive this message, is illegal towards the sender and/or the af=
orementioned third party. TOPIC Embedded Systems is not  liable for any dam=
age as a result of the use and/or acceptance of this message and as well as=
 any enclosures.
________________________________________
Van: openembedded-core-bounces@lists.openembedded.org [openembedded-core-bo=
unces@lists.openembedded.org] namens Marcin Juszkiewicz [marcin.juszkiewicz=
@linaro.org]
Verzonden: zaterdag 19 januari 2013 10:56
Aan: openembedded-core@lists.openembedded.org
Onderwerp: Re: [OE-core] [PATCH] pulseaudio: Pulseaudio DEPENDS on libjson

W dniu 19.01.2013 10:20, mike.looijmans@topic.nl pisze:
> From: MiLo <milo-software@users.sourceforge.net>
>
> The configure script tests for libjson's presence. The missing dependency
> becomes apparent when building without x11 or gnome.
>
> Signed-off-by: MiLo <milo-software@users.sourceforge.net>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index 6633e38..1fcc07c 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc

> -DEPENDS =3D "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libt=
ool \
> +DEPENDS =3D "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libt=
ool libjson \

You use other version than 2.1 - right?

10:56 hrw@puchatek:pulseaudio$ cat pulseaudio_2.1.bb
require pulseaudio.inc

PR =3D "r15"

DEPENDS +=3D "libjson gdbm speex libxml-parser-perl-native"


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


