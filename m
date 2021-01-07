Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web12.1396.1610056701399391810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 13:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=U8OSO9aP;
 spf=pass (domain: google.com, ip: 209.85.166.177, mailfrom: gmouse@google.com)
Received: by mail-il1-f177.google.com with SMTP id e7so8236024ile.7
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 13:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=M1NxPZhp/pr2zTjeXch0+r5Q4syTd4t5kvTGGdnks6g=;
        b=U8OSO9aPMGPsXai3/sZYXiJnJjeMIG3LNjUIDddVSciIXM0DZ4fd1nEhbnJFQFMLCW
         ohT7mrY7LPDfQhZgJpgUznvWYrCDQNZ8Ud4SD6Ow/Hs6RuwLsphfzaII4Cq4fZ+MBbWm
         lTp7l0p9Mab2bb/0ZcgcEV6hGkhDr4wXPojDKvIgCp8vvFoF09EGthyNZjjC3WZB+BMv
         Eq2FpCIJdI0dj/WJOT8QI63bOndlbaEEpc61ljjZ0qW6KPQdKYYfMEVyaBc5pJ2Yv5BS
         D9LzYhurtt9OCYUb1RDC0tTOVi4PqXLaTB2xMIEuSYVmi1DqfoYomyxQ7PRAINFqiG5S
         KVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=M1NxPZhp/pr2zTjeXch0+r5Q4syTd4t5kvTGGdnks6g=;
        b=a5BUH+ruq3GpMLl295DzRbMQ96l1IyX4sKfeQG2munnEQz2hKVz35v8Zpq90WtbpmC
         X0kwHcq3LcrtezTT7hKQDMmqDS24C8bcp7toHIeOtAcx0UQa5TPucnZKhtkFj1PrDnr6
         YuihGz3RQQHrKF2TzIYHdz0aPwwlFJIiKLurwILWKnwQRDRtLFXg3qpuTGtIBzOh1Uxb
         u8A8jyhMqNZhbqVOrz0eQDZUN3F1FsbUyKuA5fEsoYhFV2qn0Sg5U/aX4dwi7ueZcvJO
         VuKgLSEt+dVXKHjDMypAS7iWEqVq+TqMRC2fpchHR09UuAdw5xSe4rXTWL2i7kyMLmno
         ImYQ==
X-Gm-Message-State: AOAM5335RQtxrQDAMLwojPmxKxBRhy8sSRwJSy/CNQbOJy0FZj4EJSo8
	9iW1grbYL9Wx7NdlFe5WD9W5fOHcxEaP192kkfSTaF1KWaKU5Q==
X-Google-Smtp-Source: ABdhPJytIqf/8zoHQ3KQKJXdD2Y/zSS6KQNDhRwC66TG1s6uKQ7Ip5ncb/0/4MzToMO4HhbPHlIcKRYBy8CyNHnT3C0=
X-Received: by 2002:a05:6e02:20cc:: with SMTP id 12mr940540ilq.91.1610056700450;
 Thu, 07 Jan 2021 13:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20210107215121.3901938-1-gmouse@google.com> <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
In-Reply-To: <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
From: "Anton Kachalov" <rnouse@google.com>
Date: Thu, 7 Jan 2021 22:58:08 +0100
Message-ID: <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com>
Subject: [poky][PATCH] bitbake: remove /usr from pseudo ignore paths
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b33b9f05b85689d2"

--000000000000b33b9f05b85689d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Allow the Yocto's building tree to be placed under /usr.

Relevant issue: https://github.com/openbmc/openbmc/issues/3724

Signed-off-by: Anton D. Kachalov <rnouse@google.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a04005b0f5..77c8148aa1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,7 +685,7 @@ SRC_URI =3D ""
 PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT =3D "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS =3D
"/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAM=
PS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},$=
{WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${W=
ORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TM=
PDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/c=
ache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS =3D
"/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR=
},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKD=
IR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR=
}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/=
sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,$=
{COREBASE}/scripts,${CCACHE_DIR}"

 export PSEUDO_DISABLED =3D "1"
 #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
--=20
2.29.2.729.g45daf8777d-goog

--000000000000b33b9f05b85689d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div class=3D"=
gmail_quote">Allow the Yocto&#39;s building tree to be placed under /usr.<b=
r>
<br>
Relevant issue: <a href=3D"https://github.com/openbmc/openbmc/issues/3724" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/iss=
ues/3724</a><br>
<br>
Signed-off-by: Anton D. Kachalov &lt;<a href=3D"mailto:rnouse@google.com" t=
arget=3D"_blank">rnouse@google.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index a04005b0f5..77c8148aa1 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -685,7 +685,7 @@ SRC_URI =3D &quot;&quot;<br>
=C2=A0PSEUDO_LOCALSTATEDIR ?=3D &quot;${WORKDIR}/pseudo/&quot;<br>
=C2=A0PSEUDO_PASSWD ?=3D &quot;${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}&quot=
;<br>
=C2=A0PSEUDO_SYSROOT =3D &quot;${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-nativ=
e&quot;<br>
-PSEUDO_IGNORE_PATHS =3D &quot;/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recip=
e-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/=
sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORK=
DIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/ss=
tate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR}=
,${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}&quot;<=
br>
+PSEUDO_IGNORE_PATHS =3D &quot;/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysr=
oot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate=
-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/s=
state-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-b=
uild-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMP=
DIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}&quot;<br>
<br>
=C2=A0export PSEUDO_DISABLED =3D &quot;1&quot;<br>
=C2=A0#export PSEUDO_PREFIX =3D &quot;${STAGING_DIR_NATIVE}${prefix_native}=
&quot;<br>
-- <br>
2.29.2.729.g45daf8777d-goog<br>
<br>
</div></div>
</div></div>

--000000000000b33b9f05b85689d2--
