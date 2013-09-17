Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id C0D0960F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 11:21:25 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so4102311lab.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EHrAdO6CueXXa4Uv2t39eVRNaCXOmxt5JoPH++JVAKY=;
	b=D9/OnzDplgjwtkxfbpgZtNSUB5h/gFNOF4FnLrpNa3IfGH4Ph+YIuC0iPCsDTlLADB
	CnQdAcN87+ZsPUTDiOfbaLjw7oz7GCJYjWMsPXDWu9rxm3zLLO7xKrzg1VZDN1MrU7Mb
	jHp/OCUsN8VKIzw175h/cnfUBF9RhV+XcxhukkUpnpsFdWdnf98+I8De7yLtvn1/mho+
	cYHZ/IVJb1e77BMj6f1jcc1Q3YCCCJSHpfMPpWqi6CwtvvAiqZOw3P1/PpypuYmHLg8Q
	cK/7L9kGXcEk1W4H7KtfFPstM6qMiVZx76vC80bHGdyF848Jn05U3iEpiRa+cViodtN/
	QQmw==
MIME-Version: 1.0
X-Received: by 10.112.51.101 with SMTP id j5mr29288159lbo.17.1379416886891;
	Tue, 17 Sep 2013 04:21:26 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Tue, 17 Sep 2013 04:21:26 -0700 (PDT)
In-Reply-To: <CAMKF1srOTaNFj_vKkG1SkE9-YxVFkeVoukxW9qEkNo_s8qw--w@mail.gmail.com>
References: <1379381170-10557-1-git-send-email-cjp256@gmail.com>
	<CAMKF1srOTaNFj_vKkG1SkE9-YxVFkeVoukxW9qEkNo_s8qw--w@mail.gmail.com>
Date: Tue, 17 Sep 2013 07:21:26 -0400
Message-ID: <CABZSBQci_GqUw7nMBJWQUOgmuKKfxmjqGCqsX35ni8Dvj6DHZw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to 1.6.0
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
X-List-Received-Date: Tue, 17 Sep 2013 11:21:27 -0000
Content-Type: multipart/alternative; boundary=001a113364608a575404e692852f

--001a113364608a575404e692852f
Content-Type: text/plain; charset=ISO-8859-1

Will do, thanks.


