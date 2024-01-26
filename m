Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8569C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 16:24:37 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.2212.1706286274316052297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 08:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m6dA0SZt;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7d2e1a0337bso245763241.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 08:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706286273; x=1706891073; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e2U++6dWZAYjnTPOeQ1PB3x35Y/zshfWCVkJ/jq+DkY=;
        b=m6dA0SZtmRLgbEIpV41zgwtlgEZVm0YG5y1nTG8dFJFbbsIc1cPZljyboKWnrtNfE9
         2gg0Bakx6n/UaddSfy99cW3Jn5mrpV9FtlieP2cYdzJEgdTNZEpI98LI+Ci1+PA7JQn0
         JlL9jnxrQ85fGLMnXXgPtpY8/U+6k8RKrvaOdsWt/wLqZrQKg+l4JMzA923Fw4VNO2/y
         HsarljiloQtpk9K8aA2MmXb0adjF+5Z+IHwSwaEaDOWc7GjJhjbp9XJyYE5tGptdboIb
         xT3iU391chz7DVvqAHCSP1/SSa/NJKuIAduoNiUjBTPABtmcUMgICzsI403OGCgUsknV
         RA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706286273; x=1706891073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2U++6dWZAYjnTPOeQ1PB3x35Y/zshfWCVkJ/jq+DkY=;
        b=XJXIlPqqv4iRuRBO+hgsMM8YafSopD+FIhCTxR2WVVR9hvFEHVNqVvY5x7x4E6lBcP
         B33MFZ3TbnDCQqN9H0P7oObj9kIxiKnlkYyQXrufIPWQBWIvEleefNgNewfHzW7WlFKn
         YOzEME4VdIZ5M8HJD1+EzKCeUGOz4gkrx6mgJCAqBDsXw6EcEl1yTGdF1OyItFY8VeCs
         aQpJ44MgwzwHliMxGLeDMB888LswoOZK9Zab/TplXLnW9S8x5bbDaM+yd1CoOeUhJBfx
         r+Ad7690/Sz+L/Gw3kSpfe+RahF7qCQeZqU85gRobD5uGlA5dl0fjgE/ijVGVONwgVjr
         U5nQ==
X-Gm-Message-State: AOJu0Yz0gyS7eXqkjejQjqCkt10lOgNA2dQsheYvpegucgM8nJMvgHWY
	b5C23DpAgQdYuNmr06gPTJv/YDl15gGEoRkDdy7Gkfi91/h0sRwECRJ/GitchNwzFK0dPmzpFvh
	JToU74Xzmtfk1b8ZRFshJHEOKK/A=
X-Google-Smtp-Source: AGHT+IGUUnORHoCyDhTdiYNLT41wRFR2hKhdDAxVnLKj01SIkbw44IWsG/80n41mwavnxCatXT61uBmbY3JnWOEimjA=
X-Received: by 2002:a05:6122:1350:b0:4b7:8e5f:7782 with SMTP id
 f16-20020a056122135000b004b78e5f7782mr9376vkp.8.1706286273242; Fri, 26 Jan
 2024 08:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20240126160555.66586-1-jose.quaresma@foundries.io> <CANNYZj-geP-RWJqkdo=_gaO-44SJ0YHnyVoyNN2n3jybohQYWg@mail.gmail.com>
In-Reply-To: <CANNYZj-geP-RWJqkdo=_gaO-44SJ0YHnyVoyNN2n3jybohQYWg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 26 Jan 2024 16:24:22 +0000
Message-ID: <CANPvuR=YerzxFTmF4Ei7pwpL2jGY0xc_Gewy=Nc_-FX+7J6xDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: update 1.20.12 -> 1.20.13
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000033b404060fdbbb60"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 16:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194395

--00000000000033b404060fdbbb60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu (sexta, 26/01/2024 =C3=
=A0(s)
16:10):

> Hello Jose,
>
> there was a 1.21 update earlier, what happened to that?
>

Hi Alex,

I know and I've already done some work on this but unfortunately there are
runtime problems.
https://lists.openembedded.org/g/openembedded-core/message/191943

The patch 0005-cmd-dist-separate-host-and-target-builds.patch has some
problems and I need to spend some more time with it.

It would be good to also reduce the number of patches we have here,
some of which are quite invasive, to facilitate these updates.
When I have a working version using golang master I will try to submit some
of the patches we carry.

