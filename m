Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QJnqv-0006Tb-7K
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:23:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2011 07:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; d="scan'208";a="433618392"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2011 07:21:10 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 May 2011 22:20:57 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 10 May 2011 22:20:56 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>
Date: Tue, 10 May 2011 22:20:55 +0800
Thread-Topic: [OE-core] [PATCH 37/58] gnu-config-native: add dependency on
	perl-native
Thread-Index: AcwPHAyKi1BbccqbQymfJ4OVgEMteAAAHcZg
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BD8C@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
	<1303109647.5518.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
	<1304634851.30391.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD82@shsmsx502.ccr.corp.intel.com>
	<1304681508.30391.84.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD8A@shsmsx502.ccr.corp.intel.com>
	<1305036626.30391.276.camel@rex>
In-Reply-To: <1305036626.30391.276.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Tue, 10 May 2011 14:23:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Tue, 2011-05-10 at 22:02 +0800, Cui, Dexuan wrote:
>>> or we hardcode to /usr/bin/perl. Since the perl-native binary won't
>>> be in the path for any of these, autodetecting and letting it
>>> hardcode is probably fine. It has the advantage that if there are
>>> any binary modules ever involved, they'll match the version of perl
>>> they were built for regardless of whether perl-native is a
>>> dependency or not. If someone adds a perl-native dependency to
>>> autoconf-native, it will also still select the "correct" perl.
>>>=20
>>> Whilst doing this we need to keep bug #968 in mind and ensure that
>>> if perl-native is used, all of perl-native is in the sysroot. That
>>> bug is where the perl binary was installed, the library was not and
>>> an error occurred. If it is in its own directory which is only
>>> added to the PATH for users with the correct dependency, we avoid
>>> this.=20
>>>=20
>>> As for bug #941, the bottom line is that however autoconf-native
>>> selects its perl version, the strings encoded in gnu-config should
>>> really match those in the other autoconf-native scripts.
>> I saw a commit that was once suspended was pushed into poky
>> master yesterday:
>> http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=3D605141a93443df0=
42634b2219a8628a9004be023
>> Actually it does fix(or at least workaround) bug #941 and bug #968.
>>=20
>> Looks there are much work to do if we install perl-native to its own
>> sysroot. At present we can use the above commit as a workaround.
>=20
> Its merged as a workaround but I still think we need to clean this up
> properly and we need to continue working on it.
I actually meant the priority could be lowered since we have a workaround. =
:-)
Surely, I'll continue to investigate it.

Thanks,
-- Dexuan=


