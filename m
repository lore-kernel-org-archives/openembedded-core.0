Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RlVbT-0002b5-SR
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 02:06:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0D0xF9G003429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jan 2012 16:59:15 -0800 (PST)
Received: from [128.224.16.106] (128.224.16.106) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Jan 2012 16:59:15 -0800
Message-ID: <4F0F81E0.4090105@windriver.com>
Date: Fri, 13 Jan 2012 08:59:12 +0800
From: "zumeng.chen" <zchen@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1326245504-22965-1-git-send-email-zumeng.chen@windriver.com>
	<4F0F0797.4000500@linux.intel.com>
In-Reply-To: <4F0F0797.4000500@linux.intel.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q0D0xF9G003429
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V4]lttng-2.0 new recipe
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
X-List-Received-Date: Fri, 13 Jan 2012 01:06:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B401=E6=9C=8813=E6=97=A5 00:17, Darren Hart wrote:
> Hi Zumeng,
>
> I reviewed V4 from the git link below ( didn't see the patches
> themselved hit the list ).
>
> The patch in 1/4: "+Subject: [PATCH 1/1] Fix compiling error on powerpc
> and arm" is missing an UpstreamStatus tag. Otherwise, it looks ready to=
 me.
OK thanks Darren, I'll fix them in V5

Zumeng
> --
> Darren
>
> On 01/10/2012 05:31 PM, Zumeng Chen wrote:
>> Changes of V4:
>>    Fixed all comments from Darrent;
>>    To: OE-core.
>>
>> The following changes since commit 4a8a3c503fd896593b787c26edbe46a7324=
e494e:
>>
>>    Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works" (2012-0=
1-10 18:33:25 +0000)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib zumeng/lttng-2.0
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzumeng/lttn=
g-2.0
>>
>> Zumeng Chen (4):
>>    lttng-ust: Integrate into yocto linux
>>    lttng-tools: Integrated from git repo.
>>    lttng-modules: from lttng-modules 2.0 git repo.
>>    babeltrace: Integrated from version 0.8
>>
>>   meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb    |   28 ++++++++++=
+++
>>   ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |   41 ++++++++++=
++++++++++
>>   .../lttng-2.0/lttng-modules_2.0.pre11.bb           |   27 ++++++++++=
+++
>>   ...tools-fix-compiling-error-for-powerpc-arm.patch |   28 ++++++++++=
+++
>>   .../lttng-2.0/lttng-tools_2.0-pre16.bb             |   30 ++++++++++=
++++
>>   meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb   |   25 ++++++++++=
++
>>   6 files changed, 179 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
>>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules-repla=
ce-KERNELDIR-with-KERNEL_SRC.patch
>>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.p=
re11.bb
>>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools-fix-com=
piling-error-for-powerpc-arm.patch
>>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre=
16.bb
>>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
>>