I would like to take this opportunity to inform than I am not an expert in
golang
nor anything like that, which makes things more difficult and slower.

As long as I can't fix what's missing for 1.21, I'll update the current
version.

Jose


> Alex
>
> On Fri, 26 Jan 2024 at 17:06, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > Upgrade to latest 1.20.x release [1]:
> >
> > $ git log --oneline go1.20.12..go1.20.13
> > a95136a88c (tag: go1.20.13) [release-branch.go1.20] go1.20.13
> > 5c38c04957 [release-branch.go1.20] crypto/tls: align FIPS-only mode wit=
h
> BoringSSL policy
> > 9e4abed39b [release-branch.go1.20] crypto/internal/boring: upgrade
> module to fips-20220613
> > 95afc744a7 [release-branch.go1.20] runtime: put ReadMemStats debug
> assertions behind a double-check mode
> > 8cb86b5f85 [release-branch.go1.20] os/signal: skip nohup tests on darwi=
n
> builders
> > 59ffd3b90d [release-branch.go1.20] os/signal: remove go t.Run from
> TestNohup
> >
> > [1] https://github.com/golang/go/compare/go1.20.12...go1.20.13
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/recipes-devtools/go/{go-1.20.12.inc =3D> go-1.20.13.inc} | 2 +-
> >  ...binary-native_1.20.12.bb =3D> go-binary-native_1.20.13.bb} | 6 +++-=
--
> >  ...oss-canadian_1.20.12.bb =3D> go-cross-canadian_1.20.13.bb} | 0
> >  .../go/{go-cross_1.20.12.bb =3D> go-cross_1.20.13.bb}         | 0
> >  .../go/{go-crosssdk_1.20.12.bb =3D> go-crosssdk_1.20.13.bb}   | 0
> >  .../go/{go-native_1.20.12.bb =3D> go-native_1.20.13.bb}       | 0
> >  .../go/{go-runtime_1.20.12.bb =3D> go-runtime_1.20.13.bb}     | 0
> >  meta/recipes-devtools/go/{go_1.20.12.bb =3D> go_1.20.13.bb}   | 0
> >  8 files changed, 4 insertions(+), 4 deletions(-)
> >  rename meta/recipes-devtools/go/{go-1.20.12.inc =3D> go-1.20.13.inc} (=
89%)
> >  rename meta/recipes-devtools/go/{go-binary-native_1.20.12.bb =3D>
> go-binary-native_1.20.13.bb} (78%)
> >  rename meta/recipes-devtools/go/{go-cross-canadian_1.20.12.bb =3D>
> go-cross-canadian_1.20.13.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-cross_1.20.12.bb =3D>
> go-cross_1.20.13.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-crosssdk_1.20.12.bb =3D>
> go-crosssdk_1.20.13.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-native_1.20.12.bb =3D>
> go-native_1.20.13.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-runtime_1.20.12.bb =3D>
> go-runtime_1.20.13.bb} (100%)
> >  rename meta/recipes-devtools/go/{go_1.20.12.bb =3D> go_1.20.13.bb} (10=
0%)
> >
> > diff --git a/meta/recipes-devtools/go/go-1.20.12.inc
> b/meta/recipes-devtools/go/go-1.20.13.inc
> > similarity index 89%
> > rename from meta/recipes-devtools/go/go-1.20.12.inc
> > rename to meta/recipes-devtools/go/go-1.20.13.inc
> > index 9be56c6707..b6eeb651c9 100644
> > --- a/meta/recipes-devtools/go/go-1.20.12.inc
> > +++ b/meta/recipes-devtools/go/go-1.20.13.inc
> > @@ -15,4 +15,4 @@ SRC_URI +=3D "\
> >
> file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
> >      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch =
\
> >  "
> > -SRC_URI[main.sha256sum] =3D
> "c5bf934751d31c315c1d0bb5fb02296545fa6d08923566f7a5afec81f2ed27d6"
> > +SRC_URI[main.sha256sum] =3D
> "0fe745c530f2f1d67193af3c5ea25246be077989ec5178df266e975f3532449e"
> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> b/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
> > similarity index 78%
> > rename from meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-binary-native_1.20.13.bb
> > index 41db2ada80..d99bab71e1 100644
> > --- a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> > +++ b/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
> > @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
> >
> >  # Checksums available at https://go.dev/dl/
> >  SRC_URI =3D "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;nam=
e=3Dgo_${BUILD_GOTUPLE}
> "
> > -SRC_URI[go_linux_amd64.sha256sum] =3D
> "9c5d48c54dd8b0a3b2ef91b0f92a1190aa01f11d26e98033efa64c46a30bba7b"
> > -SRC_URI[go_linux_arm64.sha256sum] =3D
> "8afe8e3fb6972eaa2179ef0a71678c67f26509fab4f0f67c4b00f4cdfa92dc87"
> > -SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "2ae0ec3736216dfbd7b01ff679842dc1bed365e53a024d522645bcffd01c7328"
> > +SRC_URI[go_linux_amd64.sha256sum] =3D
> "9a9d3dcae2b6a638b1f2e9bd4db08ffb39c10e55d9696914002742d90f0047b5"
> > +SRC_URI[go_linux_arm64.sha256sum] =3D
> "a2d811cef3c4fc77c01195622e637af0c2cf8b3814a95a0920cf2f83b6061d38"
> > +SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "5f632b83323e16f8c6ceb676cd570b3f13f1826e06a81d92985d1301b643a7d3"
> >
> >  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
> >  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
> > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
> > diff --git a/meta/recipes-devtools/go/go-cross_1.20.12.bb
> b/meta/recipes-devtools/go/go-cross_1.20.13.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-cross_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-cross_1.20.13.bb
> > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
> > diff --git a/meta/recipes-devtools/go/go-native_1.20.12.bb
> b/meta/recipes-devtools/go/go-native_1.20.13.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-native_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-native_1.20.13.bb
> > diff --git a/meta/recipes-devtools/go/go-runtime_1.20.12.bb
> b/meta/recipes-devtools/go/go-runtime_1.20.13.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-runtime_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-runtime_1.20.13.bb
> > diff --git a/meta/recipes-devtools/go/go_1.20.12.bb
> b/meta/recipes-devtools/go/go_1.20.13.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go_1.20.12.bb
> > rename to meta/recipes-devtools/go/go_1.20.13.bb
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194392):
> https://lists.openembedded.org/g/openembedded-core/message/194392
> > Mute This Topic: https://lists.openembedded.org/mt/103978924/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000033b404060fdbbb60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu (sexta, =
26/01/2024 =C3=A0(s) 16:10):<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hello Jose,<br>
<br>
there was a 1.21 update earlier, what happened to that?<br></blockquote><di=
v><br></div><div>Hi Alex,<br><br>I know and I&#39;ve already done some work=
 on this but unfortunately there are runtime problems.<br><a href=3D"https:=
