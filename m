Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.974.1617057935423618527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 15:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JXGIfzcd;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id l13so10570249qtu.9
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 15:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=Po2lTWCqcXeItyiOp6INjYrW03y6bp5P3/wOGTYCXT4=;
        b=JXGIfzcdSHiJn/1IKrg0QzGuU2T5uTFbs4eiosynhgWf+1KkyugkcumdKnNONlLJ+p
         W0luJmJDPWHHnlO9l1Prz5fkggXn9aA2MLQL2yoeITEp3owGoXA35dBSfrXp7UIWK3FB
         lqo/C7oJKFsFkPTWNIQrgr6mTO1dpgYzaOa+ECMFDWKA21/xaUlHv9OcuLKUqY5QbhF+
         9FlfxMA+GVc0e3cVMmAGPeWrmOMQr4XNYr3E4Tt1NBpV0K31cO2emYDpsvxKngX8m4H4
         6GagRxsLvawo0e/KwF/B+UM+v/XyCxiggRqdDe04xlyzXlsq/C7Q7YK2Bd3SXkmyeJdh
         KMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=Po2lTWCqcXeItyiOp6INjYrW03y6bp5P3/wOGTYCXT4=;
        b=MVG3t05/vAzrpbRW5flXN0UM8z1k8MtxWSPAxJ6aVn0B2aGbL1D7fI5wMeN+aWmhqs
         18tbT+HLe6+ZSHqGJQ9nljiNW1O4DoKzzFFX+kjLNMjN25if0l/kmx2cnUHcVupB8bN6
         fpyVYrTZRzdPlAR8m3uuFHiY75ONZKu9CNb16HkiMzJkYDuFuUQnMjDkfgKPDgXkEwc7
         JsPIlx092zGBc5Rm6/4cTAbvaOsnFyadU4NcxCrzk4WHNZtEY53iDEgspNzK8auzT/qx
         NY9idoo0d7pW7iXg95+sON0fEwCowmnQIxgdaUNasnJ7/LIFroxKG9Un51gPnVDhTPFN
         BN1w==
X-Gm-Message-State: AOAM533aabaDK9q3+y1UqjZ3NGfI/aZmJSKT+HQbZ4o3NS2d1CsNFg7q
	NR2T/of1GFNNx4S7UDSy0wQ=
X-Google-Smtp-Source: ABdhPJxtnFHvcP1Wwjrshl0YevDGdWWYhD/u5khFiIrLK5UW4C2EYu7Is0NKtOrTwZOYvkjS6YCvAA==
X-Received: by 2002:ac8:4d8b:: with SMTP id a11mr24397545qtw.302.1617057934373;
        Mon, 29 Mar 2021 15:45:34 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:28cd:51dd:6cf0:14e0? ([2804:14d:5487:a7d6:28cd:51dd:6cf0:14e0])
        by smtp.gmail.com with ESMTPSA id r35sm11954690qtd.95.2021.03.29.15.45.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Mar 2021 15:45:34 -0700 (PDT)
From: "Devendra Tewari" <devendra.tewari@gmail.com>
Message-Id: <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
Date: Mon, 29 Mar 2021 19:45:29 -0300
In-Reply-To: <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3EA19A8A-C7A8-4A73-9023-B32DE523E10B"

--Apple-Mail=_3EA19A8A-C7A8-4A73-9023-B32DE523E10B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Thanks! My bad. The example I looked up in Python docs had a break and I ju=
st realized it was a looping example.

Here=E2=80=99s the updated patch (or should I submit it again via git send=
-email?)

From 9deb390dcdcaef66cec2fae39454c7fb3c81c4e4 Mon Sep 17 00:00:00 2001
From: Devendra Tewari <devendra.tewari@gmail.com>
Date: Mon, 29 Mar 2021 19:41:02 -0300
Subject: [PATCH] Use shutil.move when os.rename fails

Incremental build in Docker fails with

OSError: [Errno 18] Invalid cross-device link

When source and destination are on different overlay filesystems.

This change handles the error with os.rename and retries with shutil.move.
---
 meta/classes/sstate.bbclass               | 22 ++++++++++++++++++----
 vscode-bitbake-build/executeBitBakeCmd.sh |  3 +++
 2 files changed, 21 insertions(+), 4 deletions(-)
 create mode 100755 vscode-bitbake-build/executeBitBakeCmd.sh

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f579168162..301dfc27db 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
 def sstate_installpkgdir(ss, d):
     import oe.path
     import subprocess
