Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMlJw-00074o-OH
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 20:18:08 +0200
Received: by wwb17 with SMTP id 17so1695487wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 11:15:10 -0700 (PDT)
Received: by 10.227.182.136 with SMTP id cc8mr2164946wbb.77.1305742509876;
	Wed, 18 May 2011 11:15:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w25sm1120635wbd.22.2011.05.18.11.15.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 11:15:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTinwdO5XBGH=py2iw0kyJt6o77q7rw@mail.gmail.com>
Date: Wed, 18 May 2011 20:15:03 +0200
Message-Id: <CF837081-FAD3-4922-975B-B3CB6DD60533@dominion.thruhere.net>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
	<BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
	<1305738527.18415.126.camel@lenovo.internal.reciva.com>
	<8A91C5F6-313A-4A0F-A18E-094CFC3BB337@dominion.thruhere.net>
	<BANLkTinvqEeyXsiH79UHb3Zhx+qkXZRJ5w@mail.gmail.com>
	<BANLkTinwdO5XBGH=py2iw0kyJt6o77q7rw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Wed, 18 May 2011 18:18:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2011, om 20:07 heeft Khem Raj het volgende geschreven:

> On Wed, May 18, 2011 at 10:52 AM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> Hello,
>>=20
>> On Wed, May 18, 2011 at 7:29 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>=20
>>> Op 18 mei 2011, om 19:08 heeft Phil Blundell het volgende =
geschreven:
>>>=20
>>>> On Wed, 2011-05-18 at 09:40 -0700, Khem Raj wrote:
>>>>> Problem I have is, I dont want udev in RDEPENDS which is added by
>>>>> task-core-boot
>>>>> and task-core-boot is added to DISTRO_EXTRA_RDEPENDS through
>>>>> default-distrovars.inc -> defaultsetup.conf -> bitbake.conf
>>>>>=20
>>>>> and my distro adds DISTRO_EXTRA_RDEPENDS to its RDEPENDS
>>>>> as I think the variable is meant for distro's to define some extra
>>>>> stuff if needed.
>>>>>=20
>>>>> How should I solve this problem ?
>>>>=20
>>>> Well, what I did in micro-base-image was simply to not use
>>>> task-core-boot at all.  But in your case I was thinking that you =
could
>>>> overlay that recipe with from your distro's layer and make it do
>>>> whatever you wanted.
>>>=20
>>> The fact that we have layers does not mean we need to follow the =
silo mentality you seem to prefer. If task-base in oe-core stops being =
usefull we should fix it, now play around in our own little sandboxes.
>>>=20
>> If task-base is getting less useful, removing it altogether (I found
>> the  reasons mentioned by Phil convincing)  should be at least
>> considered as an alternative.
>>=20
>> I am not sure why we should keep task-base as something generic --all
>> distro's have their own specific requirements and configurations, =
even
>> for task-base, so why not move this functionality into the distro and
>> out of oe-core?
>>=20
>> I never quite saw what task-base gained us on a netto basis, but I
>> think I am biased towards small tweaked images, so these are just my
>> two cents.
>>=20
>=20
> there are certain common parts that can be abstracted
> and can be maintained in oe-core so everyone benefits
> from it and certain image specific parts can be done in
> distros. So keeping common parts in core would still
> be better IMO

And in OE .dev we split task-boot from task-base to be able to get the =
benefits from task base without forcing task-boot. OE-core had the same =
till it got forcefully added to the extra depends last week.

regards,

Koen=


