Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D79E76806
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:41:57 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r128so10435273qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 06:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H5KpIwh0C+floqQRNpg59YgxURhyCHuBdF+kytupDR0=;
	b=INsq8T5dRW5Ugs1tO+VaaHv9SsqpZ5qHA5Vjr/lS+D/ZNkMX5SeqHi2gsd3QZNCwmo
	99TcfEUaS2t07iCx+TxikzrDIjt8nxyg1372fysB1tkB26p32DE6WiuNm4mMzx5p0WHZ
	/FMY52+0sj0gHgesge4/EZHIXo2OVeIvgGwIuqwoVHoMhxySX8DQt2OAVeKNuhY67gbQ
	6zOJdmXynKSuqtukJJ4/423rZI4CMXrPBBpxFldlfuJ1Pq/xliL7r4cr4HIqoGb8BDiU
	5hpPC1UMMTMv1ptDsDtXeXBOgCaxTkEbbY/eOMU18Avo/kt/r/Hevuu1CqOS5cEsnr36
	S7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H5KpIwh0C+floqQRNpg59YgxURhyCHuBdF+kytupDR0=;
	b=kN6ixBq7xdeO/6At3506um2NMc87nfp6/5jpqzJwAKSMIO9HkaikHFsFT3+1zVwpbX
	oPgx9axlyD2M7ZSzCVuFCh8w5iZSWUi4xMpID8Rht6doC71uP/2sGvUICnxo1lQn5n1b
	sJQAqRPlYVbkHW7FubuXYr7lfeMyTUxOGH/dHA6mXw8hs/lUeUYdh221D4uU/GnC82wo
	kAyR02wKrCBPvz2Il7fKLC6vX3fGWH5lLfNdqblw5SFYfsun1V2eNcPZxauRgGC2jp1i
	Z30mJ5MrD+lAwQywcUMDg51RjxycVY3eF2E8uzqqpG0f4jfN68bzh+b4uagEsl/Q4HAd
	zGQA==
X-Gm-Message-State: AEkoouu49LZFPMbFzYe8Nss3x+4jQrErvmjOKYUdNigv3hIc9/mOw4JQtt+cbWSrBYWUYIVJLGd3LAcRCosmzQ==
X-Received: by 10.55.190.68 with SMTP id o65mr28227448qkf.92.1471959718650;
	Tue, 23 Aug 2016 06:41:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Tue, 23 Aug 2016 06:41:58 -0700 (PDT)
In-Reply-To: <CADkTA4NU-X9mif2cK03piq+6YyrGtw8ak-A9ysfvwrUu3eVX3Q@mail.gmail.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<d703e7a1226ccde6956de23fc1b04a7fa00c5086.1471936926.git-series.jeremy.rosen@smile.fr>
	<CADkTA4NU-X9mif2cK03piq+6YyrGtw8ak-A9ysfvwrUu3eVX3Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Aug 2016 09:41:58 -0400
Message-ID: <CADkTA4OTbF_nTfz7Afi33mDX2yBe7SVC+DXA7NAH9tme=RZ7aA@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] [linux-yocto] allow overriding compiler name in KConfig
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
X-List-Received-Date: Tue, 23 Aug 2016 13:42:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c043be2276816053abd54a7

--94eb2c043be2276816053abd54a7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 9:36 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Tue, Aug 23, 2016 at 3:25 AM, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smi=
le.fr>
> wrote:
>
>> The KConfig infrastructure hardwires the compiler name to gcc, which
>> breaks
>> the BUILD_CC feature. This is needed even when cross compiling because
>> make *config rely on the kconfig infrastructure
>>
>
> Can you elaborate ? I'm not aware of any issues with either the host
> builds or
> target builds with the kernel.
>

Aha. I found the 0/N for the series.

And my answer is still the same. These belong upstream, and since the
kernel is fairly
picky about the compiler and compiler versions, I don't see a pressing need
to carry
something like this until it makes it into the mainline kernel.

My answer to 'can't assume the name of gcc', is to make sure that your
environment
and path is fully understood, and make your compiler available as 'gcc',
versus trying
to patch multiple recipes.

Cheers,

Bruce


