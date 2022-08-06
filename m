Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF92C19F2D
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 11:11:34 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.2149.1659784292425540285
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 04:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZGNa+VmC;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id r17so6540233lfm.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=H1vN0v6TFmyqkItEvB+o+UHOzwfjrfrVgPLrlmONFKo=;
        b=ZGNa+VmCEr0AJ+OZoc9irEXpcYDdA+PO1V4rqpmFNmiyI2P/0TQZLzbDL+uBsLhFqL
         yWtcjolCwU8rDxkkadLM90+Qtn9kBSPZQuTqMMWk5zMGsS2KzCx6JZIZoqoMg4mGe4gY
         P5VQ33MILWZ5sMRKlKsXX6NjNLf5T6vAqrIlUpuYlXts4/k2iWgq+yl2vbxJ5Fi7DOM9
         EYOSK9ZGtY0Q/KN//5y6wBR1XUmk3Eq+CAonR3B7lYBPCO2LC91/NtBgjzK+HS+2peCR
         6+/CGSty2fd+cZqNppNcYW5QR1x/GNToIZ3QFaZ4Xt3wWwz2xEll8Ak5LTuB4jY+qZv7
         gYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=H1vN0v6TFmyqkItEvB+o+UHOzwfjrfrVgPLrlmONFKo=;
        b=gwnCFCUR43JR+z5hf49y+sNJ+R0sjnPu8lf5C3mUucCM3HhtzxB68f570v9rtbOTGD
         DCvZjwmFN2twqKDcBrPiiBhS2v3WSzDWy+uFiPoiBMYvy/pC9Fv86jEOZYmm+scxBRch
         AfF/+zBONbZMrEiQ3ilkSQ6aQxTUBEkMqc+rPnAJsQJu+oPrkik00XD7a/5RsUq72xKv
         G927JQZYQ8cozXIYr6xik5/oNyis6PbdjxhZklXjPM4mpycSqefyFiYVvZ3IMTYb8+CK
         l8JazgdiHvYCU3uBbBMHapsGyljoKSt8rwhMpNHkVGxqul/MkXmP1iWaz6Kkcq/Nvc1Z
         IxoA==
X-Gm-Message-State: ACgBeo2FzkXTucxjY6R9WlFTDJmiQRXu6nRSUmlth9CqNRSb1E1xhz4z
	NQSwmf1q78gJmfutwcBdfTyh0xs7Y8Zu6JYIx60=
X-Google-Smtp-Source: 
 AA6agR4MhtBNak848r0PzFpdVL3G+rVLqKHXCVKLChhtCIZ/1Miv4Y5RAG52gmCkhN+lA7KElFB9YLSXpcQYM+5x+js=
X-Received: by 2002:a05:6512:2984:b0:48b:2ef5:35d9 with SMTP id
 du4-20020a056512298400b0048b2ef535d9mr3450592lfb.412.1659784290354; Sat, 06
 Aug 2022 04:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220806090714.2001241-1-Martin.Jansa@gmail.com>
In-Reply-To: <20220806090714.2001241-1-Martin.Jansa@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sat, 6 Aug 2022 12:11:19 +0100
Message-ID: 
 <CANPvuRkFDG6u29S4SweVtV95mgSyxi0xwZHbsgBMb7-nxiAHmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC][DO NOT MERGE] insane: check for 'unsafe
 for cross-compilation' in log.do_compile and log.do_install again
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, ross.burton@arm.com
Content-Type: multipart/alternative; boundary="00000000000007cbd805e590a526"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Aug 2022 11:11:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168970

--00000000000007cbd805e590a526
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Martin Jansa <Martin.Jansa@gmail.com> escreveu no dia s=C3=A1bado, 6/08/202=
2
=C3=A0(s) 10:07:

> * only a RFC to discuss what might prevent
>   --enable-poison-system-directories=3Dtrue in gcc-cross to work or to
>   test this on AB to see if there are other places where these issues
>   sneaked in without being detected
>
> * it was removed in:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Da67e9ebfd5b80=
02fd4a7d8d27ff0d997817f76e1
>   but looks like the "follow-up patches":
>     d039d6fbfc gcc-cross: make use of the system include directories fata=
l
>     1fcaa5f452 gcc: add an option for --enable-poison-system-directories
> to be fatal
>   don't work anymore? I was checking if e.g. -Wno-error is used in
>   webkitgtk to disable them, but it's not there, so something else went
>   wrong, because in webkit-gtk log.do_compile I've just noticed:
>
>   # grep unsafe
> poky/build/tmp/work/core2-64-poky-linux/webkitgtk/2.36.4-r0/temp/log.do_c=
ompile.3901410
> | sort | uniq -c
>       6 cc1: warning: include location "/usr/include/gstreamer-1.0" is
> unsafe for cross-compilation [-Wpoison-system-directories]
>    1267 cc1plus: warning: include location "/usr/include/gstreamer-1.0" i=
s
> unsafe for cross-compilation [-Wpoison-system-directories]
>
> * and with this it confirms the same in webkitgtk:
>
>   ERROR: webkitgtk-2.36.4-r0 do_compile: QA Issue: This
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.36.4-r0/te=
mp/log.do_compile
> log indicates 'unsafe for cross-compilation' or
> '-Wpoison-system-directories' errors, it looked at host include and/or
> library paths [compile-unsafe]
>
>   and this was the only error (when building webkitgtk from scratch)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/insane.bbclass | 38 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index c8b434bb54..9ce5ae0f6f 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -35,8 +35,8 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files a=
rch
> pkgconfig la \
>              version-going-backwards expanded-d invalid-chars \
>              license-checksum dev-elf file-rdeps configure-unsafe \
>              configure-gettext perllocalpod shebang-size \
> -            already-stripped installed-vs-shipped ldflags
> compile-host-path \
> -            install-host-path pn-overrides unknown-configure-option \
> +            already-stripped installed-vs-shipped ldflags compile-unsafe=
 \