+    import shutil
=20
     sstateinst =3D d.getVar("SSTATE_INSTDIR")
     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
@@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):
=20
     for state in ss['dirs']:
         prepdir(state[1])
-        os.rename(sstateinst + state[0], state[1])
+        try:
+            os.rename(sstateinst + state[0], state[1])
+        except OSError:
+            shutil.move(sstateinst + state[0], state[1])
     sstate_install(ss, d)
=20
     for plain in ss['plaindirs']:
@@ -413,7 +417,10 @@ def sstate_installpkgdir(ss, d):
         dest =3D plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
-        os.rename(src, dest)
+        try:
+            os.rename(src, dest)
+        except OSError:
+            shutil.move(src, dest)
=20
     return True
=20
@@ -638,6 +645,7 @@ python sstate_hardcode_path () {
=20
 def sstate_package(ss, d):
     import oe.path
+    import shutil
=20
     tmpdir =3D d.getVar('TMPDIR')
=20
@@ -664,7 +672,10 @@ def sstate_package(ss, d):
                     continue
                 bb.error("sstate found an absolute path symlink %s pointi=
ng at %s. Please replace this with a relative link." % (srcpath, link))
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], =
sstatebuild + state[0]))
-        os.rename(state[1], sstatebuild + state[0])
+        try:
+            os.rename(state[1], sstatebuild + state[0])
+        except OSError:
+            shutil.move(state[1], sstatebuild + state[0])
=20
     workdir =3D d.getVar('WORKDIR')
     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
@@ -674,7 +685,10 @@ def sstate_package(ss, d):
             pdir =3D plain.replace(sharedworkdir, sstatebuild)
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
-        os.rename(plain, pdir)
+        try:
+            os.rename(plain, pdir)
+        except OSError:
+            shutil.move(plain, pdir)
=20
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
diff --git a/vscode-bitbake-build/executeBitBakeCmd.sh b/vscode-bitbake-bu=
ild/executeBitBakeCmd.sh
new file mode 100755
index 0000000000..d7a4c5a5aa
--- /dev/null
+++ b/vscode-bitbake-build/executeBitBakeCmd.sh
@@ -0,0 +1,3 @@
+#!/bin/bash
+. ./oe-init-build-env vscode-bitbake-build > /dev/null
+bitbake-layers show-layers
\ No newline at end of file
--=20
2.29.2


> On 29 Mar 2021, at 17:38, Richard Purdie <richard.purdie@linuxfoundation=
.org> wrote:
>=20
> On Mon, 2021-03-29 at 12:14 -0300, Devendra Tewari wrote:
>> ---
>>  meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> index f579168162..f94aa96d70 100644
>> --- a/meta/classes/sstate.bbclass
>> +++ b/meta/classes/sstate.bbclass
>> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
>>  def sstate_installpkgdir(ss, d):
>>      import oe.path
>>      import subprocess
>> +    import shutil
>>  
>>=20
>>      sstateinst =3D d.getVar("SSTATE_INSTDIR")
>>      d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
>> @@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
>>  
>>=20
>>      for state in ss['dirs']:
>>          prepdir(state[1])
>> -        os.rename(sstateinst + state[0], state[1])
>> +        try:
>> +            os.rename(sstateinst + state[0], state[1])
>> +            break
>=20
> That break should definitely not be there, that changes behaviour.
>=20
>> +        except OSError:
>> +            shutil.move(sstateinst + state[0], state[1])
>>      sstate_install(ss, d)
>>  
>>=20
>>      for plain in ss['plaindirs']:
>> @@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
>>          dest =3D plain
>>          bb.utils.mkdirhier(src)
>>          prepdir(dest)
>> -        os.rename(src, dest)
>> +        try:
>> +            os.rename(src, dest)
>> +            break
>=20
> Same here...
>=20
>> +        except OSError:
>> +            shutil.move(src, dest)
>>  
>>=20
>>      return True
>>  
>>=20
>> @@ -638,6 +647,7 @@ python sstate_hardcode_path () {
>>  
>>=20
>>  def sstate_package(ss, d):
>>      import oe.path
>> +    import shutil
>>  
>>=20
>>      tmpdir =3D d.getVar('TMPDIR')
>>  
>>=20
>> @@ -664,7 +674,11 @@ def sstate_package(ss, d):
>>                      continue
>>                  bb.error("sstate found an absolute path symlink %s poi=
nting at %s. Please replace this with a relative link." % (srcpath, link))
>>          bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1=
], sstatebuild + state[0]))
>> -        os.rename(state[1], sstatebuild + state[0])
>> +        try:
>> +            os.rename(state[1], sstatebuild + state[0])
>> +            break
>=20
> and again...
>=20
>> +        except OSError:
>> +            shutil.move(state[1], sstatebuild + state[0])
>>  
>>=20
>>      workdir =3D d.getVar('WORKDIR')
>>      sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
>> @@ -674,7 +688,11 @@ def sstate_package(ss, d):
>>              pdir =3D plain.replace(sharedworkdir, sstatebuild)
>>          bb.utils.mkdirhier(plain)
>>          bb.utils.mkdirhier(pdir)
>> -        os.rename(plain, pdir)
>> +        try:
>> +            os.rename(plain, pdir)
>> +            break
>=20
>=20
> and again...
>=20
>> +        except OSError:
>> +            shutil.move(plain, pdir)
>>  
>>=20
>>      d.setVar('SSTATE_BUILDDIR', sstatebuild)
>>      d.setVar('SSTATE_INSTDIR', sstatebuild)
>>=20


