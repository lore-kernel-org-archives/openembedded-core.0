Received: from 1.mo1.mail-out.ovh.net ([178.32.127.22]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R4UKx-0001lo-C0
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 11:03:55 +0200
Received: from mail194.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 2692710086E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 10:49:46 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Sep 2011 10:49:00 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Sep 2011 10:48:59 +0200
Message-ID: <4E730D7A.7010700@eukrea.com>
Date: Fri, 16 Sep 2011 10:48:58 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
References: <0C757E680E33864AB113392C7E83F910BE51E8@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE51E8@GSX300A.mxchg.m.corp>
X-Ovh-Tracer-Id: 971088670627900866
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrfeehucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Cc: Wolfgang.Hauser.external@cassidian.com
Subject: Re: Backporting qt4 to 2011.03-maintenance
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
X-List-Received-Date: Fri, 16 Sep 2011 09:03:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Wolfgang,

Le 16/09/2011 10:46, Hauser, Wolfgang (external) a =E9crit :
> is it possible to take the recipes for qt 4.7.x from oe-core and use it=
 in
> a 2011.03-maintenance tag based OE environment ?
>
> What are the main differences, if there are one ?
>
I would recommend to update qt to 4.7.4 (git mv + checksum change) + inte=
grate=20
the blacklist-diginotar-certs patch in oe-dev as qt in oe-core is not yet=
 at=20
the functional level of oe-dev (broken SDK, broken translations ...).

Eric


