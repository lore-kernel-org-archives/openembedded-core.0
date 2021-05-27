Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web12.6897.1622122543437035256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 06:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HoWenG2H;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id d14so205962ual.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N0WPfkwvj9HZf7ndifpsCDqpuV55aKfe0nWd35uTIX0=;
        b=HoWenG2Hzc7UwA83NxcdchamQoHqW4sbjLfvbJtauBFoetGFb010MEKAjXRf1uaveK
         XBweVQtuPZyHwPwB3dUIAKZe7iCSDtZQvx1f5lqroqAjEfvPnWJzPaCsshvaQqamK8KU
         rwL52+rE0PrqcjO7Tm04op5ieyP0KxbUs7CLdKBXA4w1xEQ1iAM6Oywd3HpeCsjNEvTl
         gOhlPCJ/7P3Rubsf3cteExd2Nm/Nj5dX5VCjV/jIo2Db0nOPrTqaFTK0lTxNJqNQ4tsb
         6+D43tqkrV8DZsXg2WWM38ECPYhEd+k+4mceJ2ORhEaW/Svg8SG5JflrEm73+G2fWWOO
         GMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N0WPfkwvj9HZf7ndifpsCDqpuV55aKfe0nWd35uTIX0=;
        b=SeitOWdnmop2gCO6GZxb6ROGjfcISD7wK0EAn71kZ9LtewhaxST+D+hSmsI34SK8E6
         atjDbvlazdgqntJQmkBPsQGJ1ZA7Ric0k/qu1JBF4JZ+Wa1WyPA4mItdOeCN+IjpDcUs
         Mt8NtnRwbUpf+IC9IqAcxwdU929VbrhaVa512RuqZzCoNvKHC6mR00q6OP2eXTH7Lu5Q
         XG+K2gsSjbg4UQhqI7mwdI2kAtGFgm/WZ0yCz0E6tQHWTUH0pL59OCZoJkzVezIptUMH
         txoQXelgcgLT1XbKq7esHRxNfZwL01z1d9yKxZTjZbeVf/5qEURFX07G2FOUYGZ4r8aA
         xHrQ==
X-Gm-Message-State: AOAM533leYUl/Wa7dvvHZfBanurHQlYCZM+E5AYyj44aLN1yWDcvdhD5
	WxBO6lNhm0afgYqflfLvHhS5yZXOKz/guRIK9oQ=
X-Google-Smtp-Source: ABdhPJxUO1iLJghJxzTI3o51buWjrPiXL2rLNXfQKNyc2qR5SGysbUVuFBHVwO5z+2lbwvlWi044CwN7B68GlLgoUas=
X-Received: by 2002:ab0:742:: with SMTP id h60mr2101336uah.89.1622122542669;
 Thu, 27 May 2021 06:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
 <CANNYZj8wK=MCOQzGrnZf4AyJS_-0NXV9WXXhXef0psouhamJxQ@mail.gmail.com> <CANUMPcWXEqZ2sCtbk7=zZ_j0i8HFPbbDBQ9xb4n3vQFGfXc9aA@mail.gmail.com>
In-Reply-To: <CANUMPcWXEqZ2sCtbk7=zZ_j0i8HFPbbDBQ9xb4n3vQFGfXc9aA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 27 May 2021 15:35:31 +0200
Message-ID: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000f0248905c34fd523"

--000000000000f0248905c34fd523
Content-Type: text/plain; charset="UTF-8"

Hello Vinay,

sure, no problem. I see that SSHControl.run() isn't designed for starting
background processes on the target. But I still think it's then better to
use subprocess module for starting the server over ssh, rather than bundle
everything into one gigantic runCmd().

Alex

On Thu, 27 May 2021 at 14:18, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Hi Alex,
>
> The reason why I changed this is, we have to execute
> "remote-test-server" on the image through background ssh.
> So that the "remote-test-server" will be alive waiting for connection.
> Then in the rust.py  control passed to the next command (cmd) for
> execution.
> If we use the sshcontrol.py method we have to set a timeout of 600
> otherwise default timeout is 300. Even if the test execution completes
> early due to failure then we have to wait till this timeout.
>
> I tried reducing the timeout to 60 seconds and some of the tests got
> skipped.
>
> If that is ok I will use that copy_to and run from sshcontrol.py as we
> did in v4 patches and work for the result.output
>
> Regards,
> Vinay
>
> On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> >>
> >> +                       # To kill remote-test-server executing through
> background ssh
> >> +                       killcommand = "kill -9 \$(ps | grep
> remote-test-server |  grep -v \"grep\" | awk '{print \$1}')"
> >> +                       cmd = cmd + "ssh %s root@%s \"%s\";" %
> (sshargs, qemu.ip, killcommand)
> >
> >
> > I don't think you actually need to kill the remote test server. As qemu
> will be stopped anyway, and with it, all the processes that run inside qemu.
> >
> > Also, it's better to use cmd only to execute the tests. Starting the
> server is better done through SSHControl.run(), and copying the binary via
> SSHControl.copy_to() - see examples in selfttest's imagefeatures.py or
> runtime_test.py.
> >
> > Alex
> >
>

--000000000000f0248905c34fd523
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Vinay,</div><div><br></div><div>sure, no proble=
m. I see that SSHControl.run() isn&#39;t designed for starting background p=
rocesses on the target. But I still think it&#39;s then better to use subpr=
ocess module for starting the server over ssh, rather than bundle everythin=
g into one gigantic runCmd().</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, 27 May 2021 at 14:18, Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmai=
l.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi Alex,<br>
<br>
The reason why I changed this is, we have to execute<br>
&quot;remote-test-server&quot; on the image through background ssh.<br>
So that the &quot;remote-test-server&quot; will be alive waiting for connec=
tion.<br>
Then in the rust.py=C2=A0 control passed to the next command (cmd) for<br>
execution.<br>
If we use the sshcontrol.py method we have to set a timeout of 600<br>
otherwise default timeout is 300. Even if the test execution completes<br>
early due to failure then we have to wait till this timeout.<br>
<br>
I tried reducing the timeout to 60 seconds and some of the tests got skippe=
d.<br>
<br>
If that is ok I will use that copy_to and run from sshcontrol.py as we<br>
did in v4 patches and work for the result.output<br>
<br>
Regards,<br>
Vinay<br>
<br>
On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 27 May 2021 at 10:11, Vinay Kumar &lt;<a href=3D"mailto:vinay.=
m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0# To kill remote-test-server executing through backgrou=
nd ssh<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0killcommand =3D &quot;kill -9 \$(ps | grep remote-test-=
server |=C2=A0 grep -v \&quot;grep\&quot; | awk &#39;{print \$1}&#39;)&quot=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot;ssh %s root@%s \&quot;%s\&quot;;&qu=
ot; % (sshargs, qemu.ip, killcommand)<br>
&gt;<br>
&gt;<br>
&gt; I don&#39;t think you actually need to kill the remote test server. As=
 qemu will be stopped anyway, and with it, all the processes that run insid=
e qemu.<br>
&gt;<br>
&gt; Also, it&#39;s better to use cmd only to execute the tests. Starting t=
he server is better done through SSHControl.run(), and copying the binary v=
ia SSHControl.copy_to() - see examples in selfttest&#39;s imagefeatures.py =
or runtime_test.py.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
</blockquote></div>

--000000000000f0248905c34fd523--