>
> If there's an issue, we need to fix it upstream .. not here.
>
>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto.inc
>>                                |  4 ++++
>>  meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding
>> -host-compiler-name-from-environment.patch | 32
>> ++++++++++++++++++++++++++++++++
>>  2 files changed, 36 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-kernel/linux/linu
>> x-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 98a48ec..63c1531 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -58,3 +58,7 @@ do_install_append(){
>>  addtask kernel_link_images after do_compile before do_install
>>  addtask validate_branches before do_patch after do_kernel_checkout
>>  addtask kernel_configcheck after do_configure before do_compile
>> +
>> +SRC_URI_append =3D " file://0001-Allow-overriding-h
>> ost-compiler-name-from-environment.patch"
>>
>
> We don't carry patches to linux-yocto like this, they are sent to the
> linux-yocto mailing list, and
> integrated into the tree itself.
>
> Bruce
>
>
>> +export HOSTCC =3D "${BUILD_CC}"
>> +export HOSTCXX =3D "${BUILD_CXX}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-Allow-overridin
>> g-host-compiler-name-from-environment.patch
>> b/meta/recipes-kernel/linux/linux-
>
> yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
>> new file mode 100644
>> index 0000000..6fcfbc8
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto/0001-Allow-overridin
>> g-host-compiler-name-from-environment.patch
>> @@ -0,0 +1,32 @@
>> +From 0ce4c4f29b5d456a7707e870c7affe524f7c8807 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9my=3D20Rosen?=3D <jeremy.rosen@=
smile.fr>
>> +Date: Tue, 16 Aug 2016 22:39:29 +0200
>> +Subject: [PATCH] Allow overriding host-compiler name from environment
>> + variables
>> +
>> +---
>> + Makefile | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 70dea02..1f0d2d2 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -295,10 +295,10 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; the=
n
>> echo $$BASH; \
>> +         else if [ -x /bin/bash ]; then echo /bin/bash; \
>> +         else echo sh; fi ; fi)
>> +
>> +-HOSTCC       =3D gcc
>> +-HOSTCXX      =3D g++
>> +-HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2
>> -fomit-frame-pointer -std=3Dgnu89
>> +-HOSTCXXFLAGS =3D -O2
>> ++HOSTCC       ?=3D gcc
>> ++HOSTCXX      ?=3D g++
>> ++HOSTCFLAGS   ?=3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2
>> -fomit-frame-pointer -std=3Dgnu89
>> ++HOSTCXXFLAGS ?=3D -O2
>> +
>> + ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
>> + HOSTCFLAGS  +=3D -Wno-unused-value -Wno-unused-parameter \
>> +--
>> +2.8.1
>> +
>> --
>> git-series 0.8.9
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c043be2276816053abd54a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Aug 23, 2016 at 9:36 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span c=
lass=3D"">On Tue, Aug 23, 2016 at 3:25 AM, J=C3=A9r=C3=A9my Rosen <span dir=
=3D"ltr">&lt;<a href=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jer=
emy.rosen@smile.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
The KConfig infrastructure hardwires the compiler name to gcc, which breaks=
<br>
the BUILD_CC feature. This is needed even when cross compiling because<br>
make *config rely on the kconfig infrastructure<br></blockquote><div><br></=
div></span><div>Can you elaborate ? I&#39;m not aware of any issues with ei=
ther the host builds or<br></div><div>target builds with the kernel.<br></d=
iv></div></div></div></div></blockquote><div><br></div><div>Aha. I found th=
e 0/N for the series.<br><br></div><div>And my answer is still the same. Th=
ese belong upstream, and since the kernel is fairly<br></div><div>picky abo=
ut the compiler and compiler versions, I don&#39;t see a pressing need to c=
arry<br></div><div>something like this until it makes it into the mainline =
kernel.<br><br></div><div>My answer to &#39;can&#39;t assume the name of gc=
c&#39;, is to make sure that your environment<br></div><div>and path is ful=
ly understood, and make your compiler available as &#39;gcc&#39;, versus tr=
ying<br></div><div>to patch multiple recipes.<br><br></div><div>Cheers,<br>=
<br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr"><div><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><div><br></div><div>If there&#39;s an issue, we need to fix it upstream=
 .. not here.<br></div><span class=3D""><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
