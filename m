Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1So31S-0003os-Vj
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 03:44:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q691XAKI020750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Jul 2012 18:33:11 -0700 (PDT)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 8 Jul 2012 18:33:10 -0700
Message-ID: <4FFA34D5.1090504@windriver.com>
Date: Mon, 9 Jul 2012 09:33:09 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1340873279.git.kai.kang@windriver.com>
	<e6f7a20a5b94c037c1f234180751ecceba8d2d41.1340873279.git.kai.kang@windriver.com>
	<4FF7861E.6040702@linux.intel.com>
In-Reply-To: <4FF7861E.6040702@linux.intel.com>
X-Originating-IP: [128.224.162.164]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q691XAKI020750
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] lsbinitscripts: Add a linking for functions.lsbinitscripts
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
X-List-Received-Date: Mon, 09 Jul 2012 01:44:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B407=E6=9C=8807=E6=97=A5 08:43, Saul Wold wrote:
> On 06/28/2012 02:35 AM, Kang Kai wrote:
>> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>>
>> Increase ALTERNATIVE_PRIORITY of functions to be higher than the
>> value of package initscript. When lsbinitscripts installed, file
>> functions provided by lsbinitscripts will be used.
>>
>> [YOCTO #2133]
>>
>> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>> Signed-off-by: Kang Kai <kai.kang@windriver.com>
>> ---
>> meta/recipes-extended/lsb/lsbinitscripts_9.03.bb | 6 +++---
>> 1 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb=20
>> b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
>> index dd92a92..f324994 100644
>> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
>> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "SysV init scripts which only is used=20
>> in an LSB image"
>> SECTION =3D "base"
>> LICENSE =3D "GPLv2"
>> DEPENDS =3D "popt"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debf4e8b49780ab187d51bd26aaa=
022c6"
>>
>> @@ -15,7 +15,7 @@ SRC_URI[md5sum] =3D "668fa2762b57ef75436303857847bba=
3"
>> SRC_URI[sha256sum] =3D=20
>> "d56547a68ce223a7413b2676650b042125f047c8d6d139c5b970e118b3dc958a"
>> inherit update-alternatives
>>
>> -ALTERNATIVE_PRIORITY =3D "10"
>> +ALTERNATIVE_PRIORITY =3D "100"
>> ALTERNATIVE_${PN} =3D "functions"
>> ALTERNATIVE_LINK_NAME[functions] =3D "${sysconfdir}/init.d/functions"
>>
>> @@ -23,5 +23,5 @@ do_configure[noexec] =3D "1"
>>
>> do_install(){
>> install -d ${D}/etc/init.d/
>> - install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
>> + install -m 0755 ${S}/rc.d/init.d/functions=20
>> ${D}/etc/init.d/functions.${BPN}
>> }
>>
> As Richard already pointed out, this rename during install is not=20
> needed, it happens automagically via the update-alternatives bbclass,=20
> this is true with the initscripts recipe also, please fix these two=20
> issues and we can move forward with this patch.
Saul,

Thanks. I'll update them.

Regards,
Kai

>
> Thanks
> Sau!
>
>



