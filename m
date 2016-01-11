Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BC1516FF9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 11:29:22 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aIaf3-0005QV-J8 from Awais_Belal@mentor.com ;
	Mon, 11 Jan 2016 03:29:22 -0800
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.44]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Mon, 11 Jan 2016 11:29:20 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Joshua Lock <joshuagloe@gmail.com>
Thread-Topic: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
Thread-Index: AQHRPXQQ2iBTKTrMm0uMwa00fKoPVp7lJjJVgAWJ1ACAAF0f3IADRTSxgAB+ZQCAARebj4ABFoGAgACJSt2ABL+RgIAAA/Gl
Date: Mon, 11 Jan 2016 11:29:19 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FB7C7FA@EU-MBX-02.mgc.mentorg.com>
References: <1450869629-27805-1-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB77C51@EU-MBX-02.mgc.mentorg.com>
	<5689D53A.3040902@gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB78A03@EU-MBX-02.mgc.mentorg.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB7A43D@EU-MBX-02.mgc.mentorg.com>
	<568D4BAA.9050001@gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB7A8B3@EU-MBX-02.mgc.mentorg.com>
	<568F1FD7.2010606@gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB7BF5F@EU-MBX-02.mgc.mentorg.com>,
	<CAK-Jx1PhGdKaYpwvW88zZ2qkxadbXpUyUWj3D4gRdP=2vfGaWg@mail.gmail.com>
In-Reply-To: <CAK-Jx1PhGdKaYpwvW88zZ2qkxadbXpUyUWj3D4gRdP=2vfGaWg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy][PATCH] grub2: Fix CVE-2015-8370
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 11:29:28 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2021B186DC632746BD5A3CE32F12BD28011FB7C7FAEUMBX02mgcmen_"

--_000_2021B186DC632746BD5A3CE32F12BD28011FB7C7FAEUMBX02mgcmen_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks a lot Joshua and sorry for the hassle.

BR,
Awais
________________________________
From: Joshua Lock [joshuagloe@gmail.com]
Sent: Monday, January 11, 2016 4:14 PM
To: Belal, Awais
Cc: akuster808; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370



On 8 January 2016 at 10:45, Belal, Awais <Awais_Belal@mentor.com<mailto:Awa=
is_Belal@mentor.com>> wrote:
Hi Armin,

Thanks a lot.

Can you please share the diff? I am just asking because Joshua is seeing th=
e same sort of issue with the fido branch while my local setup does not com=
plain there either.

I've cherry-picked the change from Armin's branch onto my joshuagl/fido-nex=
t branch.

Thanks,

Joshua


BR,
Awais

________________________________________
From: akuster808 [akuster808@gmail.com<mailto:akuster808@gmail.com>]
Sent: Friday, January 08, 2016 7:32 AM
To: Belal, Awais
Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org>
Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370

Awais,



hand applied. merged and pushed to

git.yoctoproject.org/poky-contrib.git<http://git.yoctoproject.org/poky-cont=
rib.git> akuster/dizzy-next

thanks,
Armin

On 01/07/2016 01:56 AM, Belal, Awais wrote:
> Hi Armin,
>
> With dizzy-next from your fork
>
> awais@alpha:~/yocto/build-dizzy-akuster$ bitbake -c patch grub
> Parsing recipes: 100% |##################################################=
############| Time: 00:00:46
> Parsing of 1458 .bb files complete (0 cached, 1458 parsed). 1914 targets,=
 66 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        =3D "1.24.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-14.04"
