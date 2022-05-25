Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD387C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 03:21:33 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.2799.1653448889751105276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 20:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l2FB5wO2;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id p4so32517520lfg.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 20:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WewUTQO+AWIQxrA2wJUgWdrJI4ndvhlLdln9NyIJAfM=;
        b=l2FB5wO2bSXEQnHEoGkXLvf6EqDaxPtvm3jcRIFS0fCejOevOKfebfDiaZcuqs5S5Q
         uDKE4xrnmsW/sN3mIkfMvWS3Lag+q4nJYbeacuPkEbiwrXa0tqUNZl5WkHjreqyNM/wL
         T7Spd01r+pKoBg0zp4ZNqaezC97EyiBKfcdRPDI0A+nERqzdvfZhrxC+X1VMPuBPl9L3
         bfnmiZ/EHm+K0f3vJOBHgb66T69gEcmmYD9flwKEm+zwcHgDM/Jnosqsdm+EQVFPTmkO
         S7047hQNAkpDNK7sdoM200zO51u77TspkX/MXS8HzlpQDsEZ1vMBfPLoM0ZD3M4NfKse
         Yvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WewUTQO+AWIQxrA2wJUgWdrJI4ndvhlLdln9NyIJAfM=;
        b=W10F2OPujEak1pM28MsvWV2lFoeNxjXyrv9rvxkYv5enl97HdH4806ZNCeNbhn9WCM
         VmxNBAV6hq7YQri1wqzLrOwVCwKse/QizlkbKMp8sK3QYLOX2Fh2N+0kbCJ5Au0+KhxL
         GiwMxoNTgt07KzFTRBLuUTomKbdnnRj3AsbnRI1HSUL1QHt8NT5P1u9jWt9Aa+UnWAlq
         BnNLghTAjNSm+sau43TmPugIxvwPfq0fjDfvgMOEBNdODGf0S+ikHrXv8b/rmwAz06qT
         xD7X77MZEKsJ5130FDNo+YpWCoWNmezTxeyYbNziIV6athvVS10bEW16b8V8XRTJZBvh
         ti1g==
X-Gm-Message-State: AOAM533bY8cjEZnZmuRpSKBApD9suKwHZ8TEij1BOyB33UEEXz89hfKe
	8tYiRnirjmqpRUeGM4W4R3g/uFMf5LIPAoeRweU=
X-Google-Smtp-Source: 
 ABdhPJzJG0MOqQvnBUrnxnvv5WthwJZqF4WZAcokMrgw7iqpKjO5+JNGyKTy2xNCoRZpPKQsk71GpDkwk0U6M0gvcrY=
X-Received: by 2002:a05:6512:304c:b0:478:67d5:6982 with SMTP id
 b12-20020a056512304c00b0047867d56982mr12529650lfb.380.1653448887684; Tue, 24
 May 2022 20:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <1653355715-22875-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj89WRssFfw5Lx4D+L3-HV9Z=QcOHhfhO-MiNTT2f3LQYQ@mail.gmail.com>
 <OS0PR01MB61782E108117CBC248BE6EC3A0D69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB61782E108117CBC248BE6EC3A0D69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 May 2022 05:21:16 +0200
Message-ID: 
 <CANNYZj_HMGob=DF-33e-rHM1ME6HBO524nErX1NxHyKUGzf7zw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] gnutls: Added fips option.
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009ad04605dfcd9189"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 03:21:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166091

--0000000000009ad04605dfcd9189
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes please, that is correct.


Alex

On Wed 25. May 2022 at 2.15, leimaohui@fujitsu.com <leimaohui@fujitsu.com>
wrote:

