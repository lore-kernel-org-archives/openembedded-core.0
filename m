Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1EBC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 08:54:19 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web09.61757.1643792058845878654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 00:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f/iYG60E;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id p7so17820052uao.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 00:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Kacl9YiZRnM/KJZcdy+oW3kSTmEvhfE3ei06YeluQk=;
        b=f/iYG60E+Ka3uoxRIpYCw221QFMzV6UQtUHh87lRQlcyv1/Q+re8BUhDLlNVl8pRbf
         dZHNwz9+zzRCzdX7B0OkbdrAIcpO4J7cbnNmOd25eDcotVi0bvG1I1hxLFnM65aH/pKS
         TbRvTMFztoS74yfc3WIzYEs3mMqS8O95CfGuzhHudqKB0Kjbv2zZfkYla6OdkEO7oxPo
         iNPM1ZheoPpRyaJs5wwqA38M8YFdmLfQ71YOfKvby0AqXAg/1jLDJyKZJu/4tuH2rbqR
         92Gj+v3EvBqAXFn2DR8Pku0pFIBl/ccVmseX6poaXQ6KhcEhFhQCabDlrQBSlwJwPl+a
         Rk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Kacl9YiZRnM/KJZcdy+oW3kSTmEvhfE3ei06YeluQk=;
        b=tFY0vZ1Xv5doJ6mKL+ycxl1BFKQ48KLlcfZoBF2lfCAnwy/GO1O7AgfCpYpEAg3tjA
         u4MqLmUvPtxl5hn9xAJdliZKmxRi6z2cu9uFks6R7b4QxlJ/T7g2LHyGvRsAOFcQq/bj
         xo3BLWFAa4LAnMOflUbxYFMV452/j2wZXrOfwvqZLVmaQMUPoyU5pibDl3L/dYTQgVYN
         thaTLyQKrYlKBlMTzavTm56zVu+qfddqLHGYtr0lOHSB6bXIFMeRdvCTE8LD9z2aEg+f
         rFIhzcgBgL4r2LH++2JU1EdKwGP5+6VuY7wwKkzjgzBh6WdCwDGuJRknPFWPhX+AQ118
         z1Qg==
X-Gm-Message-State: AOAM530pOZMqzZMcdoK4NeWhsKh9zojGfvw7lvo7uVp0hvsCfgCAQZhh
	Cc8cjFs09sKUD8BkISF/Lfj8xrjdm25g5oiIiCo=
X-Google-Smtp-Source: 
 ABdhPJxid7LqqmNqvhkdXltyWVQl1seyMoGEQBFLJdYk+OEqDvbSCHcm4GmrRmFKdD3uNeWJFJWL0xieeZdJudHwC7o=
X-Received: by 2002:a67:b241:: with SMTP id s1mr11363969vsh.73.1643792057934;
 Wed, 02 Feb 2022 00:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Feb 2022 09:54:05 +0100
Message-ID: 
 <CANNYZj_D2oYxB88Z28X=U=BZJk5L=i-uLhfzD2YJUEJFbqyiKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] cve-check: create directory of
 CVE_CHECK_MANIFEST before copy
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000b2a74905d705298b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 08:54:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161186

--000000000000b2a74905d705298b
Content-Type: text/plain; charset="UTF-8"

Thanks :)

Alex

On Wed, 2 Feb 2022 at 08:35, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Create directory of the CVE_CHECK_MANIFEST variable before copy to it,
> so that the variable can use an arbitrary directory name.
>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
>
> ---
>
> Changes in v2:
> - Reword commit
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
> View/Reply Online (#161180):
> https://lists.openembedded.org/g/openembedded-core/message/161180
> Mute This Topic: https://lists.openembedded.org/mt/88853820/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b2a74905d705298b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks :)</div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, 2 Feb 2022 at 08:35, Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefa=
n.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@weidmuell=
er.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsm=
eier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.=
com</a>&gt;<br>
<br>
Create directory of the CVE_CHECK_MANIFEST variable before copy to it,<br>
so that the variable can use an arbitrary directory name.<br>
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
<br>
---<br>
<br>
Changes in v2:<br>
- Reword commit<br>
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
View/Reply Online (#161180): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161180" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161180</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88853820/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88853820/1686489</a><br>
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

--000000000000b2a74905d705298b--

