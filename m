Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUjnt-0004bm-1S
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 21:22:35 +0200
Received: by eekd49 with SMTP id d49so315903eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 12:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TlDzNEmeipyf2erGvhBEG4gecRz4gXLn+B408p/gfC4=;
	b=yJfndmveZx9gFdG5X3vfWW1oSj24ZMooY0vFhwsQE7vHqe37nYwGlRBnEPmq1vUZhf
	bLBFfVuSJVt3Y67ylgtkNPvI8CUzkectJ5EUmsdkwXZyxiT67pmTXVktD3dtKFm6ptjl
	jPRbtRDHxsmHkka2Jh03j58Hc8PHRk0SlvyoURCm4RI9gUR+1mhlVJHbx0tpzKRNPUum
	QQ8FuyHjS4nFPk1lk7qrkbAiWH1wqEx8sJCuYw26LtVjLPNQ7FwOoDNWxiim07oBwFX7
	r+Cpfx0t/fSvVmkYXjw22gJ49AT3dsV4Lp0NQOhuoKxgFiG+OTK6q+BW8RtxASrZOs/l
	XBKw==
MIME-Version: 1.0
Received: by 10.14.99.129 with SMTP id x1mr889044eef.108.1337195551239; Wed,
	16 May 2012 12:12:31 -0700 (PDT)
Received: by 10.14.2.132 with HTTP; Wed, 16 May 2012 12:12:31 -0700 (PDT)
In-Reply-To: <4FB3F766.3080400@linux.intel.com>
References: <95a4d7c127f39cac6fc7d60e8b4081ae774cd745.1337191798.git.nitin.a.kamble@intel.com>
	<d5ffec3f9f188123a6afd282109f33417994b8d9.1337191798.git.nitin.a.kamble@intel.com>
	<4FB3F766.3080400@linux.intel.com>
Date: Wed, 16 May 2012 12:12:31 -0700
Message-ID: <CAMKF1sr0rWGPS7unDbndrmaJ97jSLn_6hFtTPXcvygq1e4qi8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: fix DEPENDS to avoid a build issue
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
X-List-Received-Date: Wed, 16 May 2012 19:22:36 -0000
Content-Type: multipart/alternative; boundary=bcaec53968c8d3ae7d04c02c1995

--bcaec53968c8d3ae7d04c02c1995
Content-Type: text/plain; charset=UTF-8

On Wednesday, May 16, 2012, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/16/2012 09:11 PM, nitin.a.kamble@intel.com wrote:
>>
>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>
>> this commits avoids this issue:
>>
>> | 4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc/.
-I/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gc
>> c-4_7-branch/libgcc/../gcc
-I/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc
>> /../include
-I/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc/config/libbid
>> -DENABLE_DECIMAL_BID_FORMAT -DHAVE_CC_TLS  -DUSE_TLS -o _fixdfdi_s.o -MT
_fixdfdi_s.o -MD -MP -MF _fixdfdi_s.dep -DS
>> HARED -DL_fixdfdi -c
/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc/libgcc2
>> .c
>> |
/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc/unwind-dw2.c:42:21:
fatal
>> error: sys/sdt.h: No such file or directory
>> | compilation terminated.
>> | make[2]: *** [unwind-dw2.o] Error 1
>> | make[2]: *** Waiting for unfinished jobs....
>> | make[2]: Leaving directory
`/home/nitin/builds/build0/tmp/work/i586-poky-linux/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/i586-poky-linux/libgcc'
>> | make[1]: *** [all-target-libgcc] Error 2
>> | make[1]: Leaving directory
`/home/nitin/builds/build0/tmp/work/i586-poky-linux/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux'
>> | make: *** [all] Error 2
>> | ERROR: oe_runmake failed
>> NOTE: package gcc-4.7.0+svnr186651-r1: task do_compile: Failed
>> ERROR: Task 8 (/home/nitin/prj/poky.git/meta/recipes-devtools/gcc/
gcc_4.7.bb, do_compile) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 808 tasks of which 801 didn't need to be
rerun and 1 failed.
>>
>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-4.7.inc |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc
b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> index 8adeb8d..9c73235 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> @@ -1,6 +1,6 @@
>>  require gcc-common.inc
>>
>> -PR = "r1"
>> +PR = "r2"
>>
>>  # Third digit in PV should be incremented after a minor release
>>  # happens from this branch on gcc e.g. currently its 4.7.0
>> @@ -22,7 +22,7 @@ SRCREV = "186651"
>>  BRANCH = "gcc-4_7-branch"
>>  FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
>>
>> -DEPENDS =+ "mpfr gmp libmpc"
>> +DEPENDS =+ "mpfr gmp libmpc systemtap"
>
> Nitin,
>
> I am not sure this is the right way to do this, first it's bringing in
another dependency into gcc, it also will cause a mips failure as systemtap
does not build with mips.
>
> It might be better to modify the configuration to ensure that system tap
is always disabled.  This will ensure a deterministic build.
>

