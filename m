Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6877839C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 11:06:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f4so6346164wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 04:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OHSkK00afeImn2H3N6SpmsOgGwHKbjv1VyKLmMeBHpc=;
	b=JGH1E75l7UjnXA3PgCS7U2cifcqE1O/TY20vUmhlfTrRIadZ/yRuiSeCOPPiY4sxNY
	PDItFX1PCleMlgymskfQ2+dcs5eO+/AUOmYtoxKmm0ZFVZlwPTbkrWMXE60LSG9KaI/e
	nNC+Nzt24iTrMoTzlsdiMDDpuek2Ib0ROQupgldw0KSeLT3+QDj1Jka79NsL6eZPsrmq
	Us9SZ9xU/4u2IyhSGOq4kwfKP4deNJhcdciVrzmfN+gMHbOyYmfn0cnXv2jZRpTEwDOQ
	fqbEbcZY25r9HJtIVXqkt+RTlAA4LDbbfRFcYCETKFAow3JpyYOJ2TlT1kNa74VqQ5Ju
	xWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OHSkK00afeImn2H3N6SpmsOgGwHKbjv1VyKLmMeBHpc=;
	b=cT+VqJB92LTGerjVNFMPjtJp+cR3Y8BwyslzL7RdK/9ltPkPbg8NvnuniXs2q/Jr2b
	/fdV0RjWHlR6pNR222c3wwIG6TYFY8f3PicBEhGZcWvuQ52was7g8Djb4cxqVXizm7vN
	5OL+zqZyn0jAYPvHhZ56FB3Muuhkj0JWwLIOWHswqKhUNf5ETvDZkzp9CIVP7kjmT2Xz
	5KWHZghkqLjF54dikDAGEZ0igzlfIU1qNYmv8zs2x6OKB6cj5c7N8MppXGKiX15xgYPl
	XLAIhj+Fvct3rsbxZFBbiPfMspUepom2GEBIqq1uOVo9waQOmZiwd3YaqTgYW1vc6jmJ
	o1Iw==
X-Gm-Message-State: AHPjjUjeAgToANWQmMiqxDjy7QxTwlNIbC1tdBlxBeG+3ZDut4vrxyxd
	ikuQDx/ryvzzqv1IXfsx+GXhvjqNfXi52qdBWs78FA==
X-Google-Smtp-Source: AOwi7QA9JpBvGhXBYvvxdQJOdz+cA6RydDk6ESAC5ZOuUGfAXaBBGX3rDA3hppi7Q7Ho5LwJ1LbcQwmLM7R6wtb5PQg=
X-Received: by 10.28.45.14 with SMTP id t14mr6627032wmt.50.1505646366199; Sun,
	17 Sep 2017 04:06:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Sun, 17 Sep 2017 04:06:05 -0700 (PDT)
In-Reply-To: <CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 17 Sep 2017 13:06:05 +0200
Message-ID: <CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Sun, 17 Sep 2017 11:06:06 -0000
Content-Type: multipart/alternative; boundary="001a11423646d0926b0559609cd1"

--001a11423646d0926b0559609cd1
Content-Type: text/plain; charset="UTF-8"

I've verified that u-boot-fw-utils builds and installs fw_printenv
correctly with 2017.07.

And that u-boot-fw-utils-cross was broken even with Yocto 2.3 Pyro
and 2017.01 version there, maybe it's time to remove cross version? As
nobody is using it and it's not tested?

