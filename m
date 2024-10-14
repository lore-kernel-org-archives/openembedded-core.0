Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F05D16271
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:54:46 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.55665.1728914082603086304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 06:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=LearCxp4;
 spf=pass (domain: snapchat.com, ip: 209.85.167.41, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539fb49c64aso932644e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1728914081; x=1729518881; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=abKDVMNk5vTd0/OaaJmOGPGVZO5xIDf5Oz/z4k+Bh74=;
        b=LearCxp4EOaVyW2VN8Bk6bRc5EdHepDoA3QkYGPh5rPyuc2WnI5yumqwF6Mqu0++35
         LKWgH6GAN5kAm66yFjAP8rjkX6+n4EGmUbwLVCXQS0Ylt1cMPEo/Kb32wQS9e6IMLqde
         o/nawt/9ay31R7/+DntSMx/llb5Z+dum/IxBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728914081; x=1729518881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abKDVMNk5vTd0/OaaJmOGPGVZO5xIDf5Oz/z4k+Bh74=;
        b=aLluJzLqXRrkWopQLPK4HMt8mfF1jUsudntyVxTBKtCaq1w6krjgWXhzFMbh/gimzz
         bqcjmCLp1gL0Pxx/JB+i2+/qgYY+1WU2s6XLoI2/byRqY/gonlrXePsnaR71C64+3FLI
         rkEFn/60csLxWziwvnRVd2Yh1YnHk8R5xuqUCM6oTd0N487EVirWMvXSXnD0/Pt0fui1
         FYbLiDdVxMkfLPakAx6gjGy5WPRfg+VmNJGDMYeojIfxJJXJXbEkba1Z9ULI0w05r28g
         r2Y9ytDiL//7rwGCXeNMl2+a549mJqEwpbHqEAyzzWHeFLqwaPEJQqvV3fNNxbsNA6kX
         kt3Q==
X-Gm-Message-State: AOJu0Yxf7ObQgd4A/lii81yb/wD4AkJ9Ro+l7akX6ZCIXUO/mJsJE+NY
	5dC1aPXB/5XK1nET6PR4jX2e0NIiMtMH2R3DLdRilKbajztthrcGiG/VpjqXPu6R92c81pFh1i0
	HUE2YqG8AR9UB48H3SVWsnlFRtK27sn4hKZAbgg==
X-Google-Smtp-Source: AGHT+IEANyLxK4oOEEBsfNKs9trsTHRIT6q9Eq0uCBc8Fb/DpFQR/cnR+zBRNI6bXzZQDjNppmhXoXt9GXMUZ8LdSME=
X-Received: by 2002:a05:6512:3083:b0:536:53e3:feae with SMTP id
 2adb3069b0e04-539e54d7737mr4285522e87.11.1728914080500; Mon, 14 Oct 2024
 06:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241014091117.2953622-2-ecordonnier@snap.com>
 <17FE4CD5265CA76E.4702@lists.openembedded.org> <CANNYZj8nd+27=qXYNpsrcZm-5C2RqaTt=cdAoV4tci=tW9PkaQ@mail.gmail.com>
In-Reply-To: <CANNYZj8nd+27=qXYNpsrcZm-5C2RqaTt=cdAoV4tci=tW9PkaQ@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 14 Oct 2024 15:54:29 +0200
Message-ID: <CAHUKmYYcf3a3SRhwfsh3ay0jvT8CQ_Oet4YiX_KJY2KhbN6MSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] makedumpfile: import 1.7.5 from meta-openembedded
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009e087b0624702db3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 13:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205778

--0000000000009e087b0624702db3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Alexander Kanavin <alex.kanavin@gmail.com> :
- kexec has been in poky for ages, and then in December 2015 the commit you
mentioned added a hard dependency to makedumpfile in the kdump script, but
did not create a recipe for makedumpfile (which did not have a recipe at
that point).
- A makedumpfile recipe was added in July 2016 to meta-openembedded

Without makedumpfile, the script is quite useless. After a kernel panic,
the device reboots to the capture kernel, the kdump script fails, the
device reboots to the normal kernel, and /proc/vmcore is not available
after the reboot.

=C3=89tienne

On Mon, Oct 14, 2024 at 1:21=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Mon, 14 Oct 2024 at 13:03, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > How was this added in the first place without bringing in this required
> dependency?
>
> It was there from the start:
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_poky_commit_-3Fh-3Dmaster-2Dnext-26id-3Da444eb5951112a4900665677b3bff323=
a8828e3f&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhk=
bNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D-GKFH-1LTTm97Sf5LaewiisHB28UDn=
40IHPACIZv8Urz1wvHWxzNq4f_v9xQTv_Z&s=3DvkBlYgnxz79yc9tJfWsFBn_Mm4sgtp7EUAbT=
g-BH53c&e=3D
>
> Alex
>

--0000000000009e087b0624702db3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-1" href=
=3D"mailto:alex.kanavin@gmail.com" tabindex=3D"-1">@Alexander Kanavin</a>=
=C2=A0: <br>- kexec has been in poky for ages, and then in December 2015 th=
e commit you mentioned added a hard dependency to makedumpfile in the kdump=
 script, but did not create a recipe for makedumpfile (which did not have a=
 recipe at that point).<br>- A makedumpfile recipe was added in July 2016 t=
o meta-openembedded<br><br>Without makedumpfile, the script is quite useles=
s. After a kernel panic, the device reboots to the capture kernel, the kdum=
p script fails, the device reboots to the normal kernel, and /proc/vmcore i=
s not available after the reboot.<br><br>=C3=89tienne</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 14, 2024=
 at 1:21=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, 14 Oct 2024 at 13:03, Alexander Ka=
navin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; How was this added in the first place without bringing in this require=
d dependency?<br>
<br>
It was there from the start:<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yocto=
project.org_poky_commit_-3Fh-3Dmaster-2Dnext-26id-3Da444eb5951112a490066567=
7b3bff323a8828e3f&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D-GKFH=
-1LTTm97Sf5LaewiisHB28UDn40IHPACIZv8Urz1wvHWxzNq4f_v9xQTv_Z&amp;s=3DvkBlYgn=
xz79yc9tJfWsFBn_Mm4sgtp7EUAbTg-BH53c&amp;e=3D" rel=3D"noreferrer" target=3D=
"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctopr=
oject.org_poky_commit_-3Fh-3Dmaster-2Dnext-26id-3Da444eb5951112a4900665677b=
3bff323a8828e3f&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2e=
pckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D-GKFH-1=
LTTm97Sf5LaewiisHB28UDn40IHPACIZv8Urz1wvHWxzNq4f_v9xQTv_Z&amp;s=3DvkBlYgnxz=
79yc9tJfWsFBn_Mm4sgtp7EUAbTg-BH53c&amp;e=3D</a> <br>
<br>
Alex<br>
</blockquote></div>

--0000000000009e087b0624702db3--

