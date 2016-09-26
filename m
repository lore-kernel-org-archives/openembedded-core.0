Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0C260746
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 09:32:51 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id m184so3377882qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 02:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yQoNfCMNC47bYjWEEikwPsVBEDMLUa/1yTQYNRkPg9o=;
	b=A21FKLYGkZXTCqV5kEUeUKxaZOlUSaPJkbFnFbUVlFTSCSPYV7bqa0oR4LY3/meAjx
	jHVqW12gC4CHFn/22/Q8inaXnr9Gw+upHB0IFOheO28Op//kvaNNVVF1pTy7Q8kq59b1
	OJ/4WAxDg1r92lozbKJzss3+9mdITCMhYhNz5D6e9ZnAKb+Oblnnmh1ObqAhg1wB5+Xt
	dinwGYaLfRNq5RUKU/gVjY7gPlNf0d0t+/PecKeTACW0cLJlxja6Vk/R9qv/55BYdrgP
	lZ2EdRVoVn48mF28xFvLtcArtZBxRE9TybgwgtFFZNoIsiLvXufi3UZbSjNdUeKYiVP5
	oWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yQoNfCMNC47bYjWEEikwPsVBEDMLUa/1yTQYNRkPg9o=;
	b=RkOLEQRJ9JTpz0vDDQQJR6b0hJhxIqOD8jWN2xsuIOKlyOTad+ilnXvj9+bW+PTRdO
	WZornzvZKbmZs1Z6JcUmMsmELoB4oljaw5U36rlkFB0HhFXQ6lUt+qLMfFv2jh7MK/t5
	whgiV4ktGelEkRGc90WJUES4nCpVR9eenjPsVireBRj/Op1SfEGZhY3gbrPkAB+neiVW
	A/f+sNu9mlFUtCW5XV/7b7dfPjQXtePB/WosA7D8KXBTMA1IGTF7ksW6idGMA2Hmd/A0
	JWnylsXcnMm4+17wItkAV3x8/4ZeRCi7ClXWhcK2KpbOATsZdTmzBjNx2UAHZWOkcpfA
	F9ww==
X-Gm-Message-State: AA6/9RmyMpzLeCXfNSqSvx0OQwZRJ/wQ45t9/Rg7ObOUK+S/irffU+mNMt3enw3g7S2nKLU9AVQiKm2TjHrXng==
X-Received: by 10.55.40.23 with SMTP id o23mr19822097qkh.212.1474882373172;
	Mon, 26 Sep 2016 02:32:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Mon, 26 Sep 2016 02:32:32 -0700 (PDT)
In-Reply-To: <CADyYWLnN_sDqZEg23oe1rD1ZO3GeXE76UmhJNMgzB5d1tooS7Q@mail.gmail.com>
References: <1474435062-3183-1-git-send-email-sujith.h@gmail.com>
	<CADyYWLnN_sDqZEg23oe1rD1ZO3GeXE76UmhJNMgzB5d1tooS7Q@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 26 Sep 2016 15:02:32 +0530
Message-ID: <CADyYWLkwim__nDx6N5GgxH5Hny9rzH0xCVhAhszaBke+nOcEVA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] perf: Fix to obey LD failure on qemux86-64
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
X-List-Received-Date: Mon, 26 Sep 2016 09:32:52 -0000
Content-Type: multipart/alternative; boundary=001a11440d26f04ed3053d65cfaf

--001a11440d26f04ed3053d65cfaf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2016 at 11:40 AM, sujith h <sujith.h@gmail.com> wrote:

> Hi,
>
> Let me know if we need to make any changes to this patch. If so I would b=
e
> happy to do that.
>

Sorry for my earlier mail, this patch is merged:
http://git.openembedded.org/openembedded-core/commit/?id=3D0ce06611068e74e6=
ea2e226e3f967aaa91fecd25