On Sun, Sep 17, 2017 at 11:18 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Is anyone seeing u-boot-fw-utils.do_install failure with this?
>
> u-boot-fw-utils/1_2017.09-r0/git/tools/env/fw_printenv: No such file or
> directory
>
> I've tried u-boot-fw-utils-cross, but it fails as well even sooner in
> do_compile:
>
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 32 ARCH=arm CC=gcc  -isystemwork/x86_64-linux/u-
> boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/include -O2
> -pipe -Lwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/lib
> -Lwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib
> -Wl,-rpath-link,work/x86_64-linux/u-boot-fw-utils-cross/1_
> 2017.09-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link,work/x86_64-
> linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib
> -Wl,-rpath,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.
> 09-r0/recipe-sysroot-native/usr/lib -Wl,-rpath,work/x86_64-linux/
> u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib -Wl,-O1 V=1
> rpi_3_32b_config
> | make -f ./scripts/Makefile.build obj=scripts/basic
> |   cc -Wp,-MD,scripts/basic/.fixdep.d -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer      -o scripts/basic/fixdep scripts/basic/fixdep.c
> | /bin/sh: 1: cc: not found
> | make[1]: *** [scripts/basic/fixdep] Error 127
> | make: *** [scripts_basic] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/temp/
> log.do_compile.12859)
> ERROR: Task (virtual:cross:oe-core/meta/recipes-bsp/u-boot/u-boot-fw-
> utils_2017.09.bb:do_compile) failed with exit code '1'
>
>
> On Mon, Sep 11, 2017 at 10:30 PM, Otavio Salvador <otavio@ossystems.com.br
> > wrote:
>
>> This upgrades the U-Boot to the 2017.09 release.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>  .../u-boot/{u-boot-common_2017.07.inc => u-boot-common_2017.09.inc}
>>  | 2 +-
>>  .../u-boot/{u-boot-fw-utils_2017.07.bb => u-boot-fw-utils_2017.09.bb}
>>  | 0
>>  .../u-boot/{u-boot-mkimage_2017.07.bb => u-boot-mkimage_2017.09.bb}
>>  | 0
>>  meta/recipes-bsp/u-boot/{u-boot_2017.07.bb => u-boot_2017.09.bb}
>> | 0
>>  4 files changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.07.inc =>
>> u-boot-common_2017.09.inc} (89%)
>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.07.bb =>
>> u-boot-fw-utils_2017.09.bb} (100%)
>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.07.bb =>
>> u-boot-mkimage_2017.09.bb} (100%)
>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.07.bb => u-boot_2017.09.bb}
>> (100%)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>> b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
>> similarity index 89%
>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
>> index e37f5fd409..02e51242cb 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
>> @@ -7,7 +7,7 @@ PE = "1"
>>
>>  # We use the revision in order to avoid having to fetch it from the
>>  # repo during parse
>> -SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
>> +SRCREV = "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
>>
>>  SRC_URI = "git://git.denx.de/u-boot.git \
>>      file://MPC8315ERDB-enable-DHCP.patch \
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
>> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
>> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
>> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.07.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2017.09.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot_2017.07.bb
>> rename to meta/recipes-bsp/u-boot/u-boot_2017.09.bb
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a11423646d0926b0559609cd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve verified that u-boot-fw-utils builds and installs=
 fw_printenv correctly with 2017.07.<div><br></div><div>And that u-boot-fw-=
utils-cross was broken even with Yocto 2.3 Pyro and=C2=A02017.01 version th=
ere, maybe it&#39;s time to remove cross version? As nobody is using it and=
 it&#39;s not tested?</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Sun, Sep 17, 2017 at 11:18 AM, Martin Jansa <span dir=
=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">ma=
rtin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr">Is anyone seeing u-boot-fw-utils.do_install failure with=
 this?<div><br><div><div>u-boot-fw-utils/1_2017.09-r0/<wbr>git/tools/env/fw=
