Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QrmSK-0004UW-Qk
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:47:00 +0200
Received: by wwj26 with SMTP id 26so5329509wwj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 00:42:28 -0700 (PDT)
Received: by 10.227.27.194 with SMTP id j2mr493617wbc.96.1313134947870;
	Fri, 12 Aug 2011 00:42:27 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fn12sm2115737wbb.21.2011.08.12.00.42.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Aug 2011 00:42:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAGiJk9c39t_yvDXbT-ODOXv88hSNkKZyGbXhVouLpHU5j6TgKQ@mail.gmail.com>
Date: Fri, 12 Aug 2011 09:42:24 +0200
Message-Id: <4F2F68E2-0969-41CA-8959-CF4DDA5D0CA4@dominion.thruhere.net>
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
	<20110812062739.GC13857@denix.org>
	<CAGiJk9c39t_yvDXbT-ODOXv88hSNkKZyGbXhVouLpHU5j6TgKQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
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
X-List-Received-Date: Fri, 12 Aug 2011 07:47:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 aug. 2011, om 09:30 heeft Samuel Stirtzel het volgende geschreven:

> 2011/8/12 Denys Dmytriyenko <denis@denix.org>:
>> On Fri, Aug 12, 2011 at 08:17:52AM +0200, Samuel Stirtzel wrote:
>>> Hi,
>>> lately I looked a bit into the structure of OE-Core and found pages
>>> like: http://www.yoctoproject.org/projects/openembedded-core, and
>>> http://openembedded.org/index.php/LayerIndex
>>>=20
>>> 1. question: Are these informations reliable (the layer index page
>>> seems outdated). =46rom the information I found, this graphic was
>>> created as conclusion:
>>> http://imageshack.us/photo/my-images/155/openembeddedlayers.png/
>>>=20
>>> 2.: Currently the "UI layer" seems to be contained in
>>> meta-openembedded, so is this _the_ layer for UI and windowmanager
>>> recipes or is this a subject to change?
>>>=20
>>> 3.: The commercial layer is nowhere found, what are the plans for =
this
>>> layer, or was this just an idea?
>>=20
>> Commercial layers are what envisioned to be provided by OSVs, such as =
Mentor,
>> MontaVista, TimeSys etc...
>>=20
> Missed out that OSV means Open Source Vendor.
> Would recipes for software like the Qt framework or Java fit in this

Qt is already in OE-core

> layer, or is it more for additional recipes to these packages like
> mysql or postgresql plugins for Qt?

And those plugins are already in meta-oe


>>> 4.: In which layer would distributions fit in the graphic?
>>=20
>> In one of the earlier discussions it was said that distribution layer =
is
>> rather vertical and can span across multiple other layers by =
modifying and
>> adjusting different aspects through config files and .bbappends
>>=20
> Thanks for pointing this out.
> I thought that it would be something similar like this, now I got the
> graphic adjusted properly:
> http://imageshack.us/photo/my-images/99/openembeddedlayers.png/
>=20
>>> 5.: Is something important missing / wrong in my graphic (other than
>>> the distro stuff)?
>>=20
>> --
>> Denys
>=20
>=20
> Regards
> Samuel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



