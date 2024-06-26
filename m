Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2A8C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 10:13:09 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.22631.1719396784427167464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 03:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wmw3d2MN;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-48f49d1e660so1283338137.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 03:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719396783; x=1720001583; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ccznt301VNJnqlL1NGBivLecBlf2hwsJaRRThPMJWF0=;
        b=Wmw3d2MNtlkc9Rb/I4TTtqe+Z0rq2t6gNiFLPoviaatASoUKp8+h02mOREwR0Kg2+8
         ofPYXkA7cx2inLmKe4GfQ+7oDhzSHfpqyHpfrMoOpP38Xi5q7nC6+DRoxCBl0x49jek+
         J0ACo8bK/4SaoJj45VHK6K5vIDaTj/R8l63PeF2xeCjgdiDgXipDDi6tKNgeaskGOChF
         W0DKvUr1PtMem2MvmlH2UHf7gLAAiQhXboIpUz5VoWJCgBBB5YoqGwL6WfsSVRIQuR1Q
         9203HbMHsofgYSTNS8ljxFUr1s9NY0k1/gdO78DzUnudgNVtoR+MYlyEz22pinefFbnX
         JN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396783; x=1720001583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ccznt301VNJnqlL1NGBivLecBlf2hwsJaRRThPMJWF0=;
        b=WKOVBHbyG86AIAg9OjCSjzCVBCC7FKMy5SbJ3IhXqTu4cvZEZyaQFE+Juh+GyPwkDl
         4qeuCx0OX2H9N9bvrAgAcmVZDVsLc+ZI2KCnvzG/2UlFGnP0gNT5GN26VBEhxJwSBsvj
         Y45MNBKm5ZU47ClCMyKAhCy32lTGe6F5u72w+cTKFMxoefAcS1kZBlp8AQwE0ZqaBWoW
         Kl/o80aPT/YPFjec7N9w7kwGs2SKXKc5JLLL89cB0Bdae47NobN5o0Tj588JHohkTIbO
         qu05VBCQBobE5l51LbotJQh9c2Nx2PaQ/GFIZR6Kxtf2SMXBg7Rwu0YQO+YiPRpptxIB
         +vbg==
X-Gm-Message-State: AOJu0Yzv2dPL0C96LlZfjVY+nKVcbPCVIky1AdaG1rsrFNKZfy6TfZVU
	Ks/ttRv6HeR4uZBoNMC2iiuQBJpR0zx8Z617ovbg3CeM/gkR/PAk1zXs5Cb4faNp3Xkkh0Q7riy
	aoiFVdDJpsEoZ2ayg93s0VQwAzv8AIumB
X-Google-Smtp-Source: AGHT+IFe+xBcXZASuI91IwagfT61bPpNTaJoogoRP3ot9IsqO5wnS+SlOZMwuwfoecbonb7KCTDQiH9m+H2otry0zVU=
X-Received: by 2002:a05:6102:2f5:b0:48d:706f:a884 with SMTP id
 ada2fe7eead31-48f52a8ddbfmr9418463137.20.1719396783253; Wed, 26 Jun 2024
 03:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240626043553.41521-1-hprajapati@mvista.com>
In-Reply-To: <20240626043553.41521-1-hprajapati@mvista.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 26 Jun 2024 11:12:52 +0100
Message-ID: <CANPvuRmYKdw48oF_0rtHw3jR+uxcCPiDXvEpu7Bz2t-O5NvOtg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] go: fix CVE-2024-24789
To: hprajapati@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007e7077061bc842b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 10:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201159

--0000000000007e7077061bc842b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hitendra,

I sent a backport with the latest golang 1.22.4 from master
https://lists.openembedded.org/g/openembedded-core/message/201157

Jose

Hitendra Prajapati via lists.openembedded.org <hprajapati=3D
mvista.com@lists.openembedded.org> escreveu (quarta, 26/06/2024 =C3=A0(s) 0=
5:36):

