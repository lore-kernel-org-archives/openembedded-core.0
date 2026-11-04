Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12854.1793808663991374434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 08:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=qIExqEBv;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.7, mailfrom: oe@myspectrum.nl)
Received: from submission13.mail.transip.nl (unknown [10.103.8.164])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4jKVmN6ShqzQvv7q
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 17:11:00 +0100 (CET)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission13.mail.transip.nl (Postfix) with ESMTPSA id 4jKVmN0vDDz3fCxJb;
	Wed,  4 Nov 2026 17:11:00 +0100 (CET)
Received: from [192.168.178.17] (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 832C4200C9;
	Wed,  4 Nov 2026 16:10:58 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Message-ID: <e28a7a8f-4d23-4246-9dd7-624c110ebfa8@myspectrum.nl>
Date: Wed, 4 Nov 2026 17:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 13/55] popt: patch CVE-2026-18739
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 Yoann Congal <yoann.congal@smile.fr>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1793405493.git.yoann.congal@smile.fr>
 <c048b4a6a3c798afa662049c2a31db077e0a4444.1793405493.git.yoann.congal@smile.fr>
 <29941044-0317-4fa9-9b36-e891ab5b1d83@myspectrum.nl>
 <DML2X05WT3OY.RAVTPE8JH68S@smile.fr>
 <AS8PR10MB507359D6BF2DFD0C3BB664F6FD692@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jeroen Hofstee <oe@myspectrum.nl>
In-Reply-To: <AS8PR10MB507359D6BF2DFD0C3BB664F6FD692@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission13.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1793808660; h=from:subject:to:
 references:in-reply-to:date:mime-version:content-type;
 bh=lEHcvFO68Irip7528lah9wtuq3vAi1z5haSIj9eBar4=;
 b=qIExqEBvY2ITdiMM1gIhMKoTOPpFK2Ge9yN8BheA8Pq1tvISLbd1yxRT6aSX/ybLd1nunB
 /EcWGiAyXdxk/HGkdgcCQgtVQIQYl3WQdDc+8Amj3cRlQh2ISU7Kr1zKWOd6JLx7TCZ3iL
 Zt0cNQm20rmlCTr3Dvjjvhjiqc+ixyDiZFNHj8Igt52bFeuAXFTU750g/I4j+lvgYbwY0c
 6Y27j69ERaaKHH3K4AkOFsYCOWD2XkwyZ6RpNr5U2TzOMg+2zbI2WuO1fUMwDk94okJTlf
 gTYMdLJbKeJbWuwNaUsEsGAEUNUjeqkjKqCXcZmFsvPFP/eqyttNG5Yh6zC+iw==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 16:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249404

Hello Peter,

Sorry for the delayed reply. I am doing a bit too many different things
at the same time at the moment. See [1], Fixes: CVE-2026-18839 
<https://github.com/advisories/GHSA-8fjx-p4xg-vgp8>
I have patches for this, but I would like to check that manually.
Claude says the test fails e.g. I would like to see that for myself.

Anyway, it makes more sense to get this first fixed in master and then
backport it I guess.

Regards,
Jeroen

[1] 
https://github.com/rpm-software-management/popt/commit/af6f19e5968d48608a062d6d92d28b7fd248f8ea

