Return-Path: <aoifepowerIris@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6953C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 14:55:17 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.212638.1724079311911658609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 07:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hSTMLmMM;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: aoifepoweriris@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8384008482so460213966b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 07:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724079310; x=1724684110; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k2dkraBbOER6mkxRfJhmNlZNRTTgt5Mj2t1lisZBNFU=;
        b=hSTMLmMMzDegLh7Z1UGRpdqP2SCPHgLcl1BgBSNao3/ZCUk2gi5Ftf5NzGMZ1PRy3+
         5xylzkeiNbb9DmUSf372C2cMOgt5/cCzDjI0gyX0mnOWQXzW4H9rUIcUl5gB8kgXdYhR
         /lz7K6eE20FdBS7KHz5QyficxrOb0EdzTKvIHgj2b4JcUX6871TOdfK3EuVDt1ofuUey
         m1qz8vmJPr0HlZcWELU4sNGz4vcKs5dPQC5HVdrydmk0dVS08BTS2XgtapQYGQtlDqQo
         xNgmx8xtWq1aLxzbhAs7h96xlb2UgSNAOdLAX4XmeJeK2Fbz10TOdRUDYp8ltXF159ec
         10Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724079310; x=1724684110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2dkraBbOER6mkxRfJhmNlZNRTTgt5Mj2t1lisZBNFU=;
        b=j0+wBowrUCvLa1rmlyvD/j9Wd0DatqEO+QHJ7xKFoy6FPSy0SAsijRWIXTVMnyQRJZ
         xPZ+jm+0dBD4UHvmHrU1Eyy8CB5m8yEia2YXZ1crSDHSpvkCw3e2y8CtUKVoUrp/AWRE
         T3iPpKqM5WDLICbH9KDpmfbvj3e5GX7c+pLFoqtq+hTTY2LcaxTPz2CmO7biqQOIA0as
         laMECeHdLkUOx6Z9VLpnXmCwLmceSpheu3kEaCgdu9YnADD4cwL2B3KRdPKhWoHJ5xvS
         BPB7Mqt2Eyy+5JRYW8Y18C9Jbr9zOopRAHWgV6Bq3TwwVTTcXBu7h8iYbS97nj5u5Z/0
         VQFA==
X-Gm-Message-State: AOJu0YxAMq3yHVXBOr7mKAKLq3pMxy6GH0i1wqAJVpHlnXoBVPTnO9P0
	0iDAM9Ql0TYu5aE1FPbv6zl7L/PBKinEZCLjpMDeXp8eaebWylM7MvwouTgtWe06c2dM/VYHL7D
	k2qG4C/RX8/HeY9DkzvQmn0Hu2DEx+U2M0wU=
X-Google-Smtp-Source: AGHT+IFHWYHV0gXmt8LOOftbh9rGmq6VEgqg8kkJ9LmmgdJeRgp5/22FWIa2foPDoxf53XmTsPvThtERjVQLtejkSuc=
X-Received: by 2002:a17:907:2da3:b0:a7a:8cfb:655b with SMTP id
 a640c23a62f3a-a83aa0c0422mr521808766b.64.1724079310024; Mon, 19 Aug 2024
 07:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240819145140.582935-1-aoifepowerIris@gmail.com>
In-Reply-To: <20240819145140.582935-1-aoifepowerIris@gmail.com>
From: Aoife Power <aoifepoweriris@gmail.com>
Date: Mon, 19 Aug 2024 16:54:59 +0200
Message-ID: <CAFpNyFw0xR-MqoVmQSjPYGbEwNZkPdPWSx2JP2rnOi=5K1g0cQ@mail.gmail.com>
Subject: Re: [PATCH] Util-linux: Adding missing ptest dependencies
To: openembedded-core@lists.openembedded.org
Cc: jasper@fancydomain.eu
Content-Type: multipart/alternative; boundary="000000000000d6b58406200a7e17"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 14:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203509

--000000000000d6b58406200a7e17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note: with ptests the adduser package is only avaliable in the
meta-openembedded/meta-perl layer.
Does this need to be included elsewhere for the ptest use case?  Should it
be added to the core layer to allow the ptests to work correctly?
Thanks,
Aoife

