Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web09.19282.1622281771799327343
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 02:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=moSnht4i;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id j67so626650vsc.13
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bceENIL6FCKm4GVU4DHZJHKQ/zDznG3T8DVkOLS2z24=;
        b=moSnht4ipIZDQmoGVzMnfDshp5x6/EVa3eBq+ww3idMBcQnA7NuuMOYS9a402wWEGO
         EHBecUdkUXKI6+/i8A4GOmbiR6YwBimBChvsgrAGbIOX2ufleTNJAc7/1exFApECR9Xa
         KgdyaGx7Aga82OiaONmyiFotSkjMJO4c5bV0fT12lmByUCTdITuJQawMURzLEI5auIUK
         kFFGeHnDZM30ZLkN8JohkUQZas9ffP/79WqFiPKWyHTORX0PNNbc+5xRmilMeoUds576
         Zpide9yrEIDRwvT8ULvBFrRr/5PzBM+oyb0W3aAoAgN3rieS3+TJa+j7c6s/rm09A1wp
         Q6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bceENIL6FCKm4GVU4DHZJHKQ/zDznG3T8DVkOLS2z24=;
        b=HuG0SVHiX14VF2RxGe+CppKbA9Ew0VJEd2JwkHv+8YcujGqLwOoy55nvKkCWfoFW2m
         GHBpqnZlKVAsWAZvcV8QOr6PyBxocrVGOWy4sE59gDcVEF7STz1e7EBV2QueXabDhpf/
         YptPu7Ep8nV536sqgnusbDrgZtGr6YEwJtm1+01VkdhbePE8SpkHTL7Bvxq+3GYNdfvh
         fAcQ4e5ElNWvrssPM5QG0/4MozDyWcqva9txZGmY0zRqFPn6ipHwZGViX3cetNKBFPhK
         yQFvF/J5P/t7J8lL8hpTZP0+hsntpSfGonGvPNFAtTHu8OIj7kBgaK0Kcou/zqyLqNyu
         YjXw==
X-Gm-Message-State: AOAM531FCSKwvZtEQMalOJ9nCRU6H4zvqFWTowRozF6uKzjlpYjAm2Pd
	zGbpyiLiGGYahwHl7OVHAJEvlBTyflLeoA7Pcn8=
X-Google-Smtp-Source: ABdhPJzfb8NHwjPRFVmkANLBt+ZMFMwIV/C5Pe0/RJnSRE8WyPptNX92Y72s/LtnMu7m1E9jy95ge8Sm3ZADRXDvhCI=
X-Received: by 2002:a67:f04a:: with SMTP id q10mr9672038vsm.41.1622281770783;
 Sat, 29 May 2021 02:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
 <CANNYZj8wK=MCOQzGrnZf4AyJS_-0NXV9WXXhXef0psouhamJxQ@mail.gmail.com>
 <CANUMPcWXEqZ2sCtbk7=zZ_j0i8HFPbbDBQ9xb4n3vQFGfXc9aA@mail.gmail.com>
 <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <CANUMPcWV-5rxqVyMA0zzsFVTZiDCt9eGRYgOmEuYtrVpEm-oZg@mail.gmail.com>
 <CANNYZj_V3eCdT8YBfc2uqzseeXQ9kaKCCVs9pUA17VYbgtxM=w@mail.gmail.com> <CANUMPcVekxfEGjeOB=W+wHJOVLeCTzZ-3-XBxWa-kqwtz1MLGw@mail.gmail.com>
In-Reply-To: <CANUMPcVekxfEGjeOB=W+wHJOVLeCTzZ-3-XBxWa-kqwtz1MLGw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 29 May 2021 11:49:19 +0200
Message-ID: <CANNYZj8i1D15ePeor45k2Mpec3vq7y6PSU8+ynLvSzRdnfL1Hg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <rwmacleod@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000ac574c05c374e899"

--000000000000ac574c05c374e899
Content-Type: text/plain; charset="UTF-8"

Thanks, that is fine and please resend once more the whole set.


Alex

