Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E457DC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 10:39:37 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.16052.1679049576772302406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 03:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gc/LSNT9;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id t14so4574678ljd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679049575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HpFGdZyHCHGynvhUaGbIu5mqVR464HCjOsfTNeYLLls=;
        b=Gc/LSNT9YHh9OFZKCwM3c8hJ91ApPb1aqRVwQ3ePSK0nuwr/i31p8X0DPtpnUr18iG
         8X3y682skQPxF/l7tzCiGaEoOXIYyprm3jkgB4s9zr56OcConHU84Eeeweq6rvWcI69L
         gq6BD5QMfJ/n0K6cHpek8PJ7GSgEu1lumOuU0NwIo0Vwy7POssTDihdxQ58tUCmivplK
         cBQvfdtJcGnjrCmW94LHx3XOqRub7PqdVP7d1wQUSsghlMB2tLFmKHrABeqlpOFSMR7z
         tcJxIT9bGyY+zIBWOeQuoFF8jBVbsbBQJZbXVBC0ITSRr2t3zmfj4Ove/IbD1X2GY5Zk
         WQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679049575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpFGdZyHCHGynvhUaGbIu5mqVR464HCjOsfTNeYLLls=;
        b=wxLR84ALjbhUwUKN9zNk0OR4b5uDjisJbmr/xBAdmhwD8ZJZ+lbgZgQPbJqJId1BK4
         4qBGB0BB2Jgi8NfQX6GrMB+2eGnQhchcdgS1lTTSUrz2sAJdM72zMsktiJqIfiAhmsCv
         Sv2D6ij73JzipXki/6+pNdMdhONkwwi+rFpCd7aq5wKdZCJPSj1O4zJyMRYzpfiryrJr
         lAKlGLj4gaPWT012kZykd2EOaUea64UzgYjyPESAfAEeyD7UgZXZMVcjh8CCjJmo7hMX
         FsVKNliE8ig60oj2ALQhtnKGew07vjBlEFWOVoKApTPaQa/nTc3eBFncX2GJ3hz7afwv
         6GJQ==
X-Gm-Message-State: AO0yUKUBRVhVP1tdUFOY5s3TlP1GmPX05Y85E9apzOJDCz/DkKw7Fos6
	u8YvzXPraWO5rT8DlfQV1diDOUkNFuUJVZvifY8=
X-Google-Smtp-Source: AK7set9qMFsUfLr8xCRdQddtHNP0oa0ZTCkr5IC0GaM44K2/HDOjsNdelTXzisn/wWHB0IT913ZbnOfBKvHDEnZB6bI=
X-Received: by 2002:a2e:9810:0:b0:299:c1c7:693c with SMTP id
 a16-20020a2e9810000000b00299c1c7693cmr1261336ljj.7.1679049574734; Fri, 17 Mar
 2023 03:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230317100923.3295331-1-mikko.rapeli@linaro.org>
In-Reply-To: <20230317100923.3295331-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Mar 2023 11:39:23 +0100
Message-ID: <CANNYZj_RVtE=Ud1Tmcr5H0_zQZS_SK+5CT1ro4oanudVdTfBWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] e2fsprogs: switch from master to debian/master
 branch to fix compatibility
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Jerome Forissier <jerome.forissier@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000076604a05f716315b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 10:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178748

--00000000000076604a05f716315b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This doesn=E2=80=99t seem right. We should not give special privileges to t=
ooling
from any particular host distro. If you need to manipulate images, build
e2fsprogs-native and run that.

Alex

On Fri 17. Mar 2023 at 10.09, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> From: Jerome Forissier <jerome.forissier@linaro.org>
>
> When trying to use e2fsck <=3D 1.47.0 on the root filesystem (for example=
,
> to resize a partition after copying the image to a USB stick on a
> computer running current Ubuntu [22.04] or Debian), an error is
> reported:
>
>  e2fsck 1.46.5 (30-Dec-2021)
>  /dev/sdb2 has unsupported feature(s): FEATURE_C12
>  e2fsck: Get a newer version of e2fsck!
>
> This has been discussed in [2] and a fix was made for use by
> Debian-based distros in [3]. Let's pick that version.
>
> Link: [1] https://gitlab.com/Linaro/trusted-reference-stack/trs/-/issues/=
1
> Link: [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1031622
> Link: [3]
> https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=3Ddebian/m=
aster&id=3D1181f164c48574a4813bfa203dbd7b4123154021
>
> Binary compatibility of generated ext4 file system images is important
> so it's better to use the "debian/master" branch.
>
> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc                   | 2 +-
>  .../e2fsprogs/{e2fsprogs_1.47.0.bb =3D> e2fsprogs_1.47.0-2.bb}    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.0.bb =3D>
> e2fsprogs_1.47.0-2.bb} (99%)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> index f41a5d0b4e..2f54896e8c 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D
> "file://NOTICE;md5=3Dd50be0580c0b0a7fbc7a4830bbe6c12b \
>  SECTION =3D "base"
>  DEPENDS =3D "util-linux attr autoconf-archive"
>
> -SRC_URI =3D "git://
> git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3Dmaster"
> +SRC_URI =3D "git://
> git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3Ddebian/master"
>  S =3D "${WORKDIR}/git"
>
>  inherit autotools gettext texinfo pkgconfig multilib_header
> update-alternatives ptest
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
> similarity index 99%
> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
> index 2620610903..9bf89ba0c4 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
> @@ -10,7 +10,7 @@ SRC_URI:append:class-native =3D " \
>             file://quiet-debugfs.patch \
>             "
>
> -SRCREV =3D "f4c9cc4bedacde8408edda3520a32d3842290112"
> +SRCREV =3D "1181f164c48574a4813bfa203dbd7b4123154021"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>
>  EXTRA_OECONF +=3D "--libdir=3D${base_libdir} --sbindir=3D${base_sbindir}=
 \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178747):
