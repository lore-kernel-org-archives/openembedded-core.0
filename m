Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QSO3R-0001Mj-MD
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 08:40:21 +0200
Received: by wye20 with SMTP id 20so1364880wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 23:37:09 -0700 (PDT)
Received: by 10.216.235.2 with SMTP id t2mr6740618weq.93.1307083029020;
	Thu, 02 Jun 2011 23:37:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et5sm820102wbb.16.2011.06.02.23.37.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 23:37:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201106021806.13486.raj.khem@gmail.com>
Date: Fri, 3 Jun 2011 08:37:06 +0200
Message-Id: <F6127B53-6B93-4059-AD34-2D0AF130AA9B@dominion.thruhere.net>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<BANLkTi=q-bMwYtjTAqAXeaB4QQ_n85y8Rw@mail.gmail.com>
	<1307032661.27470.581.camel@rex>
	<201106021806.13486.raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 03 Jun 2011 06:40:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 jun 2011, om 03:06 heeft Khem Raj het volgende geschreven:

> On Thursday, June 02, 2011 09:37:41 AM Richard Purdie wrote:
>> On Wed, 2011-06-01 at 20:40 +0000, Otavio Salvador wrote:
>>> On Wed, Jun 1, 2011 at 20:37, Phil Blundell <pb@pbcl.net> wrote:
>>>> On Wed, 2011-06-01 at 20:09 +0000, Otavio Salvador wrote:
>>>>> -# CONFIG_MDEV is not set
>>>>> +CONFIG_MDEV=3Dy
>>>>=20
>>>> Per previous discussion, I am still uneasy about this change.  I =
think
>>>> we really need some sort of coherent policy for what exactly the
>>>> default busybox configuration in oe-core is meant to be doing, and
>>>> then (if necessary) a set of patches to make it match the policy.=20=

>>>> Just flipping random features on and off does not seem like a good =
way
>>>> to proceed.
>>>=20
>>> OE-core has support to mdev as device handling mechanism as such =
this
>>> ought to be enabled by default IMO.
>>>=20
>>> Personally it doesn't matter since I have already overriden it in my
>>> internal layer.
>>=20
>> I'm afraid I'm with Phil on this. I don't like the idea of enabling
>> something we don't actually use. This really needs to become some =
kind
>> of configure option which would at the same time disable/replace udev =
so
>> the patch in its currently form isn't acceptable.
>>=20
>=20
> mdev or udev are image features so probably should be controlled by=20
> IMAGE_FEATURES or some such

You can't put IMAGE_FEATURES in the equivalent of EXTRA_OECONF since the =
packages in the feeds don't magically change when being installed in a =
different image.=