> TARGET_SYS        =3D "x86_64-poky-linux"
> MACHINE           =3D "amdfalconx86"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.7.3"
> TUNE_FEATURES     =3D "dbfp4"
> TARGET_FPU        =3D ""
> meta
> meta-yocto
> meta-yocto-bsp    =3D "akuster/dizzy-next:4807ff0ca0abf085e6b81257534a4a6=
2fde88d16"
> common
> meta-amdfalconx86 =3D "(detachedfromorigin/dizzy):84ae10ad68c7b253ab87558=
c5a6df057c9a84f08"
> meta-oe
> meta-python       =3D "(detachedfromorigin/dizzy):7f1df52e9409edcc4d4cd5f=
34694f8740f56e1bf"
>
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 10 tasks of which 0 didn't need to be reru=
n and all succeeded.
> awais@alpha:~/yocto/build-dizzy-akuster$ ls tmp/work/dbfp4-poky-linux/gru=
b/2.00-r1/
> 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
> 0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
> check-if-liblzma-is-disabled.patch
> fix-endianness-problem.patch
> fix-issue-with-flex-2.5.37.patch
> grub-2.00
> grub-2.00-add-oe-kernel.patch
> grub-2.00-fpmath-sse-387-fix.patch
> grub2-remove-sparc64-setup-from-x86-builds.patch
> grub-install.in.patch
> remove-gets.patch
> temp
> awais@alpha:~/yocto/build-dizzy-akuster$
>
> Pretty odd what's happening :)
>
> BR,
> Awais
>
> ________________________________________
> From: akuster808 [akuster808@gmail.com<mailto:akuster808@gmail.com>]
> Sent: Wednesday, January 06, 2016 10:15 PM
> To: Belal, Awais
> Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lis=
ts.openembedded.org>
> Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
>
> Awais,
>
> this is what I am seeing.
>
> NOTE: Executing RunQueue Tasks
> ERROR: Command Error: exit status: 1  Output:
> Applying patch 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
> patching file grub-core/lib/crypto.c
> Hunk #1 FAILED at 470.
> 1 out of 1 hunk FAILED -- rejects in file grub-core/lib/crypto.c
> patching file grub-core/normal/auth.c
> Hunk #1 FAILED at 174.
> 1 out of 1 hunk FAILED -- rejects in file grub-core/normal/auth.c
> Patch 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch does
> not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /home/akuster/oss/maint/mylayers/poky/build/tmp/work/i586-poky-linux/grub=
/2.00-r1/temp/log.do_patch.3029
> ERROR: Task 1
> (/home/akuster/oss/maint/mylayers/poky/meta/recipes-bsp/grub/grub_2.00.bb=
<http://grub_2.00.bb>,
> do_patch) failed with exit code '1'
>
>
> I am using my contrib akuster/dizzy-next.
>
> I will hand fixup the changes. please give me a few days.
>
> - armin
>
>
> On 01/06/2016 01:43 AM, Belal, Awais wrote:
>> Ping!
>>
>> BR,
>> Awais
>>
>> ________________________________________
>> From: openembedded-core-bounces@lists.openembedded.org<mailto:openembedd=
ed-core-bounces@lists.openembedded.org> [openembedded-core-bounces@lists.op=
enembedded.org<mailto:openembedded-core-bounces@lists.openembedded.org>] on=
 behalf of Belal, Awais
>> Sent: Monday, January 04, 2016 12:53 PM
>> To: akuster808
>> Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@li=
sts.openembedded.org>
>> Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
>>
>> Hi Armin,
>>
>> Odd, applies cleanly on dizzy for me. Can you please share the patch log=
?
>>
>> On a scratch build dir, I get the following:
>> --------------------------------------------------------------
>> awais@alpha:~/yocto/build-dizzy$ bitbake -c patch grub
>> Parsing recipes: 100% |#################################################=
############| Time: 00:00:36
>> Parsing of 1458 .bb files complete (0 cached, 1458 parsed). 1914 targets=
, 66 skipped, 0 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION        =3D "1.24.0"
>> BUILD_SYS         =3D "x86_64-linux"
>> NATIVELSBSTRING   =3D "Ubuntu-14.04"
>> TARGET_SYS        =3D "x86_64-poky-linux"
>> MACHINE           =3D "amdfalconx86"
>> DISTRO            =3D "poky"
>> DISTRO_VERSION    =3D "1.7.3"
>> TUNE_FEATURES     =3D "dbfp4"
>> TARGET_FPU        =3D ""
>> meta
>> meta-yocto
>> meta-yocto-bsp    =3D "(detachedfromorigin/dizzy):6d34267e0a13e10ab91b60=
590b27a2b5ba3b7da6"
>> common
>> meta-amdfalconx86 =3D "(detachedfromorigin/dizzy):84ae10ad68c7b253ab8755=
8c5a6df057c9a84f08"
>> meta-oe
>> meta-python       =3D "(detachedfromorigin/dizzy):7f1df52e9409edcc4d4cd5=
f34694f8740f56e1bf"
>>
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> NOTE: Tasks Summary: Attempted 10 tasks of which 0 didn't need to be rer=
un and all succeeded.
>> awais@alpha:~/yocto/build-dizzy$
>> --------------------------------------------------------------
>>
>> BR,
>> Awais
>>
>> ________________________________________
>> From: akuster808 [akuster808@gmail.com<mailto:akuster808@gmail.com>]
>> Sent: Monday, January 04, 2016 7:13 AM
>> To: Belal, Awais
>> Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@li=
sts.openembedded.org>
>> Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
>>
>> On 12/31/15 5:38 AM, Belal, Awais wrote:
>> Awais,
>>
>>> Ping!
>> This patch does not apply to the current dizzy branch.
>>
>> is there a dependency patch I missed to apply?
>>
>> regards,
>> Armin
>>>
>>> BR,
>>> Awais
>>>
>>> ________________________________________
>>> From: openembedded-core-bounces@lists.openembedded.org<mailto:openembed=
ded-core-bounces@lists.openembedded.org> [openembedded-core-bounces@lists.o=
penembedded.org<mailto:openembedded-core-bounces@lists.openembedded.org>] o=
n behalf of Belal, Awais
>>> Sent: Wednesday, December 23, 2015 4:20 PM
>>> To: openembedded-core@lists.openembedded.org<mailto:openembedded-core@l=
ists.openembedded.org>
>>> Subject: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
>>>
>>> http://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D451d80e52d851432=
e109771bb8febafca7a5f1f2
>>>
>>> Signed-off-by: Awais Belal <awais_belal@mentor.com<mailto:awais_belal@m=
entor.com>>
>>> ---
>>>  ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 52 ++++++++++++++=
++++++++
>>>  meta/recipes-bsp/grub/grub-efi_2.00.bb<http://grub-efi_2.00.bb>       =
      |  1 +