_printenv: No such file or directory</div></div><div><br></div></div><div>I=
&#39;ve tried u-boot-fw-utils-cross, but it fails as well even sooner in do=
_compile:</div><div><br></div><div><div>Log data follows:</div><div>| DEBUG=
: Executing shell function do_compile</div><div>| NOTE: make -j 32 ARCH=3Da=
rm CC=3Dgcc=C2=A0 -isystemwork/x86_64-linux/u-<wbr>boot-fw-utils-cross/1_20=
17.09-<wbr>r0/recipe-sysroot-native/usr/<wbr>include -O2 -pipe -Lwork/x86_6=
4-linux/u-boot-fw-<wbr>utils-cross/1_2017.09-r0/<wbr>recipe-sysroot-native/=
usr/lib -Lwork/x86_64-linux/u-boot-fw-<wbr>utils-cross/1_2017.09-r0/<wbr>re=
cipe-sysroot-native/lib -Wl,-rpath-link,work/x86_64-<wbr>linux/u-boot-fw-ut=
ils-cross/1_<wbr>2017.09-r0/recipe-sysroot-<wbr>native/usr/lib -Wl,-rpath-l=
ink,work/x86_64-<wbr>linux/u-boot-fw-utils-cross/1_<wbr>2017.09-r0/recipe-s=
ysroot-<wbr>native/lib -Wl,-rpath,work/x86_64-linux/<wbr>u-boot-fw-utils-cr=
oss/1_2017.<wbr>09-r0/recipe-sysroot-native/<wbr>usr/lib -Wl,-rpath,work/x8=
6_64-linux/<wbr>u-boot-fw-utils-cross/1_2017.<wbr>09-r0/recipe-sysroot-nati=
ve/<wbr>lib -Wl,-O1 V=3D1 rpi_3_32b_config</div><div>| make -f ./scripts/Ma=
kefile.build obj=3Dscripts/basic</div><div>|=C2=A0 =C2=A0cc -Wp,-MD,scripts=
/basic/.fixdep.<wbr>d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer=C2=
=A0 =C2=A0 =C2=A0 -o scripts/basic/fixdep scripts/basic/fixdep.c</div><div>=
| /bin/sh: 1: cc: not found</div><div>| make[1]: *** [scripts/basic/fixdep]=
 Error 127</div><div>| make: *** [scripts_basic] Error 2</div><div>| ERROR:=
 oe_runmake failed</div><div>| WARNING: exit code 1 from a shell command.</=
