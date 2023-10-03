Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D01E7AD47
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 13:32:50 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.108344.1696339962499134442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 06:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ikKkYnVE;
 spf=pass (domain: smile.fr, ip: 209.85.218.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9ad810be221so170547466b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696339961; x=1696944761; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D9SdfbEmlm2SOwk7L488Ug1PzzHieBKEXQ6zqR/4du4=;
        b=ikKkYnVEzCYB0R9RQiu8RGJT9ix23/1wmBXCBnDlP2poOiwYZ+ggXghxyv0/GfJVlh
         3BIDFYJIKEmdMoUJSqYyLC8vlAnh9bOcELcIEAYg6/gkefQQ8jZtXmkynG4mKgqSdB6h
         SKqc20ZLb09F8cyldCwWBFjySi+9IgYSuaHfr5FqGiVrbztt+QLiMgKrEjyFLpS2+d4P
         r4e1oxhjX7/hq5Iki5UgyD2MyMDRHSoky3qXrLNsw1vgJ5YpltwDRK5c8uHvmgbWT+lv
         OUnFJt6l+euSweWrMsnbOxXloJWyHxNXkwC7zQMvfBL+NbYyAN4q/64L9KiR/FQj18Xm
         nnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696339961; x=1696944761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9SdfbEmlm2SOwk7L488Ug1PzzHieBKEXQ6zqR/4du4=;
        b=nBvUPs6l5GVQTyvq+JxwRya99GkAKRrxCo8WrbKnmpLkZ37DsVPd8kjLaXX6CVTE46
         1sgPxQWNXq6U77ju/UnWHRekUN55JL1gcE1ry1aLhG9/cIesFiBbx/tdmcsC/cO+TqXM
         PUgsa3lhrxywNblLUWAkibQOPWURdv4Qs3GXs4T1YEtmq7nCNLBzrdwY1R68lPwmyUaD
         vUtp52KB71lqvi5viBXG3geEfn7dY9aRf/zKqzqI2BNORNx1kVNt1nhynGcbqBxvB1nb
         kWuPd5ksH7UMIGx+Ie0cV6BYso8axXxbIUe2ai8BPnwW9o8LlM1J0kU/GGiLGIrtOH+f
         iAPg==
X-Gm-Message-State: AOJu0YwmYlLA8r5qjjEIdYLjQGrjYCdtpLoTpFlWeoCaIa9Nf+HyyWg1
	9AopDrsR7wJk1QGc8+mFMjycun/0+v8yGzchZPZ3XHMOZVnvgyiz
X-Google-Smtp-Source: AGHT+IFOfSGVVfhviToOgoBNHRy55FJEX2B4DxzGxxYBKhdfNwgndxOfLzb9ezocfKvXnClkXi2WYRhpkFCwanviHwk=
X-Received: by 2002:a17:906:9c9:b0:9a5:c4c0:2d8a with SMTP id
 r9-20020a17090609c900b009a5c4c02d8amr12114545eje.24.1696339960661; Tue, 03
 Oct 2023 06:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230929220503.3169745-1-yoann.congal@smile.fr>
In-Reply-To: <20230929220503.3169745-1-yoann.congal@smile.fr>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Tue, 3 Oct 2023 15:32:14 +0200
Message-ID: <CAMSfU+58k+Zc+4UpJuxuVOG1XzErSBn76=8Fxk-fMfnnzmVw3w@mail.gmail.com>
Subject: Re: [PATCH 0/4] QA, ptest: Add unimplemented-ptest checks
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000c61c420606cfec82"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 13:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188637

--000000000000c61c420606cfec82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le sam. 30 sept. 2023 =C3=A0 00:05, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> To increase ptest coverage we can check if the sources of a recipe looks
> like
> it contains unittest and warn the user that a test may be implemented
> there.
>
> This series provide the check infrastructure as a package QA check and
> some checks for :
> python pytest, perl Test::, meson, cmake, autotools-based tests... as wel=
l
> as
> the naive check of "Is there a test/ directory in the sources?" which wor=
k
> surprisingly well.
>
> J=C3=A9r=C3=A9my Rosen (4):
>   QA, ptest: Add unimplemented-ptest infrastructure
>   QA, ptest: Detect python and perl based tests
>   QA, ptest: Detect build-system test harnesses
>   QA, ptest: Add a naive heuristic to detect test subdirectories
>
>  meta/classes-global/insane.bbclass | 54 ++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>

Following on IRC discussion and some more internal testing :I will send a
v2 with
* correct shortlog commit tag (s/QA, ptest/insane/)
* a fix for source package containing symlink loops (e.g. md5deep)

Currently, this check find
* 309 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp
* 827 unimplemented ptest in meta-openembedded
Full list :
https://gist.githubusercontent.com/ycongal-smile/0969e92aec1ca37e61b6cdbcaf=
1f6885/raw/b1be8a5b576e144b6563f5481d31b32de9b22368/gistfile1.txt

Regards,
--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000c61c420606cfec82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 30 sept. 2023 =C3=A0=
=C2=A000:05, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" targ=
et=3D"_blank">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">To increase ptest coverage =
we can check if the sources of a recipe looks like<br>
it contains unittest and warn the user that a test may be implemented there=
.<br>
<br>
This series provide the check infrastructure as a package QA check and some=
 checks for :<br>
python pytest, perl Test::, meson, cmake, autotools-based tests... as well =
as<br>
the naive check of &quot;Is there a test/ directory in the sources?&quot; w=
hich work<br>
surprisingly well.<br>
<br>
J=C3=A9r=C3=A9my Rosen (4):<br>
=C2=A0 QA, ptest: Add unimplemented-ptest infrastructure<br>
=C2=A0 QA, ptest: Detect python and perl based tests<br>
=C2=A0 QA, ptest: Detect build-system test harnesses<br>
=C2=A0 QA, ptest: Add a naive heuristic to detect test subdirectories<br>
<br>
=C2=A0meta/classes-global/insane.bbclass | 54 +++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 54 insertions(+)<br></blockquote><div><br></div><div>=
Following on IRC discussion and some more internal testing :I will send a v=
2 with</div><div>* correct shortlog commit tag (s/QA, ptest/insane/)</div><=
div>* a fix for source package containing symlink loops (e.g. md5deep)</div=
><div><br></div><div>Currently, this check find</div><div>* 309 unimplement=
ed ptest in oe-core/meta-poky/meta-yocto-bsp<br></div><div>* 827 unimplemen=
ted ptest in meta-openembedded</div><div>Full list : <a href=3D"https://gis=
t.githubusercontent.com/ycongal-smile/0969e92aec1ca37e61b6cdbcaf1f6885/raw/=
b1be8a5b576e144b6563f5481d31b32de9b22368/gistfile1.txt" target=3D"_blank">h=
ttps://gist.githubusercontent.com/ycongal-smile/0969e92aec1ca37e61b6cdbcaf1=
f6885/raw/b1be8a5b576e144b6563f5481d31b32de9b22368/gistfile1.txt</a></div><=
div><br></div>Regards,</div><span class=3D"gmail_signature_prefix">-- </spa=
n><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><font fac=
e=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"Raleway, regul=
ar">Smile ECS - Tech expert<br></font></div></div></div>
</div>

--000000000000c61c420606cfec82--

