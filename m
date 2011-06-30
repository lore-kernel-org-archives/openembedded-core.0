Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcFWe-0007bR-Ij
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 13:35:18 +0200
Received: by wyg30 with SMTP id 30so1665768wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 04:31:33 -0700 (PDT)
Received: by 10.227.135.9 with SMTP id l9mr1685712wbt.34.1309433101632;
	Thu, 30 Jun 2011 04:25:01 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm1561868wbh.12.2011.06.30.04.25.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 04:25:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309432642.2551.131.camel@phil-desktop>
Date: Thu, 30 Jun 2011 13:24:58 +0200
Message-Id: <BF22A833-DD0C-41FB-B9AF-CB871B8A1E7A@dominion.thruhere.net>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
	<1309277475.20015.320.camel@rex>
	<AE12D97B-A9AF-4516-93D2-7A5655B46844@dominion.thruhere.net>
	<1309354589.2551.40.camel@phil-desktop>
	<1309355375.20015.383.camel@rex>
	<1309432642.2551.131.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Thu, 30 Jun 2011 11:35:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 jun 2011, om 13:17 heeft Phil Blundell het volgende geschreven:

> On Wed, 2011-06-29 at 14:49 +0100, Richard Purdie wrote:
>> On Wed, 2011-06-29 at 14:36 +0100, Phil Blundell wrote:
>>> On Tue, 2011-06-28 at 22:32 +0200, Koen Kooi wrote:
>>>> =46rom =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=3D=
yocto&id=3D0d0e14cda2ddd881d09798b0e6edd8086aa9b6d9
>>>>=20
>>>> +libc6 -> libc6_dev;
>>>>=20
>>>> So libc6 now depends on libc6-dev :(
>>>=20
>>> I guess it would be straightforward to patch insane.bbclass to =
detect
>>> that particular failure (which does indeed seem to happen to libc
>>> distressingly often).  It already diagnoses the case where a package
>>> erroneously depends on a -dbg package, and I can't think of any =
reason
>>> why the same logic couldn't be applied to -dev.
>>=20
>> I'd love to see a patch for this! :)
>=20
> Your wish, naturally, is my command.  I've built micro-base-image with
> this and verified that I didn't get any false positives; I also =
checked
> (via some manual fiddling) that it did indeed detect the case that we
> want it to. =20
>=20
> I guess it might be a good idea for someone to test it with a slightly
> larger dataset before actually checking it in, just in case.

Does it whitelist recipes that inherit task.bbclass? I have tasks used =
for beagleboard workshops that drag in the native toolchain and headers =
for the things we need to build against (e.g. opencv, qt).

regards,

Koen=


