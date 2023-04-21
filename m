Return-Path: <nick.owens@eero.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B06C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 04:19:09 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.4459.1682050748913767350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 21:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@eero.com header.s=google header.b=rRLxJ5zg;
 spf=pass (domain: eero.com, ip: 209.85.210.181, mailfrom: nick.owens@eero.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-63b67a26069so2491126b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 21:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eero.com; s=google; t=1682050748; x=1684642748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TsSj31wLwVbfFbZvhkwX8LNpQWAq+uaRyI4ZwsEw3dk=;
        b=rRLxJ5zgz2+hIr2SMgOnTGM3DLHF+L+KH/3Zpre7XmiBCW2C+LMHp5GwlereZq7FjC
         E2qMoysoU0Bbqni0Ts145Ltr6VtlQczcfADqNqTbqhpdM8W3eJEYqIN2jZBoLQxqima6
         Kuki/YrJIxEAAW5w+okZ/ZRP5CI4C7krSOb3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682050748; x=1684642748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsSj31wLwVbfFbZvhkwX8LNpQWAq+uaRyI4ZwsEw3dk=;
        b=NmGN2da/q31dUNqN93LT933AXRoGcw7TN/h9ddEKnDSDBdHBc9vTswU4FExKtHSMua
         QYCh9MgffqWZLg8YhAhV0SReyXe/OOWS5fcp/kYUtbDgj9k7wvQtUTUhxJhGMleOqK0o
         K0q5Pb6h9iRXPNziu3MQdgQoW1q9mM8JMSngTYdf789Y6Zr1owbEnvfyGe/57Fv+vPhe
         p3eHeMhvdgzAZFajFGJPfU3xyq4GtZE89ANXNIh8Byi0k2R5yv+/tAXBZLGqMlWq4wII
         p971fweAE3gPM79OjuEA7LNTGns7xj+wNuZyga+ahjhKjPeuf2SQ29E8NtgJkJEpypdp
         F71w==
X-Gm-Message-State: AAQBX9cDrUVr++n5sq7P8Y/b4x1DP5e9AeFRI6NESabXhZ695tiA0kSo
	fOLGs6SgSRzSqH4sudS8CW0kbNPtZloIPvZXuaDa+w==
X-Google-Smtp-Source: AKy350Z/xYZzPJ85Yiu/VTc1VQRdApHb2pGAUpGWhQO5SdasxhJs1Rkzg7kABL8+/SOj4PK0CmlCnilbxGTaC6XRaLs=
X-Received: by 2002:a05:6a00:2ea6:b0:639:435:1373 with SMTP id
 fd38-20020a056a002ea600b0063904351373mr4780284pfb.10.1682050748117; Thu, 20
 Apr 2023 21:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230414192919.1887564-1-bruce.ashfield@gmail.com>
In-Reply-To: <20230414192919.1887564-1-bruce.ashfield@gmail.com>
From: Nick Owens <nick.owens@eero.com>
Date: Thu, 20 Apr 2023 21:18:56 -0700
Message-ID: <CAFQxptUcqHkp2ETikk8rm+q5nM9WtHvPVAT8eRFU5b6Vridwew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: improve initramfs bundle processing time
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000560ece05f9d0f515"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 04:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180268

--000000000000560ece05f9d0f515
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi bruce,

thanks for your work. looks good to me as a stopgap for now.

could this be backported to kirkstone?

nick

On Fri, Apr 14, 2023 at 12:29=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gma=
il.com>
wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> This is a partial fix for bugzilla 15059 [
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15059]
>
> It has been noted by several people that when an initramfs is bundled:
>
>   - a lot of the kernel is rebuilt
>   - it takes a really long time
>
> When looking at the logs, the second kernel compilation (that performs
> the bundle) is not using the parallel make settings, and builds with
> -j1.
>
> We are already explicitly passing PARALLEL_MAKE when building kernel
> modules, and by extending that explicit use to the main kernel
> compilation, we ensure that we always get a parallel build.
>
> Build times chnaged from more than 30 minutes for the bundle, to
> 3 minutes in local testing.
>
> The question of whether or not too much is rebuilding during the
> bundle step is still an open question, but with this tweak, at least
> the build time is back in the realm of acceptable.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index aefa0d21bc..e634eabd49 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -382,7 +382,7 @@ kernel_do_compile() {
>
> use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_IMA=
GE_NAME}.cpio
>         fi
>         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> -               oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS}
> $use_alternate_initrd
> +               oe_runmake ${PARALLEL_MAKE} ${typeformake}
> ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
>         done
>  }
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180005):
> https://lists.openembedded.org/g/openembedded-core/message/180005
> Mute This Topic: https://lists.openembedded.org/mt/98269754/4454754
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> nick.owens@eero.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000560ece05f9d0f515
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi bruce,</div><div><br></div><div>thanks for your wo=
rk. looks good to me as a stopgap for now.</div><div><br></div><div>could t=
his be backported to kirkstone?</div><div><br></div><div>nick<br></div><div=
 dir=3D"ltr"><br></div><div dir=3D"ltr">On Fri, Apr 14, 2023 at 12:29=E2=80=
=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.=
ashfield@gmail.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;<br>
<br>
This is a partial fix for bugzilla 15059 [<a href=3D"https://bugzilla.yocto=
project.org/show_bug.cgi?id=3D15059" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15059</a>]<br>
<br>
It has been noted by several people that when an initramfs is bundled:<br>
<br>
=C2=A0 - a lot of the kernel is rebuilt<br>
=C2=A0 - it takes a really long time<br>
<br>
When looking at the logs, the second kernel compilation (that performs<br>
the bundle) is not using the parallel make settings, and builds with<br>
-j1.<br>
<br>
We are already explicitly passing PARALLEL_MAKE when building kernel<br>
modules, and by extending that explicit use to the main kernel<br>
compilation, we ensure that we always get a parallel build.<br>
<br>
Build times chnaged from more than 30 minutes for the bundle, to<br>
3 minutes in local testing.<br>
<br>
The question of whether or not too much is rebuilding during the<br>
bundle step is still an open question, but with this tweak, at least<br>
the build time is back in the realm of acceptable.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index aefa0d21bc..e634eabd49 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -382,7 +382,7 @@ kernel_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_alternate_initr=
d=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE}=
 ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${typefo=
rmake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${PARALL=
EL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180005): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180005" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180005</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98269754/4454=
754" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98269754/4454754</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:nick.owens@eero.com" targe=
t=3D"_blank">nick.owens@eero.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000560ece05f9d0f515--

