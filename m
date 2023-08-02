Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0C8C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:09:06 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.1904.1690996138026486268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lmaosN6D;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-44758510539so12429137.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 10:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690996137; x=1691600937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOT0zJoOkrVsrhr6Oi9AZ6GJx73Eu+cz0z/AAA6P++g=;
        b=lmaosN6DB2T9cgBDgPyVr4C2P58UfTLzLHIj18cdd4UqLvfDHvMnk6pThHVgJP3nm6
         diZHlbIgrZbx0oVNlgPFg8H9dn0BHv4gMRVrC/bMZS2BPORq9HGR7HlRqMxTpC9/WL0j
         ihA2DHjaQ8O49gLrHSozNcEk/z5uVbL6bFVJ8e68JVdDYqksH/0Yj0GA0/i7+aaTO5aA
         W2LltFtl3pgErctSkbmENgQyP2Fh/Mzlb+mTbzDFZ+R7vfqzYa5jPQYqRNWFAmGYs9/A
         tQmCUQVeswh9+iMpu61sp+8od+eEWS2YRkGTh2j/1pdAM3ESYFsDzvNZHwy6ivwbY7Hh
         cjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690996137; x=1691600937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOT0zJoOkrVsrhr6Oi9AZ6GJx73Eu+cz0z/AAA6P++g=;
        b=faBI95I6HN7dab9MYudhNqr40A6xj5/rHeL/lT61O94U69+6UfveZV+QMed9M0FOPQ
         CSoD2iVVUWg/YyP/38DoqZ6N1RrEu8pobzfFNfOMongAo6uR0Vo1zUfLJWAqBAUmBBgP
         F88kV2c2Q5YfwLCmfJDszyFKaPA1BgbWywOMjEz8ze9JRVZsiZnm7ppQoNBQ5VDyyvCa
         Ua+dBRd4iqw+/jT/kz8hmCcOUqayGyb481xhPVNAQOpGA0AR+/rQjFHTqcMmnBy4S3J3
         YKR6T0netZgjlcVV05JM+psAVkJS+X0CpHE6MyNgwb0c8+O9TIvjodJ6wG77MpYhOk0W
         sO/A==
X-Gm-Message-State: ABy/qLa8q4x0oUFomoNU69qRC6zT8qy+dMoGDZu8TTNom4fs5PdbO+qN
	1jYwdAhI/oDS/8W4PC/TDIZwSEvcpwl2piC/tYA=
X-Google-Smtp-Source: APBJJlGxXKc5ExqJyexZBSaky0uKKJlVjmoUe5J5TSLTc7ttfaBCgPcTZjb3xGI7wy+K0pm29BH/4iP0p9YGVI2oS6M=
X-Received: by 2002:a67:f647:0:b0:447:6f5a:5123 with SMTP id
 u7-20020a67f647000000b004476f5a5123mr4964701vso.30.1690996136886; Wed, 02 Aug
 2023 10:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4MxqDTacjdsJkN6Gxf8PMmqV5iy6_0e-Umn5BDjybDbPA@mail.gmail.com>
 <5783.1690992493049046066@lists.openembedded.org>
In-Reply-To: <5783.1690992493049046066@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Aug 2023 18:08:45 +0100
Message-ID: <CANPvuRm3nQhrAtQ_O277oS1=45+KS+76-jRiePfqxRcpfeHHmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Don't fail if Modules.symvers doesn't exist
To: Andrew Geissler <geissonator@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000e471e0601f3b85c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 17:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185416

--0000000000000e471e0601f3b85c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Geissler <geissonator@gmail.com> escreveu no dia quarta, 2/08/2023
=C3=A0(s) 17:08:

> On Wed, Aug 2, 2023 at 06:38 AM, Bruce Ashfield wrote:
>
> On Wed, Aug 2, 2023 at 9:15=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrot=
e:
>
> On Wed, 2 Aug 2023 at 12:45, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
>
>
>
> On Wed, 2 Aug 2023 at 13:47, Joel Stanley <joel@jms.id.au> wrote:
>
> The one liner tests using `[ ] && action` need to have || true after the
> action,
> otherwise the line returns false and the recipie fails.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> meta/classes-recipe/kernel.bbclass | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 247ef4a48aa7..f1bc41e82be8 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -486,7 +486,7 @@ kernel_do_install() {
> install -m 0644 System.map
> ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
> install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
> install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION=
}
> - [ -e Module.symvers ] && install -m 0644 Module.symvers
> ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
> + [ -e Module.symvers ] && install -m 0644 Module.symvers
> ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION} || true
> }
>
> By doing that, you simply silent possible error of the action after the
> test, below is a little snippet showing that
>
> Sure. But the test is looking for the file, so if it doesn't exist
> then the command install won't run.
>
>
I think using an if solves the issue:

if [ -e Module.symvers ]; then
  install -m 0644 Module.symvers
