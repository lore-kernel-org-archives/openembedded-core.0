Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWDvm-0000Jv-NH
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 22:40:20 +0200
Received: by wwb17 with SMTP id 17so4375099wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 13:36:54 -0700 (PDT)
Received: by 10.216.205.26 with SMTP id i26mr5668093weo.58.1307997413818;
	Mon, 13 Jun 2011 13:36:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 74sm3126663wem.17.2011.06.13.13.36.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 13:36:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DF672F2.2030909@linux.intel.com>
Date: Mon, 13 Jun 2011 22:36:51 +0200
Message-Id: <49501374-7FBE-400E-A91B-BD7EBD7FB65C@dominion.thruhere.net>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
	<4DF672F2.2030909@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Mon, 13 Jun 2011 20:40:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jun 2011, om 22:28 heeft Saul Wold het volgende geschreven:

> On 06/13/2011 11:31 AM, Koen Kooi wrote:
>> Hi,
>>=20
>> Khem was asking if I could reproduce the recent x86 breakage he was =
seeing[1] and I ran into another bug:
>>=20
>> koen@dominion:/OE/tentacle/sources/meta-intel$ git blame =
meta-n450/conf/machine/n450.conf  | grep atom
>> 158f88d7 (Saul Wold   2011-01-03 15:33:52 -0800  6) require =
conf/machine/atom-pc.conf
>>=20
> meta-yocto seems to be the place you need to look!
>=20
> I hope that the layering tools can help to detect and inform folks of =
this like of dependency.

Isn't meta-yocto supposed to a the integration layer with no new parts? =
I can't use meta-yocto since it has conflicting beagleboard stuff in it, =
which means that meta-intel is now broken for me as well. That surely =
isn't the intended plan?!?!=


