Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE2DC88CB6
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 15:35:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.62693.1686584145422214041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 08:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PWGydqwX;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30fbcfdc7b6so993731f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686584144; x=1689176144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WvESK053iHeMEE6OpdHBiCiJSyvgNFJYqoPEs5DjEFU=;
        b=PWGydqwXbYvTJsym+qxOwrCd1SFFlSue9bgQ3j8TG0dA02XE4c2f8TzB4Mo2oilxY8
         9jpozvFmYnmZRyT+cIYj57AzT3iwNvk7rdFghWTsuk34wST8y5AVVrcdFeC03SBhFfaB
         ldFDT/QlJmeaGPxTtIWrWfVKrph+N4N6ZWP5mk8Y1ntmojEckNxPk4c9RXLKTkuxqaSq
         vN8hY1DVzUGUA/MlChSs83LOn3zCpgL/xC2x4Cj/sbaWzYQ/Nk2hcS9dWkeJ3WynPqxk
         vUBzjzx1y5vuifIgkscU4SSUn+0TOvyQJFVZ5h0IV5V0FJtDOTciKSrYy6UZ9qGSowPq
         u/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686584144; x=1689176144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvESK053iHeMEE6OpdHBiCiJSyvgNFJYqoPEs5DjEFU=;
        b=jmPD1RMlWPrwBrBeMAx2DxKIAFIUbsmv35ThwuUdPRG1WqPr3P4K8wWNH3Lh8uMFJ4
         Qbn2JSgZxl03+mRlEOxLwFy3OPcOTAhqx1Hbr4x648L7uuQj3s4z736nYPgK9tRpVJcI
         N+n7TJqqIvW/+cfbxmn5Pypk2Adr+bZY2c8OLJ/XqMoYiEa1RmGVoShL9jPWuilXX6a2
         Te3VNAAjkr4eIO3/Wdr3w6aUVuZ8ycqS67pFbAR+aU+KszVEE5J9wSDnPQ7K8ULVsrwf
         bGfkkmfBRIgV3Q2K5KvynW349pA0Csy0GHFopXVUI/AAdiaLmMQmGMbQzkskZmwDFYfF
         kMlg==
X-Gm-Message-State: AC+VfDxzN0OdYoyNBLGzx2ODzSKLOGISEk5IsgEgdVQtrq4/rVn539dt
	UK9wytJa97lXClxvwtXJVWvaRdO8UQm+822mo/I=
X-Google-Smtp-Source: ACHHUZ7HgDW7i14mUzM1niQ8mTYbmJ/C+695MLPEwnBNLnRs7kOGzoVeMmCQ2xL+58YzV39FzPjSt02XEAPNtMN7QEU=
X-Received: by 2002:adf:ea41:0:b0:30f:b989:b80f with SMTP id
 j1-20020adfea41000000b0030fb989b80fmr4256096wrn.39.1686584143286; Mon, 12 Jun
 2023 08:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230525102218.1613298-1-Martin.Jansa@gmail.com>
 <20230526180939464ac2f2@mail.local> <1762E887A919FB5A.6918@lists.openembedded.org>
In-Reply-To: <1762E887A919FB5A.6918@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Jun 2023 17:35:30 +0200
Message-ID: <CA+chaQdAaZ9mc_jfvL+5VJkGoybs0FrhVuTpGS9dRu2hxikCmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] image-artifact-names: include
 ${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and ${IMAGE_LINK_NAME}
To: Martin.Jansa@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000be956505fdf078af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 15:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182675

--000000000000be956505fdf078af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 7:21=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> On Fri, May 26, 2023 at 8:09=E2=80=AFPM Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
>
>> Hello,
>>
>> The series causes oe-selftest failures:
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5254/s=
teps/14/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1468/=
steps/14/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5225/s=
teps/14/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5175/s=
teps/14/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5217/s=
teps/14/logs/stdio
>
>
> Hi,
>
> I was able to reproduce it locally and it's caused by newer test (which
> wasn't merged yet last time I've run selftest with these changes):
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D06af6795cf6f0=
79362303bddb39a14459e228e72
> which hardcodes the expected image name, I'll send fix for this shortly.
>

Hi, I see that the selftest fix was already merged to master and this
change was in abelloni/master-next-success for a while, but now it's
dropped (and it's not in master nor master-next).

Should I resend the series again or what's the process now?

Cheers,

--000000000000be956505fdf078af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, May 27, 2023 at 7:21=E2=80=AFAM M=
artin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded=
.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr">On Fri, May 26, 2023 at 8:09=E2=80=AFPM Alexandre=
 Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_bl=
ank">alexandre.belloni@bootlin.com</a>&gt; wrote:<br></div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
The series causes oe-selftest failures:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/5254/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5254/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/127/buil=
ds/1468/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1468/steps/14/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/5225/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5225/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/5175/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5175/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/build=
s/5217/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5217/steps/14/logs/=
stdio</a></blockquote><div><br></div><div>Hi,</div><div><br></div><div>I wa=
s able to reproduce it locally and it&#39;s caused by newer test (which was=
n&#39;t merged yet last time I&#39;ve run selftest with these changes):</di=
v><div><a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D06af6795cf6f079362303bddb39a14459e228e72" target=3D"_blank">https://git.=
openembedded.org/openembedded-core/commit/?id=3D06af6795cf6f079362303bddb39=
a14459e228e72</a></div><div>which hardcodes the expected image name, I&#39;=
ll send fix for this shortly.</div></div></div></blockquote><div><br></div>=
<div>Hi, I see that the selftest fix was already merged to master and this =
change was in=C2=A0abelloni/master-next-success for a while, but now it&#39=
;s dropped (and it&#39;s not in master nor master-next).</div><div><br></di=
v><div>Should I resend the series again or what&#39;s the process now?</div=
><div><br></div><div>Cheers,</div></div></div>

--000000000000be956505fdf078af--

