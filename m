Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RZ5d3-0005Ew-3I
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 19:57:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB9IoCig014991
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2011 10:50:12 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 9 Dec 2011 10:50:12 -0800
Message-ID: <4EE25863.20906@windriver.com>
Date: Fri, 9 Dec 2011 12:50:11 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1322607016.git.sgw@linux.intel.com>
	<234071f22c2183ea28cda55bac8f68cb47e8f0e1.1322607016.git.sgw@linux.intel.com>
	<1323456167.25802.5.camel@mattotaupa>
In-Reply-To: <1323456167.25802.5.camel@mattotaupa>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pB9IoCig014991
Subject: Re: [PATCH 06/26] xinit: Update to 1.3.1
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
X-List-Received-Date: Fri, 09 Dec 2011 18:57:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/9/11 12:42 PM, Paul Menzel wrote:
> Dear Saul,
>
>
> Am Dienstag, den 29.11.2011, 15:00 -0800 schrieb Saul Wold:
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   .../xorg-app/{xinit_1.3.0.bb =3D>  xinit_1.3.1.bb}    |    6 +++---
>>   1 files changed, 3 insertions(+), 3 deletions(-)
>>   rename meta/recipes-graphics/xorg-app/{xinit_1.3.0.bb =3D>  xinit_1.=
3.1.bb} (80%)
>>
>> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb b/meta/reci=
pes-graphics/xorg-app/xinit_1.3.1.bb
>> similarity index 80%
>> rename from meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
>> rename to meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
>> index 08dfe12..2ddebe6 100644
>> --- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
>> +++ b/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
>> @@ -13,11 +13,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0d4b5ee=
f75f1584ccbdc5e4a34314407"
>>   PR =3D "r2"
>
> when upgrading recipes please remember to reset `PR` to 0. I just
> spotted that now when looking through the =93recent=94 changes [1].

I have not been doing that.  When I asked a while back the response I got=
 was=20
mixed and what I took from it is that PR (on a package upgrade) is up to =
the=20
discretion of the person performing the upgrade.

If reseting to 0 is/should be the official policy, then we really need to=
=20
document it as part of the patch/update guidelines..

--Mark

>>   PE =3D "1"
>>
>> +SRC_URI[md5sum] =3D "ee234056d8a3dbf37b61b4bcb35b88e4"
>> +SRC_URI[sha256sum] =3D "c7468dfae94bdb42785d79623c27156dc4bf379d83729=
92830482cb04d8439b0"
>> +
>>   EXTRA_OECONF =3D "ac_cv_path_MCOOKIE=3D${bindir}/mcookie"
>>
>>   RDEPENDS_${PN} +=3D "util-linux-mcookie"
>>
>>   FILES_${PN} +=3D "${libdir}X11/xinit"
>> -
>> -SRC_URI[md5sum] =3D "bc4e8b7d1919597cc37a0d24aa149dda"
>> -SRC_URI[sha256sum] =3D "ba76e36e1a42a7cf76505b7e6fc4777f5d14f45ddff74=
341abfb7dd10d5fe04c"
>
>
> Thanks,
>
> Paul
>
>
> [1] http://git.openembedded.org/openembedded-core/commit/?id=3D234071f2=
2c2183ea28cda55bac8f68cb47e8f0e1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