> +            install-unsafe pn-overrides unknown-configure-option \
>              useless-rpaths rpaths staticdev empty-dirs \
>              "
>  # Add usrmerge QA check based on distro feature
> @@ -1231,6 +1231,31 @@ python do_qa_patch() {
>                     bb.error("Missing Upstream-Status in patch\n%s\nPleas=
e
> add according to %s ." % (fullpath, guidelines))
>  }
>
> +def check_poisoned_system_directories(file):
> +    import subprocess
> +
> +    statement =3D "grep -q -F -e 'is unsafe for cross-compilation' %s" %
> file
> +    if subprocess.call(statement, shell=3DTrue) =3D=3D 0:
> +         return """This %s log indicates 'unsafe for cross-compilation'
> or '-Wpoison-system-directories' errors, it looked at host include and/or
> library paths""" % file
> +
> +python do_qa_compile() {
> +    log =3D os.path.join(d.getVar('T'),"log.do_compile")
> +    skip =3D (d.getVar('INSANE_SKIP') or "").split()
> +    if 'compile-unsafe' not in skip and os.path.exists(log):
> +        error_msg =3D check_poisoned_system_directories(log)
> +        if error_msg:
> +            oe.qa.handle_error("compile-unsafe", error_msg, d)
> +}
> +
> +python do_qa_install() {
> +    log =3D os.path.join(d.getVar('T'),"log.do_install")
> +    skip =3D (d.getVar('INSANE_SKIP') or "").split()
> +    if 'install-unsafe' not in skip and os.path.exists(log):
> +        error_msg =3D check_poisoned_system_directories(log)
> +        if error_msg:
> +            oe.qa.handle_error("install-unsafe", error_msg, d)
> +}
> +
>  python do_qa_configure() {
>      import subprocess
>
> @@ -1253,9 +1278,8 @@ python do_qa_configure() {
>              statement =3D "grep -q -F -e 'is unsafe for cross-compilatio=
n'
> %s" % \
>                          os.path.join(root,"config.log")
>              if "config.log" in files:
> -                if subprocess.call(statement, shell=3DTrue) =3D=3D 0:
> -                    error_msg =3D """This autoconf log indicates errors,=
 it
> looked at host include and/or library paths while determining system
> capabilities.
> -Rerun configure task after fixing this."""
> +                error_msg =3D
> check_poisoned_system_directories(os.path.join(root,"config.log"))
> +                if error_msg:
>                      oe.qa.handle_error("configure-unsafe", error_msg, d)
>
>              if "configure.ac" in files:
> @@ -1356,6 +1380,10 @@ do_patch[postfuncs] +=3D "do_qa_patch "
>  #addtask qa_configure after do_configure before do_compile
>  do_configure[postfuncs] +=3D "do_qa_configure "
>
> +# Check poison-system-directories in log.do_compile and log.do_install
> +do_compile[postfuncs] +=3D "do_qa_compile"
> +do_compile[postfuncs] +=3D "do_qa_install"
>

I think this is a typo and the second do_compile is do_install

Jose

+
>  # Check does S exist.
>  do_unpack[postfuncs] +=3D "do_qa_unpack"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168969):
> https://lists.openembedded.org/g/openembedded-core/message/168969
> Mute This Topic: https://lists.openembedded.org/mt/92851436/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000007cbd805e590a526
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Martin,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Martin Jansa &lt;<a href=3D"mailto:Martin.J=
ansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; escreveu no dia s=C3=A1bado,=
 6/08/2022 =C3=A0(s) 10:07:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">* only a RFC to discuss what might prevent<br>
=C2=A0 --enable-poison-system-directories=3Dtrue in gcc-cross to work or to=
<br>
=C2=A0 test this on AB to see if there are other places where these issues<=
br>
=C2=A0 sneaked in without being detected<br>
<br>
* it was removed in:<br>
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
* and with this it confirms the same in webkitgtk:<br>
<br>
=C2=A0 ERROR: webkitgtk-2.36.4-r0 do_compile: QA Issue: This /OE/build/oe-c=
ore/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.36.4-r0/temp/log.do_compil=
e log indicates &#39;unsafe for cross-compilation&#39; or &#39;-Wpoison-sys=
tem-directories&#39; errors, it looked at host include and/or library paths=
 [compile-unsafe]<br>
<br>
=C2=A0 and this was the only error (when building webkitgtk from scratch)<b=
r>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/insane.bbclass | 38 ++++++++++++++++++++++++++++++++----=
-<br>
=C2=A01 file changed, 33 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index c8b434bb54..9ce5ae0f6f 100644<br>
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
+do_compile[postfuncs] +=3D &quot;do_qa_install&quot;<br></blockquote><div>=
<br></div><div>I think this is a typo and the second do_compile is do_insta=
ll</div><div><br></div><div>Jose</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
+<br>
=C2=A0# Check does S exist.<br>
=C2=A0do_unpack[postfuncs] +=3D &quot;do_qa_unpack&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168969): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168969" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168969</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92851436/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92851436/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000007cbd805e590a526--

