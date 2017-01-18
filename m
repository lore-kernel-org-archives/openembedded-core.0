Return-Path: <prvs=019193eeaa=mike.looijmans@topicproducts.com>
X-Greylist: delayed 3002 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Jan 2017 10:28:13 UTC
Received: from mx12-14.smtp.antispamcloud.com (mx12-14.smtp.antispamcloud.com
	[46.165.232.184])
	by mail.openembedded.org (Postfix) with ESMTP id 2148E7016E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 10:28:13 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cTmgc-0002eM-Oz for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2017 10:38:07 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Jan 2017 10:37:44 +0100
To: <openembedded-core@lists.openembedded.org>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453DBB31E@XSJ-PSEXMBX01.xlnx.xilinx.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <05c7dfd0-38f3-b684-db94-38121b086a67@topic.nl>
Date: Wed, 18 Jan 2017 10:37:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <14EB1FFCA0C8D24A8B04EDEC1EA78C2453DBB31E@XSJ-PSEXMBX01.xlnx.xilinx.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00254548925182)
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNMP3
	pcjm7MVmUJyTU+wpPWgisucnfUeU//J1quWfGmurYjP2cUS4E40EpBFrdp66N2bjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAAdpU0oUDqng6Dyy2mQeofia0j7VSWiXEKUiGZnVKKRCp1el35jO+WJBgrWGjAavfuifnL+9wg
	oTj4ygNPw1XfN1IUJ2+rCMPpQhII5VkEVC//8GRISD+lYCwA5l6/Q4nfg8y63jKKBrO1BroJmvb9
	eUfeSxHoryR0VpaMOdjZtRaRVYKU9W9tbmVXJBqdHHDml2fQHaY9hVoT9jGvxqBU4tidrpMZFgjz
	m7CJrS8itOkBIkUL/j1Y48GvmeURQjjEVK0SxG5jdoTlpJvo45e5qj8FIprDRrySYpUp+LukEmR/
	+PsxW+1X25M42UePocbLimJBmbX4ZwV05IcNNAgTWJlUOpwpEkpu90COvViIG1hxIqoCQc3HM3T0
	0zJWsAVPIny++hg9dJLqN5zmWqF/oL2zkpvPBVfBs+q9szCzvdEBg+fgOaDhnt+xLo9/BvXFbT9y
	B6+5kUQXUPqxCpKoZ5jW+r1f/TnG1eQk5gcAU2VFrDcQt6dRpOsA8rhO4pl7
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Recommended-Action: accept
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Wed, 18 Jan 2017 10:28:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFCould someone at least please say "yes" or "no"?

I now have three projects waiting for this patch to be included in morty. I=
f=20
it's not going to happen, I'll have to add a bbappend to these layers to fi=
x it.

On 16-01-17 18:49, Manjukumar Harthikote Matha wrote:
> Ping, this has been applied to master
>
> Thanks
> Manju
>
>>=20

Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail





-----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Tuesday, November 22, 2016 2:03 PM
>> To: Manjukumar Harthikote Matha
>> Cc: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH][Morty] binutils-2.27.inc: Fix alignment f=
rags for
>> aarch64
>>
>> This is ok for master
>>
>>
>> On Nov 22, 2016 1:31 PM, "Manjukumar Matha" <manjukumar.harthikote-
>> matha@xilinx.com <mailto:manjukumar.harthikote-matha@xilinx.com> > wrote=
:
>>
>>
>>       There was bug with alignment frags for aarch64 in binutils. This i=
s
>>       fixed in master of binutils. This patch backports the fix to binut=
ils
>>       2.27 version.
>>
>>       Signed-off-by: Manjukumar Matha <manjukumar.harthikote-
>> matha@xilinx.com <mailto:manjukumar.harthikote-matha@xilinx.com> >
>>       Signed-off-by: Nathan Rossi <nathan@nathanrossi.com
>> <mailto:nathan@nathanrossi.com> >
>>       ---
>>        meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
>>        ...eration-of-alignment-frags-in-code-sectio.patch | 139
>> +++++++++++++++++++++
>>        2 files changed, 140 insertions(+)
>>        create mode 100644 meta/recipes-devtools/binutils/binutils/0017-F=
ix-the-
>> generation-of-alignment-frags-in-code-sectio.patch
>>
>>       diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/me=
ta/recipes-
>> devtools/binutils/binutils-2.27.inc
>>       index fc81721..90518bf 100644
>>       --- a/meta/recipes-devtools/binutils/binutils-2.27.inc
>>       +++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
>>       @@ -37,6 +37,7 @@ SRC_URI =3D "\
>>             file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
>>             file://0015-Refine-.cfi_sections-check-to-only-consider-comp=
act-.patch
>> \
>>             file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse=
-a-b.patch \
>>       +     file://0017-Fix-the-generation-of-alignment-frags-in-code-se=
ctio.patch
>> \
>>        "
>>        S  =3D "${WORKDIR}/git"
>>
>>       diff --git a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-=
generation-
>> of-alignment-frags-in-code-sectio.patch b/meta/recipes-
>> devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in=
-code-
>> sectio.patch
>>       new file mode 100644
>>       index 0000000..f8b46be
>>       --- /dev/null
>>       +++ b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generat=
ion-of-
>> alignment-frags-in-code-sectio.patch
>>       @@ -0,0 +1,139 @@
>>       +From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17
>> 00:00:00 2001
>>       +From: Nick Clifton <nickc@redhat.com <mailto:nickc@redhat.com> >
>>       +Date: Fri, 18 Nov 2016 11:42:48 -0800
>>       +Subject: [PATCH] Fix the generation of alignment frags in code se=
ctions for
>> AArch64.
>>       +
>>       +PR gas/20364
>>       +* config/tc-aarch64.c (s_ltorg): Change the mapping state after
>>       +aligning the frag.
>>       +(aarch64_init): Treat rs_align frags in code sections as
>>       +containing code, not data.
>>       +* testsuite/gas/aarch64/pr20364.s: New test.
>>       +* testsuite/gas/aarch64/pr20364.d: New test driver.
>>       +
>>       +Backporting the patch from binutils mainline
>>       +https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-
>> gdb.git;h=3D7ea12e5c3ad54da440c08f32da09534e63e515ca
>> <https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-
>> gdb.git;h=3D7ea12e5c3ad54da440c08f32da09534e63e515ca>
>>       +
>>       +Upstream-Status: Backport
>>       +
>>       +Signed-off-by: Manjukumar Matha <manjukumar.harthikote-
>> matha@xilinx.com <mailto:manjukumar.harthikote-matha@xilinx.com> >
>>       +---
>>       + gas/ChangeLog                       | 10 ++++++++++
>>       + gas/config/tc-aarch64.c             | 10 +++++++---
>>       + gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
>>       + gas/testsuite/gas/aarch64/pr20364.s | 28
>> ++++++++++++++++++++++++++++
>>       + 4 files changed, 58 insertions(+), 3 deletions(-)
>>       + create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
>>       + create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
>>       +
>>       +diff --git a/gas/ChangeLog b/gas/ChangeLog
>>       +index a39895a..fad06dc 100644
>>       +--- a/gas/ChangeLog
>>       ++++ b/gas/ChangeLog
>>       +@@ -1,3 +1,13 @@
>>       ++2016-08-05  Nick Clifton  <nickc@redhat.com
>> <mailto:nickc@redhat.com> >
>>       ++
>>       ++      PR gas/20364
>>       ++      * config/tc-aarch64.c (s_ltorg): Change the mapping state =
after
>>       ++      aligning the frag.
>>       ++      (aarch64_init): Treat rs_align frags in code sections as
>>       ++      containing code, not data.
>>       ++      * testsuite/gas/aarch64/pr20364.s: New test.
>>       ++      * testsuite/gas/aarch64/pr20364.d: New test driver.
>>       ++
>>       + 2016-08-03  Tristan Gingold  <gingold@adacore.com
>> <mailto:gingold@adacore.com> >
>>       +
>>       +       * configure: Regenerate.
>>       +diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
>>       +index ddc40f2..74933cb 100644
>>       +--- a/gas/config/tc-aarch64.c
>>       ++++ b/gas/config/tc-aarch64.c
>>       +@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
>>       +       if (pool =3D=3D NULL || pool->symbol =3D=3D NULL || pool->=
next_free_entry =3D=3D
>> 0)
>>       +       continue;
>>       +
>>       +-      mapping_state (MAP_DATA);
>>       +-
>>       +       /* Align pool as you have word accesses.
>>       +          Only make a frag if we have to.  */
>>       +       if (!need_pass_2)
>>       +       frag_align (align, 0, 0);
>>       +
>>       ++      mapping_state (MAP_DATA);
>>       ++
>>       +       record_alignment (now_seg, align);
>>       +
>>       +       sprintf (sym_name, "$$lit_\002%x", pool->id);
>>       +@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int
>> max_chars)
>>       +
>>       +   switch (fragP->fr_type)
>>       +     {
>>       +-    case rs_align:
>>       +     case rs_align_test:
>>       +     case rs_fill:
>>       +       mapping_state_2 (MAP_DATA, max_chars);
>>       +       break;
>>       ++    case rs_align:
>>       ++      /* PR 20364: We can get alignment frags in code sections,
>>       ++       so do not just assume that we should use the MAP_DATA sta=
te.  */
>>       ++      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN :
>> MAP_DATA, max_chars);
>>       ++      break;
>>       +     case rs_align_code:
>>       +       mapping_state_2 (MAP_INSN, max_chars);
>>       +       break;
>>       +diff --git a/gas/testsuite/gas/aarch64/pr20364.d
>> b/gas/testsuite/gas/aarch64/pr20364.d
>>       +new file mode 100644
>>       +index 0000000..babcff1
>>       +--- /dev/null
>>       ++++ b/gas/testsuite/gas/aarch64/pr20364.d
>>       +@@ -0,0 +1,13 @@
>>       ++# Check that ".align <size>, <fill>" does not set the mapping st=
ate to
>> DATA, causing unnecessary frag generation.
>>       ++#name: PR20364
>>       ++#objdump: -d
>>       ++
>>       ++.*:     file format .*
>>       ++
>>       ++Disassembly of section \.vectors:
>>       ++
>>       ++0+000 <.*>:
>>       ++   0: d2800000        mov     x0, #0x0                        //=
 #0
