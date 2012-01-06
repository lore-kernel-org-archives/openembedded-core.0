Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RjCyl-0002s2-QL
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 17:49:19 +0100
Received: by wgbds11 with SMTP id ds11so1624425wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 08:41:55 -0800 (PST)
Received: by 10.180.101.35 with SMTP id fd3mr12383487wib.22.1325868115726;
	Fri, 06 Jan 2012 08:41:55 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id em4sm68874701wbb.20.2012.01.06.08.41.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 08:41:55 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1325867267.14746.8.camel@ted>
Date: Fri, 6 Jan 2012 17:41:52 +0100
Message-Id: <A309F06A-FC39-48FD-BBCF-3AC53984B5FA@dominion.thruhere.net>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
	<1325867267.14746.8.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 0/7][PULL] Hob2 related oe-core changes
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
X-List-Received-Date: Fri, 06 Jan 2012 16:49:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 jan. 2012, om 17:27 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-01-06 at 17:04 +0800, Dongxiao Xu wrote:
>> Hi Richard,
>>=20
>> This pull request is the hob2 related oe-core changes.
>> Please help to review and pull.
>>=20
>> Note that this pull request has dependency on the hob related bitbake =
changes.
>>=20
>> Thanks,
>> Dongxiao
>>=20
>> The following changes since commit =
4a85312568a6bb052cc511c15b4ae842ff7f8e59:
>>  Richard Purdie (1):
>>        image-mklibs/package_ipk: Remove bashisms
>>=20
>> are available in the git repository at:
>>=20
>>  git://git.pokylinux.org/poky-contrib dxu4/hob-oecore-changes
>>  =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddxu4/hob-oecore-ch=
anges
>>=20
>> Dongxiao Xu (6):
>>  bblayers.conf.sample: Use ?=3D to set BBLAYERS
>>  image.bbclass: Use ?=3D to set LINGUAS_INSTALL
>=20
> I merged these.
>=20
>>  packageinfo.bbclass: add a new bbclass to pass package information
>=20
> I still have quite a strong dislike of this code, its rather nasty to
> require this and I wish we could come up with a less ugly way to =
collect
> up this information.
>=20
>>  hob.bb: Add a empty image template
>>  hob-toolchain: add a new recipe hob-toolchain
>>  layers: add a new folder to put user added layers
>=20
> I don't like these three. They're horribly hob specific and IMO
> shouldn't be in the general metadata. If there is no way to avoid =
them,
> they should perhaps go into a meta-hob layer directory to keep them
> separate from the rest of the system.

And I still don't get why hob can't load local.conf to load the defaults =
instead of ignoring it completely.=20=