div><div>| ERROR: Function failed: do_compile (log file is located at work/=
x86_64-linux/u-boot-fw-<wbr>utils-cross/1_2017.09-r0/temp/<wbr>log.do_compi=
le.12859)</div><div>ERROR: Task (virtual:cross:oe-core/meta/<wbr>recipes-bs=
p/u-boot/u-boot-fw-<wbr>utils_2017.09.bb:do_compile) failed with exit code =
&#39;1&#39;</div></div><div><br></div></div><div class=3D"HOEnZb"><div clas=
s=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, =
Sep 11, 2017 at 10:30 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"=
mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This upgrades the U-=
Boot to the 2017.09 release.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
=C2=A0.../u-boot/{u-boot-common_201<wbr>7.07.inc =3D&gt; u-boot-common_2017=
.09.inc}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../u-boot/{<a href=3D"http://u-boot-fw-utils_2017.07.bb" rel=3D"nore=
ferrer" target=3D"_blank">u-boot-fw-utils_2<wbr>017.07.bb</a> =3D&gt; <a hr=
ef=3D"http://u-boot-fw-utils_2017.09.bb" rel=3D"noreferrer" target=3D"_blan=
k">u-boot-fw-utils_2017.09.bb</a>}=C2=A0 =C2=A0| 0<br>
=C2=A0.../u-boot/{<a href=3D"http://u-boot-mkimage_2017.07.bb" rel=3D"noref=
errer" target=3D"_blank">u-boot-mkimage_20<wbr>17.07.bb</a> =3D&gt; <a href=
=3D"http://u-boot-mkimage_2017.09.bb" rel=3D"noreferrer" target=3D"_blank">=
u-boot-mkimage_2017.09.bb</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2017.07.bb" rel=3D"=
noreferrer" target=3D"_blank">u-bo<wbr>ot_2017.07.bb</a> =3D&gt; <a href=3D=
"http://u-boot_2017.09.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2017=
.09.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A04 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{u-boo<wbr>t-common_2017.07.inc =3D&gt=
; u-boot-common_2017.09.inc} (89%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-fw-utils_201=
7.07.bb" rel=3D"noreferrer" target=3D"_blank">u-boo<wbr>t-fw-utils_2017.07.=
bb</a> =3D&gt; <a href=3D"http://u-boot-fw-utils_2017.09.bb" rel=3D"norefer=
rer" target=3D"_blank">u-boot-fw-utils_2017.09.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-mkimage_2017=
.07.bb" rel=3D"noreferrer" target=3D"_blank">u-boo<wbr>t-mkimage_2017.07.bb=
</a> =3D&gt; <a href=3D"http://u-boot-mkimage_2017.09.bb" rel=3D"noreferrer=
" target=3D"_blank">u-boot-mkimage_2017.09.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2017.07.bb" =
rel=3D"noreferrer" target=3D"_blank">u-boo<wbr>t_2017.07.bb</a> =3D&gt; <a =
href=3D"http://u-boot_2017.09.bb" rel=3D"noreferrer" target=3D"_blank">u-bo=
ot_2017.09.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/u-bo<wbr>ot-common_2017.07.inc b/meta/=
recipes-bsp/u-boot/u-bo<wbr>ot-common_2017.09.inc<br>
similarity index 89%<br>
rename from meta/recipes-bsp/u-boot/u-boot<wbr>-common_2017.07.inc<br>
rename to meta/recipes-bsp/u-boot/u-boot<wbr>-common_2017.09.inc<br>
index e37f5fd409..02e51242cb 100644<br>
--- a/meta/recipes-bsp/u-boot/u-bo<wbr>ot-common_2017.07.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-bo<wbr>ot-common_2017.09.inc<br>
@@ -7,7 +7,7 @@ PE =3D &quot;1&quot;<br>
<br>
=C2=A0# We use the revision in order to avoid having to fetch it from the<b=
r>
=C2=A0# repo during parse<br>
-SRCREV =3D &quot;d85ca029f257b53a96da6c2fb421e<wbr>78a003a9943&quot;<br>
+SRCREV =3D &quot;c98ac3487e413c71e5d36322ef332<wbr>4b21c6f60f9&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git" rel=
=3D"noreferrer" target=3D"_blank">git.denx.de/u-boot.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://MPC8315ERDB-enable-DHC<wbr>P.patch \<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017=
.07.bb" rel=3D"noreferrer" target=3D"_blank">u-bo<wbr>ot-fw-utils_2017.07.b=
b</a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017.09.b=
b" rel=3D"noreferrer" target=3D"_blank">u-bo<wbr>ot-fw-utils_2017.09.bb</a>=
<br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017.=
07.bb" rel=3D"noreferrer" target=3D"_blank">u-boot<wbr>-fw-utils_2017.07.bb=
</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017.09=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot<wbr>-fw-utils_2017.09.bb</=
a><br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2017.=
07.bb" rel=3D"noreferrer" target=3D"_blank">u-bo<wbr>ot-mkimage_2017.07.bb<=
/a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2017.09.bb" =
rel=3D"noreferrer" target=3D"_blank">u-bo<wbr>ot-mkimage_2017.09.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2017.0=
7.bb" rel=3D"noreferrer" target=3D"_blank">u-boot<wbr>-mkimage_2017.07.bb</=
a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2017.09.=
bb" rel=3D"noreferrer" target=3D"_blank">u-boot<wbr>-mkimage_2017.09.bb</a>=
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.07.bb" r=
el=3D"noreferrer" target=3D"_blank">u-bo<wbr>ot_2017.07.bb</a> b/meta/recip=
es-bsp/u-boot/<a href=3D"http://u-boot_2017.09.bb" rel=3D"noreferrer" targe=
t=3D"_blank">u-bo<wbr>ot_2017.09.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.07.bb" re=
l=3D"noreferrer" target=3D"_blank">u-boot<wbr>_2017.07.bb</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.09.bb" rel=
=3D"noreferrer" target=3D"_blank">u-boot<wbr>_2017.09.bb</a><br>
<span class=3D"m_3346292081076552592HOEnZb"><font color=3D"#888888">--<br>
2.14.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a11423646d0926b0559609cd1--
