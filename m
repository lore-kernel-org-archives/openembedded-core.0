Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QjZ2C-0004Bz-2u
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 17:50:04 +0200
Received: by wyg30 with SMTP id 30so288159wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 08:45:57 -0700 (PDT)
Received: by 10.216.143.66 with SMTP id k44mr755907wej.81.1311176757452;
	Wed, 20 Jul 2011 08:45:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gg16sm298206wbb.17.2011.07.20.08.45.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 08:45:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CADkTA4MetjKoZfS7gcKSm9wm3iQZoxaJPqmrJ6KBOWsXF1QVSQ@mail.gmail.com>
Date: Wed, 20 Jul 2011 17:45:50 +0200
Message-Id: <772ABCD3-A957-469A-A2AB-F2C27A0A5F0C@dominion.thruhere.net>
References: <1310736077.3805.37.camel@phil-desktop>
	<CADkTA4OYB0mch1SRSgidwGfZiWBeBuaWKH1BU1NgF9jPVa1Niw@mail.gmail.com>
	<1310742175.30326.1.camel@phil-desktop>
	<CADkTA4MoCmtKypORoGvShciAgiFsOJFLmSiAQiVdAxLAYKkyHQ@mail.gmail.com>
	<CADkTA4MetjKoZfS7gcKSm9wm3iQZoxaJPqmrJ6KBOWsXF1QVSQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: kernels
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
X-List-Received-Date: Wed, 20 Jul 2011 15:50:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 jul 2011, om 17:42 heeft Bruce Ashfield het volgende geschreven:

> On Fri, Jul 15, 2011 at 11:36 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Fri, Jul 15, 2011 at 11:02 AM, Phil Blundell <philb@gnu.org> =
wrote:
>>> On Fri, 2011-07-15 at 09:51 -0400, Bruce Ashfield wrote:
>>>> On Fri, Jul 15, 2011 at 9:21 AM, Phil Blundell <pb@pbcl.net> wrote:
>>>>> The other day I was working on a BSP layer for a fairly generic =
i586
>>>>> system and I was struck by the fact that we don't appear to have =
any
>>>>> vanilla kernel recipes in oe-core.  I had sort of expected that, =
to get
>>>>> a standard bzImage out, I would just need to ship an appropriate
>>>>> defconfig in my layer and everything else would "just work".
>>>>=20
>>>> Hmm. Perhaps it isn't documented clearly enough as such, but the =
linux-yocto
>>>> kernel base can work in this mode, since that was a design goal of
>>>> 1.0.
>>>>=20
>>>> You pick a branch, throw in a config fragment (or defconfig if you =
really
>>>> want)  and build. The base branches in the tree are generic enough =
to
>>>> sort a range of boards out of the box, and should form a base.
>>>=20
>>> Okay, cool.  I'll give it a go and see how I get on.
>>>=20
>>> Is there a description anywhere of what the functional differences =
are
>>> between the code in linux-yocto git and the upstream kernel.org =
tree?
>>=20
>> It varies, and the variables are many, so I can answer this in =
several ways.
>=20
> Following up on my own email. I'm just about to push out the 3.0
> kernel support / changes, so I'm seeing the light at the end of the =
tunnel
> and recalled that this is still hanging a bit.
>=20
> Is there anything tangible you wanted me to do here ?  Create an =
example ?
> Write a short howto  .. or something else ?

A guide to make your own setup that isn't based on linux-yocto but which =
does work with the linux-yocto bbclass?=


