Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QJxpP-00078W-OI
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 03:03:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 May 2011 18:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,349,1301900400"; 
   d="scan'208";a="661127"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2011 18:00:16 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 11 May 2011 09:00:08 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 11 May 2011 09:00:07 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 11 May 2011 09:00:07 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Saul Wold' <sgw@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2011 09:00:05 +0800
Thread-Topic: [OE-core] [PATCH 37/58] gnu-config-native: add dependency on
	perl-native
Thread-Index: AcwPdWe0TcICPF2sQl2VEPFJjvmV4AAAP9Xg
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BD8E@shsmsx502.ccr.corp.intel.com>
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
	<1865303E0DED764181A9D882DEF65FB69334F4BD8C@shsmsx502.ccr.corp.intel.com>
	<4DC9DD4A.1040205@linux.intel.com>
In-Reply-To: <4DC9DD4A.1040205@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 11 May 2011 01:03:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> On 05/10/2011 07:20 AM, Cui, Dexuan wrote:
>> Richard Purdie wrote:
>>> On Tue, 2011-05-10 at 22:02 +0800, Cui, Dexuan wrote:
>>>>> or we hardcode to /usr/bin/perl. Since the perl-native binary
>>>>> won't be in the path for any of these, autodetecting and letting
>>>>> it hardcode is probably fine. It has the advantage that if there
>>>>> are any binary modules ever involved, they'll match the version
>>>>> of perl they were built for regardless of whether perl-native is a
>>>>> dependency or not. If someone adds a perl-native dependency to
>>>>> autoconf-native, it will also still select the "correct" perl.
>>>>>=20
>>>>> Whilst doing this we need to keep bug #968 in mind and ensure that
>>>>> if perl-native is used, all of perl-native is in the sysroot. That
>>>>> bug is where the perl binary was installed, the library was not
>>>>> and an error occurred. If it is in its own directory which is only
>>>>> added to the PATH for users with the correct dependency, we avoid
>>>>> this.=20
>>>>>=20
>>>>> As for bug #941, the bottom line is that however autoconf-native
>>>>> selects its perl version, the strings encoded in gnu-config should
>>>>> really match those in the other autoconf-native scripts.
>>>> I saw a commit that was once suspended was pushed into poky
>>>> master yesterday:
>>>> http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=3D605141a93443d=
f042634b2219a8628a9004be023
>>>> Actually it does fix(or at least workaround) bug #941 and bug #968.
>>>>=20
>>>> Looks there are much work to do if we install perl-native to its
>>>> own sysroot. At present we can use the above commit as a
>>>> workaround.=20
>>>=20
>>> Its merged as a workaround but I still think we need to clean this
>>> up properly and we need to continue working on it.
>> I actually meant the priority could be lowered since we have a
>> workaround. :-) Surely, I'll continue to investigate it.
>>=20
> Just to be clear, just because we have a work around does not mean we
> can lower the priority, this is still a valid bug that needs a proper
> patch in a timely manner.
>=20
> 941 is still a major bug and requires a fix before the milestone 1
> release stabilization period (May 20), which is 10 days from now.
OK, so I'll put more effort on this to get a complete fix.

Thanks,
-- Dexuan