> Hi, Alex
>
>
>
> I=E2=80=99m sorry, I think I got it, but it is better to confirm it with =
you.^-^
>
>
>
> =E2=80=9CUpstream-Status: Submitted [
> https://gitlab.com/gnutls/gnutls/-/issues/1373]=E2=80=9D
>
> Should be corrected to =EF=BC=9A
>
> =E2=80=9CUpstream-Status: Inappropriate [
> https://gitlab.com/gnutls/gnutls/-/issues/1373]=E2=80=9D
>
>
>
> Am I right?
>
>
>
> Best regards
>
> Lei
>
>
>
>
>
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Tuesday, May 24, 2022 12:37 PM
> *To:* Lei, Maohui <leimaohui@fujitsu.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH v4] gnutls: Added fips option.
>
>
>
> Please correct the upstream status to inappropriate, =E2=80=98submitted=
=E2=80=99 means
> the patch was actually sent upstream, =E2=80=98inappropriate=E2=80=99 mea=
ns the patch was
> not submitted, but an issue was raised with upstream to find a solution.
>
>
>
> Alex
>
>
>
> On Tue 24. May 2022 at 3.28, leimaohui <leimaohui@fujitsu.com> wrote:
>
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
> @@ -21,6 +21,7 @@ SHRT_VER =3D "
> ${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
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
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true',
> 'false', d)}; then
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

--0000000000009ad04605dfcd9189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes please, that is correct.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 25. May =
2022 at 2.15, <a href=3D"mailto:leimaohui@fujitsu.com">leimaohui@fujitsu.co=
m</a> &lt;<a href=3D"mailto:leimaohui@fujitsu.com">leimaohui@fujitsu.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)">





<div lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break=
-word">
<div class=3D"m_-1122990371342234813WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF">Hi,
</span><span lang=3D"EN-US">Alex<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF"><u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u>=
=C2=A0<u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF">I</span><span style=3D"font-size:10.5pt;font-fam=
ily:=E7=AD=89=E7=BA=BF">=E2=80=99<span lang=3D"EN-US" style=3D"font-family:=
=E7=AD=89=E7=BA=BF">m sorry, I think I got it, but it is better to confirm =
it with you.^-^<u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u><u style=3D"=
font-family:=E7=AD=89=E7=BA=BF"></u></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF"><u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u>=
=C2=A0<u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u></span></p>
<p class=3D"MsoNormal">=E2=80=9C<span lang=3D"EN-US">Upstream-Status: Submi=
tted [<a href=3D"https://gitlab.com/gnutls/gnutls/-/issues/1373" target=3D"=
_blank">https://gitlab.com/gnutls/gnutls/-/issues/1373</a>]</span>=E2=80=9D=
<span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:=E7=AD=89=E7=BA=
=BF"><u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u><u style=3D"font-famil=
y:=E7=AD=89=E7=BA=BF"></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF">Should be corrected to
</span><span style=3D"font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">=EF=
=BC=9A<span lang=3D"EN-US" style=3D"font-family:=E7=AD=89=E7=BA=BF"><u styl=
e=3D"font-family:=E7=AD=89=E7=BA=BF"></u><u style=3D"font-family:=E7=AD=89=
=E7=BA=BF"></u></span></span></p>
<p class=3D"MsoNormal">=E2=80=9C<span lang=3D"EN-US">Upstream-Status: Inapp=
ropriate [<a href=3D"https://gitlab.com/gnutls/gnutls/-/issues/1373" target=
=3D"_blank">https://gitlab.com/gnutls/gnutls/-/issues/1373</a>]</span>=E2=
=80=9D<span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Am I right?<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Lei<u></u><u></u></span></p></d=
iv></div><div lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"word-w=
rap:break-word"><div class=3D"m_-1122990371342234813WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF"><u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u>=
=C2=A0<u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u></span></p>
<div style=3D"border-style:none none none solid;border-left-width:1.5pt;pad=
ding:0cm 0cm 0cm 4pt;border-left-color:blue">
<div>
<div style=3D"border-style:solid none none;border-top-width:1pt;padding:3pt=
 0cm 0cm;border-top-color:rgb(225,225,225)">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" style=3D"font-family:=
Calibri,sans-serif">alex.kanavin@gmail.com</a>&gt;
<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Tuesday, May 24, 2022=
 12:37 PM<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Lei, Maohui &lt;<a href=
=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank" style=3D"font-family:Ca=
libri,sans-serif">leimaohui@fujitsu.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">openembedded-core@lists.openembedded.org</a><br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [OE-core] [PAT=
CH v4] gnutls: Added fips option.<u style=3D"font-family:Calibri,sans-serif=
"></u><u style=3D"font-family:Calibri,sans-serif"></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please correct the upstream sta=
tus to inappropriate,
</span>=E2=80=98<span lang=3D"EN-US">submitted</span>=E2=80=99<span lang=3D=
"EN-US"> means the patch was actually sent upstream,
</span>=E2=80=98<span lang=3D"EN-US">inappropriate</span>=E2=80=99<span lan=
g=3D"EN-US"> means the patch was not submitted, but an issue was raised wit=
h upstream to find a solution.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Alex<u></u><u></u></span></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Tue 24. May 2022 at 3.28, le=
imaohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank">leim=
aohui@fujitsu.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-style:none none none solid;border-left-width:1p=
t;padding:0cm 0cm 0cm 6pt;margin:5pt 0cm 5pt 4.8pt;border-left-color:rgb(20=
4,204,204)">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">- =
Added a patch to avoid excute fipshmac command. Because *.hmac<br>
file should be created on target instead of on build environment.<br>
- Added pkg_postinst_ontarget to make sure necessary files are<br>
created on target.<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" targ=
et=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...ile-should-be-excuted-in-target-envi.patch | 28 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.5.bb" target=
=3D"_blank">gnutls_3.7.5.bb</a>=C2=A0 =C2=A0| 24 +++++++++++++++-<br>
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
issues/1373" target=3D"_blank">https://gitlab.com/gnutls/gnutls/-/issues/13=
73</a>]<br>
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
+-.libs/.gnutls.hmac: <a href=3D"http://libgnutls.la" target=3D"_blank">lib=
gnutls.la</a> fipshmac<br>
+-=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) $(builddir)/fipshmac &gt; $@-t &amp;&amp=
; mv $@-t $@<br>
++.libs/.gnutls.hmac:<br>
+<br>
+ CLEANFILES =3D $(hmac_files)<br>
+ endif<br>
+--<br>
+2.25.1<br>
diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.5.bb"=
 target=3D"_blank">gnutls_3.7.5.bb</a> b/meta/recipes-support/gnutls/<a hre=
