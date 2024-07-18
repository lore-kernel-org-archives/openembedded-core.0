Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368BAC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 10:28:20 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.12168.1721298491378704391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 03:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w1vJhWyw;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3684e8220f9so304200f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 03:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1721298490; x=1721903290; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9OXmDb0KLCYrp62m4vdrZR5a04YyxVI10W7eNTMhWuo=;
        b=w1vJhWywGYn2yX+zpEtmEG8p1KK6lijVCHGprn7MT40GrU5qmJrY+c6n4RM+DC37JV
         6rHtQWB8wrHc9imgztqCD+RgGjELVmO28sMFW+ZJy3Mvyw0JkvsWhV5NaU7c+7iHZtgD
         tPdu1o2Wh89RxFvbq01pC+WQaWZmGAo2y0jpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721298490; x=1721903290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OXmDb0KLCYrp62m4vdrZR5a04YyxVI10W7eNTMhWuo=;
        b=diVTSRW7I4SPISyWkefIiUOS+12hXUFVN53QBJ46X0ajbGAkpJQCFHOVimKigxgHG3
         ADavCpue+789DlvgwVZKHdgUpWE/xvUHOsVkS6A/ud/QaGSRL315vZmZPIP/qsYJa63Y
         XJAC5sg3EpwbYM5pfLmszzF8siaB04NZvBdWzxXOuunmFYSG8t03/3azoLNqMeUT/CUH
         P9wW11pHCOyjWpKNZ2a29KNTjPTs3LxZ8s2INLBGnN6ImdOF66p1eoh52KbcaeUj5idB
         PyRjSUp51CJcQ3U9VqBGszNIHWFhJxaK99W7O/XDcVXGHXFvYBLTkKg7SR6wk4OVQudl
         +gKA==
X-Gm-Message-State: AOJu0YxPvwgNT5l1E5ZibtJ6cHmVYBZjGym0Ge1ye2kEyL3vPeX2a1VI
	B2YvbHUA/OJBu8hcLEYB4Q3Yn1V34mNjkjgw9Tbi2aTcUIVo7YG5yDWzAvFKsimAr7z5sGeL8kJ
	y4sMOV3zGtFknPkKUEOZG/8pzN6zgI0cw5B04c5Zr7PbBCtCfEK9rCg==
X-Google-Smtp-Source: AGHT+IF+kEvOGuSi3JWurgNZ1ySfs3CjqwEEN7XeGoCOUZXZ/1GN0q9LA6lWZ8CWEKSv550cURlOby8I5E5o2C0QlJk=
X-Received: by 2002:adf:f10a:0:b0:360:866f:5083 with SMTP id
 ffacd0b85a97d-3684b3ce574mr1272968f8f.32.1721298489496; Thu, 18 Jul 2024
 03:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240718100440.1555319-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20240718100440.1555319-1-sundeep.kokkonda@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 18 Jul 2024 12:27:43 +0200
Message-ID: <CAMSfU+66tLkOehv29BiAzo5gb+you3tqUWywrTaP9CBaVTmZzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/reproducibile: rename of
 reproducible directories
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	harish.sadineni@windriver.com
Content-Type: multipart/alternative; boundary="00000000000004f2af061d8309cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 10:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202203

--00000000000004f2af061d8309cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 18 juil. 2024 =C3=A0 12:05, Sundeep KOKKONDA via lists.openembedded=
.org
<sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit :

> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> We do see a few reproducible issues are depending on the path length of
> the build directory.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15554
>
> The current implementation of reproducible tests having different names
> for directories but with same length.
> The build directory names are changed to have difefrent lenth.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> index 7c6cf3eb1f..6932b0c2a5 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -276,9 +276,13 @@ class ReproducibleTests(OESelftestTestCase):
>              os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGR=
P
> | stat.S_IROTH | stat.S_IXOTH)
>              self.logger.info('Non-reproducible packages will be copied
> to %s', save_dir)
>
> -        vars_A =3D self.do_test_build('reproducibleA',
> self.build_from_sstate)
> +        # The below bug shows that a few reproducible issues are depends
> on build dir path length.
> +        # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15554
> +        # So, the reproducibleA & reproducibleB directories are changed
> to reproducible & reproducible-extended to have different size.
>
> -        vars_B =3D self.do_test_build('reproducibleB', False)
> +        vars_A =3D self.do_test_build('reproducible',
> self.build_from_sstate)
> +
> +        vars_B =3D self.do_test_build('reproducible-extended', False)
>

How about "reproducible-sstate" & "reproducible-no-sstate" (diff length but
match what happens under the hood) ?
Alternatively, maybe keep A/B with "reproducibleA" &
"reproducibleB-extended" ? (I'm afraid I will lose track which is which
with the current patch)

If you find that too bike-shedy, you can ignore, I'll learn the new names
eventually :-)

