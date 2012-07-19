Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SrtMh-0007rT-4i
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:14:11 +0200
Received: from mail165-co1-R.bigfish.com (10.243.78.236) by
	CO1EHSOBE011.bigfish.com (10.243.66.74) with Microsoft SMTP Server id
	14.1.225.23; Thu, 19 Jul 2012 16:02:48 +0000
Received: from mail165-co1 (localhost [127.0.0.1])	by
	mail165-co1-R.bigfish.com (Postfix) with ESMTP id 217ED6C01A2;
	Thu, 19 Jul 2012 16:02:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail165-co1 (localhost.localdomain [127.0.0.1]) by mail165-co1
	(MessageSwitch) id 1342713765495747_26375;
	Thu, 19 Jul 2012 16:02:45 +0000 (UTC)
Received: from CO1EHSMHS021.bigfish.com (unknown [10.243.78.241])	by
	mail165-co1.bigfish.com (Postfix) with ESMTP id 772CD340049;
	Thu, 19 Jul 2012 16:02:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS021.bigfish.com
	(10.243.66.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 19 Jul 2012 16:02:43 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Thu, 19 Jul 2012 11:02:42 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] rpm_5.4.9.bb: fix builds on systems with
	older libc
Thread-Index: AQHNZcTSpSpT5w4p5kOnblPn3teCCZcxGAgA
Date: Thu, 19 Jul 2012 16:02:41 +0000
Message-ID: <CAEsOVNeJfG1mSUwyQeczuYxE-V=NyBZ8J0soFH1Q+zNa37NvPg@mail.gmail.com>
References: <1341940460-5784-1-git-send-email-msm@freescale.com>
	<50082A6C.3020002@linux.intel.com>
In-Reply-To: <50082A6C.3020002@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] rpm_5.4.9.bb: fix builds on systems with older libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 19 Jul 2012 16:14:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <31E5B5B018255C46906F715F5AB25ACB@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2012 at 10:40 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/10/2012 10:14 AM, Matthew McClintock wrote:
>>
>> | dbconvert.o: In function `rpmdb_convert':
>> |
>> /local/jenkins/jobs/yocto-upstream/workspace/label/master/machine/p4080d=
s/poky/master/tmp/work/x86_64-linux/rpm-native-5.4.9-r45/rpm-5.4.9/tools/db=
convert.c:126:
>> warning: the use of `tempnam' is dangerous, better use `mkstemp'
>> | dbconvert.o: In function `main':
>> | dbconvert.c:(.text+0x923): undefined reference to `htobe32'
>> | dbconvert.c:(.text+0xaa4): undefined reference to `htole32'
>> | dbconvert.c:(.text+0xac9): undefined reference to `htole32'
>>
>
> Matthew,
>
> Some how this patch has introduced a problem with the package-index proce=
ss,
> as can be seen by the recent autobuilder nightly failures. I know this pa=
tch
> seems to remove dbconvert, but that causes problems for the package-index
> task.
>
> We have filed a bug #2753
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2753), to track this=
.
> Can you take a look into this?
>
> Since it is causing the AB to fail, we would like to get this resolved,
> Robert Yang is also looking at the issue. We will likely revert this patc=
h
> tomorrow if we don't get a resolution sooner.

The intent of this patch is to disable building one object file. It's
possible I borked something else along the way?

-M

>
> Thanks
>         Sau!
>
>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>   meta/recipes-devtools/rpm/rpm/dbconvert.patch |   27
>> +++++++++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_5.4.9.bb        |    3 ++-
>>   2 files changed, 29 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/rpm/rpm/dbconvert.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm/dbconvert.patch
>> b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
>> new file mode 100644
>> index 0000000..27dba8c
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
>> @@ -0,0 +1,27 @@
>> +Upstream-Status: Not applicable
>> +
>> +Hack to prevent unneeded demo app from building on older libc
>> +where it will break the build
>> +
>> +Index: rpm-5.4.9/tools/Makefile.am
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- rpm-5.4.9.orig/tools/Makefile.am
>> ++++ rpm-5.4.9/tools/Makefile.am
>> +@@ -24,7 +24,7 @@ AM_CFLAGS =3D $(OPENMP_CFLAGS)
>> +
>> + EXTRA_DIST =3D  hashtab.h bsdiff.1 bspatch.1 dotgraph.hh
>> +
>> +-EXTRA_PROGRAMS =3D augtool cudftool dbconvert debugedit \
>> ++EXTRA_PROGRAMS =3D augtool cudftool debugedit \
>> +       nix-build nix-channel nix-collect-garbage nix-copy-closure \
>> +       nix-env nix-hash nix-install-package nix-instantiate \
>> +       nix-log2xml nix-prefetch-url nix-pull nix-push nix-store
>> nix-worker \
>> +@@ -60,7 +60,7 @@ pkgbin_PROGRAMS =3D    \
>> +       rpmcache rpmdigest rpmrepo rpmspecdump \
>> +       rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WITH_KEYUTILS_RPMKEY@
>> @WITH_LIBELF_DEBUGEDIT@
>> + if WITH_DB
>> +-pkgbin_PROGRAMS +=3D    dbconvert
>> ++pkgbin_PROGRAMS +=3D
>> + endif
>> + dist_man_MANS =3D               rpmgrep.1
>> +
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> index 6ef1aae..e276cc3 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> @@ -43,7 +43,7 @@ LICENSE =3D "LGPLv2.1"
>>   LIC_FILES_CHKSUM =3D
>> "file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
>>
>>   DEPENDS =3D "libpcre attr acl popt ossp-uuid file"
>> -PR =3D "r45"
>> +PR =3D "r46"
>>
>>   # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is
>> needed
>>   # in order to extract the distribution SRPM into a format we can
>> extract...
>> @@ -75,6 +75,7 @@ SRC_URI =3D
>> "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>>            file://uclibc-support.patch \
>>            file://rpmatch.patch \
>>            file://fstack-protector-configure-check.patch \
>> +          file://dbconvert.patch \
>>           "
>>
>>   SRC_URI[md5sum] =3D "60d56ace884340c1b3fcac6a1d58e768"
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



