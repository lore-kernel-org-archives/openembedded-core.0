Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA405C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 15:11:45 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web09.8148.1643123504471808102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TzfDenEU;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id b37so20242973uad.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VVk45ieBtVoIR+0kuLXTVJGEwJf1oqvsCEPQmenM+g4=;
        b=TzfDenEUsMNhGoVKjWJVt9sSjy/zI7T9e5N3oqYWdkJSXnb/b9uFOIm77FIqqhov65
         A8DxRlxi7Z9csEK+P/vkQwMhRgNlcAyfiqut4synRDKPpwcPp74xpY1R8XNCttqbvf++
         sIujnCKu+3OLQTiGc6Q0OaRaALTEyVPcr//UKGMVm00U1uP6X9E6kBsJRC8W7nfpOj8z
         TaVee0RvIhCQctmG9lM7dLdoGdX1Nr+c9B3PwM5IvM2OnBEu/efO/RToi7DRS2VODKrc
         XZC4q/3NZQ143qTxFSJ+7rw94TevpE+n7cioNrB5EPWVZRzhjXLt4WzUOFYRjMZzKvR7
         ezbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VVk45ieBtVoIR+0kuLXTVJGEwJf1oqvsCEPQmenM+g4=;
        b=Pdns2bu8FVwzjAZvtJfWw+5LEEDulmoo+WZJpTO72T5wMe1cxSs17XcIutwgVKQSMY
         VjCb1zlSqU4bcId0OJPp3sKrby4Tvkgiq8POX5Bc5bznCQ4EuwOE5qh3vR6reYQ7+qFW
         azB/QlIDwOYUCIyAYRe6lBoItrb9TjekD5fzuUFQrpK+uWUgPbttHQta80q4b/qt7DMV
         LO56HPkb6jyEqFuzXctC64gvpzJoKxJnurn28uSOxSaeN6aNeQUtUHmiLnyl4eO5s6D+
         7tWOsPstZt5rKkFE8O9TJJ5QPUmZP59ghfemS6xKE0fujZhIYOwuxITWbyZJeaQ/iFfn
         fEiw==
X-Gm-Message-State: AOAM530MmPX4Pmzm147XgmTCH5EPaHPnkujm8CLZMofgA9yUIZS8DAA1
	E8/eDxsFPYhkwqhZUeWdGnggXt6bxw1qUepiEsnqoE9/kWs=
X-Google-Smtp-Source: 
 ABdhPJzaLmJAzv7k2VNEoZdVgP2Ioz0h/glyF4HByNtQo2aDNCxrS6Almfjp6zYywlbISc/+RmMNoGxxkB+wy/vymJQ=
X-Received: by 2002:a67:d81e:: with SMTP id e30mr2938659vsj.73.1643123500652;
 Tue, 25 Jan 2022 07:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20220124181156.3921311-1-ross.burton@arm.com>
 <20220124181156.3921311-2-ross.burton@arm.com>
 <CANNYZj9b+1BgqGEtqyjiY7JFmh0moHweEN9O1Qj8iv90NNd8pA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9b+1BgqGEtqyjiY7JFmh0moHweEN9O1Qj8iv90NNd8pA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jan 2022 16:11:28 +0100
Message-ID: 
 <CANNYZj_orQC8Fchiv2=EKmwNbTN+RAJcD2Y682Simea2RVSG_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] core-image-sato-sdk: allocate more memory
 when in qemu
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000942ab305d669805f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 15:11:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160940

--000000000000942ab305d669805f
Content-Type: text/plain; charset="UTF-8"

qemuarm shows something different:
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4653/steps/13/logs/stdio

Alex

On Tue, 25 Jan 2022 at 16:10, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Seems to not work on arm(32):
>
> Central error: [    5.282955] vmap allocation for size 1052672 failed: use vmalloc=<size> to increase size
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3528/steps/13/logs/stdio
>
> Alex
>
>
> On Mon, 24 Jan 2022 at 19:12, Ross Burton <ross@burtonini.com> wrote:
>
>> Compiling code is memory-intensive, especially kernel modules like the
>> SystemTap probes, so give the VM 1GB of RAM.
>>
>> Hopefully this solves the intermittent failures caused by OOMs during
>> the SystemTap test.
>>
>> [ YOCTO #14673 ]
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  meta/recipes-sato/images/core-image-sato-sdk.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb
>> b/meta/recipes-sato/images/core-image-sato-sdk.bb
>> index b52de0def02..7df8d00971c 100644
>> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
>> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
>> @@ -10,3 +10,6 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \
>>
>>  IMAGE_INSTALL += "kernel-devsrc"
>>
>> +# Compiling stuff, specifically SystemTap probes, can require lots of
>> memory
>> +# See https://bugzilla.yoctoproject.org/show_bug.cgi?id=14673
>> +QB_MEM = '-m 1024'
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#160890):
>> https://lists.openembedded.org/g/openembedded-core/message/160890
>> Mute This Topic: https://lists.openembedded.org/mt/88653349/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--000000000000942ab305d669805f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>qemuarm shows something different:</div><div><a href=
=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4653/=
steps/13/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/53/builds/4653/steps/13/logs/stdio</a></div><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, 25 Jan 2022 at 16:10, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Seems t=
o not work on arm(32):</div><div><pre style=3D"height:926.317px;overflow-y:=
auto;display:block"><span><div style=3D"height:18px"><span style=3D"font-fa=
mily:arial,sans-serif"><span><span>Central error: [    5.282955] vmap alloc=
ation for size 1052672 failed: use vmalloc=3D&lt;size&gt; to increase size<=
/span></span></span></div><div style=3D"height:18px"><span><span><br></span=
></span></div><div style=3D"height:18px"><span style=3D"font-family:arial,s=
ans-serif"><span><span><a href=3D"https://autobuilder.yoctoproject.org/typh=
oon/#/builders/110/builds/3528/steps/13/logs/stdio" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3528/steps/13=
/logs/stdio</a></span></span></span></div><div style=3D"height:18px"><span =
style=3D"font-family:arial,sans-serif"><span><span><br></span></span></span=
></div><div style=3D"height:18px"><span style=3D"font-family:arial,sans-ser=
if"><span><span>Alex<br></span></span></span></div></span></pre></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, 24 Jan 2022 at 19:12, Ross Burton &lt;<a href=3D"mailto:ross@burtonini.c=
om" target=3D"_blank">ross@burtonini.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Compiling code is memory-intensive,=
 especially kernel modules like the<br>
SystemTap probes, so give the VM 1GB of RAM.<br>
<br>
Hopefully this solves the intermittent failures caused by OOMs during<br>
the SystemTap test.<br>
<br>
[ YOCTO #14673 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk=
.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a> b/meta=
/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" rel=3D"noref=
errer" target=3D"_blank">core-image-sato-sdk.bb</a><br>
index b52de0def02..7df8d00971c 100644<br>
--- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a><br>
+++ b/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a><br>
@@ -10,3 +10,6 @@ IMAGE_FEATURES +=3D &quot;dev-pkgs tools-sdk \<br>
<br>
=C2=A0IMAGE_INSTALL +=3D &quot;kernel-devsrc&quot;<br>
<br>
+# Compiling stuff, specifically SystemTap probes, can require lots of memo=
ry<br>
+# See <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14673=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D14673</a><br>
+QB_MEM =3D &#39;-m 1024&#39;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160890): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160890" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160890</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88653349/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88653349/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000942ab305d669805f--

