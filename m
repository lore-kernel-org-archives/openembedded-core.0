Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RBDOl-00081P-Q3
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:23:39 +0200
Received: by gyg8 with SMTP id 8so997156gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 15:18:05 -0700 (PDT)
Received: by 10.236.183.170 with SMTP id q30mr10144081yhm.42.1317766685267;
	Tue, 04 Oct 2011 15:18:05 -0700 (PDT)
Received: from [10.74.16.251] ([198.47.23.255])
	by mx.google.com with ESMTPS id f24sm21409969yhk.5.2011.10.04.15.18.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Oct 2011 15:18:04 -0700 (PDT)
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted>
	<20110930164658.GB7364@jama.jama.net>
	<1317402578.12332.218.camel@ted>
	<CAP9ODKqb8RGLi_5-_+uegLmtZ7Wo-70oDJcF_R6yaSJ2q9mGwg@mail.gmail.com>
	<1317765609.14671.118.camel@ted>
In-Reply-To: <1317765609.14671.118.camel@ted>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <8B86DE10-DF74-4727-B6FF-0CD3FAB992CF@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 4 Oct 2011 17:18:00 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Tue, 04 Oct 2011 22:23:40 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 4 okt. 2011 om 17:00 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Sat, 2011-10-01 at 15:48 -0300, Otavio Salvador wrote:
>> On Fri, Sep 30, 2011 at 14:09, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> ...
>>> Thanks. I've taken the two patches. I'd love to get rid of hal, in fact
>>> its on my list of things that need to migrate out of OE-Core...
>> ...
>>=20
>> =46rom default images this shouldn't be difficult but don't remove hal
>> from oe-core since many embedded OS still use it and haven't migrate
>> to udev or devicekit yet.
>=20
> Really? hal doesn't really replace udev though, we can just use udev
> directly in place of it for many things now?
>=20
> Specifically which applications are people using with dependencies on
> hal? As has been pointed out we can fix the xserver and that appears to
> be the only thing remaining in OE-Core?

Angstrom is completely hal-less nowadays :)




>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


