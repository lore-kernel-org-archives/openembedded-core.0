Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QXTKJ-0005RS-B6
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 09:18:47 +0200
Received: by wwg12 with SMTP id 12so17036wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 00:15:18 -0700 (PDT)
Received: by 10.227.11.67 with SMTP id s3mr1777346wbs.62.1308294918649;
	Fri, 17 Jun 2011 00:15:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ei4sm708802wbb.60.2011.06.17.00.15.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 00:15:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6721E4B@shsmsx501.ccr.corp.intel.com>
Date: Fri, 17 Jun 2011 09:15:15 +0200
Message-Id: <E855E3E1-94D9-4EB0-9423-0F3F0F09268D@dominion.thruhere.net>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
	<1308216925.25285.4101.camel@phil-desktop>	<4DFA08A2.3010504@gmail.com>
	<ED0EBCC5-D086-4F71-AC7A-F733111C4B6D@dominion.thruhere.net>
	<4DFA8DF5.90401@gmail.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6721E4B@shsmsx501.ccr.corp.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/6] connman: Upgrade to version 0.75
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
X-List-Received-Date: Fri, 17 Jun 2011 07:18:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 jun 2011, om 09:08 heeft Xu, Dongxiao het volgende geschreven:
>=20
>>>>>=20
>>>>=20
>>>> I would say put ofono as a DISTRO_FEATURE
>>>=20
>>> You don't need to build ofono to have ofono support in connman.
>>> Angstrom (and hence meta-oe) build with it enabled by default to
>>> support people who want to use the plugin on their phones. Since =
it's
>>> a nicely seperated plugin,
>=20
> Do you mean connman-plugin-ofono could work correctly without the =
ofono recipe?
> According to my understanding, connman-plugin-ofono controls the =
telephony device by talking with ofonod daemon through dbus mechanism.
> On another aspect, ofono project has support for different types of =
modems, and I don't think connman-plugin-ofono has the ability.
> Therefore I think the ofono recipe is needed.

I'm saying that ofono is not a *build* dependency for the connman-ofono =
plugin.

regards,

Koen=


