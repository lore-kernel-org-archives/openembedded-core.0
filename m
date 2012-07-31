Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SwIey-00018c-Gv
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 22:03:16 +0200
Received: from mail46-db3-R.bigfish.com (10.3.81.231) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Tue, 31 Jul 2012 19:36:36 +0000
Received: from mail46-db3 (localhost [127.0.0.1])	by mail46-db3-R.bigfish.com
	(Postfix) with ESMTP id F005D14010A	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 19:36:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail46-db3 (localhost.localdomain [127.0.0.1]) by mail46-db3
	(MessageSwitch) id 1343763394552310_28880;
	Tue, 31 Jul 2012 19:36:34 +0000 (UTC)
Received: from DB3EHSMHS011.bigfish.com (unknown [10.3.81.253])	by
	mail46-db3.bigfish.com (Postfix) with ESMTP id 851A44C0134	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 19:36:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS011.bigfish.com
	(10.3.87.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 31 Jul 2012 19:36:33 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Tue, 31 Jul 2012 14:36:31 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] static busybox?
Thread-Index: AQHNb1PJMQGjJxQd806Sv9xDOQ6NUw==
Date: Tue, 31 Jul 2012 19:36:30 +0000
Message-ID: <CAEsOVNeJxw0VbwPX+90riJeVzTQYLdR7dCp==TiCj+eCe=eExw@mail.gmail.com>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
In-Reply-To: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: static busybox?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 31 Jul 2012 20:03:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F54F1CDC069E2647822507BA88043486@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 1:14 PM, Stuart Yoder <b08248@gmail.com> wrote:
> We are doing some work with LXC (containers) and one of the templates
> is for busybox.  For LXC, the busybox package needs to be built staticall=
y and
> there is a config option for this.
>
> A couple possible approaches:
>
>    -create a new 'busybox_static' recipe that the lxc package
>     depends on that turns on the needed build options.   Pretty
>     straightforward, but now there are 2 variants of the busybox
>     package.

This would seem to work OK with RDEPENDS +=3D "busybox-static" and just
adding the extra static bits for for the static version. It seems OK
except we would/could start to get lots of recipes like this.

>    -somehow propagate some configuration options through to
>     the standard busybox recipe so it turns on the config
>     option to build things statically.   Not sure how to
>     do this, and seems like it could get pretty messy.

Are there any mechanism that currently exist for this? We could turn
on a DISTRO_FEATURE if we knew we were going use lxc, but that's more
involved than just adding the lxc recipe and getting the right stuff
in the root file system.

Does anyone else have any thoughts on the best approach here?

-M=