Yes disabling systemtap  is the right thing to do here


> Sau!
>>
>>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
>>
>>  LICENSE="GPL-3.0-with-GCC-exception&  GPLv3"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec53968c8d3ae7d04c02c1995
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 16, 2012, Saul Wold &lt;<a href=3D"mailto:sgw@lin=
ux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>&gt; On 05/16/2012 09:1=
1 PM, <a href=3D"mailto:nitin.a.kamble@intel.com">nitin.a.kamble@intel.com<=
/a> wrote:<br>
&gt;&gt;<br>&gt;&gt; From: Nitin A Kamble&lt;<a href=3D"mailto:nitin.a.kamb=
le@intel.com">nitin.a.kamble@intel.com</a>&gt;<br>&gt;&gt;<br>&gt;&gt; this=
 commits avoids this issue:<br>&gt;&gt;<br>&gt;&gt; | 4.7.0+svnr186651-r1/g=
cc-4_7-branch/libgcc/. -I/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.=
0+svnr186651-r1/gc<br>
&gt;&gt; c-4_7-branch/libgcc/../gcc -I/home/nitin/builds/build0/tmp/work-sh=
ared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc<br>&gt;&gt; /../include =
-I/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7=
-branch/libgcc/config/libbid<br>
&gt;&gt; -DENABLE_DECIMAL_BID_FORMAT -DHAVE_CC_TLS =C2=A0-DUSE_TLS -o _fixd=
fdi_s.o -MT _fixdfdi_s.o -MD -MP -MF _fixdfdi_s.dep -DS<br>&gt;&gt; HARED -=
DL_fixdfdi -c /home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr18665=
1-r1/gcc-4_7-branch/libgcc/libgcc2<br>
&gt;&gt; .c<br>&gt;&gt; | /home/nitin/builds/build0/tmp/work-shared/gcc-4.7=
.0+svnr186651-r1/gcc-4_7-branch/libgcc/unwind-dw2.c:42:21: fatal<br>&gt;&gt=
; error: sys/sdt.h: No such file or directory<br>&gt;&gt; | compilation ter=
minated.<br>
&gt;&gt; | make[2]: *** [unwind-dw2.o] Error 1<br>&gt;&gt; | make[2]: *** W=
aiting for unfinished jobs....<br>&gt;&gt; | make[2]: Leaving directory `/h=
ome/nitin/builds/build0/tmp/work/i586-poky-linux/gcc-4.7.0+svnr186651-r1/gc=
c-4_7-branch/build.i586-poky-linux.i586-poky-linux/i586-poky-linux/libgcc&#=
39;<br>
&gt;&gt; | make[1]: *** [all-target-libgcc] Error 2<br>&gt;&gt; | make[1]: =
Leaving directory `/home/nitin/builds/build0/tmp/work/i586-poky-linux/gcc-4=
.7.0+svnr186651-r1/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux&#39=
;<br>
&gt;&gt; | make: *** [all] Error 2<br>&gt;&gt; | ERROR: oe_runmake failed<b=
r>&gt;&gt; NOTE: package gcc-4.7.0+svnr186651-r1: task do_compile: Failed<b=
r>&gt;&gt; ERROR: Task 8 (/home/nitin/prj/poky.git/meta/recipes-devtools/gc=
c/<a href=3D"http://gcc_4.7.bb">gcc_4.7.bb</a>, do_compile) failed with exi=
t code &#39;1&#39;<br>
&gt;&gt; NOTE: Tasks Summary: Attempted 808 tasks of which 801 didn&#39;t n=
eed to be rerun and 1 failed.<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Nitin =
A Kamble&lt;<a href=3D"mailto:nitin.a.kamble@intel.com">nitin.a.kamble@inte=
l.com</a>&gt;<br>
&gt;&gt; ---<br>&gt;&gt; =C2=A0meta/recipes-devtools/gcc/gcc-4.7.inc | =C2=
=A0 =C2=A04 ++--<br>&gt;&gt; =C2=A01 files changed, 2 insertions(+), 2 dele=
tions(-)<br>&gt;&gt;<br>&gt;&gt; diff --git a/meta/recipes-devtools/gcc/gcc=
-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc<br>
&gt;&gt; index 8adeb8d..9c73235 100644<br>&gt;&gt; --- a/meta/recipes-devto=
ols/gcc/gcc-4.7.inc<br>&gt;&gt; +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc=
<br>&gt;&gt; @@ -1,6 +1,6 @@<br>&gt;&gt; =C2=A0require gcc-common.inc<br>&g=
t;&gt;<br>
&gt;&gt; -PR =3D &quot;r1&quot;<br>&gt;&gt; +PR =3D &quot;r2&quot;<br>&gt;&=
gt;<br>&gt;&gt; =C2=A0# Third digit in PV should be incremented after a min=
or release<br>&gt;&gt; =C2=A0# happens from this branch on gcc e.g. current=
ly its 4.7.0<br>
&gt;&gt; @@ -22,7 +22,7 @@ SRCREV =3D &quot;186651&quot;<br>&gt;&gt; =C2=A0=
BRANCH =3D &quot;gcc-4_7-branch&quot;<br>&gt;&gt; =C2=A0FILESPATH =3D &quot=
;${@base_set_filespath([ &#39;${FILE_DIRNAME}/gcc-4.7&#39; ], d)}&quot;<br>=
&gt;&gt;<br>
&gt;&gt; -DEPENDS =3D+ &quot;mpfr gmp libmpc&quot;<br>&gt;&gt; +DEPENDS =3D=
+ &quot;mpfr gmp libmpc systemtap&quot;<br>&gt;<br>&gt; Nitin,<br>&gt;<br>&=
gt; I am not sure this is the right way to do this, first it&#39;s bringing=
 in another dependency into gcc, it also will cause a mips failure as syste=
mtap does not build with mips.<br>
&gt;<br>&gt; It might be better to modify the configuration to ensure that =
system tap is always disabled. =C2=A0This will ensure a deterministic build=
.<br>&gt;<br><br>Yes disabling systemtap =C2=A0is the right thing to do her=
e<br><br>
<br>&gt; Sau!<br>&gt;&gt;<br>&gt;&gt; =C2=A0NATIVEDEPS =3D &quot;mpfr-nativ=
e gmp-native libmpc-native zlib-native&quot;<br>&gt;&gt;<br>&gt;&gt; =C2=A0=
LICENSE=3D&quot;GPL-3.0-with-GCC-exception&amp; =C2=A0GPLv3&quot;<br>&gt;<b=
r>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/opene=
mbedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembed=
ded-core</a><br>
&gt;

--bcaec53968c8d3ae7d04c02c1995--
