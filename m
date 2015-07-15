Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id DBB26607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 12:48:40 +0000 (UTC)
Received: by ykeo3 with SMTP id o3so34769958yke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=HkOgWyGBlvtOr/ZqEgAi0V1uGAFfDBzCQ2ITAAo2zAc=;
	b=vGcsdp2YJNtl7VuaYFI+Vt1FS0FrOF5t3BUZGMS/+FzRQoS+H1PRjswUmZMEfcTYdh
	ihINeYmnvS053NJ75tQ0xn7PxQ6El1mO/szG2GMpob1ZHZlziPNVi6d7r4AQxSeKKAt8
	+C6uqEss+67Wavb/1Ja8rnZkhYrIc60nmHHfwHG4HaTAUtsOOsAZmN0w8lx/PXAsm7nO
	JyttCMc2nS6+GLloBFj6qS+OUGhcKZ8h2W3Zb+s/M3p9a8uaspbntjDxbfbCEcE0J6g8
	qoY9ZD+GtbCtyPAC4XMYk3LoVd8apiOTK17X3WpsN2bpQ5JKrdYG7x29AK/+yt9wmAWk
	6FWA==
MIME-Version: 1.0
X-Received: by 10.170.47.197 with SMTP id 188mr3971356ykp.62.1436964520032;
	Wed, 15 Jul 2015 05:48:40 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 15 Jul 2015 05:48:39 -0700 (PDT)
In-Reply-To: <55A5F712.9040104@windriver.com>
References: <cover.1436464186.git.raj.khem@gmail.com>
	<ba4775eeebab2aec8f81970e61903a35a46eb4ce.1436464186.git.raj.khem@gmail.com>
	<55A372F6.9030107@windriver.com>
	<9418D7F2-9A42-4E23-90F4-87B935259936@gmail.com>
	<55A5F712.9040104@windriver.com>