>>>  meta/recipes-bsp/grub/grub_2.00.bb<http://grub_2.00.bb>               =
  |  1 +
>>>  3 files changed, 54 insertions(+)
>>>  create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-=
Grub2-user-pass-vulnerability.patch
>>>
>>> diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-u=
ser-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-201=
5-8370-Grub2-user-pass-vulnerability.patch
>>> new file mode 100644
>>> index 0000000..f9252e9
>>> --- /dev/null
>>> +++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pas=
s-vulnerability.patch
>>> @@ -0,0 +1,52 @@
>>> +Upstream-Status: Accepted
>>> +Signed-off-by: Awais Belal <awais_belal@mentor.com<mailto:awais_belal@=
mentor.com>>
>>> +
>>> +From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001
>>> +From: Hector Marco-Gisbert <hecmargi@upv.es<mailto:hecmargi@upv.es>>
>>> +Date: Wed, 16 Dec 2015 04:57:18 +0000
>>> +Subject: Fix security issue when reading username and password
>>> +
>>> +This patch fixes two integer underflows at:
>>> +  * grub-core/lib/crypto.c
>>> +  * grub-core/normal/auth.c
>>> +
>>> +CVE-2015-8370
>>> +
>>> +Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es<mailto:hecmargi@u=
pv.es>>
>>> +Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es<mailto:iripo=
ll@disca.upv.es>>
>>> +Also-By: Andrey Borzenkov <arvidjaar@gmail.com<mailto:arvidjaar@gmail.=
com>>
>>> +---
>>> +diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
>>> +index 010e550..683a8aa 100644
>>> +--- a/grub-core/lib/crypto.c
>>> ++++ b/grub-core/lib/crypto.c
>>> +@@ -470,7 +470,8 @@ grub_password_get (char buf[], unsigned buf_size)
>>> +
>>> +       if (key =3D=3D '\b')
>>> +       {
>>> +-        cur_len--;
>>> ++        if (cur_len)
>>> ++          cur_len--;
>>> +         continue;
>>> +       }
>>> +
>>> +diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c
>>> +index c6bd96e..8615c48 100644
>>> +--- a/grub-core/normal/auth.c
>>> ++++ b/grub-core/normal/auth.c
>>> +@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned buf_size)
>>> +
>>> +       if (key =3D=3D '\b')
>>> +       {
>>> +-        cur_len--;
>>> +-        grub_printf ("\b");
>>> ++        if (cur_len)
>>> ++          {
>>> ++            cur_len--;
>>> ++            grub_printf ("\b");
>>> ++          }
>>> +         continue;
>>> +       }
>>> +
>>> +--
>>> +cgit v0.9.0.2
>>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb<http://grub-efi_2.0=
0.bb> b/meta/recipes-bsp/grub/grub-efi_2.00.bb<http://grub-efi_2.00.bb>
>>> index 7674255..6822e7a 100644
>>> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb<http://grub-efi_2.00.bb>
>>> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb<http://grub-efi_2.00.bb>
>>> @@ -30,6 +30,7 @@ SRC_URI =3D "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.ta=
r.gz \
>>>             file://grub-2.00-add-oe-kernel.patch \
>>>             file://grub-efi-fix-with-glibc-2.20.patch \
>>>             file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.=
patch \
>>> +           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability=
.patch \
>>>            "
>>>  SRC_URI[md5sum] =3D "e927540b6eda8b024fb0391eeaa4091c"
>>>  SRC_URI[sha256sum] =3D "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6=
caf1cd0fd3b3cc11e3"
>>> diff --git a/meta/recipes-bsp/grub/grub_2.00.bb<http://grub_2.00.bb> b/=
meta/recipes-bsp/grub/grub_2.00.bb<http://grub_2.00.bb>
>>> index d4df676..94b6da9 100644
>>> --- a/meta/recipes-bsp/grub/grub_2.00.bb<http://grub_2.00.bb>
>>> +++ b/meta/recipes-bsp/grub/grub_2.00.bb<http://grub_2.00.bb>
>>> @@ -25,6 +25,7 @@ SRC_URI =3D "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.ta=
r.gz \
>>>            file://fix-endianness-problem.patch \
>>>            file://grub2-remove-sparc64-setup-from-x86-builds.patch \
>>>            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.p=
atch \
>>> +          file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.=
patch \
>>>            "
>>>
>>>  SRC_URI[md5sum] =3D "e927540b6eda8b024fb0391eeaa4091c"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists=
.openembedded.org>
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.=
openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>
http://lists.openembedded.org/mailman/listinfo/openembedded-core


