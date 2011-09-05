Received: from 14.mo1.mail-out.ovh.net ([178.32.97.215]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R0dnc-0000lh-0A
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 20:21:36 +0200
Received: from mail179.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 0332D1010AD6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 17:48:25 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Sep 2011 17:48:00 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 5 Sep 2011 17:47:59 +0200
Message-ID: <4E64EF2F.5060304@eukrea.com>
Date: Mon, 05 Sep 2011 17:47:59 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
References: <1315229054-1859-1-git-send-email-denis@eukrea.com>
	<FA68554D-DEC9-44B3-8971-AA7F01B068A8@dominion.thruhere.net>
In-Reply-To: <FA68554D-DEC9-44B3-8971-AA7F01B068A8@dominion.thruhere.net>
X-Ovh-Tracer-Id: 17234994300548001218
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrudekucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 05 Sep 2011 18:21:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Le 05/09/2011 17:38, Koen Kooi a =E9crit :
> Op 5 sep. 2011 om 15:24 heeft Denis Carikli<denis@eukrea.com>  het volg=
ende geschreven:
>
>> The documentation is 285M and doesn't fit on the NAND of many machines=
.
>
> That does remove all the descriptions from the qtdemo app, so removing =
all docs isn't a good idea
>
yes, that brings oe-core to the oe dev state (where the docs were not ins=
talled).
This makes qt4-demo images usable on systems with 256 MB flash because th=
e doc=20
package is huge.

Next step will be to split the doc package in order to have the descripti=
ons=20
in one package and the code in an other one. We will try to find time to =
do=20
this in a few days.

Eric


