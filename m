Return-Path: <public@plane.gmane.org>
X-Greylist: delayed 907 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 23:14:25 UTC
Received: from plane.gmane.org (unknown [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1C89A65F11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:14:25 +0000 (UTC)
Received: from public by plane.gmane.org with local (Exim 4.69)
	(envelope-from <public@plane.gmane.org>) id 1WpmoY-0004wz-La
	for openembedded-core@lists.openembedded.org;
	Thu, 29 May 2014 00:59:18 +0200
Received: from public by plane.gmane.org with local (Exim 4.69)
	(envelope-from <sgw@linux.intel.com>) id 1WpmoO-0004jF-GN for
	public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org;
	Thu, 29 May 2014 00:59:08 +0200
Received: from mga01.intel.com ([192.55.52.88])
	by plane.gmane.org with esmtp (Exim 4.69)
	(envelope-from <sgw@linux.intel.com>) id 1WplRv-0002eX-TC for
	public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org;
	Wed, 28 May 2014 23:31:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 May 2014 14:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,930,1392192000"; d="scan'208";a="546385841"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2014 14:30:45 -0700
Message-ID: <53865584.7090103@linux.intel.com>
Date: Wed, 28 May 2014 14:30:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
Newsgroups: gmane.comp.handhelds.openembedded.core
To: Khem Raj <public-raj.khem-Re5JQEeQqe8AvxtiuMwx3w@plane.gmane.org>, 
	Alexandru-Cezar Sardan
	<public-alexandru.sardan-KZfg59tc24xl57MIdRCFDg@plane.gmane.org>
References: <1401283484-28186-1-git-send-email-alexandru.sardan@freescale.com>	<CAMKF1soGxNSaJicQ+B5C13cMT3NqUE+-AZ_ZBr5yUGzLk9fQpg@mail.gmail.com>
	<CAMKF1spgZA9c1d5WO=Ldkt_BEVPA5Ux_XQnSouF2VLnFmQZ7Pw@mail.gmail.com>
In-Reply-To: <CAMKF1spgZA9c1d5WO=Ldkt_BEVPA5Ux_XQnSouF2VLnFmQZ7Pw@mail.gmail.com>
X-TMDA-Confirmed: Thu, 29 May 2014 00:59:08 +0200
Cc: Patches and discussions about the oe-core layer
	<public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org>
Subject: Re: [PATCH] gcc: add patch to fix errors with Decimal64 type
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
X-List-Received-Date: Wed, 28 May 2014 23:14:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit




On 05/28/2014 01:00 PM, Khem Raj wrote:
> Saul
>
> can you cherry-pick
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-4.9&id=c5f8c01c48afebc8a9987dc09f87e37520b94e25
> along with this one now
>

I have been testing MUT with this one just to make sure we don't regress 
anywhere else in the interim. We are building master/weekly currently, I 
will fire off a MUT build later today.

Sau!

> On Wed, May 28, 2014 at 12:58 PM, Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, May 28, 2014 at 6:24 AM, Alexandru-Cezar Sardan
>> <alexandru.sardan-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>>> [OE-core bug #6270] - https://bugzilla.yoctoproject.org/show_bug.cgi?id=6270
>>>
>>
>> This looks good.
>>
>>> Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> ---
>>>   meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
>>>   ...-E500-SPE-errors-with-the-_Decimal64-type.patch |   98 ++++++++++++++++++++
>>>   2 files changed, 99 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
>>> index a409430..9b4fc2c 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
>>> @@ -65,6 +65,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>             file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
>>>             file://0050-Revert-Use-dbx_reg_number-for-spanning-registers.patch \
>>>              file://0051-eabispe.patch \
>>> +           file://0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch \
>>>            "
>>>   SRC_URI[md5sum] = "9709b49ae0e904cbb0a6a1b62853b556"
>>>   SRC_URI[sha256sum] = "b9b047a97bade9c1c89970bc8e211ff57b7b8998a1730a80a653d329f8ed1257"
>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch b/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
>>> new file mode 100644
>>> index 0000000..ccfea9d
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
>>> @@ -0,0 +1,98 @@
>>> +From e44a6d438db4848c2a555be773568a3cf7994206 Mon Sep 17 00:00:00 2001
>>> +From: Alexandru-Cezar Sardan <alexandru.sardan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> +Date: Mon, 26 May 2014 12:11:13 +0300
>>> +Subject: [PATCH] Fix E500 with SPE errors with the _Decimal64 type
>>> +
>>> +[gcc]
>>> +2014-04-21 Michael Meissner  <meissner-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>> +
>>> +       PR target/60735
>>> +       * config/rs6000/rs6000.md (mov<mode>_softfloat32, FMOVE64 case):
>>> +       If mode is DDmode and TARGET_E500_DOUBLE allow move.
>>> +
>>> +       * config/rs6000/rs6000.c (rs6000_debug_reg_global): Print some
>>> +       more debug information for E500 if -mdebug=reg.
>>> +
>>> +[gcc/testsuite]
>>> +2014-04-21  Michael Meissner  <meissner-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>> +
>>> +       PR target/60735
>>> +       * gcc.target/powerpc/pr60735.c: New test.  Insure _Decimal64 does
>>> +       not cause errors if -mspe.
>>> +
>>> +Upstream status: Accepted
>>> +
>>> +This solves upstream bug 60735
>>> +(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60735).
>>> +
>>> +Patch taken from https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=209664
>>> +---
>>> + gcc/config/rs6000/rs6000.c                 |   18 ++++++++++++++++++
>>> + gcc/config/rs6000/rs6000.md                |    3 ++-
>>> + gcc/testsuite/gcc.target/powerpc/pr60735.c |   11 +++++++++++
>>> + 3 files changed, 31 insertions(+), 1 deletion(-)
>>> + create mode 100644 gcc/testsuite/gcc.target/powerpc/pr60735.c
>>> +
>>> +diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
>>> +index 494efc5..6dcf440 100644
>>> +--- a/gcc/config/rs6000/rs6000.c
>>> ++++ b/gcc/config/rs6000/rs6000.c
>>> +@@ -2283,6 +2283,24 @@ rs6000_debug_reg_global (void)
>>> +   if (rs6000_float_gprs)
>>> +     fprintf (stderr, DEBUG_FMT_S, "float_gprs", "true");
>>> +
>>> ++  fprintf (stderr, DEBUG_FMT_S, "fprs",
>>> ++         (TARGET_FPRS ? "true" : "false"));
>>> ++
>>> ++  fprintf (stderr, DEBUG_FMT_S, "single_float",
>>> ++         (TARGET_SINGLE_FLOAT ? "true" : "false"));
>>> ++
>>> ++  fprintf (stderr, DEBUG_FMT_S, "double_float",
>>> ++         (TARGET_DOUBLE_FLOAT ? "true" : "false"));
>>> ++
>>> ++  fprintf (stderr, DEBUG_FMT_S, "soft_float",
>>> ++         (TARGET_SOFT_FLOAT ? "true" : "false"));
>>> ++
>>> ++  fprintf (stderr, DEBUG_FMT_S, "e500_single",
>>> ++         (TARGET_E500_SINGLE ? "true" : "false"));
>>> ++
>>> ++  fprintf (stderr, DEBUG_FMT_S, "e500_double",
>>> ++         (TARGET_E500_DOUBLE ? "true" : "false"));
>>> ++
>>> +   if (TARGET_LINK_STACK)
>>> +     fprintf (stderr, DEBUG_FMT_S, "link_stack", "true");
>>> +
>>> +diff --git a/gcc/config/rs6000/rs6000.md b/gcc/config/rs6000/rs6000.md
>>> +index 64c9e7c..9cefe15 100644
>>> +--- a/gcc/config/rs6000/rs6000.md
>>> ++++ b/gcc/config/rs6000/rs6000.md
>>> +@@ -9395,7 +9395,8 @@
>>> +       (match_operand:FMOVE64 1 "input_operand" "r,Y,r,G,H,F"))]
>>> +   "! TARGET_POWERPC64
>>> +    && ((TARGET_FPRS && TARGET_SINGLE_FLOAT)
>>> +-       || TARGET_SOFT_FLOAT || TARGET_E500_SINGLE)
>>> ++       || TARGET_SOFT_FLOAT || TARGET_E500_SINGLE
>>> ++       || (<MODE>mode == DDmode && TARGET_E500_DOUBLE))
>>> +    && (gpc_reg_operand (operands[0], <MODE>mode)
>>> +        || gpc_reg_operand (operands[1], <MODE>mode))"
>>> +   "#"
>>> +diff --git a/gcc/testsuite/gcc.target/powerpc/pr60735.c b/gcc/testsuite/gcc.target/powerpc/pr60735.c
>>> +new file mode 100644
>>> +index 0000000..9bac30b
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/powerpc/pr60735.c
>>> +@@ -0,0 +1,11 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-mcpu=8548 -mspe -mabi=spe -O2" } */
>>> ++/* { dg-skip-if "not an SPE target" { ! powerpc_spe_nocache } { "*" } { "" } } */
>>> ++
>>> ++/* In PR60735, the type _Decimal64 generated an insn not found message.  */
>>> ++
>>> ++void
>>> ++pr60735 (_Decimal64 *p, _Decimal64 *q)
>>> ++{
>>> ++  *p = *q;
>>> ++}
>>> +--
>>> +1.7.9.5
>>> +
>>> --
>>> 1.7.9.5
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@public.gmane.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core




