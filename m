Return-Path: <komal.pal2904@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE62DC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:12:53 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web08.18.1650646425710418048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 09:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EhszRo7r;
 spf=pass (domain: gmail.com, ip: 209.85.128.176,
 mailfrom: komal.pal2904@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2f18982c255so91694487b3.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mtR1ZKlXGRkBG5vjyeFNjaRBNT9csEaYwSO2Jgb4iug=;
        b=EhszRo7rPjsFKdMWiaOQiWoifHyAb6fFQPGIw65OLliE6SO1pJ8WHMa2TTqGk2wSAM
         B4IVQ/C6eDD1XcuspSNOwtMnwKx5q32NhAsT2Kt+iFFhji9X9dq3SXF1AG/cYHB1FgGM
         qEz5abx+Axy6VxM2hkmHcXN9JuWmSSln6pbkewlKtjt9b700zHLMPGZCXVfrFflIKaDY
         nkfc4yBgbMD7rmxNRJVmTyu2ugvMsytcA3aNi5SDfhwb2+AfJxSKowGwoeuwcG0THAUy
         CKUwo5jLGljj1HHhb2GuWV3ApDxsBwtcVFMu6Kfdz4gkZpKx+Lcvr1OOY2zDtVtJvwpa
         bgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtR1ZKlXGRkBG5vjyeFNjaRBNT9csEaYwSO2Jgb4iug=;
        b=eZaj7sMS2dISdQMzByjRSj2vREEbe8GHwH1sku+lmGqHhLEr6loC+sFP0B0LAprVG3
         AglyDs+zwiJiIICvysDEhGhq1WNPZwMPlpv629B+/Og21484hWwvA4mjn4cNTPtGwUAz
         F3P/iaSnij7N+NqracpA1HMCjcv5sKAtU9tudrRq4YDntAbl3d9QTxvr/NyBfpoZc1pa
         UbO8O1DYEp41jM+9sVoKto0O8tteGfjXSwEjgjAuY/x9cT/UlDN6E04CNaeVw1CeVlig
         eDD82GOr660i5jWIJTkwBe77jh93y3sgtI2WlD1OBh22Qt0stX3b8QT08v+CVOWEGv5X
         myAg==
X-Gm-Message-State: AOAM5301kprsCZh2EM+GXNB6glEe82NceUzgPM/HZ3IM05APsfh0FfP9
	MpvXXmfCafOKzOTwVECm+gHrKmrFqdgkDdHyt2OfyJp4dvKl6PBH
X-Google-Smtp-Source: 
 ABdhPJznSi7FJdhO4Nur5QtKjYDVDS9uBREvWIXgH1e8YcGVvFBjc/+C+NOGZ0Dh8T7nak4RH0vGRzkWY3ydVzBNpy0=
X-Received: by 2002:a0d:dfc1:0:b0:2f4:e5d8:3352 with SMTP id
 i184-20020a0ddfc1000000b002f4e5d83352mr4712334ywe.28.1650646424793; Fri, 22
 Apr 2022 09:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <16E83228D5A37919.30512@lists.openembedded.org>
In-Reply-To: <16E83228D5A37919.30512@lists.openembedded.org>
From: Komal Pal <komal.pal2904@gmail.com>
Date: Fri, 22 Apr 2022 22:23:33 +0530
Message-ID: 
 <CAO6y4bFHP7OO3EoD-WPsxhEX__uQBE1vUm5_CzFOm3wfVh1Z4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner-curl
To: openembedded-core@lists.openembedded.org
Cc: komal7209 <komal.pal_7@yahoo.com>
Content-Type: multipart/alternative; boundary="000000000000ccb45705dd411155"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 19:12:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164796

--000000000000ccb45705dd411155
Content-Type: text/plain; charset="UTF-8"

Error facing while solving that ptest issue:

1. I'm getting this error in .bb file of curl :
https://pastebin.com/a4TWSncX due to this code snippet being added in .bb
being added from previous patch

do_compile_ptest() {

#oe_runmake buildtest-TESTS

oe_runmake test

oe_runmake -C ${B}/tests/data/ show

oe_runmake -C ${B}/tests/server

}

2. if in .bb layer in RDEPENDS if we are getting error for python packages
only then in which path those python packages are required so that they
dont show those errors for python

3. And as per the previous issue it was having a webpage link to runtest.p1
, so the patch were having line to fetch that runtest.p1 thus added that to
.bb file , but now getting these errors... https://pastebin.com/Bjx50axz

4. but as that issue is few years back old, just wanted to know if there is
some update in that runtest.p1 file

5. Earlier there was issue with that
0001-replace-krb5-config-with-pkg-config.patch, file but it is not already
present in master branch, so i have copied this from my-honister branch,
but it was giving issues for  this thing : https://pastebin.com/3HjgJd16  ,
so according to this, I have checked :
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations
<https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations>:
but again what exactly it wanted to convey , I was unable to get



[image: Mailtrack]
<https://mailtrack.io?utm_source=gmail&utm_medium=signature&utm_campaign=signaturevirality11&>
Sender
notified by
Mailtrack
<https://mailtrack.io?utm_source=gmail&utm_medium=signature&utm_campaign=signaturevirality11&>
22/04/22,
10:23:26 pm

On Fri, Apr 22, 2022 at 4:16 PM komal7209 via lists.openembedded.org
<komal.pal2904=gmail.com@lists.openembedded.org> wrote:

> ---
>  meta/recipes-support/curl/curl/run-ptest | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/run-ptest
>
> diff --git a/meta/recipes-support/curl/curl/run-ptest
> b/meta/recipes-support/curl/curl/run-ptest
> new file mode 100644
> index 0000000000..4435f7dee4
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +cd tests
> +./runtests.pl -a -n -s | sed \
> +     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
> +     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
> +     -e 's/Warning: test[0-9]\+ not present in
> tests\/data\/Makefile.inc//'
> \ No newline at end of file
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164785):
> https://lists.openembedded.org/g/openembedded-core/message/164785
> Mute This Topic: https://lists.openembedded.org/mt/90625146/6879064
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> komal.pal2904@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ccb45705dd411155
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><span id=3D"gmail-docs-internal-guid-=
dbe756ae-7fff-a9be-0808-31991c66db0d"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:12pt;font-fa=
mily:Roboto,sans-serif;color:rgb(51,51,51);font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Er=
ror facing while solving that ptest issue:</span></p><br><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:12pt;font-family:Roboto,sans-serif;color:rgb(51,51,51);font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">1. </span><span style=3D"font-size:10.5pt;font-family:Aria=
l;color:rgb(23,25,28);font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">I&#39;m getting this er=
ror in .bb file of curl : </span><a href=3D"https://pastebin.com/a4TWSncX" =
style=3D"text-decoration-line:none"><span style=3D"font-size:10.5pt;font-fa=
mily:Arial;color:rgb(35,140,245);font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">https://past=
ebin.com/a4TWSncX</span></a><span style=3D"font-size:10.5pt;font-family:Ari=
al;color:rgb(23,25,28);font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap"> due to this code snip=
pet being added in .bb being added from previous patch=C2=A0</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;background-color:rgb(246,247,248);marg=
in-top:0pt;margin-bottom:0pt;padding:0pt 0pt 12pt"><span style=3D"font-size=
:10.5pt;font-family:Arial;color:rgb(23,25,28);background-color:rgb(255,255,=
255);font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">do_compile_ptest() {</span></p><p dir=3D=
"ltr" style=3D"line-height:1.38;background-color:rgb(246,247,248);margin-to=
p:0pt;margin-bottom:0pt;padding:0pt 0pt 12pt"><span style=3D"font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">#oe_runmake buildtest-TESTS</span></p><p dir=3D"ltr" st=
yle=3D"line-height:1.38;background-color:rgb(246,247,248);margin-top:0pt;ma=
rgin-bottom:0pt;padding:0pt 0pt 12pt"><span style=3D"font-size:10.5pt;font-=
family:Arial;color:rgb(23,25,28);background-color:rgb(255,255,255);font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">oe_runmake test</span></p><p dir=3D"ltr" style=3D"lin=
e-height:1.38;background-color:rgb(246,247,248);margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:10.5pt;font-family:Arial;color:rgb(23,25,28=
);background-color:rgb(255,255,255);font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">oe_runmak=
e -C ${B}/tests/data/ show</span></p><p dir=3D"ltr" style=3D"line-height:1.=
38;background-color:rgb(246,247,248);margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:10.5pt;font-family:Arial;color:rgb(23,25,28);backgroun=
d-color:rgb(255,255,255);font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">oe_runmake -C ${B}/t=
ests/server</span></p><p dir=3D"ltr" style=3D"line-height:1.38;background-c=
olor:rgb(246,247,248);margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:10.5pt;font-family:Arial;color:rgb(23,25,28);background-color:rgb(255=
,255,255);font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap">}</span></p><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:12pt;font-family:Roboto,sans-serif;color:rgb(51,51,51);font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">2. </span><span style=3D"font-size:11.5pt;font-family:Arial;col=
or:rgb(23,25,28);font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">if in .bb layer in RDEPENDS =
if we are getting error for python packages only then in which path those p=
ython packages are required so that they dont show those errors for python<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:12pt;font-family:Roboto,sans-serif;color=
:rgb(51,51,51);font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap">3. </span><span style=3D"font-=
size:10.5pt;font-family:Arial;color:rgb(23,25,28);background-color:rgb(246,=
247,248);font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">And as per the previous issue it was=
 having a webpage link to runtest.p1 , so the patch were having line to fet=
