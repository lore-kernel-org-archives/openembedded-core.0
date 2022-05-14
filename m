Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2572C433EF
	for <webhook@archiver.kernel.org>; Sat, 14 May 2022 21:43:04 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.10770.1652564576549911688
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 14:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BvFe2F4V;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id p4so9695920qtq.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 14:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVcOkbgBkvZ2NxJVt0162zpzc8FHx9Yuj+UIzlv+Jxg=;
        b=BvFe2F4VLE2psMtDED/62riOnSeiEb6wpUxXLqvUH3QOrzO+l0IWIT6EPFxJrKboqm
         m1JuWtJmreLwL3iBOFazLEvHuxU1z6PYN8d1/NVuRbBJzEYFAHFx8qBUgM8L0EZ5CJh3
         nVCUjctOJh2vV56ZoqAPrqK/1B0m6LIYf+g37GpBJPDw3c2zkkCkB8/UTVhvir/Hb796
         TvwY+ReqAVbGhPkOlUyC7Z9Oqvsc9fi1ETwNoZkG82UXslhr4itsanpES4y1UXdTyxEx
         duwLyqBuCfuiNIURaAATkIkSzAKbsCnpj8aF5Ha7Bi0rldXCgNAfFRalgcMmijYNZqFU
         UeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVcOkbgBkvZ2NxJVt0162zpzc8FHx9Yuj+UIzlv+Jxg=;
        b=rqfdNAfr+xaswBwN5ZF8CZK3NoOsMkO7QRfIydIzNpomgx65ve3Ny1OPeUeW8fixA2
         BBGYDcYTkXuIfdOuhk0zgigPgEDcKoc6YEzpkTV49hJEeHqT8Hy5YDjQeJN+zFnMuu2c
         huLBAqmeu63qw8eGIasoY1wihAZVdxUKko1qGUf8hkmwW9R4RlZXabWlBoGtVcL7f6MW
         j+yCpdGL5L1BgcfmZuCgWdbCy5QQXTb8nYh3N2BZBp4t+EBqa804io0dMk+Sdc69ZvIB
         yCdMFZYhMjfj5i2o/5AE2iAP12+yY4OnU2Ib8Fk3lJni+mQjrc+i1LIOxanMOL6J2x9Q
         jnZg==
X-Gm-Message-State: AOAM5339RcmprsGTIXUGVfN/vA2MguRXq3dcrl1eFHoj4fjGxiTW+M3p
	KJsAWXyqxTVi5rMvi+AkH1SkytfZ+E4u58GHSM0=
X-Google-Smtp-Source: 
 ABdhPJzzjt6Gd91CkNWLc46kuy7q6C04uf0kEq9COaPf/QtPjtZqDG+KE6v/94lVwA5WC9S0LR3MBz/cWzwVnhzBnP0=
X-Received: by 2002:ac8:7d44:0:b0:2f3:af0b:dec1 with SMTP id
 h4-20020ac87d44000000b002f3af0bdec1mr9761244qtb.634.1652564575532; Sat, 14
 May 2022 14:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220513162244.577710-1-raj.khem@gmail.com>
 <16EEF7C2A0110441.10172@lists.openembedded.org>
 <c5c1d238df20f6563c9a4bc5c4e5794eda01bfec.camel@linuxfoundation.org>
In-Reply-To: 
 <c5c1d238df20f6563c9a4bc5c4e5794eda01bfec.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 May 2022 14:42:44 -0700
Message-ID: 
 <CAMKF1so_P06U1LsL2h-LbMxuSvLw6aoS-TWg5n4hZa=3rjozog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ovmf: Fix native build with gcc-12
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007e3a1405deffac01"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 May 2022 21:43:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165596

