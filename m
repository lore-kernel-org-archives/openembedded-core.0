Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QNEKZ-00072P-Kc
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 03:16:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 May 2011 18:13:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,239,1304319600"; d="scan'208";a="439439110"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by azsmga001.ch.intel.com with ESMTP; 19 May 2011 18:13:33 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 20 May 2011 09:13:08 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Fri, 20 May 2011 09:13:06 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 May 2011 09:13:06 +0800
Thread-Topic: [OE-core] [PATCH 08/30] package-index.bb: add support for deb
	and rpm.
Thread-Index: AcwWdN0RQSKz/PmkRF+oeRZuD+HR4QAFepiw
Message-ID: <1865303E0DED764181A9D882DEF65FB694322A3FDD@shsmsx502.ccr.corp.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
	<8305336c6b1eb0789af195f28230ecfca178538a.1305756950.git.sgw@linux.intel.com>
	<1305844384.3424.566.camel@rex>
In-Reply-To: <1305844384.3424.566.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 08/30] package-index.bb: add support for deb and rpm.
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
X-List-Received-Date: Fri, 20 May 2011 01:16:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> Hi,
>=20
> We're nearly there with this, I'd like just one other tweak please:
>=20
> On Thu, 2011-05-19 at 12:19 -0700, Saul Wold wrote:
>> diff --git a/meta/classes/package_deb.bbclass
>> b/meta/classes/package_deb.bbclass index 4faeb4a..f9ef32c 100644 ---
>> a/meta/classes/package_deb.bbclass +++
>> b/meta/classes/package_deb.bbclass @@ -431,3 +431,12 @@ python
>>  do_package_write_deb () { do_package_write_deb[dirs] =3D
>>  "${PKGWRITEDIRDEB}" addtask package_write_deb before
>> do_package_write after do_package=20
>>=20
>> +
>> +PACKAGEINDEXES +=3D "package_index_deb;"
>> +PACKAGEINDEXDEPS +=3D "dpkg-native:do_populate_sysroot"
>> +PACKAGEINDEXDEPS +=3D "apt-native:do_populate_sysroot" +
>> +package_index_deb() {
>> +    package_update_index_deb
>> +}
>=20
> Can't we just do +PACKAGEINDEXES +=3D "package_update_index_deb;"
>=20
> instead of adding the function?
Richard, thanks for the suggestion!

I made a new git commit at: please review it:
http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=3Ddcui/master&id=
=3D949f58a3ff0b4227986cff2c165a0d49aa2631cc

Thanks,
-- Dexuan=


