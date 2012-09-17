Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDaJb-0003JV-F5
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:20:40 +0200
Received: by wgbdq11 with SMTP id dq11so2288325wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 05:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=KgtOA117itcAFCh3nYirouthbckUuEWqetqolVAgrtk=;
	b=H80vQeS1bf4TJlcR0FckxH42G/kIkimMxyFUGwGNj+i0VPlmZxRL3zK/WF3w5Wg6ru
	7yJFg2igoyO2LgotBU/9H/T77MngCL/zUAsGfKtl0P+zzF7pDDe5YVFjbwpNBDCzjW1Y
	rRqRhacty0T5YOQ8X4yhll2mF+6P1QYxzjcxGuFgLpbw9WYe4AnljpvZ8BTs+XTtD7r9
	UQWBswJWxyBoFUs4cHHDNBRXw3bsKM9jtoWP43Nbk5PohKJMg1C5BiCWNVNIECpIHl0Y
	z/6Drq9DYuS4EjtigbdwcV+GIvD7pjrGjz/igIxjoUY1grv281BEDZOxHgDZkHEyRWnc
	eFug==
Received: by 10.216.24.140 with SMTP id x12mr6426051wex.101.1347883680938;
	Mon, 17 Sep 2012 05:08:00 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k20sm17570403wiv.11.2012.09.17.05.07.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 05:08:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:07:30 +0200
Message-Id: <1347883657-17529-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlCtgRPdkYvs/2TV2lvUubhuJd3SJoZR6s0uyxPzxNB6WhtkdfdvDzXz9DcvVRBhT+AtYPV
Cc: Denys Dmytriyenko <denys@ti.com>, Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][pulseaudio-updates 03/10] pulseaudio: fix typo in the patch name, pulseaudo -> pulseaudio
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 12:20:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