--0000000000007e3a1405deffac01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2022 at 2:31 PM <richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2022-05-14 at 13:15 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2022-05-13 at 09:22 -0700, Khem Raj wrote:
> > > Host distros have started deploying gcc12 as well e.g. archlinux
> > > this build failure shows up which has been fixed upstream
> > >
> > > In function =E2=80=98GetAlignmentFromFile=E2=80=99,
> > >     inlined from =E2=80=98main=E2=80=99 at GenFfs.c:816:20:
> > > GenFfs.c:545:5: error: pointer =E2=80=98InFileHandle=E2=80=99 used af=
ter =E2=80=98fclose=E2=80=99
> [-Werror=3Duse-after-free]
> > >   545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be
> allocated  of %s", InFileHandle);
> > >       |
>  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../0001-BaseTools-fix-gcc12-warning-1.patch  | 51 +++++++++++++++++=
++
> > >  .../0001-BaseTools-fix-gcc12-warning.patch    | 49 +++++++++++++++++=
+
> > >  meta/recipes-core/ovmf/ovmf_git.bb            |  6 +++
> > >  3 files changed, 106 insertions(+)
> > >  create mode 100644
> meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
> > >  create mode 100644
> meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
> > >
> > > diff --git
> a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
> b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
> > > new file mode 100644
> > > index 00000000000..23366b4d078
> > > --- /dev/null
> > > +++
> b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
> > > @@ -0,0 +1,51 @@
> > > +From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17 00:00:00 20=
01
> > > +From: Gerd Hoffmann <kraxel@redhat.com>
> > > +Date: Thu, 24 Mar 2022 20:04:35 +0800
> > > +Subject: [PATCH] BaseTools: fix gcc12 warning
> > > +
> > > +Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
> > > +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variabl=
e
> ?outStream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]
> > > + 2828 |   p->rc.outStream =3D &outStream.vt;
> > > +      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> > > +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> > > + 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
> > > +      |                            ^~~~~~~~~
> > > +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> > > +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variabl=
e
> ?outStream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-pointer=
=3D]
> > > + 2828 |   p->rc.outStream =3D &outStream.vt;
> > > +      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> > > +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> > > + 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
> > > +      |                            ^~~~~~~~~
> > > +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> > > +cc1: all warnings being treated as errors
> > > +
> > > +Upstream-Status: Backport [
> https://github.com/tianocore/edk2/commit/85021f8cf22d1bd4114803c6c610dea5=
ef0059f1
> ]
> > > +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> > > +---
> > > + BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
> > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > > +index 4e9b499f8d..4b9f5fa692 100644
> > > +--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > > ++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > > +@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle
> pp, BoolInt reInit,
> > > +
> > > +   nowPos64 =3D p->nowPos64;
> > > +   RangeEnc_Init(&p->rc);
> > > +-  p->rc.outStream =3D &outStream.vt;
> > > +
> > > +   if (desiredPackSize =3D=3D 0)
> > > +     return SZ_ERROR_OUTPUT_EOF;
> > > +
> > > ++  p->rc.outStream =3D &outStream.vt;
> > > +   res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
> > > ++  p->rc.outStream =3D NULL;
> > > +
> > > +   *unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);
> > > +   *destLen -=3D outStream.rem;
> > > +--
> > > +2.36.1
> > > +
> > > diff --git
> a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
> b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
> > > new file mode 100644
> > > index 00000000000..91c01647db2
> > > --- /dev/null
> > > +++
> b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
> > > @@ -0,0 +1,49 @@
> > > +From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17 00:00:00 20=
01
> > > +From: Gerd Hoffmann <kraxel@redhat.com>
> > > +Date: Thu, 24 Mar 2022 20:04:34 +0800
> > > +Subject: [PATCH] BaseTools: fix gcc12 warning
> > > +
> > > +GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose?
> [-Werror=3Duse-after-free]
> > > +  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be
> allocated  of %s", InFileHandle);
> > > +      |
>  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
> > > +GenFfs.c:544:5: note: call to ?fclose? here
> > > +  544 |     fclose (InFileHandle);
> > > +      |     ^~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +Upstream-Status: Backport [
> https://github.com/tianocore/edk2/commit/7b005f344e533cd913c3ca05b266f987=
2df886d1
> ]
> > > +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> > > +---
> > > + BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
> > > + BaseTools/Source/C/GenSec/GenSec.c | 2 +-
> > > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c
> b/BaseTools/Source/C/GenFfs/GenFfs.c
> > > +index 949025c333..d78d62ab36 100644
> > > +--- a/BaseTools/Source/C/GenFfs/GenFfs.c
> > > ++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
> > > +@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32
> *Alignment)
> > > +   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> > > +   if (PeFileBuffer =3D=3D NULL) {
> > > +     fclose (InFileHandle);
> > > +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  o=
f
> %s", InFileHandle);
> > > ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated fo=
r
> %s", InFile);
> > > +     return EFI_OUT_OF_RESOURCES;
> > > +   }
> > > +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> > > +diff --git a/BaseTools/Source/C/GenSec/GenSec.c
> b/BaseTools/Source/C/GenSec/GenSec.c
> > > +index d54a4f9e0a..b1d05367ec 100644
> > > +--- a/BaseTools/Source/C/GenSec/GenSec.c
> > > ++++ b/BaseTools/Source/C/GenSec/GenSec.c
> > > +@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32
> *Alignment)
> > > +   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> > > +   if (PeFileBuffer =3D=3D NULL) {
> > > +     fclose (InFileHandle);
> > > +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  o=
f
> %s", InFileHandle);
> > > ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated fo=
r
> %s", InFile);
> > > +     return EFI_OUT_OF_RESOURCES;
> > > +   }
> > > +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> > > +--
> > > +2.36.1
> > > +
> > > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb
> b/meta/recipes-core/ovmf/ovmf_git.bb
> > > index b15d40eac83..84e3360a3af 100644
> > > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > > @@ -15,12 +15,18 @@ PACKAGECONFIG +=3D
> "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tpm', '', d)
> > >  PACKAGECONFIG[secureboot] =3D ",,,"
> > >  PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENABLE=3DFALSE,,=
"
> > >
> > > +# GCC12 trips on it
> > > +#see
> https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools-tur=
n-off-gcc12-warning.patch
> > > +BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
> > > +
> > >  SRC_URI =3D "gitsm://
> github.com/tianocore/edk2.git;branch=3Dmaster;protocol=3Dhttps \
> > >             file://0001-ovmf-update-path-to-native-BaseTools.patch \
> > >
>  file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
> > >             file://0003-ovmf-Update-to-latest.patch \
> > >             file://0005-debug-prefix-map.patch \
> > >             file://0006-reproducible.patch \
> > > +           file://0001-BaseTools-fix-gcc12-warning.patch \
> > > +           file://0001-BaseTools-fix-gcc12-warning-1.patch \
> > >             "
> > >
> > >  PV =3D "edk2-stable202202"
> >
> > I think this may cause the efi failures in:
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3583/st=
eps/14/logs/stdio
> >
> > (and all the other similar oe-selftest runs)
>
> I'm going to retract that, further testing shows it is something else,
> still not sure what.