--_000_2021B186DC632746BD5A3CE32F12BD28011FB7C7FAEUMBX02mgcmen_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Thanks a lot Joshua and sorry for the hassle.<br>
<div><br>
<div style=3D"font-family:Tahoma; font-size:13px"><font face=3D"Tahoma"></f=
ont>
<div style=3D"font-size:13px">
<div><font face=3D"Tahoma" size=3D"2"><span lang=3D"en-US">
<div style=3D"margin:0">BR,</div>
<div style=3D"margin:0"><i>Awais</i></div>
</span></font></div>
</div>
<font face=3D"Tahoma"></font></div>
</div>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF256602"><font face=3D"Tahoma" si=
ze=3D"2" color=3D"#000000"><b>From:</b> Joshua Lock [joshuagloe@gmail.com]<=
br>
<b>Sent:</b> Monday, January 11, 2016 4:14 PM<br>
<b>To:</b> Belal, Awais<br>
<b>Cc:</b> akuster808; openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr"><br>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 8 January 2016 at 10:45, Belal, Awais <span d=
ir=3D"ltr">
&lt;<a href=3D"mailto:Awais_Belal@mentor.com" target=3D"_blank">Awais_Belal=
@mentor.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
Hi Armin,<br>
<br>
Thanks a lot.<br>
<br>
Can you please share the diff? I am just asking because Joshua is seeing th=
e same sort of issue with the fido branch while my local setup does not com=
plain there either.<span class=3D""><br>
</span></blockquote>
<div><br>
</div>
<div>I've cherry-picked the change from Armin's branch onto my joshuagl/fid=
o-next branch.<br>
<br>
</div>
<div>Thanks,<br>
<br>
</div>
<div>Joshua <br>
</div>
<div><br>
&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<span class=3D"">BR,<br>
Awais<br>
<br>
________________________________________<br>
From: akuster808 [<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank"=
>akuster808@gmail.com</a>]<br>
</span>Sent: Friday, January 08, 2016 7:32 AM<br>
<div class=3D"HOEnZb">
<div class=3D"h5">To: Belal, Awais<br>
Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a><br>
Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370<br>
<br>
Awais,<br>
<br>
<br>
<br>
hand applied. merged and pushed to<br>
<br>
<a href=3D"http://git.yoctoproject.org/poky-contrib.git" rel=3D"noreferrer"=
 target=3D"_blank">git.yoctoproject.org/poky-contrib.git</a> akuster/dizzy-=
