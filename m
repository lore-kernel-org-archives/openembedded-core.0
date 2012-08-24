Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T4j69-0003j3-Gi
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 03:54:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7O1g1dl003063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Aug 2012 18:42:01 -0700 (PDT)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Thu, 23 Aug 2012 18:42:00 -0700
Message-ID: <5036DBF5.7070905@windriver.com>
Date: Fri, 24 Aug 2012 09:42:13 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1345709138.git.kai.kang@windriver.com>
	<55aeb8f8fd0cdce1c461c2c4f75026166e69e1dc.1345709138.git.kai.kang@windriver.com>
	<50364C03.30300@linux.intel.com>
In-Reply-To: <50364C03.30300@linux.intel.com>
X-Originating-IP: [128.224.162.164]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q7O1g1dl003063
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ltp_20120104: add rdepends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 01:54:09 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B408=E6=9C=8823=E6=97=A5 23:28, Saul Wold wrote:
> On 08/23/2012 03:21 AM, Kang Kai wrote:
>> [Yocto #2973]
>>
>> Add rdepends libaio to fix this defect.
>>
>> Signed-off-by: Kang Kai <kai.kang@windriver.com>
>> ---
>> meta/recipes-extended/ltp/ltp_20120104.bb | 4 +++-
>> 1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-extended/ltp/ltp_20120104.bb=20
>> b/meta/recipes-extended/ltp/ltp_20120104.bb
>> index c82203a..f8119a7 100644
>> --- a/meta/recipes-extended/ltp/ltp_20120104.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20120104.bb
>
> Is this really correct for master? I think this patch is for Denzil?
Yes, there are aio tests in ltp suit. And a variable RUN_AIOTESTS to=20
identify run aio tests or not.

I have update ltp to 20120614, so this is just for denzil.
Suggest denzil pick the commit 5af0be987e1117fe830de72e646ef372a12f923f=20
to update the ltp too, then just one patch for both of them.


Regards,
Kai

>
> Will there be a patch for master?

>
> Sau!
>
>> @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>> file://utils/benchmark/kernbench-0.42/COPYING;md5=3D94d55d512a9ba36caa=
9b7df079bae19f=20
>> \
>> "
>>
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> SRC_URI =3D "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
>> file://uclibc-getcontext.patch \
>> @@ -28,6 +28,8 @@ SRC_URI =3D=20
>> "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
>> SRC_URI[md5sum] =3D "ac183bbdac67139f049b3755fda37179"
>> SRC_URI[sha256sum] =3D=20
>> "11b149b821d709e3351ac66f028f1b0dd5337ee9073dc20019ccffdac42d5c2e"
>>
>> +RDEPENDS_${PN} +=3D "libaio"
>> +
>> export prefix =3D "/opt/ltp"
>> export exec_prefix =3D "/opt/ltp"
>>
>>
>



