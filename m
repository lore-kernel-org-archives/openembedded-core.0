Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RlVYB-0002TS-TF
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 02:03:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0D0toGq003398
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jan 2012 16:55:50 -0800 (PST)
Received: from [128.224.16.106] (128.224.16.106) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Jan 2012 16:55:50 -0800
Message-ID: <4F0F8114.4010107@windriver.com>
Date: Fri, 13 Jan 2012 08:55:48 +0800
From: "zumeng.chen" <zchen@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1326337436.git.zumeng.chen@windriver.com>
	<6466944f4fff355f13da46c47fc22a907f6eda60.1326337436.git.zumeng.chen@windriver.com>
	<4F0F5909.4080907@linux.intel.com>
In-Reply-To: <4F0F5909.4080907@linux.intel.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q0D0toGq003398
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] lttng-tools: Integrated from git repo.
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
X-List-Received-Date: Fri, 13 Jan 2012 01:03:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B401=E6=9C=8813=E6=97=A5 06:04, Saul Wold wrote:
> On 01/11/2012 07:11 PM, Zumeng Chen wrote:
>> This patch intended to integrate the Linux trace toolkit, which
>> is a suite of tools designed to extract program execution details
>> from the Linux operating system and interpret them.
>>
>> lttng-tools 2.0 is currently in pre-release(-pre16), so we have to
>> update it when official released.
>>
>> Signed-off-by: Zumeng Chen<zumeng.chen@windriver.com>
>> ---
>> ...tools-fix-compiling-error-for-powerpc-arm.patch | 28=20
>> ++++++++++++++++++
>> .../lttng-2.0/lttng-tools_2.0-pre16.bb | 30 ++++++++++++++++++++
>> 2 files changed, 58 insertions(+), 0 deletions(-)
>> create mode 100644=20
>> meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powe=
rpc-arm.patch
>> create mode 100644=20
>> meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
>>
>> diff --git=20
>> a/meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-po=
werpc-arm.patch=20
>> b/meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-po=
werpc-arm.patch=20
>>
>> new file mode 100644
>> index 0000000..f8e144f
>> --- /dev/null
>> +++=20
>> b/meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-po=
werpc-arm.patch
>> @@ -0,0 +1,28 @@
>> +From 5d8d75ab0c7f9e0009d90a2e5ad6475034a5c859 Mon Sep 17 00:00:00 200=
1
>> +From: Zumeng Chen<zumeng.chen@windriver.com>
>> +Date: Tue, 10 Jan 2012 12:41:45 +0800
>> +Subject: [PATCH 1/1] Fix compiling error on powerpc and arm
>> +
>
> No Upstream-Status:
Upstream-Status: Pending
>
>
>> +For powerpc and arm, some MAP_ are defined asm/mman.h,
>> +so including it in header.
>> +
>> +Signed-off-by: Zumeng Chen<zumeng.chen@windriver.com>
>> +---
>> + common/runas.c | 1 +
>> + 1 files changed, 1 insertions(+), 0 deletions(-)
>> +
>> +diff --git a/common/runas.c b/common/runas.c
>> +index f612ccc..62a2791 100644
>> +--- a/common/runas.c
>> ++++ b/common/runas.c
>> +@@ -29,6 +29,7 @@
>> + #include<fcntl.h>
>> + #include<sched.h>
>> + #include<sys/mman.h>
>> ++#include<asm/mman.h>
>> +
>> + #include<lttngerr.h>
>> +
>> +--
>> +1.7.5.4
>> +
>> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb=20
>> b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
>> new file mode 100644
>> index 0000000..cde57f7
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
>> @@ -0,0 +1,30 @@
>> +SECTION =3D "devel"
>> +SUMMARY =3D "Linux Trace Toolkit Control"
>> +DESCRIPTION =3D "The Linux trace toolkit is a suite of tools designed=
 \
>> +to extract program execution details from the Linux operating system =
\
>> +and interpret them."
>> +
>> +LICENSE =3D "GPLv2.1"
>
> You have gpl-2.0 and lgpl-2.1 list below which is the correct LICENSE?
Yes, fixed, LICENSE =3D "GPLv2 & LGPLv2.1"

Thanks,
Zumeng
>
> Sau!
>
>> +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3Dab682a4729389c3f11913d758affe98e \
>> + file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>> + file://lgpl-2.1.txt;md5=3D0f0d71500e6a57fd24d825f33242b9ca"
>> +
>> +DEPENDS =3D "liburcu popt lttng-ust"
>> +
>> +SRCREV =3D "f2ca2e251d8f49b0dbbcca529dd61b3562c1147f"
>> +PV =3D "v2.0.pre16+git${SRCREV}"
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "git://git.lttng.org/lttng-tools.git;protocol=3Dgit\
>> + file://lttng-tools-fix-compiling-error-for-powerpc-arm.patch"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit autotools
>> +
>> +export KERNELDIR=3D"${STAGING_KERNEL_DIR}"
>> +
>> +# Due to liburcu not building for MIPS currently this recipe needs to
>> +# be limited also.
>> +# So here let us first suppport x86/arm/powerpc platforms now.
>> +COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'



