Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QXTGC-0005Hm-A9
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 09:14:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jun 2011 00:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,380,1304319600"; d="scan'208";a="14340597"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by azsmga001.ch.intel.com with ESMTP; 17 Jun 2011 00:11:02 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 17 Jun 2011 15:08:58 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 17 Jun 2011 15:08:57 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2011 15:08:56 +0800
Thread-Topic: [OE-core] [PATCH 1/6] connman: Upgrade to version 0.75
Thread-Index: Acwsevu4KYU1zxwEQOy+DUsQyRHmngAO5L2w
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6721E4B@shsmsx501.ccr.corp.intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
	<1308216925.25285.4101.camel@phil-desktop>	<4DFA08A2.3010504@gmail.com>
	<ED0EBCC5-D086-4F71-AC7A-F733111C4B6D@dominion.thruhere.net>
	<4DFA8DF5.90401@gmail.com>
In-Reply-To: <4DFA8DF5.90401@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 17 Jun 2011 07:14:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Friday, June 17, 2011 7:13 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/6] connman: Upgrade to version 0.75
>=20
> On 06/16/2011 07:00 AM, Koen Kooi wrote:
> >
> > Op 16 jun 2011, om 15:44 heeft Khem Raj het volgende geschreven:
> >
> >> On 6/16/2011 2:35 AM, Phil Blundell wrote:
> >>> On Thu, 2011-06-16 at 17:20 +0800, Dongxiao Xu wrote:
> >>>> Enable ofono plugin into sato image.
> >>>
> >>> [...]
> >>>
> >>>> --- a/meta/recipes-connectivity/connman/connman.inc
> >>>> +++ b/meta/recipes-connectivity/connman/connman.inc
> >>>> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> >>>>
> file://src/main.c;beginline=3D1;endline=3D20;md5=3D4b55b550fa6b33cc2055ef=
30dd2
> 62b3e"
> >>>>
> >>>>   DEPENDS  =3D "libgdbus dbus glib-2.0 hal iptables"
> >>>> -RDEPENDS_${PN} =3D "wpa-supplicant resolvconf"
> >>>> +RDEPENDS_${PN} =3D "wpa-supplicant resolvconf ofono"
> >>>
> >>>> --- a/meta/recipes-connectivity/connman/connman_0.65.bb
> >>>> +++ b/meta/recipes-connectivity/connman/connman_0.75.bb
> >>>> @@ -16,14 +16,14 @@ EXTRA_OECONF +=3D "\
> >>>>     --disable-udev \
> >>>>     --disable-polkit \
> >>>>     --enable-client \
> >>>> +  --enable-ofono \
> >>>>     --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var"
> >>>
> >>> These changes look like they will have a rather wider impact than
> >>> just the sato image.  I'm not sufficiently au fait with connman to
> >>> say whether this is a good thing or not (although my immediate
> >>> reaction to adding extra RDEPENDS tends to be that it is not), but
> >>> if they're going to be added globally then the checkin comment ought
> >>> to reflect that and explain why it's being done.  Alternatively, you
> >>> could do this in your distro layer and/or image recipes.

Yes, the description in commit is not accurate and I will modify it.
Also globally add ofono in connman's RDEPENDS is not good enough. In actual=
, it is connman-plugin-ofono who rdepends on ofono recipe.
I will revise it in next version of pull request.

> >>>
> >>
> >> I would say put ofono as a DISTRO_FEATURE
> >
> > You don't need to build ofono to have ofono support in connman.
> > Angstrom (and hence meta-oe) build with it enabled by default to
> > support people who want to use the plugin on their phones. Since it's
> > a nicely seperated plugin,

Do you mean connman-plugin-ofono could work correctly without the ofono rec=
ipe?
According to my understanding, connman-plugin-ofono controls the telephony =
device by talking with ofonod daemon through dbus mechanism.
On another aspect, ofono project has support for different types of modems,=
 and I don't think connman-plugin-ofono has the ability.
Therefore I think the ofono recipe is needed.

>=20
> even better
>=20
>   DISTRO_FEATURE would be the wrong thing to do.
>=20
> in such case DISTRO_FEATURE might be secondary choice yes
>=20
> >
> > That's why I keep saying "look at the connman recipe in meta-oe", that'=
s
> being used by angstrom and SHR with good success.

Thanks Koen for the information.
It has good mechanism to add RDEPENDS to specific connman plugin.
I will include this logic in my next pull request.

Thanks,
Dongxiao
=20
> >
> > regards,
> >
> > Koen
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


