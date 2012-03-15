Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S83qV-0002qu-1n
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 07:07:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2F5wNDE027416
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Mar 2012 22:58:23 -0700 (PDT)
Received: from [128.224.162.241] (128.224.162.241) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 14 Mar 2012 22:58:23 -0700
Message-ID: <4F6184FF.9090603@windriver.com>
Date: Thu, 15 Mar 2012 13:58:23 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@intel.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
	<589114a82e66c3378344d0fb0f61a19880b6f7aa.1331713107.git.kai.kang@windriver.com>
	<1331740508.18586.40.camel@ted>
In-Reply-To: <1331740508.18586.40.camel@ted>
X-Originating-IP: [128.224.162.241]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q2F5wNDE027416
Cc: "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/8] alsa-tools: update to 1.0.25
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
X-List-Received-Date: Thu, 15 Mar 2012 06:07:31 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B403=E6=9C=8814=E6=97=A5 23:55, Richard Purdie wrote:
> On Wed, 2012-03-14 at 17:03 +0800, Kang Kai wrote:
>> Update to version 1.0.25
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   .../autotools.patch                                |    0
>>   ...alsa-tools_1.0.24.1.bb =3D>  alsa-tools_1.0.25.bb} |    6 +++---
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>   rename meta/recipes-multimedia/alsa/{alsa-tools-1.0.24.1 =3D>  alsa-=
tools-1.0.25}/autotools.patch (100%)
>>   rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.24.1.bb =3D>  al=
sa-tools_1.0.25.bb} (83%)
>>
>> diff --git a/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotool=
s.patch b/meta/recipes-multimedia/alsa/alsa-tools-1.0.25/autotools.patch
>> similarity index 100%
>> rename from meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools=
.patch
>> rename to meta/recipes-multimedia/alsa/alsa-tools-1.0.25/autotools.pat=
ch
>> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/met=
a/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
>> similarity index 83%
>> rename from meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
>> rename to meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
>> index ed2886d..1738081 100644
>> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
>> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
>> @@ -7,7 +7,7 @@ SECTION =3D "console/utils"
>>   LICENSE =3D "GPLv2&  LGPLv2+"
>>   DEPENDS =3D "alsa-lib ncurses"
>>
>> -PR =3D "r3"
>> +PR =3D "r0"
>>
>>   LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f \
>>                       file://ld10k1/COPYING.LIB;md5=3D7fbc338309ac38fe=
fcd64b04bb903e34"
>> @@ -15,8 +15,8 @@ LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D=
94d55d512a9ba36caa9b7df079bae1
>>   SRC_URI =3D "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.t=
ar.bz2 \
>>              file://autotools.patch"
>>
>> -SRC_URI[md5sum] =3D "08fe93a12006093e590d7ecc02b119dd"
>> -SRC_URI[sha256sum] =3D "17d43de93ab2db98886d89a53e45341daa46a4ef6edd4=
05db87f4b5a5dc64a05"
>> +SRC_URI[md5sum] =3D "06fe5819020c6684b991dcffc5471304"
>> +SRC_URI[sha256sum] =3D "5a1a805cf04106316d549ec650116ce6711a162e107ba=
8b3c551866680e286e6"
>>
>>   inherit autotools
>>

Hi Richard,

> I've reverted this. The checksums are wrong and even with that fixed, i=
t
> doesn't build. What testing are you doing?
I am very sorry about this kind of mistake.

When update the packages, I did
1 update the bb file name, SRC_URI and reset revision etc.
2 run 'bitbake pkg', then bitbake will warn checksum not match, then=20
update the checksum with the right sums in Error Info
3 run 'bitbake pkg' again then see if any other errors
4 finally run 'bitbake pkg ' for other build target. For this serious I=20
check them for qemux86-64 and powerpc.

I am confused that I still get the alsa-tools successfully build with=20
the wrong checksums after 'bitbake alsa-tools -c clean && rm -rf=20
sstate-cache && touch conf/local.conf' for about 3 or 4 times. Then=20
remove the source tar ball and modify the checksum in bb file, bitbake=20
complains error again.

I will send the update.

Sorry again.

Kai


>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



