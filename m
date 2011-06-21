Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYxj5-0006K1-2Q
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 11:58:31 +0200
Received: by wwg12 with SMTP id 12so2854256wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 02:54:58 -0700 (PDT)
Received: by 10.216.136.42 with SMTP id v42mr549910wei.96.1308650098078;
	Tue, 21 Jun 2011 02:54:58 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z66sm3369806weq.0.2011.06.21.02.54.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 02:54:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTin6-QheW3=aOKNB9h9RcOo4SL9nhA@mail.gmail.com>
Date: Tue, 21 Jun 2011 11:54:55 +0200
Message-Id: <165E34A0-6D6F-4214-A61B-9DD86562AC47@dominion.thruhere.net>
References: <cover.1308642976.git.dongxiao.xu@intel.com>
	<42f214f6550292a92714dc3e0d29eaf8d2e5d250.1308642976.git.dongxiao.xu@intel.com>
	<1308647576.21613.10.camel@phil-desktop>
	<BANLkTin6-QheW3=aOKNB9h9RcOo4SL9nhA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/5] connman: Upgrade to version 0.75
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
X-List-Received-Date: Tue, 21 Jun 2011 09:58:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun 2011, om 11:34 heeft Anders Darander het volgende geschreven:

> On Tue, Jun 21, 2011 at 11:12, Phil Blundell <pb@pbcl.net> wrote:
>> On Tue, 2011-06-21 at 16:08 +0800, Dongxiao Xu wrote:
>>> -DEPENDS  =3D "libgdbus dbus glib-2.0 hal iptables"
>>> -RDEPENDS_${PN} =3D "wpa-supplicant resolvconf"
>>> +DEPENDS  =3D "libgdbus dbus glib-2.0 hal iptables ofono =
wpa-supplicant resolvconf bluez4"
>>=20
>> What does the dependency stack for ofono look like?  If it's =
non-trivial
>> then I am not sure it is a good idea to add ofono to DEPENDS
>> unconditionally.
>=20
> Although Koen showed that the dependcies were quite trivial, I'd
> prefer to not build ofono if it is possible.
>=20
>> Ditto bluez4, I don't think that should be in there unless
>> DISTRO_FEATURES requested it.
>=20
> Yes, I certainly agree with you on bluez4. If we don't have bluetooth
> enabled for our machine/distro, I definitely prefere to not build it.
>=20
> To me it's not only about the risk that we increase the rootfs, but
> also about build-times. Even if we have quite fast machines today, it
> is a waste of CPU cycles to build lots of SW that aren't going to be
> used...
>=20
> Adding a dependency etc is easily done in a bbappen-file, which makes
> the reversed desire quite easy. I'm not sure if there is an easy way
> of removing item from e.g. DEPENDS and EXTRA_OECONF etc.

I'd trade extra build time over not having to use bbappends anytime. =
Especially where upstream has proper plugin support like connman.=