>
> Thanks,
> Sujith H
>
> On Wed, Sep 21, 2016 at 10:47 AM, Sujith H <sujith.h@gmail.com> wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> When built on an i686 host for qemux86-64 without the
>> fix to obey LD and it fails:
>>
>> /scratch/dogwood/toolchains/x86_64/bin/i686-pc-linux-gnu-ld:
>> Relocatable linking with relocations from format elf64-x86-64
>> (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-
>> mel-linux/perf/1.0-r9/perf-1.0/fs/fs.o)
>> to format elf32-i386 (/scratch/dogwood/perf-ld-test
>> /build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-1.0/fs/libapi-in.o=
)
>> is not supported
>>
>> This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,
>> which is -m elf32_x86_64 for x86_64. Without that, direct use of ld will
>> fail.
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>> ---
>>  meta/recipes-kernel/perf/perf.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf=
/
>> perf.bb
>> index 88e3a0a..0d104d3 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D '\
>>      ARCH=3D${ARCH} \
>>      CC=3D"${CC}" \
>>      AR=3D"${AR}" \
>> +    LD=3D"${LD}" \
>>      EXTRA_CFLAGS=3D"-ldw" \
>>      perfexecdir=3D${libexecdir} \
>>      NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEFINES} \
>> @@ -98,7 +99,6 @@ EXTRA_OEMAKE +=3D "\
>>      'infodir=3D${@os.path.relpath(infodir, prefix)}' \
>>  "
>>
>> -
>>  do_compile() {
>>         # Linux kernel build system is expected to do the right thing
>>         unset CFLAGS
>> @@ -174,6 +174,7 @@ do_configure_prepend () {
>>      if [ -e "${S}/tools/lib/api/Makefile" ]; then
>>          sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,'
>> ${S}/tools/lib/api/Makefile
>>          sed -i 's,AR =3D $(CROSS_COMPILE)ar,#AR,'
>> ${S}/tools/lib/api/Makefile
>> +        sed -i 's,LD =3D $(CROSS_COMPILE)ld,#LD,'
>> ${S}/tools/lib/api/Makefile
>>      fi
>>      if [ -e "${S}/tools/lib/subcmd/Makefile" ]; then
>>          sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,'
>> ${S}/tools/lib/subcmd/Makefile
>> --
>> 1.9.1
>>
>>
>
>
> --
> =E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
> Bangalore
> <Project>Contributor to KDE project
> <Project>Contributor to Yocto project
> http://fci.wikia.com/wiki/Anti-DRM-Campaign
> <Blog> http://sujithh.info
> C-x C-c
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--001a11440d26f04ed3053d65cfaf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Sep 26, 2016 at 11:40 AM, sujith h <span dir=3D"ltr">&lt;<a tar=
get=3D"_blank" href=3D"mailto:sujith.h@gmail.com">sujith.h@gmail.com</a>&gt=
;</span> wrote:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div d=
ir=3D"ltr"><div><div><div>Hi,<br><br></div>Let me know if we need to make a=
ny changes to this patch. If so I would be happy to do that.<br></div></div=
></div></blockquote><div><br></div><div>Sorry for my earlier mail, this pat=
ch is merged: <a href=3D"http://git.openembedded.org/openembedded-core/comm=
it/?id=3D0ce06611068e74e6ea2e226e3f967aaa91fecd25">http://git.openembedded.=
org/openembedded-core/commit/?id=3D0ce06611068e74e6ea2e226e3f967aaa91fecd25=
</a> <br></div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div dir=
=3D"ltr"><div><div><br></div>Thanks,<br></div>Sujith H<br></div><div class=
=3D"gmail_extra"><div><div class=3D"gmail-h5"><br><div class=3D"gmail_quote=
">On Wed, Sep 21, 2016 at 10:47 AM, Sujith H <span dir=3D"ltr">&lt;<a targe=
t=3D"_blank" href=3D"mailto:sujith.h@gmail.com">sujith.h@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">From: Ch=
ristopher Larson &lt;<a target=3D"_blank" href=3D"mailto:chris_larson@mento=
r.com">chris_larson@mentor.com</a>&gt;<br>
<br>
When built on an i686 host for qemux86-64 without the<br>
fix to obey LD and it fails:<br>
<br>
/scratch/dogwood/toolchains/x8<wbr>6_64/bin/i686-pc-linux-gnu-ld:<br>
Relocatable linking with relocations from format elf64-x86-64<br>
(/scratch/dogwood/perf-ld-test<wbr>/build/tmp/work/qemux86_64-<wbr>mel-linu=
x/perf/1.0-r9/perf-1.<wbr>0/fs/fs.o)<br>
to format elf32-i386 (/scratch/dogwood/perf-ld-test<wbr>/build/tmp/work/qem=
ux86_64-<wbr>mel-linux/perf/1.0-r9/perf-1.<wbr>0/fs/libapi-in.o)<br>
is not supported<br>
<br>
This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,<br>
which is -m elf32_x86_64 for x86_64. Without that, direct use of ld will fa=
il.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a target=3D"_blank" href=3D"mailto:c=
hris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
Signed-off-by: Sujith Haridasan &lt;<a target=3D"_blank" href=3D"mailto:Suj=
ith_Haridasan@mentor.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a target=3D"_blank" rel=3D"noreferrer" href=
=3D"http://perf.bb">perf<wbr>.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a target=3D"_blank" rel=3D"noreferre=
r" href=3D"http://perf.bb">per<wbr>f.bb</a> b/meta/recipes-kernel/perf/<a t=
arget=3D"_blank" rel=3D"noreferrer" href=3D"http://perf.bb">per<wbr>f.bb</a=
><br>
index 88e3a0a..0d104d3 100644<br>
--- a/meta/recipes-kernel/perf/<a target=3D"_blank" rel=3D"noreferrer" href=
=3D"http://perf.bb">per<wbr>f.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a target=3D"_blank" rel=3D"noreferrer" href=
=3D"http://perf.bb">per<wbr>f.bb</a><br>
@@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D &#39;\<br>
=C2=A0 =C2=A0 =C2=A0ARCH=3D${ARCH} \<br>
=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${CC}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0AR=3D&quot;${AR}&quot; \<br>
+=C2=A0 =C2=A0 LD=3D&quot;${LD}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0EXTRA_CFLAGS=3D&quot;-ldw&quot; \<br>
=C2=A0 =C2=A0 =C2=A0perfexecdir=3D${libexecdir} \<br>
=C2=A0 =C2=A0 =C2=A0NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEF=
INES} \<br>
@@ -98,7 +99,6 @@ EXTRA_OEMAKE +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0&#39;infodir=3D${@os.path.relpath(i<wbr>nfodir, prefix)=
}&#39; \<br>
=C2=A0&quot;<br>
<br>
-<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Linux kernel build system is expected to do t=
he right thing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS<br>
@@ -174,6 +174,7 @@ do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0if [ -e &quot;${S}/tools/lib/api/Makefile&quot; ]; then=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,CC =3D $(CROSS_COMPILE)gcc,=
#CC,&#39; ${S}/tools/lib/api/Makefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,AR =3D $(CROSS_COMPILE)ar,#=
AR,&#39; ${S}/tools/lib/api/Makefile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,LD =3D $(CROSS_COMPILE)ld,#LD,&#=
39; ${S}/tools/lib/api/Makefile<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ -e &quot;${S}/tools/lib/subcmd/Makefil<wbr>e&quot;=
 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,CC =3D $(CROSS_COMPILE)gcc,=
#CC,&#39; ${S}/tools/lib/subcmd/Makefile<br>
<span><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br></div></div><spa=
n class=3D"gmail-HOEnZb"><font color=3D"#888888">-- <br><div><div dir=3D"lt=
r"><div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=
=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=
=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br></di=
v><div>&lt;Project&gt;Contributor to Yocto project<br></div><div><a target=
=3D"_blank" href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign">http://fci=
.wikia.com/wiki/<wbr>Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a target=3D"_bl=
ank" href=3D"http://sujithh.info">http://sujithh.info</a><br></div><div>C-x=
 C-c<br></div></div></div></div></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=
=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=
=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributo=
r to KDE project<br></div><div>&lt;Project&gt;Contributor to Yocto project<=
br></div><div><a target=3D"_blank" href=3D"http://fci.wikia.com/wiki/Anti-D=
RM-Campaign">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt=
; <a target=3D"_blank" href=3D"http://sujithh.info">http://sujithh.info</a>=
<br></div><div>C-x C-c<br></div></div></div></div></div>
</div></div>

--001a11440d26f04ed3053d65cfaf--
