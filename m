Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9B5C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 06:11:09 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.2884.1681452661246972616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 23:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DwS1L06i;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id m5so3199980ljc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 23:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681452659; x=1684044659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vD+dGKpSDhtw42QkdQTqeJe8PLyOF6VTiiyzYT713Yc=;
        b=DwS1L06iD+2HAJeIYRP5E/h8vnK/s9cc5TFqZicFgAYDgOVYUOZdOoB0i6MPKwwgXU
         tSHwvz7X1dGEjPtlBPQcWdZjp7dVszC7KF1QwDJdNTnu1VQE4RvHJVFGOr/9zBU8oqwQ
         Fplf1CNPLLTs6JsPlHSxSpd3veUsCsuU2bgQyLJVm+W94SydzWFCISMVTYETlU3pCkvL
         6YMc+UwU8cePVvipOinv1gNj+42nnNhj6E2m5VbjD52x9tDyqaYdKJzYGzm4xQjEVsc3
         /iQfAhJTKI/TIRjjzkMtPyGotta8OGCn+9sZb9OXz22cywJEmFire+S+szd1/yyzHfxu
         Mceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681452659; x=1684044659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vD+dGKpSDhtw42QkdQTqeJe8PLyOF6VTiiyzYT713Yc=;
        b=FgLgKimz2KWqDz7wKP2E6AdktTdc0N3jhtfSik0MbGJGDrbXK+nLki7BoZT8ZM9SDk
         2WZwz4czgZo1/SyqMFYtredcIYxWg7TToSn9hXUYwv5io1+05C68QVt8CmUTqHju2G+R
         xS7nxA392hRBLMEPbA5woFsAmZE4JxItbfqTf696gn9zZDHzyogQH2sMvHfx5M1A9alE
         v+vw+39yRfW8HnCUQOJrMJ8snj7kMCSUuIGMQ9g80WK8fDCZrCo5usLmfAuzfH9/sQDM
         Nf2cF1BADUIvRGM2MDecmEiFQa4EHl5+wkUDnrL+DAoXSI+aFGxPasfqs3iqvB8CAa6y
         HW9Q==
X-Gm-Message-State: AAQBX9diubU7grbrurn5nYTMKSeY2cdLIp0NqAq9EgQ/zRvDqBW9NDi6
	zVENqkwZkHjbxMA/SMG//KxcdT0UQ+v/SZUerfWSJYyWtag=
X-Google-Smtp-Source: AKy350YPn4A9NNao/Yu0TVG6SswpTAsWehtcn4Sek0vyWXjwB7vsc+LApv8W/8tD4a3he0qN/dzHnK4rvH7XByrbfe4=
X-Received: by 2002:a05:651c:1581:b0:2a7:81b2:23cc with SMTP id
 h1-20020a05651c158100b002a781b223ccmr3713936ljq.3.1681452658967; Thu, 13 Apr
 2023 23:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <17557BAACB05F534.10127@lists.openembedded.org> <17557C3E627C45CF.17374@lists.openembedded.org>
In-Reply-To: <17557C3E627C45CF.17374@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 14 Apr 2023 08:10:47 +0200
Message-ID: <CA+cAkeq-83KRA7SYE796oV017sSCCJ-0=5zTw1i=Wd_nqV+PfQ@mail.gmail.com>
Subject: Re: [OE-core] cargo patching git path
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000071c7cd05f945b462"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 06:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179986

--00000000000071c7cd05f945b462
Content-Type: text/plain; charset="UTF-8"

I opened a dedicated ticket (
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15104) for this issue.

On Thu, 13 Apr 2023 at 13:50, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=gmail.com@lists.openembedded.org> wrote:

> By the way, it was way simpler to update my cargo to 1.68.2 and I confirm
> the patching still works like a charm.
>
> On Thu, 13 Apr 2023 at 13:40, Frederic Martinsons via
> lists.openembedded.org <frederic.martinsons=
> gmail.com@lists.openembedded.org> wrote:
>
>> Hello,
>>
>> Since I didn't manage to make any progress on the reproducibility issue
>> of zvariant (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15090) i
>> decided to try another rust project to see their reproducibility state.
>>
>> I went with zbus (https://github.com/zeenix/zbus) which use zvariant
>> (because one of my hypothesis is that zvariant was not aimed to be build
>> standalone) and I came into another issue which is the subject of this
>> mail. I cannot make the zbus recipe to be built:
>>
>> | error: failed to get `glib` as a dependency of package `zvariant
>> v3.12.0
>> (/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/git/zvariant)`
>> |
>> | Caused by:
>> |   failed to load source for dependency `glib`
>> |
>> | Caused by:
>> |   Unable to update https://github.com/gtk-rs/glib?rev=c9ee583cea0
>> |
>> | Caused by:
>> |   can't checkout from 'https://github.com/gtk-rs/glib': you are in the
>> offline mode (--offline)
>>
>> I looked at the patching process of cargo_common.class and it is
>> correctly applied and the cargo config file contains the following content:
>>
>> [patch."https://github.com/gtk-rs/glib"]
>> glib = { path =
>> "/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib"
>> }
>> glib-macros = { path =
>> "/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib-macros"
>> }
>>
>> [patch."https://github.com/gtk-rs/sys"]
>> glib-sys = { path =
>> "/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib-sys"
>> }
>> gobject-sys = { path =
>> "/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/gobject-sys"
>> }
>>
>> I first think about what @Alex Kiernan <alex.kiernan@gmail.com> said on
>> its commit message (
>> https://git.openembedded.org/openembedded-core/commit/?id=684a8af41c5bb70db68e75f72bdc4c9b09630810)
>> about patching not working with virtual manifest since the zbus project use
>> of this.
>>
>> But I managed to make this patching work with the zbus project locally
>> (by the way I notified the upstream about that:
>> https://github.com/rust-lang/cargo/issues/4934).
>>
>> I cannot understand why this does not work under yocto despite the
>> correct cargo config file for patching.
>>
>> On my ubuntu, I used cargo 1.67.1 and oe has 1.68.2, will try a downgrade
>> but I feel that this is not the issue.
>>
>> Any ideas ?
>>
>>
>>
>>
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179975):
> https://lists.openembedded.org/g/openembedded-core/message/179975
> Mute This Topic: https://lists.openembedded.org/mt/98238501/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000071c7cd05f945b462
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I opened a dedicated ticket (<a href=3D"https://bugzilla.y=
octoproject.org/show_bug.cgi?id=3D15104">https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D15104</a>) for this issue.</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 13 Apr 2023 at 13:50, F=
rederic Martinsons via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">By the=
 way, it was way simpler to update my cargo to 1.68.2 and I confirm the pat=
ching still works like a charm.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, 13 Apr 2023 at 13:40, Frederic Marti=
nsons via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists=
.openembedded.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com=
@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">Hello,=C2=A0<div><br></div><div>Since I didn&#39;t manage =
to make any progress on the reproducibility issue of zvariant (<a href=3D"h=
ttps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090" target=3D"_blank"=
>https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090</a>) i decided t=
o try another rust project to see their reproducibility state.</div><div><b=
r></div><div>I went with zbus (<a href=3D"https://github.com/zeenix/zbus" t=
arget=3D"_blank">https://github.com/zeenix/zbus</a>) which=C2=A0use zvarian=
t (because one of my hypothesis is that zvariant was not aimed to be build =
standalone) and I came into another issue which is the subject of this mail=
. I cannot make the zbus recipe to be built:</div><div><br></div><div>| err=
or: failed to get `glib` as a dependency of package `zvariant v3.12.0 (/hom=
e/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.=
11.0-r0/git/zvariant)`<br>| <br>| Caused by:<br>| =C2=A0 failed to load sou=
rce for dependency `glib`<br>| <br>| Caused by:<br>| =C2=A0 Unable to updat=
e <a href=3D"https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0" target=3D"_b=
lank">https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0</a><br>| <br>| Cause=
d by:<br>| =C2=A0 can&#39;t checkout from &#39;<a href=3D"https://github.co=
m/gtk-rs/glib" target=3D"_blank">https://github.com/gtk-rs/glib</a>&#39;: y=
ou are in the offline mode (--offline)<br></div><div><br></div><div>I looke=
d at the patching process of cargo_common.class and it is correctly applied=
 and the cargo config file contains the following content:</div><div><br></=
div><div>[patch.&quot;<a href=3D"https://github.com/gtk-rs/glib" target=3D"=
_blank">https://github.com/gtk-rs/glib</a>&quot;]<br>glib =3D { path =3D &q=
uot;/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux=
/zbus/3.11.0-r0/glib&quot; }<br>glib-macros =3D { path =3D &quot;/home/jenk=
ins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r=
0/glib-macros&quot; }<br><br>[patch.&quot;<a href=3D"https://github.com/gtk=
-rs/sys" target=3D"_blank">https://github.com/gtk-rs/sys</a>&quot;]<br>glib=
-sys =3D { path =3D &quot;/home/jenkins/yocto-poky-master/poky/build/tmp/wo=
rk/core2-64-poky-linux/zbus/3.11.0-r0/glib-sys&quot; }<br>gobject-sys =3D {=
 path =3D &quot;/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-6=
4-poky-linux/zbus/3.11.0-r0/gobject-sys&quot; }<br></div><div><br></div><di=
v>I first think about what=C2=A0<a class=3D"gmail_plusreply" id=3D"m_833867=
8748988989168m_3829594028524520493plusReplyChip-0" href=3D"mailto:alex.kier=
nan@gmail.com" target=3D"_blank">@Alex Kiernan</a>=C2=A0said on its commit =
message (<a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
id=3D684a8af41c5bb70db68e75f72bdc4c9b09630810" target=3D"_blank">https://gi=
t.openembedded.org/openembedded-core/commit/?id=3D684a8af41c5bb70db68e75f72=
bdc4c9b09630810</a>) about patching not working with virtual manifest since=
 the zbus project use of this.</div><div><br></div><div>But I managed to ma=
ke this patching work with the zbus project locally (by the way I notified =
the upstream about that:=C2=A0<a href=3D"https://github.com/rust-lang/cargo=
/issues/4934" target=3D"_blank">https://github.com/rust-lang/cargo/issues/4=
934</a>).</div><div><br></div><div>I cannot understand why this does not wo=
rk under yocto despite the correct cargo config file for patching.<br></div=
><div><br></div><div>On my ubuntu, I used cargo 1.67.1 and oe has 1.68.2, w=
ill try a downgrade but I feel that this is not the issue.</div><div><br></=
div><div>Any ideas ?</div><div><br></div><div><br></div><div><br></div><div=
><br></div><div><br></div></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179975): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179975" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179975</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98238501/6213=
388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98238501/6213388</a><br>
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

--00000000000071c7cd05f945b462--

