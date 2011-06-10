Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QUwCq-0002hO-4R
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 09:32:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Jun 2011 00:29:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,345,1304319600"; d="scan'208";a="11887856"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga002.jf.intel.com with ESMTP; 10 Jun 2011 00:29:13 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 10 Jun 2011 15:28:18 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 10 Jun 2011 15:28:17 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jun 2011 15:28:17 +0800
Thread-Topic: [OE-core] [RFC v1 PATCH 07/16] git: should depend on
	perl-native-runtime rather than perl-native
Thread-Index: AcwnAuFv/RtNWA/YS5eBTm1IOJkpFAADxqqA
Message-ID: <1865303E0DED764181A9D882DEF65FB69810B00D91@shsmsx502.ccr.corp.intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<06193403fa3f66c8ba416ace8fee6f10e05a4f13.1306931849.git.dexuan.cui@intel.com>
	<1307664618.30948.3.camel@scimitar>
In-Reply-To: <1307664618.30948.3.camel@scimitar>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [RFC v1 PATCH 07/16] git: should depend on perl-native-runtime rather than perl-native
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
X-List-Received-Date: Fri, 10 Jun 2011 07:32:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Joshua Lock wrote:
> On Wed, 2011-06-01 at 21:18 +0800, Dexuan Cui wrote:
>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>> ---
>>  meta/recipes-devtools/git/git.inc        |    4 ++--
>>  meta/recipes-devtools/git/git_1.7.5.1.bb |    2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/git/git.inc
>> b/meta/recipes-devtools/git/git.inc index c884f9c..3cdd1fa 100644
>> --- a/meta/recipes-devtools/git/git.inc +++
>> b/meta/recipes-devtools/git/git.inc @@ -1,14 +1,14 @@
>>  DESCRIPTION =3D "The git revision control system used by the Linux
>>  kernel developers"  SECTION =3D "console/utils" LICENSE =3D "GPLv2"
>> -DEPENDS =3D "perl-native openssl curl zlib expat"
>> +DEPENDS =3D "perl-native-runtime openssl curl zlib expat"
>=20
> This change made git-native fail to build for me until I installed
> perl-ExtUtils-MakeMaker on my Fedora 15 workstation.
>=20
> If this is expected we need to be documenting this additional host
> dependency.
>=20
> Tracking bug: http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1155

Hi Joshua,
Thanks for reporting this!

Cc-ed Richard:
It might be inappropriate to "add perl-ExtUtils-MakeMaker to the host packa=
ge requirements"?
Looks git should depend on perl-native?

I've made a patch http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commi=
t/?h=3Ddcui/distro&id=3D79356a51507f1872199ba38262b749277633b4d4 and I'll s=
end the pull request.
Please review it.

Thanks,
-- Dexuan=


