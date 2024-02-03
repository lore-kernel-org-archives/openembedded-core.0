Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC67EC4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 00:11:57 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.8179.1706919109100675761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 16:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CI3VCtPH;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6f6d10ea9so703968276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706919108; x=1707523908; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V448SRcxxkIja1qJWkj0hQWj44svqRdfMXHx4DtYkY8=;
        b=CI3VCtPHk4+Zq7AcDKhd7VBB+w/azB8Psj+QuLtjWwWkFIsWijitO5tgn1y4WK9tll
         EbgV22GqepkPEk0H9rFuTn3D/NKUnKhMF1P2GdsBZl4OnbxLA82dmC6llXQUtHU9kFmi
         Mp2OjuJQgQK7jrPvvZ1rjoXLt0QVF7wvVNAi3DIk6z5ZoCrWc7R2SyWmSSGGX+XNODjo
         4iD0FQlQFUrnE39tHayfYmqoPLqGLkVvLXtnylJZpza3/lilYtfOPn3h4BvwHd2DxDIC
         +U1J4MGFgxRVgewNL2iNnlulCpVmovBWar2ut6Tr1MWD4YVur4sEnnIku0A2lSaj70Ey
         Y/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706919108; x=1707523908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V448SRcxxkIja1qJWkj0hQWj44svqRdfMXHx4DtYkY8=;
        b=qS47A62n++pJzz9ByqOFHGqwjtRqryCo2Z5/io/HOAIEh54EQu/TMvSk2abHJubie1
         QOhwb6jmVxkPNQShbVuOghpLUnT8euEYozvIADBI3w/N06uTZvu7U/GNT4ucnVSocdtH
         9g2PN3Vr8U1GXzhGIUVn+vWd0JDCHKjH09tr5Jfl4EBw8+SBOM335fTMvoZIocjEK5U1
         dsU3MfqURlEY6Z3qzYZzrafXl0I10IxLWCfbvv1U2QtMPqBWb4E1Gl8Ji/CfIHVmgL9K
         1B5G3EoDHpikiGmm3m1BniP2Hs67BHb17m37CLhYq5BC6cafA/zHW9/ySm/NPutxwZTO
         qdoQ==
X-Gm-Message-State: AOJu0YwMeOARdEfw5anMqU5MvN530UWryyRvAzOKpq8mVLfm26Kj2RAC
	mnt+nN2TyZWAd5UwzYuW0AnkHB/6pVupKfgtyQJZl8Qncc2T7IfYb00snBabW9DkqqgGyxpGXWO
	X7bXBEeKiTidyS45At19kGwjpQMQ=
X-Google-Smtp-Source: AGHT+IFuX41hTIDMv3m8upfNHqvLsgIYfd/bHU3XBFfLfMDvaRa0jEBCY7JdR58ktEX7otV3KwG9HQMe3HWPDBq3PGU=
X-Received: by 2002:a05:6902:2312:b0:dc6:f0ac:6b6f with SMTP id
 do18-20020a056902231200b00dc6f0ac6b6fmr3136065ybb.51.1706919107909; Fri, 02
 Feb 2024 16:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20240105165554.1401517-1-tim.orling@konsulko.com> <2024020223125655b936ef@mail.local>
In-Reply-To: <2024020223125655b936ef@mail.local>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 2 Feb 2024 16:11:37 -0800
Message-ID: <CANx9H-BQKq-Jw6nnmXgaxrgUMZxM49Sk7WiU08D=bRC061brgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 9.5p1 -> 9.6p1
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Tim Orling <tim.orling@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000016962b06106f13b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 00:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194821

--00000000000016962b06106f13b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 3:12=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/5751/s=
teps/13/logs/stdio
>

Thank you, Alexandre. I=E2=80=99ll try to find a fix for this mips issue. I=
f anyone
else stumbles on it first, I=E2=80=99m happy to take guidance.

>
> On 05/01/2024 08:55:55-0800, Tim Orling wrote:
> > * Relocate Upstream-Status in
> 0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
> >   so it will not throw an error in AUH
> >
> > https://www.openssh.com/txt/release-9.6
> > https://github.com/openssh/openssh-portable/compare/V_9_5_P1...V_9_6_P1
> >
> > https://nvd.nist.gov/vuln/detail/CVE-2023-48795
> > https://nvd.nist.gov/vuln/detail/CVE-2023-51384
> > https://nvd.nist.gov/vuln/detail/CVE-2023-51385
> >
> > CVE: CVE-2023-48795
> > CVE: CVE-2023-51384
> > CVE: CVE-2023-51385
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> > All ptests passed on core-image-ptest-openssh on qemux86-64
> >
> >  ...regress-banner.sh-log-input-and-output-files-on-erro.patch | 4 ++--
> >  .../openssh/{openssh_9.5p1.bb =3D> openssh_9.6p1.bb}            | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb =3D>
> openssh_9.6p1.bb} (98%)
> >
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> > index 2c14014fed8..8763f30f4b3 100644
> > ---
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> > +++
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> > @@ -34,13 +34,13 @@ return value: 1
> >
> >  See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178
> >
> > +Upstream-Status: Denied [
> https://github.com/openssh/openssh-portable/pull/437]
> > +
> >  Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >  ---
> >   regress/banner.sh | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > -Upstream-Status: Denied [
> https://github.com/openssh/openssh-portable/pull/437]
> > -
> >  diff --git a/regress/banner.sh b/regress/banner.sh
> >  index a84feb5a..de84957a 100644
> >  --- a/regress/banner.sh
> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > similarity index 98%
> > rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> > rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > index bbb8fb091ad..fa44eb0bd4e 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > @@ -28,7 +28,7 @@ SRC_URI =3D "
> http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
> >
>  file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
> >
>  file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
> >             "
> > -SRC_URI[sha256sum] =3D
> "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
> > +SRC_URI[sha256sum] =3D
> "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
> >
> >  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is
> specific to OpenSSH with the pam opie which we don't build/use here."
> >
> > --
> > 2.34.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193372):
> https://lists.openembedded.org/g/openembedded-core/message/193372
> > Mute This Topic: https://lists.openembedded.org/mt/103546397/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000016962b06106f13b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Feb 2, 2024 at 3:12=E2=80=AFPM Alexandre Belloni &l=
t;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootli=
n.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddin=
g-left:1ex;border-left-color:rgb(204,204,204)"><a href=3D"https://autobuild=
er.yoctoproject.org/typhoon/#/builders/102/builds/5751/steps/13/logs/stdio"=
 rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject.org/=
typhoon/#/builders/102/builds/5751/steps/13/logs/stdio</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you, Alexa=
ndre. I=E2=80=99ll try to find a fix for this mips issue. If anyone else st=
umbles on it first, I=E2=80=99m happy to take guidance.</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)"><br>
On 05/01/2024 08:55:55-0800, Tim Orling wrote:<br>
&gt; * Relocate Upstream-Status in 0001-regress-banner.sh-log-input-and-out=
put-files-on-erro.patch<br>
&gt;=C2=A0 =C2=A0so it will not throw an error in AUH<br>
&gt; <br>
&gt; <a href=3D"https://www.openssh.com/txt/release-9.6" rel=3D"noreferrer"=
 target=3D"_blank">https://www.openssh.com/txt/release-9.6</a><br>
