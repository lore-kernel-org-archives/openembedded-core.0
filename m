Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.14332.1622236216133408160
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 14:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p8ifETeB;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id x1so2886512uau.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+VRHOjCZncDy/5ZsmG82c4GYAKa+dg5upNx9VYjLVs=;
        b=p8ifETeBqegdWMQigo9hRLbZIZ6nPOuKR1lROtVkajX6ycNiy0RxPjUjR3i0MhjmUa
         anlFeCZfIszY1tXbnBy9rVFA0Rq7uZvEKQsT5/fE9rj/84a04hHj2vQBFxWFV6qn6J1b
         IMj7ShuLXdVhq3evzBMu9hzwJCgGmqqAvNMhuDEbkyZnl3+qzbq+9XIKiePpskJxfpD/
         Weah3EniXq5oyv9hcwjZCLNbi0m4a4sNxt8ibmBirpkHLNeDJcp2lo0Cw6GNhJ+J+wu5
         QSBkpjxR6Q74LtPpAaPKyDV9ENp3FuObJ0UnEgXVkxcAaPr0A3Pfm2+DWgvzh8//B2Zm
         lL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+VRHOjCZncDy/5ZsmG82c4GYAKa+dg5upNx9VYjLVs=;
        b=RX8oj5udDD5HC84JAY4t1aCDB0DOySp998QetMHfrGFx77c9GFSTB/Slv0D90YvnFe
         jG2lGsUYkS775CsbMj0fR+kW3xv68mtcU+vfwEkhVlUmnmnN8jero+NfOHYtaFOxK+Fm
         yH5fd62mpgdm+U3Jz8XjJeuXDKNtVc48QVxmG75091EqDTfi0m+k8XOUTHd1tMlYZSbN
         1A80TSqVU5vG6pAkGoSGnk90SLMC54iu4q+4b0FKXf6bLmuxMwwJcgiwFb80oxpKKSlP
         BLz8tITQqRGKw/dzxOnT7R2vuKTsr3zjQ5a+11nujFUVYNVnOpgR1OkdYgYJtxcI/IE/
         u14g==
X-Gm-Message-State: AOAM531Md881JQyFq/YwZKfjHHb1DeWI87HQpo52gxFIsZToqDBkveFG
	x7NCoAQRy++qOoT1plM1h2x9Dhw6w22+sYFmKlc=
X-Google-Smtp-Source: ABdhPJxKUrqiC+me2kb4Mo6zZfIWmm9up7fjWkDYjgMmoZ2elco4OVZLbW0WQ8a9860xGQpteaYni38wKSfSqDUxv5E=
X-Received: by 2002:a1f:b217:: with SMTP id b23mr8561461vkf.16.1622236215269;
 Fri, 28 May 2021 14:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
 <CANNYZj8wK=MCOQzGrnZf4AyJS_-0NXV9WXXhXef0psouhamJxQ@mail.gmail.com>
 <CANUMPcWXEqZ2sCtbk7=zZ_j0i8HFPbbDBQ9xb4n3vQFGfXc9aA@mail.gmail.com>
 <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com> <CANUMPcWV-5rxqVyMA0zzsFVTZiDCt9eGRYgOmEuYtrVpEm-oZg@mail.gmail.com>
In-Reply-To: <CANUMPcWV-5rxqVyMA0zzsFVTZiDCt9eGRYgOmEuYtrVpEm-oZg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 28 May 2021 23:10:03 +0200
Message-ID: <CANNYZj_V3eCdT8YBfc2uqzseeXQ9kaKCCVs9pUA17VYbgtxM=w@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="0000000000005a5c6a05c36a4deb"

--0000000000005a5c6a05c36a4deb
Content-Type: text/plain; charset="UTF-8"

Thanks Vinay, the code looks nice and clean now, and I have no further
comments about it.

I would only ask that you put the amount of time it takes to (successfully)
execute as a comment just before the class definition, so that anyone who
needs to allocate CI resources for this test knows what is the reasonable
way to run it.