On Sat 29. May 2021 at 11.18, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Hi Alex,
>
> Is the below comment about execution time is ok ?
>
> +# Total time taken for testing is of about 2hr 20min, with
> PARALLEL_MAKE set to 40 number of jobs.
>  class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
>
> And, should I send v8 version of patches (all 5 patches) or only the
> patch of rust.py  with this comment as v8 patch ?
>
> Regards,
> Vinay
>
> On Sat, May 29, 2021 at 2:40 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Thanks Vinay, the code looks nice and clean now, and I have no further
> comments about it.
> >
> > I would only ask that you put the amount of time it takes to
> (successfully) execute as a comment just before the class definition, so
> that anyone who needs to allocate CI resources for this test knows what is
> the reasonable way to run it.
> >
> > Alex
> >
> > On Fri, 28 May 2021 at 18:13, Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> >>
> >> Hi Alex,
> >>
> >> Please ignore the v6 patch set. As there is minor correction in rust.py
> >> - cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test
> >> codegen %s --target %s ;" % (builddir, testargs, targetsys)
> >> + cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s
> >> --target %s ;" % (builddir, testargs, targetsys)
> >>
> >> Sent v7 patches with corrections of runCmd and ssh.
> >>
> >> For copying "remote-test-server" used copy_to from sshcontrol.py, and
> >> for ssh background execution used "subprocess" module.
> >>
> >> Regarding result.output, whenever there is failure it gets printed
> >> test summary and also captured in "oe-selftest-results.log".
> >> And when there is failure with runCmd then no test summary details or
> >> printed.  This is taken care of by runCmd() itself from commands.py.
> >>
> >> Verified with 2 independent test modules "compile-fail" and "codegen"
> >> which are part of rust testing.
> >>
> >> compile-test : All tests get passed and no errors thrown, so
> >> oe-selftes does not print the test results.
> >>
> >> codegen : Some of the tests fail, making the shell exit. In this case
> >> oe-selftest prints test details with stdout and stderr.
> >>
> >> Regards,
> >> Vinay
> >>
> >>
> >> On Thu, May 27, 2021 at 7:05 PM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Hello Vinay,
> >> >
> >> > sure, no problem. I see that SSHControl.run() isn't designed for
> starting background processes on the target. But I still think it's then
> better to use subprocess module for starting the server over ssh, rather
> than bundle everything into one gigantic runCmd().
> >> >
> >> > Alex
> >> >
> >> > On Thu, 27 May 2021 at 14:18, Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> >> >>
> >> >> Hi Alex,
> >> >>
> >> >> The reason why I changed this is, we have to execute
> >> >> "remote-test-server" on the image through background ssh.
> >> >> So that the "remote-test-server" will be alive waiting for
> connection.
> >> >> Then in the rust.py  control passed to the next command (cmd) for
> >> >> execution.
> >> >> If we use the sshcontrol.py method we have to set a timeout of 600
> >> >> otherwise default timeout is 300. Even if the test execution
> completes
> >> >> early due to failure then we have to wait till this timeout.
> >> >>
> >> >> I tried reducing the timeout to 60 seconds and some of the tests got
> skipped.
> >> >>
> >> >> If that is ok I will use that copy_to and run from sshcontrol.py as
> we
> >> >> did in v4 patches and work for the result.output
> >> >>
> >> >> Regards,
> >> >> Vinay
> >> >>
> >> >> On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin
> >> >> <alex.kanavin@gmail.com> wrote:
> >> >> >
> >> >> > On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> >> >> >>
> >> >> >> +                       # To kill remote-test-server executing
> through background ssh
> >> >> >> +                       killcommand = "kill -9 \$(ps | grep
> remote-test-server |  grep -v \"grep\" | awk '{print \$1}')"
> >> >> >> +                       cmd = cmd + "ssh %s root@%s \"%s\";" %
> (sshargs, qemu.ip, killcommand)
> >> >> >
> >> >> >
> >> >> > I don't think you actually need to kill the remote test server. As
> qemu will be stopped anyway, and with it, all the processes that run inside
> qemu.
> >> >> >
> >> >> > Also, it's better to use cmd only to execute the tests. Starting
> the server is better done through SSHControl.run(), and copying the binary
> via SSHControl.copy_to() - see examples in selfttest's imagefeatures.py or
> runtime_test.py.
> >> >> >
> >> >> > Alex
> >> >> >
>

--000000000000ac574c05c374e899
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, that is fine and please resend once more the whol=
e set.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sat 29. May 2021 at 11.18, Vinay Kumar &lt;<a href=
=3D"mailto:vinay.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">Hi Alex,<br>
<br>
Is the below comment about execution time is ok ?<br>
<br>
+# Total time taken for testing is of about 2hr 20min, with<br>
PARALLEL_MAKE set to 40 number of jobs.<br>
=C2=A0class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):<br=
>
<br>
And, should I send v8 version of patches (all 5 patches) or only the<br>
patch of rust.py=C2=A0 with this comment as v8 patch ?<br>
<br>
Regards,<br>
Vinay<br>
<br>
On Sat, May 29, 2021 at 2:40 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks Vinay, the code looks nice and clean now, and I have no further=
 comments about it.<br>
&gt;<br>
&gt; I would only ask that you put the amount of time it takes to (successf=
ully) execute as a comment just before the class definition, so that anyone=
 who needs to allocate CI resources for this test knows what is the reasona=