Thanks!

         # NOTE: The temp directories from the reproducible build are
> purposely
>          # kept after the build so it can be diffed for debugging.
> @@ -333,7 +337,7 @@ class ReproducibleTests(OESelftestTestCase):
>                  # Copy jquery to improve the diffoscope output usability
>                  self.copy_file(os.path.join(jquery_sysroot,
> 'usr/share/javascript/jquery/jquery.min.js'),
> os.path.join(package_html_dir, 'jquery.js'))
>
> -                run_diffoscope('reproducibleA', 'reproducibleB',
> package_html_dir, max_report_size=3Dself.max_report_size,
> +                run_diffoscope('reproducible', 'reproducible-extended',
> package_html_dir, max_report_size=3Dself.max_report_size,
>                          native_sysroot=3Ddiffoscope_sysroot,
> ignore_status=3DTrue, cwd=3Dpackage_dir)
>
>          if fails:
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202196):
> https://lists.openembedded.org/g/openembedded-core/message/202196
> Mute This Topic: https://lists.openembedded.org/mt/107414164/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--00000000000004f2af061d8309cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 18 juil. 2024 =C3=A0=C2=A012=
:05, Sundeep KOKKONDA via <a href=3D"http://lists.openembedded.org">lists.o=
penembedded.org</a> &lt;sundeep.kokkonda=3D<a href=3D"mailto:windriver.com@=
lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Sundeep KOKKONDA &lt;<a href=3D"mailto:sundeep.=
kokkonda@windriver.com" target=3D"_blank">sundeep.kokkonda@windriver.com</a=
>&gt;<br>
<br>
We do see a few reproducible issues are depending on the path length of the=
 build directory.<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15554" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D15554</a><br>
<br>
The current implementation of reproducible tests having different names for=
 directories but with same length.<br>
The build directory names are changed to have difefrent lenth.<br>
<br>
Signed-off-by: Sundeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda@wind=
river.com" target=3D"_blank">sundeep.kokkonda@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---<br>
=C2=A01 file changed, 7 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/s=
elftest/cases/reproducible.py<br>
index 7c6cf3eb1f..6932b0c2a5 100644<br>
--- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
@@ -276,9 +276,13 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.chmod(save_dir, stat.S_I=
RWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://self.logg=
er.info" rel=3D"noreferrer" target=3D"_blank">self.logger.info</a>(&#39;Non=
-reproducible packages will be copied to %s&#39;, save_dir)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vars_A =3D self.do_test_build(&#39;reproducibl=
eA&#39;, self.build_from_sstate)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The below bug shows that a few reproducible =
issues are depends on build dir path length.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D15554" rel=3D"noreferrer" target=3D"_blank">https://bugz=
illa.yoctoproject.org/show_bug.cgi?id=3D15554</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # So, the reproducibleA &amp; reproducibleB di=
rectories are changed to reproducible &amp; reproducible-extended to have d=
ifferent size.<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vars_B =3D self.do_test_build(&#39;reproducibl=
eB&#39;, False)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vars_A =3D self.do_test_build(&#39;reproducibl=
e&#39;, self.build_from_sstate)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vars_B =3D self.do_test_build(&#39;reproducibl=
e-extended&#39;, False)<br></blockquote><div><br></div><div>How about &quot=
;reproducible-sstate&quot; &amp; &quot;reproducible-no-sstate&quot; (diff l=
ength but match what happens under the hood) ?<br></div><div>Alternatively,=
 maybe keep A/B with &quot;reproducibleA&quot; &amp; &quot;reproducibleB-ex=
tended&quot; ? (I&#39;m afraid I will lose track which is which with the cu=
rrent patch)<br></div><div><br></div><div>If you find that too bike-shedy, =
you can ignore, I&#39;ll learn the new names eventually :-)</div><div><br><=
/div><div>Thanks!<br></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# NOTE: The temp directories from the rep=
roducible build are purposely<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# kept after the build so it can be diffe=
d for debugging.<br>
@@ -333,7 +337,7 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Copy jquery=
 to improve the diffoscope output usability<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.copy_fil=
e(os.path.join(jquery_sysroot, &#39;usr/share/javascript/jquery/jquery.min.=
js&#39;), os.path.join(package_html_dir, &#39;jquery.js&#39;))<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run_diffoscope(&#3=
9;reproducibleA&#39;, &#39;reproducibleB&#39;, package_html_dir, max_report=
_size=3Dself.max_report_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run_diffoscope(&#3=
9;reproducible&#39;, &#39;reproducible-extended&#39;, package_html_dir, max=
_report_size=3Dself.max_report_size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0native_sysroot=3Ddiffoscope_sysroot, ignore_status=3DTrue,=
 cwd=3Dpackage_dir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if fails:<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#202196): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/202196" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/202196</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107414164/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107414164/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--00000000000004f2af061d8309cd--

