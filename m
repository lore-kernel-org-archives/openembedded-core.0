Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75635C001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 09:28:15 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.13416.1691659689611838057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 02:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ip58gsUj;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-63d30554eefso4453366d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691659688; x=1692264488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dFDwORutWx/udFWO38dyqiI4Jgk4RCZ5BwOjMOQR+9Q=;
        b=ip58gsUjgMRg8XWFp1Kn2kQmbnQomxmltk9gf6CAR29FX1u50pjhBoVFcyNNKKCHUh
         5z3ll5gPOLgpsc0+TM15SZgtu2cHX/0IoRfzJPqXkTht4+jYV0Wx6nPINONj0O2ilYLb
         JsRo7Oo/kA0bra7jVsFoCB/bsN28DBnXq4BFLD3LG4cJwDYSZp+hRjJrGrhFx7PwHXW+
         6uRYF87puSLN7K2+PaM3K1tkEuh7vMM1AEGBSFgwrXDNAtGfpz/qmZ50m2XcoXZIqcjZ
         XBAKy5bDIAbna2iRKSNn+WUrxYaH1jNHU/AAnIEM0Xp9uj+In8vYl0BvtYo3s7GkbQeI
         2fQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659688; x=1692264488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFDwORutWx/udFWO38dyqiI4Jgk4RCZ5BwOjMOQR+9Q=;
        b=l9bSoQPECmn4/1mi+54QO1b1fiBh3jg+tXK1TfXMyTgoVT3mmoOhYDcNWzyULjSa2D
         u0V/R+UZP9d9O2kdA0E7IIry/3qHpiEp9XbP9qq4lhIUvq3daWpkFuBkcKgIxGAW+ecY
         4vmAC1AS3+XGwu0dsQ0EZDzggDDtXdNpoqfgr/MHBzc5d/az9c5IEV2IgQ0pWS8yEE34
         UcvJhgCM1SSNK1XdbAOwndH7RCd0wHlQEMb0KYk+59PgYn9kQfIIV5/YuoEZlPgVonjV
         kOVijILQ8aZ5qAXJp9xW+BYiYVYB8EgBX6RbiGQm15UOFoQYaQ3KF0ukjpHyGMRjBCaU
         EynA==
X-Gm-Message-State: AOJu0YyKJMBT8jDJddAh2mGwXc9CYi6KMymHiLU/HLggBi09spsC0LuN
	MWpc/dVMitR1KIptWDGftigjhDjf5b4YNLCHe+k=
X-Google-Smtp-Source: AGHT+IG1YIExxfxZhQCy+IZGF22tX2X0KBcrc7wKV6l8yDYN3Ow54GkaQZsrVqcldrTZPxh57XY6E5Nu6OKsC6XkVEE=
X-Received: by 2002:a0c:ac01:0:b0:5ef:8004:e0b4 with SMTP id
 l1-20020a0cac01000000b005ef8004e0b4mr1524169qvb.48.1691659688443; Thu, 10 Aug
 2023 02:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <1779A89B0904F9EC.9264@lists.openembedded.org>
In-Reply-To: <1779A89B0904F9EC.9264@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 10 Aug 2023 11:27:57 +0200
Message-ID: <CA+cAkeoUKLnQXupRsPX32pe8=jR=bxNNycc-SMMVw7QYzrBBTg@mail.gmail.com>
Subject: Re: [OE-core][dunfell] kernel fitImage not found
To: frederic.martinsons@gmail.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: multipart/alternative; boundary="000000000000cf83af06028e3666"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185729

--000000000000cf83af06028e3666
Content-Type: text/plain; charset="UTF-8"

I forgot to add that I use INITRAMFS_IMAGE_BUNDLE=1 and kernel 4.19.284.

I'm currently testing some fix (that I clearly not sure about the impact):

diff --git a/meta/classes/kernel-fitimage.bbclass
b/meta/classes/kernel-fitimage.bbclass
index 7c7bcd3fc0..b5984be575 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -572,11 +572,7 @@ do_assemble_fitimage_initramfs() {
        if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
                test -n "${INITRAMFS_IMAGE}" ; then
                cd ${B}
-               if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-                       fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
fitImage ""
-               else
-                       fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
fitImage-${INITRAMFS_IMAGE} 1
-               fi
+               fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
fitImage-${INITRAMFS_IMAGE} 1
        fi
 }


On Wed, 9 Aug 2023 at 10:08, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=gmail.com@lists.openembedded.org> wrote:

> Hello
>
> since the introduction of  two commits (8280c089b0d
> <https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitimage.bbclass?h=dunfell&id=8280c089b0df97368476b8bc54ed758e809f42f5>
>  and e3eb79c0a1
> <https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitimage.bbclass?h=dunfell&id=e3eb79c0a11e9f67af3161361fb88b00123ecbac> )
> inside the dunfell branch, I have kernel installation error , complaining
> that the fitImage was not found:
>
> |
> | install: cannot stat 'arch/arm64/boot/fitImage': No such file or
> directory
> |
>
> With the revert of the two commits mentioned above, I managed to get my
> image built successfully.
>
> I built an arm64 based target and I set in my conf
> KERNEL_IMAGETYPE=fitImage.
> This is very like YOCTO #14971
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14971> that I raised
> end of 2022  and was fixed by backport of another commit from master (I
> have still KERNEL_IMAGETYPE=KERNEL_IMAGETYPES=fitImage and
> KERNEL_IMAGETYPE_FOR_MAKE=Image).
>
> I tried to dig further but I must admit I don't know the arcane of fit
> image construction very well to suggest for a fix, I tried to look also at
> kernel-fitimage.bbclass on master branch but there was a lot
> of changes there and I was unable to pinpoint the issue.
>
> Can someone with more knowledge know what is going on or suggest what I
> can look to know more ?
>
> Thanks.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185689):
> https://lists.openembedded.org/g/openembedded-core/message/185689
> Mute This Topic: https://lists.openembedded.org/mt/100638982/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cf83af06028e3666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I forgot to add that I use=C2=A0INITRAMFS_IMAGE_BUNDLE=3D1=
 and kernel 4.19.284.<div><br></div><div>I&#39;m currently testing some fix=
 (that I clearly not sure about the impact):</div><div><br></div><div>diff =
--git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage=
.bbclass<br>index 7c7bcd3fc0..b5984be575 100644<br>--- a/meta/classes/kerne=
l-fitimage.bbclass<br>+++ b/meta/classes/kernel-fitimage.bbclass<br>@@ -572=
,11 +572,7 @@ do_assemble_fitimage_initramfs() {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if echo ${KERNEL_IMAGETYPES} | grep -wq &quot;fitImage&quot; &amp;&a=
mp; \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -n &q=
uot;${INITRAMFS_IMAGE}&quot; ; then<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 cd ${B}<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if [ &quot;${INITRAMFS_IMAGE_BUNDLE}&quot; =3D &quot;1&quot; ]; the=
n<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage &quo=
t;&quot;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS=
_IMAGE} 1<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fitimage_assemble fit-image-$=
{INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fi<br>=C2=A0}<br></div><div><br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 9 Aug 2023 at 10:08, =
Frederic Martinsons via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lis=
ts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello=
<div><br></div><div>since the introduction of=C2=A0 two commits (<a href=3D=
"https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel-=
fitimage.bbclass?h=3Ddunfell&amp;id=3D8280c089b0df97368476b8bc54ed758e809f4=
2f5" target=3D"_blank">8280c089b0d</a>=C2=A0and=C2=A0<a href=3D"https://git=
.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitimage.bbc=
lass?h=3Ddunfell&amp;id=3De3eb79c0a11e9f67af3161361fb88b00123ecbac" target=
=3D"_blank">e3eb79c0a1</a>=C2=A0) inside the dunfell branch, I have kernel =
installation error , complaining that the fitImage was not found:</div><div=
><br></div><div>|=C2=A0</div><div>| install: cannot stat &#39;arch/arm64/bo=
ot/fitImage&#39;: No such file or directory</div><div>|</div><div><br></div=
><div>With the revert of the two commits mentioned=C2=A0above, I managed=C2=
=A0to get my image built successfully.</div><div><br></div><div>I built an =
arm64 based target and I set in my conf=C2=A0<span style=3D"color:rgb(0,0,0=
)">KERNEL_IMAGETYPE=3DfitImage.</span></div><div><span style=3D"color:rgb(0=
,0,0)">This is very like <a href=3D"https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D14971" target=3D"_blank">YOCTO #14971</a>=C2=A0that I raised e=
nd of 2022=C2=A0 and was fixed by backport of another commit from master (I=
 have still=C2=A0</span><span style=3D"color:rgb(0,0,0)">KERNEL_IMAGETYPE=
=3D</span><span style=3D"color:rgb(0,0,0)">KERNEL_IMAGETYPES=3DfitImage and=
=C2=A0</span><span style=3D"color:rgb(0,0,0)">KERNEL_IMAGETYPE_FOR_MAKE=3DI=
mage).</span></div><div><span style=3D"color:rgb(0,0,0)"><br></span></div><=
div><font color=3D"#000000">I tried to dig further=C2=A0but I must admit I =
don&#39;t know the arcane of fit image construction very well to suggest fo=
r a fix, I tried to look also at kernel-fitimage.bbclass on master branch b=
ut there was a lot</font></div><div><font color=3D"#000000">of changes ther=
e and I was unable to pinpoint the issue.</font></div><div><font color=3D"#=
000000"><br></font></div><div>Can someone with more knowledge know what is =
going on or suggest what I can look to know=C2=A0more ?</div><div><span sty=
le=3D"color:rgb(0,0,0)"><br></span></div><div><span style=3D"color:rgb(0,0,=
0)">Thanks.</span></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185689): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185689" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185689</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100638982/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100638982/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cf83af06028e3666--