Date: Wed, 15 Jul 2015 08:48:39 -0400
Message-ID: <CADkTA4Osu-wqvJoogL1bfYROyiPGEvur5L_dAMYLs6Fu0rBKug@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gcc-4.9: Upgrade to 4.9.3
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
X-List-Received-Date: Wed, 15 Jul 2015 12:48:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2015 at 2:00 AM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
>
>
> On 07/15/2015 12:07 PM, Khem Raj wrote:
>>
>>
>>> On Jul 13, 2015, at 1:12 AM, Robert Yang <liezhi.yang@windriver.com>
>>> wrote:
>>>
>>>
>>> Hi Khem,
>>>
>>> This upgrade breaks linux-yocto 3.14 build on qemumips or qemumips64:
>>>
>>> In local.conf:
>>> MACHINE =3D "qemumips"
>>> PREFERRED_VERSION_linux-yocto_qemumips =3D "3.14%"
>>>
>>> $ bitbake linux-yocto -ccompile
>>>
>>> Then errors:
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:
>>> Assembler messages:
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:68:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f0,272+0($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:69:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f2,272+16($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:70:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f4,272+32($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:71:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f6,272+48($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:72:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f8,272+64($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:73:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f10,272+80($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:74:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f12,272+96($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:75:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f14,272+112($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:76:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f16,272+128($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:77:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f18,272+144($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:78:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f20,272+160($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:79:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f22,272+176($4)'
>>> tmp/work-shared/qemumips/kernel-source/arch/mips/kernel/r4k_fpu.S:80:
>>> Error: opcode not supported on this processor: mips3 (mips3) `sdc1
>>> $f24,272+192($4)=E2=80=99
>>
>>
>> Its not related to gcc per-se but exposed by gcc 4.9.3
>> You need a back port.
>
>
> Thanks.
>

We have a bugzilla for this issue already, so if anyone else looks
into this, make
sure to coordinate with Yang Shi @ Wind River. I sent him that issue.

FWIW, that referenced commit does not port easily .. so this isn't
trivial to fix.

Cheers,

Bruce

> // Robert
>
>
>>
>>
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D842dfc11ea9a21f9825167c8a4f2834b205b0a79
>>
>>
>>>
>>> // Robert
>>>
>>> On 07/10/2015 01:52 AM, Khem Raj wrote:
>>>>
>>>> Drop upsteamed patch for
>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D66483 which is already =
in
>>>> 4.9.3
>>>>
>>>> rename 0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>>>> to 0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch to
>>>> keep the sequence
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>   meta/recipes-devtools/gcc/gcc-4.9.inc              | 11 +++---
>>>>   ...BS_DIR-replacement-instead-of-hardcoding.patch} |  0
>>>>   ...racking.c-backport-from-gcc-trunk-r212178.patch | 39
>>>> ----------------------
>>>>   3 files changed, 5 insertions(+), 45 deletions(-)
>>>>   rename
>>>> meta/recipes-devtools/gcc/gcc-4.9/{0063-Use-SYSTEMLIBS_DIR-replacement=
-instead-of-hardcoding.patch
>>>> =3D> 0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch} =
(100%)
>>>>   delete mode 100644
>>>> meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-fro=
m-gcc-trunk-r212178.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc
>>>> b/meta/recipes-devtools/gcc/gcc-4.9.inc
>>>> index 9ed3e09..d61eca7 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
>>>> @@ -2,11 +2,11 @@ require gcc-common.inc
>>>>
>>>>   # Third digit in PV should be incremented after a minor release
>>>>
>>>> -PV =3D "4.9.2"
>>>> +PV =3D "4.9.3"
>>>>
>>>>   # BINV should be incremented to a revision after a minor gcc release
>>>>
>>>> -BINV =3D "4.9.2"
>>>> +BINV =3D "4.9.3"
>>>>
>>>>   FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-4.9:"
>>>>
>>>> @@ -77,11 +77,10 @@ SRC_URI =3D "\
>>>>       file://0059-gcc-PR-rtl-optimization-63348.patch \
>>>>
>>>> file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch=
 \
>>>>       file://0061-target-gcc-includedir.patch \
>>>> -
>>>> file://0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch \
>>>> -
>>>> file://0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch=
 \
>>>> +
>>>> file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch=
 \
>>>>   "
>>>> -SRC_URI[md5sum] =3D "4df8ee253b7f3863ad0b86359cd39c43"
>>>> -SRC_URI[sha256sum] =3D
>>>> "2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd"
>>>> +SRC_URI[md5sum] =3D "6f831b4d251872736e8e9cc09746f327"
>>>> +SRC_URI[sha256sum] =3D
>>>> "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
>>>>
>>>>   S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>>>>   B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacemen=
t-instead-of-hardcoding.patch
>>>> b/meta/recipes-devtools/gcc/gcc-4.9/0062-Use-SYSTEMLIBS_DIR-replacemen=
t-instead-of-hardcoding.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-=
instead-of-hardcoding.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-4.9/0062-Use-SYSTEMLIBS_DIR-replacement-=
instead-of-hardcoding.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-f=
rom-gcc-trunk-r212178.patch
>>>> b/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-f=
rom-gcc-trunk-r212178.patch
>>>> deleted file mode 100644
>>>> index c0ea62f..0000000
>>>> ---
>>>> a/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-f=
rom-gcc-trunk-r212178.patch
>>>> +++ /dev/null
>>>> @@ -1,39 +0,0 @@
>>>> -From b30ffb8097749fdb55704aa7d8307ca1a58255d6 Mon Sep 17 00:00:00 200=
1
>>>> -From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D
>>>> <s.mueller-klieser@phytec.de>
>>>> -Date: Tue, 7 Apr 2015 16:15:11 +0200
>>>> -Subject: [PATCH] gcc/var-tracking.c: backport from gcc trunk r212178
>>>> -MIME-Version: 1.0
>>>> -Content-Type: text/plain; charset=3DUTF-8
>>>> -Content-Transfer-Encoding: 8bit
>>>> -
>>>> -resolves a bug seen on cortexa8 building qt5 libraries.
>>>> -
>>>> -2014-06-30  Joseph Myers  <joseph@codesourcery.com>
>>>> -
>>>> -    * var-tracking.c (add_stores): Return instead of asserting if old
>>>> -    and new values for conditional store are the same.
>>>> -
>>>> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212178
>>>> 138bc75d-0d04-0410-961f-82ee72b054a4
>>>> -
>>>> -Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.d=
e>
>>>> ----
>>>> - gcc/var-tracking.c | 3 ++-
>>>> - 1 file changed, 2 insertions(+), 1 deletion(-)
>>>> -
>>>> -diff --git a/gcc/var-tracking.c b/gcc/var-tracking.c
>>>> -index 65d8285..7c38910 100644
>>>> ---- a/gcc/var-tracking.c
>>>> -+++ b/gcc/var-tracking.c
>>>> -@@ -5997,7 +5997,8 @@ add_stores (rtx loc, const_rtx expr, void *cuip=
)
>>>> -     {
>>>> -       cselib_val *oval =3D cselib_lookup (oloc, GET_MODE (oloc), 0,
>>>> VOIDmode);
>>>> -
>>>> --      gcc_assert (oval !=3D v);
>>>> -+      if (oval =3D=3D v)
>>>> -+        return;
>>>> -       gcc_assert (REG_P (oloc) || MEM_P (oloc));
>>>> -
>>>> -       if (oval && !cselib_preserved_value_p (oval))
>>>> ---
>>>> -1.9.1
>>>> -
>>>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