> Upstream-Status: Backport from
> https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c72=
bcc
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.22.2.inc        |  1 +
>  .../go/go/CVE-2024-24789.patch                | 77 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2024-24789.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.22.2.inc
> b/meta/recipes-devtools/go/go-1.22.2.inc
> index b399207311..1a57a1bae6 100644
> --- a/meta/recipes-devtools/go/go-1.22.2.inc
> +++ b/meta/recipes-devtools/go/go-1.22.2.inc
> @@ -14,5 +14,6 @@ SRC_URI +=3D "\
>
>  file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
>
>  file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
> +    file://CVE-2024-24789.patch \
>  "
>  SRC_URI[main.sha256sum] =3D
> "374ea82b289ec738e968267cac59c7d5ff180f9492250254784b2044e90df5a9"
> diff --git a/meta/recipes-devtools/go/go/CVE-2024-24789.patch
> b/meta/recipes-devtools/go/go/CVE-2024-24789.patch
> new file mode 100644
> index 0000000000..684407112d
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go/CVE-2024-24789.patch
> @@ -0,0 +1,77 @@
> +From c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Tue, 14 May 2024 14:39:10 -0700
> +Subject: [PATCH] [release-branch.go1.21] archive/zip: treat truncated
> EOCDR
> + comment as an error
> +
> +When scanning for an end of central directory record,
> +treat an EOCDR signature with a record containing a truncated
> +comment as an error. Previously, we would skip over the invalid
> +record and look for another one. Other implementations do not
> +do this (they either consider this a hard error, or just ignore
> +the truncated comment). This parser misalignment allowed
> +presenting entirely different archive contents to Go programs
> +and other zip decoders.
> +
> +For #66869
> +Fixes #67553
> +
> +Change-Id: I94e5cb028534bb5704588b8af27f1e22ea49c7c6
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/585397
> +Reviewed-by: Joseph Tsai <joetsai@digital-static.net>
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +LUCI-TryBot-Result: Go LUCI <
> golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
> +(cherry picked from commit 33d725e5758bf1fea62e6c77fc70b57a828a49f5)
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/588795
> +Reviewed-by: Matthew Dempsky <mdempsky@google.com>
> +
> +Upstream-Status: Backport [
> https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c72=
bcc
> ]
> +CVE: CVE-2024-24789
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/archive/zip/reader.go      | 8 ++++++--
> + src/archive/zip/reader_test.go | 8 ++++++++
> + 2 files changed, 14 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/archive/zip/reader.go b/src/archive/zip/reader.go
> +index ff6fedf..60b34b7 100644
> +--- a/src/archive/zip/reader.go
> ++++ b/src/archive/zip/reader.go
> +@@ -699,9 +699,13 @@ func findSignatureInBlock(b []byte) int {
> +               if b[i] =3D=3D 'P' && b[i+1] =3D=3D 'K' && b[i+2] =3D=3D =
0x05 &&
> b[i+3] =3D=3D 0x06 {
> +                       // n is length of comment
> +                       n :=3D int(b[i+directoryEndLen-2]) |
> int(b[i+directoryEndLen-1])<<8
> +-                      if n+directoryEndLen+i <=3D len(b) {
> +-                              return i
> ++                      if n+directoryEndLen+i > len(b) {
> ++                              // Truncated comment.
> ++                              // Some parsers (such as Info-ZIP) ignore
> the truncated comment
> ++                              // rather than treating it as a hard erro=
r.
> ++                              return -1
> +                       }
> ++                      return i
> +               }
> +       }
> +       return -1
> +diff --git a/src/archive/zip/reader_test.go
> b/src/archive/zip/reader_test.go
> +index 631515c..9a77c1a 100644
> +--- a/src/archive/zip/reader_test.go
> ++++ b/src/archive/zip/reader_test.go
> +@@ -570,6 +570,14 @@ var tests =3D []ZipTest{
> +                       },
> +               },
> +       },
> ++      // Issue 66869: Don't skip over an EOCDR with a truncated comment=
.
> ++      // The test file sneakily hides a second EOCDR before the first
> one;
> ++      // previously we would extract one file ("file") from this archiv=
e,
> ++      // while most other tools would reject the file or extract a
> different one ("FILE").
> ++      {
> ++              Name:  "comment-truncated.zip",
> ++              Error: ErrFormat,
> ++      },
> + }
> +
> + func TestReader(t *testing.T) {
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201149):
> https://lists.openembedded.org/g/openembedded-core/message/201149
> Mute This Topic: https://lists.openembedded.org/mt/106884660/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007e7077061bc842b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Hitendra,<br><br>I sent a backport with the latest=
 golang 1.22.4 from master=C2=A0<br><a href=3D"https://lists.openembedded.o=