Alex

On Fri, 28 May 2021 at 18:13, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Hi Alex,
>
> Please ignore the v6 patch set. As there is minor correction in rust.py
> - cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test
> codegen %s --target %s ;" % (builddir, testargs, targetsys)
> + cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s
> --target %s ;" % (builddir, testargs, targetsys)
>
> Sent v7 patches with corrections of runCmd and ssh.
>
> For copying "remote-test-server" used copy_to from sshcontrol.py, and
> for ssh background execution used "subprocess" module.
>
> Regarding result.output, whenever there is failure it gets printed
> test summary and also captured in "oe-selftest-results.log".
> And when there is failure with runCmd then no test summary details or
> printed.  This is taken care of by runCmd() itself from commands.py.
>
> Verified with 2 independent test modules "compile-fail" and "codegen"
> which are part of rust testing.
>
> compile-test : All tests get passed and no errors thrown, so
> oe-selftes does not print the test results.
>
> codegen : Some of the tests fail, making the shell exit. In this case
> oe-selftest prints test details with stdout and stderr.
>
> Regards,
> Vinay
>
>
> On Thu, May 27, 2021 at 7:05 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Hello Vinay,
> >
> > sure, no problem. I see that SSHControl.run() isn't designed for
> starting background processes on the target. But I still think it's then
> better to use subprocess module for starting the server over ssh, rather
> than bundle everything into one gigantic runCmd().
> >
> > Alex
> >
> > On Thu, 27 May 2021 at 14:18, Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> >>
> >> Hi Alex,
> >>
> >> The reason why I changed this is, we have to execute
> >> "remote-test-server" on the image through background ssh.
> >> So that the "remote-test-server" will be alive waiting for connection.
> >> Then in the rust.py  control passed to the next command (cmd) for
> >> execution.
> >> If we use the sshcontrol.py method we have to set a timeout of 600
> >> otherwise default timeout is 300. Even if the test execution completes
> >> early due to failure then we have to wait till this timeout.
> >>
> >> I tried reducing the timeout to 60 seconds and some of the tests got
> skipped.
> >>
> >> If that is ok I will use that copy_to and run from sshcontrol.py as we
> >> did in v4 patches and work for the result.output
> >>
> >> Regards,
> >> Vinay
> >>
> >> On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> >> >>
> >> >> +                       # To kill remote-test-server executing
> through background ssh
> >> >> +                       killcommand = "kill -9 \$(ps | grep
> remote-test-server |  grep -v \"grep\" | awk '{print \$1}')"
> >> >> +                       cmd = cmd + "ssh %s root@%s \"%s\";" %
> (sshargs, qemu.ip, killcommand)
> >> >
> >> >
> >> > I don't think you actually need to kill the remote test server. As
> qemu will be stopped anyway, and with it, all the processes that run inside
> qemu.
> >> >
> >> > Also, it's better to use cmd only to execute the tests. Starting the
> server is better done through SSHControl.run(), and copying the binary via
> SSHControl.copy_to() - see examples in selfttest's imagefeatures.py or
> runtime_test.py.
> >> >
> >> > Alex
> >> >
>

--0000000000005a5c6a05c36a4deb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Vinay, the code looks nice and clean now, and =
I have no further comments about it.</div><div><br></div><div>I would only =
ask that you put the amount of time it takes to (successfully) execute as a=
 comment just before the class definition, so that anyone who needs to allo=
cate CI resources for this test knows what is the reasonable way to run it.=
 <br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 28 May 2021 at 18:13, =
Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com">vinay.m.engg@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi Alex,<br>
<br>
Please ignore the v6 patch set. As there is minor correction in rust.py<br>
- cmd =3D cmd + &quot; cd %s;=C2=A0 python3 src/bootstrap/bootstrap.py test=
<br>
codegen %s --target %s ;&quot; % (builddir, testargs, targetsys)<br>
+ cmd =3D cmd + &quot; cd %s;=C2=A0 python3 src/bootstrap/bootstrap.py test=
 %s<br>