ch that runtest.p1 thus added that to .bb file , but now getting these erro=
rs...</span><a href=3D"https://pastebin.com/Bjx50axz" style=3D"text-decorat=
ion-line:none"><span style=3D"font-size:10.5pt;font-family:Arial;color:rgb(=
23,25,28);background-color:rgb(246,247,248);font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"> =
</span><span style=3D"font-size:10.5pt;font-family:Arial;color:rgb(35,140,2=
45);background-color:rgb(246,247,248);font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">https:/=
/pastebin.com/Bjx50axz</span></a></p><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:12pt;font-fam=
ily:Roboto,sans-serif;color:rgb(51,51,51);font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">4. =
</span><span style=3D"font-size:10.5pt;font-family:Arial;color:rgb(23,25,28=
);background-color:rgb(246,247,248);font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">but as th=
at issue is few years back old, just wanted to know if there is some update=
 in that runtest.p1 file</span></p><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10.5pt;font-fam=
ily:Arial;color:rgb(23,25,28);background-color:rgb(246,247,248);font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">5. Earlier there was issue with that 0001-replace-krb5-c=
onfig-with-pkg-config.patch, file but it is not already present in master b=
ranch, so i have copied this from my-honister branch, but it was giving iss=
ues for=C2=A0 this thing :</span><a href=3D"https://pastebin.com/3HjgJd16" =
style=3D"text-decoration-line:none"><span style=3D"font-size:10.5pt;font-fa=
mily:Arial;color:rgb(23,25,28);background-color:rgb(246,247,248);font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap"> </span><span style=3D"font-size:10.5pt;font-family:Ari=
al;color:rgb(35,140,245);background-color:rgb(246,247,248);font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">https://pastebin.com/3HjgJd16</span></a><span style=3D"font-s=
ize:10.5pt;font-family:Arial;color:rgb(23,25,28);background-color:rgb(246,2=
47,248);font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">=C2=A0 , so according to this, I have=
 checked : </span><a href=3D"https://www.openembedded.org/wiki/Commit_Patch=
