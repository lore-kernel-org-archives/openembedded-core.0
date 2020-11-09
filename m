Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web10.8672.1604910879592490639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SzTq8zBc;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id t8so4505133vsr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oxc/uyz1A+Aip9HFxbkhmtrAEOJ6Wt19E0b/OYY59Fo=;
        b=SzTq8zBc2jOHIhTVEAOl89nWmhTwmeWCLp/QNjHEs8sVXiyYrraFqnR6LFEffAN6GQ
         zwU1AjVnQj3XyPRESaqvlGdTgY+yUOXpGFKRlUYZ5ViDL7MHeDEPYRjVAvzyoMVFMmFQ
         FWgMsoOq0W2eIpJ778o49/Xuj9Dp5LPYdtE2BrBvblvHIXpwTSiROpRiSiyb/MWGIeHF
         LxWZh/aPXS1D9uZDCtkgJGbRDz8B6A3mIOBQuDrYm6fc3tLh2mEJLsc/xQjmuoB1J230
         FfXn5P3coFuoGSsPwIUFOruyWrEeN1imeKlRgfm+6qrPMOcvf7GmCVTgLxwanfvPQJi9
         VYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oxc/uyz1A+Aip9HFxbkhmtrAEOJ6Wt19E0b/OYY59Fo=;
        b=c14zutoV3qHQsOSHwttMnf1kKIy7h1EBmVRHjvCViz1Nq1zFl0E/daxidMYBimvBEx
         0M3KDpcE1yDttFan22o1gdoiaQ/d8TV/EkbJ/0WqC3xOaN5YA1ADSJwD6v0cbomTZRMr
         rEyKPH/brzKee8YJA2Xj+IR0foOmtHQHR7jj/tlUn7JithDHNzg4dYw27Ku/Sbrp8bT4
         ti85BGbgYEauWK8jZAJsOGXQb6OYWW1SRgZghb+u5xPJtHDvvisgQ9FuBQ0rJy1V+J9b
         zdoawV8rqWnlcD6moTDXw9VYFEygt9zqfjRA1wrrNTjhO4ksPvgPa0LzZt4L/LysZ9G+
         NWMw==
X-Gm-Message-State: AOAM5333K83qYzx5OynKPFwn3EF24aj8dLmWcJBVgC87wfodW4GZvFkf
	GyVooND1WD2h4r3x8E56P/t8RGdqWIecf/gbkCI=
X-Google-Smtp-Source: ABdhPJyF6XfggevRV67I5tm58gx0lUjmS6tHLHKbPeXw+ONSmXgN5iJyTXXSnPQh+fK6F7kserncUz5dxRhAZ6GU9is=
X-Received: by 2002:a05:6102:215:: with SMTP id z21mr6481441vsp.51.1604910878751;
 Mon, 09 Nov 2020 00:34:38 -0800 (PST)
MIME-Version: 1.0
References: <1604910610-68620-1-git-send-email-jay.shen.teoh@intel.com>
In-Reply-To: <1604910610-68620-1-git-send-email-jay.shen.teoh@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 9 Nov 2020 09:34:27 +0100
Message-ID: <CANNYZj9MWZt3=-K_qCN3VJR=uiSLja8X=HbitOwXPRDP_vcKQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/terminal : rework the logic
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d3001c05b3a86ea2"

--000000000000d3001c05b3a86ea2
Content-Type: text/plain; charset="UTF-8"

Does this test take 5 minutes to complete? This is too much, it should only
be a few seconds.

Alex

On Mon, 9 Nov 2020 at 09:30, Teoh, Jay Shen <jay.shen.teoh@intel.com> wrote:

> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
>
> Rework this test case to fulfill the requirements of replacing the
> click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw :
> 1) code added to verify that the terminal window is working without problem
> 2) code added to verify that there's only 1 terminal window is launched
>
> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> ---
>  meta/lib/oeqa/runtime/cases/terminal.py | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/terminal.py
> b/meta/lib/oeqa/runtime/cases/terminal.py
> index a268f26..8a079a5 100644
> --- a/meta/lib/oeqa/runtime/cases/terminal.py
> +++ b/meta/lib/oeqa/runtime/cases/terminal.py
> @@ -2,17 +2,22 @@ from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.runtime.decorator.package import OEHasPackage
>
> -import threading
> -import time
> +import re
>
>  class TerminalTest(OERuntimeTestCase):
>
>      @OEHasPackage(['matchbox-terminal'])
>      @OETestDepends(['ssh.SSHTest.test_ssh'])
>      def test_terminal_running(self):
> -        t_thread = threading.Thread(target=self.target.run, args=('export
> DISPLAY=:0 && matchbox-terminal',))
> -        t_thread.start()
> -        time.sleep(2)
> +
> +        status, output = self.target.run("export DISPLAY=:0 &&
> matchbox-terminal",)
> +        check_terminal = re.search("Process killed - no output for 300
> seconds.", output)
> +        self.assertTrue(check_terminal, msg='Terminal window should be
> launched without any problem')
> +
> +        status, output = self.target.run('pidof matchbox-terminal | wc
> -w')
> +        output = int(output)
> +        self.assertEqual(output, 1, 'There should be only one terminal
> window being launched. Terminal window launched : %s' % output)
> +
>          status, output = self.target.run('pidof matchbox-terminal')
>          self.target.run('kill -9 %s' % output)
>          self.assertEqual(status, 0, msg='Not able to find process that
> runs terminal.')
> --
> 2.7.4
>
>
> 
>
>

--000000000000d3001c05b3a86ea2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Does this test take 5 minutes to complete? This is to=
o much, it should only be a few seconds.</div><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, 9 Nov 2020 at 09:30, Teoh, Jay Shen &lt;<a href=3D"mailto:jay.=
shen.teoh@intel.com">jay.shen.teoh@intel.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Teoh Jay Shen &lt;<a href=
=
=3D"mailto:jay.shen.teoh@intel.com" target=3D"_blank">jay.shen.teoh@intel.=
com</a>&gt;<br>
<br>
Rework this test case to fulfill the requirements of replacing the click_t=
erminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw :<br>
1) code added to verify that the terminal window is working without proble=
m<br>
2) code added to verify that there&#39;s only 1 terminal window is launche=
d<br>
<br>
Signed-off-by: Teoh Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel.com=
" target=3D"_blank">jay.shen.teoh@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/runtime/cases/terminal.py | 15 ++++++++++-----<br>
=C2=A01 file changed, 10 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runti=
me/cases/terminal.py<br>
index a268f26..8a079a5 100644<br>
--- a/meta/lib/oeqa/runtime/cases/terminal.py<br>
+++ b/meta/lib/oeqa/runtime/cases/terminal.py<br>
@@ -2,17 +2,22 @@ from oeqa.runtime.case import OERuntimeTestCase<br>
=C2=A0from oeqa.core.decorator.depends import OETestDepends<br>
=C2=A0from oeqa.runtime.decorator.package import OEHasPackage<br>
<br>
-import threading<br>
-import time<br>
+import re<br>
<br>
=C2=A0class TerminalTest(OERuntimeTestCase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0@OEHasPackage([&#39;matchbox-terminal&#39;])<br>
=C2=A0 =C2=A0 =C2=A0@OETestDepends([&#39;ssh.SSHTest.test_ssh&#39;])<br>
=C2=A0 =C2=A0 =C2=A0def test_terminal_running(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_thread =3D threading.Thread(target=3Dself.t=
arget.run, args=3D(&#39;export DISPLAY=3D:0 &amp;&amp; matchbox-terminal&#3=
9;,))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_thread.start()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(&quot;expo=
rt DISPLAY=3D:0 &amp;&amp; matchbox-terminal&quot;,)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_terminal =3D re.search(&quot;Process ki=
lled - no output for 300 seconds.&quot;, output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(check_terminal, msg=3D&#39;Te=
rminal window should be launched without any problem&#39;)=C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(&#39;pidof=
 matchbox-terminal | wc -w&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D int(output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output, 1, &#39;There should=
 be only one terminal window being launched. Terminal window launched : %s&=
#39; % output)<br>
+=C2=A0 =C2=A0 =C2=A0 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status, output =3D self.target.run(&#39;=
pidof matchbox-terminal&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target.run(&#39;kill -9 %s&#39; % o=
utput)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 0, msg=3D&#39;N=
ot able to find process that runs terminal.&#39;)=C2=A0 =C2=A0<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d3001c05b3a86ea2--
