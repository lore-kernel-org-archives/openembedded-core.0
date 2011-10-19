Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RGMGG-0000pv-1r
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:52:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J2kDId029458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Oct 2011 19:46:13 -0700 (PDT)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 18 Oct 2011 19:46:12 -0700
Message-ID: <4E9E3A43.9040902@windriver.com>
Date: Wed, 19 Oct 2011 10:47:31 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1318989087.git.kai.kang@windriver.com>
	<65c7a1fd4cc82c9e2366247cdaa0af1e1320f865.1318989087.git.kai.kang@windriver.com>
	<4E9E3909.40904@intel.com>
In-Reply-To: <4E9E3909.40904@intel.com>
X-Originating-IP: [128.224.162.225]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p9J2kDId029458
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xdg-utils: update to 1.1.0 rc1
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
X-List-Received-Date: Wed, 19 Oct 2011 02:52:08 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B410=E6=9C=8819=E6=97=A5 10:42, Saul Wold wrote:
> On 10/18/2011 07:00 PM, Kang Kai wrote:
>> Update xdg-utils to 1.1.0 rc1, set variable "S".
>>
> Why are we updating to an RC1, if you are tracking this upstream then=20
> should we not wait just a little longer for the actual 1.1 release?

ok.

>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>> .../{xdg-utils_1.0.2.bb =3D> xdg-utils_1.1.0rc1.bb} | 20=20
>> +++++++++++---------
>> 1 files changed, 11 insertions(+), 9 deletions(-)
>> rename meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb =3D>=20
>> xdg-utils_1.1.0rc1.bb} (57%)
>>
>> diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb=20
>> b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0rc1.bb
>> similarity index 57%
>> rename from meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
>> rename to meta/recipes-extended/xdg-utils/xdg-utils_1.1.0rc1.bb
>> index f54d591..d7e4e47 100644
>> --- a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
>> +++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0rc1.bb
>> @@ -4,13 +4,13 @@ DESCRIPTION =3D "The xdg-utils package is a set of=20
>> simple scripts that provide bas
>> desktop integration functions for any Free Desktop, such as Linux. \
>> They are intended to provide a set of defacto standards. \
>> The following scripts are provided at this time: \
>> -xdg-desktop-icon \
>> -xdg-desktop-menu \
>> -xdg-email \
>> +xdg-desktop-icon \
>> +xdg-desktop-menu \
>> +xdg-email \
>> xdg-icon-resource \
>> -xdg-mime \
>> -xdg-open \
>> -xdg-screensaver \
>> +xdg-mime \
>> +xdg-open \
>> +xdg-screensaver \
>> "
> White space changes?

Yes, trailing white space.

Regards,
Kai

>
> Sau!
>
>>
>> PR=3D"r0"
>> @@ -18,9 +18,11 @@ PR=3D"r0"
>> LICENSE =3D "MIT"
>> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da5367a90934098d6b05af3b7464=
05014"
>>
>> -SRC_URI =3D "http://portland.freedesktop.org/download/${BPN}-${PV}.tg=
z"
>> +SRC_URI =3D=20
>> "http://portland.freedesktop.org/download/${BPN}-1.1.0-rc1.tar.gz"
>> +
>> +S =3D "${WORKDIR}/${PN}-1.1.0-rc1"
>>
>> inherit autotools
>>
>> -SRC_URI[md5sum] =3D "348a5b91dc66426505022c74a64b2940"
>> -SRC_URI[sha256sum] =3D=20
>> "21aeb7d16b2529b8d3975118f59eec09953e09f9a68d718159e98c90474b01ac"
>> +SRC_URI[md5sum] =3D "fadf5e7a08e0526fc60dbe3e5b7ef8d6"
>> +SRC_URI[sha256sum] =3D=20
>> "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209d79102"
>



