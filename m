Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8190B719D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:36:16 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p66so3336501pga.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=PdNca7vo2+RwNzYFvJ9PBDVLQ9zim6w3n2f4ZYZlcLc=;
	b=HeSg4GgmdxrwSDyhJqAwuJm/eveSd5Et6Eymqjg0vXJD4G5avfOGHUl6j0UBCfKUor
	/0V3rVqafCPGWF487lWD24q2wBBufcA4zs0cnbtGLvUpAM4PfY4FJ17qb42Q5tgLoj65
	PNZu54SJazp0/isE8IuIxN+ClhSAKj+NVGp6s+GHaYh3FZhl5RC/oeTlhKPIR4NjNURA
	YiNfjW4xrFNhGzLRWWGZ0HY5+f8jzrs2l88Rs0t/R3UePpmSDzIRNUbkTUd5b7lX77ih
	pUJ4KheecjnMXwnFw1y3QTFK+tIbjfdVNDS6CSZjzx4Sup1APTau8m9+EaGrfo8xRVRj
	hwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=PdNca7vo2+RwNzYFvJ9PBDVLQ9zim6w3n2f4ZYZlcLc=;
	b=KBhGkkhV3PZoHLoe9hUiIkomyHJn6gQlVIXJQEeq1R4ULyjJOIfcLTYdSpG1LRfSlz
	jDDeT2a7oE6251WJdmkmi2pPKn29hecreq2L3OVFXxDceFu6+kbmtaROmzIVsgXdmpZK
	KeEDxSRXmGuSXq8CcUmdmkrFCnSSzfSKj2BnpFzC2Fbt3kwbAmDRPHbIYNDmcBKCbPic
	suOKnd+uyDOG3RHQ6dBVNe0V++LzQthum+jw6K0YDeAO3plzku0aiJAC68dihwsHdvcx
	LBVrlEDG53L2edibNweJUF5wUT+u8Dq5xrz3Gpj0w79CAoD8mthvn2aCBxfUy0n4mFOW
	IDHA==
X-Gm-Message-State: AKaTC03smxsTT9g9JR14xX5qloyOeLIxEivw4lP3Gih+rkMIH+cDdhFKLO8rB/3Bpyb82w==
X-Received: by 10.99.174.4 with SMTP id q4mr314398pgf.178.1479857778382;
	Tue, 22 Nov 2016 15:36:18 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d191:f445:6e57:1696])
	by smtp.gmail.com with ESMTPSA id
	q12sm47578727pfj.18.2016.11.22.15.36.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 15:36:17 -0800 (PST)
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<220ac38a-b960-6a9a-84f1-f9a58c936537@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <6c654497-ceec-07d6-7e6e-2e7d06486880@gmail.com>
Date: Tue, 22 Nov 2016 15:36:16 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <220ac38a-b960-6a9a-84f1-f9a58c936537@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 22 Nov 2016 23:36:19 -0000
X-Groupsio-MsgNum: 89690
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="JhO6iHUjBbGDlfs6CURjTHeS2iKkx2avw"

--JhO6iHUjBbGDlfs6CURjTHeS2iKkx2avw
Content-Type: multipart/mixed; boundary="S8rxcRnomAKIQWHDu54SqrOQrjO2KWF2a";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <6c654497-ceec-07d6-7e6e-2e7d06486880@gmail.com>
Subject: Re: [OE-core] [PATCH][Morty] binutils-2.27.inc: Fix alignment frags
 for aarch64
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
 <CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
 <220ac38a-b960-6a9a-84f1-f9a58c936537@xilinx.com>
In-Reply-To: <220ac38a-b960-6a9a-84f1-f9a58c936537@xilinx.com>

--S8rxcRnomAKIQWHDu54SqrOQrjO2KWF2a
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/22/16 3:08 PM, Manjukumar Harthikote Matha wrote:
> Hi Khem,
>=20
> On 11/22/2016 02:03 PM, Khem Raj wrote:
>> This is ok for master
> Is there a particular reason not have in Morty? We have arm-trusted-fir=
mware
> failing to build due to this issue. I have submitted a patch to master =
as well

Once its in master, it should get into morty subsequently.

