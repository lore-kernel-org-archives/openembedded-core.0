Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwJSX-00072R-G6
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 21:49:57 +0200
Received: by wwj26 with SMTP id 26so4792760wwj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 12:45:10 -0700 (PDT)
Received: by 10.227.42.131 with SMTP id s3mr646736wbe.104.1314215109984;
	Wed, 24 Aug 2011 12:45:09 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 11sm1110179wbw.26.2011.08.24.12.45.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Aug 2011 12:45:09 -0700 (PDT)
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
	<1314210721-29941-2-git-send-email-koen@dominion.thruhere.net>
	<4E5544C7.8020707@linux.intel.com>
In-Reply-To: <4E5544C7.8020707@linux.intel.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <718849A3-3213-48B8-9B63-A99473F5B2D9@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 24 Aug 2011 21:45:01 +0200
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tcl: fix networking breakage
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
X-List-Received-Date: Wed, 24 Aug 2011 19:49:57 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 24 aug. 2011 om 20:36 heeft Saul Wold <sgw@linux.intel.com> het volgende g=
eschreven:

> On 08/24/2011 11:32 AM, Koen Kooi wrote:
>> Without providing these site entries tcl networking doesn't work on the t=
arget.
>>=20
>> Original OE commit:
>>=20
>> commit 0c340037644f87054462f62b50cd397c162615b7
>> Author: Koen Kooi<koen@openembedded.org>
>> Date:   Wed May 26 13:04:18 2010 +0200
>>=20
>>     tcl: add 2 entries to arm-linux site file (possibly only glibc specif=
ic, need to check)
>>=20
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>  meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    6 ++++--
>>  1 files changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb b/meta/recipes-devt=
ools/tcltk/tcl_8.5.9.bb
>> index 2eabb4d..1b4ae83 100644
>> --- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
>> +++ b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://../license.terms;md5=3Da47=
a9be26d03f925fc1fbd2784f27e11
>>      file://../win/license.terms;md5=3Da47a9be26d03f925fc1fbd2784f27e11 \=

>>      "
>>=20
>> -PR =3D "r1"
>> +PR =3D "r2"
>>=20
>>  BASE_SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
>>                  file://tcl-add-soname.patch"
>> @@ -30,7 +30,9 @@ inherit autotools
>>=20
>>  DEPENDS_virtclass-native =3D ""
>>=20
>> -EXTRA_OECONF =3D "--enable-threads"
>> +EXTRA_OECONF =3D "--enable-threads \
>> +                tcl_cv_api_getaddrinfo=3Dyes \
>> +               "
>>=20
> Koen,
>=20
> This was asked last time you submitted this, what's the reasoning for addi=
ng it here vs in a site files?

Just minicing the original commit, I have no objection to putting it in a si=
te file


>=20
> Sau!
>=20
>=20
>>  do_configure() {
>>      gnu-configize