_Message_Guidelines#Patch_Header_Recommendations" style=3D"text-decoration-=
line:none"><span style=3D"font-size:10.5pt;font-family:Arial;color:rgb(23,2=
5,28);background-color:rgb(246,247,248);font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=
=A0</span><span style=3D"font-size:10.5pt;font-family:Arial;color:rgb(35,14=
0,245);background-color:rgb(246,247,248);font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">http=
s://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_=
Recommendations</span></a><span style=3D"font-size:10.5pt;font-family:Arial=
;color:rgb(23,25,28);background-color:rgb(246,247,248);font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">: but again what exactly it wanted to convey , I was unable to ge=
t</span></p></span><br class=3D"gmail-Apple-interchange-newline"><br><br><d=
iv id=3D"mt-signature">
        <table border=3D"0" cellpadding=3D"8" cellspacing=3D"0" style=3D"us=
er-select: none;">
            <tbody><tr>
                <td>
                    <a id=3D"signatureLink-logo" href=3D"https://mailtrack.=
io?utm_source=3Dgmail&amp;utm_medium=3Dsignature&amp;utm_campaign=3Dsignatu=
revirality11&amp;" class=3D"" style=3D"text-decoration:none">
                        <img src=3D"https://s3.amazonaws.com/mailtrack-sign=
ature/sender-notified-72.gif" alt=3D"Mailtrack" class=3D"" width=3D"32" hei=
ght=3D"32">
                    </a>
                </td>
                <td>
                    <span style=3D"color:#777">Sender notified by</span> <b=
r>
                    <a id=3D"signatureLink-text" href=3D"https://mailtrack.=
io?utm_source=3Dgmail&amp;utm_medium=3Dsignature&amp;utm_campaign=3Dsignatu=
revirality11&amp;" class=3D"mt-install" style=3D"color:#4374f7">Mailtrack</=
a>
                   =20
    </td><td><span style=3D"color:transparent;font-size:0">22/04/22, 10:23:=
26 pm</span></td>

               =20
                <td>
                   =20
                </td>
            </tr>
        </tbody></table>
    </div></div><br><img width=3D"0" height=3D"0" class=3D"mailtrack-img" a=
lt=3D"" style=3D"display:flex" src=3D"https://mailtrack.io/trace/mail/cfb83=
a55dfada65366a7daeec1be8a3a52da6367.png?u=3D6628894"><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 22, 2022 at 4:16 PM =
komal7209 via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;komal.pal2904=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0meta/recipes-support/curl/curl/run-ptest | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/run-ptest<br>
<br>
diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-suppor=
t/curl/curl/run-ptest<br>
new file mode 100644<br>
index 0000000000..4435f7dee4<br>
--- /dev/null<br>
+++ b/meta/recipes-support/curl/curl/run-ptest<br>
@@ -0,0 +1,6 @@<br>
+#!/bin/sh<br>
+cd tests<br>
+./<a href=3D"http://runtests.pl" rel=3D"noreferrer" target=3D"_blank">runt=
ests.pl</a> -a -n -s | sed \<br>
+=C2=A0 =C2=A0 =C2=A0-e &#39;s|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|&#3=
9; \<br>
+=C2=A0 =C2=A0 =C2=A0-e &#39;s|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2=
|&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0-e &#39;s/Warning: test[0-9]\+ not present in tests\/d=
ata\/Makefile.inc//&#39;<br>
\ No newline at end of file<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164785): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164785" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164785</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90625146/6879=
064" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90625146/6879064</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:komal.pal2904@gmail.com" t=
arget=3D"_blank">komal.pal2904@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ccb45705dd411155--

