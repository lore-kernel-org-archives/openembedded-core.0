Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYxBV-00029L-Lv
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 11:23:49 +0200
Received: by wyb34 with SMTP id 34so2110606wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 02:20:16 -0700 (PDT)
Received: by 10.227.177.193 with SMTP id bj1mr6298706wbb.30.1308648016427;
	Tue, 21 Jun 2011 02:20:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm3842243wbh.29.2011.06.21.02.20.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 02:20:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308647576.21613.10.camel@phil-desktop>
Date: Tue, 21 Jun 2011 11:20:10 +0200
Message-Id: <457266DE-94F3-4CBC-B676-2F52BF45B8AA@dominion.thruhere.net>
References: <cover.1308642976.git.dongxiao.xu@intel.com>
	<42f214f6550292a92714dc3e0d29eaf8d2e5d250.1308642976.git.dongxiao.xu@intel.com>
	<1308647576.21613.10.camel@phil-desktop>
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
X-List-Received-Date: Tue, 21 Jun 2011 09:23:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun 2011, om 11:12 heeft Phil Blundell het volgende geschreven:

> On Tue, 2011-06-21 at 16:08 +0800, Dongxiao Xu wrote:
>> -DEPENDS  =3D "libgdbus dbus glib-2.0 hal iptables"
>> -RDEPENDS_${PN} =3D "wpa-supplicant resolvconf"
>> +DEPENDS  =3D "libgdbus dbus glib-2.0 hal iptables ofono =
wpa-supplicant resolvconf bluez4"
>=20
> What does the dependency stack for ofono look like?  If it's =
non-trivial
> then I am not sure it is a good idea to add ofono to DEPENDS
> unconditionally.

dbus, glib-2.0 and udev, so that's not too bad. Only udev is "new", but =
connman already requires it since it dumped hal eons ago.

So the line should actually look like this:

>> DEPENDS  =3D "libgdbus dbus glib-2.0 udev iptables ofono =
wpa-supplicant resolvconf bluez4"