${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
fi

or something to invert the logic:

! [ -e Module.symvers ] || install -m 0644 Module.symvers
${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}

Jose

Something doesn't seem quite right, that test for Module.symvers (there
> and in the shared workdir code) were put in place for the scenario
> you are mentioning .. if Modules are disabled and hence Module.symvers
> doesn't
> exist.
>
> At one point, we even tested that sort of configuration.
>
> I didn't dig more through the logs, but maybe we had lines after that
> command
> previously, so the last return code wasn't a failure and hence no task
> failure.
>
> Yep, this is what happened, there used to be these 2 lines after it:
>
> install -d ${D}${sysconfdir}/modprobe.d
> install -d ${D}${sysconfdir}/modules-load.d
>
>
>
> https://gerrit.openbmc.org/c/openbmc/openbmc/+/65313/3/poky/meta/classes-=
recipe/kernel.bbclass
>
> Once these were removed we started hitting this failure over in OpenBMC.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185414):
> https://lists.openembedded.org/g/openembedded-core/message/185414
> Mute This Topic: https://lists.openembedded.org/mt/100503145/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000e471e0601f3b85c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Andrew Geissler &lt;<a href=3D"mailto=
:geissonator@gmail.com">geissonator@gmail.com</a>&gt; escreveu no dia quart=
a, 2/08/2023 =C3=A0(s) 17:08:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Wed, Aug 2, 2023 at 06:38 AM, Bruce Ashfield wrote:<br>
<blockquote>On Wed, Aug 2, 2023 at 9:15=E2=80=AFAM Joel Stanley &lt;<a href=
=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt; wrote:<=
br>
<blockquote>On Wed, 2 Aug 2023 at 12:45, Fr=C3=A9d=C3=A9ric Martinsons<br>&=
lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">frede=
ric.martinsons@gmail.com</a>&gt; wrote:<br>
<blockquote><br><br>On Wed, 2 Aug 2023 at 13:47, Joel Stanley &lt;<a href=
=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt; wrote:<=
br>
<blockquote>The one liner tests using `[ ] &amp;&amp; action` need to have =
|| true after the action,<br>otherwise the line returns false and the recip=
ie fails.<br><br>Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms=
.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;<br>---<br>meta/classes-rec=
ipe/kernel.bbclass | 4 ++--<br>1 file changed, 2 insertions(+), 2 deletions=
(-)<br><br>diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-r=
ecipe/kernel.bbclass<br>index 247ef4a48aa7..f1bc41e82be8 100644<br>--- a/me=
ta/classes-recipe/kernel.bbclass<br>+++ b/meta/classes-recipe/kernel.bbclas=
s<br>@@ -486,7 +486,7 @@ kernel_do_install() {<br>install -m 0644 System.ma=
p ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}<br>install -m 0644 =
.config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}<br>install -m 064=
4 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}<br>- [ -e Modu=
le.symvers ] &amp;&amp; install -m 0644 Module.symvers ${D}/${KERNEL_IMAGED=
EST}/Module.symvers-${KERNEL_VERSION}<br>+ [ -e Module.symvers ] &amp;&amp;=
 install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${K=
ERNEL_VERSION} || true<br>}</blockquote>
By doing that, you simply silent possible error of the action after the tes=
t, below is a little snippet showing that</blockquote>
Sure. But the test is looking for the file, so if it doesn&#39;t exist<br>t=
hen the command install won&#39;t run.</blockquote></blockquote></blockquot=
e><div><br></div><div>I think using an if solves the issue:</div><div><br><=
/div><div>if [ -e Module.symvers ]; then</div><div>=C2=A0 install -m 0644 M=
odule.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}<br>=
</div><div>fi</div><div><br></div><div>or something to invert the logic:</d=
iv><div><br>! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/=
${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}<br></div><div><br></di=
v><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><blockquote>
Something doesn&#39;t seem quite right, that test for Module.symvers (there=
<br>and in the shared workdir code) were put in place for the scenario<br>y=
ou are mentioning .. if Modules are disabled and hence Module.symvers doesn=
&#39;t<br>exist.<br><br>At one point, we even tested that sort of configura=
tion.<br><br>I didn&#39;t dig more through the logs, but maybe we had lines=
 after that command<br>previously, so the last return code wasn&#39;t a fai=
lure and hence no task<br>failure.</blockquote>
Yep, this is what happened, there used to be these 2 lines after it:<br><br=
>
<div id=3D"m_-6999455832184767878left-content-487"><span> </span>install -d=
 ${D}${sysconfdir}/modprobe.d</div>
<table id=3D"m_-6999455832184767878diffTable">
<tbody>
<tr aria-labelledby=3D"left-button-486 left-content-486">
<td>
<div id=3D"m_-6999455832184767878left-content-486">install -d ${D}${sysconf=
dir}/modules-load.d</div>
</td>
</tr>
</tbody>
</table>
<p><br><a href=3D"https://gerrit.openbmc.org/c/openbmc/openbmc/+/65313/3/po=
ky/meta/classes-recipe/kernel.bbclass" target=3D"_blank">https://gerrit.ope=
nbmc.org/c/openbmc/openbmc/+/65313/3/poky/meta/classes-recipe/kernel.bbclas=
s</a></p>
<br>Once these were removed we started hitting this failure over in OpenBMC=
.
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185414): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185414" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185414</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100503145/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100503145/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000000e471e0601f3b85c--

