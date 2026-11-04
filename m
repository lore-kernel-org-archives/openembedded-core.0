Received: from outbound2.mail.transip.nl (outbound2.mail.transip.nl [149.210.149.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13243.1793809559783272439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 08:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=BxiXPx7J;
 spf=pass (domain: myspectrum.nl, ip: 149.210.149.73, mailfrom: oe@myspectrum.nl)
Received: from submission15.mail.transip.nl (unknown [10.103.8.166])
	by outbound2.mail.transip.nl (Postfix) with ESMTP id 4jKW5c6KdjzYd2f
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 17:25:56 +0100 (CET)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission15.mail.transip.nl (Postfix) with ESMTPSA id 4jKW5c0jsnz3R3nyh;
	Wed,  4 Nov 2026 17:25:56 +0100 (CET)
Received: from [192.168.178.17] (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 5DA6820141;
	Wed,  4 Nov 2026 16:25:55 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Message-ID: <f8ad9d83-635f-4048-b4e0-c26b352fdbc4@myspectrum.nl>
Date: Wed, 4 Nov 2026 17:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 13/55] popt: patch CVE-2026-18739
From: Jeroen Hofstee <oe@myspectrum.nl>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 Yoann Congal <yoann.congal@smile.fr>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1793405493.git.yoann.congal@smile.fr>
 <c048b4a6a3c798afa662049c2a31db077e0a4444.1793405493.git.yoann.congal@smile.fr>
 <29941044-0317-4fa9-9b36-e891ab5b1d83@myspectrum.nl>
 <DML2X05WT3OY.RAVTPE8JH68S@smile.fr>
 <AS8PR10MB507359D6BF2DFD0C3BB664F6FD692@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <18E4E37A751FEE22.323135@lists.openembedded.org>
Content-Language: en-US
In-Reply-To: <18E4E37A751FEE22.323135@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Scanned-By: ClueGetter at submission15.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1793809556; h=from:subject:to:
 references:in-reply-to:date:mime-version:content-type;
 bh=MIJ1LbnT8trJy4a7YGPtpclSi7JMyB+kF+JN87iCjPE=;
 b=BxiXPx7JDKbUoFlH9KlJOkF+KoXlXTkfFr+RlZS9cMO8/KBxE3Nh2VYuqx9bMKrXygyzc/
 LJ6+rHFEFBMTQWF8LdrTRDpeJEi9gZnGkKVgt0YtEvtROfA9t+2Z9ZOc6+M9HQGRP5x/0N
 uZEZ2n3hgc78ri5dn4NQwfE6HFCX0XKrxFNRqbwNZvJBfubGAzQXObjhBU8/MOdYQpKSH1
 0HQ2PtLOPSb0yfu6bK1q0g76gMlCE3yfDekht3iWkjN+SZQVLLcLKTUN/JAegw9F+fDkfn
 EviV0TGF8DcCrdE/7aW+Y46quV6c4aDYxAPAKHLlteLviwGKlb9cX2zs1zduWQ==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 16:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249405

Hi again,

Ok, I really need to look at this a bit closer ;)
That is CVE-2026-18839 not CVE-2026-18739.

Regards, Jeroen

On 11/4/26 17:10, Jeroen Hofstee wrote:
> Hello Peter,
>
> Sorry for the delayed reply. I am doing a bit too many different things
> at the same time at the moment. See [1], Fixes: CVE-2026-18839=20
> <https://github.com/advisories/GHSA-8fjx-p4xg-vgp8>
> I have patches for this, but I would like to check that manually.
> Claude says the test fails e.g. I would like to see that for myself.
>
> Anyway, it makes more sense to get this first fixed in master and then
> backport it I guess.
>
> Regards,
> Jeroen
>
> [1]=20
> https://github.com/rpm-software-management/popt/commit/af6f19e5968d4860=
8a062d6d92d28b7fd248f8ea
>
> On 11/3/26 08:24, Marko, Peter wrote:
>> Hello,
>>
>> I have checked again by myself and let also LLM check it, but I could=20
>> not identify anything missing.
>> This commit is the only change in last 26 years in function mentioned=20
>> in CVE description.
>> Also looking at=20
>> https://github.com/rpm-software-management/popt/pull/141 from=20
>> repository maintainer, there is nothing more for this CVE picked.
>> Having a test included and passed boosts my confidence in this patch.
>> So, until there are more details showing what is missing, I consider=20
>> this to be a correct fix.
>>
>> Peter
>>
>>> -----Original Message-----
>>> From: Yoann Congal <yoann.congal@smile.fr>
>>> Sent: Monday, November 2, 2026 11:30 PM
>>> To: Jeroen Hofstee <oe@myspectrum.nl>; openembedded-
>>> core@lists.openembedded.org
>>> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>>> Subject: Re: [OE-core][scarthgap 13/55] popt: patch CVE-2026-18739
>>>
>>> On Sat Oct 31, 2026 at 2:24 PM CET, Jeroen Hofstee wrote:
>>>> Hi Yoann,
>>> Hello,
>>>
>>>> This is a low prio CVE, but that CVE: CVE-2026-18743 is incorrect=20
>>>> in Fix
>>>> CVE-2026-18739 and the fix is incomplete.
>>>>
>>>> But that is already the case in master. I will send a patch for it=20
>>>> as soon
>>>> as things finish building here. It can't hurt if you include it=20
>>>> anyway.
>>> Thanks for your attention. I missed that (commented below for
>>> awareness).
>>>
>>> When you say "fix is incomplete.", do you mean the "CVE:" tag is wron=
g
>>> or something is also missing in the patch?
>>>
>>> Regards,
>>>
>>>> With kind regards,
>>>>
>>>> Jeroen
>>>>
>>>> On 10/31/26 01:14, Yoann Congal via openembedded-core wrote:
>>>>> From: Peter Marko<peter.marko@siemens.com>
>>>>>
>>>>> Pick patch referencing this CVE.
>>>>> Convert change in cmake file to autotools/makefile.
>>>>> Install the new test in recipe.
>>>>>
>>>>> Signed-off-by: Peter Marko<peter.marko@siemens.com>
>>>>> Signed-off-by: Mathieu=20
>>>>> Dubois-Briand<mathieu.dubois-briand@bootlin.com>
>>>>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>>>> (cherry picked from commit c211972ad21e1801abc7dd15951093316c5528f4=
)
>>>>> Signed-off-by: Yoann Congal<yoann.congal@smile.fr>
>>>>> [YC: backport translated cmake to automake
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (the project migrated in betwe=
en) ]
>>>>> ---
>>>>> =C2=A0=C2=A0 .../popt/popt/CVE-2026-18739.patch=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 92=20
>>>>> +++++++++++++++++++
>>>>> =C2=A0=C2=A0 meta/recipes-support/popt/popt_1.19.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>>>>> =C2=A0=C2=A0 2 files changed, 94 insertions(+)
>>>>> =C2=A0=C2=A0 create mode 100644=20
>>>>> meta/recipes-support/popt/popt/CVE-2026-18739.patch
>>>>>
>>>>> diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>>> b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>>>>> new file mode 100644
>>>>> index 00000000000..0a1e8f35907
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>>>>> @@ -0,0 +1,92 @@
>>>>> +From 14c42b415ba0c11640f7d4ee80920452d0287058 Mon Sep 17
>>> 00:00:00 2001
>>>>> +From: Yao Zhang<294772273@qq.com>
>>>>> +Date: Wed, 5 Aug 2026 14:52:10 +0800
>>>>> +Subject: [PATCH] Fix CVE-2026-18739: off-by-one error in=20
>>>>> poptStuffArgs()
>>>>> +
>>>>> +The poptStuffArgs function only checks whether (con->os -=20
>>>>> con->optionStack)
>>>>> +is equal to POPT_OPTION_DEPTH (10) before incrementing con->os, an=
d
>>> does
>>>>> +not increment the value by 1 to perform boundary pre-checking, as
>>>>> +handleAlias does.
>>>>> +
>>>>> +Add a new test program as a reproducer for this case.
>>>>> +
>>>>> +Co-authored-by: Panu Matilainen<pmatilai@redhat.com>
>>>>> +
>>>>> +Fixes: CVE-2026-18739
>>>>> +
>>>>> +CVE: CVE-2026-18743
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^ this CVE tag=
 does not match patch filename nor the upstream
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Fixes" tag.
>>>
>>>>> +Upstream-Status: Backport [https://github.com/rpm-software-
>>> management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
>>>>> +Signed-off-by: Peter Marko<peter.marko@siemens.com>
>>>>> +---
>>>>> + src/popt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>>> + tests/Makefile.am |=C2=A0 5 ++++-
>>>>> + tests/testit.sh=C2=A0=C2=A0 |=C2=A0 2 ++
>>>>> + tests/tstuff.c=C2=A0=C2=A0=C2=A0 | 17 +++++++++++++++++
>>>>> + 4 files changed, 24 insertions(+), 2 deletions(-)
>>>>> + create mode 100644 tests/tstuff.c
>>>>> +
>>>>> +diff --git a/src/popt.c b/src/popt.c
>>>>> +index 9ea3dfe..458aadc 100644
>>>>> +--- a/src/popt.c
>>>>> ++++ b/src/popt.c
>>>>> +@@ -1668,7 +1668,7 @@ int poptStuffArgs(poptContext con, const=20
>>>>> char **
>>> argv)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int argc;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int rc;
>>>>> +
>>>>> +-=C2=A0=C2=A0=C2=A0 if ((con->os - con->optionStack) =3D=3D POPT_O=
PTION_DEPTH)
>>>>> ++=C2=A0=C2=A0=C2=A0 if ((con->os - con->optionStack + 1) =3D=3D PO=
PT_OPTION_DEPTH)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return POPT_ERROR_OPTSTOODEEP;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 for (argc =3D 0; argv[argc]; argc++)
>>>>> +diff --git a/tests/Makefile.am b/tests/Makefile.am
>>>>> +index c410389..99fbf64 100644
>>>>> +--- a/tests/Makefile.am
>>>>> ++++ b/tests/Makefile.am
>>>>> +@@ -11,7 +11,10 @@ EXTRA_DIST =3D testit.sh \
>>>>> +
>>>>> + AM_CPPFLAGS =3D -I. -I$(top_srcdir)/src
>>>>> +
>>>>> +-noinst_PROGRAMS =3D test1 test2 tdict test3
>>>>> ++noinst_PROGRAMS =3D test1 test2 tdict test3 tstuff
>>>>> ++tstuff_SOURCES =3D tstuff.c
>>>>> ++tstuff_LDFLAGS =3D
>>>>> ++tstuff_LDADD =3D $(top_builddir)/src/libpopt.la
>>>>> + test1_SOURCES =3D test1.c
>>>>> + test1_LDFLAGS =3D
>>>>> + test1_LDADD =3D $(top_builddir)/src/libpopt.la
>>>>> +diff --git a/tests/testit.sh b/tests/testit.sh
>>>>> +index 4078f51..d26be3a 100755
>>>>> +--- a/tests/testit.sh
>>>>> ++++ b/tests/testit.sh
>>>>> +@@ -172,6 +172,8 @@ run test1 "test1 - 61" "" -x=3Df1
>>>>> +
>>>>> + run test1 "test1 - 62" "arg1: 0 arg2: (none) aInt: 1" --randint=3D=
-1
>>>>> +
>>>>> ++run tstuff "tstuff - 1" "-13"
>>>>> ++
>>>>> + if ! [ -e test3-data ]; then
>>>>> +=C2=A0=C2=A0 # create symlink for running during 'make distcheck'
>>>>> +=C2=A0=C2=A0 ln -s "${srcdir}/test3-data" test3-data
>>>>> +diff --git a/tests/tstuff.c b/tests/tstuff.c
>>>>> +new file mode 100644
>>>>> +index 0000000..b820c7b
>>>>> +--- /dev/null
>>>>> ++++ b/tests/tstuff.c
>>>>> +@@ -0,0 +1,17 @@
>>>>> ++#include <stdio.h>
>>>>> ++#include <popt.h>
>>>>> ++
>>>>> ++int main(int argc, char *argv[])
>>>>> ++{
>>>>> ++=C2=A0=C2=A0=C2=A0 poptContext ctx =3D poptGetContext(argv[0], ar=
gc, (const char=20
>>>>> **)argv,
>>> NULL, 0);
>>>>> ++=C2=A0=C2=A0=C2=A0 int rc =3D 0;
>>>>> ++=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < 100; ++i) {
>>>>> ++=C2=A0=C2=A0=C2=A0 const char *ea[] =3D { "a", NULL };
>>>>> ++=C2=A0=C2=A0=C2=A0 if ((rc =3D poptStuffArgs(ctx, ea)))
>>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>> ++=C2=A0=C2=A0=C2=A0 }
>>>>> ++=C2=A0=C2=A0=C2=A0 printf("%d\n", rc);
>>>>> ++
>>>>> ++=C2=A0=C2=A0=C2=A0 poptFreeContext(ctx);
>>>>> ++=C2=A0=C2=A0=C2=A0 return rc;
>>>>> ++}
>>>>> diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-
>>> support/popt/popt_1.19.bb
>>>>> index c8b4875c1b7..18cc4f2867d 100644
>>>>> --- a/meta/recipes-support/popt/popt_1.19.bb
>>>>> +++ b/meta/recipes-support/popt/popt_1.19.bb
>>>>> @@ -11,6 +11,7 @@ DEPENDS =3D "virtual/libiconv"
>>>>> =C2=A0=C2=A0 SRC_URI =3D"http://ftp.rpm.org/popt/releases/popt-1.x/=
${BP}.tar.gz \
>>>>> file://run-ptest \ file://CVE-2026-18743.patch \ +
>>>>> file://CVE-2026-18739.patch \ "
>>>>> =C2=A0=C2=A0 SRC_URI[sha256sum] =3D
>>> "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
>>>>> @@ -25,6 +26,7 @@ do_compile_ptest() {
>>>>> =C2=A0=C2=A0 do_install_ptest() {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install ${B}/tests/.libs/test*=
 ${D}/${PTEST_PATH}
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install ${B}/tests/.libs/tdict=
 ${D}/${PTEST_PATH}
>>>>> +=C2=A0=C2=A0=C2=A0 install ${B}/tests/.libs/tstuff ${D}/${PTEST_PA=
TH}
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install ${B}/tests/testit.sh $=
{D}/${PTEST_PATH}
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install ${B}/tests/test-poptrc=
 ${D}/${PTEST_PATH}
>>>>> =C2=A0=C2=A0 }
>>>
>>> --=20
>>> Yoann Congal
>>> Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249404): https://lists.openembedded.org/g/openembed=
ded-core/message/249404
> Mute This Topic: https://lists.openembedded.org/mt/122021640/9720520
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
oe@myspectrum.nl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
