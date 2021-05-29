Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.19765.1622286864788082052
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 04:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u8PLtYVH;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id w33so9178743lfu.7
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 04:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WCWdDqRFYGxhddPfx1G/2I1FiwyITlUG6AXVKfhmelQ=;
        b=u8PLtYVH6UYPaOGRdVGPksK4LSKs+onmixvKiIzRQ+iBe+/4hdZOsK85gnS1gj5spU
         vAv6ykGQybz94YPH8zYlbv34U65VFbjOzWFx+YM+0q+lkKOhFvwWl2ljHn+nOkkgTNZ8
         ScyFS8crKZPdvd/batpda7lAbbljRIcammMq/ENhrpRaFDlDTsKrQ559M+bFSPPgZ3Cp
         uiqn6MBw0jC49i8Fc+LCvcH+QI2gj/g3pD9uRPe51gjeswboIjBrZvdrO+2Ej17JbPd8
         XFq+JfmxxcpJUvF/mfSEyYNTVu1aX6bHCWCCFH97yLls2R4dCJ3Jrrr7x2Mx5Xnucq96
         aBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WCWdDqRFYGxhddPfx1G/2I1FiwyITlUG6AXVKfhmelQ=;
        b=RLPERMKVBRcNn8nAZkc4eWgB11uQZ3ODBW69Lk2sPS/GRaMFqkPBZRw7bECnaNe6gR
         opHdHKDrL/PJz2ip2K7RSHhn54GOlz/HSbBXNKnFulYU5syARGm7I1ye5otLFzv+p+vE
         /IRasXkWUHRGIKwtOPD4Qrmr0LsNUrVhBg1/g1jBva6sGiYZuflcdx0rzK28rCSr3IdM
         n3Wi+HMlRwpVN/Ye7nuMSstl7bJxyvrp6Lsym2t+Dgr4viUAQ5thOMsuSuY2aaomPza0
         rgC8Hrf3GuY7X0qRbVMWC7NkZyy8QtqgYCtvH9H/x3UZKcRgPTWxLeDEt0uGzUMy53gu
         ISrA==
X-Gm-Message-State: AOAM5308EGCftJ1egT+uoMALUePPpA62gnILHEg75REiryDl/rrMZJwM
	DkEa5MhzVq4qN0jJ7K8rYiHhRuNFj4szCvoxPKg=
X-Google-Smtp-Source: ABdhPJz5HZB6GDOZQWdIY1QJGFQzQzSOdW8XDSudkoKc/Mu+0tdJ+7pQ8O15pAy+JHD7wChHJ5jsQPJ8WQQU9jCrZnY=
X-Received: by 2002:ac2:5b1c:: with SMTP id v28mr102649lfn.207.1622286862425;
 Sat, 29 May 2021 04:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
 <CANNYZj8wK=MCOQzGrnZf4AyJS_-0NXV9WXXhXef0psouhamJxQ@mail.gmail.com>
 <CANUMPcWXEqZ2sCtbk7=zZ_j0i8HFPbbDBQ9xb4n3vQFGfXc9aA@mail.gmail.com>
 <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <CANUMPcWV-5rxqVyMA0zzsFVTZiDCt9eGRYgOmEuYtrVpEm-oZg@mail.gmail.com>
 <CANNYZj_V3eCdT8YBfc2uqzseeXQ9kaKCCVs9pUA17VYbgtxM=w@mail.gmail.com>
 <CANUMPcVekxfEGjeOB=W+wHJOVLeCTzZ-3-XBxWa-kqwtz1MLGw@mail.gmail.com> <CANNYZj8i1D15ePeor45k2Mpec3vq7y6PSU8+ynLvSzRdnfL1Hg@mail.gmail.com>
In-Reply-To: <CANNYZj8i1D15ePeor45k2Mpec3vq7y6PSU8+ynLvSzRdnfL1Hg@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Sat, 29 May 2021 16:44:10 +0530
Message-ID: <CANUMPcU3UJ8tgZQ3BiWQTR4HH01FZjPJ+6LhXNMUMHn9cvkwDg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <rwmacleod@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Sent v8 version patches.

Thanks for your quick and timely review comments.
Also, thanks for your help and suggestions in successfully implementing it.

Regards,
Vinay







On Sat, May 29, 2021 at 3:19 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Thanks, that is fine and please resend once more the whole set.
>
>
> Alex
>
> On Sat 29. May 2021 at 11.18, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Hi Alex,
>>
>> Is the below comment about execution time is ok ?
>>
>> +# Total time taken for testing is of about 2hr 20min, with
>> PARALLEL_MAKE set to 40 number of jobs.
>>  class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
>>
>> And, should I send v8 version of patches (all 5 patches) or only the
>> patch of rust.py  with this comment as v8 patch ?
>>
>> Regards,
>> Vinay
>>
>> On Sat, May 29, 2021 at 2:40 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Thanks Vinay, the code looks nice and clean now, and I have no further=
 comments about it.
