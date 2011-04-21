Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCxhL-0005sh-0K
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 19:29:47 +0200
Received: by wwb17 with SMTP id 17so1979657wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 10:27:22 -0700 (PDT)
Received: by 10.227.12.13 with SMTP id v13mr196616wbv.134.1303406842744;
	Thu, 21 Apr 2011 10:27:22 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id w12sm1308957wby.41.2011.04.21.10.27.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 10:27:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110421165711.GA25621@xora-desktop.xora.org.uk>
Date: Thu, 21 Apr 2011 19:27:18 +0200
Message-Id: <D92FBC8F-FB70-4551-96DE-5B7AC333DB89@dominion.thruhere.net>
References: <201104211704.37707.paul.eggleton@linux.intel.com>
	<20110421165711.GA25621@xora-desktop.xora.org.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC] meta-handheld
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
X-List-Received-Date: Thu, 21 Apr 2011 17:29:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 apr 2011, om 18:57 heeft Graeme Gregory het volgende geschreven:

> On Thu, Apr 21, 2011 at 05:04:37PM +0100, Paul Eggleton wrote:
>> Hi all,
>>=20
>> I've discussed the possibility with a few people on IRC of creating a =
meta-
>> handheld layer for support of older handheld devices - this would =
include=20
>> Zaurus, iPAQ, SimPad, etc; possibly even EZX phones if they aren't in =
a layer=20
>> of their own. These machines share a fair amount of commonality and I =
don't=20
>> think that they will all survive if each one has to be put into a BSP =
of its=20
>> own. Response so far seems to be positive but I'd like to hear =
thoughts from=20
>> others on this.
>>=20
>> I have access to many of these devices, and this is something I am =
prepared to=20
>> maintain on my own time, although I would appreciate help from =
others. I have=20
>> the basis of a layer from what was left in oe-core and meta-extras =
but quite a=20
>> lot of it would need to be brought over from OE.
>>=20
>> If people agree that this is a good idea, the next question would be =
where to=20
>> host it - is this something that could be within the meta-oe =
repository?
>>=20
> Grabbing all of these barely supported machines into their own layer =
sounds
> like a good plan to me.
>=20
> Id suggest just hosting it on gitorious, if its inside OE then there =
is the
> magic assumption from the public that they should work (which is what =
happens
> now). Then people get really dissapointed when I tell them getting it =
to work
> is likely to be a hard slog.

I agree with Graeme on the hosting bit. I also have all the devices you =
mentioned near my desk, so testing should be easy :)

regards,

Koen=


