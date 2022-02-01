Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD4DC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 17:00:20 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web08.50991.1643734819073096358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 09:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EngeXCZt;
 spf=pass (domain: gmail.com, ip: 209.85.221.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 48so10957535vki.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 09:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJftKqqHK6RPmYs7cFqzJZMmL33UPNiInr/nHfSh3Mo=;
        b=EngeXCZtx3XXQmG5PGA0F4goehhYB/6r6Zl6LLfEIRi2tK8CUEU9C80zx+VQ//OVIt
         VY1Jyq8jZRR1L1Mzg/E2lhIZceY0QLaucK1Xb60qDpjuMoLfbEOmCRHEZcroZLwT+Bf8
         flm/665oiBq17Afkv4K9984JS5kpZUdCSLP21+6ga3mEtxEUbrIsbO9nVc/bs42UQp2M
         TfwQoXiofplYXma2dZKhrjaMac7ksG6h1JNaDkzimlroXEcK/ovCyz5sXWmpn/dLA1Zc
         tf6FJy5RcT7Oak3E58BvYk1aZE+to5u+imDxLxxoTS0iVir65rHSZ6UFt2LxaN668G94
         NfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wJftKqqHK6RPmYs7cFqzJZMmL33UPNiInr/nHfSh3Mo=;
        b=Bkfo5Mjn05+L6sZWSRsGQPTMea33JQzoGWdkqrNK5bwSCU6a07a7OmaVWAl2CdaW7K
         LbpE+QNsP1PAkyJ49d5zjz+rX5PHHJLPvCnRrA02KkszCeRDO4bH1wiidxDTUz5Tuj5n
         tEtQUELPSfEqM8PBkGBUyFKD2WxXwdbyc2Qsw1U3ckVns/27aaWQPkeXcGWZxd+FfYJm
         am22tzSml3vVXtQAMHDEoCxChoPjhqXwJAK/S0+y9o6iXZ0l84IwX840+0YRSj81uSoR
         SMUa94bmnDuLeWCPfv/gxqqBjPWjFJdnyHRiSda8s5XmSdVuM8HTWORu4Vx4A0OX/D5p
         IoBw==
X-Gm-Message-State: AOAM533KBfa9V/Kute/cxE9eVnZ9110LmsalDM7X4ZI/LrU/d9FK0HAt
	A3ruMkQzHDrMxkvcM5U1gCC/ewgNUhdLohVXyCM=
X-Google-Smtp-Source: 
 ABdhPJyzgkt0Q01pclUCxtjo/DhMLxy0eT1kJO0MTV7+vIdQbI5E1kWRInL+7dG+EWSXG5LZxHp9qrYChboya9eL6uQ=
X-Received: by 2002:a1f:3117:: with SMTP id x23mr11359508vkx.1.1643734818211;
 Tue, 01 Feb 2022 09:00:18 -0800 (PST)
MIME-Version: 1.0
References: 
 <20220201161638.25531-1-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220201161638.25531-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Feb 2022 18:00:06 +0100
Message-ID: 
 <CANNYZj_ju3e+JbsxurjDLue4q3WeAfKMUQJqcXSF=5R2898-VQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] cve-check: create directory before copy
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000f1c9e905d6f7d5ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 17:00:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161162

--000000000000f1c9e905d6f7d5ab
Content-Type: text/plain; charset="UTF-8"

Can you please describe the issue this is fixing in the commit message? Why
is this not seen by others?

Alex

On Tue, 1 Feb 2022 at 17:17, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  meta/classes/cve-check.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index 70d1988a70..a4d735c323 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -143,6 +143,7 @@ python cve_check_write_rootfs_manifest () {
>          manifest_name = d.getVar("CVE_CHECK_MANIFEST")
>          cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
>
> +        bb.utils.mkdirhier(os.path.dirname(manifest_name))
>          shutil.copyfile(cve_tmp_file, manifest_name)
>
>          if manifest_name and os.path.exists(manifest_name):
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161159):
> https://lists.openembedded.org/g/openembedded-core/message/161159
> Mute This Topic: https://lists.openembedded.org/mt/88836328/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f1c9e905d6f7d5ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you please describe the issue this is fixing in t=
he commit message? Why is this not seen by others?</div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 1 Feb 2022 at 17:17, Stefan Herbrechtsmeier &lt;<a =
href=3D"mailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrecht=
smeier-oss@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Stefan Herbrechtsmeier &lt;<a href=3D"mailt=
o:stefan.herbrechtsmeier@weidmueller.com" target=3D"_blank">stefan.herbrech=
tsmeier@weidmueller.com</a>&gt;<br>
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
---<br>
<br>
=C2=A0meta/classes/cve-check.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index 70d1988a70..a4d735c323 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -143,6 +143,7 @@ python cve_check_write_rootfs_manifest () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest_name =3D d.getVar(&quot;CVE_CHEC=
K_MANIFEST&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_tmp_file =3D d.getVar(&quot;CVE_CHECK=
_TMP_FILE&quot;)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(os.path.dirname(manifest_na=
me))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copyfile(cve_tmp_file, manifest_na=
me)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if manifest_name and os.path.exists(manif=
est_name):<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161159): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161159" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161159</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88836328/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88836328/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f1c9e905d6f7d5ab--

