Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6468.1792849319597407283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 06:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NHvhiceB;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1872386f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792849318; x=1793454118; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3XpqWcsRk3y8KlYYUkLBi1W6Ng9DHObykm6MG5lEoxU=;
        b=NHvhiceB6rK2GfYYCkDiS28oNriGsi+GT8NB2UpUZvqG6jvK0N6ggLDkVKqI3vcWTx
         gityZVFhlxuPIeXNWRHso1FsqoPk20N+CDpSdwsHsZ+sKIQiGDF3eZv8BsAz2ZZVn5zd
         BWcccZeMhFEsYjH1O1tzRI4Bekxz9txXHGhFgZd1Rsm8PEfx5EsAZJ8fPcyhqmgRkikc
         mG+Prk9oXNPuTL3H/rx7hI5Ouq0zs7n1jJSzeRI/DdWFzzVASQcKf01BazcSBqITYYYV
         lA0V2m8EMstB/QpP1AJcW7Xic5lqDcwNo7GYRGdJfnoYOhV3wGI0/9HBcVviKVuifk9Y
         DiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792849318; x=1793454118;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XpqWcsRk3y8KlYYUkLBi1W6Ng9DHObykm6MG5lEoxU=;
        b=YVQKXAUvGYwxCyM8YKxRRIYu/5Zu1G40vxND7288ETH0rOyy9qmEcjSBFcl+9cE+Ye
         Tdjgb2bmoVkOZmvPiB0Szq1T3oEghM3FpPnqAmlka2nxR990Im/G4kjuP7lwCENqjZyv
         8HM9UtZw/h/AyFmdjHBfrHeA3bObqEiMWKKFh+US7kOzL4ywAzFSVMp0W7RGOOMxKosJ
         3DeR5TWgesV5SxZLgU82L/HAlqbpl9WD5fuLDzI4hzylGRLQElHdqd/m7QqxiUUMNKib
         Edh4rG51ADFOv+ZeBkiG1rND3f4aZRBhPMRHyMg/IuoMMwGL/AWFEy5Tw+TazVyIgYuc
         I+yg==
X-Forwarded-Encrypted: i=1; AKwUvBzbEouW/CH4EqX/+GxK72bRH1yBgsNgHuDcQeRB0WG22GwurziUccsbhfDRNcpjGUyvcPqK3JMTFOyKYoZEReAnIA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJgB8NAwA46mt4qjXtc/O4dFInioV9T11mm7wlYSATB/rIBdAnx
	pyGHzD2mAgK7PPuScuebO6kHMCxS/rJhcf9MzTet3xbAAU3ol+YxQw1f
X-Gm-Gg: AYBFou1AGtWcuE0L0hFfTxv5EKxsB9gAoDeMAZFhhA7RiwXd2ekeAHAqTSqfKgiip7E
	/iMMve1qt1t9IztybCCkbkj6OpPR1gQrI+wM5k8RQEsVpjUYtTczXKRsCkYW+trF24Otz/9+gTp
	VqA2mhq5qjGEEhxPOGntFiDNFReaxkIbdGqwXKZBSQz81VgicDnte7WIbSv9SwTgtcWb5E7SbER
	SDjPe2gTxg6kiQBIGL+m12ojubQEHC7RG+/Ln+pifTdmDWugSA3IWjqYgxg9jzevjv2ygTZYgcT
	xP1NmjYCjZu31l62dPWaYXubQVDQPNC3wSLi9dzTFFmawJwITsNeBbVlz4FzJbsLktlSX9kv2XM
	ft/KJtdMYcgeFYWJOVH7b3+dgQa2T4CVi8gql2qN5AxMZvoiK8HWJUl3Psht+wE2UqbFv4dwDm3
	WG9WizJ/qkzT+4RokWRKimdtPEgqmDpRVBhdwe9EKgqFdNMembgBzCpNwGo6Rpo54xkUq4h+c6q
	/ZZ1LS7xOCjwzwS78OOygOcpPXbISoF5PBWYUpJYfHf4PtvJGX9Ya5AyqF6lN4+jn6R3WK4q/yT
	PMZ8EfqidLeyCBtC114o5VyzmyId
X-Received: by 2002:a05:6000:2501:b0:48e:127a:c914 with SMTP id ffacd0b85a97d-48e3eb65e44mr3318980f8f.5.1792849317527;
        Sat, 24 Oct 2026 06:41:57 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8e0sm4195940f8f.29.2026.10.24.06.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:41:56 -0700 (PDT)
Message-ID: <10919e24720fb0a8a04fbfbf155ee67b631a7cab.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/4] oe.fitimage: Support multiple kernel
 nodes and configuration selection
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: vgharaee@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 24 Oct 2026 15:41:56 +0200
In-Reply-To: <20261020133551.90185-2-vgharaee@gmail.com>
References: <20261020133551.90185-1-vgharaee@gmail.com>
	 <20261020133551.90185-2-vgharaee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 13:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248591

