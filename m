Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BB1C001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 08:08:45 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.83541.1691568518594040436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 01:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=o/zDF6Jl;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-76d1c58ace6so29500885a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 01:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691568517; x=1692173317;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HsaHcQpZh61qQYMTuoJKuFcQnMn+spHGJoxe8fqJ9PE=;
        b=o/zDF6Jlpfn/LPpkD+5pCdo7S8IfrMoHmJctEbAyvr1aJ8kp4pxFwAjoXql8xe3I5U
         XKLjYV80x4/5v2j5vgRRX/l1YHNaAf1lIbzmzTbL+u6Uwpd/KJIqtHkRjUbvWm4IKIJT
         kf04ApNoy5WJWhxP8iUrf4d6DHDcqFKz4SzG3+vWOsmhwz+1E42s1upq8x0MNqIHZmPR
         m2r8rwU4P3JGH+ZZP4U/RStz9fffvmK7PPd3AN/W6bWlv2WZSqqwY/5QQohE2I37R/kC
         gKdZC5apVShVCUHDwh0n1BNqdBUPgOJtOoH89Yha4j883mAaD3J1Gw0ZNPJxVSKwmpx0
         8Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568517; x=1692173317;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HsaHcQpZh61qQYMTuoJKuFcQnMn+spHGJoxe8fqJ9PE=;
        b=TY/I8iqArF0LMGK8OQqzmibbGa3izC+W7WeVP2/Y9nBtyyFVK2dcokQwCYnmUNowsK
         b4CQpdc7m30aotAVAGEYVrMhPRgDguHeym99LZ8fr1OomSxOoI5jbiGpSU6o9npSJ4uT
         rtBrLRCYDU9GWfkLh1zurChbIUNOQaEMRpV4fOXlfxxlXJg0D/trtQGGdAjXEzd7puhQ
         dCfHdaN5+gHn1aNH6BcC2J0abQ4q570V90FUXWcfRsy2wf7g1QQ1OMBsejE9aIjTiH6+
         F5md+IuPseeENOpThURylIpAocTeFVlwygQstzmrgE4zYmsbrCnC0acq/Bzeu000oyQl
         mMKA==
X-Gm-Message-State: AOJu0YzXkZO6ylC6Wmh1Ky0N4LlDgGd+rv1Yu5EhzVsJme+8npIdekDr
	m58GTK12n90kEDh/mpu8VRTBPfuU/djdX1oQgTSi8NoPD4A=
X-Google-Smtp-Source: AGHT+IFV7aeNH+Cm6BD+qFuOi/8OQmgMsE+/UABpAG8ncZxN3bFJUXXmnt5pSinv9cGFjSxvPyEmVkCyxm5daEcT6ck=
X-Received: by 2002:a0c:8e8c:0:b0:63d:4768:1fbc with SMTP id
 x12-20020a0c8e8c000000b0063d47681fbcmr2413204qvb.11.1691568517321; Wed, 09
 Aug 2023 01:08:37 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 9 Aug 2023 10:08:26 +0200
Message-ID: <CA+cAkeq2N6SFTnw5ed1ZQvs1-DGeb4xC46wncAxFpZ9REuiJ9A@mail.gmail.com>
Subject: [OE-core][dunfell] kernel fitImage not found
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: steve@sakoman.com
Content-Type: multipart/alternative; boundary="0000000000009697ed060278fc04"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 08:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185689

--0000000000009697ed060278fc04
Content-Type: text/plain; charset="UTF-8"

Hello

since the introduction of  two commits (8280c089b0d
<https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitimage.bbclass?h=dunfell&id=8280c089b0df97368476b8bc54ed758e809f42f5>
 and e3eb79c0a1
<https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitimage.bbclass?h=dunfell&id=e3eb79c0a11e9f67af3161361fb88b00123ecbac>
)
inside the dunfell branch, I have kernel installation error , complaining
that the fitImage was not found:

|
| install: cannot stat 'arch/arm64/boot/fitImage': No such file or directory
|

With the revert of the two commits mentioned above, I managed to get my
image built successfully.

I built an arm64 based target and I set in my conf
KERNEL_IMAGETYPE=fitImage.
This is very like YOCTO #14971
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=14971> that I raised end
of 2022  and was fixed by backport of another commit from master (I have
still KERNEL_IMAGETYPE=KERNEL_IMAGETYPES=fitImage and
KERNEL_IMAGETYPE_FOR_MAKE=Image).

I tried to dig further but I must admit I don't know the arcane of fit
image construction very well to suggest for a fix, I tried to look also at
kernel-fitimage.bbclass on master branch but there was a lot
of changes there and I was unable to pinpoint the issue.

Can someone with more knowledge know what is going on or suggest what I can
look to know more ?

Thanks.

--0000000000009697ed060278fc04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello<div><br></div><div>since the introduction of=C2=A0 t=
wo commits (<a href=3D"https://git.openembedded.org/openembedded-core/commi=
t/meta/classes/kernel-fitimage.bbclass?h=3Ddunfell&amp;id=3D8280c089b0df973=
68476b8bc54ed758e809f42f5">8280c089b0d</a>=C2=A0and=C2=A0<a href=3D"https:/=
/git.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitimage=
.bbclass?h=3Ddunfell&amp;id=3De3eb79c0a11e9f67af3161361fb88b00123ecbac">e3e=
b79c0a1</a>=C2=A0) inside the dunfell branch, I have kernel installation er=
ror , complaining that the fitImage was not found:</div><div><br></div><div=
>|=C2=A0</div><div>| install: cannot stat &#39;arch/arm64/boot/fitImage&#39=
;: No such file or directory</div><div>|</div><div><br></div><div>With the =
revert of the two commits mentioned=C2=A0above, I managed=C2=A0to get my im=
age built successfully.</div><div><br></div><div>I built an arm64 based tar=
get and I set in my conf=C2=A0<span style=3D"color:rgb(0,0,0)">KERNEL_IMAGE=
TYPE=3DfitImage.</span></div><div><span style=3D"color:rgb(0,0,0)">This is =
very like <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14=
971">YOCTO #14971</a>=C2=A0that I raised end of 2022=C2=A0 and was fixed by=
 backport of another commit from master (I have still=C2=A0</span><span sty=
le=3D"color:rgb(0,0,0)">KERNEL_IMAGETYPE=3D</span><span style=3D"color:rgb(=
0,0,0)">KERNEL_IMAGETYPES=3DfitImage and=C2=A0</span><span style=3D"color:r=
gb(0,0,0)">KERNEL_IMAGETYPE_FOR_MAKE=3DImage).</span></div><div><span style=
=3D"color:rgb(0,0,0)"><br></span></div><div><font color=3D"#000000">I tried=
 to dig further=C2=A0but I must admit I don&#39;t know the arcane of fit im=
age construction very well to suggest for a fix, I tried to look also at ke=
rnel-fitimage.bbclass on master branch but there was a lot</font></div><div=
><font color=3D"#000000">of changes there and I was unable to pinpoint the =
issue.</font></div><div><font color=3D"#000000"><br></font></div><div>Can s=
omeone with more knowledge know what is going on or suggest what I can look=
 to know=C2=A0more ?</div><div><span style=3D"color:rgb(0,0,0)"><br></span>=
</div><div><span style=3D"color:rgb(0,0,0)">Thanks.</span></div></div>

--0000000000009697ed060278fc04--

