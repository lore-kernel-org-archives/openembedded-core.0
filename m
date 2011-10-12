Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RE5CR-0003UH-Cu
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 22:14:47 +0200
Received: from [192.168.2.12] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 7DBDCA655D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 22:09:02 +0200 (CEST)
Message-ID: <4E95F3DD.6090309@eukrea.com>
Date: Wed, 12 Oct 2011 22:09:01 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
	<49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<4E954984.7020202@eukrea.com> <4E95D811.7090105@gravedo.de>
	<1E1E70C9-6B15-497F-8571-78D2EF0CD081@dominion.thruhere.net>
	<4E95DDD0.7020302@gravedo.de>
	<E575A7CF-9F72-418C-8143-9BA2701599BC@dominion.thruhere.net>
	<4E95E97B.10707@gravedo.de> <4E95EA85.5040301@gravedo.de>
	<4E95EFEB.6040204@gravedo.de>
In-Reply-To: <4E95EFEB.6040204@gravedo.de>
Subject: Re: [oe-core 1/4] qt4-embedded: remove dependency on tslib and use std. linux input
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 20:14:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 12/10/2011 21:52, Simon Busch a =E9crit :
> I will provide another patch in the following days which just makes
> qte.sh use of a std. linux input dev node instead of a tslib one if
> nobody has any objections against this.
>
maybe moving qt4-embedded-conf in its own recipe would be better : that w=
ould=20
allow qte.sh customization without having to rebuild qt4-embedded.
Then you could have qte.sh with linux input in your machine's overlay and=
=20
could keep the default qte.sh as it actually is in oe-core.

Also, does defaulting to linux input dev works in qemu machines (for exam=
ple=20
with qt4e-demo-image ?

Eric


