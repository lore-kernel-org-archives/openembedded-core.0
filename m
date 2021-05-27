Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.4499.1622107883435131401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 02:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bN87CXN1;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id f11so61750vst.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z/l+3dl2X8OkTUDP5gEcskI3JOQVPe6+WWKzs2zecMk=;
        b=bN87CXN1L8dW1Tf1iaMl2yO805JRAvQZZFXXqJbbwaGPR1B11WMSLUDjg2pGQLG91C
         3Zyl+9q6QOt0sNC+vJam+4osFyRItZ/el/2hZGBMSiQ68g6mf0G6PXnCuyKlyk7Zc7Tm
         tnirs8gF3LIixNNCixQW+p3DZTNwMnh6E2vRjQDc9ljVehHnYg6JNmzjIZThNNxDZCJB
         Ray79G/lA77X/a7gIw7heeVktaRs5i9pvof5TP/ARWk0DkaUTZa6PbnaquQybxyK7UC6
         04U/uF0KKSZFo21RA55byGQvq1xL/0tXTOxk3Sg4CNxOTSo2z7UN9QoFN09S6qbX/1lv
         Akbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z/l+3dl2X8OkTUDP5gEcskI3JOQVPe6+WWKzs2zecMk=;
        b=XRcumaMR56e6TVfrhuzrKFcZn8VSQShu4QJDmPpBvVyd04osyqpc//QxppKebgVQuz
         xXaKZxfcFXuAuOiVccCHj9OGfBizz0f1Bdp5YAkDE+d5bkr9IkiRUsoVeQV+Ph9Vw/QN
         0pQptv9J2gkNTRwud61EyORvp4PRpuiTAX84kbhD0ZJGqK1QI1IIc5yo8gDP2vGHCC8t
         fRWq7+hezT83cGyo2pW72KyBDNb7+WRmRUx3dRq4qEq/U7v8rZOXBLA35L8fIsdTZRnQ
         i1GgE0YgvR4yTt9gml3UEQwlWieLa2UXXTuIA9UgftMpKwr9LbhIeJ0tVq2SS0gq4ubu
         1gWg==
X-Gm-Message-State: AOAM5318EXultZW7rR7TkS8VxO9J78TdMk2Uvu/6a9c8PHGaqs1zjx2D
	vnPTXGrbX/CHMjmRneTR02K6Z047bN6Vv6XSu3w=
X-Google-Smtp-Source: ABdhPJwPuZPjKoS1Vu7Nn0fgPn59qXU/1SKp4mJGeCjLzFitPm/rtWRRejEbLfYSiBE9x8JCE+U5rLz8R6zjrFpbsWU=
X-Received: by 2002:a67:f04a:: with SMTP id q10mr1363421vsm.41.1622107882522;
 Thu, 27 May 2021 02:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
 <1682DF4C7F380F13.5334@lists.openembedded.org>
In-Reply-To: <1682DF4C7F380F13.5334@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 27 May 2021 11:31:10 +0200
Message-ID: <CANNYZj9Te3duVzx1NNPpuUvHFmY81pKab+-Eb10Km=BEPCgKqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Vinay Kumar <vinay.m.engg@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000200a7005c34c6cc7"

--000000000000200a7005c34c6cc7
Content-Type: text/plain; charset="UTF-8"

Alternatively, simply capture the output in result.output without
summary.txt redirection
(e.g. drop the '> summary.txt' bit); we can fine-tune the failure
processing later on.

Alex

On Thu, 27 May 2021 at 10:32, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
>> +                       cmd = cmd + " cd %s;  python3
>> src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1;" %
>> (builddir, testargs, targetsys)
>> +                       # To kill remote-test-server executing through
>> background ssh
>> +                       killcommand = "kill -9 \$(ps | grep
>> remote-test-server |  grep -v \"grep\" | awk '{print \$1}')"
>> +                       cmd = cmd + "ssh %s root@%s \"%s\";" % (sshargs,
>> qemu.ip, killcommand)
>> +                       result = runCmd(cmd)
>> +                       self.assertEqual(0, result.status, 'oe-selftest
>> returned a non 0 status:%s' % result.output)
>
>
> What does result.output contains if the test fails? Since both stdout and
> stderr are redirected to a file, there might be nothing at all there?
>
> I'd suggest you actually print all of summary.txt in case of failure (yes
> it's over a megabyte, that is fine), and also point out where the file can
> be found for further inspection.
>
> Alex
>
> 
>
>

--000000000000200a7005c34c6cc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Alternatively, simply capture the output in result.ou=
tput without summary.txt redirection <br>(e.g. drop the &#39;&gt; summary.t=
xt&#39; bit); we can fine-tune the failure processing later on.</div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 27 May 2021 at 10:32, Alexander Kana=
vin via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, 27 May 2021 at 10:11, Vinay Ku=
mar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com" target=3D"_blank">vinay.m=
.engg@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot; cd %s;=C2=A0 python3 src/boot=
strap/bootstrap.py test %s --target %s &gt; summary.txt 2&gt;&amp;1;&quot; =
% (builddir, testargs, targetsys)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0# To kill remote-test-server executing through background ssh<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0killcommand =3D &quot;kill -9 \$(ps | grep remote-test-server |=
=C2=A0 grep -v \&quot;grep\&quot; | awk &#39;{print \$1}&#39;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0cmd =3D cmd + &quot;ssh %s root@%s \&quot;%s\&quot;;&quot; % (ss=
hargs, qemu.ip, killcommand)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0result =3D runCmd(cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0self.assertEqual(0, result.status, &#39;oe-selftest returned a n=
on 0 status:%s&#39; % result.output)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</blockquote><div><br><=
/div><div>What does result.output contains if the test fails? Since both st=
dout and stderr are redirected to a file, there might be nothing at all the=
re?</div><div><br></div><div>I&#39;d suggest you actually print all of summ=
ary.txt in case of failure (yes it&#39;s over a megabyte, that is fine), an=
d also point out where the file can be found for further inspection.</div><=
div><br></div><div>Alex<br></div></div></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000200a7005c34c6cc7--