On Tue, Sep 17, 2013 at 1:34 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi Chris
>
> On Mon, Sep 16, 2013 at 6:26 PM, Chris Patterson <cjp256@gmail.com> wrote:
> > This update also drops the following patches which appear to have been
> resolved upstream:
> > - ftd_header.patch
> > - target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
> >
>
> Thanks for the patch. I think its a tad late for 1.5 release since we
> use Qemu heavily
> but I would suggest to keep it current and submit it after the window
> for 1.6 is open after branch for 1.5 is cut out.
>
> > Signed-off-by: Chris Patterson <cjp256@gmail.com>
> > ---
> >  meta/recipes-devtools/qemu/files/fdt_header.patch  | 39 -----------
> >  ...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch | 79
> ----------------------
> >  meta/recipes-devtools/qemu/qemu.inc                |  2 +-
> >  .../qemu/{qemu_1.5.0.bb => qemu_1.6.0.bb}          | 14 ++--
> >  4 files changed, 9 insertions(+), 125 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/qemu/files/fdt_header.patch
> >  delete mode 100644
> meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
> >  rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.6.0.bb}
> (44%)
> >
> > diff --git a/meta/recipes-devtools/qemu/files/fdt_header.patch
> b/meta/recipes-devtools/qemu/files/fdt_header.patch
> > deleted file mode 100644
> > index dccfe53..0000000
> > --- a/meta/recipes-devtools/qemu/files/fdt_header.patch
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -Upstream-Status: Pending
> > -
> > -qemu: define fdt types in libfdt_env.h from qemu
> > -
> > -    * fixes
> > -    In file included from
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/libfdt.h:55:0,
> > -                     from
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/qemu-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:58:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:59:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:60:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:61:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:62:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:63:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:64:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:67:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:70:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:73:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:77:2:
> error: unknown type name 'fdt64_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:78:2:
> error: unknown type name 'fdt64_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:82:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:87:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:88:2:
> error: unknown type name 'fdt32_t'
> > -
>  /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:89:2:
> error: unknown type name 'fdt32_t'
> > -
> > -Index: qemu-1.4.0/include/libfdt_env.h
> > -===================================================================
> > ---- qemu-1.4.0.orig/include/libfdt_env.h       2013-02-15
> 23:05:35.000000000 +0000
> > -+++ qemu-1.4.0/include/libfdt_env.h    2013-04-13 14:17:27.918885225
> +0000
> > -@@ -21,6 +21,10 @@
> > -
> > - #include "qemu/bswap.h"
> > -
> > -+typedef uint16_t fdt16_t;
> > -+typedef uint32_t fdt32_t;
> > -+typedef uint64_t fdt64_t;
> > -+
> > - #ifdef HOST_WORDS_BIGENDIAN
> > - #define fdt32_to_cpu(x)  (x)
> > - #define cpu_to_fdt32(x)  (x)
> > diff --git
> a/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
> b/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
> > deleted file mode 100644
> > index 852efd1..0000000
> > ---
> a/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
> > +++ /dev/null
> > @@ -1,79 +0,0 @@
> > -Upstream-Status: Backported
> > -
> > -From dec3fc9657e0682637de4d5a29d947284d01985c Mon Sep 17 00:00:00 2001
> > -From: Richard Henderson <rth@twiddle.net>
> > -Date: Wed, 29 May 2013 12:30:51 -0700
> > -Subject: [PATCH] target-i386: Fix aflag logic for CODE64 and the 0x67
> prefix
> > -
> > -The code reorganization in commit 4a6fd938 broke handling of PREFIX_ADR.
> > -While fixing this, tidy and comment the code so that it's more obvious
> > -what's going on in setting both aflag and dflag.
> > -
> > -The TARGET_X86_64 ifdef can be eliminated because CODE64 expands to the
> > -constant zero when TARGET_X86_64 is undefined.
> > -
> > -Cc: Paolo Bonzini <pbonzini@redhat.com>
> > -Reported-by: Laszlo Ersek <lersek@redhat.com>
> > -Signed-off-by: Richard Henderson <rth@twiddle.net>
> > -Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > -Message-id: 1369855851-21400-1-git-send-email-rth@twiddle.net
> > -Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> > ----
> > - target-i386/translate.c |   30 +++++++++++++++---------------
> > - 1 file changed, 15 insertions(+), 15 deletions(-)
> > -
> > -diff --git a/target-i386/translate.c b/target-i386/translate.c
> > -index 0aeccdb..14b0298 100644
> > ---- a/target-i386/translate.c
> > -+++ b/target-i386/translate.c
> > -@@ -4677,8 +4677,6 @@ static target_ulong disas_insn(CPUX86State *env,
> DisasContext *s,
> > -     }
> > -     s->pc = pc_start;
> > -     prefixes = 0;
> > --    aflag = s->code32;
> > --    dflag = s->code32;
> > -     s->override = -1;
> > -     rex_w = -1;
> > -     rex_r = 0;
> > -@@ -4801,23 +4799,25 @@ static target_ulong disas_insn(CPUX86State
> *env, DisasContext *s,
> > -     }
> > -
> > -     /* Post-process prefixes.  */
> > --    if (prefixes & PREFIX_DATA) {
> > --        dflag ^= 1;
> > --    }
> > --    if (prefixes & PREFIX_ADR) {
> > --        aflag ^= 1;
> > --    }
> > --#ifdef TARGET_X86_64
> > -     if (CODE64(s)) {
> > --        if (rex_w == 1) {
> > --            /* 0x66 is ignored if rex.w is set */
> > --            dflag = 2;
> > -+        /* In 64-bit mode, the default data size is 32-bit.  Select
> 64-bit
> > -+           data with rex_w, and 16-bit data with 0x66; rex_w takes
> precedence
> > -+           over 0x66 if both are present.  */
> > -+        dflag = (rex_w > 0 ? 2 : prefixes & PREFIX_DATA ? 0 : 1);
> > -+        /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
> > -+        aflag = (prefixes & PREFIX_ADR ? 1 : 2);
> > -+    } else {
> > -+        /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
> > -+        dflag = s->code32;
> > -+        if (prefixes & PREFIX_DATA) {
> > -+            dflag ^= 1;
> > -         }
> > --        if (!(prefixes & PREFIX_ADR)) {
> > --            aflag = 2;
> > -+        /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
> > -+        aflag = s->code32;
> > -+        if (prefixes & PREFIX_ADR) {
> > -+            aflag ^= 1;
> > -         }
> > -     }
> > --#endif
> > -
> > -     s->prefix = prefixes;
> > -     s->aflag = aflag;
> > ---
> > -1.7.9.5
> > -
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> > index 97e9b7b..296b405 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -54,7 +54,7 @@ do_configure() {
> >         KVMOPTS="--enable-kvm"
> >      fi
> >
> > -    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir}
> --libexecdir=${libexecdir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
> > +    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir}
> --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip
> ${EXTRA_OECONF} $KVMOPTS
> >      test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x
> ${S}/target-i386/beginend_funcs.sh
> >  }
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bbb/meta/recipes-devtools/qemu/
> qemu_1.6.0.bb
> > similarity index 44%
> > rename from meta/recipes-devtools/qemu/qemu_1.5.0.bb
> > rename to meta/recipes-devtools/qemu/qemu_1.6.0.bb
> > index d6dd743..f8dbe6d 100644
> > --- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
> > +++ b/meta/recipes-devtools/qemu/qemu_1.6.0.bb
> > @@ -3,13 +3,15 @@ require qemu.inc
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac
> \
> >
>  file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
> >
> > -SRC_URI += "file://fdt_header.patch \
> > -
>  file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch \
> > -            file://target-ppc_fix_bit_extraction.patch \
> > -           "
> > +SRC_URI += "file://target-ppc_fix_bit_extraction.patch"
> >
> >  SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
> > -SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
> > -SRC_URI[sha256sum] =
> "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
> > +SRC_URI[md5sum] = "f3f39308472d629aca57a255a0c91ba9"
> > +SRC_URI[sha256sum] =
> "3132e58ada26d43b6924e8c2f07db80aa1e5022f3dcf03dee7d8bb9194b2cb48"
> >
> >  COMPATIBLE_HOST_class-target_mips64 = "null"
> > +
> > +do_install_append() {
> > +    # Prevent QA warnings about installed ${localstatedir}/run
> > +    if [ -d ${D}${localstatedir}/run ]; then rmdir
> ${D}${localstatedir}/run; fi
> > +}
> > --
> > 1.8.4.rc3
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113364608a575404e692852f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will do, thanks.<br></div><div class=3D"gmail_extra"><br><=
br><div class=3D"gmail_quote">On Tue, Sep 17, 2013 at 1:34 AM, Khem Raj <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Chris<br>
<div class=3D"im"><br>
On Mon, Sep 16, 2013 at 6:26 PM, Chris Patterson &lt;<a href=3D"mailto:cjp2=
56@gmail.com">cjp256@gmail.com</a>&gt; wrote:<br>
&gt; This update also drops the following patches which appear to have been=
 resolved upstream:<br>
&gt; - ftd_header.patch<br>
&gt; - target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch<br>
&gt;<br>
<br>
</div>Thanks for the patch. I think its a tad late for 1.5 release since we=
<br>
use Qemu heavily<br>
but I would suggest to keep it current and submit it after the window<br>
for 1.6 is open after branch for 1.5 is cut out.<br>
<div><div class=3D"h5"><br>
&gt; Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com"=
>cjp256@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-devtools/qemu/files/fdt_header.patch =A0| 39 ---------=
--<br>
&gt; =A0...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch | 79 -----------=
-----------<br>
&gt; =A0meta/recipes-devtools/qemu/qemu.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A02 +-<br>
&gt; =A0.../qemu/{<a href=3D"http://qemu_1.5.0.bb" target=3D"_blank">qemu_1=
.5.0.bb</a> =3D&gt; <a href=3D"http://qemu_1.6.0.bb" target=3D"_blank">qemu=
_1.6.0.bb</a>} =A0 =A0 =A0 =A0 =A0| 14 ++--<br>
&gt; =A04 files changed, 9 insertions(+), 125 deletions(-)<br>
&gt; =A0delete mode 100644 meta/recipes-devtools/qemu/files/fdt_header.patc=
h<br>
&gt; =A0delete mode 100644 meta/recipes-devtools/qemu/files/target-i386-Fix=
-aflag-logic-for-CODE64-and-the-0x67-.patch<br>
&gt; =A0rename meta/recipes-devtools/qemu/{<a href=3D"http://qemu_1.5.0.bb"=
 target=3D"_blank">qemu_1.5.0.bb</a> =3D&gt; <a href=3D"http://qemu_1.6.0.b=
b" target=3D"_blank">qemu_1.6.0.bb</a>} (44%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/qemu/files/fdt_header.patch b/meta/=
recipes-devtools/qemu/files/fdt_header.patch<br>
&gt; deleted file mode 100644<br>
&gt; index dccfe53..0000000<br>
&gt; --- a/meta/recipes-devtools/qemu/files/fdt_header.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,39 +0,0 @@<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -qemu: define fdt types in libfdt_env.h from qemu<br>
&gt; -<br>
&gt; - =A0 =A0* fixes<br>
&gt; - =A0 =A0In file included from /home/oe/setup-scripts/build/tmp-angstr=
om_next-uclibc/sysroots/x86_64-linux/usr/include/libfdt.h:55:0,<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/oe/setup-scripts/=
build/tmp-angstrom_next-uclibc/work/x86_64-linux/qemu-native/1.4.0-r0/qemu-=
1.4.0/hw/arm/../../device_tree.c:28:<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:58:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:59:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:60:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:61:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:62:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:63:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:64:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:67:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:70:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:73:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:77:2: error: unknown type name &#39;fdt64_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:78:2: error: unknown type name &#39;fdt64_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:82:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:87:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:88:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; - =A0 =A0/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroot=
s/x86_64-linux/usr/include/fdt.h:89:2: error: unknown type name &#39;fdt32_=
t&#39;<br>
&gt; -<br>
&gt; -Index: qemu-1.4.0/include/libfdt_env.h<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- qemu-1.4.0.orig/include/libfdt_env.h =A0 =A0 =A0 2013-02-15 23:05=
:35.000000000 +0000<br>
&gt; -+++ qemu-1.4.0/include/libfdt_env.h =A0 =A02013-04-13 14:17:27.918885=
225 +0000<br>
&gt; -@@ -21,6 +21,10 @@<br>
&gt; -<br>
&gt; - #include &quot;qemu/bswap.h&quot;<br>
&gt; -<br>
&gt; -+typedef uint16_t fdt16_t;<br>
&gt; -+typedef uint32_t fdt32_t;<br>
&gt; -+typedef uint64_t fdt64_t;<br>
&gt; -+<br>
&gt; - #ifdef HOST_WORDS_BIGENDIAN<br>
&gt; - #define fdt32_to_cpu(x) =A0(x)<br>
&gt; - #define cpu_to_fdt32(x) =A0(x)<br>
&gt; diff --git a/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-lo=
gic-for-CODE64-and-the-0x67-.patch b/meta/recipes-devtools/qemu/files/targe=
t-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 852efd1..0000000<br>
&gt; --- a/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for=
-CODE64-and-the-0x67-.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,79 +0,0 @@<br>
&gt; -Upstream-Status: Backported<br>
&gt; -<br>
&gt; -From dec3fc9657e0682637de4d5a29d947284d01985c Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.net">rth@tw=
iddle.net</a>&gt;<br>
&gt; -Date: Wed, 29 May 2013 12:30:51 -0700<br>
&gt; -Subject: [PATCH] target-i386: Fix aflag logic for CODE64 and the 0x67=
 prefix<br>
&gt; -<br>
&gt; -The code reorganization in commit 4a6fd938 broke handling of PREFIX_A=
DR.<br>
&gt; -While fixing this, tidy and comment the code so that it&#39;s more ob=
vious<br>
&gt; -what&#39;s going on in setting both aflag and dflag.<br>
&gt; -<br>
&gt; -The TARGET_X86_64 ifdef can be eliminated because CODE64 expands to t=
he<br>
&gt; -constant zero when TARGET_X86_64 is undefined.<br>
&gt; -<br>
&gt; -Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
&gt; -Reported-by: Laszlo Ersek &lt;<a href=3D"mailto:lersek@redhat.com">le=
rsek@redhat.com</a>&gt;<br>
&gt; -Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.ne=
t">rth@twiddle.net</a>&gt;<br>
&gt; -Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com"=
>pbonzini@redhat.com</a>&gt;<br>
&gt; -Message-id: <a href=3D"mailto:1369855851-21400-1-git-send-email-rth@t=
widdle.net">1369855851-21400-1-git-send-email-rth@twiddle.net</a><br>
&gt; -Signed-off-by: Anthony Liguori &lt;<a href=3D"mailto:aliguori@us.ibm.=
com">aliguori@us.ibm.com</a>&gt;<br>
&gt; ----<br>
&gt; - target-i386/translate.c | =A0 30 +++++++++++++++---------------<br>
&gt; - 1 file changed, 15 insertions(+), 15 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/target-i386/translate.c b/target-i386/translate.c<br>
&gt; -index 0aeccdb..14b0298 100644<br>
&gt; ---- a/target-i386/translate.c<br>
&gt; -+++ b/target-i386/translate.c<br>
&gt; -@@ -4677,8 +4677,6 @@ static target_ulong disas_insn(CPUX86State *env=
, DisasContext *s,<br>
&gt; - =A0 =A0 }<br>
&gt; - =A0 =A0 s-&gt;pc =3D pc_start;<br>
&gt; - =A0 =A0 prefixes =3D 0;<br>
&gt; -- =A0 =A0aflag =3D s-&gt;code32;<br>
&gt; -- =A0 =A0dflag =3D s-&gt;code32;<br>
&gt; - =A0 =A0 s-&gt;override =3D -1;<br>
&gt; - =A0 =A0 rex_w =3D -1;<br>
&gt; - =A0 =A0 rex_r =3D 0;<br>
&gt; -@@ -4801,23 +4799,25 @@ static target_ulong disas_insn(CPUX86State *e=
nv, DisasContext *s,<br>
&gt; - =A0 =A0 }<br>
&gt; -<br>
&gt; - =A0 =A0 /* Post-process prefixes. =A0*/<br>
&gt; -- =A0 =A0if (prefixes &amp; PREFIX_DATA) {<br>
&gt; -- =A0 =A0 =A0 =A0dflag ^=3D 1;<br>
&gt; -- =A0 =A0}<br>
&gt; -- =A0 =A0if (prefixes &amp; PREFIX_ADR) {<br>
&gt; -- =A0 =A0 =A0 =A0aflag ^=3D 1;<br>
&gt; -- =A0 =A0}<br>
&gt; --#ifdef TARGET_X86_64<br>
&gt; - =A0 =A0 if (CODE64(s)) {<br>
&gt; -- =A0 =A0 =A0 =A0if (rex_w =3D=3D 1) {<br>
&gt; -- =A0 =A0 =A0 =A0 =A0 =A0/* 0x66 is ignored if rex.w is set */<br>
&gt; -- =A0 =A0 =A0 =A0 =A0 =A0dflag =3D 2;<br>
&gt; -+ =A0 =A0 =A0 =A0/* In 64-bit mode, the default data size is 32-bit. =
=A0Select 64-bit<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 data with rex_w, and 16-bit data with 0x66; rex=
_w takes precedence<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 over 0x66 if both are present. =A0*/<br>
&gt; -+ =A0 =A0 =A0 =A0dflag =3D (rex_w &gt; 0 ? 2 : prefixes &amp; PREFIX_=
DATA ? 0 : 1);<br>
&gt; -+ =A0 =A0 =A0 =A0/* In 64-bit mode, 0x67 selects 32-bit addressing. =
=A0*/<br>
&gt; -+ =A0 =A0 =A0 =A0aflag =3D (prefixes &amp; PREFIX_ADR ? 1 : 2);<br>
&gt; -+ =A0 =A0} else {<br>
&gt; -+ =A0 =A0 =A0 =A0/* In 16/32-bit mode, 0x66 selects the opposite data=
 size. =A0*/<br>
&gt; -+ =A0 =A0 =A0 =A0dflag =3D s-&gt;code32;<br>
&gt; -+ =A0 =A0 =A0 =A0if (prefixes &amp; PREFIX_DATA) {<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0dflag ^=3D 1;<br>
&gt; - =A0 =A0 =A0 =A0 }<br>
&gt; -- =A0 =A0 =A0 =A0if (!(prefixes &amp; PREFIX_ADR)) {<br>
&gt; -- =A0 =A0 =A0 =A0 =A0 =A0aflag =3D 2;<br>
&gt; -+ =A0 =A0 =A0 =A0/* In 16/32-bit mode, 0x67 selects the opposite addr=
essing. =A0*/<br>
&gt; -+ =A0 =A0 =A0 =A0aflag =3D s-&gt;code32;<br>
&gt; -+ =A0 =A0 =A0 =A0if (prefixes &amp; PREFIX_ADR) {<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0aflag ^=3D 1;<br>
&gt; - =A0 =A0 =A0 =A0 }<br>
&gt; - =A0 =A0 }<br>
&gt; --#endif<br>
&gt; -<br>
&gt; - =A0 =A0 s-&gt;prefix =3D prefixes;<br>
&gt; - =A0 =A0 s-&gt;aflag =3D aflag;<br>
&gt; ---<br>
&gt; -1.7.9.5<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtoo=
ls/qemu/qemu.inc<br>
&gt; index 97e9b7b..296b405 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; +++ b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; @@ -54,7 +54,7 @@ do_configure() {<br>
&gt; =A0 =A0 =A0 =A0 KVMOPTS=3D&quot;--enable-kvm&quot;<br>
&gt; =A0 =A0 =A0fi<br>
&gt;<br>
&gt; - =A0 =A0${S}/configure --prefix=3D${prefix} --sysconfdir=3D${sysconfd=
ir} --libexecdir=3D${libexecdir} --disable-strip ${EXTRA_OECONF} $KVMOPTS<b=
r>
&gt; + =A0 =A0${S}/configure --prefix=3D${prefix} --sysconfdir=3D${sysconfd=
ir} --libexecdir=3D${libexecdir} --localstatedir=3D${localstatedir} --disab=
le-strip ${EXTRA_OECONF} $KVMOPTS<br>
&gt; =A0 =A0 =A0test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x $=
{S}/target-i386/beginend_funcs.sh<br>
&gt; =A0}<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.5.0.b=
b" target=3D"_blank">qemu_1.5.0.bb</a> b/meta/recipes-devtools/qemu/<a href=
=3D"http://qemu_1.6.0.bb" target=3D"_blank">qemu_1.6.0.bb</a><br>
&gt; similarity index 44%<br>
&gt; rename from meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.5.0.bb=
" target=3D"_blank">qemu_1.5.0.bb</a><br>
&gt; rename to meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.6.0.bb" =
target=3D"_blank">qemu_1.6.0.bb</a><br>
&gt; index d6dd743..f8dbe6d 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.5.0.bb" targ=
et=3D"_blank">qemu_1.5.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.6.0.bb" targ=
et=3D"_blank">qemu_1.6.0.bb</a><br>
&gt; @@ -3,13 +3,15 @@ require qemu.inc<br>
&gt; =A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D441c28d2cf86e15a37f=
a47e15a72fbac \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://COPYING.LIB;endline=
=3D24;md5=3Dc04def7ae38850e7d3ef548588159913&quot;<br>
&gt;<br>
&gt; -SRC_URI +=3D &quot;file://fdt_header.patch \<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0file://target-i386-Fix-aflag-logic-for-CODE64=
-and-the-0x67-.patch \<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0file://target-ppc_fix_bit_extraction.patch \<=
br>
&gt; - =A0 =A0 =A0 =A0 =A0 &quot;<br>
&gt; +SRC_URI +=3D &quot;file://target-ppc_fix_bit_extraction.patch&quot;<b=
r>
&gt;<br>
&gt; =A0SRC_URI_prepend =3D &quot;<a href=3D"http://wiki.qemu.org/download/=
qemu-${PV}.tar.bz2" target=3D"_blank">http://wiki.qemu.org/download/qemu-${=
PV}.tar.bz2</a>&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;b6f3265b8ed39d77e8f354f35cc26e16&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;b22b30ee9712568dfb4eedf76783f4a76546e1cb=
c41659b909646bcf0b4867bb&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;f3f39308472d629aca57a255a0c91ba9&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;3132e58ada26d43b6924e8c2f07db80aa1e5022f=
3dcf03dee7d8bb9194b2cb48&quot;<br>
&gt;<br>
&gt; =A0COMPATIBLE_HOST_class-target_mips64 =3D &quot;null&quot;<br>
&gt; +<br>
&gt; +do_install_append() {<br>
&gt; + =A0 =A0# Prevent QA warnings about installed ${localstatedir}/run<br=
>
&gt; + =A0 =A0if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localsta=
tedir}/run; fi<br>
&gt; +}<br>
&gt; --<br>
&gt; 1.8.4.rc3<br>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
</blockquote></div><br></div>

--001a113364608a575404e692852f--