>=20
> Thanks
> Manju
>=20
>>
>>
>> On Nov 22, 2016 1:31 PM, "Manjukumar Matha"
>> <manjukumar.harthikote-matha@xilinx.com
>> <mailto:manjukumar.harthikote-matha@xilinx.com>> wrote:
>>
>>     There was bug with alignment frags for aarch64 in binutils. This i=
s
>>     fixed in master of binutils. This patch backports the fix to binut=
ils
>>     2.27 version.
>>
>>     Signed-off-by: Manjukumar Matha
>>     <manjukumar.harthikote-matha@xilinx.com
>>     <mailto:manjukumar.harthikote-matha@xilinx.com>>
>>     Signed-off-by: Nathan Rossi <nathan@nathanrossi.com
>>     <mailto:nathan@nathanrossi.com>>
>>     ---
>>      meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
>>      ...eration-of-alignment-frags-in-code-sectio.patch | 139
>>     +++++++++++++++++++++
>>      2 files changed, 140 insertions(+)
>>      create mode 100644
>>   =20
>> meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-ali=
gnment-frags-in-code-sectio.patch
>>
>>
>>     diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc
>>     b/meta/recipes-devtools/binutils/binutils-2.27.inc
>>     index fc81721..90518bf 100644
>>     --- a/meta/recipes-devtools/binutils/binutils-2.27.inc
>>     +++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
>>     @@ -37,6 +37,7 @@ SRC_URI =3D "\
>>           file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
>>
>>     file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.p=
atch \
>>
>>     file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.p=
atch \
>>     +
>>      file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.=
patch
>>     \
>>      "
>>      S  =3D "${WORKDIR}/git"
>>
>>     diff --git
>>   =20
>> a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-a=
lignment-frags-in-code-sectio.patch
>>
>>   =20
>> b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-a=
lignment-frags-in-code-sectio.patch
>>
>>     new file mode 100644
>>     index 0000000..f8b46be
>>     --- /dev/null
>>     +++
>>   =20
>> b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-a=
lignment-frags-in-code-sectio.patch
>>
>>     @@ -0,0 +1,139 @@
>>     +From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17 00:00:00=
 2001
>>     +From: Nick Clifton <nickc@redhat.com <mailto:nickc@redhat.com>>
>>     +Date: Fri, 18 Nov 2016 11:42:48 -0800
>>     +Subject: [PATCH] Fix the generation of alignment frags in code
>>     sections for AArch64.
>>     +
>>     +PR gas/20364
>>     +* config/tc-aarch64.c (s_ltorg): Change the mapping state after
>>     +aligning the frag.
>>     +(aarch64_init): Treat rs_align frags in code sections as
>>     +containing code, not data.
>>     +* testsuite/gas/aarch64/pr20364.s: New test.
>>     +* testsuite/gas/aarch64/pr20364.d: New test driver.
>>     +
>>     +Backporting the patch from binutils mainline
>>   =20
>> +https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7ea12e=
5c3ad54da440c08f32da09534e63e515ca
>>
>>   =20
>> <https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7ea12e=
5c3ad54da440c08f32da09534e63e515ca>
>>
>>     +
>>     +Upstream-Status: Backport
>>     +
>>     +Signed-off-by: Manjukumar Matha
>>     <manjukumar.harthikote-matha@xilinx.com
>>     <mailto:manjukumar.harthikote-matha@xilinx.com>>
>>     +---
>>     + gas/ChangeLog                       | 10 ++++++++++
>>     + gas/config/tc-aarch64.c             | 10 +++++++---
>>     + gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
>>     + gas/testsuite/gas/aarch64/pr20364.s | 28 +++++++++++++++++++++++=
+++++
>>     + 4 files changed, 58 insertions(+), 3 deletions(-)
>>     + create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
>>     + create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
>>     +
>>     +diff --git a/gas/ChangeLog b/gas/ChangeLog
>>     +index a39895a..fad06dc 100644
>>     +--- a/gas/ChangeLog
>>     ++++ b/gas/ChangeLog
>>     +@@ -1,3 +1,13 @@
>>     ++2016-08-05  Nick Clifton  <nickc@redhat.com <mailto:nickc@redhat=
=2Ecom>>
>>     ++
>>     ++      PR gas/20364
>>     ++      * config/tc-aarch64.c (s_ltorg): Change the mapping state =
after
>>     ++      aligning the frag.
>>     ++      (aarch64_init): Treat rs_align frags in code sections as
>>     ++      containing code, not data.
>>     ++      * testsuite/gas/aarch64/pr20364.s: New test.
>>     ++      * testsuite/gas/aarch64/pr20364.d: New test driver.
>>     ++
>>     + 2016-08-03  Tristan Gingold  <gingold@adacore.com
>>     <mailto:gingold@adacore.com>>
>>     +
>>     +       * configure: Regenerate.
>>     +diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
>>     +index ddc40f2..74933cb 100644
>>     +--- a/gas/config/tc-aarch64.c
>>     ++++ b/gas/config/tc-aarch64.c
>>     +@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
>>     +       if (pool =3D=3D NULL || pool->symbol =3D=3D NULL ||
>>     pool->next_free_entry =3D=3D 0)
>>     +       continue;
>>     +
>>     +-      mapping_state (MAP_DATA);
>>     +-
>>     +       /* Align pool as you have word accesses.
>>     +          Only make a frag if we have to.  */
>>     +       if (!need_pass_2)
>>     +       frag_align (align, 0, 0);
>>     +
>>     ++      mapping_state (MAP_DATA);
>>     ++
>>     +       record_alignment (now_seg, align);
>>     +
>>     +       sprintf (sym_name, "$$lit_\002%x", pool->id);
>>     +@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int
>>     max_chars)
>>     +
>>     +   switch (fragP->fr_type)
>>     +     {
>>     +-    case rs_align:
>>     +     case rs_align_test:
>>     +     case rs_fill:
>>     +       mapping_state_2 (MAP_DATA, max_chars);
>>     +       break;
>>     ++    case rs_align:
>>     ++      /* PR 20364: We can get alignment frags in code sections,
>>     ++       so do not just assume that we should use the MAP_DATA
>>     state.  */
>>     ++      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN :
>>     MAP_DATA, max_chars);
>>     ++      break;
>>     +     case rs_align_code:
>>     +       mapping_state_2 (MAP_INSN, max_chars);
>>     +       break;
>>     +diff --git a/gas/testsuite/gas/aarch64/pr20364.d
>>     b/gas/testsuite/gas/aarch64/pr20364.d
>>     +new file mode 100644
>>     +index 0000000..babcff1
>>     +--- /dev/null
>>     ++++ b/gas/testsuite/gas/aarch64/pr20364.d
>>     +@@ -0,0 +1,13 @@
>>     ++# Check that ".align <size>, <fill>" does not set the mapping
>>     state to DATA, causing unnecessary frag generation.
>>     ++#name: PR20364
>>     ++#objdump: -d
>>     ++
>>     ++.*:     file format .*
>>     ++
>>     ++Disassembly of section \.vectors:
>>     ++
>>     ++0+000 <.*>:
>>     ++   0: d2800000        mov     x0, #0x0                        //=
 #0
