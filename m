Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E76C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 04:36:54 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.5761.1653367009837760779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 21:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ecCtjfXK;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id bq30so28888457lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 21:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BLtrfEsaSfbA4yXOqQCVawVDC635VTZ9As0Pd1b2kQc=;
        b=ecCtjfXK5KaDJTfSGhf6RQSJM50bTwU7qDNadyKQxGlKEd/2x+OoFhUaHc8vBKNqp/
         zmBEw+oT3KGyqlqIzdJXJBLvr6VnEYjyc+2Ql3+RUjTMo1KKuVS7LhH0+HoaleR87Pl0
         bI6fczCsBiDP/AmSAyzpZFsYQmEG46oVFx+LCLLZvy3QzAkqvC2GZTrGXPaS9Xit1Tmj
         vfWBDYNkUuye1rSn23Iub8611zHPD8L6JiUuj8GOlkY14cwFqG7zXW3PqASupxECioeE
         iSaan/o5dL3MqVPvVBHj7j8+6phXF7pqPXkn3RlzNr9Nu95swaFmmni8FqCjdbSnAwU0
         U76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BLtrfEsaSfbA4yXOqQCVawVDC635VTZ9As0Pd1b2kQc=;
        b=DQCmGkz48OlSVtC070H3SMh1Hzw0i3PnufAOamRQEqdaAhRXpEtClHGk5f8JQmTcDp
         MQVsTI8+kl+DNJ8MBU8Yw2OSzR1VrbBF/DwD78wiBSp1oTmgv9+fQFcM2zcJVGXrM+T6
         +9rwICOYd66dnnSeN1xh8SbRPNwKjjuloC64Fr2Owc2mnb5rEXZtXTiJx/RNdK+seaAu
         F4c96SLHVF2WnjOlX9YfVWHOmBMtE+tLG90RurXEwR46+w0CP98sCsXE7lpQo7DAEceW
         NYMwgFoaafjvb51Smc+MlCn8kYKXPtCdVDFB0lwu8+a6ck1I1DVRO3E00VRvjXYMTcxa
         YxMQ==
X-Gm-Message-State: AOAM533GQvsan4maWaqzab/uK1YFwFSqooQGCEkJ12SoXfO4xp34X8nV
	N/5P38ZXmJR4ojsO3x3LN/I2r7Ivux10Vbyy/5A=
X-Google-Smtp-Source: 
 ABdhPJwcys73O/aZrMors7Pf6Ly2Mve40A0l9Ly30mPgc6+jI8ASuz+uktpMf69EhI5d2ZugeI3WOCZe7NMJAvq6K9U=
X-Received: by 2002:a05:6512:2348:b0:478:5ad6:af37 with SMTP id
 p8-20020a056512234800b004785ad6af37mr12019718lfu.26.1653367007704; Mon, 23
 May 2022 21:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <1653355715-22875-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1653355715-22875-1-git-send-email-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 May 2022 06:36:36 +0200
Message-ID: 
 <CANNYZj89WRssFfw5Lx4D+L3-HV9Z=QcOHhfhO-MiNTT2f3LQYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] gnutls: Added fips option.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002d7ba705dfba818f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 04:36:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166044

--0000000000002d7ba705dfba818f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please correct the upstream status to inappropriate, =E2=80=98submitted=E2=
=80=99 means the
patch was actually sent upstream, =E2=80=98inappropriate=E2=80=99 means the=
 patch was not
submitted, but an issue was raised with upstream to find a solution.

Alex

On Tue 24. May 2022 at 3.28, leimaohui <leimaohui@fujitsu.com> wrote:

> - Added a patch to avoid excute fipshmac command. Because *.hmac
> file should be created on target instead of on build environment.
> - Added pkg_postinst_ontarget to make sure necessary files are
> created on target.
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  ...ile-should-be-excuted-in-target-envi.patch | 28 +++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.7.5.bb   | 24 +++++++++++++++-
>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-exc=
uted-in-target-envi.patch
>
> diff --git
> a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-e=
xcuted-in-target-envi.patch
> b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-e=
xcuted-in-target-envi.patch
> new file mode 100644
> index 0000000000..f4a2f0cd35
> --- /dev/null
> +++
> b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-e=
xcuted-in-target-envi.patch
> @@ -0,0 +1,28 @@
> +From b729a356538d499fe25e82bfc78ea663bdaca0a8 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Mon, 23 May 2022 10:44:43 +0900
> +Subject: [PATCH] Creating .hmac file should be excuted in target
> environment,
> + so deleted it from build process.
> +
> +Upstream-Status: Submitted [
> https://gitlab.com/gnutls/gnutls/-/issues/1373]
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + lib/Makefile.am | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/lib/Makefile.am b/lib/Makefile.am
> +index 0b43ef9..cf263f0 100644
> +--- a/lib/Makefile.am
> ++++ b/lib/Makefile.am
> +@@ -206,8 +206,7 @@ hmac_files =3D .libs/.gnutls.hmac
> +
> + all-local: $(hmac_files)
> +
> +-.libs/.gnutls.hmac: libgnutls.la fipshmac
> +-      $(AM_V_GEN) $(builddir)/fipshmac > $@-t && mv $@-t $@
> ++.libs/.gnutls.hmac:
> +
> + CLEANFILES =3D $(hmac_files)
> + endif
> +--
> +2.25.1
> diff --git a/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> index 5feedb7fdc..b796494b8d 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> @@ -21,6 +21,7 @@ SHRT_VER =3D
> "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>
>  SRC_URI =3D "
> https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz =
\
>             file://arm_eabi.patch \
> +
>  file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "1f85028475b4f255cc5b480af0c37e61eab43024c1507c8b75d6be506c0553ad"
> @@ -36,6 +37,7 @@ PACKAGECONFIG[libidn] =3D
> "--with-idn,--without-idn,libidn2"
>  PACKAGECONFIG[libtasn1] =3D
> "--with-included-libtasn1=3Dno,--with-included-libtasn1,libtasn1"
>  PACKAGECONFIG[p11-kit] =3D "--with-p11-kit,--without-p11-kit,p11-kit"
>  PACKAGECONFIG[tpm] =3D "--with-tpm,--without-tpm,trousers"
> +PACKAGECONFIG[fips] =3D "--enable-fips140-mode
> --with-libdl-prefix=3D${STAGING_BASELIBDIR}"
>
>  EXTRA_OECONF =3D " \
>      --enable-doc \
> @@ -59,10 +61,30 @@ do_configure:prepend() {
>         done
>  }
>
> -PACKAGES =3D+ "${PN}-openssl ${PN}-xx"
> +do_install:append:class-target() {
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false'=
,
> d)}; then
> +          install -d ${D}${bindir}/bin
> +          install -m 0755 ${B}/lib/.libs/fipshmac ${D}/${bindir}/
> +        fi
> +}
> +
> +PACKAGES =3D+ "${PN}-openssl ${PN}-xx ${PN}-fips"
>
>  FILES:${PN}-dev +=3D "${bindir}/gnutls-cli-debug"
>  FILES:${PN}-openssl =3D "${libdir}/libgnutls-openssl.so.*"
>  FILES:${PN}-xx =3D "${libdir}/libgnutlsxx.so.*"
> +FILES:${PN}-fips =3D "${bindir}/fipshmac"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +pkg_postinst_ontarget:${PN}-fips () {
> +    if test -x ${bindir}/fipshmac
> +    then
> +        mkdir ${sysconfdir}/gnutls
> +        touch ${sysconfdir}/gnutls/config
> +        ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* >
> ${libdir}/.libgnutls.so.30.hmac
> +        ${bindir}/fipshmac ${libdir}/libnettle.so.8.* >
> ${libdir}/.libnettle.so.8.hmac
> +        ${bindir}/fipshmac ${libdir}/libgmp.so.10.*.* >
> ${libdir}/.libgmp.so.10.hmac
> +        ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* >
> ${libdir}/.libhogweed.so.6.hmac
> +    fi
> +}
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166043):
> https://lists.openembedded.org/g/openembedded-core/message/166043
> Mute This Topic: https://lists.openembedded.org/mt/91303156/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002d7ba705dfba818f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please correct the upstream status to inappropriate,=
 =E2=80=98submitted=E2=80=99 means the patch was actually sent upstream, =