--Apple-Mail=_3EA19A8A-C7A8-4A73-9023-B32DE523E10B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D"">Thanks! My bad. The examp=
le I looked up in Python docs had a break and I just realized it was a loop=
ing example.<div class=3D""><br class=3D""></div><div class=3D"">Here=E2=80=
=
=99s the updated patch (or should I submit it again via git send-email?)</=
div><div class=3D""><br class=3D""></div><div class=3D""><div style=3D"marg=
in: 0px; font-stretch: normal; font-size: 11px; line-height: normal; font-f=
amily: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-=
ligatures: no-common-ligatures" class=3D"">From 9deb390dcdcaef66cec2fae3945=
4c7fb3c81c4e4 Mon Sep 17 00:00:00 2001</span></div><div style=3D"margin: 0p=
x; font-stretch: normal; font-size: 11px; line-height: normal; font-family:=
 Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatu=
res: no-common-ligatures" class=3D"">From: Devendra Tewari &lt;<a href=3D"m=
ailto:devendra.tewari@gmail.com" class=3D"">devendra.tewari@gmail.com</a>&g=
t;</span></div><div style=3D"margin: 0px; font-stretch: normal; font-size: =
11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=
=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
"">Date: Mon, 29 Mar 2021 19:41:02 -0300</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; font-famil=
y: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-liga=
tures: no-common-ligatures" class=3D"">Subject: [PATCH] Use shutil.move whe=
n os.rename fails</span></div><div style=3D"margin: 0px; font-stretch: norm=
al; font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0,=
 0, 0); min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures=
: no-common-ligatures" class=3D""></span><br class=3D""></div><div style=3D=
"margin: 0px; font-stretch: normal; font-size: 11px; line-height: normal; f=
ont-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-var=
iant-ligatures: no-common-ligatures" class=3D"">Incremental build in Docker=
 fails with</span></div><div style=3D"margin: 0px; font-stretch: normal; fo=
nt-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0)=
; min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: no-c=
ommon-ligatures" class=3D""></span><br class=3D""></div><div style=3D"margi=
n: 0px; font-stretch: normal; font-size: 11px; line-height: normal; font-fa=
mily: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-l=
igatures: no-common-ligatures" class=3D"">OSError: [Errno 18] Invalid cross=
-device link</span></div><div style=3D"margin: 0px; font-stretch: normal; f=
ont-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0=
); min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: no-=
common-ligatures" class=3D""></span><br class=3D""></div><div style=3D"marg=
in: 0px; font-stretch: normal; font-size: 11px; line-height: normal; font-f=
amily: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-=
ligatures: no-common-ligatures" class=3D"">When source and destination are =
on different overlay filesystems.</span></div><div style=3D"margin: 0px; fo=
nt-stretch: normal; font-size: 11px; line-height: normal; font-family: Menl=
o; color: rgb(0, 0, 0); min-height: 13px;" class=3D""><span style=3D"font-v=
ariant-ligatures: no-common-ligatures" class=3D""></span><br class=3D""></d=
iv><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-h=
eight: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span s=
tyle=3D"font-variant-ligatures: no-common-ligatures" class=3D"">This change=
 handles the error with os.rename and retries with shutil.move.</span></div=
