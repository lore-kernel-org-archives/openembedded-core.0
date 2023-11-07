Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D729CC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:29:13 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.9312.1699360144020701389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RcNVyTJi;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-507a5f2193bso6030089e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 04:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699360142; x=1699964942; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l8jjcCZqbiYqkoJMp+LDIl12OZUZcNJw674ZOe/qgaw=;
        b=RcNVyTJin5zCyVdPNj66D5pcuMExZQVz0XVNxASKHxJ3GhSLNO9WUIjUbnrEvltWss
         FGVr4mHxFPTbSf5YVkUaa5N0JB4LySwTMXWbConI3EpNfssUX62PC1J3pBeOPovVvAce
         IwMl1QcThnO5P82fasZmOyp2kbD6e6yWRnP37GZt4TQzNcCP6wnLO1KMgfo5+2s8Q1QU
         9rxOhUp4+121mbfiVoMLyMC1wO9SuAfao37i3vlpCFh1XoAY75sQmm/jNbqd4DdqDZ2X
         M8JzeAmqA7aT8M8QkTO+YqFqWkKgwAnKVOIHAlsM004e96Uek5hA7bp7sO5x8jFMBmEK
         QxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699360142; x=1699964942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8jjcCZqbiYqkoJMp+LDIl12OZUZcNJw674ZOe/qgaw=;
        b=AzStzLaDqwye2uGLHZj8q5QhlJUCDFUe6/Wzf67ZutEAY50mwoucpzWLBzDQbAEzVi
         RVlpLxa0t1O5nRbRMETSfRZdZWoxbskGM9VGAydydYQnjgx27WdlchJTb8pzi4gT0x9x
         tuSEusQlGuawF88ZQiybmu4kg2gxcRaTMmHPy7EP0iMvNDI9Lz8TB5tmeGVe7bH9+Qo1
         hbO5+YIBiwoSgC/CPTCtn9NggaBkMG3kUXHh9lHmzwCnFX0kZdvDvQEtL9+5JiSsvqoe
         wKk2A6yy0fYUGOg1xXIM1xayKWFtBeCfQ4OwFSXP1nZaD9S48idvBZqmkMzNRqx1UwmR
         VPCQ==
X-Gm-Message-State: AOJu0Yxa335CtTK5SXZ++X7zudVmkrfRVQ6RlTs5vOPnRosFdirKUpLK
	3M9P9tmG6n3852c7N860NhiPUk0k4fWVrIbH0JY=
X-Google-Smtp-Source: AGHT+IHE7ylaUaPRsGzDt1czPeHIBTIhFFeVqWiP1CNq/QloKLDiE4bu4sozYNMQwaNnKRfJMh+gdMVqBfHaj4HOU3M=
X-Received: by 2002:a05:6512:1085:b0:4fe:b97:e361 with SMTP id
 j5-20020a056512108500b004fe0b97e361mr1126666lfg.18.1699360141744; Tue, 07 Nov
 2023 04:29:01 -0800 (PST)
MIME-Version: 1.0
References: <20231107120129.1314360-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20231107120129.1314360-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Nov 2023 13:28:50 +0100
Message-ID: <CANNYZj82K=_gPAWfPkGm2FXtbJG1-w+cMipSuLJhqoP=0KNa_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/sstatetests: Fix intermitttent
 errors and improve performance
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000981fc606098f1d98"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 12:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190278

--000000000000981fc606098f1d98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks a lot!
=E2=80=94runall didn=E2=80=99t occur to me at all.

Alex