On Mon, Aug 19, 2024 at 4:52=E2=80=AFPM Aoife Power <aoifepoweriris@gmail.c=
om>
wrote:

> Missing adduser and eudev to RDEPENDS dependencies for ptest
>
> Signed-off-by: Aoife Power <aoifepowerIris@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.40.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> index a1aab94055..f1c200c28b 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> @@ -139,7 +139,7 @@ RDEPENDS:${PN}-dev +=3D " util-linux-libuuid-dev"
>  RPROVIDES:${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev"
>
>  RDEPENDS:${PN}-bash-completion +=3D "${PN}-lsblk"
> -RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs
> findutils grep iproute2 kmod procps sed socat which xz diffutils"
> +RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs
> findutils grep iproute2 kmod procps sed socat which xz diffutils adduser
> eudev"
>  RRECOMMENDS:${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-sd-=
mod
> kernel-module-loop kernel-module-algif-hash"
>  RDEPENDS:${PN}-swaponoff =3D "${PN}-swapon ${PN}-swapoff"
>  ALLOW_EMPTY:${PN}-swaponoff =3D "1"
> --
> 2.46.0
>
>

--000000000000d6b58406200a7e17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Note: with ptests the adduser package is only avaliab=
le in the meta-openembedded/meta-perl layer. <br></div><div>Does this need =
to be included elsewhere for the ptest use case?=C2=A0 Should it be added t=
o the core layer to allow the ptests to work correctly? <br></div><div>Than=
ks, <br></div><div>Aoife <br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 19, 2024 at 4:52=E2=80=AFPM =
Aoife Power &lt;<a href=3D"mailto:aoifepoweriris@gmail.com">aoifepoweriris@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Missing adduser and eudev to RDEPENDS dependencies for ptest<br>
<br>
Signed-off-by: Aoife Power &lt;<a href=3D"mailto:aoifepowerIris@gmail.com" =
target=3D"_blank">aoifepowerIris@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.40.1.bb" =
rel=3D"noreferrer" target=3D"_blank">util-linux_2.40.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.40=
.1.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.40.1.bb</a> b/meta=
/recipes-core/util-linux/<a href=3D"http://util-linux_2.40.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">util-linux_2.40.1.bb</a><br>
index a1aab94055..f1c200c28b 100644<br>
--- a/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.40.1.bb" =
rel=3D"noreferrer" target=3D"_blank">util-linux_2.40.1.bb</a><br>
+++ b/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.40.1.bb" =
rel=3D"noreferrer" target=3D"_blank">util-linux_2.40.1.bb</a><br>
@@ -139,7 +139,7 @@ RDEPENDS:${PN}-dev +=3D &quot; util-linux-libuuid-dev&q=
uot;<br>
=C2=A0RPROVIDES:${PN}-dev =3D &quot;${PN}-libblkid-dev ${PN}-libmount-dev&q=
uot;<br>
<br>
=C2=A0RDEPENDS:${PN}-bash-completion +=3D &quot;${PN}-lsblk&quot;<br>
-RDEPENDS:${PN}-ptest +=3D &quot;bash bc btrfs-tools coreutils e2fsprogs fi=
ndutils grep iproute2 kmod procps sed socat which xz diffutils&quot;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;bash bc btrfs-tools coreutils e2fsprogs fi=
ndutils grep iproute2 kmod procps sed socat which xz diffutils adduser eude=
v&quot;<br>
=C2=A0RRECOMMENDS:${PN}-ptest +=3D &quot;kernel-module-scsi-debug kernel-mo=
dule-sd-mod kernel-module-loop kernel-module-algif-hash&quot;<br>
=C2=A0RDEPENDS:${PN}-swaponoff =3D &quot;${PN}-swapon ${PN}-swapoff&quot;<b=
r>
=C2=A0ALLOW_EMPTY:${PN}-swaponoff =3D &quot;1&quot;<br>
-- <br>
2.46.0<br>
<br>
</blockquote></div>

--000000000000d6b58406200a7e17--

