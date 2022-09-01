Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAF0ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 17:53:58 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.15578.1662054829202328661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 10:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ddOMRWus;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id v16so20628338wrm.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 10:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mjg68CyGhloBlCRPc5T4DbJ1FpNzoyNFOhXpp/x+m/A=;
        b=ddOMRWusJvdB2chLdX3OdICqeXVK4R33CHxgWG6WCSrFdl1rmkuoZVdUn86PcbX/s8
         7rcCdzH+efR2Zub0n81ZI4lk91bWii8LAp7TjXPk2GnTUnoblY94xxMseDDFNMNaq8G+
         YzXgf/LFmR2HiAwwdp7ZvzM8dIYXBQpyrJnyLsx9IBY6qAXvEmYlTSE0C+aAIGGVPDl7
         A9ERnqVEMkXq2aWU8O8iHNi58P6jh82UgVsPSS+he9lBJ+vK/c8HPErZek54GD8Wau9E
         WtzebOIewtVExgAjwA+rkMsRo5ACk2l7GXzkPAST543sc0xcdfHO2oNN/iFXBOsoQaxk
         Oaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mjg68CyGhloBlCRPc5T4DbJ1FpNzoyNFOhXpp/x+m/A=;
        b=VebtFb8a6ipzdCfwsnuZq35ptRqn515tB6fuAmFjVoIJOHu4I2gMtH2M48JfKRR/xH
         p1KNYW4aBNJZlww49o8d0LNIEBcNmxwPvP3WFdomNI9a1xWwjInZv1nxDeDx60CFOX0n
         p5g+1iAPNkDD3dFUTGvogeACpCN1G3zr9PSU4U4rUkHmTUJqc/6dnhIwbtFnoIqZsApx
         yfMOiVn/hxA4TXMrMeVKAXAehYTJ51NekclMiA/AZsAsRXk2h0NKVou5xkLI4ETZiT/M
         H82YekcYd/gGlI8WwVZWf7PY5n058u2abS6RVyACXKqVJVDZDQ7g82mmIGVJHmbQ4u31
         rESg==
X-Gm-Message-State: ACgBeo3sqpMAnhMOCGLZMfQ3V3zxNUfQiClYIcsHkQUyVrgNTe8iRsEw
	zkuWxgsd7V/J5RiR0e+UZLJ9h10FqQ2AeUgoTes=
X-Google-Smtp-Source: 
 AA6agR5LHww6DRsyUUWoTiS/qUjezFfcg1NxrayCfbsmQ+QjFdRfgLyXTEsmCVyIBx3eECBf7HbAKOgrm5Jbulom7wo=
X-Received: by 2002:a05:6000:812:b0:226:da85:cce5 with SMTP id
 bt18-20020a056000081200b00226da85cce5mr12197217wrb.516.1662054827407; Thu, 01
 Sep 2022 10:53:47 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANPvuRkFDG6u29S4SweVtV95mgSyxi0xwZHbsgBMb7-nxiAHmw@mail.gmail.com>
 <1708C2AFE1C30D2F.26691@lists.openembedded.org>
In-Reply-To: <1708C2AFE1C30D2F.26691@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 1 Sep 2022 19:53:05 +0200
Message-ID: 
 <CA+chaQdtoWF+0PVVxySooUWaKUfZkPB+Fir3tBpyjrDDkjOBAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2][RFC][DO NOT MERGE] insane: check for 'unsafe
 for cross-compilation' in log.do_compile and log.do_install again
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000095bc3005e7a14b67"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 17:53:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170225

--00000000000095bc3005e7a14b67
Content-Type: text/plain; charset="UTF-8"

FWIW: boost can also trigger this issue now:

    "x86_64-webos-linux-g++" "-m64" "-march=core2" "-mtune=core2" "-msse3"
"-mfpmath=sse" "-Wl,-O1" "-Wl,--hash-style=gnu" "-Wl,--as-needed"
"-fmacro-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/boost_1_80_0=/usr/src/debug/boost/1.80.0-r0"
"-fdebug-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/boost_1_80_0=/usr/src/debug/boost/1.80.0-r0"
"-fmacro-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/build=/usr/src/debug/boost/1.80.0-r0"
"-fdebug-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/build=/usr/src/debug/boost/1.80.0-r0"
"-fdebug-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot="
"-fmacro-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot="
"-fdebug-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot-native="
"--sysroot=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot"
  -fvisibility-inlines-hidden  -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/boost_1_80_0=/usr/src/debug/boost/1.80.0-r0
 -fdebug-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/boost_1_80_0=/usr/src/debug/boost/1.80.0-r0
 -fmacro-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/build=/usr/src/debug/boost/1.80.0-r0
 -fdebug-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/build=/usr/src/debug/boost/1.80.0-r0
 -fdebug-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot=
 -fmacro-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot=
 -fdebug-prefix-map=/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot-native=
 -fvisibility-inlines-hidden -m64 -pthread -O3 -finline-functions
