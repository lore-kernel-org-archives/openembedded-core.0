Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QSRt8-0005FF-IG
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 12:45:59 +0200
Received: by mail-ww0-f43.google.com with SMTP id 17so1305862wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2011 03:42:41 -0700 (PDT)
Received: by 10.216.230.76 with SMTP id i54mr1628409weq.108.1307097760838;
	Fri, 03 Jun 2011 03:42:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o75sm765148weq.16.2011.06.03.03.42.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Jun 2011 03:42:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307094615.5715.1.camel@rex>
Date: Fri, 3 Jun 2011 12:42:38 +0200
Message-Id: <E65362B5-F28D-4336-8FDC-7FC2EBC84EE6@dominion.thruhere.net>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<BANLkTi=q-bMwYtjTAqAXeaB4QQ_n85y8Rw@mail.gmail.com>
	<1307032661.27470.581.camel@rex>
	<201106021806.13486.raj.khem@gmail.com>
	<F6127B53-6B93-4059-AD34-2D0AF130AA9B@dominion.thruhere.net>
	<1307089477.27470.625.camel@rex>
	<B595F1CC-0267-4613-81F5-5312E6343403@dominion.thruhere.net>
	<1307094615.5715.1.camel@rex>
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
X-List-Received-Date: Fri, 03 Jun 2011 10:45:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 jun 2011, om 11:50 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-06-03 at 10:59 +0200, Koen Kooi wrote:
>> Op 3 jun 2011, om 10:24 heeft Richard Purdie het volgende geschreven:
>>=20
>>> On Fri, 2011-06-03 at 08:37 +0200, Koen Kooi wrote:
>>>> Op 3 jun 2011, om 03:06 heeft Khem Raj het volgende geschreven:
>>>>=20
>>>>> On Thursday, June 02, 2011 09:37:41 AM Richard Purdie wrote:
>>>>>> On Wed, 2011-06-01 at 20:40 +0000, Otavio Salvador wrote:
>>>>>>> On Wed, Jun 1, 2011 at 20:37, Phil Blundell <pb@pbcl.net> wrote:
>>>>>>>> On Wed, 2011-06-01 at 20:09 +0000, Otavio Salvador wrote:
>>>>>>>>> -# CONFIG_MDEV is not set
>>>>>>>>> +CONFIG_MDEV=3Dy
>>>>>>>>=20
>>>>>>>> Per previous discussion, I am still uneasy about this change.  =
I think
>>>>>>>> we really need some sort of coherent policy for what exactly =
the
>>>>>>>> default busybox configuration in oe-core is meant to be doing, =
and
>>>>>>>> then (if necessary) a set of patches to make it match the =
policy.=20
>>>>>>>> Just flipping random features on and off does not seem like a =
good way
>>>>>>>> to proceed.
>>>>>>>=20
>>>>>>> OE-core has support to mdev as device handling mechanism as such =
this
>>>>>>> ought to be enabled by default IMO.
>>>>>>>=20
>>>>>>> Personally it doesn't matter since I have already overriden it =
in my
>>>>>>> internal layer.
>>>>>>=20
>>>>>> I'm afraid I'm with Phil on this. I don't like the idea of =
enabling
>>>>>> something we don't actually use. This really needs to become some =
kind
>>>>>> of configure option which would at the same time disable/replace =
udev so
>>>>>> the patch in its currently form isn't acceptable.
>>>>>>=20
>>>>>=20
>>>>> mdev or udev are image features so probably should be controlled =
by=20
>>>>> IMAGE_FEATURES or some such
>>>>=20
>>>> You can't put IMAGE_FEATURES in the equivalent of EXTRA_OECONF =
since
>>>> the packages in the feeds don't magically change when being =
installed
>>>> in a different image.
>>>=20
>>> Right, it would have to be a DISTRO_FEATURE for that reason...
>>=20
>> Right, but you can build mdev and choose not to use it, which is
>> what .dev currently does. So while the distro could in theory set a
>> DISTRO_FEATURE, we shouldn't make other decisions based on that, like
>> deciding that if mdev is in DISTRO_FEATURES every image will use it.
>=20
> Why we wouldn't enable that functionality based on the option?

I was going to write a lengthy response, but Phil summed it up way too =
well in =
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/003702.ht=
ml :)=