//lists.openembedded.org/g/openembedded-core/message/191943">https://lists.=
openembedded.org/g/openembedded-core/message/191943</a></div><div><br>The p=
atch=C2=A0<font color=3D"#333333" face=3D"Helvetica Neue, Helvetica, Arial,=
 sans-serif"><span style=3D"font-size:14px">0005-cmd-dist-separate-host-and=
-target-builds.patch
</span></font>has some problems and I need to spend some more time with it.=
<br><br>It would be good to also reduce the number of patches we have here,=
</div><div>some of which are quite invasive, to facilitate these updates.<b=
r>When I have a working version using golang master I will try to submit so=
me of the patches we carry.<br><br></div><div>I would like to take this opp=
ortunity to inform than I am not an expert in golang</div><div>nor anything=
 like that, which makes things more difficult and slower.<br><br>As long as=
 I can&#39;t fix what&#39;s missing for 1.21, I&#39;ll update the current v=
ersion.<br><br>Jose<br><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Alex<br>
<br>
On Fri, 26 Jan 2024 at 17:06, Jose Quaresma &lt;<a href=3D"mailto:quaresma.=
jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Upgrade to latest 1.20.x release [1]:<br>
&gt;<br>
&gt; $ git log --oneline go1.20.12..go1.20.13<br>
&gt; a95136a88c (tag: go1.20.13) [release-branch.go1.20] go1.20.13<br>
&gt; 5c38c04957 [release-branch.go1.20] crypto/tls: align FIPS-only mode wi=
th BoringSSL policy<br>
&gt; 9e4abed39b [release-branch.go1.20] crypto/internal/boring: upgrade mod=
ule to fips-20220613<br>
&gt; 95afc744a7 [release-branch.go1.20] runtime: put ReadMemStats debug ass=
ertions behind a double-check mode<br>
&gt; 8cb86b5f85 [release-branch.go1.20] os/signal: skip nohup tests on darw=
in builders<br>
&gt; 59ffd3b90d [release-branch.go1.20] os/signal: remove go t.Run from Tes=
tNohup<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/golang/go/compare/go1.20.12...go1.20=
.13" rel=3D"noreferrer" target=3D"_blank">https://github.com/golang/go/comp=
are/go1.20.12...go1.20.13</a><br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/go/{go-1.20.12.inc =3D&gt; go-1.20.13.inc}=
 | 2 +-<br>
