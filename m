Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A785FC77B6E
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 11:40:12 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.10190.1681386008942764441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 04:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fSdNLf3u;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id bz25so632969ljb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681386007; x=1683978007;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cEJdlvxl2oRK/+UE+z62Tj0iAA4/IN/A3/+HruCUer8=;
        b=fSdNLf3uBo1DQKoVBxWW7Ihy5rUPrZkkk9fzn/LfMosHJf2pqppdfc8nyI9XiLxnRX
         1v2uead9giMqf5o3E6R3uwm5xwN1fEWs70oc3PnJRece8718QUuIG05CwkgkCdJT3PkZ
         2NGQ74AhsNyBDaBwG4Tfr0iaP4wh+fOMhGn0QaMblHKvUMijxVpjzIftUYGWl333jwQE
         SWyMbjSkaEZAhwfxyj7ggd92/kIX7f9+EQxYcPQyExXmRMhXMwa0cs/gN5wvTRFSX6/Y
         iPu8PNlftisayPqBtfKpo1b1lqtxo9phbaNa1woAvURtSLmmdFIP+z/7RfnwZ5e0urdi
         Kxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681386007; x=1683978007;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEJdlvxl2oRK/+UE+z62Tj0iAA4/IN/A3/+HruCUer8=;
        b=jMZReJeTMHwIuEDdyC8BMWmIoUr2AUPq0mctE1NKGjfOyZWYHecHl2rN3W53xtKjYI
         Vv70zkaXi7bQkH22agLG7Nr063+Ldx74fO/LTa9CsSS7rVXtzPvseA1hcXmC54pol0Af
         SVlHdSEk1NLCJzhn9httVJYvrpHKsW+AwjKkyhGDEY+j7osxwK83xv8KhpPNOdGPGZRj
         j0KjhV+REMbbWiMAjdrXlXkiE1yFRkQ1OFMr4HKfqi9RPef+z3MKzQ9KntlB1gG7JA6r
         RXPS0l8LdlBRBJ+fhVgjA8jfn2OIpMnAOH3zh6TpdPIaNwusJiq1teLaR/atesoabNa4
         k0BQ==
X-Gm-Message-State: AAQBX9fqHnmcabqGUYLLu5UYmRK3ubvf4j+r/H8mqnNV2hoMJIiix0K6
	FpxrPOZsxoXWeTwBb0flDwofMBumeglDtsb+Ja1tBcsPd5E=
X-Google-Smtp-Source: AKy350b+iuSckgf9De3Y+akRIQKS6c0toMBj1d5Fkb+AjSHF+KbWnOaVS2Ge/FYV+Wa1FfcaXAK5ejOyVYVut2NEW9A=
X-Received: by 2002:a2e:7d13:0:b0:29a:a76a:194b with SMTP id
 y19-20020a2e7d13000000b0029aa76a194bmr645892ljc.3.1681386006461; Thu, 13 Apr
 2023 04:40:06 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 13 Apr 2023 13:39:55 +0200
Message-ID: <CA+cAker1xbk54N=nS6bUQJ+=GC2_+-v+-qvMSppNikMhf+DpJQ@mail.gmail.com>
Subject: cargo patching git path
To: openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a5407e05f9362fcb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 11:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179974

--000000000000a5407e05f9362fcb
Content-Type: text/plain; charset="UTF-8"

Hello,

Since I didn't manage to make any progress on the reproducibility issue of
zvariant (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15090) i
decided to try another rust project to see their reproducibility state.