><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-hei=
ght: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span sty=
le=3D"font-variant-ligatures: no-common-ligatures" class=3D"">---</span></d=
iv><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-h=
eight: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span s=
tyle=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;meta/=
classes/sstate.bbclass &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2=
2 ++++++++++++++++++----</span></div><div style=3D"margin: 0px; font-stretc=
h: normal; font-size: 11px; line-height: normal; font-family: Menlo; color:=
 rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common=
-ligatures" class=3D"">&nbsp;vscode-bitbake-build/executeBitBakeCmd.sh |&nb=
sp; 3 +++</span></div><div style=3D"margin: 0px; font-stretch: normal; font=
-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);"=
 class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" cla=
ss=3D"">&nbsp;2 files changed, 21 insertions(+), 4 deletions(-)</span></div=
><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-hei=
ght: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span sty=
le=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;create =
mode 100755 vscode-bitbake-build/executeBitBakeCmd.sh</span></div><div styl=
e=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: norma=
l; font-family: Menlo; color: rgb(0, 0, 0); min-height: 13px;" class=3D""><=
span style=3D"font-variant-ligatures: no-common-ligatures" class=3D""></spa=
n><br class=3D""></div><div style=3D"margin: 0px; font-stretch: normal; fon=
t-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);=
" class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" cl=
ass=3D"">diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbc=
lass</span></div><div style=3D"margin: 0px; font-stretch: normal; font-size=
: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
"">index f579168162..301dfc27db 100644</span></div><div style=3D"margin: 0p=
x; font-stretch: normal; font-size: 11px; line-height: normal; font-family:=
 Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatu=
res: no-common-ligatures" class=3D"">--- a/meta/classes/sstate.bbclass</spa=
n></div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; l=
ine-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><s=
pan style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">+++ b/=
meta/classes/sstate.bbclass</span></div><div style=3D"margin: 0px; font-str=
etch: normal; font-size: 11px; line-height: normal; font-family: Menlo; col=
or: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">@@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):=
</span></div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11=
px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D=
""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&=
nbsp;def sstate_installpkgdir(ss, d):</span></div><div style=3D"margin: 0px=
; font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatur=
es: no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; import oe.path</spa=
n></div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; l=
ine-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><s=
pan style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;=
&nbsp; &nbsp; import subprocess</span></div><div style=3D"margin: 0px; font=
-stretch: normal; font-size: 11px; line-height: normal; font-family: Menlo;=
 color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no=
-common-ligatures" class=3D"">+&nbsp; &nbsp; import shutil</span></div><p s=
tyle=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: no=
rmal; font-family: Menlo; color: rgb(0, 0, 0); min-height: 13px;" class=3D"=
"><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&n=
bsp;</span><br class=3D"webkit-block-placeholder"></p><div style=3D"margin:=
 0px; font-stretch: normal; font-size: 11px; line-height: normal; font-fami=
ly: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-lig=
atures: no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; sstateinst =3D =
d.getVar("SSTATE_INSTDIR")</span></div><div style=3D"margin: 0px; font-stre=
tch: normal; font-size: 11px; line-height: normal; font-family: Menlo; colo=
r: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-comm=
on-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; d.setVar('SSTATE_FIXMEDIR', ss=
['fixmedir'])</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, =
0);" class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D"">@@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):</span></d=
iv><p style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-hei=
ght: normal; font-family: Menlo; color: rgb(0, 0, 0); min-height: 13px;" cl=
ass=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=3D"">&nbsp;</span><br class=3D"webkit-block-placeholder"></p><div style=
=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: norma=
l; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font=
-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; for=
 state in ss['dirs']:</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: rg=
b(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common-li=
gatures" class=3D"">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; prepdir(state[1])</sp=
an></div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><=
span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">-&nbs=
p; &nbsp; &nbsp; &nbsp; os.rename(sstateinst + state[0], state[1])</span></=
div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-=
height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">+&nbsp; &n=
bsp; &nbsp; &nbsp; try:</span></div><div style=3D"margin: 0px; font-stretch=
: normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common-=
ligatures" class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; os.rename(=
sstateinst + state[0], state[1])</span></div><div style=3D"margin: 0px; fon=
t-stretch: normal; font-size: 11px; line-height: normal; font-family: Menlo=
; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: n=
o-common-ligatures" class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; except OSError:=
</span></div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11=
px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D=
""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">+=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; shutil.move(sstateinst + state[0]=
, state[1])</span></div><div style=3D"margin: 0px; font-stretch: normal; fo=
nt-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0)=
;" class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" c=
lass=3D"">&nbsp;&nbsp; &nbsp; sstate_install(ss, d)</span></div><p style=3D=
"margin: 0px; font-stretch: normal; font-size: 11px; line-height: normal; f=
ont-family: Menlo; color: rgb(0, 0, 0); min-height: 13px;" class=3D""><span=
 style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;</s=
