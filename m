Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QYTMi-0000Pf-G3
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 03:33:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2011 18:29:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,390,1304319600"; d="scan'208";a="16978083"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2011 18:29:47 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 20 Jun 2011 09:29:06 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 20 Jun 2011 09:29:04 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Mon, 20 Jun 2011 09:28:45 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jun 2011 09:28:44 +0800
Thread-Topic: [OE-core] BUG: intltool depends on libxml-parser-perl to be
	installed on host
Thread-Index: AcwuFSEra2+TqjnzQWa3GaueF+pjDwA0qZyA
Message-ID: <1865303E0DED764181A9D882DEF65FB6997B5E766E@shsmsx502.ccr.corp.intel.com>
References: <BANLkTin20ZXvBnT9phab1KZcZ1iCkO8RaQ@mail.gmail.com>
	<4DFD379B.8010701@mentor.com>
	<BANLkTimkH5e4ViO7aNP9typLSBvBKrSNxw@mail.gmail.com>
In-Reply-To: <BANLkTimkH5e4ViO7aNP9typLSBvBKrSNxw@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: BUG: intltool depends on libxml-parser-perl to be installed on host
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
X-List-Received-Date: Mon, 20 Jun 2011 01:33:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Otavio Salvador wrote:
> On Sat, Jun 18, 2011 at 23:41, Tom Rini <tom_rini@mentor.com> wrote:
>> On 06/18/2011 01:18 PM, Otavio Salvador wrote:
>>> Hello,
>>>=20
>>> It seems that intltool depends on libxml-parser-perl being installed
Hi Otavio,
I suppose you actually meant intltool-native should depend on libxml-parser=
-perl-native?
Could you please supply the building log?
If it's something like=20
 /home/dcui/yocto/build/tmp/sysroots/i686-linux/usr/bin/perl: bad interpret=
er: No such file or directory,=20
you would need this fix (I assume you're using the latest poky master?):
http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/bump_P=
R&id=3Dbe638790e41206ed740aec69a8704fe77d1bc0b2

And I guess you're using incremental building? Does building from scratch w=
ork?

>>> into host system to it to build.
>>=20
>> Do the DEPENDS look right? =A0Maybe this needs the class for bringing
>> in perl-native...
>=20
> It seems to do so.
>=20
> Are you able to reproduce it?
Hi Otavio,
I can't reproduce the issue.
Could you please report a bug at http://bugzilla.yoctoproject.org/ so we ca=
n better track the issue?=20

Thanks,
-- Dexuan