>>       ++   4: 94000000        bl      0 <plat_report_exception>
>>       ++   8: 17fffffe        b       0 <bl1_exceptions>
>>       ++
>>       +diff --git a/gas/testsuite/gas/aarch64/pr20364.s
>> b/gas/testsuite/gas/aarch64/pr20364.s
>>       +new file mode 100644
>>       +index 0000000..594ad7c
>>       +--- /dev/null
>>       ++++ b/gas/testsuite/gas/aarch64/pr20364.s
>>       +@@ -0,0 +1,28 @@
>>       ++ .macro vector_base label
>>       ++ .section .vectors, "ax"
>>       ++ .align 11, 0
>>       ++ \label:
>>       ++ .endm
>>       ++
>>       ++ .macro vector_entry label
>>       ++ .section .vectors, "ax"
>>       ++ .align 7, 0
>>       ++ \label:
>>       ++ .endm
>>       ++
>>       ++ .macro check_vector_size since
>>       ++   .if (. - \since) > (32 * 4)
>>       ++     .error "Vector exceeds 32 instructions"
>>       ++   .endif
>>       ++ .endm
>>       ++
>>       ++ .globl bl1_exceptions
>>       ++
>>       ++vector_base bl1_exceptions
>>       ++
>>       ++vector_entry SynchronousExceptionSP0
>>       ++ mov x0, #0x0
>>       ++ bl plat_report_exception
>>       ++ b SynchronousExceptionSP0
>>       ++ check_vector_size SynchronousExceptionSP0
>>       ++
>>       +--
>>       +2.7.4
>>       +
>>       --
>>       2.7.4
>>
>>       --
>>       _______________________________________________
>>       Openembedded-core mailing list
>>       Openembedded-core@lists.openembedded.org <mailto:Openembedded-
>> core@lists.openembedded.org>
>>       http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>
>
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.
>


