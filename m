Return-Path: <dit.kozmaj@kynetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E03C76195
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 16:27:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.48213.1679502442877090074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 09:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20210112.gappssmtp.com header.s=20210112 header.b=OhHPH1ip;
 spf=neutral (domain: kynetics.com, ip: 209.85.210.174, mailfrom: dit.kozmaj@kynetics.com)
Received: by mail-pf1-f174.google.com with SMTP id n20so6859075pfa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20210112.gappssmtp.com; s=20210112; t=1679502442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iTRfWMd4BRr/o2T8A7OOb/JTL4xvzY7ixtx3orsdET0=;
        b=OhHPH1ipGaeYbtr+N9SNjSjbp/ZMZFtolVHqp/TixB6J0sUoikBZILcoTagfHNhTQC
         HTRHMf+EXBMZw7OQN5ZEYVkuvlerV95qZvbZz1fSCtdQ3Bkpq/yfzTNIQE2gbXO2he07
         ARhIWzcHj+BvvHL2KMDf9QwSXeFNdaTlRIVkj7648YKm1fu4pd0ghMefo3aFCMEf6bV4
         5obCIhpekJQAn+6TiiY6YlDF+c+SdkTtOqjVps8Il82hD13mrI+nW2NXarIOGMqZqxdT
         RG8SuMPPz490ebXkXj5WI5G/R85qMojQMeG/cnwn+YP/7XRlERqqY5T2o6f5ES6+rhya
         5+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679502442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTRfWMd4BRr/o2T8A7OOb/JTL4xvzY7ixtx3orsdET0=;
        b=mmMCH1LTrAHfI1b61FBAZs886quF691X9tlDuUMS5p05b2JfLX0PnIsFeYGS3kytKw
         GoDkBQEnzqNER3DikLgMat8x4c9ToWp/Vx4QWy/7tO439PvOrhUR9txtCHzNyxNUqvQz
         mQp/iCafwWmZIQfF/85WIX0frakZYktcDOUItP3BuJRgcOKWrav8hu8e5d2elvBYbj99
         hZRxXAT79XyvgClkAAtoe59e7Srpzjvo+Ao8IkjLDwe3CDj8pc5E8696ooW2aJ0Sdvol
         Has3U8CIo+oVNe3zok1U0e1wq22lQa/FjXZs66kSuBfaT7ir7/K4Ta+Rjr548yiCVOMd
         X5og==
X-Gm-Message-State: AO0yUKVecrty+Jiya/1nidLrbrAteCTWh4V6CaFCxxNfrKb9wVYuvwcJ
	LijgftGLFQPBlnz1XL2IBcphWsId/mroS8Nu9XRm50GFGco2yd6gktg=
X-Google-Smtp-Source: AK7set8RdmT2IYN9r/iX85zVKGv4pQ/n5SbBYUAxsVY74kxnEvqvOsZ+87nA6EEek2Ks3CrDuZOrHryVo1/FqZlhtmk=
X-Received: by 2002:a05:6a00:9a9:b0:625:563e:7d17 with SMTP id
 u41-20020a056a0009a900b00625563e7d17mr2429940pfg.0.1679502442132; Wed, 22 Mar
 2023 09:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230322155430.31594-1-dit.kozmaj@kynetics.com>
In-Reply-To: <20230322155430.31594-1-dit.kozmaj@kynetics.com>
From: Dit Kozmaj <dit.kozmaj@kynetics.com>
Date: Wed, 22 Mar 2023 17:27:11 +0100
Message-ID: <CABU0hBJbE790Md==cUt8Y1oEL=3XJrrfbXFWO7bwA+dgHsf3FQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] wic: use part_name when defined
To: openembedded-core@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Content-Type: multipart/alternative; boundary="000000000000768a3b05f77fa26b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 16:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178950

--000000000000768a3b05f77fa26b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
We tested a few combinations of --part-name and --label parameters when
creating a WIC image.

When only the --part-name is defined, the GPT partition label is correctly
set, and filesystem label is empty.

If both are defined, or only --label is defined, both the filesystem label
and the GPT partition label are set to the value of --label.


As it makes sense to have a GPT partition label which is different from the
contained filesystem label, our proposal is to fix the case when both are
set, and keep the current behavior when only --label is set for
compatibility reasons.

If this proposal is ok, we will patch the documentation to document that
the GPT partition label is set even when only --label is defined.

Regards

On Wed, Mar 22, 2023 at 4:54=E2=80=AFPM <dit.kozmaj@kynetics.com> wrote:

> From: Dit Kozmaj <dit.kozmaj@kynetics.com>
>
> So far part.label has been used to define GPT partition label even if
> part.part_name was defined.
> Fix the code to use part.part_name whenever available, as it makes sense
> to have a GPT partition label which is different from the contained
> filesystem label.
>
> Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py
> index dfaa901567..1f06b89f8e 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -571,11 +571,12 @@ class PartitionedImage():
>              self._create_partition(self.path, part.type,
>                                     parted_fs_type, part.start,
> part.size_sec)
>
> -            if part.part_name:
> +            if part.part_name or part.label:
> +                partition_label =3D part.part_name if part.part_name els=
e
> part.label
>                  logger.debug("partition %d: set name to %s",
> -                             part.num, part.part_name)
> +                             part.num, partition_label)
>                  exec_native_cmd("sgdisk --change-name=3D%d:%s %s" % \
> -                                         (part.num, part.part_name,
> +                                         (part.num, partition_label,
>                                            self.path), self.native_sysroo=
t)
>
>              if part.part_type:
> @@ -592,13 +593,6 @@ class PartitionedImage():
>                                  (part.num, part.uuid, self.path),
>                                  self.native_sysroot)
>
> -            if part.label and self.ptable_format =3D=3D "gpt":
> -                logger.debug("partition %d: set name to %s",
> -                             part.num, part.label)
> -                exec_native_cmd("parted -s %s name %d %s" % \
> -                                (self.path, part.num, part.label),
> -                                self.native_sysroot)
> -
>              if part.active:
>                  flag_name =3D "legacy_boot" if self.ptable_format =3D=3D=
 'gpt'
> else "boot"
>                  logger.debug("Set '%s' flag for partition '%s' on disk
> '%s'",
> --
> 2.34.1
>
>

--000000000000768a3b05f77fa26b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>We tested a few combinations of --part-name and --l=
abel parameters when creating a WIC image.<br><br>When only the --part-name=
 is defined, the GPT partition label is correctly set, and filesystem label=
 is empty. <br><br>If both are defined, or only --label is defined, both th=
e filesystem label and the GPT partition label are set to the value of --la=
bel.<br><br><br>As it makes sense to have a GPT partition label which is di=
fferent from the contained filesystem label, our proposal is to fix the cas=
e when both are set, and keep the current behavior when only --label is set=
 for compatibility reasons.<br><br>If this proposal is ok, we will patch th=
e documentation to document that the GPT partition label is set even when o=
nly --label is defined.<br><br>Regards</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 22, 2023 at 4:54=E2=80=AF=
PM &lt;<a href=3D"mailto:dit.kozmaj@kynetics.com">dit.kozmaj@kynetics.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Dit Kozmaj &lt;<a href=3D"mailto:dit.kozmaj@kynetics.com" target=3D"_bl=
ank">dit.kozmaj@kynetics.com</a>&gt;<br>
<br>
So far part.label has been used to define GPT partition label even if<br>
part.part_name was defined.<br>
Fix the code to use part.part_name whenever available, as it makes sense<br=
>
to have a GPT partition label which is different from the contained<br>
filesystem label.<br>
<br>
Signed-off-by: Dit Kozmaj &lt;<a href=3D"mailto:dit.kozmaj@kynetics.com" ta=
rget=3D"_blank">dit.kozmaj@kynetics.com</a>&gt;<br>
Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.rondini@kynetics.c=
om" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/plugins/imager/direct.py | 14 ++++----------<br>
=C2=A01 file changed, 4 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py<br>
index dfaa901567..1f06b89f8e 100644<br>
--- a/scripts/lib/wic/plugins/imager/direct.py<br>
+++ b/scripts/lib/wic/plugins/imager/direct.py<br>
@@ -571,11 +571,12 @@ class PartitionedImage():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._create_partition(self=
.path, part.type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parted_fs_type, part.s=
tart, part.size_sec)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.part_name:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.part_name or part.label:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partition_label =
=3D part.part_name if part.part_name else part.label<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(=
&quot;partition %d: set name to %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.num, part.part_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.num, partition_label)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_native_c=
md(&quot;sgdisk --change-name=3D%d:%s %s&quot; % \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(p=
art.num, part.part_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(p=
art.num, partition_label,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0self.path), self.native_sysroot)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if part.part_type:<br>
@@ -592,13 +593,6 @@ class PartitionedImage():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(part.num, part.uuid, self.pat=
h),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.native_sysroot)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.label and self.ptable_fo=
rmat =3D=3D &quot;gpt&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot=
;partition %d: set name to %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.num, part.label)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(&q=
uot;parted -s %s name %d %s&quot; % \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (self.path, part.num, part.label),<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.native_sysroot)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if part.active:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flag_name =3D=
 &quot;legacy_boot&quot; if self.ptable_format =3D=3D &#39;gpt&#39; else &q=
uot;boot&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(=
&quot;Set &#39;%s&#39; flag for partition &#39;%s&#39; on disk &#39;%s&#39;=
&quot;,<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000768a3b05f77fa26b--

