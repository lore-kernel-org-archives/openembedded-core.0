Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R0gZ9-0004dX-3T
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 23:18:51 +0200
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 8C068CA8FE2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 23:13:51 +0200 (CEST)
Received: from [192.168.2.9] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id D72CDA6237
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 23:13:46 +0200 (CEST)
Message-ID: <4E653B89.2030808@eukrea.com>
Date: Mon, 05 Sep 2011 23:13:45 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1315229054-1859-1-git-send-email-denis@eukrea.com>
	<FA68554D-DEC9-44B3-8971-AA7F01B068A8@dominion.thruhere.net>
	<4E64F321.5010008@eukrea.com>
In-Reply-To: <4E64F321.5010008@eukrea.com>
Subject: Re: [PATCH] qt4.inc: remove the optional documentation package from the demo's RRECOMMENDS
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
X-List-Received-Date: Mon, 05 Sep 2011 21:18:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 05/09/2011 18:04, Eric B=E9nard a =E9crit :
> Le 05/09/2011 17:38, Koen Kooi a =E9crit :
>> Op 5 sep. 2011 om 15:24 heeft Denis Carikli<denis@eukrea.com> het volg=
ende
>> geschreven:
>>
>>> The documentation is 285M and doesn't fit on the NAND of many machine=
s.
>>
>> That does remove all the descriptions from the qtdemo app, so removing=
 all
>> docs isn't a good idea
>>
> yes, that brings oe-core to the oe dev state (where the docs were not i=
nstalled).
> This makes qt4-demo images usable on systems with 256 MB flash because =
the doc
> package is huge.
>
FWIW with this patch we have exactly the same behaviour as (for example) =
a=20
Fedora 15 : installing qt-demos brings a qt-demo program which can launch=
 the=20
demos and examples but lacks the explanation text, installing qt-docs bri=
ngs=20
the text (in a 126MB rpm !).

> Next step will be to split the doc package in order to have the descrip=
tions
> in one package and the code in an other one. We will try to find time t=
o do
> this in a few days.
>
in fact the text comes from the html directory in the qt doc which is qui=
te=20
big : 184MB. After a few research, it seems "only" 36MB of these 184MB ar=
e=20
used by qtdemo, so we could quite easily split qt-doc in 2 packages :=20
qt-demo-doc and qt-doc.

Eric


