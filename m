Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RmexL-0000lm-Ej
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 06:18:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0G5AUfr001947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Jan 2012 21:10:30 -0800 (PST)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 15 Jan 2012 21:10:30 -0800
Message-ID: <4F13B0EF.5050802@windriver.com>
Date: Mon, 16 Jan 2012 13:09:03 +0800
From: Zumeng Chen <zumeng.chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Lightning/1.0b2 Thunderbird/3.1.16
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1326418292.git.zumeng.chen@windriver.com>
	<4F13AE6C.90607@linux.intel.com>
In-Reply-To: <4F13AE6C.90607@linux.intel.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q0G5AUfr001947
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] [V5] lttng-2.0 new recipe
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
X-List-Received-Date: Mon, 16 Jan 2012 05:18:07 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=E4=BA=8E 2012=E5=B9=B401=E6=9C=8816=E6=97=A5 12:58, Saul Wold =E5=86=99=E9=
=81=93:
> On 01/12/2012 05:44 PM, Zumeng Chen wrote:
>> V5 Changes vs all previous versions:
>> 1 ) fixed all Darren's comments;
>> 2 ) fixed all Saul's comments;
>> +LICENSE =3D "MIT& GPLv2" for 0004-babeltrace..
>> Upstream-Status: Pending for lttng-tools-fix-compiling..
>> +LICENSE =3D "GPLv2& LGPLv2.1" for 0002-lttng-tools-..
>>
>> Thanks,
>> Zumeng
>>
>> The following changes since commit=20
>> 0f4d99d207b224bb9ce23de00a48f795ae20b3a0:
>>
>> multilib.conf: Clean up file and add missing entries for various=20
>> dependencies (2012-01-11 23:53:32 +0000)
>>
>> are available in the git repository at:
>> git://git.pokylinux.org/poky-contrib zumeng/lttng-2.0
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzumeng/lttng-2=
.0
>>
>> Zumeng Chen (4):
>> lttng-ust: Update to 2.0
>> lttng-tools: Update to 2.0-pre16
>> lttng-modules: Update to 2.0
>> babeltrace: Integrated from version 0.8
>>
>> meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb | 28 +++++++++++++
>> ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch | 41=20
>> ++++++++++++++++++++
>> .../lttng-2.0/lttng-modules_2.0.pre11.bb | 27 +++++++++++++
>> ...tools-fix-compiling-error-for-powerpc-arm.patch | 27 +++++++++++++
>> .../lttng-2.0/lttng-tools_2.0-pre16.bb | 30 ++++++++++++++
>> meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb | 25 ++++++++++++
>> 6 files changed, 178 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
>> create mode 100644=20
>> meta/recipes-kernel/lttng-2.0/lttng-modules-replace-KERNELDIR-with-KER=
NEL_SRC.patch
>> create mode 100644=20
>> meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
>> create mode 100644=20
>> meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powe=
rpc-arm.patch
>
> Zumeng,
>
> My apologies for not catching this before, I just noticed that these=20
> patch files are not in a subdirectory, they should be located in a=20
> directory that is matches either the recipe name or recipe name with=20
> version (if they are specific to that version of the upstream).
NP, Saul, since lttng-2.0 is still in pre-phase.
I noticed, but it seems it can apply them smoothly,
so I just leave them there.
Anyway, I'll send a new version with these changes
and git updating.

Thanks,
Zumeng
>
> Sau!
>
>> create mode 100644=20
>> meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
>> create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
>>