&gt;=C2=A0 ...<a href=3D"http://binary-native_1.20.12.bb" rel=3D"noreferrer=
" target=3D"_blank">binary-native_1.20.12.bb</a> =3D&gt; <a href=3D"http://=
go-binary-native_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-binary=
-native_1.20.13.bb</a>} | 6 +++---<br>
&gt;=C2=A0 ...<a href=3D"http://oss-canadian_1.20.12.bb" rel=3D"noreferrer"=
 target=3D"_blank">oss-canadian_1.20.12.bb</a> =3D&gt; <a href=3D"http://go=
-cross-canadian_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-c=
anadian_1.20.13.bb</a>} | 0<br>
&gt;=C2=A0 .../go/{<a href=3D"http://go-cross_1.20.12.bb" rel=3D"noreferrer=
" target=3D"_blank">go-cross_1.20.12.bb</a> =3D&gt; <a href=3D"http://go-cr=
oss_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.13.bb</a=
>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 .../go/{<a href=3D"http://go-crosssdk_1.20.12.bb" rel=3D"norefer=
rer" target=3D"_blank">go-crosssdk_1.20.12.bb</a> =3D&gt; <a href=3D"http:/=
/go-crosssdk_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1=
.20.13.bb</a>}=C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 .../go/{<a href=3D"http://go-native_1.20.12.bb" rel=3D"noreferre=
r" target=3D"_blank">go-native_1.20.12.bb</a> =3D&gt; <a href=3D"http://go-=
native_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.13.b=
b</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 .../go/{<a href=3D"http://go-runtime_1.20.12.bb" rel=3D"noreferr=
er" target=3D"_blank">go-runtime_1.20.12.bb</a> =3D&gt; <a href=3D"http://g=
o-runtime_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.=
13.bb</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 meta/recipes-devtools/go/{<a href=3D"http://go_1.20.12.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a> =3D&gt; <a href=3D"http=
://go_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go_1.20.13.bb</a>}=
=C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 8 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.20.12.inc =3D&gt; go-1.20.=
13.inc} (89%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-nat=
ive_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.=
12.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.20.13.bb" rel=3D"nor=
eferrer" target=3D"_blank">go-binary-native_1.20.13.bb</a>} (78%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-cana=
dian_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.2=
0.12.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.20.13.bb" rel=3D"=
noreferrer" target=3D"_blank">go-cross-canadian_1.20.13.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.20=
.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.12.bb</a> =3D&gt=
; <a href=3D"http://go-cross_1.20.13.bb" rel=3D"noreferrer" target=3D"_blan=
k">go-cross_1.20.13.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1=
.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.12.bb</a> =
=3D&gt; <a href=3D"http://go-crosssdk_1.20.13.bb" rel=3D"noreferrer" target=
=3D"_blank">go-crosssdk_1.20.13.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-native_1.2=
0.12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.12.bb</a> =3D&=
gt; <a href=3D"http://go-native_1.20.13.bb" rel=3D"noreferrer" target=3D"_b=
lank">go-native_1.20.13.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.=
20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.12.bb</a> =
=3D&gt; <a href=3D"http://go-runtime_1.20.13.bb" rel=3D"noreferrer" target=
=3D"_blank">go-runtime_1.20.13.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go_1.20.12.bb=
" rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a> =3D&gt; <a href=3D=
"http://go_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go_1.20.13.bb</=
a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.20.12.inc b/meta/recipes-de=
vtools/go/go-1.20.13.inc<br>
&gt; similarity index 89%<br>
&gt; rename from meta/recipes-devtools/go/go-1.20.12.inc<br>
&gt; rename to meta/recipes-devtools/go/go-1.20.13.inc<br>
&gt; index 9be56c6707..b6eeb651c9 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.20.12.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.20.13.inc<br>
&gt; @@ -15,4 +15,4 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0008-src-cmd-dist-buildgo.go-do-not-hardcod=
e-host-compile.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0009-go-Filter-build-paths-on-staticly-link=
ed-arches.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[main.sha256sum] =3D &quot;c5bf934751d31c315c1d0bb5fb02296545f=
a6d08923566f7a5afec81f2ed27d6&quot;<br>
&gt; +SRC_URI[main.sha256sum] =3D &quot;0fe745c530f2f1d67193af3c5ea25246be0=
77989ec5178df266e975f3532449e&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-nati=
ve_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.1=
2.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.20=
.13.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.13.bb</a=
><br>
&gt; similarity index 78%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-nativ=
e_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.12=
.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-native_=
1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.13.b=
b</a><br>
&gt; index 41db2ada80..d99bab71e1 100644<br>
&gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.20=
.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.12.bb</a=
><br>
&gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.20=
.13.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.13.bb</a=
><br>
&gt; @@ -9,9 +9,9 @@ PROVIDES =3D &quot;go-native&quot;<br>
&gt;<br>
&gt;=C2=A0 # Checksums available at <a href=3D"https://go.dev/dl/" rel=3D"n=
oreferrer" target=3D"_blank">https://go.dev/dl/</a><br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7=
D.$%7BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_GOTUPLE%=
7D" rel=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go${PV}.$=
{BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&quot;<br=
>
&gt; -SRC_URI[go_linux_amd64.sha256sum] =3D &quot;9c5d48c54dd8b0a3b2ef91b0f=
92a1190aa01f11d26e98033efa64c46a30bba7b&quot;<br>
&gt; -SRC_URI[go_linux_arm64.sha256sum] =3D &quot;8afe8e3fb6972eaa2179ef0a7=
1678c67f26509fab4f0f67c4b00f4cdfa92dc87&quot;<br>
&gt; -SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;2ae0ec3736216dfbd7b01ff=
679842dc1bed365e53a024d522645bcffd01c7328&quot;<br>
&gt; +SRC_URI[go_linux_amd64.sha256sum] =3D &quot;9a9d3dcae2b6a638b1f2e9bd4=
db08ffb39c10e55d9696914002742d90f0047b5&quot;<br>
&gt; +SRC_URI[go_linux_arm64.sha256sum] =3D &quot;a2d811cef3c4fc77c01195622=
e637af0c2cf8b3814a95a0920cf2f83b6061d38&quot;<br>
&gt; +SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;5f632b83323e16f8c6ceb67=
6cd570b3f13f1826e06a81d92985d1301b643a7d3&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.org/dl/" =
rel=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.li=
nux&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canad=
ian_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20=
.12.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1=
.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.13.b=
b</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-canadi=
an_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.=
12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian=
_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.13=
.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.20.=
12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.12.bb</a> b/meta/=
recipes-devtools/go/<a href=3D"http://go-cross_1.20.13.bb" rel=3D"noreferre=
r" target=3D"_blank">go-cross_1.20.13.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1.20.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.20.13.=
bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.13.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.=
20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.12.bb</a> b=
/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.20.13.bb" rel=3D"=
noreferrer" target=3D"_blank">go-crosssdk_1.20.13.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.2=
0.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.12.bb</a><br=
>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.20.=
13.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.13.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-native_1.20=
.12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.12.bb</a> b/met=
a/recipes-devtools/go/<a href=3D"http://go-native_1.20.13.bb" rel=3D"norefe=
rrer" target=3D"_blank">go-native_1.20.13.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-native_1.20.=
12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-native_1.20.13=
.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.13.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.2=
0.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.12.bb</a> b/m=
eta/recipes-devtools/go/<a href=3D"http://go-runtime_1.20.13.bb" rel=3D"nor=
eferrer" target=3D"_blank">go-runtime_1.20.13.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.20=
.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.20.1=
3.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.13.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.20.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a> b/meta/recipes-devt=
ools/go/<a href=3D"http://go_1.20.13.bb" rel=3D"noreferrer" target=3D"_blan=
k">go_1.20.13.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go_1.20.12.bb" =
rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go_1.20.13.bb" re=
l=3D"noreferrer" target=3D"_blank">go_1.20.13.bb</a><br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#194392): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/194392" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/194392</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10397892=
4/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103978924/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000033b404060fdbbb60--