pan><br class=3D"webkit-block-placeholder"></p><div style=3D"margin: 0px; f=
ont-stretch: normal; font-size: 11px; line-height: normal; font-family: Men=
lo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures:=
 no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; for plain in ss['plain=
dirs']:</span></div><div style=3D"margin: 0px; font-stretch: normal; font-s=
ize: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" c=
lass=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=
=3D"">@@ -413,7 +417,10 @@ def sstate_installpkgdir(ss, d):</span></div><d=
iv style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height=
: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=
=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;&nbsp; &=
nbsp; &nbsp; &nbsp; dest =3D plain</span></div><div style=3D"margin: 0px; f=
ont-stretch: normal; font-size: 11px; line-height: normal; font-family: Men=
lo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures:=
 no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; bb.utils=
.mkdirhier(src)</span></div><div style=3D"margin: 0px; font-stretch: normal=
; font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0=
, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common-ligature=
s" class=3D"">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; prepdir(dest)</span></div><=
div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heigh=
t: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=
=
=3D"font-variant-ligatures: no-common-ligatures" class=3D"">-&nbsp; &nbsp;=
 &nbsp; &nbsp; os.rename(src, dest)</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: Me=
nlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures=
: no-common-ligatures" class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; try:</span><=
/div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line=
-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">+&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; os.rename(src, dest)</span></div><div sty=
le=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: norm=
al; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"fon=
t-variant-ligatures: no-common-ligatures" class=3D"">+&nbsp; &nbsp; &nbsp; =
&nbsp; except OSError:</span></div><div style=3D"margin: 0px; font-stretch:=
 normal; font-size: 11px; line-height: normal; font-family: Menlo; color: r=
gb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common-l=
igatures" class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; shutil.move=
(src, dest)</span></div><p style=3D"margin: 0px; font-stretch: normal; font=
-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0); =
min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">&nbsp;</span><br class=3D"webkit-block-placeholde=
r"></p><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; li=
ne-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><sp=
an style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;&=
nbsp; &nbsp; return True</span></div><p style=3D"margin: 0px; font-stretch:=
 normal; font-size: 11px; line-height: normal; font-family: Menlo; color: r=
gb(0, 0, 0); min-height: 13px;" class=3D""><span style=3D"font-variant-liga=
tures: no-common-ligatures" class=3D"">&nbsp;</span><br class=3D"webkit-blo=
ck-placeholder"></p><div style=3D"margin: 0px; font-stretch: normal; font-s=
ize: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" c=
lass=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=
=3D"">@@ -638,6 +645,7 @@ python sstate_hardcode_path () {</span></div><p =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: n=
ormal; font-family: Menlo; color: rgb(0, 0, 0); min-height: 13px;" class=3D=
""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&=
nbsp;</span><br class=3D"webkit-block-placeholder"></p><div style=3D"margin=
: 0px; font-stretch: normal; font-size: 11px; line-height: normal; font-fam=
ily: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-li=
gatures: no-common-ligatures" class=3D"">&nbsp;def sstate_package(ss, d):</=
span></div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px=
; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""=
><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nb=
sp;&nbsp; &nbsp; import oe.path</span></div><div style=3D"margin: 0px; font=
-stretch: normal; font-size: 11px; line-height: normal; font-family: Menlo;=
 color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no=
-common-ligatures" class=3D"">+&nbsp; &nbsp; import shutil</span></div><p s=
tyle=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: no=
rmal; font-family: Menlo; color: rgb(0, 0, 0); min-height: 13px;" class=3D"=
"><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&n=
bsp;</span><br class=3D"webkit-block-placeholder"></p><div style=3D"margin:=
 0px; font-stretch: normal; font-size: 11px; line-height: normal; font-fami=
ly: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-lig=
atures: no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; tmpdir =3D d.ge=
tVar('TMPDIR')</span></div><p style=3D"margin: 0px; font-stretch: normal; f=
ont-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0=
); min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: no-=
common-ligatures" class=3D"">&nbsp;</span><br class=3D"webkit-block-placeho=
lder"></p><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px;=
 line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D"">=
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">@@ -=
664,7 +672,10 @@ def sstate_package(ss, d):</span></div><div style=3D"margi=
n: 0px; font-stretch: normal; font-size: 11px; line-height: normal; font-fa=
mily: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-l=
igatures: no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue</span></div><div style=
=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: norma=
l; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font=
-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.error("sstate found an absolute p=
ath symlink %s pointing at %s. Please replace this with a relative link." %=
 (srcpath, link))</span></div><div style=3D"margin: 0px; font-stretch: norm=