f=3D"http://gnutls_3.7.5.bb" target=3D"_blank">gnutls_3.7.5.bb</a><br>
index 5feedb7fdc..b796494b8d 100644<br>
--- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.5.bb" target=
=3D"_blank">gnutls_3.7.5.bb</a><br>
+++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.7.5.bb" target=
=3D"_blank">gnutls_3.7.5.bb</a><br>
@@ -21,6 +21,7 @@ SHRT_VER =3D &quot;<a href=3D"mailto:$%7b@d.getVar(&#39;P=
V&#39;).split(&#39;.&#39;)[0]%7d.$%7b@d.getVar(&#39;PV&#39;).split(&#39;.&#=
39;)[1]%7d" target=3D"_blank">${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[=
0]}.${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[1]}</a>&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://www.gnupg.org/ftp/gcrypt/gnutls/=
v$%7BSHRT_VER%7D/gnutls-$%7BPV%7D.tar.xz" target=3D"_blank">https://www.gnu=
pg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz</a> \<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"mailto:$%7b@bb.utils.contains(&#=
39;PACKAGECONFIG" target=3D"_blank">${@bb.utils.contains(&#39;PACKAGECONFIG=
</a>&#39;, &#39;fips&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
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
enembedded-core/message/166043" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/166043</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91303156/1686=
489" target=3D"_blank">
https://lists.openembedded.org/mt/91303156/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></span></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--0000000000009ad04605dfcd9189--

