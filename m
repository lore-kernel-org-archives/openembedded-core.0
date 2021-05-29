Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web12.19038.1622279904173586676
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 02:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GKpBr1ey;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id i8-20020a4aa1080000b0290201edd785e7so1534271ool.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sM165Zaa5ns9ChMKb90JFxtCYbQo5LlmgrVWpadN2q4=;
        b=GKpBr1eyi8kKhWVDyQbmzQ3GbD4TnBB18+udF0z6iKseWeZjwK4vxeQkR+O/aELyC8
         I+KSPiI4mewlPYFyIxCEI8+CbcZ18FfFzAoYNLYg5AJ0lRPpuOvjg+E50UyTMXLULn+k
         9z9BAbZi2xhY3LXlne/O3SffsYIJNS45zXvbvYwQ6pa5uXQ96MV5CIAOetaFKMWTvgBT
         VNXECLwlr5ydbuNl7dLxfzySIw8MgWbFdTXEC8f5DDBEW+naQkKZIDiuNK/AiuHmOOYQ
         EUkxtpdLR0HGPCfqBbVkMWsxeuUET5RWvHKn6vFOv/769C4sAYsAEn3whCK3wrlfJADN
         ZaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sM165Zaa5ns9ChMKb90JFxtCYbQo5LlmgrVWpadN2q4=;
        b=tDISKOaH6yO9UVHm1ajB783gSe89+KruT/VJdOIRWaIF+KXcJmCKwgIMsNvGAx1hcd
         VZ2hLA26FLlA5XLy6Y1o/eSxVjL64cVNsT/inTojazWr/qLpeXZiOY0Kb8iKqh3orLsL
         gXdQjXYqxKdFBXqAvqlQGujMgX8LBOzoayBWiWJ70PhX/7ZvMsYVvPZOMAMfgtESS259
         TRRrGQXiFnHl3+GAXdt1poiWf49T/pITOhXgVSN53RXoBWy0yMaeMxogNpZEJSp36S0W
         NLbu9gtVu0qq74jSXV5ijIiGFwPgjg2Y+TZPlnGbGqy1tTVBs2TV4p51VKRqC30POIGW
         o1jg==
X-Gm-Message-State: AOAM533pTw55rMVHhNQAO81eZqVmy6vzRwIk79ZaUiacOo7OzFQ1hpbO
	pszXuZkCnZiMmRYDMHQe7Xzx7KdZQMg8SK6elRI=
X-Google-Smtp-Source: ABdhPJzEFcmhJQk2TEf6/XBA6QdXg7zD9y8JtWHwKmd/zI8TchPhWOLW7qZoF0hnJ3uEFQP+voVMOuNSPCSzsj/EPxM=
X-Received: by 2002:a4a:cb15:: with SMTP id r21mr9929942ooq.38.1622279903383;
 Sat, 29 May 2021 02:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
 <CANNYZj8wK=MCOQzGrnZf4AyJS_-0NXV9WXXhXef0psouhamJxQ@mail.gmail.com>
 <CANUMPcWXEqZ2sCtbk7=zZ_j0i8HFPbbDBQ9xb4n3vQFGfXc9aA@mail.gmail.com>
 <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <CANUMPcWV-5rxqVyMA0zzsFVTZiDCt9eGRYgOmEuYtrVpEm-oZg@mail.gmail.com> <CANNYZj_V3eCdT8YBfc2uqzseeXQ9kaKCCVs9pUA17VYbgtxM=w@mail.gmail.com>
In-Reply-To: <CANNYZj_V3eCdT8YBfc2uqzseeXQ9kaKCCVs9pUA17VYbgtxM=w@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Sat, 29 May 2021 14:48:11 +0530
Message-ID: <CANUMPcVekxfEGjeOB=W+wHJOVLeCTzZ-3-XBxWa-kqwtz1MLGw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Is the below comment about execution time is ok ?

+# Total time taken for testing is of about 2hr 20min, with
PARALLEL_MAKE set to 40 number of jobs.
 class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):