al; font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0,=
 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common-ligatu=
res" class=3D"">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; bb.debug(2, "Preparing tr=
ee %s for packaging at %s" % (state[1], sstatebuild + state[0]))</span></di=
v><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-he=
ight: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span st=
yle=3D"font-variant-ligatures: no-common-ligatures" class=3D"">-&nbsp; &nbs=
p; &nbsp; &nbsp; os.rename(state[1], sstatebuild + state[0])</span></div><d=
iv style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height=
: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=
=3D"font-variant-ligatures: no-common-ligatures" class=3D"">+&nbsp; &nbsp;=
 &nbsp; &nbsp; try:</span></div><div style=3D"margin: 0px; font-stretch: no=
rmal; font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(=
0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common-liga=
tures" class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; os.rename(stat=
e[1], sstatebuild + state[0])</span></div><div style=3D"margin: 0px; font-s=
tretch: normal; font-size: 11px; line-height: normal; font-family: Menlo; c=
olor: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-c=
ommon-ligatures" class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; except OSError:</s=
pan></div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px;=
 line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D"">=
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">+&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; shutil.move(state[1], sstatebuild + =
state[0])</span></div><p style=3D"margin: 0px; font-stretch: normal; font-s=
ize: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0); mi=
n-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: no-commo=
n-ligatures" class=3D"">&nbsp;</span><br class=3D"webkit-block-placeholder"=
></p><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line=
-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;&nb=
sp; &nbsp; workdir =3D d.getVar('WORKDIR')</span></div><div style=3D"margin=
: 0px; font-stretch: normal; font-size: 11px; line-height: normal; font-fam=
ily: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-li=
gatures: no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; sharedworkdir =
=
=3D os.path.join(d.getVar('TMPDIR'), "work-shared")</span></div><div style=
=
=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: norma=
l; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font=
-variant-ligatures: no-common-ligatures" class=3D"">@@ -674,7 +685,10 @@ de=
f sstate_package(ss, d):</span></div><div style=3D"margin: 0px; font-stretc=
h: normal; font-size: 11px; line-height: normal; font-family: Menlo; color:=
 rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common=
-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pdir=
 =3D plain.replace(sharedworkdir, sstatebuild)</span></div><div style=3D"ma=
rgin: 0px; font-stretch: normal; font-size: 11px; line-height: normal; font=
-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-varian=
t-ligatures: no-common-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; &nbsp; &nb=
sp; bb.utils.mkdirhier(plain)</span></div><div style=3D"margin: 0px; font-s=
tretch: normal; font-size: 11px; line-height: normal; font-family: Menlo; c=
olor: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-c=
ommon-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; bb.utils.mkdi=
rhier(pdir)</span></div><div style=3D"margin: 0px; font-stretch: normal; fo=
nt-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0)=
;" class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" c=
lass=3D"">-&nbsp; &nbsp; &nbsp; &nbsp; os.rename(plain, pdir)</span></div><=
div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heigh=
t: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=
=
=3D"font-variant-ligatures: no-common-ligatures" class=3D"">+&nbsp; &nbsp;=
 &nbsp; &nbsp; try:</span></div><div style=3D"margin: 0px; font-stretch: no=
