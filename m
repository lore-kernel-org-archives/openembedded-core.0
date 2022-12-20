Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2077C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 04:43:10 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.43264.1671511386239883610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 20:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qTerxUrM;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: workjagadeesh@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1443a16b71cso14092917fac.13
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 20:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kTFgi6br+qFpBe27ECwTwBvw9jo8j8HOTL+JIWfZUQ0=;
        b=qTerxUrMFMAbruRMPs6i38CibG+mxibTMb0ZiQvT45+RJv2Bd8RSmERI0mxb6047jg
         8XJzE/q5ltOprUkrsL/hprHZp1WxoFrwyPEMAn+1NyNIKlh2rY8KbDphnaCtoTEtZyEC
         AYYVf8bxr2+oDETQIlWnTNclRy09shITB/4a98QMTU2pEnntEKPLVy+h67lfPi9S/RgM
         6mTx8CN087jmnh4T5xQY1hd/o5/OFValIRMTAhOVbp3i4zUz3NbRzkWzg5TVy3ESHTmi
         MQku31tMpCOj3FyZkCMEmtl5KD0QUAqtxPqX+Rmo3Cv7SwGpMpvLAL/X8E+MILE4L6jB
         bSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTFgi6br+qFpBe27ECwTwBvw9jo8j8HOTL+JIWfZUQ0=;
        b=4gjPlCpP9VZ/dweIzC2rE31D9m3KGZ9UstGtGUSRDREIsRy83GHqTanv4biCQEfyC9
         eHFaVq5YQqeGFHe1gb+fg7Kii78vmPXruUF7e8EdROxpDqrZUkqZhZXk/zBvq2hCFW8f
         XicJfMmR5TrIAfm7M8WnD3SW5YawUmRGbU6z4sGNYG8ZFjGUdA7Lb4Cz5szNK4MBlK9H
         8fuUuGQUuy+SoiFD5laSxpvahwwDFrertpcSRVgdW3y6LbxIeYqqRknM57kLxuQxNrad
         SbDjiwi4SfnDNQ4j3bTc5fkoxyycQycjBY9iDPiTrf68ml6KPdz3Msagt2FsngPneNCT
         fhBg==
X-Gm-Message-State: AFqh2kqnf+dk66uzDeWFgqJzF5VzAWQtLBZKX+urWdfg8fILjc5i95jg
	Z7ZnDIR0IKmxm5VLOs72fv0/UiTDO1MkqJV5mQD5Zgwp
X-Google-Smtp-Source: AMrXdXtlzYiIMxPyv3B0cTCMEWbNSwDkUaq8NMdAyJY+rPIRKmRVzUbvF2A/iv0Mv9crU9iOJIKtWjynd4cUWXQ4R8o=
X-Received: by 2002:a05:6870:3411:b0:144:5f0d:9fcb with SMTP id
 g17-20020a056870341100b001445f0d9fcbmr1456513oah.38.1671511385170; Mon, 19
 Dec 2022 20:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20221213145836.326-1-workjagadeesh@gmail.com>
In-Reply-To: <20221213145836.326-1-workjagadeesh@gmail.com>
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Date: Tue, 20 Dec 2022 10:12:53 +0530
Message-ID: <CAM682A3DG7rk79802jS++Kag6P9h=BYBS0+x+Q1qPzR7Oy0LoA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemuboot.bbclass: make sure runqemu boots
 bundled initramfs kernel image
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059e66305f03b1291"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 04:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174838

--00000000000059e66305f03b1291
Content-Type: text/plain; charset="UTF-8"

ping.

On Tue, Dec 13, 2022 at 8:28 PM Jagadeesh Krishnanjanappa <
workjagadeesh@gmail.com> wrote:

> The QB_DEFAULT_KERNEL is set to pick bundled initramfs kernel image
> if the Linux kernel image is generated with INITRAMFS_IMAGE_BUNDLE="1".
>
> This makes runqemu to automatically pick bundled initramfs kernel image
> instead of explicitly mentioning bundled initramfs kernel image in
> runqemu.
>
> [YOCTO #14748]
>
> Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> ---
>  meta/classes-recipe/qemuboot.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/qemuboot.bbclass
> b/meta/classes-recipe/qemuboot.bbclass
> index 018c000ca20..5a0e50ccfc2 100644
> --- a/meta/classes-recipe/qemuboot.bbclass
> +++ b/meta/classes-recipe/qemuboot.bbclass
> @@ -13,6 +13,7 @@
>  # QB_OPT_APPEND: options to append to qemu, e.g., "-device usb-mouse"
>  #
>  # QB_DEFAULT_KERNEL: default kernel to boot, e.g., "bzImage"
> +#                                            e.g.,
> "bzImage-initramfs-qemux86-64.bin" if INITRAMFS_IMAGE_BUNDLE is set to 1.
>  #
>  # QB_DEFAULT_FSTYPE: default FSTYPE to boot, e.g., "ext4"
>  #
> @@ -93,7 +94,7 @@
>  QB_MEM ?= "-m 256"
>  QB_SMP ?= ""
>  QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
> -QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
> +QB_DEFAULT_KERNEL ?= "${@bb.utils.contains("INITRAMFS_IMAGE_BUNDLE", "1",
> "${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin", "${KERNEL_IMAGETYPE}",
> d)}"
>  QB_DEFAULT_FSTYPE ?= "ext4"
>  QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device
> virtio-rng-pci,rng=rng0"
>  QB_OPT_APPEND ?= ""
> --
> 2.17.1
>
>

--00000000000059e66305f03b1291
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Dec 13, 2022 at 8:28 PM Jagadeesh Krishnanjan=
appa &lt;<a href=3D"mailto:workjagadeesh@gmail.com">workjagadeesh@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
The QB_DEFAULT_KERNEL is set to pick bundled initramfs kernel image<br>
if the Linux kernel image is generated with INITRAMFS_IMAGE_BUNDLE=3D&quot;=
1&quot;.<br>
<br>
This makes runqemu to automatically pick bundled initramfs kernel image<br>
instead of explicitly mentioning bundled initramfs kernel image in<br>
runqemu.<br>
<br>
[YOCTO #14748]<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:workjagadees=
h@gmail.com" target=3D"_blank">workjagadeesh@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/qemuboot.bbclass | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qem=
uboot.bbclass<br>
index 018c000ca20..5a0e50ccfc2 100644<br>
--- a/meta/classes-recipe/qemuboot.bbclass<br>
+++ b/meta/classes-recipe/qemuboot.bbclass<br>
@@ -13,6 +13,7 @@<br>
=C2=A0# QB_OPT_APPEND: options to append to qemu, e.g., &quot;-device usb-m=
ouse&quot;<br>
=C2=A0#<br>
=C2=A0# QB_DEFAULT_KERNEL: default kernel to boot, e.g., &quot;bzImage&quot=
;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 e.g., &quot;bzImage-initramfs-qemux86-64.bin&quot; if INITRAMFS_IMAG=
E_BUNDLE is set to 1.<br>
=C2=A0#<br>
=C2=A0# QB_DEFAULT_FSTYPE: default FSTYPE to boot, e.g., &quot;ext4&quot;<b=
r>
=C2=A0#<br>
@@ -93,7 +94,7 @@<br>
=C2=A0QB_MEM ?=3D &quot;-m 256&quot;<br>
=C2=A0QB_SMP ?=3D &quot;&quot;<br>
=C2=A0QB_SERIAL_OPT ?=3D &quot;-serial mon:stdio -serial null&quot;<br>
-QB_DEFAULT_KERNEL ?=3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
+QB_DEFAULT_KERNEL ?=3D &quot;${@bb.utils.contains(&quot;INITRAMFS_IMAGE_BU=
NDLE&quot;, &quot;1&quot;, &quot;${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}=
.bin&quot;, &quot;${KERNEL_IMAGETYPE}&quot;, d)}&quot;<br>
=C2=A0QB_DEFAULT_FSTYPE ?=3D &quot;ext4&quot;<br>
=C2=A0QB_RNG ?=3D &quot;-object rng-random,filename=3D/dev/urandom,id=3Drng=
0 -device virtio-rng-pci,rng=3Drng0&quot;<br>
=C2=A0QB_OPT_APPEND ?=3D &quot;&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--00000000000059e66305f03b1291--