On Tue 7. Nov 2023 at 13.01, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> You could reproduce an error in this test with:
>
> bitbake core-image-minimal
> bitbake tzcode-native -c cleansstate
> oe-selftest -r
> sstatetests.SStatePrintdiff.test_image_minimal_vs_base_do_configure
>
> since tzcode-native isn't needed once tzdata is available and isn't rebui=
lt
> by "bitbake core-image-minimal" if it is missig. tzdata is allarch so if
> tzdata is
> built on an x86 host, a aarch64 build machine would never build
> tzcode-native with
> this set of calls.
>
> Add a --runall option to the initial bitbake invocation to force these
> things to be
> created if they're missing.
>
> This explains why some failures were occurring on the infrastructure. Wit=
h
> that issue
> fixed, drop the hash mode change since I believe this fixes that issue.
> That
> restriction was hurting performance, this should allow sstate reuse for
> the test
> and improve the speed of it.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/sstatetests.py | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py
> b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index a6865a5ba7b..24c96ace08c 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -776,16 +776,15 @@ addtask tmptask2 before do_tmptask1
>                  self.assertEqual(recursecb_count,1)
>
>  class SStatePrintdiff(SStateBase):
> -    # FIXME: OEBasicHash setting is necessary for now as otherwise the
> following error can occur:
> -    # ERROR: Can't find a task we're supposed to have written out? (hash=
:
> e79d70b9c2cc72030c1ce822525510699a1eeb1ddf5986271d3217422244366a)?
> -    # The underlying issue should be investigated and addressed.
>      def run_test_printdiff_changerecipe(self, target, change_recipe,
> change_bbtask, change_content, expected_sametmp_output,
> expected_difftmp_output):
>          self.write_config("""
>  TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> -BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> -        bitbake(target)
> +        # Use runall do_build to ensure any indirect sstate is created,
> e.g. tzcode-native on both x86 and
> +        # aarch64 hosts since only allarch target recipes depend upon it
> and it may not be built otherwise.
> +        # A bitbake -c cleansstate tzcode-native would cause some of
> these tests to error for example.
> +        bitbake("--runall build {}".format(target))
>          bitbake("-S none {}".format(target))
>          bitbake(change_bbtask)
>          self.write_recipeinc(change_recipe, change_content)
> @@ -793,7 +792,6 @@ BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>
>          self.write_config("""
>  TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> -BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
>          result_difftmp =3D bitbake("-S printdiff {}".format(target))
> @@ -807,17 +805,15 @@ BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>      def run_test_printdiff_changeconfig(self, target, change_content,
> expected_sametmp_output, expected_difftmp_output):
>          self.write_config("""
>  TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> -BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> -        bitbake(target)
> +        bitbake("--runall build {}".format(target))
>          bitbake("-S none {}".format(target))
>          self.append_config(change_content)
>          result_sametmp =3D bitbake("-S printdiff {}".format(target))
>
>          self.write_config("""
>  TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> -BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>  """)
>          self.append_config(change_content)
>          self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190273):
> https://lists.openembedded.org/g/openembedded-core/message/190273
> Mute This Topic: https://lists.openembedded.org/mt/102440948/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000981fc606098f1d98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks a lot!=C2=A0</div><div dir=3D"auto">=E2=80=94runal=
l didn=E2=80=99t occur to me at all.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue 7. Nov 2023 at 13.01, Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)">You could reproduce an er=
ror in this test with:<br>
<br>
bitbake core-image-minimal<br>
bitbake tzcode-native -c cleansstate<br>
oe-selftest -r sstatetests.SStatePrintdiff.test_image_minimal_vs_base_do_co=
nfigure<br>
<br>
since tzcode-native isn&#39;t needed once tzdata is available and isn&#39;t=
 rebuilt<br>
by &quot;bitbake core-image-minimal&quot; if it is missig. tzdata is allarc=
h so if tzdata is<br>
built on an x86 host, a aarch64 build machine would never build tzcode-nati=
ve with<br>
this set of calls.<br>
<br>
Add a --runall option to the initial bitbake invocation to force these thin=
gs to be<br>
created if they&#39;re missing.<br>
<br>
This explains why some failures were occurring on the infrastructure. With =
that issue<br>
fixed, drop the hash mode change since I believe this fixes that issue. Tha=
t<br>
restriction was hurting performance, this should allow sstate reuse for the=
 test<br>
and improve the speed of it.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/sstatetests.py | 14 +++++---------<br>
=C2=A01 file changed, 5 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/se=
lftest/cases/sstatetests.py<br>
index a6865a5ba7b..24c96ace08c 100644<br>
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
@@ -776,16 +776,15 @@ addtask tmptask2 before do_tmptask1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEq=
ual(recursecb_count,1)<br>
<br>
=C2=A0class SStatePrintdiff(SStateBase):<br>
-=C2=A0 =C2=A0 # FIXME: OEBasicHash setting is necessary for now as otherwi=
se the following error can occur:<br>
-=C2=A0 =C2=A0 # ERROR: Can&#39;t find a task we&#39;re supposed to have wr=
itten out? (hash: e79d70b9c2cc72030c1ce822525510699a1eeb1ddf5986271d3217422=
244366a)?<br>
-=C2=A0 =C2=A0 # The underlying issue should be investigated and addressed.=
<br>
=C2=A0 =C2=A0 =C2=A0def run_test_printdiff_changerecipe(self, target, chang=
e_recipe, change_bbtask, change_content, expected_sametmp_output, expected_=
difftmp_output):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(&quot;&quot;&quot;<br>
=C2=A0TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff&quot;<br>
-BB_SIGNATURE_HANDLER =3D &quot;OEBasicHash&quot;<br>
=C2=A0&quot;&quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.track_for_cleanup(self.topdir + &quo=
t;/tmp-sstateprintdiff&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use runall do_build to ensure any indirect s=
state is created, e.g. tzcode-native on both x86 and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # aarch64 hosts since only allarch target reci=
pes depend upon it and it may not be built otherwise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # A bitbake -c cleansstate tzcode-native would=
 cause some of these tests to error for example.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;--runall build {}&quot;.format(t=
arget))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;-S none {}&quot;.format(tar=
get))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(change_bbtask)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_recipeinc(change_recipe, chang=
e_content)<br>
@@ -793,7 +792,6 @@ BB_SIGNATURE_HANDLER =3D &quot;OEBasicHash&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(&quot;&quot;&quot;<br>
=C2=A0TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff-2&quot;<br>
-BB_SIGNATURE_HANDLER =3D &quot;OEBasicHash&quot;<br>
=C2=A0&quot;&quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.track_for_cleanup(self.topdir + &quo=
t;/tmp-sstateprintdiff-2&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_difftmp =3D bitbake(&quot;-S print=
diff {}&quot;.format(target))<br>
@@ -807,17 +805,15 @@ BB_SIGNATURE_HANDLER =3D &quot;OEBasicHash&quot;<br>
=C2=A0 =C2=A0 =C2=A0def run_test_printdiff_changeconfig(self, target, chang=
e_content, expected_sametmp_output, expected_difftmp_output):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(&quot;&quot;&quot;<br>
=C2=A0TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff&quot;<br>
-BB_SIGNATURE_HANDLER =3D &quot;OEBasicHash&quot;<br>
=C2=A0&quot;&quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.track_for_cleanup(self.topdir + &quo=
t;/tmp-sstateprintdiff&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;--runall build {}&quot;.format(t=
arget))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;-S none {}&quot;.format(tar=
get))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.append_config(change_content)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_sametmp =3D bitbake(&quot;-S print=
diff {}&quot;.format(target))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(&quot;&quot;&quot;<br>
=C2=A0TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff-2&quot;<br>
-BB_SIGNATURE_HANDLER =3D &quot;OEBasicHash&quot;<br>
=C2=A0&quot;&quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.append_config(change_content)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.track_for_cleanup(self.topdir + &quo=
t;/tmp-sstateprintdiff-2&quot;)<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190273): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190273" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190273</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102440948/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102440948/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000981fc606098f1d98--