-Wno-inline -Wall -fvisibility=hidden -Wno-long-long
-Wno-deprecated-declarations -DBOOST_ALL_NO_LIB=1
-DBOOST_CHRONO_STATIC_LINK=1 -DBOOST_LOCALE_NO_WINAPI_BACKEND=1
-DBOOST_LOCALE_WITH_ICONV=1 -DBOOST_LOCALE_WITH_ICU=1
-DBOOST_THREAD_BUILD_LIB=1 -DBOOST_THREAD_NO_LIB=1 -DBOOST_THREAD_POSIX
-DBOOST_THREAD_USE_LIB=1 -DNDEBUG  -I"."
-I"/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/boost_1_80_0/libs/locale/src"
-I"/usr/include"  -c -o
"/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/build/boost/bin.v2/libs/locale/build/f2e0de3f303a0b3f8e80823b216d5db4/posix/converter.o"
"/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/boost_1_80_0/libs/locale/src/boost/locale/posix/converter.cpp"

cc1plus: warning: include location "/usr/include" is unsafe for
cross-compilation [-Wpoison-system-directories]

On Sat, Aug 6, 2022 at 2:55 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> * it was removed in:
>
> https://git.openembedded.org/openembedded-core/commit/?id=a67e9ebfd5b8002fd4a7d8d27ff0d997817f76e1
>   but looks like the "follow-up patches":
>     d039d6fbfc gcc-cross: make use of the system include directories fatal
>     1fcaa5f452 gcc: add an option for --enable-poison-system-directories
> to be fatal
>   don't work anymore? I was checking if e.g. -Wno-error is used in
>   webkitgtk to disable them, but it's not there, so something else went
>   wrong, because in webkit-gtk log.do_compile I've just noticed:
>
>   # grep unsafe
> poky/build/tmp/work/core2-64-poky-linux/webkitgtk/2.36.4-r0/temp/log.do_compile.3901410
> | sort | uniq -c
>       6 cc1: warning: include location "/usr/include/gstreamer-1.0" is
> unsafe for cross-compilation [-Wpoison-system-directories]
>    1267 cc1plus: warning: include location "/usr/include/gstreamer-1.0" is
> unsafe for cross-compilation [-Wpoison-system-directories]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>
>  v2: fixed copy&paste issue in postfuncs reported by Jose
>
>  meta/classes/insane.bbclass | 38 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index c8b434bb54..2cb730111b 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -35,8 +35,8 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch
> pkgconfig la \
>              version-going-backwards expanded-d invalid-chars \
>              license-checksum dev-elf file-rdeps configure-unsafe \
>              configure-gettext perllocalpod shebang-size \
> -            already-stripped installed-vs-shipped ldflags
> compile-host-path \
> -            install-host-path pn-overrides unknown-configure-option \
> +            already-stripped installed-vs-shipped ldflags compile-unsafe \
> +            install-unsafe pn-overrides unknown-configure-option \
>              useless-rpaths rpaths staticdev empty-dirs \
>              "
>  # Add usrmerge QA check based on distro feature
> @@ -1231,6 +1231,31 @@ python do_qa_patch() {
>                     bb.error("Missing Upstream-Status in patch\n%s\nPlease
> add according to %s ." % (fullpath, guidelines))
>  }
>
> +def check_poisoned_system_directories(file):
> +    import subprocess
> +
> +    statement = "grep -q -F -e 'is unsafe for cross-compilation' %s" %
> file
> +    if subprocess.call(statement, shell=True) == 0:
> +         return """This %s log indicates 'unsafe for cross-compilation'
> or '-Wpoison-system-directories' errors, it looked at host include and/or
> library paths""" % file
> +
> +python do_qa_compile() {
> +    log = os.path.join(d.getVar('T'),"log.do_compile")
> +    skip = (d.getVar('INSANE_SKIP') or "").split()
> +    if 'compile-unsafe' not in skip and os.path.exists(log):
> +        error_msg = check_poisoned_system_directories(log)
> +        if error_msg:
> +            oe.qa.handle_error("compile-unsafe", error_msg, d)
> +}
> +
> +python do_qa_install() {
> +    log = os.path.join(d.getVar('T'),"log.do_install")
> +    skip = (d.getVar('INSANE_SKIP') or "").split()
> +    if 'install-unsafe' not in skip and os.path.exists(log):
> +        error_msg = check_poisoned_system_directories(log)
> +        if error_msg:
> +            oe.qa.handle_error("install-unsafe", error_msg, d)
> +}
> +
>  python do_qa_configure() {
>      import subprocess
>
> @@ -1253,9 +1278,8 @@ python do_qa_configure() {
>              statement = "grep -q -F -e 'is unsafe for cross-compilation'
> %s" % \
>                          os.path.join(root,"config.log")
>              if "config.log" in files:
> -                if subprocess.call(statement, shell=True) == 0:
> -                    error_msg = """This autoconf log indicates errors, it
> looked at host include and/or library paths while determining system
> capabilities.
> -Rerun configure task after fixing this."""
> +                error_msg =
> check_poisoned_system_directories(os.path.join(root,"config.log"))
> +                if error_msg:
>                      oe.qa.handle_error("configure-unsafe", error_msg, d)
>
>              if "configure.ac" in files:
> @@ -1356,6 +1380,10 @@ do_patch[postfuncs] += "do_qa_patch "
>  #addtask qa_configure after do_configure before do_compile
>  do_configure[postfuncs] += "do_qa_configure "
>
> +# Check poison-system-directories in log.do_compile and log.do_install
> +do_compile[postfuncs] += "do_qa_compile"
> +do_install[postfuncs] += "do_qa_install"
> +
>  # Check does S exist.
>  do_unpack[postfuncs] += "do_qa_unpack"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168973):
> https://lists.openembedded.org/g/openembedded-core/message/168973
> Mute This Topic: https://lists.openembedded.org/mt/92853487/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000095bc3005e7a14b67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: boost can also trigger this issue now:<div><br></div=
><div>=C2=A0 =C2=A0 &quot;x86_64-webos-linux-g++&quot; &quot;-m64&quot; &qu=
ot;-march=3Dcore2&quot; &quot;-mtune=3Dcore2&quot; &quot;-msse3&quot; &quot=
;-mfpmath=3Dsse&quot; &quot;-Wl,-O1&quot; &quot;-Wl,--hash-style=3Dgnu&quot=
; &quot;-Wl,--as-needed&quot; &quot;-fmacro-prefix-map=3D/OE/build/luneos-l=
angdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/boo=
st_1_80_0=3D/usr/src/debug/boost/1.80.0-r0&quot; &quot;-fdebug-prefix-map=
=3D/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/boost/1.80.0-r0/boost_1_80_0=3D/usr/src/debug/boost/1.80.0-r0&quot; &quot=
;-fmacro-prefix-map=3D/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/=
core2-64-webos-linux/boost/1.80.0-r0/build=3D/usr/src/debug/boost/1.80.0-r0=
&quot; &quot;-fdebug-prefix-map=3D/OE/build/luneos-langdale/webos-ports/tmp=
-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/build=3D/usr/src/debug/boo=
st/1.80.0-r0&quot; &quot;-fdebug-prefix-map=3D/OE/build/luneos-langdale/web=
os-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot=
=3D&quot; &quot;-fmacro-prefix-map=3D/OE/build/luneos-langdale/webos-ports/=
tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot=3D&quot;=
 &quot;-fdebug-prefix-map=3D/OE/build/luneos-langdale/webos-ports/tmp-glibc=
/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot-native=3D&quot; &=
quot;--sysroot=3D/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2=
-64-webos-linux/boost/1.80.0-r0/recipe-sysroot&quot; =C2=A0 -fvisibility-in=
lines-hidden =C2=A0-O2 -pipe -g -feliminate-unused-debug-types -fmacro-pref=
ix-map=3D/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webo=
s-linux/boost/1.80.0-r0/boost_1_80_0=3D/usr/src/debug/boost/1.80.0-r0 =C2=
=A0-fdebug-prefix-map=3D/OE/build/luneos-langdale/webos-ports/tmp-glibc/wor=
k/core2-64-webos-linux/boost/1.80.0-r0/boost_1_80_0=3D/usr/src/debug/boost/=
1.80.0-r0 =C2=A0-fmacro-prefix-map=3D/OE/build/luneos-langdale/webos-ports/=
tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/build=3D/usr/src/debug/=
boost/1.80.0-r0 =C2=A0-fdebug-prefix-map=3D/OE/build/luneos-langdale/webos-=
ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/build=3D/usr/src/=
debug/boost/1.80.0-r0 =C2=A0-fdebug-prefix-map=3D/OE/build/luneos-langdale/=
webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysr=
oot=3D =C2=A0-fmacro-prefix-map=3D/OE/build/luneos-langdale/webos-ports/tmp=
-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot=3D =C2=A0-f=
debug-prefix-map=3D/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/cor=
e2-64-webos-linux/boost/1.80.0-r0/recipe-sysroot-native=3D =C2=A0-fvisibili=
ty-inlines-hidden -m64 -pthread -O3 -finline-functions -Wno-inline -Wall -f=
visibility=3Dhidden -Wno-long-long -Wno-deprecated-declarations -DBOOST_ALL=
_NO_LIB=3D1 -DBOOST_CHRONO_STATIC_LINK=3D1 -DBOOST_LOCALE_NO_WINAPI_BACKEND=
=3D1 -DBOOST_LOCALE_WITH_ICONV=3D1 -DBOOST_LOCALE_WITH_ICU=3D1 -DBOOST_THRE=
AD_BUILD_LIB=3D1 -DBOOST_THREAD_NO_LIB=3D1 -DBOOST_THREAD_POSIX -DBOOST_THR=
EAD_USE_LIB=3D1 -DNDEBUG =C2=A0-I&quot;.&quot; -I&quot;/OE/build/luneos-lan=
gdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/boost=
_1_80_0/libs/locale/src&quot; -I&quot;/usr/include&quot; =C2=A0-c -o &quot;=
/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-webos-linux/b=
oost/1.80.0-r0/build/boost/bin.v2/libs/locale/build/f2e0de3f303a0b3f8e80823=
b216d5db4/posix/converter.o&quot; &quot;/OE/build/luneos-langdale/webos-por=
ts/tmp-glibc/work/core2-64-webos-linux/boost/1.80.0-r0/boost_1_80_0/libs/lo=
cale/src/boost/locale/posix/converter.cpp&quot;<br><br>cc1plus: warning: in=
clude location &quot;/usr/include&quot; is unsafe for cross-compilation [-W=
poison-system-directories]<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 6, 2022 at 2:55 PM Martin J=
ansa via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.=
openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* it was=
 removed in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3Da67e9ebfd5b8002fd4a7d8d27ff0d997817f76e1" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3Da67e9ebf=
d5b8002fd4a7d8d27ff0d997817f76e1</a><br>
=C2=A0 but looks like the &quot;follow-up patches&quot;:<br>
=C2=A0 =C2=A0 d039d6fbfc gcc-cross: make use of the system include director=
ies fatal<br>
=C2=A0 =C2=A0 1fcaa5f452 gcc: add an option for --enable-poison-system-dire=
ctories to be fatal<br>
=C2=A0 don&#39;t work anymore? I was checking if e.g. -Wno-error is used in=
<br>
=C2=A0 webkitgtk to disable them, but it&#39;s not there, so something else=
 went<br>
=C2=A0 wrong, because in webkit-gtk log.do_compile I&#39;ve just noticed:<b=
r>
<br>
=C2=A0 # grep unsafe poky/build/tmp/work/core2-64-poky-linux/webkitgtk/2.36=
.4-r0/temp/log.do_compile.3901410 | sort | uniq -c<br>
=C2=A0 =C2=A0 =C2=A0 6 cc1: warning: include location &quot;/usr/include/gs=
treamer-1.0&quot; is unsafe for cross-compilation [-Wpoison-system-director=
ies]<br>
=C2=A0 =C2=A01267 cc1plus: warning: include location &quot;/usr/include/gst=
reamer-1.0&quot; is unsafe for cross-compilation [-Wpoison-system-directori=
es]<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
<br>
=C2=A0v2: fixed copy&amp;paste issue in postfuncs reported by Jose<br>
<br>
=C2=A0meta/classes/insane.bbclass | 38 ++++++++++++++++++++++++++++++++----=
-<br>
=C2=A01 file changed, 33 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index c8b434bb54..2cb730111b 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -35,8 +35,8 @@ ERROR_QA ?=3D &quot;dev-so debug-deps dev-deps debug-file=
s arch pkgconfig la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version-going-backwards exp=
anded-d invalid-chars \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0license-checksum dev-elf fi=
le-rdeps configure-unsafe \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configure-gettext perllocal=
pod shebang-size \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 already-stripped installed-vs-sh=
ipped ldflags compile-host-path \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install-host-path pn-overrides u=
nknown-configure-option \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 already-stripped installed-vs-sh=
ipped ldflags compile-unsafe \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install-unsafe pn-overrides unkn=
own-configure-option \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0useless-rpaths rpaths stati=
cdev empty-dirs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0# Add usrmerge QA check based on distro feature<br>
@@ -1231,6 +1231,31 @@ python do_qa_patch() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.er=
ror(&quot;Missing Upstream-Status in patch\n%s\nPlease add according to %s =
.&quot; % (fullpath, guidelines))<br>
=C2=A0}<br>
<br>
+def check_poisoned_system_directories(file):<br>
+=C2=A0 =C2=A0 import subprocess<br>
+<br>
+=C2=A0 =C2=A0 statement =3D &quot;grep -q -F -e &#39;is unsafe for cross-c=
ompilation&#39; %s&quot; % file<br>
+=C2=A0 =C2=A0 if subprocess.call(statement, shell=3DTrue) =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;&quot;This %s log ind=
icates &#39;unsafe for cross-compilation&#39; or &#39;-Wpoison-system-direc=
tories&#39; errors, it looked at host include and/or library paths&quot;&qu=
ot;&quot; % file<br>
+<br>
+python do_qa_compile() {<br>
+=C2=A0 =C2=A0 log =3D os.path.join(d.getVar(&#39;T&#39;),&quot;log.do_comp=
ile&quot;)<br>
+=C2=A0 =C2=A0 skip =3D (d.getVar(&#39;INSANE_SKIP&#39;) or &quot;&quot;).s=
plit()<br>
+=C2=A0 =C2=A0 if &#39;compile-unsafe&#39; not in skip and os.path.exists(l=
og):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_msg =3D check_poisoned_system_directorie=
s(log)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if error_msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;compile=
-unsafe&quot;, error_msg, d)<br>
+}<br>
+<br>
+python do_qa_install() {<br>
+=C2=A0 =C2=A0 log =3D os.path.join(d.getVar(&#39;T&#39;),&quot;log.do_inst=
all&quot;)<br>
+=C2=A0 =C2=A0 skip =3D (d.getVar(&#39;INSANE_SKIP&#39;) or &quot;&quot;).s=
plit()<br>
+=C2=A0 =C2=A0 if &#39;install-unsafe&#39; not in skip and os.path.exists(l=
og):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_msg =3D check_poisoned_system_directorie=
s(log)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if error_msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;install=
-unsafe&quot;, error_msg, d)<br>
+}<br>
+<br>
=C2=A0python do_qa_configure() {<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
<br>
@@ -1253,9 +1278,8 @@ python do_qa_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0statement =3D &quot;grep -q=
 -F -e &#39;is unsafe for cross-compilation&#39; %s&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0os.path.join(root,&quot;config.log&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;config.log&quot; i=
n files:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if subprocess.call=
(statement, shell=3DTrue) =3D=3D 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 erro=
r_msg =3D &quot;&quot;&quot;This autoconf log indicates errors, it looked a=
t host include and/or library paths while determining system capabilities.<=
br>
-Rerun configure task after fixing this.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_msg =3D chec=
k_poisoned_system_directories(os.path.join(root,&quot;config.log&quot;))<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if error_msg:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0oe.qa.handle_error(&quot;configure-unsafe&quot;, error_msg, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;<a href=3D"http://=
configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>&quot; i=
n files:<br>
@@ -1356,6 +1380,10 @@ do_patch[postfuncs] +=3D &quot;do_qa_patch &quot;<br=
>
=C2=A0#addtask qa_configure after do_configure before do_compile<br>
=C2=A0do_configure[postfuncs] +=3D &quot;do_qa_configure &quot;<br>
<br>
+# Check poison-system-directories in log.do_compile and log.do_install<br>
+do_compile[postfuncs] +=3D &quot;do_qa_compile&quot;<br>
+do_install[postfuncs] +=3D &quot;do_qa_install&quot;<br>
+<br>
=C2=A0# Check does S exist.<br>
=C2=A0do_unpack[postfuncs] +=3D &quot;do_qa_unpack&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168973): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168973" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168973</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92853487/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92853487/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000095bc3005e7a14b67--

