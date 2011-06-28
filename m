Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbadC-0001uI-E7
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 17:55:18 +0200
Received: by wyg30 with SMTP id 30so278980wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 08:51:37 -0700 (PDT)
Received: by 10.227.36.212 with SMTP id u20mr6803527wbd.35.1309276297245;
	Tue, 28 Jun 2011 08:51:37 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fu18sm252128wbb.27.2011.06.28.08.51.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 08:51:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E09F43E.508@windriver.com>
Date: Tue, 28 Jun 2011 17:51:30 +0200
Message-Id: <C609EBE8-D857-40C9-ADA3-402029871BFD@dominion.thruhere.net>
References: <cover.1309239001.git.dexuan.cui@intel.com>	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>	<4E09E4E6.9040703@windriver.com>	<1865303E0DED764181A9D882DEF65FB6A167F0C715@shsmsx502.ccr.corp.intel.com>	<B2EC960E-7F9F-49BB-BFB0-18C98A7FDE12@dominion.thruhere.net>
	<1865303E0DED764181A9D882DEF65FB6A167F0C716@shsmsx502.ccr.corp.intel.com>
	<4E09F43E.508@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Tue, 28 Jun 2011 15:55:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 17:33 heeft Mark Hatle het volgende geschreven:

> On 6/28/11 10:21 AM, Cui, Dexuan wrote:
>> Koen Kooi wrote:
>>> Op 28 jun 2011, om 16:52 heeft Cui, Dexuan het volgende geschreven:
>>>=20
>>>> Hi, thank you very much for the suggestions!
>>>> I worked out a vesion 2 patch that combines 2 and 3:
>>>> =
http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/banne=
r_v2&id=3D2c2d9d7c0e942b6748bc8bd7d5980113bae9a836
>>>=20
>>> Could you in the future please base them on oe-core instead of poky?
>>> I just did 'git merge 2c2d9d7c0e942b6748bc8bd7d5980113bae9a836' and
>>> git blew up. =20
>> Sorry... but to basing them on oe-core,  do I need the permission to =
push my commits to my own branch in =
git://git.openembedded.org/openembedded-core-contrib? I suppose so and I =
should put my public key somewhere into the server?
>=20
> You can push oe-core (based) changes to the poky-contrib tree.  Many =
of us do
> this regularly.
>=20
> I base my changes usually on oe-core, unless they contain poky =
specific code..
> I push both types to the same poky-contrib repository (in different =
branches of
> course).
>=20
> (I also always avoid "merge", and always use cherry-pick when pulling =
code from
> someone else's branches into my own..)

I tend to do that as well, but I was paying attention to the yocto phone =
call instead of the console :)=


