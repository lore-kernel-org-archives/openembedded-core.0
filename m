Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C14BC52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:28:16 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.206099.1724056087281256534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j9MJTnyU;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2fbf1d14so47794101fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 01:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724056085; x=1724660885; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p9PYcHOioKs+gKCOKk/RbwYUUjhxdCE36NQvnnPV5Wc=;
        b=j9MJTnyUKQ5T1SYT373my7tEsC//UpGkGI8QAMzsvu70ao8kfhdrpqqn/6pShVUtdL
         n13De0Jp6jzJysPNdU6yVogGzwokjvlNsyy484hcktpxiFn4IgYzDf16/GFspiCoGGXw
         3JjiT/3G5mHpzBffLswuQbRagnZ9S9GdNwsyU/D7Rumlqfw7EP0W5/f2UqKlRYSUUhXh
         +9cALy3d02Vo2eDhW2VENg0MuB4SYSDst1aVfMUbwMh/nKmILnQ9eHrMS2RmyodDd/PQ
         9+2mHUJsEpoF4EyvYQwTOE7AWawK6ClHkILopGqDULODL+1CPfqq5lIZ7wQVzyHS9Zxu
         5XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724056085; x=1724660885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9PYcHOioKs+gKCOKk/RbwYUUjhxdCE36NQvnnPV5Wc=;
        b=pTbHmu935qx+FeMJ8QEo50Y4UEebqRRJjKM73kTTJbiXHOmoNjV2d+5mhpPokzeBHl
         Hpnj4/2km0lC5Wzb/0i4N7pjQaKtjlTOi4Oe/l11heOMde1Zh/IV/ZQJC/iTRwd8Qa5v
         SasifzE41qusuITa0NIg5p3am+uDUaFHJpbTBhMeRLxTZ9AQLngs7Y4uXXtcmzn5IZxm
         NBR8EyQwMIPoQxqvT1cl0UnHsttmC31i1umtM2mnGIOLaSmnsi4LBadhOGFwkrMb5a/O
         i8IDSQxt4PWYFiWgjcn5wUKw6h5s3efjTCfcjJi/fkCvjCqW+zlmn/ESIVK792OJk0zZ
         dVpg==
X-Gm-Message-State: AOJu0Yw7PJ6pEannh+/XvCmwdhHexjeB1AU4szVRojQznCr0irzg+gyO
	fnlLmoyW8pg4KRMySc7cjLHypNP/8xYCSVNlrHsuwdYwG+vMdrRge7JzdrSQjDx/ITIwQgd2h6z
	aDiXhPpjsDbK+5BO3AcezvKdtN9E=
X-Google-Smtp-Source: AGHT+IHMyKpwcKc6aJelMC7+567Cj8RBOxpgcSVcV0c/YXmX/0Y0e0dJRQa/xCPlklAOPLLgmnEwJC9lIdYLyykw/zc=
X-Received: by 2002:a05:6512:3a84:b0:52b:faa1:7c74 with SMTP id
 2adb3069b0e04-53307f739demr4134682e87.5.1724056084118; Mon, 19 Aug 2024
 01:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240819082215.1322013-1-niko.mauno@vaisala.com>
In-Reply-To: <20240819082215.1322013-1-niko.mauno@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 10:27:53 +0200
Message-ID: <CANNYZj-NDo7vRb3Qvngb3v3yCfxfF+hGpxC1mmGO=gpBX7UMjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007782d4062005167f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203488

--0000000000007782d4062005167f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don=E2=80=99t think this should be disabled by default actually. If the d=
efault
upstream behavior is to enable, and all current linux-yocto kernels have
the needed support, then we should follow that.

Alex

On Mon 19. Aug 2024 at 10.23, Niko Mauno via lists.openembedded.org
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:

> The 2.39 version of util-linux took new file descriptors based mount
> kernel API into use. In relation to this change, the upstream release
> notes in
>
> https://github.com/util-linux/util-linux/blob/v2.39/Documentation/release=
s/v2.39-ReleaseNotes#L14-L21
> mention that
>
>   This change is very aggressive to libmount code, but hopefully, it does
> not introduce regressions in traditional mount(8) behavior.
>
> After observing following failure when booting a board using a bit
> older 6.1 series kernel together with initramfs rootfs based boot flow
>
>   [FAILED] Failed to start Remount Root and Kernel File Systems.
>   See 'systemctl status systemd-remount-fs.service' for details.
>
> closer inspection revealed:
>
>   demoboard ~ # systemctl status -l systemd-remount-fs.service
>   x systemd-remount-fs.service - Remount Root and Kernel File Systems
>        Loaded: loaded (/usr/lib/systemd/system/systemd-remount-fs.service=
;
> enabled-runtime; preset: disabled)
>        Active: failed (Result: exit-code) since Wed 2024-08-14 14:53:48
> UTC; 1min 22s ago
>          Docs: man:systemd-remount-fs.service(8)
>
> https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>       Process: 76 ExecStart=3D/usr/lib/systemd/systemd-remount-fs
> (code=3Dexited, status=3D1/FAILURE)
>      Main PID: 76 (code=3Dexited, status=3D1/FAILURE)
>
>   Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bin/mount for /
> exited with exit status 32.
>   Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: /: mount point
> not mounted or bad option.
>   Aug 14 14:53:48 demoboard systemd-remount-fs[81]:        dmesg(1) may
> have more information after failed mount system call.
>   Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Main
> process exited, code=3Dexited, status=3D1/FAILURE
>   Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Faile=
d
> with result 'exit-code'.
>   Aug 14 14:53:48 demoboard systemd[1]: Failed to start Remount Root and
> Kernel File Systems.
>
> also consequentially, 'systemctl status' reported:
>
>   State: degraded
>
> When issuing 'strace -ff mount -o remount /' the failure occurred at
>
>   mount_setattr(3, "", AT_EMPTY_PATH,
> {attr_set=3DMOUNT_ATTR_RDONLY|MOUNT_ATTR_NOATIME|MOUNT_ATTR_NODIRATIME,
> attr_clr=3DMOUNT_ATTR_NOSUID|MOUNT_ATTR_NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATT=
R_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_ATTR_NOSYMFOLLOW|0x40,
> propagation=3D0 /* MS_??? */, userns_fd=3D0}, 32) =3D -1 EINVAL (Invalid =
argument)
>
> After further investigation, The issue was pinpointed to lack of Linux
> kernel commit
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3D95de4ad173ca0e61034f3145d66917970961c210
> ("fs: relax mount_setattr() permission checks") in the kernel version
> that was being used. Above mitigation was discussed in email related to
> then-rejected CVE-2024-26821:
>
> https://lore.kernel.org/linux-cve-announce/2024051606-imaging-entrench-b3=
27@gregkh/T/
>
> After testing with qemuarm64 machine different linux-yocto versions,
> it was observed that the issue impacts following versions of currently
> supported LTS kernels:
>  - 6.6.17 (fixed since 6.6.18 i.e. mount_setattr() returns 0)
>  - 6.1.78 (fixed since 6.1.79 i.e. mount_setattr() returns 0)
>  - 5.15.164 which is currently the newest of 5.15.y series (i.e. no
>    known working version)
>
> Taking the above findings into consideration, add a new PACKAGECONFIG
> option which by default opts users out from using the feature which
> can cause issues with some older kernels.
>
> Versions 5.10.223, 5.4.279 and 4.10.317 were also tested but the issue
> was not reproduced with those versions - using strace showed that the
> mount_setattr call associated with the new mount API problem was not
> issued with these LTS kernel versions, which seemed to be confirmed
> also by following libmount debug message in these cases:
>
>   415: libmount:     HOOK: [0x7fa115e818]: failed to init new API
>
> Note: In addition to the aforementioned, this change was
> tested also briefly using the current latest kernel versions 6.1.104,
> 6.6.45 and 6.10.3 that using the old mount API with newest kernels
> did not introduce any observable regression to the boot flow.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.40.1.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> index a1aab94055..2d89eb6745 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> @@ -107,6 +107,13 @@ PACKAGECONFIG[cryptsetup] =3D
> "--with-cryptsetup,--without-cryptsetup,cryptsetup"
>  PACKAGECONFIG[chfn-chsh] =3D "--enable-chfn-chsh,--disable-chfn-chsh,"
>  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
>  PACKAGECONFIG[lastlog2] =3D
> "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
> +# Using the new file descriptors based mount kernel API can cause rootfs
> remount failure with some older kernels.
> +# Of currently supported LTS kernels, it seems safe to enable this optio=
n
> with:
> +# - version 6.6.18 and newer in the 6.6.y series.
> +# - version 6.1.79 and newer in the 6.1.y series.
> +# - with the 5.15.y series, versions till at least 5.15.164 can not use
> it.
> +# - with 5.10.y, 5.4.y and 4.19.y series kernels libmount seemed to use
> the old API regardless of this option.
> +PACKAGECONFIG[new-mount-api] =3D
> "--enable-libmount-mountfd-support,--disable-libmount-mountfd-support"
>
>  EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS=
}'"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203486):
> https://lists.openembedded.org/g/openembedded-core/message/203486
> Mute This Topic: https://lists.openembedded.org/mt/107977031/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007782d4062005167f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I don=E2=80=99t think this should be disabled by default =
actually. If the default upstream behavior is to enable, and all current li=
nux-yocto kernels have the needed support, then we should follow that.=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 19. =
Aug 2024 at 10.23, Niko Mauno via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;niko.mauno=3D<a href=3D"mailto:vaisala.com@=
lists.openembedded.org">vaisala.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left=
-color:rgb(204,204,204)">The 2.39 version of util-linux took new file descr=
iptors based mount<br>
kernel API into use. In relation to this change, the upstream release<br>
notes in<br>
<a href=3D"https://github.com/util-linux/util-linux/blob/v2.39/Documentatio=
n/releases/v2.39-ReleaseNotes#L14-L21" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/util-linux/util-linux/blob/v2.39/Documentation/releases=
/v2.39-ReleaseNotes#L14-L21</a><br>
mention that<br>
<br>
=C2=A0 This change is very aggressive to libmount code, but hopefully, it d=
oes not introduce regressions in traditional mount(8) behavior.<br>
<br>
After observing following failure when booting a board using a bit<br>
older 6.1 series kernel together with initramfs rootfs based boot flow<br>
<br>
=C2=A0 [FAILED] Failed to start Remount Root and Kernel File Systems.<br>
=C2=A0 See &#39;systemctl status systemd-remount-fs.service&#39; for detail=
s.<br>
<br>
closer inspection revealed:<br>
<br>
=C2=A0 demoboard ~ # systemctl status -l systemd-remount-fs.service<br>
=C2=A0 x systemd-remount-fs.service - Remount Root and Kernel File Systems<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Loaded: loaded (/usr/lib/systemd/system/systemd-=
remount-fs.service; enabled-runtime; preset: disabled)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Active: failed (Result: exit-code) since Wed 202=
4-08-14 14:53:48 UTC; 1min 22s ago<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Docs: man:systemd-remount-fs.service(8)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://w=
ww.freedesktop.org/wiki/Software/systemd/APIFileSystems" rel=3D"noreferrer"=
 target=3D"_blank">https://www.freedesktop.org/wiki/Software/systemd/APIFil=