rg/g/openembedded-core/message/201157">https://lists.openembedded.org/g/ope=
nembedded-core/message/201157</a><br></div><div><br></div>Jose<div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Hitendra Praja=
pati via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;hprajapati=3D<a href=3D"mailto:mvista.com@lists.openembedded.org">mv=
ista.com@lists.openembedded.org</a>&gt; escreveu (quarta, 26/06/2024 =C3=A0=
(s) 05:36):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upst=
ream-Status: Backport from <a href=3D"https://github.com/golang/go/commit/c=
8e40338cf00f3c1d86c8fb23863ad67a4c72bcc" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c7=
2bcc</a><br>
<br>
Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.c=
om" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.22.2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../go/go/CVE-2024-24789.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 77 +++++++++++++++++++<br>
=C2=A02 files changed, 78 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go/CVE-2024-24789.patch<b=
r>
<br>
diff --git a/meta/recipes-devtools/go/go-1.22.2.inc b/meta/recipes-devtools=
/go/go-1.22.2.inc<br>
index b399207311..1a57a1bae6 100644<br>
--- a/meta/recipes-devtools/go/go-1.22.2.inc<br>
+++ b/meta/recipes-devtools/go/go-1.22.2.inc<br>
@@ -14,5 +14,6 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0007-exec.go-filter-out-build-specific-paths-fro=
m-linker-.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-hos=
t-compile.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0009-go-Filter-build-paths-on-staticly-linked-ar=
ches.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2024-24789.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[main.sha256sum] =3D &quot;374ea82b289ec738e968267cac59c7d5ff1=
80f9492250254784b2044e90df5a9&quot;<br>
diff --git a/meta/recipes-devtools/go/go/CVE-2024-24789.patch b/meta/recipe=
s-devtools/go/go/CVE-2024-24789.patch<br>
new file mode 100644<br>
index 0000000000..684407112d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go/CVE-2024-24789.patch<br>
@@ -0,0 +1,77 @@<br>
+From c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc Mon Sep 17 00:00:00 2001<br>
+From: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"_blank=
">dneil@google.com</a>&gt;<br>
+Date: Tue, 14 May 2024 14:39:10 -0700<br>
+Subject: [PATCH] [release-branch.go1.21] archive/zip: treat truncated EOCD=
R<br>
+ comment as an error<br>
+<br>
+When scanning for an end of central directory record,<br>
+treat an EOCDR signature with a record containing a truncated<br>
+comment as an error. Previously, we would skip over the invalid<br>
+record and look for another one. Other implementations do not<br>
+do this (they either consider this a hard error, or just ignore<br>
+the truncated comment). This parser misalignment allowed<br>
+presenting entirely different archive contents to Go programs<br>
+and other zip decoders.<br>
+<br>
+For #66869<br>
+Fixes #67553<br>
+<br>
+Change-Id: I94e5cb028534bb5704588b8af27f1e22ea49c7c6<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/585397" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/585397</a><br>
+Reviewed-by: Joseph Tsai &lt;<a href=3D"mailto:joetsai@digital-static.net"=
 target=3D"_blank">joetsai@digital-static.net</a>&gt;<br>
+Reviewed-by: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.com" t=
arget=3D"_blank">dmitshur@google.com</a>&gt;<br>
+LUCI-TryBot-Result: Go LUCI &lt;<a href=3D"mailto:golang-scoped@luci-proje=
ct-accounts.iam.gserviceaccount.com" target=3D"_blank">golang-scoped@luci-p=
roject-accounts.iam.gserviceaccount.com</a>&gt;<br>
+(cherry picked from commit 33d725e5758bf1fea62e6c77fc70b57a828a49f5)<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/588795" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/588795</a><br>
+Reviewed-by: Matthew Dempsky &lt;<a href=3D"mailto:mdempsky@google.com" ta=
rget=3D"_blank">mdempsky@google.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/commit/=
c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c=
72bcc</a>]<br>
+CVE: CVE-2024-24789<br>
+Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+---<br>
+ src/archive/zip/reader.go=C2=A0 =C2=A0 =C2=A0 | 8 ++++++--<br>
+ src/archive/zip/reader_test.go | 8 ++++++++<br>
+ 2 files changed, 14 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/archive/zip/reader.go b/src/archive/zip/reader.go<br>
+index ff6fedf..60b34b7 100644<br>
+--- a/src/archive/zip/reader.go<br>
++++ b/src/archive/zip/reader.go<br>
+@@ -699,9 +699,13 @@ func findSignatureInBlock(b []byte) int {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if b[i] =3D=3D &#39=
;P&#39; &amp;&amp; b[i+1] =3D=3D &#39;K&#39; &amp;&amp; b[i+2] =3D=3D 0x05 =
&amp;&amp; b[i+3] =3D=3D 0x06 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// n is length of comment<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0n :=3D int(b[i+directoryEndLen-2]) | int(b[i+directoryEndLen-1])&=
lt;&lt;8<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if n+directoryEndLen+i &lt;=3D len(b) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return i<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if n+directoryEndLen+i &gt; len(b) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Truncated comment.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Some parsers (such as Info-ZIP) ignore t=
he truncated comment<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // rather than treating it as a hard error.=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return i<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1<br>
+diff --git a/src/archive/zip/reader_test.go b/src/archive/zip/reader_test.=
go<br>
+index 631515c..9a77c1a 100644<br>
+--- a/src/archive/zip/reader_test.go<br>
++++ b/src/archive/zip/reader_test.go<br>
+@@ -570,6 +570,14 @@ var tests =3D []ZipTest{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
++=C2=A0 =C2=A0 =C2=A0 // Issue 66869: Don&#39;t skip over an EOCDR with a =
truncated comment.<br>
++=C2=A0 =C2=A0 =C2=A0 // The test file sneakily hides a second EOCDR befor=
e the first one;<br>
++=C2=A0 =C2=A0 =C2=A0 // previously we would extract one file (&quot;file&=
quot;) from this archive,<br>
++=C2=A0 =C2=A0 =C2=A0 // while most other tools would reject the file or e=
xtract a different one (&quot;FILE&quot;).<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name:=C2=A0 &quot;commen=
t-truncated.zip&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error: ErrFormat,<br>
++=C2=A0 =C2=A0 =C2=A0 },<br>
+ }<br>
+ <br>
+ func TestReader(t *testing.T) {<br>
+-- <br>
+2.25.1<br>
+<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201149): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201149" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201149</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106884660/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106884660/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--0000000000007e7077061bc842b1--