ble way to run it.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Fri, 28 May 2021 at 18:13, Vinay Kumar &lt;<a href=3D"mailto:vinay.=
m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt;<br>
&gt;&gt; Hi Alex,<br>
&gt;&gt;<br>
&gt;&gt; Please ignore the v6 patch set. As there is minor correction in ru=
st.py<br>
&gt;&gt; - cmd =3D cmd + &quot; cd %s;=C2=A0 python3 src/bootstrap/bootstra=
p.py test<br>
&gt;&gt; codegen %s --target %s ;&quot; % (builddir, testargs, targetsys)<b=
r>
&gt;&gt; + cmd =3D cmd + &quot; cd %s;=C2=A0 python3 src/bootstrap/bootstra=
p.py test %s<br>
&gt;&gt; --target %s ;&quot; % (builddir, testargs, targetsys)<br>
&gt;&gt;<br>
&gt;&gt; Sent v7 patches with corrections of runCmd and ssh.<br>
&gt;&gt;<br>
&gt;&gt; For copying &quot;remote-test-server&quot; used copy_to from sshco=
ntrol.py, and<br>
&gt;&gt; for ssh background execution used &quot;subprocess&quot; module.<b=
r>
&gt;&gt;<br>
&gt;&gt; Regarding result.output, whenever there is failure it gets printed=
<br>
&gt;&gt; test summary and also captured in &quot;oe-selftest-results.log&qu=
ot;.<br>
&gt;&gt; And when there is failure with runCmd then no test summary details=
 or<br>
&gt;&gt; printed.=C2=A0 This is taken care of by runCmd() itself from comma=
nds.py.<br>
&gt;&gt;<br>
&gt;&gt; Verified with 2 independent test modules &quot;compile-fail&quot; =
and &quot;codegen&quot;<br>
&gt;&gt; which are part of rust testing.<br>
&gt;&gt;<br>
&gt;&gt; compile-test : All tests get passed and no errors thrown, so<br>
&gt;&gt; oe-selftes does not print the test results.<br>
&gt;&gt;<br>
&gt;&gt; codegen : Some of the tests fail, making the shell exit. In this c=
ase<br>
&gt;&gt; oe-selftest prints test details with stdout and stderr.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Vinay<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, May 27, 2021 at 7:05 PM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello Vinay,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; sure, no problem. I see that SSHControl.run() isn&#39;t desig=
ned for starting background processes on the target. But I still think it&#=
39;s then better to use subprocess module for starting the server over ssh,=
 rather than bundle everything into one gigantic runCmd().<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Alex<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, 27 May 2021 at 14:18, Vinay Kumar &lt;<a href=3D"mail=
to:vinay.m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi Alex,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The reason why I changed this is, we have to execute<br>
&gt;&gt; &gt;&gt; &quot;remote-test-server&quot; on the image through backg=
round ssh.<br>
&gt;&gt; &gt;&gt; So that the &quot;remote-test-server&quot; will be alive =
waiting for connection.<br>
&gt;&gt; &gt;&gt; Then in the rust.py=C2=A0 control passed to the next comm=
and (cmd) for<br>
&gt;&gt; &gt;&gt; execution.<br>
&gt;&gt; &gt;&gt; If we use the sshcontrol.py method we have to set a timeo=
ut of 600<br>
&gt;&gt; &gt;&gt; otherwise default timeout is 300. Even if the test execut=
ion completes<br>
&gt;&gt; &gt;&gt; early due to failure then we have to wait till this timeo=
ut.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I tried reducing the timeout to 60 seconds and some of th=
e tests got skipped.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; If that is ok I will use that copy_to and run from sshcon=
trol.py as we<br>
&gt;&gt; &gt;&gt; did in v4 patches and work for the result.output<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Regards,<br>
&gt;&gt; &gt;&gt; Vinay<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_=
blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Thu, 27 May 2021 at 10:11, Vinay Kumar &lt;<a hre=
f=3D"mailto:vinay.m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# To kill remote-test-server executin=
g through background ssh<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0killcommand =3D &quot;kill -9 \$(ps |=
 grep remote-test-server |=C2=A0 grep -v \&quot;grep\&quot; | awk &#39;{pri=
nt \$1}&#39;)&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot;ssh %s root@%s \&=
quot;%s\&quot;;&quot; % (sshargs, qemu.ip, killcommand)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I don&#39;t think you actually need to kill the remo=
te test server. As qemu will be stopped anyway, and with it, all the proces=
ses that run inside qemu.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Also, it&#39;s better to use cmd only to execute the=
 tests. Starting the server is better done through SSHControl.run(), and co=
pying the binary via SSHControl.copy_to() - see examples in selfttest&#39;s=
 imagefeatures.py or runtime_test.py.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Alex<br>
&gt;&gt; &gt;&gt; &gt;<br>
</blockquote></div></div>

--000000000000ac574c05c374e899--
