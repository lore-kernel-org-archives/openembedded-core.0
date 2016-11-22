Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id D369F71A26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 22:03:24 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id p9so24197078vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 14:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AOH3ELUwrKMWWW1FKmCABQyQZYe6hJ99e5Zn30rr4BY=;
	b=Iu04o5fcFzR7tJfdcu+bjlU3HzqYCPis3gwHGlRcCqt3myMh3M06yvZaLzpcV9EAv8
	rtA7kKWavpIBhST2OFK3pf6hM6u18rFHFfjtCKqIEkjj2wl5sFGtp1Qq/TxKc7FXdj0d
	WiNio29sNSctMGl9KH/uM6LIhW0rFGIwgBNoDwnJb2mBvFGg0t1X7Wq0gQW39WO8h33m
	SVP/ghpJ4JrcmjVj7F2J4+sXtyDTyxFxucedJSDBdtNW27GfZ6ZjDv8/RYb0ombW+6nr
	PunMq4CkX7W5jZ6Wnf//3sZBGEOy1rD3o2zONmZ8a01UcS1Mf/27jE0Ku/6EKor383vY
	LHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AOH3ELUwrKMWWW1FKmCABQyQZYe6hJ99e5Zn30rr4BY=;
	b=VcksBcnzRwY7XF+kiEmKRthA0d57zfNtXcW9/d8cC9zuL38BNlc/RJUxD798UR5cIR
	/v0tn3daExpuzABzz+Ui93IShoEiGzjLJPPZdRUmOw1nsT31MTt0PWTnDcj+VGahBSV+
	zIk7u6k8x2kIbDf9h2ZiQoWtChGlBDxLi8mSxElP9swN45JAjfa9VIO9bpmL79+MuclT
	DF16P4DA9S150SwsOyTR81G8u8giPSoU7tTFnKmffp9TeEinMuDE1I2HWtw5flffyjcZ
	eb04Acs7kUMmO6dz6dVZscdE+92IwN7qy897977BT3eGpGsZTGXSGpqUZIYbOxQS7Mez
	OVrQ==
X-Gm-Message-State: AKaTC02JHGUQsi7gxvy1JP4ucNtYvEOjrI37uVtYSJX0lIPgy5E0fPUbKuTTa7ZertqiD5Dqb6sK6CtUfEPm2w==
X-Received: by 10.31.8.8 with SMTP id 8mr10601058vki.173.1479852206144; Tue,
	22 Nov 2016 14:03:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Tue, 22 Nov 2016 14:03:25 -0800 (PST)
Received: by 10.176.5.136 with HTTP; Tue, 22 Nov 2016 14:03:25 -0800 (PST)
In-Reply-To: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Nov 2016 14:03:25 -0800
Message-ID: <CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
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
X-List-Received-Date: Tue, 22 Nov 2016 22:03:26 -0000
Content-Type: multipart/alternative; boundary=001a11454c641144e60541eaf1a0

--001a11454c641144e60541eaf1a0
Content-Type: text/plain; charset=UTF-8

This is ok for master

On Nov 22, 2016 1:31 PM, "Manjukumar Matha" <
manjukumar.harthikote-matha@xilinx.com> wrote:

> There was bug with alignment frags for aarch64 in binutils. This is
> fixed in master of binutils. This patch backports the fix to binutils
> 2.27 version.
>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
>  ...eration-of-alignment-frags-in-code-sectio.patch | 139
> +++++++++++++++++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0017-Fix-
> the-generation-of-alignment-frags-in-code-sectio.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc
> b/meta/recipes-devtools/binutils/binutils-2.27.inc
> index fc81721..90518bf 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.27.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
> @@ -37,6 +37,7 @@ SRC_URI = "\
>       file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
>       file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch
> \
>       file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch
> \
> +     file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
> \
>  "
>  S  = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-Fix-
> the-generation-of-alignment-frags-in-code-sectio.patch
> b/meta/recipes-devtools/binutils/binutils/0017-Fix-
> the-generation-of-alignment-frags-in-code-sectio.patch
> new file mode 100644
> index 0000000..f8b46be
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0017-Fix-
> the-generation-of-alignment-frags-in-code-sectio.patch
> @@ -0,0 +1,139 @@
> +From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Fri, 18 Nov 2016 11:42:48 -0800
> +Subject: [PATCH] Fix the generation of alignment frags in code sections
> for AArch64.
> +
> +PR gas/20364
> +* config/tc-aarch64.c (s_ltorg): Change the mapping state after
> +aligning the frag.
> +(aarch64_init): Treat rs_align frags in code sections as
> +containing code, not data.
> +* testsuite/gas/aarch64/pr20364.s: New test.
> +* testsuite/gas/aarch64/pr20364.d: New test driver.
> +
> +Backporting the patch from binutils mainline
> +https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=
> 7ea12e5c3ad54da440c08f32da09534e63e515ca
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> +---
> + gas/ChangeLog                       | 10 ++++++++++
> + gas/config/tc-aarch64.c             | 10 +++++++---
> + gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
> + gas/testsuite/gas/aarch64/pr20364.s | 28 ++++++++++++++++++++++++++++
> + 4 files changed, 58 insertions(+), 3 deletions(-)
> + create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
> + create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
> +
> +diff --git a/gas/ChangeLog b/gas/ChangeLog
> +index a39895a..fad06dc 100644
> +--- a/gas/ChangeLog
> ++++ b/gas/ChangeLog
> +@@ -1,3 +1,13 @@
> ++2016-08-05  Nick Clifton  <nickc@redhat.com>
> ++
> ++      PR gas/20364
> ++      * config/tc-aarch64.c (s_ltorg): Change the mapping state after
> ++      aligning the frag.
> ++      (aarch64_init): Treat rs_align frags in code sections as
> ++      containing code, not data.
> ++      * testsuite/gas/aarch64/pr20364.s: New test.
> ++      * testsuite/gas/aarch64/pr20364.d: New test driver.
> ++
> + 2016-08-03  Tristan Gingold  <gingold@adacore.com>
> +
> +       * configure: Regenerate.
> +diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
> +index ddc40f2..74933cb 100644
> +--- a/gas/config/tc-aarch64.c
> ++++ b/gas/config/tc-aarch64.c
> +@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
> +       if (pool == NULL || pool->symbol == NULL || pool->next_free_entry
> == 0)
> +       continue;
> +
> +-      mapping_state (MAP_DATA);
> +-
> +       /* Align pool as you have word accesses.
> +          Only make a frag if we have to.  */
> +       if (!need_pass_2)
> +       frag_align (align, 0, 0);
> +
> ++      mapping_state (MAP_DATA);
> ++
> +       record_alignment (now_seg, align);
> +
> +       sprintf (sym_name, "$$lit_\002%x", pool->id);
> +@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int max_chars)
> +
> +   switch (fragP->fr_type)
> +     {
> +-    case rs_align:
> +     case rs_align_test:
> +     case rs_fill:
> +       mapping_state_2 (MAP_DATA, max_chars);
> +       break;
> ++    case rs_align:
> ++      /* PR 20364: We can get alignment frags in code sections,
> ++       so do not just assume that we should use the MAP_DATA state.  */
> ++      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN : MAP_DATA,
> max_chars);
> ++      break;
> +     case rs_align_code:
> +       mapping_state_2 (MAP_INSN, max_chars);
> +       break;
> +diff --git a/gas/testsuite/gas/aarch64/pr20364.d
> b/gas/testsuite/gas/aarch64/pr20364.d
> +new file mode 100644
> +index 0000000..babcff1
> +--- /dev/null
> ++++ b/gas/testsuite/gas/aarch64/pr20364.d
> +@@ -0,0 +1,13 @@
> ++# Check that ".align <size>, <fill>" does not set the mapping state to
> DATA, causing unnecessary frag generation.
> ++#name: PR20364
> ++#objdump: -d
> ++
> ++.*:     file format .*
> ++
> ++Disassembly of section \.vectors:
> ++
> ++0+000 <.*>:
> ++   0: d2800000        mov     x0, #0x0                        // #0
> ++   4: 94000000        bl      0 <plat_report_exception>
> ++   8: 17fffffe        b       0 <bl1_exceptions>
> ++
> +diff --git a/gas/testsuite/gas/aarch64/pr20364.s
> b/gas/testsuite/gas/aarch64/pr20364.s
> +new file mode 100644
> +index 0000000..594ad7c
> +--- /dev/null
> ++++ b/gas/testsuite/gas/aarch64/pr20364.s
> +@@ -0,0 +1,28 @@
> ++ .macro vector_base label
> ++ .section .vectors, "ax"
> ++ .align 11, 0
> ++ \label:
> ++ .endm
> ++
> ++ .macro vector_entry label
> ++ .section .vectors, "ax"
> ++ .align 7, 0
> ++ \label:
> ++ .endm
> ++
> ++ .macro check_vector_size since
> ++   .if (. - \since) > (32 * 4)
> ++     .error "Vector exceeds 32 instructions"
> ++   .endif
> ++ .endm
> ++
> ++ .globl bl1_exceptions
> ++
> ++vector_base bl1_exceptions
> ++
> ++vector_entry SynchronousExceptionSP0
> ++ mov x0, #0x0
> ++ bl plat_report_exception
> ++ b SynchronousExceptionSP0
> ++ check_vector_size SynchronousExceptionSP0
> ++
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11454c641144e60541eaf1a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This is ok for master</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Nov 22, 2016 1=
:31 PM, &quot;Manjukumar Matha&quot; &lt;<a href=3D"mailto:manjukumar.harth=
ikote-matha@xilinx.com">manjukumar.harthikote-matha@xilinx.com</a>&gt; wrot=
e:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">There was bug wit=
h alignment frags for aarch64 in binutils. This is<br>
fixed in master of binutils. This patch backports the fix to binutils<br>
2.27 version.<br>
<br>
Signed-off-by: Manjukumar Matha &lt;<a href=3D"mailto:manjukumar.harthikote=
-matha@xilinx.com">manjukumar.harthikote-matha@<wbr>xilinx.com</a>&gt;<br>
Signed-off-by: Nathan Rossi &lt;<a href=3D"mailto:nathan@nathanrossi.com">n=
athan@nathanrossi.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/<wbr>binutils/binutils-2.27.inc=C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0...eration-of-alignment-frags-<wbr>in-code-sectio.patch | 139 +++++++=
++++++++++++++<br>
=C2=A02 files changed, 140 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/<wbr>binutils/binutils/0017-=
Fix-<wbr>the-generation-of-alignment-<wbr>frags-in-code-sectio.patch<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils-2.27.inc b/meta/r=
ecipes-devtools/<wbr>binutils/binutils-2.27.inc<br>
index fc81721..90518bf 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils-2.27.inc<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils-2.27.inc<br>
@@ -37,6 +37,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 file://0015-binutils-mips-gas-<wbr>pic-relax-linkonce.=
diff \<br>
=C2=A0 =C2=A0 =C2=A0 file://0015-Refine-.cfi_<wbr>sections-check-to-only-<w=
br>consider-compact-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://0016-Fix-seg-fault-in-<wbr>ARM-linker-when-tryi=
ng-to-<wbr>parse-a-b.patch \<br>
+=C2=A0 =C2=A0 =C2=A0file://0017-Fix-the-<wbr>generation-of-alignment-frags=
-<wbr>in-code-sectio.patch \<br>
=C2=A0&quot;<br>
=C2=A0S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0017-Fix-<wbr>the=
-generation-of-alignment-<wbr>frags-in-code-sectio.patch b/meta/recipes-dev=
tools/<wbr>binutils/binutils/0017-Fix-<wbr>the-generation-of-alignment-<wbr=
>frags-in-code-sectio.patch<br>
new file mode 100644<br>
index 0000000..f8b46be<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0017-Fix-<wbr>the-genera=
tion-of-alignment-<wbr>frags-in-code-sectio.patch<br>
@@ -0,0 +1,139 @@<br>
+From 4a4286465b5d6c28968bc2b29ae08d<wbr>aca7f219a3 Mon Sep 17 00:00:00 200=
1<br>
+From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com">nickc@redhat.co=
m</a>&gt;<br>
+Date: Fri, 18 Nov 2016 11:42:48 -0800<br>
+Subject: [PATCH] Fix the generation of alignment frags in code sections fo=
r AArch64.<br>
+<br>
+PR gas/20364<br>
+* config/tc-aarch64.c (s_ltorg): Change the mapping state after<br>
+aligning the frag.<br>
+(aarch64_init): Treat rs_align frags in code sections as<br>
+containing code, not data.<br>
+* testsuite/gas/aarch64/pr20364.<wbr>s: New test.<br>
+* testsuite/gas/aarch64/pr20364.<wbr>d: New test driver.<br>
+<br>
+Backporting the patch from binutils mainline<br>
+<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D=
7ea12e5c3ad54da440c08f32da09534e63e515ca" rel=3D"noreferrer" target=3D"_bla=
nk">https://sourceware.org/git/<wbr>gitweb.cgi?p=3Dbinutils-gdb.git;<wbr>h=
=3D<wbr>7ea12e5c3ad54da440c08f32da0953<wbr>4e63e515ca</a><br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Signed-off-by: Manjukumar Matha &lt;<a href=3D"mailto:manjukumar.harthikot=
e-matha@xilinx.com">manjukumar.harthikote-matha@<wbr>xilinx.com</a>&gt;<br>
+---<br>
+ gas/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++++++<br>
+ gas/config/tc-aarch64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
10 +++++++---<br>
+ gas/testsuite/gas/aarch64/<wbr>pr20364.d | 13 +++++++++++++<br>
+ gas/testsuite/gas/aarch64/<wbr>pr20364.s | 28 +++++++++++++++++++++++++++=
+<br>
+ 4 files changed, 58 insertions(+), 3 deletions(-)<br>
+ create mode 100644 gas/testsuite/gas/aarch64/<wbr>pr20364.d<br>
+ create mode 100644 gas/testsuite/gas/aarch64/<wbr>pr20364.s<br>
+<br>
+diff --git a/gas/ChangeLog b/gas/ChangeLog<br>
+index a39895a..fad06dc 100644<br>
+--- a/gas/ChangeLog<br>
++++ b/gas/ChangeLog<br>
+@@ -1,3 +1,13 @@<br>
++2016-08-05=C2=A0 Nick Clifton=C2=A0 &lt;<a href=3D"mailto:nickc@redhat.co=
m">nickc@redhat.com</a>&gt;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 PR gas/20364<br>
++=C2=A0 =C2=A0 =C2=A0 * config/tc-aarch64.c (s_ltorg): Change the mapping =
state after<br>
++=C2=A0 =C2=A0 =C2=A0 aligning the frag.<br>
++=C2=A0 =C2=A0 =C2=A0 (aarch64_init): Treat rs_align frags in code section=
s as<br>
++=C2=A0 =C2=A0 =C2=A0 containing code, not data.<br>
++=C2=A0 =C2=A0 =C2=A0 * testsuite/gas/aarch64/pr20364.<wbr>s: New test.<br=
>
++=C2=A0 =C2=A0 =C2=A0 * testsuite/gas/aarch64/pr20364.<wbr>d: New test dri=
ver.<br>
++<br>
+ 2016-08-03=C2=A0 Tristan Gingold=C2=A0 &lt;<a href=3D"mailto:gingold@adac=
ore.com">gingold@adacore.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* configure: Regenerate.<br>
+diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c<br>
+index ddc40f2..74933cb 100644<br>
+--- a/gas/config/tc-aarch64.c<br>
++++ b/gas/config/tc-aarch64.c<br>
+@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pool =3D=3D NULL || pool-&gt;symbol =3D=3D =
NULL || pool-&gt;next_free_entry =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 mapping_state (MAP_DATA);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Align pool as you have word accesses.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Only make a frag if we have to.=C2=A0 *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!need_pass_2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frag_align (align, 0, 0);<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 mapping_state (MAP_DATA);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0record_alignment (now_seg, align);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf (sym_name, &quot;$$lit_\002%x&quot;, po=
ol-&gt;id);<br>
+@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int max_chars)<b=
r>
+<br>
+=C2=A0 =C2=A0switch (fragP-&gt;fr_type)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 case rs_align:<br>
+=C2=A0 =C2=A0 =C2=A0case rs_align_test:<br>
+=C2=A0 =C2=A0 =C2=A0case rs_fill:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping_state_2 (MAP_DATA, max_chars);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 case rs_align:<br>
++=C2=A0 =C2=A0 =C2=A0 /* PR 20364: We can get alignment frags in code sect=
ions,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0so do not just assume that we should use the M=
AP_DATA state.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN =
: MAP_DATA, max_chars);<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0case rs_align_code:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping_state_2 (MAP_INSN, max_chars);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+diff --git a/gas/testsuite/gas/aarch64/<wbr>pr20364.d b/gas/testsuite/gas/=
aarch64/<wbr>pr20364.d<br>
+new file mode 100644<br>
+index 0000000..babcff1<br>
+--- /dev/null<br>
++++ b/gas/testsuite/gas/aarch64/<wbr>pr20364.d<br>
+@@ -0,0 +1,13 @@<br>
++# Check that &quot;.align &lt;size&gt;, &lt;fill&gt;&quot; does not set t=
he mapping state to DATA, causing unnecessary frag generation.<br>
++#name: PR20364<br>
++#objdump: -d<br>
++<br>
++.*:=C2=A0 =C2=A0 =C2=A0file format .*<br>
++<br>
++Disassembly of section \.vectors:<br>
++<br>
++0+000 &lt;.*&gt;:<br>
++=C2=A0 =C2=A00: d2800000=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=
=A0x0, #0x0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 // #0<br>
++=C2=A0 =C2=A04: 94000000=C2=A0 =C2=A0 =C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=
=A0 0 &lt;plat_report_exception&gt;<br>
++=C2=A0 =C2=A08: 17fffffe=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0=
 =C2=A00 &lt;bl1_exceptions&gt;<br>
++<br>
+diff --git a/gas/testsuite/gas/aarch64/<wbr>pr20364.s b/gas/testsuite/gas/=
aarch64/<wbr>pr20364.s<br>
+new file mode 100644<br>
+index 0000000..594ad7c<br>
+--- /dev/null<br>
++++ b/gas/testsuite/gas/aarch64/<wbr>pr20364.s<br>
+@@ -0,0 +1,28 @@<br>
++ .macro vector_base label<br>
++ .section .vectors, &quot;ax&quot;<br>
++ .align 11, 0<br>
++ \label:<br>
++ .endm<br>
++<br>
++ .macro vector_entry label<br>
++ .section .vectors, &quot;ax&quot;<br>
++ .align 7, 0<br>
++ \label:<br>
++ .endm<br>
++<br>
++ .macro check_vector_size since<br>
++=C2=A0 =C2=A0.if (. - \since) &gt; (32 * 4)<br>
++=C2=A0 =C2=A0 =C2=A0.error &quot;Vector exceeds 32 instructions&quot;<br>
++=C2=A0 =C2=A0.endif<br>
++ .endm<br>
++<br>
++ .globl bl1_exceptions<br>
++<br>
++vector_base bl1_exceptions<br>
++<br>
++vector_entry SynchronousExceptionSP0<br>
++ mov x0, #0x0<br>
++ bl plat_report_exception<br>
++ b SynchronousExceptionSP0<br>
++ check_vector_size SynchronousExceptionSP0<br>
++<br>
+--<br>
+2.7.4<br>
+<br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div>

--001a11454c641144e60541eaf1a0--
