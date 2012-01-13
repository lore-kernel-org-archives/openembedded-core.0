Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RlVa9-0002Xb-4N
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 02:05:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0D0vqq8003414
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jan 2012 16:57:52 -0800 (PST)
Received: from [128.224.16.106] (128.224.16.106) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Jan 2012 16:57:52 -0800
Message-ID: <4F0F818E.4020208@windriver.com>
Date: Fri, 13 Jan 2012 08:57:50 +0800
From: "zumeng.chen" <zchen@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1326337436.git.zumeng.chen@windriver.com>
	<7e296b4784e2043a1be8b47cd935bb3e06db1b12.1326337436.git.zumeng.chen@windriver.com>
	<4F0F596C.8080806@linux.intel.com>
In-Reply-To: <4F0F596C.8080806@linux.intel.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q0D0vqq8003414
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] babeltrace: Integrated from version 0.8
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
X-List-Received-Date: Fri, 13 Jan 2012 01:05:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B401=E6=9C=8813=E6=97=A5 06:06, Saul Wold wrote:
> On 01/11/2012 07:11 PM, Zumeng Chen wrote:
>> It provides trace read and write libraries, as well as a trace=20
>> converter.
>>
>> Signed-off-by: Zumeng Chen<zumeng.chen@windriver.com>
>> ---
>> meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb | 28=20
>> +++++++++++++++++++++++
>> 1 files changed, 28 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
>>
>> diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb=20
>> b/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
>> new file mode 100644
>> index 0000000..76a76c3
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY =3D "Babeltrace - Trace Format Babel Tower"
>> +DESCRIPTION =3D "Babeltrace provides trace read and write libraries i=
n=20
>> host side, as well as a trace converter, which used to convert LTTng=20
>> 2.0 traces into human-readable log."
>> +HOMEPAGE =3D "http://www.efficios.com/babeltrace/"
>> +BUGTRACKER =3D "n/a"
>> +
>> +LICENSE =3D "MIT& GPLV2"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D8d1a03b3c17bdd158b3cbb34813b1423"
>> +
> LICENSE vs LIC_FILES_CHKSUM, does the LICENSE file contain both?
Yes,
>
> also GPLv2 not V2
fixed.
>
> Sau!
>
>> +inherit autotools
>> +
>> +DEPENDS =3D "gtk+ util-linux"
>> +
>> +SRCREV =3D "31e670293588d7882a232bc14b93d5e956fa43f4"
>> +PV =3D "0.8+git${SRCPV}"
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "git://git.efficios.com/babeltrace.git;protocol=3Dgit"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_configure_prepend () {
>> + ${S}/bootstrap
>> +}
>> +
>> +# Due to liburcu not building for MIPS currently this recipe needs to
>> +# be limited also.
>> +# So here let us first suppport x86/arm/powerpc platforms now.
>> +COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'