>>     ++   4: 94000000        bl      0 <plat_report_exception>
>>     ++   8: 17fffffe        b       0 <bl1_exceptions>
>>     ++
>>     +diff --git a/gas/testsuite/gas/aarch64/pr20364.s
>>     b/gas/testsuite/gas/aarch64/pr20364.s
>>     +new file mode 100644
>>     +index 0000000..594ad7c
>>     +--- /dev/null
>>     ++++ b/gas/testsuite/gas/aarch64/pr20364.s
>>     +@@ -0,0 +1,28 @@
>>     ++ .macro vector_base label
>>     ++ .section .vectors, "ax"
>>     ++ .align 11, 0
>>     ++ \label:
>>     ++ .endm
>>     ++
>>     ++ .macro vector_entry label
>>     ++ .section .vectors, "ax"
>>     ++ .align 7, 0
>>     ++ \label:
>>     ++ .endm
>>     ++
>>     ++ .macro check_vector_size since
>>     ++   .if (. - \since) > (32 * 4)
>>     ++     .error "Vector exceeds 32 instructions"
>>     ++   .endif
>>     ++ .endm
>>     ++
>>     ++ .globl bl1_exceptions
>>     ++
>>     ++vector_base bl1_exceptions
>>     ++
>>     ++vector_entry SynchronousExceptionSP0
>>     ++ mov x0, #0x0
>>     ++ bl plat_report_exception
>>     ++ b SynchronousExceptionSP0
>>     ++ check_vector_size SynchronousExceptionSP0
>>     ++
>>     +--
>>     +2.7.4
>>     +
>>     --
>>     2.7.4
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>=

>>


--S8rxcRnomAKIQWHDu54SqrOQrjO2KWF2a--

--JhO6iHUjBbGDlfs6CURjTHeS2iKkx2avw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlg01nEACgkQuwUzVZGdMxQm7gCffxlbFz9kIC69gR9fqQF/pRwq
qAAAn3F4ijDMz4/o6N0B18JqycfgvVsn
=bFly
-----END PGP SIGNATURE-----

--JhO6iHUjBbGDlfs6CURjTHeS2iKkx2avw--