Hi Vahid,

Thanks for working on this, being able to put several kernels into one
FIT image is a useful feature. I had a closer look at the series and
have a few comments.


On Tue, 2026-10-20 at 15:35 +0200, Vahid Gharaee via
lists.openembedded.org wrote:
> From: Vahid Gharaee <v.gharaee@reinhausen.com>
>=20
> Signed-off-by: Vahid Gharaee <vgharaee@gmail.com>

The author address does not match the Signed-off-by. Please use the
same identity for both.

The commit message has no body. Please explain why the change is
needed. Nothing in this patch uses the new kernel parameter yet, so it
would also help to say that this prepares for the following patches.

For the shortlog, changes to meta/lib/oe/fitimage.py usually use the
"kernel-fit-image:" prefix, e.g.:
  kernel-fit-image: support multiple kernel nodes

> ---
> =C2=A0meta/lib/oe/fitimage.py | 18 ++++++++++++------
> =C2=A01 file changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> index 484e5c5ee0..91ccc31d46 100644
> --- a/meta/lib/oe/fitimage.py
> +++ b/meta/lib/oe/fitimage.py
> @@ -193,6 +193,7 @@ class ItsNodeRootKernel(ItsNode):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._dtbs =3D []
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._dtb_alias =3D []
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._kernel =3D None
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._kernels =3D {}

Do we need both _kernel and _kernels? Dicts keep insertion order, so
the default kernel is always the first entry of _kernels. I'd drop
_kernel and derive the default, e.g.:

    @property
    def _default_kernel(self):
        return next(iter(self._kernels.values()), None)

That avoids keeping two attributes in sync.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._ramdisk =3D None
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._bootscr =3D None
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._setup =3D None
> @@ -268,8 +269,8 @@ class ItsNodeRootKernel(ItsNode):
> =C2=A0=C2=A0=C2=A0=C2=A0 def fitimage_emit_section_kernel(self, kernel_id=
, kernel_path,
> compression,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 load, entrypoint, mkimag=
e_kernel_type, entrysymbol=3DNone):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """Emit the fitImage ITS=
 kernel section"""
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self._kernel:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fa=
tal("Kernel section already exists in the ITS
> file.")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if kernel_id in self._kernels=
:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fa=
tal("Kernel section '%s' already exists in the ITS
> file." % kernel_id)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if entrysymbol:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
result =3D subprocess.run([self._host_prefix + "nm",
> "vmlinux"], capture_output=3DTrue, text=3DTrue)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
for line in result.stdout.splitlines():
> @@ -294,7 +295,10 @@ class ItsNodeRootKernel(ItsNode):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
compression,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
opt_props,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._kernel =3D kernel_node
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._kernels[kernel_id] =3D =
kernel_node
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self._kernel is None:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.=
_kernel =3D kernel_node
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def fitimage_emit_section_dtb(self, dtb_id, dtb_=
path,
> dtb_loadaddress=3DNone,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtbo_loadaddress=
=3DNone,
> add_compatible=3DFalse):
> @@ -425,7 +429,7 @@ class ItsNodeRootKernel(ItsNode):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._loadables.append(l=
oadable_node)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 def _fitimage_emit_one_section_config(self, conf_node=
_name,
> dtb=3DNone):
> +=C2=A0=C2=A0=C2=A0 def _fitimage_emit_one_section_config(self, conf_node=
_name,
> dtb=3DNone, kernel=3DNone):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """Emit the fitImage ITS=
 configuration section"""
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opt_props =3D {}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conf_desc =3D []
> @@ -436,9 +440,11 @@ class ItsNodeRootKernel(ItsNode):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if dtb and os.path.split=
ext(dtb.name)[1] =3D=3D ".dtbo":
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
include_kernel =3D 0
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self._kernel and include_k=
ernel:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 selected_kernel =3D kernel if=
 kernel is not None else
> self._kernel
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if selected_kernel and includ=
e_kernel:

For a .dtbo configuration, a kernel passed in explicitly is silently
dropped. That's fine for the generated per-DTB configurations. But with
4/4, FIT_CONFIG_KERNEL[x] is ignored without notice if
FIT_CONFIG_DTB[x]
is an overlay. I'd suggest failing in that case, either here or in
fitimage_emit_section_config_custom().

Regards,
Adrian

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
conf_desc.append("Linux kernel")
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opt_p=
rops["kernel"] =3D self._kernel.name
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opt_p=
rops["kernel"] =3D selected_kernel.name
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if self._sign_enable:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 sign_entries.append("kernel")
> =C2=A0
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248288):
> https://lists.openembedded.org/g/openembedded-core/message/248288
> Mute This Topic: https://lists.openembedded.org/mt/121849065/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
