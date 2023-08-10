Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B35C001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 12:32:46 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.15872.1691670762403396279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 05:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rbMr9eC8;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-63d170a649eso5767916d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691670761; x=1692275561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FmdbQA7rXECuFvyBq+yjUoyetYtAQNqXOQ5TXA+db8=;
        b=rbMr9eC8zP7W7GVFCsxbeaxCVLUB+1M7PcNgA5zWQzde9VTX4kB9Y+2ne/KeAppSw7
         vstz26bPFZ/wdpWIItMmxVVtzZ0m7OH1PqtIdfTBbN9jk/431AkHrfVc06VVT/+qEXSO
         YmbkaQwjolqpbb5nf3P6jXS1oKYwGjFLdciXyHsVDttV3cJt7pNwq0pdwyzusDlql7h8
         /BxFUfUrs/55ST+z7nFjYaHwSOljwzY/IXftON22uUPNEdK2V20GQfVmLS+fSi2UGaFX
         qMEpFcMrXAmn5fwAvPIJPpxwM34ZmwZcqM5Ng2pK982Mof/0mdJrifexIHew2q1AbDht
         RRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691670761; x=1692275561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FmdbQA7rXECuFvyBq+yjUoyetYtAQNqXOQ5TXA+db8=;
        b=Vge2ss6yWUgJe8zb5UXG9wB1Ej8WpUNc+Vb5DiHXtkeGuxecK6EOQKYFQn4Rf4Mpsa
         bdq4bZEJLhWnPC4Qk0muZao+KxNfEe+zyGZiNAblkBNFbZWGFeItiuyFZEkkgTsjWVdd
         OhML/yCYrJKFaP2SPHjHuWfFO8Kidv+w9gH5yo6WHFBH+PHD0VZWGeO9YuKBURvgmUtL
         SsRiRa7Udhq/aDEDiEnvn1DbsrBEJGYmmTUjFaGivcj6cSpdRWexN+NyzEDNxFQxXGkc
         PZ8yKxdLoh43B3WaGuTiz/Nmzp87vcW+t/BW+xdfQdMa//pnlqjqTO2q5grtUCcGhQRk
         +wjA==
X-Gm-Message-State: AOJu0Ywht79mXLBDPLOSqleNsA8w6+YP07rb1Bo+ybd9P+9HEgYI2cKJ
	Yi+De+pNBCo9ryMV3ZQkRhjqyVA5bb9GXpSWXrU=
X-Google-Smtp-Source: AGHT+IHEgCVw7Oc9aS7e5Bn7TzKS3H8S4npjNxMK35LNG74LZpeH2kNemr+4EBSBsgLh21xZln3J11uFOmAMiqXCp/M=
X-Received: by 2002:a05:6214:1789:b0:63d:36ab:93f0 with SMTP id
 ct9-20020a056214178900b0063d36ab93f0mr2194980qvb.54.1691670761403; Thu, 10
 Aug 2023 05:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <1779A89B0904F9EC.9264@lists.openembedded.org> <1779FB866F72E8FD.8497@lists.openembedded.org>
In-Reply-To: <1779FB866F72E8FD.8497@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 10 Aug 2023 14:32:30 +0200
Message-ID: <CA+cAkerHxO2ub8wQvWvx9bFf5LWRpGfvqR28+v=3mqzQM__0bA@mail.gmail.com>
Subject: Re: [OE-core][dunfell] kernel fitImage not found
To: frederic.martinsons@gmail.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: multipart/alternative; boundary="000000000000cf7817060290ca62"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 12:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185740

--000000000000cf7817060290ca62
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Aug 2023 at 11:28, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=gmail.com@lists.openembedded.org> wrote:

> I forgot to add that I use INITRAMFS_IMAGE_BUNDLE=1 and kernel 4.19.284.
>
> I'm currently testing some fix (that I clearly not sure about the impact):
>
> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> index 7c7bcd3fc0..b5984be575 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -572,11 +572,7 @@ do_assemble_fitimage_initramfs() {
>         if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
>                 test -n "${INITRAMFS_IMAGE}" ; then
>                 cd ${B}
> -               if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
> -                       fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
> fitImage ""
> -               else
> -                       fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
> fitImage-${INITRAMFS_IMAGE} 1
> -               fi
> +               fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
> fitImage-${INITRAMFS_IMAGE} 1
>         fi
>  }
>

This was not the correct thing to do. By searching more, I think another
backport commit is necessary , this one
<https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/kernel.bbclass?id=1b67fd9ac74935fa41e960478c54e45422339138>
I'll submit the backport soon.