&gt; <a href=3D"https://github.com/openssh/openssh-portable/compare/V_9_5_P=
1...V_9_6_P1" rel=3D"noreferrer" target=3D"_blank">https://github.com/opens=
sh/openssh-portable/compare/V_9_5_P1...V_9_6_P1</a><br>
&gt; <br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-48795" rel=3D"nor=
eferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-48795<=
/a><br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-51384" rel=3D"nor=
eferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-51384<=
/a><br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-51385" rel=3D"nor=
eferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-51385<=
/a><br>
&gt; <br>
&gt; CVE: CVE-2023-48795<br>
&gt; CVE: CVE-2023-51384<br>
&gt; CVE: CVE-2023-51385<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt; All ptests passed on core-image-ptest-openssh on qemux86-64<br>
&gt; <br>
&gt;=C2=A0 ...regress-banner.sh-log-input-and-output-files-on-erro.patch | =
4 ++--<br>
&gt;=C2=A0 .../openssh/{<a href=3D"http://openssh_9.5p1.bb" rel=3D"noreferr=
er" target=3D"_blank">openssh_9.5p1.bb</a> =3D&gt; <a href=3D"http://openss=
h_9.6p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-connectivity/openssh/{<a href=3D"http://open=
ssh_9.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a> =3D=
&gt; <a href=3D"http://openssh_9.6p1.bb" rel=3D"noreferrer" target=3D"_blan=
k">openssh_9.6p1.bb</a>} (98%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-ba=
nner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivit=
y/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro=
.patch<br>
&gt; index 2c14014fed8..8763f30f4b3 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh=
-log-input-and-output-files-on-erro.patch<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh=
-log-input-and-output-files-on-erro.patch<br>
&gt; @@ -34,13 +34,13 @@ return value: 1<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 See: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D15178" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D15178</a><br>
&gt;=C2=A0 <br>
&gt; +Upstream-Status: Denied [<a href=3D"https://github.com/openssh/openss=
h-portable/pull/437" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openssh/openssh-portable/pull/437</a>]<br>
&gt; +<br>
&gt;=C2=A0 Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@l=
inaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0regress/banner.sh | 4 +++-<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 <br>
&gt; -Upstream-Status: Denied [<a href=3D"https://github.com/openssh/openss=
h-portable/pull/437" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openssh/openssh-portable/pull/437</a>]<br>
&gt; -<br>
&gt;=C2=A0 diff --git a/regress/banner.sh b/regress/banner.sh<br>
&gt;=C2=A0 index a84feb5a..de84957a 100644<br>
&gt;=C2=A0 --- a/regress/banner.sh<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://opens=
sh_9.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a> b/me=
ta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1.bb" rel=3D"=
noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; similarity index 98%<br>
&gt; rename from meta/recipes-connectivity/openssh/<a href=3D"http://openss=
h_9.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a><br>
&gt; rename to meta/recipes-connectivity/openssh/<a href=3D"http://openssh_=
9.6p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; index bbb8fb091ad..fa44eb0bd4e 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.5p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; @@ -28,7 +28,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.org/=
pub/OpenBSD/OpenSSH/portable/openssh-$%7BPV%7D.tar" rel=3D"noreferrer" targ=
et=3D"_blank">http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$=
{PV}.tar</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-regress-ban=
ner.sh-log-input-and-output-files-on-erro.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-systemd-Add=
-optional-support-for-systemd-sd_notify.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;f026e7b79ba7fb540f75182af96dc8a8f1db395f=
922bbc9f6ca603672686086b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;910211c07255a8c5ad654391b40ee59800710dd8=
119dd5362de09385aa7a777c&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 CVE_STATUS[CVE-2007-2768] =3D &quot;not-applicable-config: This =
CVE is specific to OpenSSH with the pam opie which we don&#39;t build/use h=
ere.&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#193372): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/193372" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/193372</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10354639=
7/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103546397/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000016962b06106f13b8--