eSystems</a><br>
=C2=A0 =C2=A0 =C2=A0 Process: 76 ExecStart=3D/usr/lib/systemd/systemd-remou=
nt-fs (code=3Dexited, status=3D1/FAILURE)<br>
=C2=A0 =C2=A0 =C2=A0Main PID: 76 (code=3Dexited, status=3D1/FAILURE)<br>
<br>
=C2=A0 Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bin/mount for=
 / exited with exit status 32.<br>
=C2=A0 Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: /: mount po=
int not mounted or bad option.<br>
=C2=A0 Aug 14 14:53:48 demoboard systemd-remount-fs[81]:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dmesg(1) may have more information after failed mount system cal=
l.<br>
=C2=A0 Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Ma=
in process exited, code=3Dexited, status=3D1/FAILURE<br>
=C2=A0 Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Fa=
iled with result &#39;exit-code&#39;.<br>
=C2=A0 Aug 14 14:53:48 demoboard systemd[1]: Failed to start Remount Root a=
nd Kernel File Systems.<br>
<br>
also consequentially, &#39;systemctl status&#39; reported:<br>
<br>
=C2=A0 State: degraded<br>
<br>
When issuing &#39;strace -ff mount -o remount /&#39; the failure occurred a=
t<br>
<br>
=C2=A0 mount_setattr(3, &quot;&quot;, AT_EMPTY_PATH, {attr_set=3DMOUNT_ATTR=
_RDONLY|MOUNT_ATTR_NOATIME|MOUNT_ATTR_NODIRATIME, attr_clr=3DMOUNT_ATTR_NOS=
UID|MOUNT_ATTR_NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATTR_NOATIME|MOUNT_ATTR_STRICT=
ATIME|MOUNT_ATTR_NOSYMFOLLOW|0x40, propagation=3D0 /* MS_??? */, userns_fd=
=3D0}, 32) =3D -1 EINVAL (Invalid argument)<br>
<br>
After further investigation, The issue was pinpointed to lack of Linux<br>
kernel commit<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=
/commit/?id=3D95de4ad173ca0e61034f3145d66917970961c210" rel=3D"noreferrer" =
target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/stable/li=
nux.git/commit/?id=3D95de4ad173ca0e61034f3145d66917970961c210</a><br>
(&quot;fs: relax mount_setattr() permission checks&quot;) in the kernel ver=
sion<br>
that was being used. Above mitigation was discussed in email related to<br>
then-rejected CVE-2024-26821:<br>
<a href=3D"https://lore.kernel.org/linux-cve-announce/2024051606-imaging-en=
trench-b327@gregkh/T/" rel=3D"noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/linux-cve-announce/2024051606-imaging-entrench-b327@gregkh/T/</a><=
br>
<br>
After testing with qemuarm64 machine different linux-yocto versions,<br>
it was observed that the issue impacts following versions of currently<br>
supported LTS kernels:<br>
=C2=A0- 6.6.17 (fixed since 6.6.18 i.e. mount_setattr() returns 0)<br>
=C2=A0- 6.1.78 (fixed since 6.1.79 i.e. mount_setattr() returns 0)<br>
=C2=A0- 5.15.164 which is currently the newest of 5.15.y series (i.e. no<br=
>
=C2=A0 =C2=A0known working version)<br>
<br>
Taking the above findings into consideration, add a new PACKAGECONFIG<br>
option which by default opts users out from using the feature which<br>
can cause issues with some older kernels.<br>
<br>
Versions 5.10.223, 5.4.279 and 4.10.317 were also tested but the issue<br>
was not reproduced with those versions - using strace showed that the<br>
mount_setattr call associated with the new mount API problem was not<br>
issued with these LTS kernel versions, which seemed to be confirmed<br>
also by following libmount debug message in these cases:<br>
<br>
=C2=A0 415: libmount:=C2=A0 =C2=A0 =C2=A0HOOK: [0x7fa115e818]: failed to in=
it new API<br>
<br>
Note: In addition to the aforementioned, this change was<br>
tested also briefly using the current latest kernel versions 6.1.104,<br>
6.6.45 and 6.10.3 that using the old mount API with newest kernels<br>
did not introduce any observable regression to the boot flow.<br>
<br>
Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com" tar=
get=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.40.1.bb" =
rel=3D"noreferrer" target=3D"_blank">util-linux_2.40.1.bb</a> | 7 +++++++<b=
r>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.40=
.1.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.40.1.bb</a> b/meta=
/recipes-core/util-linux/<a href=3D"http://util-linux_2.40.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">util-linux_2.40.1.bb</a><br>
index a1aab94055..2d89eb6745 100644<br>
--- a/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.40.1.bb" =
rel=3D"noreferrer" target=3D"_blank">util-linux_2.40.1.bb</a><br>
+++ b/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.40.1.bb" =
rel=3D"noreferrer" target=3D"_blank">util-linux_2.40.1.bb</a><br>
@@ -107,6 +107,13 @@ PACKAGECONFIG[cryptsetup] =3D &quot;--with-cryptsetup,=
--without-cryptsetup,cryptsetup&quot;<br>
=C2=A0PACKAGECONFIG[chfn-chsh] =3D &quot;--enable-chfn-chsh,--disable-chfn-=
chsh,&quot;<br>
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--with-selinux,--without-selinux,lib=
selinux&quot;<br>
=C2=A0PACKAGECONFIG[lastlog2] =3D &quot;--enable-liblastlog2,--disable-libl=
astlog2,sqlite3&quot;<br>
+# Using the new file descriptors based mount kernel API can cause rootfs r=
emount failure with some older kernels.<br>
+# Of currently supported LTS kernels, it seems safe to enable this option =
with:<br>
+# - version 6.6.18 and newer in the 6.6.y series.<br>
+# - version 6.1.79 and newer in the 6.1.y series.<br>
+# - with the 5.15.y series, versions till at least 5.15.164 can not use it=
.<br>
+# - with 5.10.y, 5.4.y and 4.19.y series kernels libmount seemed to use th=
e old API regardless of this option.<br>
+PACKAGECONFIG[new-mount-api] =3D &quot;--enable-libmount-mountfd-support,-=
-disable-libmount-mountfd-support&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D &#39;OP=
T=3D${CFLAGS}&#39;&quot;<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203486): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203486" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203486</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107977031/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107977031/1686489</a><br>
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

--0000000000007782d4062005167f--

