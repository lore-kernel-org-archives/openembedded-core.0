Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1Srahc-0008EL-M8
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 22:18:33 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb [147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6IK7Au1011881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 13:07:10 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.236]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.01.0255.000;
	Wed, 18 Jul 2012 13:07:10 -0700
From: "Little, Morgan" <Morgan.Little@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 09/20] python-setuptools: Update for
	python-native changes
Thread-Index: AQHNYzAiqZZjwsJLWUuMJKlVQMd0cpcve1tO
Date: Wed, 18 Jul 2012 20:07:09 +0000
Message-ID: <FCBA1E696337B442ADB5A7C30428F0684E79AC@ALA-MBA.corp.ad.wrs.com>
References: <1342187709-19368-1-git-send-email-morgan.little@windriver.com>
	<1342187709-19368-10-git-send-email-morgan.little@windriver.com>,
	<1342428637.5019.2.camel@ted>
In-Reply-To: <1342428637.5019.2.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.140.224]
MIME-Version: 1.0
Subject: Re: [PATCH 09/20] python-setuptools: Update for python-native changes
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
X-List-Received-Date: Wed, 18 Jul 2012 20:18:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 12-07-16 04:50 AM, Richard Purdie wrote:=0A=
> On Fri, 2012-07-13 at 09:54 -0400, Morgan Little wrote:=0A=
>> Add pythonnative to the inherits list=0A=
>>=0A=
>> Signed-off-by: Morgan Little <morgan.little@windriver.com>=0A=
>> ---=0A=
>>  .../python/python-setuptools_0.6c11.bb             |    4 ++--=0A=
>>  1 files changed, 2 insertions(+), 2 deletions(-)=0A=
>>=0A=
>> diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/=
meta/recipes-devtools/python/python-setuptools_0.6c11.bb=0A=
>> index a769714..dbbc4dc 100644=0A=
>> --- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb=0A=
>> +++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb=0A=
>> @@ -5,7 +5,7 @@ LICENSE =3D "PSF"=0A=
>>  LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D23;endline=3D23;md5=
=3D8a314270dd7a8dbca741775415f1716e"=0A=
>>  =0A=
>>  SRCNAME =3D "setuptools"=0A=
>> -PR =3D "ml4"=0A=
>> +PR =3D "ml3"=0A=
>>  DEPENDS +=3D "python"=0A=
>>  DEPENDS_virtclass-native +=3D "python-native"=0A=
>>  =0A=
>> @@ -14,7 +14,7 @@ SRC_URI =3D "\=0A=
>>  "=0A=
>>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"=0A=
>>  =0A=
>> -inherit distutils=0A=
>> +inherit distutils pythonnative=0A=
>=0A=
> Rather than do this with every user of distutils, would it make sense to=
=0A=
> inherit pythonnative in the distutils class? Is there a case we wouldn't=
=0A=
> want that inherit?=0A=
>=0A=
> Cheers,=0A=
>=0A=
> Richard=0A=
>=0A=
>=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-core mailing list=0A=
> Openembedded-core@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=0A=
=0A=
It does make sense. That was a small carry over from when I was going throu=
gh and fixing issues as they came up.=0A=
=0A=
I've made some changes to distutils and distutils-base and found another re=
cipe that needed to be changed so I'll send a V2 today as long as everythin=
g builds without errors.=0A=
=0A=
//Morgan=0A=
=0A=


