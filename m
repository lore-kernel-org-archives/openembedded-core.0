Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoapH-0003RT-SW
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 15:50:04 +0200
Received: by pbbrq2 with SMTP id rq2so286297pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=kkGrUtAMuUEZSN95Rfvs0LLQJu+KA/rGqPYx19i0r4w=;
	b=TfjDk1+nmn+kBwktGYl9AsLjRVbDH1P7BND5NDTwXQ8IRR+ljdMYD8KY4paBAxLxrE
	Xvr8Z++wNf0IjWh/nDH85rKfcUoSdhfNhn9EQHn5rCCZPyLzCditz0jpfq0FLgGfyZ27
	WDTZXAFiVHJC6+Px6R9i70QbCGAd+XzenoY3nkw9oyYyaLsWrpsvOEsn5RAnKN/q2/ee
	QRe+JY87SS68ZvaKNe7hI1ZDa9KCKOE/yLm10NePnyNHYD0xwNuWFhij487A4ZTGev4w
	DBLG9C9Mv7f0CreCcGPHiRzTlkk8TYguxX7YLmP83fxVihq/YukmHs3RwBU6ZJ4F+6M1
	T/iQ==
Received: by 10.68.231.8 with SMTP id tc8mr68779013pbc.140.1341927532001;
	Tue, 10 Jul 2012 06:38:52 -0700 (PDT)
Received: from [192.168.1.66] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id jz4sm29906808pbc.17.2012.07.10.06.38.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 06:38:51 -0700 (PDT)
References: <cover.1340205163.git.raj.khem@gmail.com>
	<a1ca534609d8ae49a16b9d28cc9e92db0894c4e4.1340205163.git.raj.khem@gmail.com>
	<20120622063756.GK9352@jama.jama.net>
	<CAMKF1spK9RwuhfGoTSPCEGvnKRcYfYPHGo0EdktwXdthP6uncA@mail.gmail.com>
	<20120622073838.GL9352@jama.jama.net>
	<20120710075233.GK6308@jama.jama.net>
In-Reply-To: <20120710075233.GK6308@jama.jama.net>
Mime-Version: 1.0 (1.0)
Message-Id: <1B8499DF-0BC0-43EC-96AE-9B9E45479374@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jul 2012 06:38:47 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Tue, 10 Jul 2012 13:50:04 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On Jul 10, 2012, at 12:52 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Jun 22, 2012 at 09:38:38AM +0200, Martin Jansa wrote:
>> On Fri, Jun 22, 2012 at 12:20:31AM -0700, Khem Raj wrote:
>>> On Thu, Jun 21, 2012 at 11:37 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>>> On Wed, Jun 20, 2012 at 08:18:37AM -0700, Khem Raj wrote:
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>>  meta/recipes-devtools/gcc/gcc-4.7.inc |   12 ++++++------
>>>>>  1 files changed, 6 insertions(+), 6 deletions(-)
>>>>>=20
>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devt=
ools/gcc/gcc-4.7.inc
>>>>> index 34a73b1..25a1088 100644
>>>>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>>>>> @@ -3,12 +3,12 @@ require gcc-common.inc
>>>>>  PR =3D "r2"
>>>>>=20
>>>>>  # Third digit in PV should be incremented after a minor release
>>>>> -# happens from this branch on gcc e.g. currently its 4.7.0
>>>>> -# when 4.7.1 is releases and we bump SRCREV beyond the release
>>>>> -# on branch then PV should be incremented to 4.7.1+svnr${SRCPV}
>>>>> +# happens from this branch on gcc e.g. currently its 4.7.1
>>>>> +# when 4.7.2 is releases and we bump SRCREV beyond the release
>>>>> +# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
>>>>>  # to reflect that change
>>>>>=20
>>>>> -PV =3D "4.7.0+svnr${SRCPV}"
>>>>> +PV =3D "4.7.1+svnr${SRCPV}"
>>>>>=20
>>>>>  # BINV should be incremented after updating to a revision
>>>>>  # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
>>>>> @@ -16,9 +16,9 @@ PV =3D "4.7.0+svnr${SRCPV}"
>>>>>  # 4.7.1 then the value below will have 2 which will mean 4.7.2
>>>>>  # which will be next minor release and so on.
>>>>>=20
>>>>> -BINV =3D "4.7.1"
>>>>> +BINV =3D "4.7.2"
>>>>>=20
>>>>> -SRCREV =3D "186651"
>>>>> +SRCREV =3D "188658"
>>>>>  BRANCH =3D "gcc-4_7-branch"
>>>>>  FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d=
)}"
>>>>=20
>>>> I'm not sure if this one is new, but libgcc now reports unpackaged
>>>> file:
>>>>=20
>>>> NOTE: package libgcc-4.7.1+svnr188658-r2: task do_package: Started
>>>> WARNING: For recipe libgcc, the following files/directories were
>>>> installed but not shipped in any package:
>>>> WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include
>>>> WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include/unwind.h
>>>=20
>>> can you see couple of things 1. if this file is being generated and
>>> installed during libgcc build or if its coming from the bits that are
>>> stashed away from gcc-cross build
>>>=20
>>> this file should not be packaged with libgcc so right solution will be
>>> to delete this file
>>>>=20
>>>> And the problem with (sometimes) missing or corrupt header file is stil=
l there:
>>>> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-b=
ranch/gcc/dwarf2out.c:8383:6: warning: format not a string literal and no fo=
rmat arguments [-Wformat-security]
>>>> | gcc -c   -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/in=
clude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strin=
gs -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-att=
ribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings=
 -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr-cor=
