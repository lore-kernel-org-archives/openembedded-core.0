Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QSQHP-0003oy-Tx
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 11:02:55 +0200
Received: by wye20 with SMTP id 20so1441354wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2011 01:59:43 -0700 (PDT)
Received: by 10.217.1.212 with SMTP id n62mr7059064wes.25.1307091583200;
	Fri, 03 Jun 2011 01:59:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l5sm709883weq.33.2011.06.03.01.59.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Jun 2011 01:59:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307089477.27470.625.camel@rex>
Date: Fri, 3 Jun 2011 10:59:40 +0200
Message-Id: <B595F1CC-0267-4613-81F5-5312E6343403@dominion.thruhere.net>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<BANLkTi=q-bMwYtjTAqAXeaB4QQ_n85y8Rw@mail.gmail.com>
	<1307032661.27470.581.camel@rex>
	<201106021806.13486.raj.khem@gmail.com>
	<F6127B53-6B93-4059-AD34-2D0AF130AA9B@dominion.thruhere.net>
	<1307089477.27470.625.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/3] busybox: enable mdev by default
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
X-List-Received-Date: Fri, 03 Jun 2011 09:02:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 jun 2011, om 10:24 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-06-03 at 08:37 +0200, Koen Kooi wrote:
>> Op 3 jun 2011, om 03:06 heeft Khem Raj het volgende geschreven:
>>=20
>>> On Thursday, June 02, 2011 09:37:41 AM Richard Purdie wrote:
>>>> On Wed, 2011-06-01 at 20:40 +0000, Otavio Salvador wrote:
>>>>> On Wed, Jun 1, 2011 at 20:37, Phil Blundell <pb@pbcl.net> wrote:
>>>>>> On Wed, 2011-06-01 at 20:09 +0000, Otavio Salvador wrote:
>>>>>>> -# CONFIG_MDEV is not set
>>>>>>> +CONFIG_MDEV=3Dy
>>>>>>=20
>>>>>> Per previous discussion, I am still uneasy about this change.  I =
think
>>>>>> we really need some sort of coherent policy for what exactly the
>>>>>> default busybox configuration in oe-core is meant to be doing, =
and
>>>>>> then (if necessary) a set of patches to make it match the policy.=20=

>>>>>> Just flipping random features on and off does not seem like a =
good way
>>>>>> to proceed.
>>>>>=20
>>>>> OE-core has support to mdev as device handling mechanism as such =
this
>>>>> ought to be enabled by default IMO.
>>>>>=20
>>>>> Personally it doesn't matter since I have already overriden it in =
my
>>>>> internal layer.
>>>>=20
>>>> I'm afraid I'm with Phil on this. I don't like the idea of enabling
>>>> something we don't actually use. This really needs to become some =
kind
>>>> of configure option which would at the same time disable/replace =
udev so
>>>> the patch in its currently form isn't acceptable.
>>>>=20
>>>=20
>>> mdev or udev are image features so probably should be controlled by=20=

>>> IMAGE_FEATURES or some such
>>=20
>> You can't put IMAGE_FEATURES in the equivalent of EXTRA_OECONF since
>> the packages in the feeds don't magically change when being installed
>> in a different image.
>=20
> Right, it would have to be a DISTRO_FEATURE for that reason...

Right, but you can build mdev and choose not to use it, which is what =
.dev currently does. So while the distro could in theory set a =
DISTRO_FEATURE, we shouldn't make other decisions based on that, like =
deciding that if mdev is in DISTRO_FEATURES every image will use it.

regards,

Koen=