Right I was a little confused as well and was trying to reproduce locally
here with and without this patch and the results were same


>
> Cheers,
>
> Richard
>
>
>

--0000000000007e3a1405deffac01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, May 14, 2022 at 2:31 PM &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Sat, 2022-05-14 at 13:15 +=
0100, Richard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Fri, 2022-05-13 at 09:22 -0700, Khem Raj wrote:<br>
&gt; &gt; Host distros have started deploying gcc12 as well e.g. archlinux<=
br>
&gt; &gt; this build failure shows up which has been fixed upstream<br>
&gt; &gt; <br>
&gt; &gt; In function =E2=80=98GetAlignmentFromFile=E2=80=99,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0inlined from =E2=80=98main=E2=80=99 at GenFfs.=
c:816:20:<br>
&gt; &gt; GenFfs.c:545:5: error: pointer =E2=80=98InFileHandle=E2=80=99 use=
d after =E2=80=98fclose=E2=80=99 [-Werror=3Duse-after-free]<br>
&gt; &gt;=C2=A0 =C2=A0545 |=C2=A0 =C2=A0 =C2=A0Error(NULL, 0, 4001, &quot;R=
esource&quot;, &quot;memory cannot be allocated=C2=A0 of %s&quot;, InFileHa=
ndle);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../0001-BaseTools-fix-gcc12-warning-1.patch=C2=A0 | 51 +++=
++++++++++++++++<br>
&gt; &gt;=C2=A0 .../0001-BaseTools-fix-gcc12-warning.patch=C2=A0 =C2=A0 | 4=
9 ++++++++++++++++++<br>
&gt; &gt;=C2=A0 meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++<br>
&gt; &gt;=C2=A0 3 files changed, 106 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseToo=
ls-fix-gcc12-warning-1.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseToo=
ls-fix-gcc12-warning.patch<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12=
-warning-1.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-war=
ning-1.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000000..23366b4d078<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warnin=
g-1.patch<br>
&gt; &gt; @@ -0,0 +1,51 @@<br>
&gt; &gt; +From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" tar=
get=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; &gt; +Date: Thu, 24 Mar 2022 20:04:35 +0800<br>
&gt; &gt; +Subject: [PATCH] BaseTools: fix gcc12 warning<br>
&gt; &gt; +<br>
&gt; &gt; +Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:<br>
&gt; &gt; +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local var=
iable ?outStream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]<br>
&gt; &gt; + 2828 |=C2=A0 =C2=A0p-&gt;rc.outStream =3D &amp;outStream.vt;<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0~~~~~~~~~~~~~~~~^~~~~~~~~~~~~=
~~<br>
&gt; &gt; +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here<br>
&gt; &gt; + 2811 |=C2=A0 =C2=A0CLzmaEnc_SeqOutStreamBuf outStream;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~<br>
&gt; &gt; +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here<br>
&gt; &gt; +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local var=
iable ?outStream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-poi=
nter=3D]<br>
&gt; &gt; + 2828 |=C2=A0 =C2=A0p-&gt;rc.outStream =3D &amp;outStream.vt;<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0~~~~~~~~~~~~~~~~^~~~~~~~~~~~~=
~~<br>
&gt; &gt; +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here<br>
&gt; &gt; + 2811 |=C2=A0 =C2=A0CLzmaEnc_SeqOutStreamBuf outStream;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~<br>
&gt; &gt; +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here<br>
&gt; &gt; +cc1: all warnings being treated as errors<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/tianoco=
re/edk2/commit/85021f8cf22d1bd4114803c6c610dea5ef0059f1" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/tianocore/edk2/commit/85021f8cf22d1bd=
4114803c6c610dea5ef0059f1</a>]<br>
&gt; &gt; +Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat=
.com" target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; &gt; +Reviewed-by: Bob Feng &lt;<a href=3D"mailto:bob.c.feng@intel.com=
" target=3D"_blank">bob.c.feng@intel.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-<br>
&gt; &gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/B=
aseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c<br>
&gt; &gt; +index 4e9b499f8d..4b9f5fa692 100644<br>
&gt; &gt; +--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c<br>
&gt; &gt; ++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c<br>
&gt; &gt; +@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHan=
dle pp, BoolInt reInit,<br>
&gt; &gt; + <br>
&gt; &gt; +=C2=A0 =C2=A0nowPos64 =3D p-&gt;nowPos64;<br>
&gt; &gt; +=C2=A0 =C2=A0RangeEnc_Init(&amp;p-&gt;rc);<br>
&gt; &gt; +-=C2=A0 p-&gt;rc.outStream =3D &amp;outStream.vt;<br>
&gt; &gt; + <br>
&gt; &gt; +=C2=A0 =C2=A0if (desiredPackSize =3D=3D 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return SZ_ERROR_OUTPUT_EOF;<br>
&gt; &gt; + <br>
&gt; &gt; ++=C2=A0 p-&gt;rc.outStream =3D &amp;outStream.vt;<br>
&gt; &gt; +=C2=A0 =C2=A0res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *u=
npackSize);<br>
&gt; &gt; ++=C2=A0 p-&gt;rc.outStream =3D NULL;<br>
&gt; &gt; + <br>
&gt; &gt; +=C2=A0 =C2=A0*unpackSize =3D (UInt32)(p-&gt;nowPos64 - nowPos64)=
;<br>
&gt; &gt; +=C2=A0 =C2=A0*destLen -=3D outStream.rem;<br>
&gt; &gt; +-- <br>
&gt; &gt; +2.36.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12=
-warning.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warni=
ng.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000000..91c01647db2<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warnin=
g.patch<br>
&gt; &gt; @@ -0,0 +1,49 @@<br>
&gt; &gt; +From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" tar=
get=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; &gt; +Date: Thu, 24 Mar 2022 20:04:34 +0800<br>
&gt; &gt; +Subject: [PATCH] BaseTools: fix gcc12 warning<br>
&gt; &gt; +<br>
&gt; &gt; +GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose=
? [-Werror=3Duse-after-free]<br>
&gt; &gt; +=C2=A0 545 |=C2=A0 =C2=A0 =C2=A0Error(NULL, 0, 4001, &quot;Resou=
rce&quot;, &quot;memory cannot be allocated=C2=A0 of %s&quot;, InFileHandle=
);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; &gt; +GenFfs.c:544:5: note: call to ?fclose? here<br>
&gt; &gt; +=C2=A0 544 |=C2=A0 =C2=A0 =C2=A0fclose (InFileHandle);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~<=
br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/tianoco=
re/edk2/commit/7b005f344e533cd913c3ca05b266f9872df886d1" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/tianocore/edk2/commit/7b005f344e533cd=
913c3ca05b266f9872df886d1</a>]<br>
&gt; &gt; +Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat=
.com" target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; &gt; +Reviewed-by: Bob Feng &lt;<a href=3D"mailto:bob.c.feng@intel.com=
" target=3D"_blank">bob.c.feng@intel.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-<br>
&gt; &gt; + BaseTools/Source/C/GenSec/GenSec.c | 2 +-<br>
&gt; &gt; + 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Sour=
ce/C/GenFfs/GenFfs.c<br>
&gt; &gt; +index 949025c333..d78d62ab36 100644<br>
&gt; &gt; +--- a/BaseTools/Source/C/GenFfs/GenFfs.c<br>
&gt; &gt; ++++ b/BaseTools/Source/C/GenFfs/GenFfs.c<br>
&gt; &gt; +@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *A=
lignment)<br>
&gt; &gt; +=C2=A0 =C2=A0PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);<br>
&gt; &gt; +=C2=A0 =C2=A0if (PeFileBuffer =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0fclose (InFileHandle);<br>
&gt; &gt; +-=C2=A0 =C2=A0 Error(NULL, 0, 4001, &quot;Resource&quot;, &quot;=
memory cannot be allocated=C2=A0 of %s&quot;, InFileHandle);<br>
&gt; &gt; ++=C2=A0 =C2=A0 Error(NULL, 0, 4001, &quot;Resource&quot;, &quot;=
memory cannot be allocated for %s&quot;, InFile);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return EFI_OUT_OF_RESOURCES;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0fread (PeFileBuffer, sizeof (UINT8), PeFileSize, In=
FileHandle);<br>
&gt; &gt; +diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Sour=
ce/C/GenSec/GenSec.c<br>
&gt; &gt; +index d54a4f9e0a..b1d05367ec 100644<br>
&gt; &gt; +--- a/BaseTools/Source/C/GenSec/GenSec.c<br>
&gt; &gt; ++++ b/BaseTools/Source/C/GenSec/GenSec.c<br>
&gt; &gt; +@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 =
*Alignment)<br>
&gt; &gt; +=C2=A0 =C2=A0PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);<br>
&gt; &gt; +=C2=A0 =C2=A0if (PeFileBuffer =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0fclose (InFileHandle);<br>
&gt; &gt; +-=C2=A0 =C2=A0 Error(NULL, 0, 4001, &quot;Resource&quot;, &quot;=
memory cannot be allocated=C2=A0 of %s&quot;, InFileHandle);<br>
&gt; &gt; ++=C2=A0 =C2=A0 Error(NULL, 0, 4001, &quot;Resource&quot;, &quot;=
memory cannot be allocated for %s&quot;, InFile);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return EFI_OUT_OF_RESOURCES;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0fread (PeFileBuffer, sizeof (UINT8), PeFileSize, In=
FileHandle);<br>
&gt; &gt; +-- <br>
&gt; &gt; +2.36.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb=
" rel=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a> b/meta/recipes-core/=
ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">ov=
mf_git.bb</a><br>
&gt; &gt; index b15d40eac83..84e3360a3af 100644<br>
&gt; &gt; --- a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a><br>
&gt; &gt; @@ -15,12 +15,18 @@ PACKAGECONFIG +=3D &quot;${@bb.utils.contains=
(&#39;MACHINE_FEATURES&#39;, &#39;tpm2&#39;, &#39;tpm&#39;, &#39;&#39;, d)<=
br>
&gt; &gt;=C2=A0 PACKAGECONFIG[secureboot] =3D &quot;,,,&quot;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[tpm] =3D &quot;-D TPM_ENABLE=3DTRUE,-D TPM_EN=
ABLE=3DFALSE,,&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +# GCC12 trips on it<br>
&gt; &gt; +#see <a href=3D"https://src.fedoraproject.org/rpms/edk2/blob/raw=
hide/f/0032-Basetools-turn-off-gcc12-warning.patch" rel=3D"noreferrer" targ=
et=3D"_blank">https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-B=
asetools-turn-off-gcc12-warning.patch</a><br>
&gt; &gt; +BUILD_CFLAGS +=3D &quot;-Wno-error=3Dstringop-overflow&quot;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/tian=
ocore/edk2.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/tianocore/edk2.git;branch=3Dmaster;protocol=3Dhttps<=
/a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ovmf-u=
pdate-path-to-native-BaseTools.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-BaseTo=
ols-makefile-adjust-to-build-in-under-bitbake.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-ovmf-U=
pdate-to-latest.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-debug-=
prefix-map.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-reprod=
ucible.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-BaseTools-f=
ix-gcc12-warning.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-BaseTools-f=
ix-gcc12-warning-1.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 PV =3D &quot;edk2-stable202202&quot;<br>
&gt; <br>
&gt; I think this may cause the efi failures in:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/=
builds/3583/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3583/steps/14/=
logs/stdio</a><br>
&gt; <br>
&gt; (and all the other similar oe-selftest runs)<br>
<br>
I&#39;m going to retract that, further testing shows it is something else,<=
br>
still not sure what.</blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">Right I was a little confused as well and was trying to reproduce local=
ly here with and without this patch and the results were same=C2=A0</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--0000000000007e3a1405deffac01--

