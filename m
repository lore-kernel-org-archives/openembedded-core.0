Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C97C43219
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 15:15:31 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.7639.1667315727523537322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 08:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o/H44aFj;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id kt23so37769022ejc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 08:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvRptFuNB4CdPNh3HISxgpS053C9UFBpOwrQAQBi8PI=;
        b=o/H44aFjUMVAx+qdtU6jHGjAbRzIBxCqLFftHQ2ava+xbDhXg9sjkL+LhecstvzSdo
         xn+zjgBba0okCKqAqqJ1XeckBSL0soFxTnshQtUT7FAaCXuWc1YdeNUteCUYGyB5Drfu
         Ri/WjrHfl+AADr1BBHArAAWrim4Q9JsEjh2Xj/D+QFzRh4hmgEesjaBAL0Bm5qlWHn8V
         HiTO3EFbTtTTBzlSHPuxGABUpJoat4P34Uwbq2DdjwLi5vUVfmeF9mSMDDHYcW5y7L9I
         CCG+Phxs0zCAiAX4CjrQtrwU0ATjbMZM9iRij9oiusEqnAjg7PglvXPlEkcaZG4h/vM7
         q/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvRptFuNB4CdPNh3HISxgpS053C9UFBpOwrQAQBi8PI=;
        b=K/oWNKqRDNZgJCzIx3BaB4+vJcYmeS5g/H1VmAkfUjROofgBa6uMEm+Ptc4cOhIXIM
         2TdSti9I4Kwn5/iIZifD5vCaIJqrW5jBNzJLeCOcjPRXDF09MEgpPnke/HfvrXZLHzzU
         YK2wId32LeFKmUlcPIyWNohjFb3WFlwoFPHz+MKuYSCU3fmclgr9WgCbEcAToARne7GH
         mD8l39ftGkD4KxxEFP5ZFkykHfo9qlclgM7yQAVaI0clTfcAfbzW79pEjuxDGQ+ne9XO
         OiA/CtS/l/fIB8JCC5Q9jnRYynczNCxMdvoItWmDgfG0p00rfgL+2DSUAMsupPskgpRC
         2tsg==
X-Gm-Message-State: ACrzQf0XNuNeDpmPor5sPZUQTrOCblzneNAyBrD99UsjjMSvhTH0jnHI
	oYG/f3kVAmHIL9qu1XKaxNsCHx4eqx5ZvtI+vy8=
X-Google-Smtp-Source: AMsMyM5JGcZeoOx+368OHYhCdNOGWfPCYIgFNyoJkqgy2DICRlMIkdPQC/UddMHw2c9e3cPIqmi//dvRzgpZzl3G+qs=
X-Received: by 2002:a17:907:7704:b0:780:da38:4480 with SMTP id
 kw4-20020a170907770400b00780da384480mr19101266ejc.64.1667315725826; Tue, 01
 Nov 2022 08:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221027132904.1998146-1-narpat.mali@windriver.com>
In-Reply-To: <20221027132904.1998146-1-narpat.mali@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Nov 2022 08:15:14 -0700
Message-ID: <CANx9H-DgkUdfgiDbaPkxNkjcK5n2SHBjMpeMF1Qtra7QwxdJcA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.2.1 -> 1.2.2
To: Narpat Mali <narpat.mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org, archana.polampalli@windriver.com, 
	hari.gpillai@windriver.com, Wang Mingyu <wangmy@fujitsu.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="00000000000090ff2205ec6a3142"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 15:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172362

--00000000000090ff2205ec6a3142
Content-Type: text/plain; charset="UTF-8"

For backporting patches to a stable branch, we need to know that it follows
stable policy of only bug fix and security updates (no new features).

For example:

Released: Thu Jun 30 2022 bug
<https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.1-bug>

   -

   *[bug] [tests]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-7e2f4d669d1bb422b3a0e6b9f7f4b615>

   Various fixes to the test suite in the area of exception message
   rendering to accommodate for variability in Python versions as well as
   Pygments.

   References: #360 <https://github.com/sqlalchemy/mako/issues/360>


misc
<https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.1-misc>

   -

   *[performance]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-ee7d215ad290ddd180e2145efae5b823>

   Optimized some codepaths within the lexer/Python code generation
   process, improving performance for generation of templates prior to their
   being cached. Pull request courtesy Takuto Ikuta.

   References: #361 <https://github.com/sqlalchemy/mako/issues/361>



https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.1