=E2=80=98inappropriate=E2=80=99 means the patch was not submitted, but an i=
ssue was raised with upstream to find a solution.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Alex</div></div><div><div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 24. May 2022 at 3.28, =
leimaohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank">le=
imaohui@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">- Added a patc=
h to avoid excute fipshmac command. Because *.hmac<br>
file should be created on target instead of on build environment.<br>
- Added pkg_postinst_ontarget to make sure necessary files are<br>
created on target.<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" targ=
et=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...ile-should-be-excuted-in-target-envi.patch | 28 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.5.bb" rel=3D=
"noreferrer" target=3D"_blank">gnutls_3.7.5.bb</a>=C2=A0 =C2=A0| 24 +++++++=
++++++++-<br>
=C2=A02 files changed, 51 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Creating-.=
hmac-file-should-be-excuted-in-target-envi.patch<br>
<br>
diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-sh=
ould-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0=
001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch<br>
new file mode 100644<br>
index 0000000000..f4a2f0cd35<br>
--- /dev/null<br>
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be=
-excuted-in-target-envi.patch<br>
@@ -0,0 +1,28 @@<br>
+From b729a356538d499fe25e82bfc78ea663bdaca0a8 Mon Sep 17 00:00:00 2001<br>
+From: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" target=3D"_b=
lank">leimaohui@fujitsu.com</a>&gt;<br>
+Date: Mon, 23 May 2022 10:44:43 +0900<br>
+Subject: [PATCH] Creating .hmac file should be excuted in target environme=
nt,<br>
+ so deleted it from build process.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.com/gnutls/gnutls/-/=
issues/1373" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/gnutls=
/gnutls/-/issues/1373</a>]<br>
+Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" tar=
get=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
+---<br>
+ lib/Makefile.am | 3 +--<br>
+ 1 file changed, 1 insertion(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/Makefile.am b/lib/Makefile.am<br>
+index 0b43ef9..cf263f0 100644<br>
+--- a/lib/Makefile.am<br>
++++ b/lib/Makefile.am<br>
+@@ -206,8 +206,7 @@ hmac_files =3D .libs/.gnutls.hmac<br>
+<br>
+ all-local: $(hmac_files)<br>
+<br>
+-.libs/.gnutls.hmac: <a href=3D"http://libgnutls.la" rel=3D"noreferrer" ta=
rget=3D"_blank">libgnutls.la</a> fipshmac<br>
+-=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) $(builddir)/fipshmac &gt; $@-t &amp;&amp=
; mv $@-t $@<br>
++.libs/.gnutls.hmac:<br>
+<br>
+ CLEANFILES =3D $(hmac_files)<br>
+ endif<br>
+--<br>
+2.25.1<br>
diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnutls_3.7.5.bb</a> b/meta/recipes-su=
pport/gnutls/<a href=3D"http://gnutls_3.7.5.bb" rel=3D"noreferrer" target=
=3D"_blank">gnutls_3.7.5.bb</a><br>
index 5feedb7fdc..b796494b8d 100644<br>
--- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.5.bb" rel=3D=
"noreferrer" target=3D"_blank">gnutls_3.7.5.bb</a><br>
+++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.5.bb" rel=3D=
"noreferrer" target=3D"_blank">gnutls_3.7.5.bb</a><br>
@@ -21,6 +21,7 @@ SHRT_VER =3D &quot;${@d.getVar(&#39;PV&#39;).split(&#39;.=
&#39;)[0]}.${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[1]}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://www.gnupg.org/ftp/gcrypt/gnutls/=
v$%7BSHRT_VER%7D/gnutls-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.x=
z</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arm_eabi.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Creating-.hmac-file-s=
hould-be-excuted-in-target-envi.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1f85028475b4f255cc5b480af0c37e61eab43024=
c1507c8b75d6be506c0553ad&quot;<br>
@@ -36,6 +37,7 @@ PACKAGECONFIG[libidn] =3D &quot;--with-idn,--without-idn,=
libidn2&quot;<br>
=C2=A0PACKAGECONFIG[libtasn1] =3D &quot;--with-included-libtasn1=3Dno,--wit=
h-included-libtasn1,libtasn1&quot;<br>
=C2=A0PACKAGECONFIG[p11-kit] =3D &quot;--with-p11-kit,--without-p11-kit,p11=
-kit&quot;<br>
=C2=A0PACKAGECONFIG[tpm] =3D &quot;--with-tpm,--without-tpm,trousers&quot;<=
br>
+PACKAGECONFIG[fips] =3D &quot;--enable-fips140-mode --with-libdl-prefix=3D=
${STAGING_BASELIBDIR}&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--enable-doc \<br>
@@ -59,10 +61,30 @@ do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
-PACKAGES =3D+ &quot;${PN}-openssl ${PN}-xx&quot;<br>
+do_install:append:class-target() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39=
;, &#39;fips&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}/bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${B}/lib/.libs/fipshmac=
 ${D}/${bindir}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-openssl ${PN}-xx ${PN}-fips&quot;<br>
<br>
=C2=A0FILES:${PN}-dev +=3D &quot;${bindir}/gnutls-cli-debug&quot;<br>
=C2=A0FILES:${PN}-openssl =3D &quot;${libdir}/libgnutls-openssl.so.*&quot;<=
br>
=C2=A0FILES:${PN}-xx =3D &quot;${libdir}/libgnutlsxx.so.*&quot;<br>
+FILES:${PN}-fips =3D &quot;${bindir}/fipshmac&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+pkg_postinst_ontarget:${PN}-fips () {<br>
+=C2=A0 =C2=A0 if test -x ${bindir}/fipshmac<br>
+=C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir ${sysconfdir}/gnutls<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${sysconfdir}/gnutls/config<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*=
.* &gt; ${libdir}/.libgnutls.so.30.hmac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/fipshmac ${libdir}/libnettle.so.8.* =
&gt; ${libdir}/.libnettle.so.8.hmac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/fipshmac ${libdir}/libgmp.so.10.*.* =
&gt; ${libdir}/.libgmp.so.10.hmac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/fipshmac ${libdir}/libhogweed.so.6.*=
 &gt; ${libdir}/.libhogweed.so.6.hmac<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166043): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166043" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166043</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91303156/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91303156/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div>

--0000000000002d7ba705dfba818f--