I went with zbus (https://github.com/zeenix/zbus) which use zvariant
(because one of my hypothesis is that zvariant was not aimed to be build
standalone) and I came into another issue which is the subject of this
mail. I cannot make the zbus recipe to be built:

| error: failed to get `glib` as a dependency of package `zvariant v3.12.0
(/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/git/zvariant)`
|
| Caused by:
|   failed to load source for dependency `glib`
|
| Caused by:
|   Unable to update https://github.com/gtk-rs/glib?rev=c9ee583cea0
|
| Caused by:
|   can't checkout from 'https://github.com/gtk-rs/glib': you are in the
offline mode (--offline)

I looked at the patching process of cargo_common.class and it is correctly
applied and the cargo config file contains the following content:

[patch."https://github.com/gtk-rs/glib"]
glib = { path =
"/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib"
}
glib-macros = { path =
"/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib-macros"
}

[patch."https://github.com/gtk-rs/sys"]
glib-sys = { path =
"/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib-sys"
}
gobject-sys = { path =
"/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/gobject-sys"
}

I first think about what @Alex Kiernan <alex.kiernan@gmail.com> said on its
commit message (
https://git.openembedded.org/openembedded-core/commit/?id=684a8af41c5bb70db68e75f72bdc4c9b09630810)
about patching not working with virtual manifest since the zbus project use
of this.

But I managed to make this patching work with the zbus project locally (by
the way I notified the upstream about that:
https://github.com/rust-lang/cargo/issues/4934).

I cannot understand why this does not work under yocto despite the correct
cargo config file for patching.

On my ubuntu, I used cargo 1.67.1 and oe has 1.68.2, will try a downgrade
but I feel that this is not the issue.

Any ideas ?

--000000000000a5407e05f9362fcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<div><br></div><div>Since I didn&#39;t manage =
to make any progress on the reproducibility issue of zvariant (<a href=3D"h=
ttps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090">https://bugzilla.=
yoctoproject.org/show_bug.cgi?id=3D15090</a>) i decided to try another rust=
 project to see their reproducibility state.</div><div><br></div><div>I wen=
t with zbus (<a href=3D"https://github.com/zeenix/zbus">https://github.com/=
zeenix/zbus</a>) which=C2=A0use zvariant (because one of my hypothesis is t=
hat zvariant was not aimed to be build standalone) and I came into another =
issue which is the subject of this mail. I cannot make the zbus recipe to b=
e built:</div><div><br></div><div>| error: failed to get `glib` as a depend=
ency of package `zvariant v3.12.0 (/home/jenkins/yocto-poky-master/poky/bui=
ld/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/git/zvariant)`<br>| <br>| Ca=
used by:<br>| =C2=A0 failed to load source for dependency `glib`<br>| <br>|=
 Caused by:<br>| =C2=A0 Unable to update <a href=3D"https://github.com/gtk-=
rs/glib?rev=3Dc9ee583cea0">https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0=
</a><br>| <br>| Caused by:<br>| =C2=A0 can&#39;t checkout from &#39;<a href=
=3D"https://github.com/gtk-rs/glib">https://github.com/gtk-rs/glib</a>&#39;=
: you are in the offline mode (--offline)<br></div><div><br></div><div>I lo=
oked at the patching process of cargo_common.class and it is correctly appl=
ied and the cargo config file contains the following content:</div><div><br=
></div><div>[patch.&quot;<a href=3D"https://github.com/gtk-rs/glib">https:/=
/github.com/gtk-rs/glib</a>&quot;]<br>glib =3D { path =3D &quot;/home/jenki=
ns/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0=
/glib&quot; }<br>glib-macros =3D { path =3D &quot;/home/jenkins/yocto-poky-=
master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib-macros&q=
uot; }<br><br>[patch.&quot;<a href=3D"https://github.com/gtk-rs/sys">https:=
//github.com/gtk-rs/sys</a>&quot;]<br>glib-sys =3D { path =3D &quot;/home/j=
enkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.=
0-r0/glib-sys&quot; }<br>gobject-sys =3D { path =3D &quot;/home/jenkins/yoc=
to-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/gobje=
ct-sys&quot; }<br></div><div><br></div><div>I first think about what=C2=A0<=
a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:alex.kier=
nan@gmail.com" tabindex=3D"-1">@Alex Kiernan</a>=C2=A0said on its commit me=
ssage (<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D684a8af41c5bb70db68e75f72bdc4c9b09630810">https://git.openembedded.org/o=
penembedded-core/commit/?id=3D684a8af41c5bb70db68e75f72bdc4c9b09630810</a>)=
 about patching not working with virtual manifest since the zbus project us=
e of this.</div><div><br></div><div>But I managed to make this patching wor=
k with the zbus project locally (by the way I notified the upstream about t=
hat:=C2=A0<a href=3D"https://github.com/rust-lang/cargo/issues/4934">https:=
//github.com/rust-lang/cargo/issues/4934</a>).</div><div><br></div><div>I c=
annot understand why this does not work under yocto despite the correct car=
go config file for patching.<br></div><div><br></div><div>On my ubuntu, I u=
sed cargo 1.67.1 and oe has 1.68.2, will try a downgrade but I feel that th=
is is not the issue.</div><div><br></div><div>Any ideas ?</div><div><br></d=
iv><div><br></div><div><br></div><div><br></div><div><br></div></div>

--000000000000a5407e05f9362fcb--

