Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3AAC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 13:10:33 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.14674.1674047433163000368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 05:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lVaVF5SX;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id n190so31747107vsc.11
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 05:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6gEBj0AnhOPaBSZrf7A4DBHmnKXe06iPhlFTTCygT94=;
        b=lVaVF5SXAoc7qiDBf0j8DgYBxnN4eupLt/Har1XMft2NSEOq9TRWA0BpXsA6cvU0ka
         5kBat0b9XVYegcyicKFkBE3jr5VDZUOHB2ITHmE5o60hTbrQ3wepOFKUPgoh7I8wprLR
         nqtHPPgE/qXirXoyhNxguu5RCBTYE1pNpkdYJSpU00aN3sZyTV/9xTuPEBVXrJEh3o6x
         KF/hPah4prAEAmqqrmITRUW0z8tDCBuJzRWLL48bHAoQVsZiWvaXEB6AvyFHVuW0gEL0
         OA3oPLqf5qqlYjSGbOH6fwJuNftARhTaeryMsBB6pKsN+W8SQjzWI1vthjIiezVJDLEd
         PlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gEBj0AnhOPaBSZrf7A4DBHmnKXe06iPhlFTTCygT94=;
        b=bVQjBPfn+6+hQXqj53jsy1qOTlaewn+9GJABd+QGbdM65CS4A3hNJhUCvZW446pEdp
         g1JOjlTSHpY6n4utCGtV8MbnSlXxXf5qUYhBjs5y5m/v3W1NWa/goTU1yB5z6a4HUDq0
         dKClREc0SgMGUWXm1WP1T3UFD7aLx1lhdtxQykgT4wWCzPBbheXhDCuuHdXgT6L7SbEf
         rVpW5Guue77Bdx+4FlqTwcso1+6If3Nsix12EPbx4f7wPiNSsicxLgaWAI4jAcHtuA1i
         W3Yimb0Y4lyBsXLFsRWRWiqlsk05P0/QaxCyAG1vyknrGkkc32eMlkidHdZIVzc65Fx2
         BnlQ==
X-Gm-Message-State: AFqh2kpWXKBhEGGSn4Qfb2daVAuqguL2xDgTkb5ngzf7WkD4c199tEVW
	KMa1a+JyX11bzFyW4zrFa5B7hK74RhIMW9luvJk=
X-Google-Smtp-Source: AMrXdXvrXJ68mNXCB1uEuX60/R+F+8/c3BLbTN+Ozbz/9xYEeKxv3hIXPfjAVNTUObl/E3ikOMalvAy1nU6CFRZLyeA=
X-Received: by 2002:a05:6102:c16:b0:3d3:e027:877a with SMTP id
 x22-20020a0561020c1600b003d3e027877amr912495vss.0.1674047432150; Wed, 18 Jan
 2023 05:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20221205045856.68662-1-Qi.Chen@windriver.com> <1739E878132F7D7E.25137@lists.openembedded.org>
In-Reply-To: <1739E878132F7D7E.25137@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 18 Jan 2023 13:10:20 +0000
Message-ID: <CANPvuR=3JzJuKkE0rLh2nBy18ud6+tbi4hmW_Zdo5gBTabANtA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rm_work: adjust dependency to make
 do_rm_work_all depend on do_rm_work
To: quaresma.jose@gmail.com
Cc: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000087d49305f2898ab2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 13:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176092

--00000000000087d49305f2898ab2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen,

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia sexta, 13/01/2023 =C3=A0(=
s)
15:39:

> Hi Chen,
>
> Just for your information,
> This patch introduces a regression that breaks the do_create_spdx tasks
> when building with multiconfig machines.
>
> I am investigating it more deeply and will come back with my findings.
>

I don't understand the reason for this regression but I am thinking of
sending a revert for this patch.

Here are the steps to reproduce:

git clone https://git.yoctoproject.org/git/poky
cd poky
git clone https://git.yoctoproject.org/git/meta-arm
git clone https://git.yoctoproject.org/git/meta-ti
source oe-init-build-env
bitbake-layers add-layer ../meta-arm/meta-arm-toolchain
bitbake-layers add-layer ../meta-arm/meta-arm
bitbake-layers add-layer ../meta-ti/meta-ti-bsp
bitbake-layers add-layer ../meta-ti/meta-ti-extras
echo 'INHERIT +=3D "rm_work"' >>conf/local.conf
echo 'INHERIT +=3D "create-spdx"' >>conf/local.conf

MACHINE=3Dam64xx-evm bitbake core-image-minimal
MACHINE=3Dam62xx-evm bitbake core-image-minimal

At least these two machines are broken.

Jose


>
> Jose
>
>
> Chen Qi <Qi.Chen@windriver.com> escreveu no dia segunda, 5/12/2022 =C3=A0=
(s)
> 04:59:
>
>> For now, if we use rm_work and `bitbake core-image-minimal', some
>> recipes' WORKDIRs are not cleaned up, e.g., makedevs-native.
>>
>> Adjust the dependency to make do_rm_work_all depend on do_rm_work
>> to solve this problem.
>>
>> Below are the detailed explanation of why this would work.
>>
>> Without this patch, the dependency chain is like:
>> [other deps] -> [do_rm_work] -+-> [do_build]
>>                               |
>> [do_rm_work_all] -------------+
>>
>> With this patch, the depedency chain is like:
>> [other deps] -> [do_rm_work] -> [do_rm_work_all] -> [do_build]
>>
>> Such dependency chain adjustment fixes the issue because do_rm_work_all
>> now depends on [other deps] and thus the [depends] of these [other deps]=
.
>> Take core-image-minimal as an example. Before this adjustment,
>> do_rm_work_all does not have any relationship with do_rootfs, and we hav=
e
>> do_rootfs[depends] +=3D "makedevs-native:do_populate_sysroot ..."
>> This essentially prevents 'recrdeptask' setting of do_rm_work_all extend
>> to makedevs-native. With this patch, the do_rm_work_all now depends
>> on do_rm_work which in turn depends on do_rootfs, and so do_rm_work_all'=
s
>> recrdeptask could have effect on makedevs-native.
>>
>> With this patch, all built recipes WORKDIR will be cleaned up with
>> a few expected exceptions such as kernel and qemu-helper-native.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  meta/classes/rm_work.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
>> index 4121a13279..1f28bc7187 100644
>> --- a/meta/classes/rm_work.bbclass
>> +++ b/meta/classes/rm_work.bbclass
>> @@ -180,7 +180,7 @@ python inject_rm_work() {
>>          # other recipes and thus will typically run much later than
>> completion of
>>          # work in the recipe itself.
>>          # In practice, addtask() here merely updates the dependencies.
>> -        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
>> +        bb.build.addtask('do_rm_work', 'do_rm_work_all do_build', '
>> '.join(deps), d)
>>
>>      # Always update do_build_without_rm_work dependencies.
>>      bb.build.addtask('do_build_without_rm_work', '', ' '.join(deps), d)
>> --
>> 2.37.1
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175835):
> https://lists.openembedded.org/g/openembedded-core/message/175835
> Mute This Topic: https://lists.openembedded.org/mt/95462765/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000087d49305f2898ab2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Chen,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.ope=
nembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jo=
se=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">=
gmail.com@lists.openembedded.org</a>&gt; escreveu no dia sexta, 13/01/2023 =
=C3=A0(s) 15:39:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr">Hi=C2=A0Chen,<div><br></div><div>Just for your informatio=
n,</div><div>This patch introduces a regression=C2=A0that breaks the do_cre=
ate_spdx tasks when building with multiconfig machines.<br></div><div><br>I=
 am investigating it more deeply and will come back with my findings.<br></=
div></div></blockquote><div><br></div><div>I don&#39;t=C2=A0understand the =
reason for this regression but I am thinking of sending a revert for this p=
atch.</div><div><br></div><div>Here are the steps=C2=A0to reproduce:<br></d=
iv><div><br></div><div>git clone <a href=3D"https://git.yoctoproject.org/gi=
t/poky" target=3D"_blank">https://git.yoctoproject.org/git/poky</a><br>cd p=
oky<br>git clone <a href=3D"https://git.yoctoproject.org/git/meta-arm" targ=
et=3D"_blank">https://git.yoctoproject.org/git/meta-arm</a> <br>git clone <=
a href=3D"https://git.yoctoproject.org/git/meta-ti" target=3D"_blank">https=
://git.yoctoproject.org/git/meta-ti</a> <br>source oe-init-build-env<br>bit=
bake-layers add-layer ../meta-arm/meta-arm-toolchain<br>bitbake-layers add-=
layer ../meta-arm/meta-arm<br>bitbake-layers add-layer ../meta-ti/meta-ti-b=
sp<br>bitbake-layers add-layer ../meta-ti/meta-ti-extras<br>echo &#39;INHER=
IT +=3D &quot;rm_work&quot;&#39; &gt;&gt;conf/local.conf<br>echo &#39;INHER=
IT +=3D &quot;create-spdx&quot;&#39; &gt;&gt;conf/local.conf<br><br>MACHINE=
=3Dam64xx-evm bitbake core-image-minimal<br>MACHINE=3Dam62xx-evm bitbake co=
re-image-minimal<br></div><div><br></div><div>At least these two machines a=
re broken.</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br>Jose<br><br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k">Qi.Chen@windriver.com</a>&gt; escreveu no dia segunda, 5/12/2022 =C3=A0(=
s) 04:59:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">For no=
w, if we use rm_work and `bitbake core-image-minimal&#39;, some<br>
recipes&#39; WORKDIRs are not cleaned up, e.g., makedevs-native.<br>
<br>
Adjust the dependency to make do_rm_work_all depend on do_rm_work<br>
to solve this problem.<br>
<br>
Below are the detailed explanation of why this would work.<br>
<br>
Without this patch, the dependency chain is like:<br>
[other deps] -&gt; [do_rm_work] -+-&gt; [do_build]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
[do_rm_work_all] -------------+<br>
<br>
With this patch, the depedency chain is like:<br>
[other deps] -&gt; [do_rm_work] -&gt; [do_rm_work_all] -&gt; [do_build]<br>
<br>
Such dependency chain adjustment fixes the issue because do_rm_work_all<br>
now depends on [other deps] and thus the [depends] of these [other deps].<b=
r>
Take core-image-minimal as an example. Before this adjustment,<br>
do_rm_work_all does not have any relationship with do_rootfs, and we have<b=
r>
do_rootfs[depends] +=3D &quot;makedevs-native:do_populate_sysroot ...&quot;=
<br>
This essentially prevents &#39;recrdeptask&#39; setting of do_rm_work_all e=
xtend<br>
to makedevs-native. With this patch, the do_rm_work_all now depends<br>
on do_rm_work which in turn depends on do_rootfs, and so do_rm_work_all&#39=
;s<br>
recrdeptask could have effect on makedevs-native.<br>
<br>
With this patch, all built recipes WORKDIR will be cleaned up with<br>
a few expected exceptions such as kernel and qemu-helper-native.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/rm_work.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass<br=
>
index 4121a13279..1f28bc7187 100644<br>
--- a/meta/classes/rm_work.bbclass<br>
+++ b/meta/classes/rm_work.bbclass<br>
@@ -180,7 +180,7 @@ python inject_rm_work() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# other recipes and thus will typically r=
un much later than completion of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# work in the recipe itself.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# In practice, addtask() here merely upda=
tes the dependencies.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_rm_work&#39;, &#39;do=
_build&#39;, &#39; &#39;.join(deps), d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_rm_work&#39;, &#39;do=
_rm_work_all do_build&#39;, &#39; &#39;.join(deps), d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Always update do_build_without_rm_work dependencies.<=
br>
=C2=A0 =C2=A0 =C2=A0bb.build.addtask(&#39;do_build_without_rm_work&#39;, &#=
39;&#39;, &#39; &#39;.join(deps), d)<br>
-- <br>
2.37.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175835): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175835" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175835</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95462765/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95462765/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--00000000000087d49305f2898ab2--