--target %s ;&quot; % (builddir, testargs, targetsys)<br>
<br>
Sent v7 patches with corrections of runCmd and ssh.<br>
<br>
For copying &quot;remote-test-server&quot; used copy_to from sshcontrol.py,=
 and<br>
for ssh background execution used &quot;subprocess&quot; module.<br>
<br>
Regarding result.output, whenever there is failure it gets printed<br>
test summary and also captured in &quot;oe-selftest-results.log&quot;.<br>
And when there is failure with runCmd then no test summary details or<br>
printed.=C2=A0 This is taken care of by runCmd() itself from commands.py.<b=
r>
<br>
Verified with 2 independent test modules &quot;compile-fail&quot; and &quot=
;codegen&quot;<br>
which are part of rust testing.<br>
<br>
compile-test : All tests get passed and no errors thrown, so<br>
oe-selftes does not print the test results.<br>
<br>
codegen : Some of the tests fail, making the shell exit. In this case<br>
oe-selftest prints test details with stdout and stderr.<br>
<br>
Regards,<br>
Vinay<br>
<br>
<br>
On Thu, May 27, 2021 at 7:05 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Vinay,<br>
&gt;<br>
&gt; sure, no problem. I see that SSHControl.run() isn&#39;t designed for s=
tarting background processes on the target. But I still think it&#39;s then=
 better to use subprocess module for starting the server over ssh, rather t=
han bundle everything into one gigantic runCmd().<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Thu, 27 May 2021 at 14:18, Vinay Kumar &lt;<a href=3D"mailto:vinay.=
m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt;<br>
&gt;&gt; Hi Alex,<br>
&gt;&gt;<br>
&gt;&gt; The reason why I changed this is, we have to execute<br>
&gt;&gt; &quot;remote-test-server&quot; on the image through background ssh=
.<br>
&gt;&gt; So that the &quot;remote-test-server&quot; will be alive waiting f=
or connection.<br>
&gt;&gt; Then in the rust.py=C2=A0 control passed to the next command (cmd)=
 for<br>
&gt;&gt; execution.<br>
&gt;&gt; If we use the sshcontrol.py method we have to set a timeout of 600=
<br>
&gt;&gt; otherwise default timeout is 300. Even if the test execution compl=
etes<br>
&gt;&gt; early due to failure then we have to wait till this timeout.<br>
&gt;&gt;<br>
&gt;&gt; I tried reducing the timeout to 60 seconds and some of the tests g=
ot skipped.<br>
&gt;&gt;<br>
&gt;&gt; If that is ok I will use that copy_to and run from sshcontrol.py a=
s we<br>
&gt;&gt; did in v4 patches and work for the result.output<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Vinay<br>
&gt;&gt;<br>
&gt;&gt; On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, 27 May 2021 at 10:11, Vinay Kumar &lt;<a href=3D"mail=
to:vinay.m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0# To kill remote-test-server executing through b=
ackground ssh<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0killcommand =3D &quot;kill -9 \$(ps | grep remot=
e-test-server |=C2=A0 grep -v \&quot;grep\&quot; | awk &#39;{print \$1}&#39=
;)&quot;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot;ssh %s root@%s \&quot;%s\&qu=
ot;;&quot; % (sshargs, qemu.ip, killcommand)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I don&#39;t think you actually need to kill the remote test s=
erver. As qemu will be stopped anyway, and with it, all the processes that =
run inside qemu.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also, it&#39;s better to use cmd only to execute the tests. S=
tarting the server is better done through SSHControl.run(), and copying the=
 binary via SSHControl.copy_to() - see examples in selfttest&#39;s imagefea=
tures.py or runtime_test.py.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Alex<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--0000000000005a5c6a05c36a4deb--