rmal; font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(=
0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common-liga=
tures" class=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; os.rename(plai=
n, pdir)</span></div><div style=3D"margin: 0px; font-stretch: normal; font-=
size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" clas=
s=3D"">+&nbsp; &nbsp; &nbsp; &nbsp; except OSError:</span></div><div style=
=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: norma=
l; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font=
-variant-ligatures: no-common-ligatures" class=3D"">+&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; shutil.move(plain, pdir)</span></div><p style=3D"margin=
: 0px; font-stretch: normal; font-size: 11px; line-height: normal; font-fam=
ily: Menlo; color: rgb(0, 0, 0); min-height: 13px;" class=3D""><span style=
=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp;</span><=
br class=3D"webkit-block-placeholder"></p><div style=3D"margin: 0px; font-s=
tretch: normal; font-size: 11px; line-height: normal; font-family: Menlo; c=
olor: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-c=
ommon-ligatures" class=3D"">&nbsp;&nbsp; &nbsp; d.setVar('SSTATE_BUILDDIR',=
 sstatebuild)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, =
0);" class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D"">&nbsp;&nbsp; &nbsp; d.setVar('SSTATE_INSTDIR', sstatebuild)</sp=
an></div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><=
span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">diff =
--git a/vscode-bitbake-build/executeBitBakeCmd.sh b/vscode-bitbake-build/ex=
ecuteBitBakeCmd.sh</span></div><div style=3D"margin: 0px; font-stretch: nor=
mal; font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0=
, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: no-common-ligat=
ures" class=3D"">new file mode 100755</span></div><div style=3D"margin: 0px=
; font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatur=
es: no-common-ligatures" class=3D"">index 0000000000..d7a4c5a5aa</span></di=
v><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-he=
ight: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span st=
yle=3D"font-variant-ligatures: no-common-ligatures" class=3D"">--- /dev/nul=
l</span></div><div style=3D"margin: 0px; font-stretch: normal; font-size: 1=
1px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=
=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
"">+++ b/vscode-bitbake-build/executeBitBakeCmd.sh</span></div><div style=
=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-height: norma=
l; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font=
-variant-ligatures: no-common-ligatures" class=3D"">@@ -0,0 +1,3 @@</span><=
/div><div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line=
-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">+#!/bin/b=
ash</span></div><div style=3D"margin: 0px; font-stretch: normal; font-size:=
 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=
=
=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
"">+. ./oe-init-build-env vscode-bitbake-build &gt; /dev/null</span></div><=
div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heigh=
t: normal; font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=
=
=3D"font-variant-ligatures: no-common-ligatures" class=3D"">+bitbake-layer=
s show-layers</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, 0, =
0);" class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D"">\ No newline at end of file</span></div><div style=3D"margin: 0=
px; font-stretch: normal; font-size: 11px; line-height: normal; font-family=
: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligat=
ures: no-common-ligatures" class=3D"">--&nbsp;</span></div><div style=3D"ma=
rgin: 0px; font-stretch: normal; font-size: 11px; line-height: normal; font=
-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span style=3D"font-varian=
t-ligatures: no-common-ligatures" class=3D"">2.29.2</span></div><div class=
=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
""><br class=3D""></span></div><div><br class=3D""><blockquote type=3D"cite=
" class=3D""><div class=3D"">On 29 Mar 2021, at 17:38, Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" class=3D"">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:</div><br class=3D"Apple-interchange-=
newline"><div class=3D""><meta charset=3D"UTF-8" class=3D""><span style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none; float: none; display: inline !important;" class=3D"">On Mon, =
2021-03-29 at 12:14 -0300, Devendra Tewari wrote:</span><br style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: Helveti=
ca; font-size: 12px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; orphans: auto; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; widows: auto; wor=
d-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">---<br class=3D"">&nbsp;meta/classe=
s/sstate.bbclass | 26 ++++++++++++++++++++++----<br class=3D"">&nbsp;1 file=
 changed, 22 insertions(+), 4 deletions(-)<br class=3D""><br class=3D"">dif=
