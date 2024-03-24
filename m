Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5512C54E58
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 14:11:15 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.29986.1711289473429140790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Mar 2024 07:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gb5JTwhW;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d24a727f78so40287551fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Mar 2024 07:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711289471; x=1711894271; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WFNzHQRwqWldfHeMWjsdSVMTSoNof6xIbW//yvE5kVU=;
        b=Gb5JTwhW7R3KuBNfhw3BhjMpltgtO6iigmZSR++fxuYgaDC8olwFZUc5oHSRlqMpoQ
         luCcu45zRPPd3ylE404KZI9fy5Coxr0CSBehrtAQkOmkZt1fU54Go3oKnl7O6yNQ5aJh
         7iY0PO3pOuV6cQFng3x3ia9MV39PaO0A+AAryqTBrOk49lhSK7olaP44bSBEFjL6r2iI
         cbdpnS6tdraW8FCBXSvv8EdWJiYq7rxLJ+fyW8vgGa+cHjBERaWn+EHzkzk8apKE8I50
         1+NS+9vRlQ0RrB21/BuJzZNoGqpxtiEAYvc+enL4VhXAtCpaJ7jSZUc3ua4Ucqw5gvld
         20vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711289471; x=1711894271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFNzHQRwqWldfHeMWjsdSVMTSoNof6xIbW//yvE5kVU=;
        b=f84yhWM1AGHQHzp714ip+26slbrK6KskeOjYMXfIXsogDY/IQcrJiNanAB4EEj49A1
         MPpsCVdwqwImzgDoGEIdJ7bjgTdIZ1xdmx/nwIweA5QLckwDO3SVX9++BV/P1kf62RSL
         YykYFIZ51silwgda4Sap8+HQ4nqAzqgnDUvQNt5E+0LCBHvSMtfGycv3uWvp1nmz0NNe
         lT7GG81Mi7mDsNnJB3J4rC6s+LkPXuEW3bfhl1B7aNG2wcI+c7L9DM4UT6CTGa1rnPNq
         3l9bxwIKyWW5ypMJ4X98KSREcB32pNo8v6EGiLqLXeIytJg4zzYrxtraynbxIdY/tK2+
         e6rQ==
X-Gm-Message-State: AOJu0YyDYBjLuAlcRQ4Kso55U18rokfFLXQL7+Ccuf+7D4zfxRrLKMpl
	yz8E9SniUWYxW+WGs4RzpfY108bXbpujRDtdnZ2MsR0zS4cMNCe3g0dyFF6cDmUeoFQbo2a3+dW
	JKnQJHe8TAnsyDrx/nZqit5i9vu0=
X-Google-Smtp-Source: AGHT+IGNVurg/JiCOFc3zs2dcD1rsv86qIPDKeST/NbIoPPjRIPjy8kF/fJVdmqi+PWcNhN57y2USLmbBtoDAes8TPs=
X-Received: by 2002:a2e:9dc9:0:b0:2d6:957e:10a9 with SMTP id
 x9-20020a2e9dc9000000b002d6957e10a9mr2637039ljj.16.1711289471178; Sun, 24 Mar
 2024 07:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240324111853.237AD1068FC@builder.sakoman.com>
In-Reply-To: <20240324111853.237AD1068FC@builder.sakoman.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Mar 2024 15:11:00 +0100
Message-ID: <CANNYZj_4S4KWy0YMdQuvnjEX5rMXO+rGyUemMDWQgw1z4+1OyA@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Mar
 2024 01:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000009a596061468a196"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Mar 2024 14:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197476

--00000000000009a596061468a196
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m getting slightly concerned, no new CVEs second week in a row? D=
id the
checker break?

Alex

On Sun 24. Mar 2024 at 12.18, Steve Sakoman <steve@sakoman.com> wrote:

> Branch: master
>
> New this week: 0 CVEs
>
> Removed this week: 0 CVEs
>
> Full list:  Found 37 unpatched CVEs
> CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3219 *
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096 *
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-46456 *
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42363 *
> CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42364 *
> CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42365 *
> CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42366 *
> CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51767 *
> CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238 *
> CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240 *
> CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6270 *
> CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6356 *
> CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6535 *
> CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6536 *
> CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7042 *
> CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7216 *
> CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0841 *
> CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-21803 *
> CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23307 *
> CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23848 *
> CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24857 *
> CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24858 *
> CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24859 *
> CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24861 *
> CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24864 *
> CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25739 *
> CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25740 *
>
> Summary of CVE counts by recipe:
>   linux-yocto: 28
>   busybox: 4
>   cpio: 1
>   gnupg:gnupg-native: 1
>   nasm:nasm-native: 1
>   openssh: 1
>   qemu:qemu-native:qemu-system-native: 1
>
> For further information see:
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1109):
> https://lists.yoctoproject.org/g/yocto-security/message/1109
> Mute This Topic: https://lists.yoctoproject.org/mt/105117571/1686489
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000009a596061468a196
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99m getting slightly concerned, no new CVEs secon=
d week in a row? Did the checker break?</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun 24. Mar 2024 at 12.18, Steve Sakoman &lt;<a=
 href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color=
:rgb(204,204,204)">Branch: master<br>
<br>
New this week: 0 CVEs<br>
<br>
Removed this week: 0 CVEs<br>
<br>
Full list:=C2=A0 Found 37 unpatched CVEs<br>
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2019-14899" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-148=
99</a> *<br>
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-371=
4</a> *<br>
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2021-3864" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864</=
a> *<br>
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-0400" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400</=
a> *<br>
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-1247" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247</=
a> *<br>
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native <a href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3219" rel=3D"noreferrer" tar=
get=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-=
3219</a> *<br>
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096" rel=3D"noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38=
096</a> *<br>
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-454=
3</a> *<br>
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native <a href=3D"https://web=
.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-46456" rel=3D"noreferrer" =
target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-20=
22-46456</a> *<br>
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2023-1386</a> *<br>
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-339=
7</a> *<br>
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-3640" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640</=
a> *<br>
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-401=
0</a> *<br>
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox <a href=3D"https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-42363" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42363<=
/a> *<br>
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox <a href=3D"https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-42364" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42364<=
/a> *<br>
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox <a href=3D"https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-42365" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42365<=
/a> *<br>
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox <a href=3D"https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-42366" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42366<=
/a> *<br>
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh <a href=3D"https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2023-51767" rel=3D"noreferrer" target=3D"_=
blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51767</a=
> *<br>
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-623=
8</a> *<br>
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-624=
0</a> *<br>
CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-6270" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6270</=
a> *<br>
CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-6356" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6356</=
a> *<br>
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-6535" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6535</=
a> *<br>
CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2023-6536" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6536</=
a> *<br>
CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-7042" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-704=
2</a> *<br>
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio <a href=3D"https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-7216" rel=3D"noreferrer" target=3D"_bla=
nk">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7216</a> *<=
br>
CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2024-0841" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0841</=
a> *<br>
CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2024-21803" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-218=
03</a> *<br>
CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2024-23307" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-233=
07</a> *<br>
CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23848" rel=3D"noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23=
848</a> *<br>
CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24857" rel=3D"noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24=
857</a> *<br>
CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24858" rel=3D"noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24=
858</a> *<br>
CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24859" rel=3D"noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24=
859</a> *<br>
CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24861" rel=3D"noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24=
861</a> *<br>
CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24864" rel=3D"noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24=
864</a> *<br>
CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25739" rel=3D"noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25=
739</a> *<br>
CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25740" rel=3D"noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25=
740</a> *<br>
<br>
Summary of CVE counts by recipe:<br>
=C2=A0 linux-yocto: 28<br>
=C2=A0 busybox: 4<br>
=C2=A0 cpio: 1<br>
=C2=A0 gnupg:gnupg-native: 1<br>
=C2=A0 nasm:nasm-native: 1<br>
=C2=A0 openssh: 1<br>
=C2=A0 qemu:qemu-native:qemu-system-native: 1<br>
<br>
For further information see: <a href=3D"https://autobuilder.yocto.io/pub/no=
n-release/patchmetrics/" rel=3D"noreferrer" target=3D"_blank">https://autob=
uilder.yocto.io/pub/non-release/patchmetrics/</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#1109): <a href=3D"https://lists.yoctoproject.org/g/yoct=
o-security/message/1109" rel=3D"noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/yocto-security/message/1109</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105117571/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105117571/1686489</a><br>
Group Owner: <a href=3D"mailto:yocto-security%2Bowner@lists.yoctoproject.or=
g" target=3D"_blank">yocto-security+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto-security/uns=
ub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/y=
octo-security/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000009a596061468a196--

