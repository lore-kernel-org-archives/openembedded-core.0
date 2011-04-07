Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q7iS6-0005tJ-LK
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 08:12:22 +0200
Received: by wwi18 with SMTP id 18so4603478wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 23:10:15 -0700 (PDT)
Received: by 10.227.21.217 with SMTP id k25mr442766wbb.135.1302156614976;
	Wed, 06 Apr 2011 23:10:14 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id e13sm812038wbi.6.2011.04.06.23.10.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 23:10:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D9CB030.5020409@mentor.com>
Date: Thu, 7 Apr 2011 08:10:13 +0200
Message-Id: <062BACD4-E0EE-4A0B-8FC8-A5AB153E9D0A@dominion.thruhere.net>
References: <1302001365.24596.459.camel@rex>
	<BANLkTim4ouc6ssOhfU4Dd8OfEq81MfC_gQ@mail.gmail.com>
	<4D9CB030.5020409@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Thu, 07 Apr 2011 06:12:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 apr 2011, om 20:25 heeft Tom Rini het volgende geschreven:

> On 04/06/2011 01:47 AM, Frans Meulenbroeks wrote:
>> 2011/4/5 Richard Purdie <richard.purdie@linuxfoundation.org>:
>>=20
>> [...]
>>>=20
>>> Does this make sense to everyone, are there any questions/ =
objections/
>>> concerns/ things I've missed?
>>=20
>> I think most embedded systems would only use one lib. To take your
>> lib/lib64 example:
>> If I am developing for an embedded system I know whether it will run
>> as 32 or 64 bit, so there is no need to have both.
>=20
> What about the case of new 64bit hardware and legacy software that's
> still 32bit?  This is a problem that embedded systems have and OE =
needs
> to support
>=20
>> multilib has its merits when it comes to supporting multiple hardware =
systems.
>> However as in the embedded world one is typically targeting a =
specific
>> hardware configuration.
>> (actually I don't recall having seen requests for multilib on the ML
>> before, although I could have missed it).
>=20
> You missed it :)  Roman Khimov posted a very basic thing years ago for
> dealing with the x86/x86_64 problem.

And Graeme fixed another batch of multilib problems way back at OEDEM in =
Berlin (2006?). So it has been on the table for a while :)

regards,

Koen=