next<br>
<br>
thanks,<br>
Armin<br>
<br>
On 01/07/2016 01:56 AM, Belal, Awais wrote:<br>
&gt; Hi Armin,<br>
&gt;<br>
&gt; With dizzy-next from your fork<br>
&gt;<br>
&gt; awais@alpha:~/yocto/build-dizzy-akuster$ bitbake -c patch grub<br>
&gt; Parsing recipes: 100% |###############################################=
###############| Time: 00:00:46<br>
&gt; Parsing of 1458 .bb files complete (0 cached, 1458 parsed). 1914 targe=
ts, 66 skipped, 0 masked, 0 errors.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;1.24.0&quot;<br>
&gt; BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;x86_64-linux&quot=
;<br>
&gt; NATIVELSBSTRING&nbsp; &nbsp;=3D &quot;Ubuntu-14.04&quot;<br>
&gt; TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;x86_64-poky-linux&quot=
;<br>
&gt; MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;amdfalconx86=
&quot;<br>
&gt; DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;poky&quot;<b=
r>
&gt; DISTRO_VERSION&nbsp; &nbsp; =3D &quot;1.7.3&quot;<br>
&gt; TUNE_FEATURES&nbsp; &nbsp; &nbsp;=3D &quot;dbfp4&quot;<br>
&gt; TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;&quot;<br>
&gt; meta<br>
&gt; meta-yocto<br>
&gt; meta-yocto-bsp&nbsp; &nbsp; =3D &quot;akuster/dizzy-next:4807ff0ca0abf=
085e6b81257534a4a62fde88d16&quot;<br>
&gt; common<br>
&gt; meta-amdfalconx86 =3D &quot;(detachedfromorigin/dizzy):84ae10ad68c7b25=
3ab87558c5a6df057c9a84f08&quot;<br>
&gt; meta-oe<br>
&gt; meta-python&nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;(detachedfromorigin/di=
zzy):7f1df52e9409edcc4d4cd5f34694f8740f56e1bf&quot;<br>
&gt;<br>
&gt; NOTE: Preparing runqueue<br>
&gt; NOTE: Executing SetScene Tasks<br>
&gt; NOTE: Executing RunQueue Tasks<br>
&gt; NOTE: Tasks Summary: Attempted 10 tasks of which 0 didn't need to be r=
erun and all succeeded.<br>
&gt; awais@alpha:~/yocto/build-dizzy-akuster$ ls tmp/work/dbfp4-poky-linux/=
grub/2.00-r1/<br>
&gt; 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch<br>
&gt; 0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch<br>
&gt; check-if-liblzma-is-disabled.patch<br>
&gt; fix-endianness-problem.patch<br>
&gt; fix-issue-with-flex-2.5.37.patch<br>
&gt; grub-2.00<br>
&gt; grub-2.00-add-oe-kernel.patch<br>
&gt; grub-2.00-fpmath-sse-387-fix.patch<br>
&gt; grub2-remove-sparc64-setup-from-x86-builds.patch<br>
&gt; grub-install.in.patch<br>
&gt; remove-gets.patch<br>
&gt; temp<br>
&gt; awais@alpha:~/yocto/build-dizzy-akuster$<br>
&gt;<br>
&gt; Pretty odd what's happening :)<br>
&gt;<br>
&gt; BR,<br>
&gt; Awais<br>
&gt;<br>
&gt; ________________________________________<br>
&gt; From: akuster808 [<a href=3D"mailto:akuster808@gmail.com" target=3D"_b=
lank">akuster808@gmail.com</a>]<br>
&gt; Sent: Wednesday, January 06, 2016 10:15 PM<br>
&gt; To: Belal, Awais<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370<br>
&gt;<br>
&gt; Awais,<br>
&gt;<br>
&gt; this is what I am seeing.<br>
&gt;<br>
&gt; NOTE: Executing RunQueue Tasks<br>
&gt; ERROR: Command Error: exit status: 1&nbsp; Output:<br>
&gt; Applying patch 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.pa=
tch<br>
&gt; patching file grub-core/lib/crypto.c<br>
&gt; Hunk #1 FAILED at 470.<br>
&gt; 1 out of 1 hunk FAILED -- rejects in file grub-core/lib/crypto.c<br>
&gt; patching file grub-core/normal/auth.c<br>
&gt; Hunk #1 FAILED at 174.<br>
&gt; 1 out of 1 hunk FAILED -- rejects in file grub-core/normal/auth.c<br>
&gt; Patch 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch does<=
br>
&gt; not apply (enforce with -f)<br>
&gt; ERROR: Function failed: patch_do_patch<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/akuster/oss/maint/mylayers/poky/build/tmp/work/i586-poky-linux/g=
rub/2.00-r1/temp/log.do_patch.3029<br>
&gt; ERROR: Task 1<br>
&gt; (/home/akuster/oss/maint/mylayers/poky/meta/recipes-bsp/grub/<a href=
=3D"http://grub_2.00.bb" rel=3D"noreferrer" target=3D"_blank">grub_2.00.bb<=
/a>,<br>
&gt; do_patch) failed with exit code '1'<br>
&gt;<br>
&gt;<br>
&gt; I am using my contrib akuster/dizzy-next.<br>
&gt;<br>
&gt; I will hand fixup the changes. please give me a few days.<br>
&gt;<br>
&gt; - armin<br>
&gt;<br>
&gt;<br>
&gt; On 01/06/2016 01:43 AM, Belal, Awais wrote:<br>
&gt;&gt; Ping!<br>
&gt;&gt;<br>
&gt;&gt; BR,<br>
&gt;&gt; Awais<br>
&gt;&gt;<br>
&gt;&gt; ________________________________________<br>
&gt;&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedd=
ed.org" target=3D"_blank">
openembedded-core-bounces@lists.openembedded.org</a> [<a href=3D"mailto:ope=
nembedded-core-bounces@lists.openembedded.org" target=3D"_blank">openembedd=
ed-core-bounces@lists.openembedded.org</a>] on behalf of Belal, Awais<br>
&gt;&gt; Sent: Monday, January 04, 2016 12:53 PM<br>
&gt;&gt; To: akuster808<br>
&gt;&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">
openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370<br>
&gt;&gt;<br>
&gt;&gt; Hi Armin,<br>
&gt;&gt;<br>
&gt;&gt; Odd, applies cleanly on dizzy for me. Can you please share the pat=
ch log?<br>
&gt;&gt;<br>
&gt;&gt; On a scratch build dir, I get the following:<br>
&gt;&gt; --------------------------------------------------------------<br>
&gt;&gt; awais@alpha:~/yocto/build-dizzy$ bitbake -c patch grub<br>
&gt;&gt; Parsing recipes: 100% |###########################################=
##################| Time: 00:00:36<br>
&gt;&gt; Parsing of 1458 .bb files complete (0 cached, 1458 parsed). 1914 t=
argets, 66 skipped, 0 masked, 0 errors.<br>
&gt;&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;&gt;<br>
&gt;&gt; Build Configuration:<br>
&gt;&gt; BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;1.24.0&quot;<br>
&gt;&gt; BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;x86_64-linux&=
quot;<br>
&gt;&gt; NATIVELSBSTRING&nbsp; &nbsp;=3D &quot;Ubuntu-14.04&quot;<br>
&gt;&gt; TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;x86_64-poky-linux&=
quot;<br>
&gt;&gt; MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;amdfalco=
nx86&quot;<br>
&gt;&gt; DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;poky&quo=
t;<br>
&gt;&gt; DISTRO_VERSION&nbsp; &nbsp; =3D &quot;1.7.3&quot;<br>
&gt;&gt; TUNE_FEATURES&nbsp; &nbsp; &nbsp;=3D &quot;dbfp4&quot;<br>
&gt;&gt; TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;&quot;<br>
&gt;&gt; meta<br>
&gt;&gt; meta-yocto<br>
&gt;&gt; meta-yocto-bsp&nbsp; &nbsp; =3D &quot;(detachedfromorigin/dizzy):6=
d34267e0a13e10ab91b60590b27a2b5ba3b7da6&quot;<br>
&gt;&gt; common<br>
&gt;&gt; meta-amdfalconx86 =3D &quot;(detachedfromorigin/dizzy):84ae10ad68c=
7b253ab87558c5a6df057c9a84f08&quot;<br>
&gt;&gt; meta-oe<br>
&gt;&gt; meta-python&nbsp; &nbsp; &nbsp; &nbsp;=3D &quot;(detachedfromorigi=
n/dizzy):7f1df52e9409edcc4d4cd5f34694f8740f56e1bf&quot;<br>
&gt;&gt;<br>
&gt;&gt; NOTE: Preparing runqueue<br>
&gt;&gt; NOTE: Executing SetScene Tasks<br>
&gt;&gt; NOTE: Executing RunQueue Tasks<br>
&gt;&gt; NOTE: Tasks Summary: Attempted 10 tasks of which 0 didn't need to =
be rerun and all succeeded.<br>
&gt;&gt; awais@alpha:~/yocto/build-dizzy$<br>
&gt;&gt; --------------------------------------------------------------<br>
&gt;&gt;<br>
&gt;&gt; BR,<br>
&gt;&gt; Awais<br>
&gt;&gt;<br>
&gt;&gt; ________________________________________<br>
&gt;&gt; From: akuster808 [<a href=3D"mailto:akuster808@gmail.com" target=
=3D"_blank">akuster808@gmail.com</a>]<br>
&gt;&gt; Sent: Monday, January 04, 2016 7:13 AM<br>
&gt;&gt; To: Belal, Awais<br>
&gt;&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">
openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370<br>
&gt;&gt;<br>
&gt;&gt; On 12/31/15 5:38 AM, Belal, Awais wrote:<br>
&gt;&gt; Awais,<br>
&gt;&gt;<br>
&gt;&gt;&gt; Ping!<br>
&gt;&gt; This patch does not apply to the current dizzy branch.<br>
&gt;&gt;<br>
&gt;&gt; is there a dependency patch I missed to apply?<br>
&gt;&gt;<br>
&gt;&gt; regards,<br>
&gt;&gt; Armin<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; BR,<br>
&gt;&gt;&gt; Awais<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ________________________________________<br>
&gt;&gt;&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openem=
bedded.org" target=3D"_blank">
openembedded-core-bounces@lists.openembedded.org</a> [<a href=3D"mailto:ope=
nembedded-core-bounces@lists.openembedded.org" target=3D"_blank">openembedd=
ed-core-bounces@lists.openembedded.org</a>] on behalf of Belal, Awais<br>
&gt;&gt;&gt; Sent: Wednesday, December 23, 2015 4:20 PM<br>
&gt;&gt;&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org=
" target=3D"_blank">
openembedded-core@lists.openembedded.org</a><br>
&gt;&gt;&gt; Subject: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"http://git.savannah.gnu.org/cgit/grub.git/commit/?i=
d=3D451d80e52d851432e109771bb8febafca7a5f1f2" rel=3D"noreferrer" target=3D"=
_blank">
http://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D451d80e52d851432e109=
771bb8febafca7a5f1f2</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@m=
entor.com" target=3D"_blank">awais_belal@mentor.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&nbsp; ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 52 =
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&gt;&gt;&nbsp; meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.00.bb=
" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.00.bb</a>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 &#43;<br>
&gt;&gt;&gt;&nbsp; meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" re=
l=3D"noreferrer" target=3D"_blank">grub_2.00.bb</a>&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 &#43;<br>
&gt;&gt;&gt;&nbsp; 3 files changed, 54 insertions(&#43;)<br>
&gt;&gt;&gt;&nbsp; create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-=
CVE-2015-8370-Grub2-user-pass-vulnerability.patch<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-837=
0-Grub2-user-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fi=
x-CVE-2015-8370-Grub2-user-pass-vulnerability.patch<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000..f9252e9<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/meta/recipes-bsp/grub/files/0001-Fix-CVE-201=
5-8370-Grub2-user-pass-vulnerability.patch<br>
&gt;&gt;&gt; @@ -0,0 &#43;1,52 @@<br>
&gt;&gt;&gt; &#43;Upstream-Status: Accepted<br>
&gt;&gt;&gt; &#43;Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_be=
lal@mentor.com" target=3D"_blank">awais_belal@mentor.com</a>&gt;<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 =
00:00:00 2001<br>
&gt;&gt;&gt; &#43;From: Hector Marco-Gisbert &lt;<a href=3D"mailto:hecmargi=
@upv.es" target=3D"_blank">hecmargi@upv.es</a>&gt;<br>
&gt;&gt;&gt; &#43;Date: Wed, 16 Dec 2015 04:57:18 &#43;0000<br>
&gt;&gt;&gt; &#43;Subject: Fix security issue when reading username and pas=
sword<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;This patch fixes two integer underflows at:<br>
&gt;&gt;&gt; &#43;&nbsp; * grub-core/lib/crypto.c<br>
&gt;&gt;&gt; &#43;&nbsp; * grub-core/normal/auth.c<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;CVE-2015-8370<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;Signed-off-by: Hector Marco-Gisbert &lt;<a href=3D"mailto=
:hecmargi@upv.es" target=3D"_blank">hecmargi@upv.es</a>&gt;<br>
&gt;&gt;&gt; &#43;Signed-off-by: Ismael Ripoll-Ripoll &lt;<a href=3D"mailto=
:iripoll@disca.upv.es" target=3D"_blank">iripoll@disca.upv.es</a>&gt;<br>
&gt;&gt;&gt; &#43;Also-By: Andrey Borzenkov &lt;<a href=3D"mailto:arvidjaar=
@gmail.com" target=3D"_blank">arvidjaar@gmail.com</a>&gt;<br>
&gt;&gt;&gt; &#43;---<br>
&gt;&gt;&gt; &#43;diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypt=
o.c<br>
&gt;&gt;&gt; &#43;index 010e550..683a8aa 100644<br>
&gt;&gt;&gt; &#43;--- a/grub-core/lib/crypto.c<br>
&gt;&gt;&gt; &#43;&#43;&#43;&#43; b/grub-core/lib/crypto.c<br>
&gt;&gt;&gt; &#43;@@ -470,7 &#43;470,8 @@ grub_password_get (char buf[], un=
signed buf_size)<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp;if (key =3D=3D '\b')<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp;{<br>
&gt;&gt;&gt; &#43;-&nbsp; &nbsp; &nbsp; &nbsp; cur_len--;<br>
&gt;&gt;&gt; &#43;&#43;&nbsp; &nbsp; &nbsp; &nbsp; if (cur_len)<br>
&gt;&gt;&gt; &#43;&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cur_len--;<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;diff --git a/grub-core/normal/auth.c b/grub-core/normal/a=
uth.c<br>
&gt;&gt;&gt; &#43;index c6bd96e..8615c48 100644<br>
&gt;&gt;&gt; &#43;--- a/grub-core/normal/auth.c<br>
&gt;&gt;&gt; &#43;&#43;&#43;&#43; b/grub-core/normal/auth.c<br>
&gt;&gt;&gt; &#43;@@ -174,8 &#43;174,11 @@ grub_username_get (char buf[], u=
nsigned buf_size)<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp;if (key =3D=3D '\b')<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp;{<br>
&gt;&gt;&gt; &#43;-&nbsp; &nbsp; &nbsp; &nbsp; cur_len--;<br>
&gt;&gt;&gt; &#43;-&nbsp; &nbsp; &nbsp; &nbsp; grub_printf (&quot;\b&quot;)=
;<br>
&gt;&gt;&gt; &#43;&#43;&nbsp; &nbsp; &nbsp; &nbsp; if (cur_len)<br>
&gt;&gt;&gt; &#43;&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br>
&gt;&gt;&gt; &#43;&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cur_len--;=
<br>
&gt;&gt;&gt; &#43;&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; grub_print=
f (&quot;\b&quot;);<br>
&gt;&gt;&gt; &#43;&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;--<br>
&gt;&gt;&gt; &#43;cgit v0.9.0.2<br>
&gt;&gt;&gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_=
2.00.bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.00.bb</a> b/meta/r=
ecipes-bsp/grub/<a href=3D"http://grub-efi_2.00.bb" rel=3D"noreferrer" targ=
et=3D"_blank">grub-efi_2.00.bb</a><br>
&gt;&gt;&gt; index 7674255..6822e7a 100644<br>
&gt;&gt;&gt; --- a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.00.bb=
" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.00.bb</a><br>
&gt;&gt;&gt; &#43;&#43;&#43; b/meta/recipes-bsp/grub/<a href=3D"http://grub=
-efi_2.00.bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.00.bb</a><br>
&gt;&gt;&gt; @@ -30,6 &#43;30,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.g=
nu.org/gnu/grub/grub-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">ftp=
://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz</a> \<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://grub-2.0=
0-add-oe-kernel.patch \<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://grub-efi=
-fix-with-glibc-2.20.patch \<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0001-par=
se_dhcp_vendor-Add-missing-const-qualifiers.patch \<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0001-Fix-=
CVE-2015-8370-Grub2-user-pass-vulnerability.patch \<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
&gt;&gt;&gt;&nbsp; SRC_URI[md5sum] =3D &quot;e927540b6eda8b024fb0391eeaa409=
1c&quot;<br>
&gt;&gt;&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;65b39a0558f8c802209c574f4d0=
2ca263a804e8a564bc6caf1cd0fd3b3cc11e3&quot;<br>
&gt;&gt;&gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub_2.00=
.bb" rel=3D"noreferrer" target=3D"_blank">grub_2.00.bb</a> b/meta/recipes-b=
sp/grub/<a href=3D"http://grub_2.00.bb" rel=3D"noreferrer" target=3D"_blank=
">grub_2.00.bb</a><br>
&gt;&gt;&gt; index d4df676..94b6da9 100644<br>
&gt;&gt;&gt; --- a/meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" re=
l=3D"noreferrer" target=3D"_blank">grub_2.00.bb</a><br>
&gt;&gt;&gt; &#43;&#43;&#43; b/meta/recipes-bsp/grub/<a href=3D"http://grub=
_2.00.bb" rel=3D"noreferrer" target=3D"_blank">grub_2.00.bb</a><br>
&gt;&gt;&gt; @@ -25,6 &#43;25,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.g=
nu.org/gnu/grub/grub-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">ftp=
://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz</a> \<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://fix-endianness=
-problem.patch \<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://grub2-remove-s=
parc64-setup-from-x86-builds.patch \<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-parse_dhc=
p_vendor-Add-missing-const-qualifiers.patch \<br>
&gt;&gt;&gt; &#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-Fix-CVE-20=
15-8370-Grub2-user-pass-vulnerability.patch \<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&nbsp; SRC_URI[md5sum] =3D &quot;e927540b6eda8b024fb0391eeaa409=
1c&quot;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 1.9.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core" rel=3D"noreferrer" target=3D"_blank">
http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">
http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt;<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div>
</div>
</blockquote>
</div>
<br>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_2021B186DC632746BD5A3CE32F12BD28011FB7C7FAEUMBX02mgcmen_--
