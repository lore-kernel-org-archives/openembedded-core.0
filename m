Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHa0x-00084s-6m for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 14:17:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3AC8Ile025332
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:08:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23457-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:08:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3AC89Z6025318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:08:10 +0100
Message-ID: <1334059689.6861.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Apr 2012 13:08:09 +0100
In-Reply-To: <CAP9ODKrkEomQ+7G5eRAwhKCWiKezAEKwboTfZG8C3sAEdo9PGw@mail.gmail.com>
References: <cover.1334027369.git.lianhao.lu@intel.com>
	<0953244152d03d27f6c60729c58484af81f95a1d.1334027369.git.lianhao.lu@intel.com>
	<637B72D9-1F2D-4CD3-8903-36E73E7CC465@dominion.thruhere.net>
	<CAP9ODKrEiLo7DMkNBks8s8jHw=WgTQ3S_zf-QUYSseLqD5tMEQ@mail.gmail.com>
	<3FB0FE38-93D2-44D1-9BFF-2E742A8BEA92@dominion.thruhere.net>
	<CAP9ODKrkEomQ+7G5eRAwhKCWiKezAEKwboTfZG8C3sAEdo9PGw@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 1/1] connman: optionally build ofono plugin.
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
X-List-Received-Date: Tue, 10 Apr 2012 12:17:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 08:27 -0300, Otavio Salvador wrote:
> On Tue, Apr 10, 2012 at 08:24, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> Can you clarify what is your concerns?
> >
> > It changes the default behaviour. There shouldn't be any behaviour changes so late in the release cycle.
> > And apart from that, it should use PACKAGECONFIG :)
> 
> I agree about PACKAGECONFIG but this behaviour change seems acceptable
> for me since most users won't  be using 3g and will be not affected by
> this.

So how about we just add ophono to DEPENDS for 1.2 (since its implied
and enabled as things stand) and then in 1.3 we use PACKAGECONFIG?

Cheers,

Richard




