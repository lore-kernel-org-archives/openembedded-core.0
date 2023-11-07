Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA107C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:39:13 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.9305.1699360746200079262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kw56l+nq;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7b9dc92881eso2284950241.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 04:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699360745; x=1699965545; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FkbTSX+g7Z4COarYjI/PQiwBcX1FSpeQkb36sA5XJBo=;
        b=kw56l+nq30BFbJyV4TPATmqdlmv5u0NCMyvI3BOaWvxlRy/2sa4Ny+HStGpyRQgSSO
         +HCVGTQUudBE9FYeATHG6b0b1WMn3fecVCvB7ttSLVvhL1O4C/VXkBBjJzd+gJMDO0ra
         3CTc8KqhnOL0RlhoWLMlVFK+RMsYlKlU8wmjRVzmIJCzmDWdgDc3cjx+M60KLZo4gaIk
         R3syie9i3XZiIrO67YUATVDgB/zf2dMAf6Ca41oz0TQo0rquwuVP0q3vXPy4DsSWY/6W
         8qKaaq3SWBzHhv573S8/RiLyyoTx4lv7vajl6/gCpR+UijPpt/6BSdKezBnlGmJEOmIm
         GEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699360745; x=1699965545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkbTSX+g7Z4COarYjI/PQiwBcX1FSpeQkb36sA5XJBo=;
        b=dpqloc59FpqHUM0a92jCgnUQJ71bHc1u3HUKUQpnc4KryUXSNJ3S1dHEnPZ2HiYNyM
         fNzrHupU2dp/xVnVkVyR9/Z4tSrqrOxixTTi2aD2ZlYI2/7e5p5cnM6p3l3K3fJZpc9v
         fIkNQkoQNDuX/ZMEaKaJIeerz/tg4RmmcPeH3Rbc/aUKhLbBfGi5vExx+ohsEkszjzAA
         GEw63vLXTTkh7k1Ri1IWHsiJ2Tt+e6YprWpN9IHsivzpwH1vDU1q2beUact6hEDtKDGx
         aghy4EjistP+iMYPStGFs5VHLtir2+l6zYm7CEtchdsz3C457hR99OLRN4r4M8nxjarF
         vX3Q==
X-Gm-Message-State: AOJu0Yz86ZcHSORlGrWdDPF2wuBe4+2Wgn8T4+4NUvV9Mm+op3Iu0az1
	k2/EQeEv+CFvCeB+75Tu4tGPgFXZHR2jT6EA2II=
X-Google-Smtp-Source: AGHT+IFJc9NWuMSq8rpgi8/hnC2ou/2v8/lWBKGFRQ4nvQcIB/ppI/C7aBczfJcbqvhAPPVL6PEvDSpQ6wA1FdDIQEY=
X-Received: by 2002:a05:6102:c93:b0:45f:3b30:9ca9 with SMTP id
 f19-20020a0561020c9300b0045f3b309ca9mr5978861vst.15.1699360745200; Tue, 07
 Nov 2023 04:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20231107120017.515892-1-lukas.funke-oss@weidmueller.com>
In-Reply-To: <20231107120017.515892-1-lukas.funke-oss@weidmueller.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 7 Nov 2023 12:38:54 +0000
Message-ID: <CANPvuRk2CG92NwXi20MQrJAabyePM07_pPtQ-CMtNbCj+y3+ig@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] udev-extraconf: mount.sh: check if filesystem is
 supported before mounting
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, 
	Lukas Funke <lukas.funke@weidmueller.com>
Content-Type: multipart/alternative; boundary="0000000000009023a506098f4157"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 12:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190279

--0000000000009023a506098f4157
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lukas Funke <lukas.funke-oss@weidmueller.com> escreveu no dia ter=C3=A7a,
7/11/2023 =C3=A0(s) 12:00:

> From: Lukas Funke <lukas.funke@weidmueller.com>
>
> Check if the filesystem is supported by the kernel before trying to
> mount it. Systemd-mount will mount the directories asynchronously
> resulting in stale directories if the devices filesystem is not
> supported.
>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> ---
>  meta/recipes-core/udev/udev-extraconf/mount.sh | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh
> b/meta/recipes-core/udev/udev-extraconf/mount.sh
> index 989fabc194..59563b7511 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -36,6 +36,17 @@ do
>         fi
>  done
>
> +is_filesystem_supported() {
> +    list_fs=3D$(cat /proc/filesystems | cut -f 2 | tr '\n' ' ')
> +    for fs in ${list_fs}; do
> +        if [ "$fs" =3D=3D "$ID_FS_TYPE" ]
> +        then
> +            return 0
> +        fi
> +    done
> +    return 1
> +}
> +
>  automount_systemd() {
>      name=3D"`basename "$DEVNAME"`"
>
> @@ -64,6 +75,11 @@ automount_systemd() {
>          grep "^[[:space:]]*$tmp" /etc/fstab && return
>      done
>
> +    if ! is_filesystem_supported; then
>

I think the same can done with grep avoid string manipulations and the loop

+ if grep -q -w "$ID_FS_TYPE" /proc/filesystems; then

Jose

+        logger "mount.sh/automount" "Filesystem '$ID_FS_TYPE' on
> '${DEVNAME}' is unsupported"
> +        return
> +    fi
> +
>      [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
>
>      MOUNT=3D"$MOUNT -o silent"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190272):
> https://lists.openembedded.org/g/openembedded-core/message/190272
> Mute This Topic: https://lists.openembedded.org/mt/102440934/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009023a506098f4157
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Lukas Funke &lt;<a href=3D"mailto:luk=
as.funke-oss@weidmueller.com">lukas.funke-oss@weidmueller.com</a>&gt; escre=
veu no dia ter=C3=A7a, 7/11/2023 =C3=A0(s) 12:00:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Lukas Funke &lt;<a href=3D"mailto:l=
ukas.funke@weidmueller.com" target=3D"_blank">lukas.funke@weidmueller.com</=
a>&gt;<br>
<br>
Check if the filesystem is supported by the kernel before trying to<br>
mount it. Systemd-mount will mount the directories asynchronously<br>
resulting in stale directories if the devices filesystem is not<br>
supported.<br>
<br>
Signed-off-by: Lukas Funke &lt;<a href=3D"mailto:lukas.funke@weidmueller.co=
m" target=3D"_blank">lukas.funke@weidmueller.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/udev/udev-extraconf/mount.sh | 16 ++++++++++++++++<=
br>
=C2=A01 file changed, 16 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-=
core/udev/udev-extraconf/mount.sh<br>
index 989fabc194..59563b7511 100644<br>
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh<br>
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh<br>
@@ -36,6 +36,17 @@ do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0done<br>
<br>
+is_filesystem_supported() {<br>
+=C2=A0 =C2=A0 list_fs=3D$(cat /proc/filesystems | cut -f 2 | tr &#39;\n&#3=
9; &#39; &#39;)<br>
+=C2=A0 =C2=A0 for fs in ${list_fs}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$fs&quot; =3D=3D &quot;$ID_FS_TYPE&=
quot; ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 return 1<br>
+}<br>
+<br>
=C2=A0automount_systemd() {<br>
=C2=A0 =C2=A0 =C2=A0name=3D&quot;`basename &quot;$DEVNAME&quot;`&quot;<br>
<br>
@@ -64,6 +75,11 @@ automount_systemd() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep &quot;^[[:space:]]*$tmp&quot; /etc/f=
stab &amp;&amp; return<br>
=C2=A0 =C2=A0 =C2=A0done<br>
<br>
+=C2=A0 =C2=A0 if ! is_filesystem_supported; then<br></blockquote><div><br>=
I think the same can done with grep avoid string manipulations and the loop=
<br><br>+ if grep -q -w &quot;$ID_FS_TYPE&quot; /proc/filesystems; then</di=
v><div><br></div><div>Jose<br><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger &quot;<a href=3D"http://mount.sh/automo=
unt" rel=3D"noreferrer" target=3D"_blank">mount.sh/automount</a>&quot; &quo=
t;Filesystem &#39;$ID_FS_TYPE&#39; on &#39;${DEVNAME}&#39; is unsupported&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0[ -d &quot;$MOUNT_BASE/$name&quot; ] || mkdir -p &quot;=
$MOUNT_BASE/$name&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0MOUNT=3D&quot;$MOUNT -o silent&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190272): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190272" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190272</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102440934/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102440934/5052612</a><br>
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
div>

--0000000000009023a506098f4157--