>
On Wed, 9 Aug 2023 at 10:08, Frederic Martinsons via lists.openembedded.org
> <frederic.martinsons=gmail.com@lists.openembedded.org> wrote:
>
>> Hello
>>
>> since the introduction of  two commits (8280c089b0d
>> <https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitimage.bbclass?h=dunfell&id=8280c089b0df97368476b8bc54ed758e809f42f5>
>>  and e3eb79c0a1
>> <https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitimage.bbclass?h=dunfell&id=e3eb79c0a11e9f67af3161361fb88b00123ecbac> )
>> inside the dunfell branch, I have kernel installation error , complaining
>> that the fitImage was not found:
>>
>> |
>> | install: cannot stat 'arch/arm64/boot/fitImage': No such file or
>> directory
>> |
>>
>> With the revert of the two commits mentioned above, I managed to get my
>> image built successfully.
>>
>> I built an arm64 based target and I set in my conf
>> KERNEL_IMAGETYPE=fitImage.
>> This is very like YOCTO #14971
>> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14971> that I raised
>> end of 2022  and was fixed by backport of another commit from master (I
>> have still KERNEL_IMAGETYPE=KERNEL_IMAGETYPES=fitImage and
>> KERNEL_IMAGETYPE_FOR_MAKE=Image).
>>
>> I tried to dig further but I must admit I don't know the arcane of fit
>> image construction very well to suggest for a fix, I tried to look also at
>> kernel-fitimage.bbclass on master branch but there was a lot
>> of changes there and I was unable to pinpoint the issue.
>>
>> Can someone with more knowledge know what is going on or suggest what I
>> can look to know more ?
>>
>> Thanks.
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185729):
> https://lists.openembedded.org/g/openembedded-core/message/185729
> Mute This Topic: https://lists.openembedded.org/mt/100638982/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cf7817060290ca62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 10 Aug 2023 at 11:28, Frederi=
c Martinsons via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I forgot to =
add that I use=C2=A0INITRAMFS_IMAGE_BUNDLE=3D1 and kernel 4.19.284.<div><br=
></div><div>I&#39;m currently testing some fix (that I clearly not sure abo=
ut the impact):</div><div><br></div><div>diff --git a/meta/classes/kernel-f=
itimage.bbclass b/meta/classes/kernel-fitimage.bbclass<br>index 7c7bcd3fc0.=
.b5984be575 100644<br>--- a/meta/classes/kernel-fitimage.bbclass<br>+++ b/m=
eta/classes/kernel-fitimage.bbclass<br>@@ -572,11 +572,7 @@ do_assemble_fit=
image_initramfs() {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if echo ${KERNEL_IMAGETY=
PES} | grep -wq &quot;fitImage&quot; &amp;&amp; \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -n &quot;${INITRAMFS_IMAGE}&quot; ;=
 then<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br=
>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${INITRAMFS_=
IMAGE_BUNDLE}&quot; =3D &quot;1&quot; ]; then<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fitimage_assemble fit-=
image-${INITRAMFS_IMAGE}.its fitImage &quot;&quot;<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fitimage_assemble fit-image-$=
{INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-$=
{INITRAMFS_IMAGE} 1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>=C2=A0}<br></div><=
div></div></div></blockquote><div><br></div><div>This was not the correct t=
hing to do. By searching more, I think another backport commit is necessary=
 ,=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/commit/me=
ta/classes-recipe/kernel.bbclass?id=3D1b67fd9ac74935fa41e960478c54e45422339=
138">this one</a></div><div>I&#39;ll submit the backport soon.</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div>=C2=A0<br></div></div></blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, 9 Aug 2023 at 10:08, Frederic Martinsons via <a href=3D"http:/=
/lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;f=
rederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello<div>=
<br></div><div>since the introduction of=C2=A0 two commits (<a href=3D"http=
s://git.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitim=
age.bbclass?h=3Ddunfell&amp;id=3D8280c089b0df97368476b8bc54ed758e809f42f5" =
target=3D"_blank">8280c089b0d</a>=C2=A0and=C2=A0<a href=3D"https://git.open=
embedded.org/openembedded-core/commit/meta/classes/kernel-fitimage.bbclass?=
h=3Ddunfell&amp;id=3De3eb79c0a11e9f67af3161361fb88b00123ecbac" target=3D"_b=
lank">e3eb79c0a1</a>=C2=A0) inside the dunfell branch, I have kernel instal=
lation error , complaining that the fitImage was not found:</div><div><br><=
/div><div>|=C2=A0</div><div>| install: cannot stat &#39;arch/arm64/boot/fit=
Image&#39;: No such file or directory</div><div>|</div><div><br></div><div>=
With the revert of the two commits mentioned=C2=A0above, I managed=C2=A0to =
get my image built successfully.</div><div><br></div><div>I built an arm64 =
based target and I set in my conf=C2=A0<span style=3D"color:rgb(0,0,0)">KER=
NEL_IMAGETYPE=3DfitImage.</span></div><div><span style=3D"color:rgb(0,0,0)"=
>This is very like <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D14971" target=3D"_blank">YOCTO #14971</a>=C2=A0that I raised end of =
2022=C2=A0 and was fixed by backport of another commit from master (I have =
still=C2=A0</span><span style=3D"color:rgb(0,0,0)">KERNEL_IMAGETYPE=3D</spa=
n><span style=3D"color:rgb(0,0,0)">KERNEL_IMAGETYPES=3DfitImage and=C2=A0</=
span><span style=3D"color:rgb(0,0,0)">KERNEL_IMAGETYPE_FOR_MAKE=3DImage).</=
span></div><div><span style=3D"color:rgb(0,0,0)"><br></span></div><div><fon=
t color=3D"#000000">I tried to dig further=C2=A0but I must admit I don&#39;=
t know the arcane of fit image construction very well to suggest for a fix,=
 I tried to look also at kernel-fitimage.bbclass on master branch but there=
 was a lot</font></div><div><font color=3D"#000000">of changes there and I =
was unable to pinpoint the issue.</font></div><div><font color=3D"#000000">=
<br></font></div><div>Can someone with more knowledge know what is going on=
 or suggest what I can look to know=C2=A0more ?</div><div><span style=3D"co=
lor:rgb(0,0,0)"><br></span></div><div><span style=3D"color:rgb(0,0,0)">Than=
ks.</span></div></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185729): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185729" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185729</a><br>
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
</blockquote></div></div>

--000000000000cf7817060290ca62--