>> >
>> > I would only ask that you put the amount of time it takes to (successf=
ully) execute as a comment just before the class definition, so that anyone=
 who needs to allocate CI resources for this test knows what is the reasona=
ble way to run it.
>> >
>> > Alex
>> >
>> > On Fri, 28 May 2021 at 18:13, Vinay Kumar <vinay.m.engg@gmail.com> wro=
te:
>> >>
>> >> Hi Alex,
>> >>
>> >> Please ignore the v6 patch set. As there is minor correction in rust.=
py
>> >> - cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test
>> >> codegen %s --target %s ;" % (builddir, testargs, targetsys)
>> >> + cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s
>> >> --target %s ;" % (builddir, testargs, targetsys)
>> >>
>> >> Sent v7 patches with corrections of runCmd and ssh.
>> >>
>> >> For copying "remote-test-server" used copy_to from sshcontrol.py, and
>> >> for ssh background execution used "subprocess" module.
>> >>
>> >> Regarding result.output, whenever there is failure it gets printed
>> >> test summary and also captured in "oe-selftest-results.log".
>> >> And when there is failure with runCmd then no test summary details or
>> >> printed.  This is taken care of by runCmd() itself from commands.py.
>> >>
>> >> Verified with 2 independent test modules "compile-fail" and "codegen"
>> >> which are part of rust testing.
>> >>
>> >> compile-test : All tests get passed and no errors thrown, so
>> >> oe-selftes does not print the test results.
>> >>
>> >> codegen : Some of the tests fail, making the shell exit. In this case
>> >> oe-selftest prints test details with stdout and stderr.
>> >>
>> >> Regards,
>> >> Vinay
>> >>
>> >>
>> >> On Thu, May 27, 2021 at 7:05 PM Alexander Kanavin
>> >> <alex.kanavin@gmail.com> wrote:
>> >> >
>> >> > Hello Vinay,
>> >> >
>> >> > sure, no problem. I see that SSHControl.run() isn't designed for st=
arting background processes on the target. But I still think it's then bett=
er to use subprocess module for starting the server over ssh, rather than b=
undle everything into one gigantic runCmd().
>> >> >
>> >> > Alex
>> >> >
>> >> > On Thu, 27 May 2021 at 14:18, Vinay Kumar <vinay.m.engg@gmail.com> =
wrote:
>> >> >>
>> >> >> Hi Alex,
>> >> >>
>> >> >> The reason why I changed this is, we have to execute
>> >> >> "remote-test-server" on the image through background ssh.
>> >> >> So that the "remote-test-server" will be alive waiting for connect=
ion.
>> >> >> Then in the rust.py  control passed to the next command (cmd) for
>> >> >> execution.
>> >> >> If we use the sshcontrol.py method we have to set a timeout of 600
>> >> >> otherwise default timeout is 300. Even if the test execution compl=
etes
>> >> >> early due to failure then we have to wait till this timeout.
>> >> >>
>> >> >> I tried reducing the timeout to 60 seconds and some of the tests g=
ot skipped.
>> >> >>
>> >> >> If that is ok I will use that copy_to and run from sshcontrol.py a=
s we
>> >> >> did in v4 patches and work for the result.output
>> >> >>
>> >> >> Regards,
>> >> >> Vinay
>> >> >>
>> >> >> On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin
>> >> >> <alex.kanavin@gmail.com> wrote:
>> >> >> >
>> >> >> > On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.co=
m> wrote:
>> >> >> >>
>> >> >> >> +                       # To kill remote-test-server executing =
through background ssh
>> >> >> >> +                       killcommand =3D "kill -9 \$(ps | grep r=
emote-test-server |  grep -v \"grep\" | awk '{print \$1}')"
>> >> >> >> +                       cmd =3D cmd + "ssh %s root@%s \"%s\";" =
% (sshargs, qemu.ip, killcommand)
>> >> >> >
>> >> >> >
>> >> >> > I don't think you actually need to kill the remote test server. =
As qemu will be stopped anyway, and with it, all the processes that run ins=
ide qemu.
>> >> >> >
>> >> >> > Also, it's better to use cmd only to execute the tests. Starting=
 the server is better done through SSHControl.run(), and copying the binary=
 via SSHControl.copy_to() - see examples in selfttest's imagefeatures.py or=
 runtime_test.py.
>> >> >> >
>> >> >> > Alex
>> >> >> >