On Thu, Oct 27, 2022 at 6:30 AM Narpat Mali <narpat.mali@windriver.com>
wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> Upstream master commit:
>
> https://git.openembedded.org/openembedded-core/commit/?id=10f9720a7fe1d25efce6a0ea0dec0052bb0f92c1
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  .../python/{python3-mako_1.2.1.bb => python3-mako_1.2.2.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-mako_1.2.1.bb =>
> python3-mako_1.2.2.bb} (85%)
>
> diff --git a/meta/recipes-devtools/python/python3-mako_1.2.1.bb
> b/meta/recipes-devtools/python/python3-mako_1.2.2.bb
> similarity index 85%
> rename from meta/recipes-devtools/python/python3-mako_1.2.1.bb
> rename to meta/recipes-devtools/python/python3-mako_1.2.2.bb
> index 8155c37984..e3774ee621 100644
> --- a/meta/recipes-devtools/python/python3-mako_1.2.1.bb
> +++ b/meta/recipes-devtools/python/python3-mako_1.2.2.bb
> @@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI[sha256sum] =
> "f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffcc146c9de17e717b0307"
> +SRC_URI[sha256sum] =
> "3724869b363ba630a272a5f89f68c070352137b8fd1757650017b7e06fda163f"
>
>  RDEPENDS:${PN} = "${PYTHON_PN}-html \
>                    ${PYTHON_PN}-markupsafe \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172193):
> https://lists.openembedded.org/g/openembedded-core/message/172193
> Mute This Topic: https://lists.openembedded.org/mt/94603766/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000090ff2205ec6a3142
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For backporting patches to a stable branch, we need t=
o know that it follows stable policy of only bug fix and security updates (=
no new features).</div><div><br></div><div>For example:</div><div><br></div=
><div>Released: Thu Jun 30 2022
<h4>bug<a class=3D"gmail-headerlink" href=3D"https://docs.makotemplates.org=
/en/latest/changelog.html#change-1.2.1-bug" title=3D"Permalink to this head=
ing"></a></h4>
<ul class=3D"gmail-simple"><li><p class=3D"gmail-caption" id=3D"gmail-chang=
e-1.2.1-0"><span class=3D"gmail-target" id=3D"gmail-change-7e2f4d669d1bb422=
b3a0e6b9f7f4b615"><strong>[bug] [tests]</strong> <a class=3D"gmail-changelo=
g-reference gmail-headerlink gmail-reference gmail-internal" href=3D"https:=
//docs.makotemplates.org/en/latest/changelog.html#change-7e2f4d669d1bb422b3=
a0e6b9f7f4b615"></a></span></p><p>Various fixes to the test suite in the ar=
ea of exception message rendering
to accommodate for variability in Python versions as well as Pygments.</p>
<p>References: <a class=3D"gmail-reference external" href=3D"https://github=
.com/sqlalchemy/mako/issues/360">#360</a></p>
<p></p>
</li></ul>


<h4>misc<a class=3D"gmail-headerlink" href=3D"https://docs.makotemplates.or=
g/en/latest/changelog.html#change-1.2.1-misc" title=3D"Permalink to this he=
ading"></a></h4>
<ul class=3D"gmail-simple"><li><p class=3D"gmail-caption" id=3D"gmail-chang=
e-1.2.1-1"><span class=3D"gmail-target" id=3D"gmail-change-ee7d215ad290ddd1=
80e2145efae5b823"><strong>[performance]</strong> <a class=3D"gmail-changelo=
g-reference gmail-headerlink gmail-reference gmail-internal" href=3D"https:=
//docs.makotemplates.org/en/latest/changelog.html#change-ee7d215ad290ddd180=
e2145efae5b823"></a></span></p><p>Optimized some codepaths within the lexer=
/Python code generation process,
improving performance for generation of templates prior to their being
cached. Pull request courtesy Takuto Ikuta.</p>
<p>References: <a class=3D"gmail-reference external" href=3D"https://github=
.com/sqlalchemy/mako/issues/361">#361</a></p></li></ul></div><div><br></div=
><div><br></div><div><a href=3D"https://docs.makotemplates.org/en/latest/ch=
angelog.html#change-1.2.1">https://docs.makotemplates.org/en/latest/changel=
og.html#change-1.2.1</a></div><div><br></div><div><br></div><br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct=
 27, 2022 at 6:30 AM Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windrive=
r.com">narpat.mali@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Signed-off-by: Wang Mingyu &lt;<a href=3D"=
mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bo=
otlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
<br>
Upstream master commit:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D10f9=
720a7fe1d25efce6a0ea0dec0052bb0f92c1" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3D10f9720a7fe1d25=
efce6a0ea0dec0052bb0f92c1</a><br>
<br>
Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-mako_1.2.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-mako_1.2.1.bb</a> =3D&gt; <a href=3D"http://py=
thon3-mako_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.=
2.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-mako_1=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.1.bb</a> =3D=
&gt; <a href=3D"http://python3-mako_1.2.2.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-mako_1.2.2.bb</a>} (85%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.1.bb</a> b/me=
ta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.2.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-mako_1.2.2.bb</a><br>
similarity index 85%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.1.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.2.bb</a><br>
index 8155c37984..e3774ee621 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.1.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.2.bb</a><br>
@@ -8,7 +8,7 @@ PYPI_PACKAGE =3D &quot;Mako&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
-SRC_URI[sha256sum] =3D &quot;f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffc=
c146c9de17e717b0307&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3724869b363ba630a272a5f89f68c070352137b8fd175=
7650017b7e06fda163f&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-html \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTH=
ON_PN}-markupsafe \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172193): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172193" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172193</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94603766/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94603766/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000090ff2205ec6a3142--

