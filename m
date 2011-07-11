Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgBgN-0002eO-0g
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 10:17:35 +0200
Received: by wwi14 with SMTP id 14so1967891wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 01:13:39 -0700 (PDT)
Received: by 10.227.39.66 with SMTP id f2mr4055795wbe.2.1310372019301;
	Mon, 11 Jul 2011 01:13:39 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gd1sm5159758wbb.61.2011.07.11.01.13.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 01:13:38 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E1AAC1A.6090308@intel.com>
Date: Mon, 11 Jul 2011 10:13:32 +0200
Message-Id: <D504B8DC-24B9-46A9-AA2B-735D200B2F87@dominion.thruhere.net>
References: <cover.1310368636.git.ke.yu@intel.com>
	<C833B024-D1B6-40F9-9ED6-B008FEEA483E@dominion.thruhere.net>
	<4E1AAC1A.6090308@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 00/10] [RFC] patch for non /usr/lib libdir - V2
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
X-List-Received-Date: Mon, 11 Jul 2011 08:17:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jul 2011, om 09:54 heeft Yu Ke het volgende geschreven:

> on 2011-7-11 15:40, Koen Kooi wrote:
>>=20
>> Op 11 jul 2011, om 09:23 heeft Yu Ke het volgende geschreven:
>>=20
>>> This is the V2 patches. the changes compared to V1 are:
>>> - revise python patch to make the sys.lib deriving from libdir, =
instead of hardcode to lib64
>>> - add two more fixes: sat-solver and libzypp, with these two more =
fixes, i can build
>>>  qemux86-64 core-image-sato and core-image-sato-sdk with =
libdir=3D/usr/lib64
>>>=20
>>> Next step, I will do through test to make sure it does not impact =
normal libdir=3D/usr/lib case
>>>=20
>>> The following changes since commit =
2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
>>>  Tom Zanussi (1):
>>>        systemtap: remove non-core COMPATIBLE_MACHINES
>>>=20
>>> are available in the git repository at:
>>>=20
>>>  git://git.pokylinux.org/poky-contrib kyu3/libdir-fix-v2
>>=20
>> Do you also have patches against oe-core instead of poky?
>=20
> Not yet. But I assume the difference between poky and oe-core is very =
small. do you see issue of applying these patches to oe-core? if so, I =
am happy to rebase this patch against oe-core.

'git merge' won't work if you publish a tree against poky. I can cherry =
pick 2 or 3 patches, but 10 is way too many :)=


