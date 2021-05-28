Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web12.10336.1622218405677026132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 09:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sp43cyNw;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id y7so360921ljd.7
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 09:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V5j96uN9k4nBGNt7qkV8nORtwE+6UBbotVbwiO9add8=;
        b=Sp43cyNwqZik6v1EEphIkBnYvwt9/GQAGmECzoSuInMCzjmqvcD0/qtjFXMKq7y9B6
         FMNgTmI7K3gYr/npNOIWPAX7Q70bJEPygwO89sus1kPDHhm78GGYMf5mFlW3kl/BviBI
         63fomc/DLQTIKrhzJ1U1b1TZ+a00AYT1vpdBcowXwl9jcDdQjnBZh2WBJGMaHgqhGSeg
         0/rqr2DgDCFQ6tMJWfcETxDNll2YepOyEBYbMmoXGipgyGnKzvZu2x798moizxjQGsIU
         F3sMit05neIhjv+zzfcmhgkcJEKCDvPOp7qgsjz1UQLAZwUs94X2yalFZgaoGE+w9E1B
         NRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V5j96uN9k4nBGNt7qkV8nORtwE+6UBbotVbwiO9add8=;
        b=E7kH/0Z+nrbkowokq7lwKnIc1c9TmvEv9gSrJq/ZRjmloesq46g9GaqlTUPmUyF4Bo
         viVCkw1HVPH9mB/G77gschvRoS7UuwfLVfOGBRr0AIHb/QS1WlQj4wJ6AL5tcqrBuRZf
         kZTaX1/vC46tdVUsaZulhqZ+TUzH3snKWDhPX2KpYNjXSkzO7gLz7kfUui5SahnVaUHz
         UjBPZBfaIsryJKbpaluW2DZpj+cCHyfGoJ5xSgWZAyX3cR9QVqMgWUSEZs1O7mDTYU/y
         fGDo68ypblVfKN8slLOOjZ9w+8VYpsTrpk3FCzSRw3MTm69wuuGLA7hjb4ElPF6lX3gY
         c5Vg==
X-Gm-Message-State: AOAM5318D6zRWVgI18gofXDem9ZvzKnfrSV44jNVfC6zE81brT8BoaMt
	3If9zjus8jsotsy4Z/hEIkis6hVFackspMGp+Ec=
X-Google-Smtp-Source: ABdhPJx6+ShVPDU9ZI3tGmvcChpDTBEQ1QulyZqe34Vrk86u3ScIxV1r7y3WQ9Cu5AHhjN1iFxZsU2maLVsELmlR4Sg=
X-Received: by 2002:a05:651c:233:: with SMTP id z19mr7153523ljn.324.1622218403588;
 Fri, 28 May 2021 09:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
 <CANNYZj8wK=MCOQzGrnZf4AyJS_-0NXV9WXXhXef0psouhamJxQ@mail.gmail.com>
 <CANUMPcWXEqZ2sCtbk7=zZ_j0i8HFPbbDBQ9xb4n3vQFGfXc9aA@mail.gmail.com> <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
In-Reply-To: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Fri, 28 May 2021 21:43:11 +0530
Message-ID: <CANUMPcWV-5rxqVyMA0zzsFVTZiDCt9eGRYgOmEuYtrVpEm-oZg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Please ignore the v6 patch set. As there is minor correction in rust.py
- cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test
codegen %s --target %s ;" % (builddir, testargs, targetsys)
+ cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s
--target %s ;" % (builddir, testargs, targetsys)

Sent v7 patches with corrections of runCmd and ssh.

For copying "remote-test-server" used copy_to from sshcontrol.py, and
for ssh background execution used "subprocess" module.

Regarding result.output, whenever there is failure it gets printed
test summary and also captured in "oe-selftest-results.log".
And when there is failure with runCmd then no test summary details or
printed.  This is taken care of by runCmd() itself from commands.py.

Verified with 2 independent test modules "compile-fail" and "codegen"
which are part of rust testing.

compile-test : All tests get passed and no errors thrown, so
oe-selftes does not print the test results.

codegen : Some of the tests fail, making the shell exit. In this case
oe-selftest prints test details with stdout and stderr.

Regards,
Vinay


On Thu, May 27, 2021 at 7:05 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Hello Vinay,
>
> sure, no problem. I see that SSHControl.run() isn't designed for starting=
 background processes on the target. But I still think it's then better to =
use subprocess module for starting the server over ssh, rather than bundle =
everything into one gigantic runCmd().
>
> Alex
>
> On Thu, 27 May 2021 at 14:18, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Hi Alex,
>>
>> The reason why I changed this is, we have to execute
>> "remote-test-server" on the image through background ssh.
>> So that the "remote-test-server" will be alive waiting for connection.
>> Then in the rust.py  control passed to the next command (cmd) for
>> execution.
>> If we use the sshcontrol.py method we have to set a timeout of 600
>> otherwise default timeout is 300. Even if the test execution completes
>> early due to failure then we have to wait till this timeout.
>>
>> I tried reducing the timeout to 60 seconds and some of the tests got ski=
pped.
>>
>> If that is ok I will use that copy_to and run from sshcontrol.py as we
>> did in v4 patches and work for the result.output
>>
>> Regards,
>> Vinay
>>
>> On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.com> wro=
te:
>> >>
>> >> +                       # To kill remote-test-server executing throug=
h background ssh
>> >> +                       killcommand =3D "kill -9 \$(ps | grep remote-=
test-server |  grep -v \"grep\" | awk '{print \$1}')"
>> >> +                       cmd =3D cmd + "ssh %s root@%s \"%s\";" % (ssh=
args, qemu.ip, killcommand)
>> >
>> >
>> > I don't think you actually need to kill the remote test server. As qem=
u will be stopped anyway, and with it, all the processes that run inside qe=
mu.
>> >
>> > Also, it's better to use cmd only to execute the tests. Starting the s=
erver is better done through SSHControl.run(), and copying the binary via S=
SHControl.copy_to() - see examples in selfttest's imagefeatures.py or runti=
me_test.py.
>> >
>> > Alex
>> >