On 11/3/26 08:24, Marko, Peter wrote:
> Hello,
>
> I have checked again by myself and let also LLM check it, but I could not identify anything missing.
> This commit is the only change in last 26 years in function mentioned in CVE description.
> Also looking at https://github.com/rpm-software-management/popt/pull/141 from repository maintainer, there is nothing more for this CVE picked.
> Having a test included and passed boosts my confidence in this patch.
> So, until there are more details showing what is missing, I consider this to be a correct fix.
>
> Peter
>
>> -----Original Message-----
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: Monday, November 2, 2026 11:30 PM
>> To: Jeroen Hofstee <oe@myspectrum.nl>; openembedded-
>> core@lists.openembedded.org
>> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>> Subject: Re: [OE-core][scarthgap 13/55] popt: patch CVE-2026-18739
>>
>> On Sat Oct 31, 2026 at 2:24 PM CET, Jeroen Hofstee wrote:
>>> Hi Yoann,
>> Hello,
>>
>>> This is a low prio CVE, but that CVE: CVE-2026-18743 is incorrect in Fix
>>> CVE-2026-18739 and the fix is incomplete.
>>>
>>> But that is already the case in master. I will send a patch for it as soon
>>> as things finish building here. It can't hurt if you include it anyway.
>> Thanks for your attention. I missed that (commented below for
>> awareness).
>>
>> When you say "fix is incomplete.", do you mean the "CVE:" tag is wrong
>> or something is also missing in the patch?
>>
>> Regards,
>>
>>> With kind regards,
>>>
>>> Jeroen
>>>
>>> On 10/31/26 01:14, Yoann Congal via openembedded-core wrote:
>>>> From: Peter Marko<peter.marko@siemens.com>
>>>>
>>>> Pick patch referencing this CVE.
>>>> Convert change in cmake file to autotools/makefile.
>>>> Install the new test in recipe.
>>>>
>>>> Signed-off-by: Peter Marko<peter.marko@siemens.com>
>>>> Signed-off-by: Mathieu Dubois-Briand<mathieu.dubois-briand@bootlin.com>
>>>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>>> (cherry picked from commit c211972ad21e1801abc7dd15951093316c5528f4)
>>>> Signed-off-by: Yoann Congal<yoann.congal@smile.fr>
>>>> [YC: backport translated cmake to automake
>>>>        (the project migrated in between) ]
>>>> ---
>>>>    .../popt/popt/CVE-2026-18739.patch            | 92 +++++++++++++++++++
>>>>    meta/recipes-support/popt/popt_1.19.bb        |  2 +
>>>>    2 files changed, 94 insertions(+)
>>>>    create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch
>>>>
>>>> diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>> b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>>>> new file mode 100644
>>>> index 00000000000..0a1e8f35907
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>>>> @@ -0,0 +1,92 @@
>>>> +From 14c42b415ba0c11640f7d4ee80920452d0287058 Mon Sep 17
>> 00:00:00 2001
>>>> +From: Yao Zhang<294772273@qq.com>
>>>> +Date: Wed, 5 Aug 2026 14:52:10 +0800
>>>> +Subject: [PATCH] Fix CVE-2026-18739: off-by-one error in poptStuffArgs()
>>>> +
>>>> +The poptStuffArgs function only checks whether (con->os - con->optionStack)
>>>> +is equal to POPT_OPTION_DEPTH (10) before incrementing con->os, and
>> does
>>>> +not increment the value by 1 to perform boundary pre-checking, as
>>>> +handleAlias does.
>>>> +
>>>> +Add a new test program as a reproducer for this case.
>>>> +
>>>> +Co-authored-by: Panu Matilainen<pmatilai@redhat.com>
>>>> +
>>>> +Fixes: CVE-2026-18739
>>>> +
>>>> +CVE: CVE-2026-18743
>>           ^ this CVE tag does not match patch filename nor the upstream
>> 		 "Fixes" tag.
>>
>>>> +Upstream-Status: Backport [https://github.com/rpm-software-
>> management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
>>>> +Signed-off-by: Peter Marko<peter.marko@siemens.com>
>>>> +---
>>>> + src/popt.c        |  2 +-
>>>> + tests/Makefile.am |  5 ++++-
>>>> + tests/testit.sh   |  2 ++
>>>> + tests/tstuff.c    | 17 +++++++++++++++++
>>>> + 4 files changed, 24 insertions(+), 2 deletions(-)
>>>> + create mode 100644 tests/tstuff.c
>>>> +
>>>> +diff --git a/src/popt.c b/src/popt.c
>>>> +index 9ea3dfe..458aadc 100644
>>>> +--- a/src/popt.c
>>>> ++++ b/src/popt.c
>>>> +@@ -1668,7 +1668,7 @@ int poptStuffArgs(poptContext con, const char **
>> argv)
>>>> +     int argc;
>>>> +     int rc;
>>>> +
>>>> +-    if ((con->os - con->optionStack) == POPT_OPTION_DEPTH)
>>>> ++    if ((con->os - con->optionStack + 1) == POPT_OPTION_DEPTH)
>>>> + 	return POPT_ERROR_OPTSTOODEEP;
>>>> +
>>>> +     for (argc = 0; argv[argc]; argc++)
>>>> +diff --git a/tests/Makefile.am b/tests/Makefile.am
>>>> +index c410389..99fbf64 100644
>>>> +--- a/tests/Makefile.am
>>>> ++++ b/tests/Makefile.am
>>>> +@@ -11,7 +11,10 @@ EXTRA_DIST = testit.sh \
>>>> +
>>>> + AM_CPPFLAGS = -I. -I$(top_srcdir)/src
>>>> +
>>>> +-noinst_PROGRAMS = test1 test2 tdict test3
>>>> ++noinst_PROGRAMS = test1 test2 tdict test3 tstuff
>>>> ++tstuff_SOURCES = tstuff.c
>>>> ++tstuff_LDFLAGS =
>>>> ++tstuff_LDADD = $(top_builddir)/src/libpopt.la
>>>> + test1_SOURCES = test1.c
>>>> + test1_LDFLAGS =
>>>> + test1_LDADD = $(top_builddir)/src/libpopt.la
>>>> +diff --git a/tests/testit.sh b/tests/testit.sh
>>>> +index 4078f51..d26be3a 100755
>>>> +--- a/tests/testit.sh
>>>> ++++ b/tests/testit.sh
>>>> +@@ -172,6 +172,8 @@ run test1 "test1 - 61" "" -x=f1
>>>> +
>>>> + run test1 "test1 - 62" "arg1: 0 arg2: (none) aInt: 1" --randint=-1
>>>> +
>>>> ++run tstuff "tstuff - 1" "-13"
>>>> ++
>>>> + if ! [ -e test3-data ]; then
>>>> +   # create symlink for running during 'make distcheck'
>>>> +   ln -s "${srcdir}/test3-data" test3-data
>>>> +diff --git a/tests/tstuff.c b/tests/tstuff.c
>>>> +new file mode 100644
>>>> +index 0000000..b820c7b
>>>> +--- /dev/null
>>>> ++++ b/tests/tstuff.c
>>>> +@@ -0,0 +1,17 @@
>>>> ++#include <stdio.h>
>>>> ++#include <popt.h>
>>>> ++
>>>> ++int main(int argc, char *argv[])
>>>> ++{
>>>> ++    poptContext ctx = poptGetContext(argv[0], argc, (const char **)argv,
>> NULL, 0);
>>>> ++    int rc = 0;
>>>> ++    for (int i = 0; i < 100; ++i) {
>>>> ++	const char *ea[] = { "a", NULL };
>>>> ++	if ((rc = poptStuffArgs(ctx, ea)))
>>>> ++	    break;
>>>> ++    }
>>>> ++    printf("%d\n", rc);
>>>> ++
>>>> ++    poptFreeContext(ctx);
>>>> ++    return rc;
>>>> ++}
>>>> diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-
>> support/popt/popt_1.19.bb
>>>> index c8b4875c1b7..18cc4f2867d 100644
>>>> --- a/meta/recipes-support/popt/popt_1.19.bb
>>>> +++ b/meta/recipes-support/popt/popt_1.19.bb
>>>> @@ -11,6 +11,7 @@ DEPENDS = "virtual/libiconv"
>>>>    SRC_URI ="http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
>>>> file://run-ptest \ file://CVE-2026-18743.patch \ +
>>>> file://CVE-2026-18739.patch \ "
>>>>    SRC_URI[sha256sum] =
>> "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
>>>> @@ -25,6 +26,7 @@ do_compile_ptest() {
>>>>    do_install_ptest() {
>>>>        install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
>>>>        install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
>>>> +    install ${B}/tests/.libs/tstuff ${D}/${PTEST_PATH}
>>>>        install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
>>>>        install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
>>>>    }
>>
>> --
>> Yoann Congal
>> Smile ECS
