Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A600C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 10:20:02 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web11.50683.1681726792131621184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 03:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dX3jsF7h;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id a9so22967508vsh.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681726791; x=1684318791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ccPlasz4lS1QDWdM39DEH16MMKS87nSE0TLfTTqB5PQ=;
        b=dX3jsF7hcfM3ArshxqqQlzXge6KcAtIry+pKvWknpNUzDPAw4FxNi+fqO1zFUZ+uDk
         +pq+dJiuP+an+ORU+bqnvGOw43/CDtkm97hP50xvnXUI6lh1IlaNIh8ntiCtCkYyjK3t
         PVl2i1b17At6FbbqAAFU1nXmTVFXZgUJ6j632vIsbvLb9D8ILio62Rq2RoNy9vDxXaR2
         QJ+ROnQXuiSGxMloa4dw8ubtWTymtjuQ/Ft6w0A74AVf3BkcoG/gu+aEGXePdPryVLGF
         eMMPLpuASlTi6rXcQ33Gvd35EibuOeCWHunmsSwpuDjlxsOrpP18xMbWlXU9YX4vnCGf
         guEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681726791; x=1684318791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccPlasz4lS1QDWdM39DEH16MMKS87nSE0TLfTTqB5PQ=;
        b=AXeNwoYBIyV4RUYfMzSeKKcM5JRXrJ5W9a/eW4PRHrfvAZdr1mCb/GTKkogT1oFTrv
         B8/9FvCRKa5ncyaCRnqWuD3+q7Dti+J/BCTDn5zpFdvdB5Re2afp0ylqxPaoyqiI2ylx
         41YBXjVp6aGkgoiek2gnr8FBbYGiOrtHvl0UOfisGKU/Hctua3CsyD+bFgNIjgpH+aij
         Q0XhQLgB3yd3WTGS2hWKuMmfzJzdS/lYdbQTSxT68P1mjYkI/jzH3ryFKgUsX80nsBsi
         V/CIUgEyC0fHA3hyw7vyODBgR7WyGFtn5LjRVgZzZn8pAOkFQweO8KnjOP4h7a9YtDmH
         84+w==
X-Gm-Message-State: AAQBX9eJmTlAZoKEdMGqJOnHlJYm4F/fViD070R0mKOd7XH5fqcGNaGC
	nBOqtwWwP/vuJclDarVHU45c9mS20G4c4cDgTo4=
X-Google-Smtp-Source: AKy350bZeTv4/OcS5Yos7eaIbVpClPDIVH54nzwthYuNbb8Z18U+CaBVV6tEOXmT4YjKdVQfYpfkD32laqosdJ6v9vI=
X-Received: by 2002:a05:6102:440e:b0:42e:154b:3ca7 with SMTP id
 df14-20020a056102440e00b0042e154b3ca7mr10336989vsb.3.1681726791001; Mon, 17
 Apr 2023 03:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
In-Reply-To: <20230416103052.28268-1-christoph.lauer@email.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 17 Apr 2023 11:19:40 +0100
Message-ID: <CANPvuRm3KYY4GbKJ6c37fO0-J=JN_1dxsqcGSQLoS+xjR9DxTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Christoph Lauer <christoph.lauer@email.de>
Cc: openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: multipart/alternative; boundary="000000000000fcac0a05f98587da"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 10:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180157

--000000000000fcac0a05f98587da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

This patch is also applicable on kirstone so it can be backported.
I use in my distro RM_WORK_EXCLUDE +=3D "make-mod-scripts" but your fix loo=
ks
better.
Thanks.

Jose

Christoph Lauer <christoph.lauer@email.de> escreveu no dia domingo,
16/04/2023 =C3=A0(s) 11:31:

> From: Christoph Lauer <christoph.lauer@xtronic.de>
>
> With rm_work active, external module signing throws an error:
> scripts/sign-file: error while loading shared libraries: libcrypto.so.3:
> cannot open shared object file: No such file or directory
> Preserve libraries that sign-file script needs during runtime.
>
> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> ---
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 28e0807d1d..0e24efc597 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -32,3 +32,6 @@ do_configure() {
>                 -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $=
t
>         done
>  }
> +
> +# keep native libraries required for module signing
> +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180113):
> https://lists.openembedded.org/g/openembedded-core/message/180113
> Mute This Topic: https://lists.openembedded.org/mt/98296212/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fcac0a05f98587da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Christoph,<br><br>This patch is also applicable on=
 kirstone so it can be backported.<br>I use in my distro=C2=A0RM_WORK_EXCLU=
DE +=3D &quot;make-mod-scripts&quot; but your fix looks better.<br>Thanks.<=
br><br>Jose</div><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Christoph Lauer &lt;<a href=3D"mailto:christoph.lauer=
@email.de">christoph.lauer@email.de</a>&gt; escreveu no dia domingo, 16/04/=
2023 =C3=A0(s) 11:31:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Christoph Lauer &lt;<a href=3D"mailto:christoph.lauer@xtronic.d=
e" target=3D"_blank">christoph.lauer@xtronic.de</a>&gt;<br>
<br>
With rm_work active, external module signing throws an error:<br>
scripts/sign-file: error while loading shared libraries: libcrypto.so.3: ca=
nnot open shared object file: No such file or directory<br>
Preserve libraries that sign-file script needs during runtime.<br>
<br>
Signed-off-by: Christoph Lauer &lt;<a href=3D"mailto:christoph.lauer@xtroni=
c.de" target=3D"_blank">christoph.lauer@xtronic.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scrip=
ts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a>=
 | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mo=
d-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0=
.bb</a> b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-s=
cripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb=
</a><br>
index 28e0807d1d..0e24efc597 100644<br>
--- a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scrip=
ts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a>=
<br>
+++ b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scrip=
ts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a>=
<br>
@@ -32,3 +32,6 @@ do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -C ${STAGING_KERNEL=
_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
+<br>
+# keep native libraries required for module signing<br>
+RM_WORK_EXCLUDE_ITEMS +=3D &quot;recipe-sysroot-native&quot;<br>
--<br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180113): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180113" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180113</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98296212/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98296212/5052612</a><br>
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

--000000000000fcac0a05f98587da--

