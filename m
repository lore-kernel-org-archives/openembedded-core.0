Received: from 2.mo5.mail-out.ovh.net ([178.33.109.111]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R4EYv-0002Rd-MY
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 18:13:17 +0200
Received: from mail183.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 250E11020A8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 18:08:33 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 Sep 2011 18:08:07 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 15 Sep 2011 18:08:06 +0200
Message-ID: <4E7222E5.6070401@eukrea.com>
Date: Thu, 15 Sep 2011 18:08:05 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
References: <1316078776-19890-1-git-send-email-denis@eukrea.com>
	<1316078776-19890-2-git-send-email-denis@eukrea.com>
In-Reply-To: <1316078776-19890-2-git-send-email-denis@eukrea.com>
X-Ovh-Tracer-Id: 2514697444070895042
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Subject: Re: [PATCH 1/2] qt4.inc: package qtdemo's docs in a separate package
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
X-List-Received-Date: Thu, 15 Sep 2011 16:13:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 15/09/2011 11:26, Denis Carikli a =C3=A9crit :
> The documentation was 285M and doesn't fit on the NAND of many machines=
,
>    but in another had part of the documentation is needed for the
>    QT demos, so we split the documentation: so qt demo only RRECOMMAND
>    the documentation that it really needs.
>
> Thanks to Eric B=C3=A9nard for explaining me how to split it.
>
and in fact after testing, my initial guess was wrong so Denis will post =
an=20
updated patch which works.

Eric


