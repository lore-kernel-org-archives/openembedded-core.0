Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00E7C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 19:06:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.1955.1642446405140095201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 11:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e7tq4PJP;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so552695wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 11:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A9rxjWDRpEXp1ZKqkbGEKr+3lQO+PcmmVYrKvTScTqs=;
        b=e7tq4PJP3clsoXU1C7W6k6U/tszeA9INNrcnxOSYDbNGipevfrCcbD7MFTZA0aQH/H
         CjOFX/BlmCSga5EOzZqoAiJxmjrtweT0iXAX+pMYYvfNuizJDmGd5kb7CsPWri9Wq8M6
         Cuy2WfYmx0mD3nDh/Dcz+jPauVkRqcVQ0bCaRs6aVYO1g7faOFKqb4hoXYEUYTogRS89
         t1Of8wicV6aDiCZk1Y6z2g49cbW8uJv7bNMH2YrcM51kLQFydeiXALuJqVmzSDFUzqD/
         /WsoZcXgIxmizfyVbNoJs+BLJXtRne2BmQMsCONvRSfGiILkAZnF0LxUYbCl8bE/Gcpj
         f5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A9rxjWDRpEXp1ZKqkbGEKr+3lQO+PcmmVYrKvTScTqs=;
        b=icJkmNWyIFITDXj3Q/26165+gvsaxNZmqECQLQ4oJxM4N2sb2fGvOBkbsXM2cjMuaj
         vOaJVS5Od4UzMdRwpYtN8a11ymJRfDU7x3PWR7d7xIWhDV2dLqdTje2ig2ol+A1Pp3OP
         W1upm5dohnud+/Y2F79YLrFeCAAuuELkVYA6DN7ISSgunZRCIaInS/AR7B8xFdriU7rN
         CWbqeBPdecKjEIXmBQ35dg0ICQM012iGOzxk4hQTH/QFxACayjlwqWEKfQ8A/SI/NECx
         cwYAPWB7byOOUh1asg5y2vQIVbMRh06wL2NQ5ETU06UMnebVNCyD2r7VUjTu7E+ZFRpS
         X7ow==
X-Gm-Message-State: AOAM533ENTxZZ5TCwg/gJjKGllt1uChNa7Lt5h+8ivTDerumXUcTShR1
	8Ra5H/TJSVPP1tAtQrnwDciAPMiZGYShDI7UbxA=
X-Google-Smtp-Source: 
 ABdhPJzg2bhq3sczOu2hxYeHLoEzCJJtG4YN3Zsg8wc3zC5ENJ0A/+Etgdp2dcXAip1ea8yLCcLK0cpgpMnssaaVfYQ=
X-Received: by 2002:a7b:cb88:: with SMTP id m8mr19216230wmi.64.1642446403602;
 Mon, 17 Jan 2022 11:06:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641787452.git.anuj.mittal@intel.com>
 <9c839db1144a8a96f8b848e3e1aad2fd93859abd.1641787452.git.anuj.mittal@intel.com>
 <16C8DD2C638E8912.22838@lists.openembedded.org>
In-Reply-To: <16C8DD2C638E8912.22838@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 17 Jan 2022 20:06:32 +0100
Message-ID: 
 <CAApg2=R9xBb9Z4z2CkCgmYL4TBUdvfzLAb4FMGJW9Lva6ZQC+Q@mail.gmail.com>
Subject: Re: [OE-core] [honister][PATCH 04/10] grub2: fix CVE-2021-3981
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000730e6205d5cbdab9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 19:06:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160656

--000000000000730e6205d5cbdab9
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 10:01 AM Marta Rybczynska via lists.openembedded.org
<rybczynska=gmail.com@lists.openembedded.org> wrote:

>
> diff --git a/meta/recipes-bsp/grub/grub2.inc
>> b/meta/recipes-bsp/grub/grub2.inc
>> index bb791347dc..a72a562c5a 100644
>> --- a/meta/recipes-bsp/grub/grub2.inc
>> +++ b/meta/recipes-bsp/grub/grub2.inc
>> @@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>>             file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
>>             file://determinism.patch \
>>             file://0001-RISC-V-Restore-the-typcast-to-long.patch \
>> +
>>  file://CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch \
>>  "
>>
>>  SRC_URI[sha256sum] =
>> "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
>>
>>
> This one should go to dunfell too. If the original poster would like to
> backport,
> that would be nice, otherwise it is on my list.
>

This issue does not apply in dunfell, as the change introducing the problem
is post-2.04.
No need to backport.

Marta

--000000000000730e6205d5cbdab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 10, 2022 at 10:01 AM Mart=
a Rybczynska via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc<br>
index bb791347dc..a72a562c5a 100644<br>
--- a/meta/recipes-bsp/grub/grub2.inc<br>
+++ b/meta/recipes-bsp/grub/grub2.inc<br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/grub/grub-${PV}.tar.gz \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-grub.d-10_linux.in-ad=
d-oe-s-kernel-name.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://determinism.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-RISC-V-Restore-the-ty=
pcast-to-long.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-3981-grub-mkconfi=
g-Restore-umask-for-the-grub.cfg.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;23b64b4c741569f9426ed2e3d0e6780796fca081=
bee4c99f62aa3f53ae803f5f&quot;<br><br></blockquote><div><br></div><div>This=
 one should go to dunfell too. If the original poster would like to backpor=
t,</div><div>that would be nice, otherwise it is on my list.</div></div></d=
iv></blockquote><div><br></div><div>This issue does not apply in dunfell, a=
s the change introducing the problem is post-2.04.</div><div>No need to bac=
kport.</div><div><br></div><div>Marta<br></div><div>=C2=A0</div></div></div=
>

--000000000000730e6205d5cbdab9--

