Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.11844.1586768309409779329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 01:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N0O3a8Ud;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id b5so5086704vsb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2020 01:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LRP/kCkyh/pq1LOXmn5KXzzG3dE71OEfz/8i3UG13xU=;
        b=N0O3a8Ud9KzhxKdc7frWSTstzxDFSFXfAWMNPa8d85BjR5PK+fdC2MbVPhyitY3v9h
         JdXUgQdiooCDM1nJxziyciGHKGC7txwxXbS42RyqFxUtGKbpJ0yybeNGW+kvnw5Utwon
         xcG/JYR0jS1QzPd5wGlDP/pD49fpaMmtlj1hRFCsEMjJgSG/UxKelJCc7ZMDun/ZQNPC
         MSoCzgEORSrZ0GwSJgMMpUu9vTZBx9PAqJC24mGRX5McDACPaVKKRnYdvjH2/HEsZa0a
         PjP69DvvSo6IyiV1NE2+nYEvszl+xJkJdID1ADHw5QdtGd49DLn9MCxVGl9fDidXJzKm
         rATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LRP/kCkyh/pq1LOXmn5KXzzG3dE71OEfz/8i3UG13xU=;
        b=g/TAMWDITcqz5df80gBmQVhPFVnQs59711TDV2lD6dnzGp+/njURNyuG/BI0LNxHbP
         Jnlih56mm8lBknPt4cYC1UPiQ4hOvPyqIN9rirtF6tp41caAWi4lLTZBxYAgSZj9Dl33
         /bcvuJkwbtiJm+Q6ZngadCOUmX2ymd3Mj/yEnAWbOS0rKdzwtQ2F3Nfx2AoG0Sh6OdQf
         404sr9wU+KU8tnJb3fk8/JwyP0QQg6GHcfdn9renz1mqz5KE0IH3rBHsxrpW5Lu5Dgph
         1L6Bu1oSAUnEpbpJLQpq1SzVzOoV4EtlIypjrg+ICZfO9v+mk/SirBzQGZS6s3xJKSJw
         COaw==
X-Gm-Message-State: AGi0PuaNOxQv2fJB2NrMY2M2kPEU/sp+uLzQCw/JqMUTE1moDkatvxuv
	Wg63CLMLI9oInShIWNun9eE4TDkGJ9CFVkV1mEQ=
X-Google-Smtp-Source: APiQypI/3Yp6LrisBRnFWdYpMpWI0d+vjzP1CDOz8SEPgLTSS4cNu2Sgvt0ebYUi7cqG/Me1Ia1+5lqcOkUUxQ2tmKQ=
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr5258270vsp.83.1586768308536;
 Mon, 13 Apr 2020 01:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <1586767753-29252-1-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1586767753-29252-1-git-send-email-ee.peng.yeoh@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 13 Apr 2020 10:58:17 +0200
Message-ID: <CANNYZj_3Y_aYWu8iGTfdfCA4j1b2XmTK7N9c-omnk5cFVzKg1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/weston: Enhance weston tests
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005f07ec05a32849d4"

--0000000000005f07ec05a32849d4
Content-Type: text/plain; charset="UTF-8"

Thanks, now one step closer to deprecating x11 :)

I'm thinking of rebasing all images used by autobuilder (e.g. -ptest, -sdk)
to be based off core-image-weston in 3.2 timeframe. The only sato image
would be core-image-sato itself.

Alex

On Mon, 13 Apr 2020 at 10:49, Yeoh Ee Peng <ee.peng.yeoh@intel.com> wrote:

> Existing weston test available make sure that a process
> for weston-desktop-shell exist when image boot up.
>
> Enhance weston tests by:
>  - execute weston-info to make sure weston interface(s)
>    are initialized
>  - execute weston and make sure it can initialize a
>    new wayland compositor
>
> [YOCTO# 10690]
>
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/runtime/cases/weston.py | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/weston.py
> b/meta/lib/oeqa/runtime/cases/weston.py
> index f32599a..f79ed64 100644
> --- a/meta/lib/oeqa/runtime/cases/weston.py
> +++ b/meta/lib/oeqa/runtime/cases/weston.py
> @@ -6,6 +6,8 @@ from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.core.decorator.data import skipIfNotFeature
>  from oeqa.runtime.decorator.package import OEHasPackage
> +import threading
> +import time
>
>  class WestonTest(OERuntimeTestCase):
>
> @@ -17,3 +19,31 @@ class WestonTest(OERuntimeTestCase):
>          msg = ('Weston does not appear to be running %s' %
>                self.target.run(self.tc.target_cmds['ps'])[1])
>          self.assertEqual(status, 0, msg=msg)
> +
> +    def get_weston_command(self, cmd):
> +        return 'export XDG_RUNTIME_DIR=/run/user/0; export DISPLAY=:0;
> %s' % cmd
> +
> +    def run_weston_init(self):
> +        self.target.run(self.get_weston_command('weston'))
> +
> +    @OEHasPackage(['weston'])
> +    def test_weston_info(self):
> +        status, output =
> self.target.run(self.get_weston_command('weston-info'))
> +        self.assertEqual(status, 0, msg='weston-info error: %s' % output)
> +
> +    @OEHasPackage(['weston'])
> +    def test_weston_can_initialize_new_wayland_compositor(self):
> +        status, output = self.target.run('pidof weston-desktop-shell')
> +        self.assertEqual(status, 0, msg='Retrieve existing
> weston-desktop-shell processes error: %s' % output)
> +        existing_wl_processes = output.split(" ")
> +
> +        weston_thread = threading.Thread(target=self.run_weston_init)
> +        weston_thread.start()
> +        time.sleep(5)
> +        status, output = self.target.run('pidof weston-desktop-shell')
> +        self.assertEqual(status, 0, msg='Retrieve existing and new
> weston-desktop-shell processes error: %s' % output)
> +        wl_processes = output.split(" ")
> +        new_wl_processes = [x for x in wl_processes if x not in
> existing_wl_processes]
> +        self.assertTrue(new_wl_processes, msg='Check new
> weston-desktop-shell processes error: %s' % new_wl_processes)
> +        for wl in new_wl_processes:
> +            self.target.run('kill -9 %s' % wl)
> --
> 2.7.4
>
> 
>

--0000000000005f07ec05a32849d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, now one step closer to deprecating x11 :)</di=
v><div><br></div><div>I&#39;m thinking of rebasing all images used by autob=
uilder (e.g. -ptest, -sdk) to be based off core-image-weston in 3.2 timefra=
me. The only sato image would be core-image-sato itself.<br></div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, 13 Apr 2020 at 10:49, Yeoh Ee Peng &lt;<a =
href=3D"mailto:ee.peng.yeoh@intel.com">ee.peng.yeoh@intel.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Existing westo=
n test available make sure that a process<br>
for weston-desktop-shell exist when image boot up.<br>
<br>
Enhance weston tests by:<br>
=C2=A0- execute weston-info to make sure weston interface(s)<br>
=C2=A0 =C2=A0are initialized<br>
=C2=A0- execute weston and make sure it can initialize a<br>
=C2=A0 =C2=A0new wayland compositor<br>
<br>
[YOCTO# 10690]<br>
<br>
Signed-off-by: Yeoh Ee Peng &lt;<a href=3D"mailto:ee.peng.yeoh@intel.com" =
target=3D"_blank">ee.peng.yeoh@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/runtime/cases/weston.py | 30 +++++++++++++++++++++++++=
+++++<br>
=C2=A01 file changed, 30 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime=
/cases/weston.py<br>
index f32599a..f79ed64 100644<br>
--- a/meta/lib/oeqa/runtime/cases/weston.py<br>
+++ b/meta/lib/oeqa/runtime/cases/weston.py<br>
@@ -6,6 +6,8 @@ from oeqa.runtime.case import OERuntimeTestCase<br>
=C2=A0from oeqa.core.decorator.depends import OETestDepends<br>
=C2=A0from oeqa.core.decorator.data import skipIfNotFeature<br>
=C2=A0from oeqa.runtime.decorator.package import OEHasPackage<br>
+import threading<br>
+import time<br>
<br>
=C2=A0class WestonTest(OERuntimeTestCase):<br>
<br>
@@ -17,3 +19,31 @@ class WestonTest(OERuntimeTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D (&#39;Weston does not appear to =
be running %s&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target.run(<a =
href=3D"http://self.tc" target=3D"_blank">self.tc</a>.target_cmds[&#39;ps&#=
39;])[1])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 0, msg=3Dmsg)<b=
r>
+<br>
+=C2=A0 =C2=A0 def get_weston_command(self, cmd):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;export XDG_RUNTIME_DIR=3D/run/use=
r/0; export DISPLAY=3D:0; %s&#39; % cmd<br>
+<br>
+=C2=A0 =C2=A0 def run_weston_init(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.target.run(self.get_weston_command(&#39;=
weston&#39;))<br>
+<br>
+=C2=A0 =C2=A0 @OEHasPackage([&#39;weston&#39;])<br>
+=C2=A0 =C2=A0 def test_weston_info(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(self.get_w=
eston_command(&#39;weston-info&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3D&#39;weston=
-info error: %s&#39; % output)<br>
+<br>
+=C2=A0 =C2=A0 @OEHasPackage([&#39;weston&#39;])<br>
+=C2=A0 =C2=A0 def test_weston_can_initialize_new_wayland_compositor(self)=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(&#39;pidof=
 weston-desktop-shell&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3D&#39;Retrie=
ve existing weston-desktop-shell processes error: %s&#39; % output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 existing_wl_processes =3D output.split(&quot;=
 &quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 weston_thread =3D threading.Thread(target=3Ds=
elf.run_weston_init)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 weston_thread.start()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(5)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(&#39;pidof=
 weston-desktop-shell&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3D&#39;Retrie=
ve existing and new weston-desktop-shell processes error: %s&#39; % output)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wl_processes =3D output.split(&quot; &quot;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_wl_processes =3D [x for x in wl_processes=
 if x not in existing_wl_processes]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(new_wl_processes, msg=3D&#39;=
Check new weston-desktop-shell processes error: %s&#39; % new_wl_processes)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for wl in new_wl_processes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.target.run(&#39;kill -9 %s=
&#39; % wl)<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div>

--0000000000005f07ec05a32849d4--