No PR bump is needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pulseaudio/pulseaudio_fix_for_x32.patch        |  238 ++++++++++++++++++++
 .../pulseaudio/pulseaudo_fix_for_x32.patch         |  238 --------------------
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 3 files changed, 239 insertions(+), 239 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch
new file mode 100644
index 0000000..b68ac5b
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch
@@ -0,0 +1,238 @@
+Upstream-Status: Pending
+
+This patch makes assembly syntax compatible to the x32 toolchain.
+
+This fixes these kinds of compilations errors with x32 gcc.
+| pulsecore/svolume_mmx.c: Assembler messages:
+| pulsecore/svolume_mmx.c:107: Error: `(%esi,%rdi,4)' is not a valid base/index expression
+| pulsecore/svolume_mmx.c:135: Error: `(%esi,%rdi,4)' is not a valid base/index expression
+| pulsecore/svolume_mmx.c:161: Error: `(%esi,%rdi,4)' is not a valid base/index expression
+| pulsecore/svolume_mmx.c:162: Error: `8(%esi,%rdi,4)' is not a valid base/index expression
+| pulsecore/svolume_mmx.c:180: Error: `(%esi,%rdi,4)' is not a valid base/index expression
+| pulsecore/svolume_mmx.c:210: Error: `(%esi,%rdi,4)' is not a valid base/index expression
+| pulsecore/svolume_mmx.c:244: Error: `(%esi,%rdi,4)' is not a valid base/index expression
+| pulsecore/svolume_mmx.c:245: Error: `8(%esi,%rdi,4)' is not a valid base/index expression
+| make[3]: *** [libpulsecore_1.1_la-svolume_mmx.lo] Error 1
+
+Orignally these assembly lines are written for x86_64 ABI, now they are also compatible with
+X32 ABI.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/03
+Index: pulseaudio-1.1/src/pulsecore/svolume_mmx.c
+===================================================================
+--- pulseaudio-1.1.orig/src/pulsecore/svolume_mmx.c
++++ pulseaudio-1.1/src/pulsecore/svolume_mmx.c
+@@ -107,7 +107,7 @@ static void pa_volume_s16ne_mmx(int16_t 
+         " test $1, %2                   \n\t" /* check for odd samples */
+         " je 2f                         \n\t"
+ 
+-        " movd (%1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
++        " movd (%q1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
+         " movw (%0), %w4                \n\t" /*     ..  |  p0   | */
+         " movd %4, %%mm1                \n\t"
+         VOLUME_32x16 (%%mm1, %%mm0)
+@@ -122,7 +122,7 @@ static void pa_volume_s16ne_mmx(int16_t 
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t" /* do samples in groups of 2 */
+-        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
+         VOLUME_32x16 (%%mm1, %%mm0)
+         " movd %%mm0, (%0)              \n\t" /*              .. | p1*v1 | p0*v0 | */
+@@ -135,8 +135,8 @@ static void pa_volume_s16ne_mmx(int16_t 
+         " je 6f                         \n\t"
+ 
+         "5:                             \n\t" /* do samples in groups of 4 */
+-        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+-        " movq 8(%1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
++        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq 8(%q1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
+         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
+         " movd 4(%0), %%mm3             \n\t" /*              .. |   p3  |  p2   | */
+         VOLUME_32x16 (%%mm1, %%mm0)
+@@ -180,7 +180,7 @@ static void pa_volume_s16re_mmx(int16_t 
+         " test $1, %2                   \n\t" /* check for odd samples */
+         " je 2f                         \n\t"
+ 
+-        " movd (%1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
++        " movd (%q1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
+         " movw (%0), %w4                \n\t" /*     ..  |  p0   | */
+         " rorw $8, %w4                  \n\t"
+         " movd %4, %%mm1                \n\t"
+@@ -197,7 +197,7 @@ static void pa_volume_s16re_mmx(int16_t 
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t" /* do samples in groups of 2 */
+-        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
+         SWAP_16 (%%mm1)
+         VOLUME_32x16 (%%mm1, %%mm0)
+@@ -212,8 +212,8 @@ static void pa_volume_s16re_mmx(int16_t 
+         " je 6f                         \n\t"
+ 
+         "5:                             \n\t" /* do samples in groups of 4 */
+-        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+-        " movq 8(%1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
++        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq 8(%q1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
+         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
+         " movd 4(%0), %%mm3             \n\t" /*              .. |   p3  |  p2   | */
+         SWAP_16_2 (%%mm1, %%mm3)
+Index: pulseaudio-1.1/src/pulsecore/svolume_sse.c
+===================================================================
+--- pulseaudio-1.1.orig/src/pulsecore/svolume_sse.c
++++ pulseaudio-1.1/src/pulsecore/svolume_sse.c
+@@ -92,7 +92,7 @@ static void pa_volume_s16ne_sse2(int16_t
+         " test $1, %2                   \n\t" /* check for odd samples */
+         " je 2f                         \n\t"
+ 
+-        " movd (%1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
++        " movd (%q1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
+         " movw (%0), %w4                \n\t" /*     ..  |   p0  | */
+         " movd %4, %%xmm1               \n\t"
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+@@ -107,7 +107,7 @@ static void pa_volume_s16ne_sse2(int16_t
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t" /* do samples in groups of 2 */
+-        " movq (%1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq (%q1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+         " movd (%0), %%xmm1             \n\t" /*              .. |   p1  |  p0   | */
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+         " movd %%xmm0, (%0)             \n\t" /*              .. | p1*v1 | p0*v0 | */
+@@ -123,7 +123,7 @@ static void pa_volume_s16ne_sse2(int16_t
+          * that the array is 16 bytes aligned, we probably have to do the odd values
+          * after this then. */
+         "5:                             \n\t" /* do samples in groups of 4 */
+-        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
++        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
+         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+         " movq %%xmm0, (%0)             \n\t" /*              .. | p3*v3 .. p0*v0 | */
+@@ -136,8 +136,8 @@ static void pa_volume_s16ne_sse2(int16_t
+         " je 8f                         \n\t"
+ 
+         "7:                             \n\t" /* do samples in groups of 8 */
+-        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
+-        " movdqu 16(%1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
++        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
++        " movdqu 16(%q1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
+         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
+         " movq 8(%0), %%xmm3            \n\t" /*              .. |   p7  ..  p4   | */
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+@@ -176,7 +176,7 @@ static void pa_volume_s16re_sse2(int16_t
+         " test $1, %2                   \n\t" /* check for odd samples */
+         " je 2f                         \n\t"
+ 
+-        " movd (%1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
++        " movd (%q1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
+         " movw (%0), %w4                \n\t" /*     ..  |   p0  | */
+         " rorw $8, %w4                  \n\t"
+         " movd %4, %%xmm1               \n\t"
+@@ -193,7 +193,7 @@ static void pa_volume_s16re_sse2(int16_t
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t" /* do samples in groups of 2 */
+-        " movq (%1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq (%q1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+         " movd (%0), %%xmm1             \n\t" /*              .. |   p1  |  p0   | */
+         SWAP_16 (%%xmm1)
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+@@ -211,7 +211,7 @@ static void pa_volume_s16re_sse2(int16_t
+          * that the array is 16 bytes aligned, we probably have to do the odd values
+          * after this then. */
+         "5:                             \n\t" /* do samples in groups of 4 */
+-        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
++        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
+         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
+         SWAP_16 (%%xmm1)
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+@@ -226,8 +226,8 @@ static void pa_volume_s16re_sse2(int16_t
+         " je 8f                         \n\t"
+ 
+         "7:                             \n\t" /* do samples in groups of 8 */
+-        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
+-        " movdqu 16(%1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
++        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
++        " movdqu 16(%q1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
+         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
+         " movq 8(%0), %%xmm3            \n\t" /*              .. |   p7  ..  p4   | */
+         SWAP_16_2 (%%xmm1, %%xmm3)
+Index: pulseaudio-1.1/src/pulsecore/sconv_sse.c
+===================================================================
+--- pulseaudio-1.1.orig/src/pulsecore/sconv_sse.c
++++ pulseaudio-1.1/src/pulsecore/sconv_sse.c
+@@ -54,8 +54,8 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " je 2f                         \n\t"
+ 
+         "1:                             \n\t"
+-        " movups (%2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
+-        " movups 16(%2, %0, 2), %%xmm2  \n\t"
++        " movups (%q2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
++        " movups 16(%q2, %0, 2), %%xmm2  \n\t"
+         " minps  %%xmm5, %%xmm0         \n\t" /* clamp to 1.0 */
+         " minps  %%xmm5, %%xmm2         \n\t"
+         " maxps  %%xmm6, %%xmm0         \n\t" /* clamp to -1.0 */
+@@ -72,8 +72,8 @@ static void pa_sconv_s16le_from_f32ne_ss
+ 
+         " packssdw %%mm1, %%mm0         \n\t" /* pack parts */
+         " packssdw %%mm3, %%mm2         \n\t"
+-        " movq     %%mm0, (%3, %0)      \n\t"
+-        " movq    %%mm2, 8(%3, %0)     \n\t"
++        " movq     %%mm0, (%q3, %0)      \n\t"
++        " movq    %%mm2, 8(%q3, %0)     \n\t"
+ 
+         " add $16, %0                   \n\t"
+         " dec %1                        \n\t"
+@@ -85,12 +85,12 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t"
+-        " movss (%2, %0, 2), %%xmm0     \n\t"
++        " movss (%q2, %0, 2), %%xmm0     \n\t"
+         " minss  %%xmm5, %%xmm0         \n\t"
+         " maxss  %%xmm6, %%xmm0         \n\t"
+         " mulss  %%xmm7, %%xmm0         \n\t"
+         " cvtss2si %%xmm0, %4           \n\t"
+-        " movw  %w4, (%3, %0)           \n\t"
++        " movw  %w4, (%q3, %0)           \n\t"
+         " add $2, %0                    \n\t"
+         " dec %1                        \n\t"
+         " jne 3b                        \n\t"
+@@ -119,8 +119,8 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " je 2f                         \n\t"
+ 
+         "1:                             \n\t"
+-        " movups (%2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
+-        " movups 16(%2, %0, 2), %%xmm2  \n\t"
++        " movups (%q2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
++        " movups 16(%q2, %0, 2), %%xmm2  \n\t"
+         " minps  %%xmm5, %%xmm0         \n\t" /* clamp to 1.0 */
+         " minps  %%xmm5, %%xmm2         \n\t"
+         " maxps  %%xmm6, %%xmm0         \n\t" /* clamp to -1.0 */
+@@ -132,7 +132,7 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " cvtps2dq %%xmm2, %%xmm2       \n\t"
+ 
+         " packssdw %%xmm2, %%xmm0       \n\t"
+-        " movdqu   %%xmm0, (%3, %0)     \n\t"
++        " movdqu   %%xmm0, (%q3, %0)     \n\t"
+ 
+         " add $16, %0                   \n\t"
+         " dec %1                        \n\t"
+@@ -144,12 +144,12 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t"
+-        " movss (%2, %0, 2), %%xmm0     \n\t"
++        " movss (%q2, %0, 2), %%xmm0     \n\t"
+         " minss  %%xmm5, %%xmm0         \n\t"
+         " maxss  %%xmm6, %%xmm0         \n\t"
+         " mulss  %%xmm7, %%xmm0         \n\t"
+         " cvtss2si %%xmm0, %4           \n\t"
+-        " movw  %w4, (%3, %0)           \n\t"
++        " movw  %w4, (%q3, %0)           \n\t"
+         " add $2, %0                    \n\t"
+         " dec %1                        \n\t"
+         " jne 3b                        \n\t"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
deleted file mode 100644
index b68ac5b..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
+++ /dev/null
@@ -1,238 +0,0 @@
-Upstream-Status: Pending
-
-This patch makes assembly syntax compatible to the x32 toolchain.
-
-This fixes these kinds of compilations errors with x32 gcc.
-| pulsecore/svolume_mmx.c: Assembler messages:
-| pulsecore/svolume_mmx.c:107: Error: `(%esi,%rdi,4)' is not a valid base/index expression
-| pulsecore/svolume_mmx.c:135: Error: `(%esi,%rdi,4)' is not a valid base/index expression
-| pulsecore/svolume_mmx.c:161: Error: `(%esi,%rdi,4)' is not a valid base/index expression
-| pulsecore/svolume_mmx.c:162: Error: `8(%esi,%rdi,4)' is not a valid base/index expression
-| pulsecore/svolume_mmx.c:180: Error: `(%esi,%rdi,4)' is not a valid base/index expression
-| pulsecore/svolume_mmx.c:210: Error: `(%esi,%rdi,4)' is not a valid base/index expression
-| pulsecore/svolume_mmx.c:244: Error: `(%esi,%rdi,4)' is not a valid base/index expression
-| pulsecore/svolume_mmx.c:245: Error: `8(%esi,%rdi,4)' is not a valid base/index expression
-| make[3]: *** [libpulsecore_1.1_la-svolume_mmx.lo] Error 1
-
-Orignally these assembly lines are written for x86_64 ABI, now they are also compatible with
-X32 ABI.
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/03
-Index: pulseaudio-1.1/src/pulsecore/svolume_mmx.c
-===================================================================
---- pulseaudio-1.1.orig/src/pulsecore/svolume_mmx.c
-+++ pulseaudio-1.1/src/pulsecore/svolume_mmx.c
-@@ -107,7 +107,7 @@ static void pa_volume_s16ne_mmx(int16_t 
-         " test $1, %2                   \n\t" /* check for odd samples */
-         " je 2f                         \n\t"
- 
--        " movd (%1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
-+        " movd (%q1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
-         " movw (%0), %w4                \n\t" /*     ..  |  p0   | */
-         " movd %4, %%mm1                \n\t"
-         VOLUME_32x16 (%%mm1, %%mm0)
-@@ -122,7 +122,7 @@ static void pa_volume_s16ne_mmx(int16_t 
-         " je 4f                         \n\t"
- 
-         "3:                             \n\t" /* do samples in groups of 2 */
--        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-+        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
-         VOLUME_32x16 (%%mm1, %%mm0)
-         " movd %%mm0, (%0)              \n\t" /*              .. | p1*v1 | p0*v0 | */
-@@ -135,8 +135,8 @@ static void pa_volume_s16ne_mmx(int16_t 
-         " je 6f                         \n\t"
- 
-         "5:                             \n\t" /* do samples in groups of 4 */
--        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
--        " movq 8(%1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
-+        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-+        " movq 8(%q1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
-         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
-         " movd 4(%0), %%mm3             \n\t" /*              .. |   p3  |  p2   | */
-         VOLUME_32x16 (%%mm1, %%mm0)
-@@ -180,7 +180,7 @@ static void pa_volume_s16re_mmx(int16_t 
-         " test $1, %2                   \n\t" /* check for odd samples */
-         " je 2f                         \n\t"
- 
--        " movd (%1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
-+        " movd (%q1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
-         " movw (%0), %w4                \n\t" /*     ..  |  p0   | */
-         " rorw $8, %w4                  \n\t"
-         " movd %4, %%mm1                \n\t"
-@@ -197,7 +197,7 @@ static void pa_volume_s16re_mmx(int16_t 
-         " je 4f                         \n\t"
- 
-         "3:                             \n\t" /* do samples in groups of 2 */
--        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-+        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
-         SWAP_16 (%%mm1)
-         VOLUME_32x16 (%%mm1, %%mm0)
-@@ -212,8 +212,8 @@ static void pa_volume_s16re_mmx(int16_t 
-         " je 6f                         \n\t"
- 
-         "5:                             \n\t" /* do samples in groups of 4 */
--        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
--        " movq 8(%1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
-+        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-+        " movq 8(%q1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
-         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
-         " movd 4(%0), %%mm3             \n\t" /*              .. |   p3  |  p2   | */
-         SWAP_16_2 (%%mm1, %%mm3)
-Index: pulseaudio-1.1/src/pulsecore/svolume_sse.c
-===================================================================
---- pulseaudio-1.1.orig/src/pulsecore/svolume_sse.c
-+++ pulseaudio-1.1/src/pulsecore/svolume_sse.c
-@@ -92,7 +92,7 @@ static void pa_volume_s16ne_sse2(int16_t
-         " test $1, %2                   \n\t" /* check for odd samples */
-         " je 2f                         \n\t"
- 
--        " movd (%1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
-+        " movd (%q1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
-         " movw (%0), %w4                \n\t" /*     ..  |   p0  | */
-         " movd %4, %%xmm1               \n\t"
-         VOLUME_32x16 (%%xmm1, %%xmm0)
-@@ -107,7 +107,7 @@ static void pa_volume_s16ne_sse2(int16_t
-         " je 4f                         \n\t"
- 
-         "3:                             \n\t" /* do samples in groups of 2 */
--        " movq (%1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-+        " movq (%q1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-         " movd (%0), %%xmm1             \n\t" /*              .. |   p1  |  p0   | */
-         VOLUME_32x16 (%%xmm1, %%xmm0)
-         " movd %%xmm0, (%0)             \n\t" /*              .. | p1*v1 | p0*v0 | */
-@@ -123,7 +123,7 @@ static void pa_volume_s16ne_sse2(int16_t
-          * that the array is 16 bytes aligned, we probably have to do the odd values
-          * after this then. */
-         "5:                             \n\t" /* do samples in groups of 4 */
--        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
-+        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
-         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
-         VOLUME_32x16 (%%xmm1, %%xmm0)
-         " movq %%xmm0, (%0)             \n\t" /*              .. | p3*v3 .. p0*v0 | */
-@@ -136,8 +136,8 @@ static void pa_volume_s16ne_sse2(int16_t
-         " je 8f                         \n\t"
- 
-         "7:                             \n\t" /* do samples in groups of 8 */
--        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
--        " movdqu 16(%1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
-+        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
-+        " movdqu 16(%q1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
-         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
-         " movq 8(%0), %%xmm3            \n\t" /*              .. |   p7  ..  p4   | */
-         VOLUME_32x16 (%%xmm1, %%xmm0)
-@@ -176,7 +176,7 @@ static void pa_volume_s16re_sse2(int16_t
-         " test $1, %2                   \n\t" /* check for odd samples */
-         " je 2f                         \n\t"
- 
--        " movd (%1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
-+        " movd (%q1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
-         " movw (%0), %w4                \n\t" /*     ..  |   p0  | */
-         " rorw $8, %w4                  \n\t"
-         " movd %4, %%xmm1               \n\t"
-@@ -193,7 +193,7 @@ static void pa_volume_s16re_sse2(int16_t
-         " je 4f                         \n\t"
- 
-         "3:                             \n\t" /* do samples in groups of 2 */
--        " movq (%1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-+        " movq (%q1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
-         " movd (%0), %%xmm1             \n\t" /*              .. |   p1  |  p0   | */
-         SWAP_16 (%%xmm1)
-         VOLUME_32x16 (%%xmm1, %%xmm0)
-@@ -211,7 +211,7 @@ static void pa_volume_s16re_sse2(int16_t
-          * that the array is 16 bytes aligned, we probably have to do the odd values
-          * after this then. */
-         "5:                             \n\t" /* do samples in groups of 4 */
--        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
-+        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
-         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
-         SWAP_16 (%%xmm1)
-         VOLUME_32x16 (%%xmm1, %%xmm0)
-@@ -226,8 +226,8 @@ static void pa_volume_s16re_sse2(int16_t
-         " je 8f                         \n\t"
- 
-         "7:                             \n\t" /* do samples in groups of 8 */
--        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
--        " movdqu 16(%1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
-+        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
-+        " movdqu 16(%q1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
-         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
-         " movq 8(%0), %%xmm3            \n\t" /*              .. |   p7  ..  p4   | */
-         SWAP_16_2 (%%xmm1, %%xmm3)
-Index: pulseaudio-1.1/src/pulsecore/sconv_sse.c
-===================================================================
---- pulseaudio-1.1.orig/src/pulsecore/sconv_sse.c
-+++ pulseaudio-1.1/src/pulsecore/sconv_sse.c
-@@ -54,8 +54,8 @@ static void pa_sconv_s16le_from_f32ne_ss
-         " je 2f                         \n\t"
- 
-         "1:                             \n\t"
--        " movups (%2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
--        " movups 16(%2, %0, 2), %%xmm2  \n\t"
-+        " movups (%q2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
-+        " movups 16(%q2, %0, 2), %%xmm2  \n\t"
-         " minps  %%xmm5, %%xmm0         \n\t" /* clamp to 1.0 */
-         " minps  %%xmm5, %%xmm2         \n\t"
-         " maxps  %%xmm6, %%xmm0         \n\t" /* clamp to -1.0 */
-@@ -72,8 +72,8 @@ static void pa_sconv_s16le_from_f32ne_ss
- 
-         " packssdw %%mm1, %%mm0         \n\t" /* pack parts */
-         " packssdw %%mm3, %%mm2         \n\t"
--        " movq     %%mm0, (%3, %0)      \n\t"
--        " movq    %%mm2, 8(%3, %0)     \n\t"
-+        " movq     %%mm0, (%q3, %0)      \n\t"
-+        " movq    %%mm2, 8(%q3, %0)     \n\t"
- 
-         " add $16, %0                   \n\t"
-         " dec %1                        \n\t"
-@@ -85,12 +85,12 @@ static void pa_sconv_s16le_from_f32ne_ss
-         " je 4f                         \n\t"
- 
-         "3:                             \n\t"
--        " movss (%2, %0, 2), %%xmm0     \n\t"
-+        " movss (%q2, %0, 2), %%xmm0     \n\t"
-         " minss  %%xmm5, %%xmm0         \n\t"
-         " maxss  %%xmm6, %%xmm0         \n\t"
-         " mulss  %%xmm7, %%xmm0         \n\t"
-         " cvtss2si %%xmm0, %4           \n\t"
--        " movw  %w4, (%3, %0)           \n\t"
-+        " movw  %w4, (%q3, %0)           \n\t"
-         " add $2, %0                    \n\t"
-         " dec %1                        \n\t"
-         " jne 3b                        \n\t"
-@@ -119,8 +119,8 @@ static void pa_sconv_s16le_from_f32ne_ss
-         " je 2f                         \n\t"
- 
-         "1:                             \n\t"
--        " movups (%2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
--        " movups 16(%2, %0, 2), %%xmm2  \n\t"
-+        " movups (%q2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
-+        " movups 16(%q2, %0, 2), %%xmm2  \n\t"
-         " minps  %%xmm5, %%xmm0         \n\t" /* clamp to 1.0 */
-         " minps  %%xmm5, %%xmm2         \n\t"
-         " maxps  %%xmm6, %%xmm0         \n\t" /* clamp to -1.0 */
-@@ -132,7 +132,7 @@ static void pa_sconv_s16le_from_f32ne_ss
-         " cvtps2dq %%xmm2, %%xmm2       \n\t"
- 
-         " packssdw %%xmm2, %%xmm0       \n\t"
--        " movdqu   %%xmm0, (%3, %0)     \n\t"
-+        " movdqu   %%xmm0, (%q3, %0)     \n\t"
- 
-         " add $16, %0                   \n\t"
-         " dec %1                        \n\t"
-@@ -144,12 +144,12 @@ static void pa_sconv_s16le_from_f32ne_ss
-         " je 4f                         \n\t"
- 
-         "3:                             \n\t"
--        " movss (%2, %0, 2), %%xmm0     \n\t"
-+        " movss (%q2, %0, 2), %%xmm0     \n\t"
-         " minss  %%xmm5, %%xmm0         \n\t"
-         " maxss  %%xmm6, %%xmm0         \n\t"
-         " mulss  %%xmm7, %%xmm0         \n\t"
-         " cvtss2si %%xmm0, %4           \n\t"
--        " movw  %w4, (%3, %0)           \n\t"
-+        " movw  %w4, (%q3, %0)           \n\t"
-         " add $2, %0                    \n\t"
-         " dec %1                        \n\t"
-         " jne 3b                        \n\t"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index d2ed3c8..02d4180 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -8,7 +8,7 @@ inherit gettext perlnative
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
   file://volatiles.04_pulse \
-  file://pulseaudo_fix_for_x32.patch \
+  file://pulseaudio_fix_for_x32.patch \
 "
 
 SRC_URI[md5sum] = "17d21df798cee407b769c6355fae397a"
-- 
1.7.7.6



