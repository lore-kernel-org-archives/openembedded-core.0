Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B1DC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 10:12:17 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.22809.1659348729081182307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 03:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BNRPi+Co;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id m16so7967999qka.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3bDzITgk2BzJN/8sYeaM+JRMIytFCZXPZ4rtAm+ddNE=;
        b=BNRPi+ConkVIyy7+q0eykqcTutB9VEqFowiKuDGKP+V1s/3o1F0V7vNMmUA7Pc1Eso
         KP+Gw7qCfu7Z2vQqsp2Wuov8W2A1B4B0BcSARuIopFvL1dXaw2SNduE0QzfPASbgv1pl
         MbxNblwa92+tHgQK1uf6f48j8m+2oxuAgIXRfLmfs5Idyi3YQPe8N1VT8AiyWeFuRtyR
         ymQiotDkX7SX4o9TkAXCk0wV064hQJ8UyFM5E+gok6SToWC4oBFwN5DGRzUojIH2f4kE
         Y2iKsGgIsHK8fjJ410fq3m6j+0ZC88/AeCq515jDLphnrhGo/Nud7B50yhKhnSaCrNnq
         Zo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3bDzITgk2BzJN/8sYeaM+JRMIytFCZXPZ4rtAm+ddNE=;
        b=wbE54IhzFV7Fusgl1FSsFx8ciZLnqsU26H6zhLQ28PodS8+v9JMfOYqKrofcw1NYNx
         nePDUuOFm3jPOczMOrYoG692X2f1mUpwVDm9B0wDret6eZLJNCxVBJcD9iMRXqN0/uR6
         /prIzudntZi5UQtEmfsxMEsQMbawbtQScQOKyx0DXyRgM3pQAZC9m7goly26BskNHCJq
         icvGhw0cnMZ/3A3x+kszaYgOnnqrX3Go0t1A95iuMRbNJDSb49zZN/6ID4X359vQQMm5
         CdENf+LUu/L252BD7ztqgjZv6yHT8Nw6rvssaEyNNWlMyMkzHap3HJrAxPiNeovUyLZE
         KY2Q==
X-Gm-Message-State: AJIora8CHV82C8gUNUrA7tqcAmvBvmBa6Y1jYR45+1cWxy+gLg82sa3B
	kUDqw/pevlsN817yftyPIdoBSscm33ZyXWDXruE=
X-Google-Smtp-Source: 
 AGRyM1vxvscdGzIDpErstxd0wCdIu5lFvTu9YTx+YDOWlCqm1X8VDuJCAFQYPrK3kEMXopkirfyqiInArPOfiUwp+zM=
X-Received: by 2002:a05:620a:17a3:b0:6b5:fc1e:40e1 with SMTP id
 ay35-20020a05620a17a300b006b5fc1e40e1mr11020385qkb.227.1659348728048; Mon, 01
 Aug 2022 03:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220801022446.12464-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220801022446.12464-1-sundeep.kokkonda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Aug 2022 06:11:20 -0400
Message-ID: 
 <CAMKF1sqUOiZSP0+NV9LOZ+B4v6tZ_qKmA81XrKTsKqYRtcskig@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] binutils: stable 2.38 branch updates
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org, pgowda.cve@gmail.com,
	rwmacleod@gmail.com, shivams@gmail.com, umesh.kalappa0@gmail.com
Content-Type: multipart/alternative; boundary="0000000000007e71a505e52b3b87"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 10:12:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168745

--0000000000007e71a505e52b3b87
Content-Type: text/plain; charset="UTF-8"

Looks ok to me

On Mon, Aug 1, 2022 at 3:25 AM Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
wrote:

> Below commits on Binutils-2.38 development branch are updated.
> 5c0b4ee4060 i386: Don't allow GOTOFF relocation against IFUNC symbol for
> PIC
> 19892fedb7b x86: Properly check invalid relocation against protected symbol
> b8a2baa80b1 libctf: tests: prune warnings from compiler output
> 7f9a495a167 libctf: fix linking together multiple objects derived from the
> same source
> 97dd8079feb PowerPC64: fix assertion in ppc_build_one_stub with -Os code
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc
> b/meta/recipes-devtools/binutils/binutils-2.38.inc
> index 742ca86379..eed252976a 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>
> -SRCREV ?= "eed56ee299b9ef8754bb4e53f2e9cf2a7c28c04d"
> +SRCREV ?= "5c0b4ee406035917d0e50aa138194fab57ae6bf8"
>  BINUTILS_GIT_URI ?= "git://
> sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git
> <http://sourceware.org/git/binutils-gdb.git;branch=$%7BSRCBRANCH%7D;protocol=git>
> "
>  SRC_URI = "\
>       ${BINUTILS_GIT_URI} \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168690):
> https://lists.openembedded.org/g/openembedded-core/message/168690
> Mute This Topic: https://lists.openembedded.org/mt/92739561/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007e71a505e52b3b87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Looks ok to me=C2=A0</div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 1, 2022 at 3:25 AM S=
undeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda@gmail.com">sundeep.k=
okkonda@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Be=
low commits on Binutils-2.38 development branch are updated.<br>
5c0b4ee4060 i386: Don&#39;t allow GOTOFF relocation against IFUNC symbol fo=
r PIC<br>
19892fedb7b x86: Properly check invalid relocation against protected symbol=
<br>
b8a2baa80b1 libctf: tests: prune warnings from compiler output<br>
7f9a495a167 libctf: fix linking together multiple objects derived from the =
same source<br>
97dd8079feb PowerPC64: fix assertion in ppc_build_one_stub with -Os code<br=
>
<br>
Signed-off-by: Sundeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda@gmai=
l.com" target=3D"_blank">sundeep.kokkonda@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipe=
s-devtools/binutils/binutils-2.38.inc<br>
index 742ca86379..eed252976a 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc<br>
@@ -18,7 +18,7 @@ SRCBRANCH ?=3D &quot;binutils-2_38-branch&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt;pver&gt;\d+_(\d_=
?)*)&quot;<br>
<br>
-SRCREV ?=3D &quot;eed56ee299b9ef8754bb4e53f2e9cf2a7c28c04d&quot;<br>
+SRCREV ?=3D &quot;5c0b4ee406035917d0e50aa138194fab57ae6bf8&quot;<br>
=C2=A0BINUTILS_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/gi=
t/binutils-gdb.git;branch=3D$%7BSRCBRANCH%7D;protocol=3Dgit" rel=3D"norefer=
rer" target=3D"_blank">sourceware.org/git/binutils-gdb.git;branch=3D${SRCBR=
ANCH};protocol=3Dgit</a>&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 ${BINUTILS_GIT_URI} \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168690): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168690" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168690</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92739561/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92739561/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007e71a505e52b3b87--

