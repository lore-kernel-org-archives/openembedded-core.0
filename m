Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FB9C54F3D
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.7686.1649907247858633607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 20:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f7Ltsbsp;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id h11so4490444ljb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 20:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OjI7Czvzc09NHP4CUpm3b7wQ/O3YfMNkG3uLXbJiwpQ=;
        b=f7LtsbspGkje+JQ/fIVlxeJ+b1oi5OvC6FZKwIrbDPiqdonr+/LZNk0FtI37WxCnpN
         FfUxlxyjRk4USyhrxXVGgThgyKa07HEpfSM9JE+66b5l8WtcaEl1jF2b/LiXkdfEpM2E
         gGun1Zu1+QO4R2sJxvQIMimpcAQ2WRKcGt52tt3FomNICZ6Lxx7Y3yWmf+xYMJKtwMDV
         jRaI+NwSeqlnUT7rctXgpCLT5zIIDkRPuMK1XEf8g6dvXgPsLLRLjZYGwg0dIu9g6AWM
         8qFgh9Cq1jcKBfvFgvmtfAJdDO1UM66V8uesvZC3wIPr/W0STu0Xe2WK5cASqbQnS3Hk
         tzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OjI7Czvzc09NHP4CUpm3b7wQ/O3YfMNkG3uLXbJiwpQ=;
        b=yOcHy87JhMXtMwGG68l8XqRpsP4dH0J9m44vZn1oHxG181+NPK3FdQGjZcH5Y9jiCA
         MA2fu/oMDa3zipBWS9uqsH6tn+eIToqm9qPBtCFfXMMkQf79cpNYwZvxIxIJH7xmo1vF
         JCVO2DLE8Vms2bcorRmP7jKb+FbeQC8biodVuM5cRlCZuZpXXUTzIkrX98cXRsYExhyp
         /Yts/RuZIyRHRw2WUG3q2mj8a/Gmg2NOkX/4evwwBCdlZ49pvWJVWaV8Q83i9yT5XIQ7
         Z4zJhm9cKBBnUNz3oV8uaBKDH93jvkxM1090g4FW9ue3Eu5qgeZ3vK5cQzXXO5+bTsP8
         550Q==
X-Gm-Message-State: AOAM533obKfrYyCb5yP3Cct9GVsOQcKoNSmftr6efUycEApvR33EooST
	3WdekuH822gqqN1IJh1IBU+Lx4EdBHTBUEVoacU=
X-Google-Smtp-Source: 
 ABdhPJyZoGBLhUfXBKk7nONbHwt/GrzWBQBMcTwZQcyK4ChcTMSvxDUxk9pNXOqL6gxLbH/PdcGYHyOD8goHcmoBORs=
X-Received: by 2002:a05:651c:503:b0:24c:7f3e:601c with SMTP id
 o3-20020a05651c050300b0024c7f3e601cmr414817ljp.109.1649907245790; Wed, 13 Apr
 2022 20:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220414025230.1166825-1-raj.khem@gmail.com>
 <20220414025230.1166825-6-raj.khem@gmail.com>
In-Reply-To: <20220414025230.1166825-6-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Apr 2022 05:33:54 +0200
Message-ID: 
 <CANNYZj-HV8XiKD+LiQb6gtXf8Xe+YhA1SoOUaGmUO8hk9QFyhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] pango: Skip test-layout ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004c3d0a05dc94f72a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164387

--0000000000004c3d0a05dc94f72a
Content-Type: text/plain; charset="UTF-8"

Please do file an upstream bug and include a link to it.

Alex

On Thu 14. Apr 2022 at 4.52, Khem Raj <raj.khem@gmail.com> wrote:

> This has intermittent behavior, is sensitive to harfbuzz version
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-Skip-running-test-layout-test.patch  | 45 +++++++++++++++++++
>  meta/recipes-graphics/pango/pango_1.50.6.bb   |  4 +-
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch
>
> diff --git
> a/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch
> b/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch
> new file mode 100644
> index 00000000000..c391e158d28
> --- /dev/null
> +++
> b/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch
> @@ -0,0 +1,45 @@
> +From b9bfe3a79f165682a6db3d7ee1928365e93b1ccf Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 13 Apr 2022 19:39:29 -0700
> +Subject: [PATCH] Skip running test-layout test
> +
> +This fails intermittently, it varies based on what version of harfbuzz
> +is installed and if it does not match with what pango CI tests then we
> +get random failures in this test. This has been disabled in other
> +distros [1] too
> +
> +We want to drop this on next upgrade and see if this test passes if not
> +then keep it disabled
> +
> +Fixes
> +
> +Running test: pango/test-layout.test
> +1..36
> +ok 1 /layout/letterspacing.layout
> +ok 2 /layout/valid-7.layout
> +not ok 3 /layout/valid-14.layout
> +Bail out!
> +FAIL: pango/test-layout.test (Child process killed by signal 6)
> +
> +[1]
> https://github.com/archlinux/svntogit-packages/commit/3f883e7ff8071adad23b6bcc0ba4b995aff10d52
> +
> +Upstream-Status: Inappropriate [Distro specific]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + tests/test-layout.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/test-layout.c b/tests/test-layout.c
> +index 1139e4f..b47a066 100644
> +--- a/tests/test-layout.c
> ++++ b/tests/test-layout.c
> +@@ -222,5 +222,5 @@ main (int argc, char *argv[])
> +     }
> +   g_dir_close (dir);
> +
> +-  return g_test_run ();
> ++  return 77;
> + }
> +--
> +2.35.2
> +
> diff --git a/meta/recipes-graphics/pango/pango_1.50.6.bb
> b/meta/recipes-graphics/pango/pango_1.50.6.bb
> index cd04801db10..93e16534641 100644
> --- a/meta/recipes-graphics/pango/pango_1.50.6.bb
> +++ b/meta/recipes-graphics/pango/pango_1.50.6.bb
> @@ -18,7 +18,9 @@ inherit gnomebase gi-docgen ptest-gnome
> upstream-version-is-even gobject-introsp
>  GIR_MESON_ENABLE_FLAG = "enabled"
>  GIR_MESON_DISABLE_FLAG = "disabled"
>
> -SRC_URI += "file://run-ptest"
> +SRC_URI += "file://run-ptest \
> +            file://0001-Skip-running-test-layout-test.patch \
> +"
>
>  SRC_URI[archive.sha256sum] =
> "a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a"
>
> --
> 2.35.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164383):
> https://lists.openembedded.org/g/openembedded-core/message/164383
> Mute This Topic: https://lists.openembedded.org/mt/90456793/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004c3d0a05dc94f72a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please do file an upstream bug and include a link to it.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 14. Apr =
2022 at 4.52, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)">This has intermittent beh=
avior, is sensitive to harfbuzz version<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Skip-running-test-layout-test.patch=C2=A0 | 45 +++++++++++++=
++++++<br>
=C2=A0meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.6.bb" rel=3D=
"noreferrer" target=3D"_blank">pango_1.50.6.bb</a>=C2=A0 =C2=A0|=C2=A0 4 +-=
<br>
=C2=A02 files changed, 48 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/pango/pango/0001-Skip-runnin=
g-test-layout-test.patch<br>
<br>
diff --git a/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layou=
t-test.patch b/meta/recipes-graphics/pango/pango/0001-Skip-running-test-lay=
out-test.patch<br>
new file mode 100644<br>
index 00000000000..c391e158d28<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.=
patch<br>
@@ -0,0 +1,45 @@<br>
+From b9bfe3a79f165682a6db3d7ee1928365e93b1ccf Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Wed, 13 Apr 2022 19:39:29 -0700<br>
+Subject: [PATCH] Skip running test-layout test<br>
+<br>
+This fails intermittently, it varies based on what version of harfbuzz<br>
+is installed and if it does not match with what pango CI tests then we<br>
+get random failures in this test. This has been disabled in other<br>
+distros [1] too<br>
+<br>
+We want to drop this on next upgrade and see if this test passes if not<br=
>
+then keep it disabled<br>
+<br>
+Fixes<br>
+<br>
+Running test: pango/test-layout.test<br>
+1..36<br>
+ok 1 /layout/letterspacing.layout<br>
+ok 2 /layout/valid-7.layout<br>
+not ok 3 /layout/valid-14.layout<br>
+Bail out!<br>
+FAIL: pango/test-layout.test (Child process killed by signal 6)<br>
+<br>
+[1] <a href=3D"https://github.com/archlinux/svntogit-packages/commit/3f883=
e7ff8071adad23b6bcc0ba4b995aff10d52" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/archlinux/svntogit-packages/commit/3f883e7ff8071adad23b6b=
cc0ba4b995aff10d52</a><br>
+<br>
+Upstream-Status: Inappropriate [Distro specific]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ tests/test-layout.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/tests/test-layout.c b/tests/test-layout.c<br>
+index 1139e4f..b47a066 100644<br>
+--- a/tests/test-layout.c<br>
++++ b/tests/test-layout.c<br>
+@@ -222,5 +222,5 @@ main (int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0g_dir_close (dir);<br>
+ <br>
+-=C2=A0 return g_test_run ();<br>
++=C2=A0 return 77;<br>
+ }<br>
+-- <br>
+2.35.2<br>
+<br>
diff --git a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">pango_1.50.6.bb</a> b/meta/recipes-gr=
aphics/pango/<a href=3D"http://pango_1.50.6.bb" rel=3D"noreferrer" target=
=3D"_blank">pango_1.50.6.bb</a><br>
index cd04801db10..93e16534641 100644<br>
--- a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.6.bb" rel=3D=
"noreferrer" target=3D"_blank">pango_1.50.6.bb</a><br>
+++ b/meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.6.bb" rel=3D=
"noreferrer" target=3D"_blank">pango_1.50.6.bb</a><br>
@@ -18,7 +18,9 @@ inherit gnomebase gi-docgen ptest-gnome upstream-version-=
is-even gobject-introsp<br>
=C2=A0GIR_MESON_ENABLE_FLAG =3D &quot;enabled&quot;<br>
=C2=A0GIR_MESON_DISABLE_FLAG =3D &quot;disabled&quot;<br>
<br>
-SRC_URI +=3D &quot;file://run-ptest&quot;<br>
+SRC_URI +=3D &quot;file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Skip-running-test-la=
yout-test.patch \<br>
+&quot;<br>
<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;a998bcf36881c3ac20495d40bceb304f=
4eaa9175bd2967c85656434cbdafe86a&quot;<br>
<br>
-- <br>
2.35.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164383): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164383" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164383</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90456793/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90456793/1686489</a><br>
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

--0000000000004c3d0a05dc94f72a--