> https://lists.openembedded.org/g/openembedded-core/message/178747
> Mute This Topic: https://lists.openembedded.org/mt/97669707/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000076604a05f716315b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This doesn=E2=80=99t seem right. We should not give speci=
al privileges to tooling from any particular host distro. If you need to ma=
nipulate images, build e2fsprogs-native and run that.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri 17. Mar 2023 at 10.09, Mikko =
Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mikko.rapeli@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)">From: Jerome Forissier &lt;<a h=
ref=3D"mailto:jerome.forissier@linaro.org" target=3D"_blank">jerome.forissi=
er@linaro.org</a>&gt;<br>
<br>
When trying to use e2fsck &lt;=3D 1.47.0 on the root filesystem (for exampl=
e,<br>
to resize a partition after copying the image to a USB stick on a<br>
computer running current Ubuntu [22.04] or Debian), an error is<br>
reported:<br>
<br>
=C2=A0e2fsck 1.46.5 (30-Dec-2021)<br>
=C2=A0/dev/sdb2 has unsupported feature(s): FEATURE_C12<br>
=C2=A0e2fsck: Get a newer version of e2fsck!<br>
<br>
This has been discussed in [2] and a fix was made for use by<br>
Debian-based distros in [3]. Let&#39;s pick that version.<br>
<br>
Link: [1] <a href=3D"https://gitlab.com/Linaro/trusted-reference-stack/trs/=
-/issues/1" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/Linaro/=
trusted-reference-stack/trs/-/issues/1</a><br>
Link: [2] <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D10=
31622" rel=3D"noreferrer" target=3D"_blank">https://bugs.debian.org/cgi-bin=
/bugreport.cgi?bug=3D1031622</a><br>
Link: [3] <a href=3D"https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/c=
ommit/?h=3Ddebian/master&amp;id=3D1181f164c48574a4813bfa203dbd7b4123154021"=
 rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/fs/ext=
2/e2fsprogs.git/commit/?h=3Ddebian/master&amp;id=3D1181f164c48574a4813bfa20=
3dbd7b4123154021</a><br>
<br>
Binary compatibility of generated ext4 file system images is important<br>
so it&#39;s better to use the &quot;debian/master&quot; branch.<br>
<br>
Signed-off-by: Jerome Forissier &lt;<a href=3D"mailto:jerome.forissier@lina=
ro.org" target=3D"_blank">jerome.forissier@linaro.org</a>&gt;<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/e2fsprogs/e2fsprogs.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../e2fsprogs/{<a href=3D"http://e2fsprogs_1.47.0.bb" rel=3D"noreferr=
er" target=3D"_blank">e2fsprogs_1.47.0.bb</a> =3D&gt; <a href=3D"http://e2f=
sprogs_1.47.0-2.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0-2=
.bb</a>}=C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/e2fsprogs/{<a href=3D"http://e2fsprogs_1=
.47.0.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0.bb</a> =3D&=
gt; <a href=3D"http://e2fsprogs_1.47.0-2.bb" rel=3D"noreferrer" target=3D"_=
blank">e2fsprogs_1.47.0-2.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-d=
evtools/e2fsprogs/e2fsprogs.inc<br>
index f41a5d0b4e..2f54896e8c 100644<br>
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D &quot;file://NOTICE;md5=3Dd50be0580c=
0b0a7fbc7a4830bbe6c12b \<br>
=C2=A0SECTION =3D &quot;base&quot;<br>
=C2=A0DEPENDS =3D &quot;util-linux attr autoconf-archive&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/fs/ext2/e=
2fsprogs.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.kern=
el.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3Dmaster</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/fs/ext2/e=
2fsprogs.git;branch=3Ddebian/master" rel=3D"noreferrer" target=3D"_blank">g=
it.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3Ddebian/master</a>&quot=
;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit autotools gettext texinfo pkgconfig multilib_header update-al=
ternatives ptest<br>
diff --git a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.=
47.0.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0.bb</a> b/met=
a/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.47.0-2.bb" rel=
=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0-2.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.4=
7.0.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0.bb</a><br>
rename to meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.47.=
0-2.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0-2.bb</a><br>
index 2620610903..9bf89ba0c4 100644<br>
--- a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.47.0.bb=
" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0.bb</a><br>
+++ b/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.47.0-2.=
bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0-2.bb</a><br>
@@ -10,7 +10,7 @@ SRC_URI:append:class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://quiet-debugfs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;f4c9cc4bedacde8408edda3520a32d3842290112&quot;<br>
+SRCREV =3D &quot;1181f164c48574a4813bfa203dbd7b4123154021&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+\.\d+(\.\d+)*=
)$&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--libdir=3D${base_libdir} --sbindir=3D${base_=
sbindir} \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178747): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178747" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178747</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97669707/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97669707/1686489</a><br>
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

--00000000000076604a05f716315b--