---<br>
=C2=A0meta/recipes-kernel/linux/lin<wbr>ux-yocto.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
=C2=A0meta/recipes-kernel/linux/lin<wbr>ux-yocto/0001-Allow-overriding<wbr>=
-host-compiler-name-from-<wbr>environment.patch | 32 ++++++++++++++++++++++=
++++++++<wbr>++<br>
=C2=A02 files changed, 36 insertions(+), 0 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/linu<wbr>x-yocto/0001-Al=
low-overriding-<wbr>host-compiler-name-from-<wbr>environment.patch<br>
<br>
diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc b/meta/recipes-=
kernel/linux/li<wbr>nux-yocto.inc<br>
index 98a48ec..63c1531 100644<br>
--- a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
@@ -58,3 +58,7 @@ do_install_append(){<br>
=C2=A0addtask kernel_link_images after do_compile before do_install<br>
=C2=A0addtask validate_branches before do_patch after do_kernel_checkout<br=
>
=C2=A0addtask kernel_configcheck after do_configure before do_compile<br>
+<br>
+SRC_URI_append =3D &quot; file://0001-Allow-overriding-h<wbr>ost-compiler-=
name-from-environ<wbr>ment.patch&quot;<br></blockquote><div><br></div></spa=
n><div>We don&#39;t carry patches to linux-yocto like this, they are sent t=
o the linux-yocto mailing list, and<br></div><div>integrated into the tree =
itself.<br><br></div><div>Bruce<br></div><div><div class=3D"h5"><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
+export HOSTCC =3D &quot;${BUILD_CC}&quot;<br>
+export HOSTCXX =3D &quot;${BUILD_CXX}&quot;<br>
diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto/0001-Allow-overridi=
n<wbr>g-host-compiler-name-from-<wbr>environment.patch b/meta/recipes-kerne=
l/linux/li<wbr>nux-</blockquote><div></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">y=
octo/0001-Allow-overriding-<wbr>host-compiler-name-from-<wbr>environment.pa=
tch<br>
new file mode 100644<br>
index 0000000..6fcfbc8<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto/0001-Allow-overridin<wbr>g=
-host-compiler-name-from-<wbr>environment.patch<br>
@@ -0,0 +1,32 @@<br>
+From 0ce4c4f29b5d456a7707e870c7affe<wbr>524f7c8807 Mon Sep 17 00:00:00 200=
1<br>
+From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9my=3D20R<wbr>osen?=3D &lt;<a href=
=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile.fr</=
a>&gt;<br>
+Date: Tue, 16 Aug 2016 22:39:29 +0200<br>
+Subject: [PATCH] Allow overriding host-compiler name from environment<br>
+ variables<br>
+<br>
+---<br>
+ Makefile | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 70dea02..1f0d2d2 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -295,10 +295,10 @@ CONFIG_SHELL :=3D $(shell if [ -x &quot;$$BASH&quot;=
 ]; then echo $$BASH; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if [ -x /bin/bash ]; then echo /bin=
/bash; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else echo sh; fi ; fi)<br>
+<br>
+-HOSTCC=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D gcc<br>
+-HOSTCXX=C2=A0 =C2=A0 =C2=A0 =3D g++<br>
+-HOSTCFLAGS=C2=A0 =C2=A0=3D -Wall -Wmissing-prototypes -Wstrict-prototypes=
 -O2 -fomit-frame-pointer -std=3Dgnu89<br>
+-HOSTCXXFLAGS =3D -O2<br>
++HOSTCC=C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D gcc<br>
++HOSTCXX=C2=A0 =C2=A0 =C2=A0 ?=3D g++<br>
++HOSTCFLAGS=C2=A0 =C2=A0?=3D -Wall -Wmissing-prototypes -Wstrict-prototype=
s -O2 -fomit-frame-pointer -std=3Dgnu89<br>
++HOSTCXXFLAGS ?=3D -O2<br>
+<br>
+ ifeq ($(shell $(HOSTCC) -v 2&gt;&amp;1 | grep -c &quot;clang version&quot=
;), 1)<br>
+ HOSTCFLAGS=C2=A0 +=3D -Wno-unused-value -Wno-unused-parameter \<br>
+--<br>
+2.8.1<br>
+<br>
<span><font color=3D"#888888">--<br>
git-series 0.8.9<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div></div></div><span class=3D"HOEnZb"><font c=
olor=3D"#888888"><br><br clear=3D"all"><br>-- <br><div data-smartmail=3D"gm=
ail_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and =
madness await thee at its end&quot;</div>
</font></span></div></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--94eb2c043be2276816053abd54a7--