e/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc -I/OE/sh=
r-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/. -=
I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/=
gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2=
/gcc-4_7-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglibc/work-shared=
/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../libdecnumber -I/OE/shr-core/t=
mp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../libdecnu=
mber/dpd -I../libdecnumber    /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+=
svnr188658-r2/gcc-4_7-branch/gcc/emit-rtl.c -o emit-rtl.o
>>>> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-b=
ranch/gcc/emit-rtl.c:42:17: fatal error: rtl.h: No such file or directory
>>>> | compilation terminated.
>>>> Restarting build helps again..
>>>>=20
>>>=20
>>> this is intriguing we should look into it can you explain (once again
>>> how can I reproduce it)
>>=20
>> I still don't have any steps how to reproduce it reliably, just doing a
>> lot of gcc builds and I see about once from 5 builds.. So with every gcc
>> upgrade (even with just PR bump) I get usually at least 1 build failure
>> for 1 architecture/machine on one buildhost (sometimes it's on fast one,
>> sometimes on slow one with just 2 threads - so speed is not so important
>> to reproduce it).
>>=20
>> Usually it's from gcc-cross-initial, but sometimes from intermediate or
>> gcc-cross itself too.
>>=20
>> The error is different from time to time, but always some constant
>> missing or whole header file like in today's error. Probably most
>> popular one is
>> /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branc=
h/gcc/calls.c:1204:9:
>> error: 'STACK_CHECK_MAX_VAR_SIZE' undeclared (first use in this
>> function)
>>=20
>> whole log in=20
>> http://build.shr-project.org/tests/jama/gcc-issue/gcc-race-new/
>>=20
>> even more samples:
>> http://build.shr-project.org/tests/jama/gcc-upgrade-issue/
>>=20
>> I'm sorry I cannot provide better info.
>=20
> I guess this was caused by subversion-native in sstate checksums
> which was fixed in:
> http://git.openembedded.org/openembedded-core/commit/?id=3D793ce6cd9aa632e=
0f13789c8293770a86085d28d
>=20
> because I was using subversion-native for long, so that can explain why
> I was only one seeing those gcc issues

Interesting , do you think it was sort of a race

>=20
> Cheers,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


