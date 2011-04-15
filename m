Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QAZEF-0006rY-BJ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 04:57:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Apr 2011 19:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,215,1301900400"; d="scan'208";a="628955592"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 14 Apr 2011 19:55:32 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 15 Apr 2011 10:53:52 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Fri, 15 Apr 2011 10:53:51 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Saul Wold' <sgw@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Apr 2011 10:53:50 +0800
Thread-Topic: [OE-core] [v2 12/12] gnu-config-native: add dependency on
	perl-native
Thread-Index: Acv66lHVd4u7MWJ5TRWr8yp81lnimAAKNkSQ
Message-ID: <1865303E0DED764181A9D882DEF65FB68AA080E00C@shsmsx502.ccr.corp.intel.com>
References: <cover.1302770941.git.dexuan.cui@intel.com>
	<dc2b7b09baaee3ef172e41edfb2eedfe065b0006.1302770941.git.dexuan.cui@intel.com>
	<4DA76601.40308@linux.intel.com>
In-Reply-To: <4DA76601.40308@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [v2 12/12] gnu-config-native: add dependency on	perl-native
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
X-List-Received-Date: Fri, 15 Apr 2011 02:57:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> On 04/14/2011 01:56 AM, Dexuan Cui wrote:
>> From: Dexuan Cui<dexuan.cui@intel.com>
>>=20
>> Fixes [YOCTO #968]
>>=20
>> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
>> ---
>>   .../gnu-config/gnu-config_20080123.bb              |    4 +++-
>>   1 files changed, 3 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
>> b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb index
>> e0a8155..2ad0834 100644 ---
>> a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb +++
>>   b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb @@ -3,7
>>   +3,9 @@ DESCRIPTION =3D "Tool that installs the GNU config.guess /
>> config.sub into a direc   SECTION =3D "devel" LICENSE =3D "GPLv1+"
>> LIC_FILES_CHKSUM =3D
>> "file://config.guess;endline=3D39;md5=3Da089987af4a25cb0419d1c2fd6d495e3=
"
>>   -DEPENDS =3D "" + +DEPENDS_virtclass-native =3D "perl-native" +
>> INHIBIT_DEFAULT_DEPS =3D "1"=20
>>=20
>>   FIXEDSRCDATE =3D "${@bb.data.getVar('FILE', d,
>> 1).split('_')[-1].split('.')[0]}"=20
> Looks like you forgot to bump PR for this.
Hi Saul,
I thought it's ok to not bump PR if we only change DEPENDS?
e.g, the following commits didn't bump PR, too:
7c474dc3
2a285e69
2fc03aee
c600ea7b
=20
> Also, there is a patch associated with this recipe that needs the
> Upstream-Status tag
Thanks for the reminder!
This is a fix (not an update) and I failed to notice that the recipe has pa=
tches... :-(
Will add the tag and re-send the PULL.

Thanks,
-- Dexuan=


