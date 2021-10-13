Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81261C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 20:32:15 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web08.294.1634157134488202312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 13:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XLnU9f9p;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id z24so3818412qtv.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 13:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+0KBRnZD1QLmmClYuSzptllDSZb2dn7ziWUn3+Ovc60=;
        b=XLnU9f9pf8muAJpkSgLQfuPwYc/Zi3CFc+34d39yQsNyo7oQE3FyAd8UMtkPHtCFnM
         GTaIEjCeiDjNtzQsk6HvkK2ze3fKd+P9+GNAUgiZsLnC1QZ98yL3RZ4S+NgQydlgb6yO
         QhcSSX/MyWrE73b5e0dWjDo2aTvRmyCYICUzrhYaZf12OqBqa7rkIbt0XClntonUotED
         w8kmILW1ZBgr68NOSyS1aiOjF7UR4KIub1eyHPLVpMHIUwbENSEKzA3tMyPAC1Z9y2fa
         xhUzPi3p0rv+yZzhRCt9tcjrr7fjxxmMj5MOeJJX7/+rfVXX2ko6I2lHWzVzZt3CzmFa
         D+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+0KBRnZD1QLmmClYuSzptllDSZb2dn7ziWUn3+Ovc60=;
        b=N64ue/spbdK9utsUh9NKzWnaOf9xgqeC+DM7pMxETRibwx1f1+8fFH2oI0Vtiy21m6
         mbfLBmqwIes6UEKJX7WJxjh+XLvkObLLLGBVBkzd7kBJC/x9AMs8c/bOypTCNoCC3zsM
         TTT5Lpob44p5Vl22wz/ObGQFf6UnvXYwEgY0JRUlA1CotCNR/rQNFbfPx7F71zGvPb3o
         Kj7F/y/fo4RMFvNCldw0p0Ji+Dg9raAuWUfI4NW+EY3xW7aBhWytu7wLoHWHeKusNvwh
         G8e2Nu9RNcuErs6XvaDF8ej+M7gS87NWTi6L23/kWTSQ73oW/yyLKihAYh9haVILEUtb
         CdbA==
X-Gm-Message-State: AOAM532450lv8eSKo331Its9XPQ1jBHx2FQAJxsli4/UWUAxLKa+/ElB
	gGeyFsAfF4VqftnZWRFY3JYfyAVt+HNfuH7CP/uounk8ulw=
X-Google-Smtp-Source: 
 ABdhPJy5TWtShUZhAM5/670zjP4CHGjqZoxPwsX9ITW3Y8FU5FtFxf/kFoM1y/4Cr8PK5MtRCZTjQz2zcFJ/+msOsdU=
X-Received: by 2002:ac8:1e0b:: with SMTP id n11mr1752617qtl.274.1634157133586;
 Wed, 13 Oct 2021 13:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <YWbn1yCqxTGskn+s@mcrowe.com>
In-Reply-To: <YWbn1yCqxTGskn+s@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Oct 2021 13:32:03 -0700
Message-ID: 
 <CAMKF1soqvKJyAcTykqAfP1aYtXsPq6FtFo6cUo-mi2-OSqcESg@mail.gmail.com>
Subject: Re: [OE-core] Installing licence files for static/header-only
 libraries into images
To: mac@mcrowe.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007465e005ce41dbe3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 20:32:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156923

--0000000000007465e005ce41dbe3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 7:06 AM Mike Crowe via lists.openembedded.org <mac=
=3D
mcrowe.com@lists.openembedded.org> wrote:

> We're using:
>
>  EXTRA_IMAGE_FEATURES +=3D "lic-pkgs"
>
> to install the corresponding licence packages for all the packages
> installed in our image. This works very well for binaries and dynamic
> libraries. However, I've recently noticed that it doesn't install licence
> files for any static or header-only libraries used during the build.
>
> The corresponding -lic packages are built for such packages, but nothing
> causes them to be installed since they are not runtime dependencies of
> anything that is installed.
>
> I thought that I could solve this problem by something like:
>
> def lic_deps(d):
>     deps =3D []
>     for f in d.getVar('DEPENDS').split():
>         if not f.endswith("-native") and not f.startswith("virtual/"):
>             deps.append(f + "-lic")
>     return ' '.join(deps)


It will work but in some cases it will be do more than what=E2=80=99s neede=
d
Build time dependencies are not necessarily also runtime dependencies eg it
could be using a tool from that package during build

>
>
> RDEPENDS_${PN}-lic +=3D "${@lic_deps(d)}"
>
> but this fails for recipes that use PROVIDES or other shenanigans which
> means that just appending -lic to whatever is in DEPENDS is insufficient.
>
> For the time being I can add the required packages by hand, but this is
> brittle in the longer term.
>
> Is there a better way to solve this problem?
>
> Thanks.
>
> Mike.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156909):
> https://lists.openembedded.org/g/openembedded-core/message/156909
> Mute This Topic: https://lists.openembedded.org/mt/86288556/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007465e005ce41dbe3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 13, 2021 at 7:06 AM Mike Crowe via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;mac=3D<a href=
=3D"mailto:mcrowe.com@lists.openembedded.org">mcrowe.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We&#39;re using=
:<br>
<br>
=C2=A0EXTRA_IMAGE_FEATURES +=3D &quot;lic-pkgs&quot;<br>
<br>
to install the corresponding licence packages for all the packages<br>
installed in our image. This works very well for binaries and dynamic<br>
libraries. However, I&#39;ve recently noticed that it doesn&#39;t install l=
icence<br>
files for any static or header-only libraries used during the build.<br>
<br>
The corresponding -lic packages are built for such packages, but nothing<br=
>
causes them to be installed since they are not runtime dependencies of<br>
anything that is installed.<br>
<br>
I thought that I could solve this problem by something like:<br>
<br>
def lic_deps(d):<br>
=C2=A0 =C2=A0 deps =3D []<br>
=C2=A0 =C2=A0 for f in d.getVar(&#39;DEPENDS&#39;).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not f.endswith(&quot;-native&quot;) and not =
f.startswith(&quot;virtual/&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.append(f + &quot;-lic&quot;)=
<br>
=C2=A0 =C2=A0 return &#39; &#39;.join(deps)</blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto">It will work but in some cases it will be do mor=
e than what=E2=80=99s needed=C2=A0</div><div dir=3D"auto">Build time depend=
encies are not necessarily also runtime dependencies eg it could be using a=
 tool from that package during build=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex" dir=3D"auto"><br>
<br>
RDEPENDS_${PN}-lic +=3D &quot;${@lic_deps(d)}&quot;<br>
<br>
but this fails for recipes that use PROVIDES or other shenanigans which<br>
means that just appending -lic to whatever is in DEPENDS is insufficient.<b=
r>
<br>
For the time being I can add the required packages by hand, but this is<br>
brittle in the longer term.<br>
<br>
Is there a better way to solve this problem?<br>
<br>
Thanks.<br>
<br>
Mike.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156909): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156909" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156909</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86288556/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86288556/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007465e005ce41dbe3--