f --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br clas=
s=3D"">index f579168162..f94aa96d70 100644<br class=3D"">--- a/meta/classes=
/sstate.bbclass<br class=3D"">+++ b/meta/classes/sstate.bbclass<br class=3D=
"">@@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):<br class=3D"">&nbsp;de=
f sstate_installpkgdir(ss, d):<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
import oe.path<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;import subproces=
s<br class=3D"">+ &nbsp;&nbsp;&nbsp;import shutil<br class=3D"">&nbsp;<br c=
lass=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sstateinst =3D d.get=
Var("SSTATE_INSTDIR")<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.setVar(=
'SSTATE_FIXMEDIR', ss['fixmedir'])<br class=3D"">@@ -401,7 +402,11 @@ def s=
state_installpkgdir(ss, d):<br class=3D"">&nbsp;<br class=3D""><br class=3D=
"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for state in ss['dirs']:<br class=3D"">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prepdir(state[1])<br cla=
ss=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(sstateinst + =
state[0], state[1])<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;try:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;os.rename(sstateinst + state[0], state[1])<br class=3D"">+ &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break<br c=
lass=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none; float: none; display: inline !important;" class=3D"">Tha=
t break should definitely not be there, that changes behaviour.</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); f=
ont-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><b=
lockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; f=
ont-style: normal; font-variant-caps: normal; font-weight: normal; letter-s=
pacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; widows: auto; word-spacing: 0px; -webki=
t-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except OSErro=
r:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;shutil.move(sstateinst + state[0], state[1])<br class=3D"">&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;sstate_install(ss, d)<br class=3D"">&nbsp;<br class=
=
=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for plain in ss['plaind=
irs']:<br class=3D"">@@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):<=
br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dest =
=3D plain<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;bb.utils.mkdirhier(src)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;prepdir(dest)<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;os.rename(src, dest)<br class=3D"">+ &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;try:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(src, dest)<br class=3D"">+ &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break<br clas=
s=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none; float: none; display: inline !important;" class=3D"">Same here=
...</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none;" class=3D""><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; orphans: auto; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; widows: auto; word-spaci=
ng: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;" class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;except OSError:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;shutil.move(src, dest)<br class=3D"">&nbsp;<br cla=
ss=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return True<br class=
=3D"">&nbsp;<br class=3D""><br class=3D"">@@ -638,6 +647,7 @@ python sstat=
e_hardcode_path () {<br class=3D"">&nbsp;<br class=3D""><br class=3D"">&nbs=
p;def sstate_package(ss, d):<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;im=
port oe.path<br class=3D"">+ &nbsp;&nbsp;&nbsp;import shutil<br class=3D"">=
&nbsp;<br class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tmpdir =
=3D d.getVar('TMPDIR')<br class=3D"">&nbsp;<br class=3D""><br class=3D"">@=
@ -664,7 +674,11 @@ def sstate_package(ss, d):<br class=3D"">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;continue<br class=3D"">&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;bb.error("sstate found an absolute path symlink %s pointing at =
%s. Please replace this with a relative link." % (srcpath, link))<br class=
=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.debug(2, "P=
reparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))=
<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(state[=
1], sstatebuild + state[0])<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;try:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;os.rename(state[1], sstatebuild + state[0])<br class=
=
=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
break<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 12px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><sp=
an style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
2px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">and again...</span><br style=3D"caret-color: rgb(0, 0, 0); font-fami=
ly: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D""><blockquote type=3D"cite" style=3D"font-fami=
ly: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; orphans: auto; text-align:=
 start; text-indent: 0px; text-transform: none; white-space: normal; widows=
: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-str=
oke-width: 0px; text-decoration: none;" class=3D"">+ &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;except OSError:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shutil.move(state[1], sstatebuil=
d + state[0])<br class=3D"">&nbsp;<br class=3D""><br class=3D"">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;workdir =3D d.getVar('WORKDIR')<br class=3D"">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "wor=
k-shared")<br class=3D"">@@ -674,7 +688,11 @@ def sstate_package(ss, d):<br=
 class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;pdir =3D plain.replace(sharedworkdir, sstatebuild)<br class=
=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.utils.mkdir=
hier(plain)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;bb.utils.mkdirhier(pdir)<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;os.rename(plain, pdir)<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;try:<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.rename(plain, pdir)<br class=3D"">+ &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break<br class=
=
=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D""><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none; float: none; display: i=
nline !important;" class=3D"">and again...</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica=
; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weig=
ht: normal; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cit=
e" style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; orpha=
ns: auto; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: a=
uto; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+ &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except OSError:<br class=3D"">+ &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shutil.move=
(plain, pdir)<br class=3D"">&nbsp;<br class=3D""><br class=3D"">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;d.setVar('SSTATE_BUILDDIR', sstatebuild)<br class=3D"">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.setVar('SSTATE_INSTDIR', sstatebuild)<br cla=
ss=3D""></blockquote></div></blockquote></div><br class=3D""></div></body><=
/html>

--Apple-Mail=_3EA19A8A-C7A8-4A73-9023-B32DE523E10B--
