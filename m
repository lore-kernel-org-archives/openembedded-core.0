Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QDK8g-00040r-Mt
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 19:27:30 +0200
Received: by wwb17 with SMTP id 17so638440wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 10:25:04 -0700 (PDT)
Received: by 10.227.27.98 with SMTP id h34mr1327007wbc.113.1303493104011;
	Fri, 22 Apr 2011 10:25:04 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	z13sm1854704wbd.12.2011.04.22.10.25.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Apr 2011 10:25:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTiksRbTcCmjcJDeiK=dzhY01N=O6CA@mail.gmail.com>
Date: Fri, 22 Apr 2011 19:25:01 +0200
Message-Id: <6B8E23E1-B345-4127-BC51-A92612BE94FB@dominion.thruhere.net>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<0daf49a24c9ff05b60377dad60234107009efbdb.1303453279.git.sgw@linux.intel.com>
	<BANLkTiksRbTcCmjcJDeiK=dzhY01N=O6CA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 28/33] python-pycairo: fix installation path of __init__.py
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
X-List-Received-Date: Fri, 22 Apr 2011 17:27:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 apr 2011, om 19:16 heeft Khem Raj het volgende geschreven:

> On Fri, Apr 22, 2011 at 12:24 AM, Saul Wold <sgw@linux.intel.com> =
wrote:
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>=20
>> This fixes Bug [YOCTO #477]
>>=20
>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> ---
>>  .../python/python-pycairo_1.8.10.bb                |    8 +++++++-
>>  1 files changed, 7 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb =
b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
>> index 7d73dc2..24b3ff2 100644
>> --- a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
>> +++ b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
>> @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1 & MPLv1.1"
>>  LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Df2e071ab72978431b294a0d696327421"
>>  # cairo >=3D 1.8.8
>>  DEPENDS =3D "cairo"
>> -PR =3D "ml0"
>> +PR =3D "r1"
>=20
> any reason not to use mlX

Because rX is a standard and mlX isn't=