And, should I send v8 version of patches (all 5 patches) or only the
patch of rust.py  with this comment as v8 patch ?

Regards,
Vinay

On Sat, May 29, 2021 at 2:40 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Thanks Vinay, the code looks nice and clean now, and I have no further co=
mments about it.
>
> I would only ask that you put the amount of time it takes to (successfull=
y) execute as a comment just before the class definition, so that anyone wh=
o needs to allocate CI resources for this test knows what is the reasonable=
 way to run it.
>
> Alex
>
> On Fri, 28 May 2021 at 18:13, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Hi Alex,
>>
>> Please ignore the v6 patch set. As there is minor correction in rust.py
>> - cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test
>> codegen %s --target %s ;" % (builddir, testargs, targetsys)
>> + cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s
>> --target %s ;" % (builddir, testargs, targetsys)
>>
>> Sent v7 patches with corrections of runCmd and ssh.
>>
>> For copying "remote-test-server" used copy_to from sshcontrol.py, and
>> for ssh background execution used "subprocess" module.
>>
>> Regarding result.output, whenever there is failure it gets printed
>> test summary and also captured in "oe-selftest-results.log".
>> And when there is failure with runCmd then no test summary details or
>> printed.  This is taken care of by runCmd() itself from commands.py.
>>
>> Verified with 2 independent test modules "compile-fail" and "codegen"
>> which are part of rust testing.
>>
>> compile-test : All tests get passed and no errors thrown, so
>> oe-selftes does not print the test results.
>>
>> codegen : Some of the tests fail, making the shell exit. In this case
>> oe-selftest prints test details with stdout and stderr.
>>
>> Regards,
>> Vinay
>>
>>
>> On Thu, May 27, 2021 at 7:05 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Hello Vinay,
>> >
>> > sure, no problem. I see that SSHControl.run() isn't designed for start=
ing background processes on the target. But I still think it's then better =
to use subprocess module for starting the server over ssh, rather than bund=
le everything into one gigantic runCmd().
>> >
>> > Alex
>> >
>> > On Thu, 27 May 2021 at 14:18, Vinay Kumar <vinay.m.engg@gmail.com> wro=
te:
>> >>
>> >> Hi Alex,
>> >>
>> >> The reason why I changed this is, we have to execute
>> >> "remote-test-server" on the image through background ssh.
>> >> So that the "remote-test-server" will be alive waiting for connection=
.
>> >> Then in the rust.py  control passed to the next command (cmd) for
>> >> execution.
>> >> If we use the sshcontrol.py method we have to set a timeout of 600
>> >> otherwise default timeout is 300. Even if the test execution complete=
s
>> >> early due to failure then we have to wait till this timeout.
>> >>
>> >> I tried reducing the timeout to 60 seconds and some of the tests got =
skipped.
>> >>
>> >> If that is ok I will use that copy_to and run from sshcontrol.py as w=
e
>> >> did in v4 patches and work for the result.output
>> >>
>> >> Regards,
>> >> Vinay
>> >>
>> >> On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin
>> >> <alex.kanavin@gmail.com> wrote:
>> >> >
>> >> > On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.com> =
wrote:
>> >> >>
>> >> >> +                       # To kill remote-test-server executing thr=
ough background ssh
>> >> >> +                       killcommand =3D "kill -9 \$(ps | grep remo=
te-test-server |  grep -v \"grep\" | awk '{print \$1}')"
>> >> >> +                       cmd =3D cmd + "ssh %s root@%s \"%s\";" % (=
sshargs, qemu.ip, killcommand)
>> >> >
>> >> >
>> >> > I don't think you actually need to kill the remote test server. As =
qemu will be stopped anyway, and with it, all the processes that run inside=
 qemu.
>> >> >
>> >> > Also, it's better to use cmd only to execute the tests. Starting th=
e server is better done through SSHControl.run(), and copying the binary vi=
a SSHControl.copy_to() - see examples in selfttest's imagefeatures.py or ru=
ntime_test.py.
>> >> >
>> >> > Alex
>> >> >
